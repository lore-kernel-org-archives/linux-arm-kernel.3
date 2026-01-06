Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84300CE9D7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u47ezWgdZ/l2XymEjX1GzYxHxCY/fCO5iwgMnLtLa0w=; b=N5gxvD5W3v8Hn1to6AqIikMpRY
	7whCPnthUHofgZxBgE8hMjWZFNeSI182OY3wg0e0KjlTGght56DdswGCtOUqqdXErZf371+DZpmpj
	0AgM25+q1R7LjPGZsnezRUpdBqf5LaJdUIFFHTGR0fC1ZmkkXyqQRxnVbYE6W/4tl66Y5vDqbUyRL
	0l7pYFO0me0p2TSwkS3aR5Nfn9Ukv4eioC211w4OMpChf73uIIMqNNmLrnf3eWAEzW69WFNdp49do
	pKunVrhLThWhB6oKDN9u957UYbSfsawMsvYeLlPW2XyJcnVyMPGDSGfVWm4vPm/1iSikDpJRtR0bK
	ObhL/kdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA7V-0000000DVSr-0Xvq;
	Tue, 06 Jan 2026 16:41:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA7T-0000000DVRW-2TKj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:41:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C76C96014D;
	Tue,  6 Jan 2026 16:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40264C19424;
	Tue,  6 Jan 2026 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767717678;
	bh=ze09838bu4tgioSjBEqALwERPyBGKXw8MzIwdv5zFGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QVXwrdpjRxTlKijpAHvck0fcvXPwrVxZcxwi2UyVL0cQ4ZxkPJ/5QnQMJK+9T0W88
	 p90vDS2NWetnNMSAg/7uOoejUa330IJitHPLPJyfEIULJM2mhae6+i3NRwRMY9PCKi
	 sDb8MhBVb5D/1nPb8Juz2VEvWz3f13GuWqohRWbVfjZmA5WCbI4fRBH3lAuDQOxQpf
	 pQFYXpuJ6XjxCpZVH6iFOIw65f4Sl/HNdgHKNUCZgtv1WLB38yP5vAKxUpIJpzVbG6
	 V1HBo0Wuw1+m8vAzKxswsIlV4x91v6M48Pkiu1IsYNpEINpUW+fTAFTtlNVpHhL75H
	 JhYrrKwPbT3Ig==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 06 Jan 2026 16:35:45 +0000
Subject: [PATCH v4 5/5] KVM: selftests: arm64: Use is_aarch32_id_reg() in
 test_vm_ftr_id_regs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-kvm-arm64-set-id-regs-aarch64-v4-5-c7ef4551afb3@kernel.org>
References: <20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org>
In-Reply-To: <20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ze09838bu4tgioSjBEqALwERPyBGKXw8MzIwdv5zFGY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpXTsdxCQGJi+W81ZooYRjsa6d9nw9aQbV7Isdo
 0qUUg6pwlaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaV07HQAKCRAk1otyXVSH
 0DXLB/0cXvjbU+zB17kgrZhMg1U0LcQUAP3jU78hE6JW/2AxfQk3FGYKuHLAU35CW7RPJAn+UFW
 R/kcXTN0X6QvAQzE28x99PfulzNjaiAzzrE2XAF72ljHq5FLMoiFM8LCytx3z0oz0VBBTaHDBBy
 GjtYk/60l2OFUZ0k0xmBi9R5eO+SLe2J/qEx6YVCO3+4zz4iiWsdZMrZZAfQ/ioG9B/ZaRcmn8d
 MRaKsNEfAUhN6cv3JNHPG9byRn9JSCerGCTJtQPGABp7T6O43CCBRoBrSmz867KaZka4ci1Jdui
 c5eYwZLQ8ajj+3Gzj8Ab77ihqbjYAeU8MO7B0iWk9pQeP4vb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

test_vm_ftr_id_regs() uses a simplified check for 32 bit ID registers since
it knows it will only run on ID registers. For clarity update this to use
the newly added is_aarch32_id_reg(), there should be no functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 908b3c8947d9..f703c6cfe132 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -503,7 +503,7 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
 
 		for (int j = 0;  ftr_bits[j].type != FTR_END; j++) {
 			/* Skip aarch32 reg on aarch64 only system, since they are RAZ/WI. */
-			if (aarch64_only && sys_reg_CRm(reg_id) < 4) {
+			if (aarch64_only && is_aarch32_id_reg(reg_id)) {
 				ksft_print_msg("%s on AARCH64 only system\n",
 					       ftr_bits[j].name);
 				ksft_test_result_skip("%s invalid write rejected\n",

-- 
2.47.3


