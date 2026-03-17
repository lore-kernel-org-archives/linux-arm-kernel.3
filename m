Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C942FFD708D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ex97P/1TdbPqRXyy54hg63/qafZM0zPw0RMUSTFriB4=; b=kHHarWct9M8sqDl72cVdV2dkec
	Q2AOg+A5qjAmAIRnEf1rHDcwW/F8RdmXaztQfeQgcstiI9joyZbdyXp+WVhB+Iheg0o5p3iD7T3F7
	1GWJ+Cxo8dtp9KGBYpj3mFrDV2OJfHxhlJELF5WEWsBKMBLj0V+wd3oyDwZuSEz5zZDSjVbc0zk1t
	lMyY+S9KIM0j8VsKeQVNKvYe1cLEk2mfLG6CXL5e5wvqX8gC5JXbEd2+9p5Rej+HqjrhR6yKlcG+/
	K+0KR1gpdEUp6IDew59OnE3XAiyu09lHxaYhnxaz60tUhSzWIzdz4/5hx+GNPobnjlgj02Qbnbk9W
	nQnqvRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2akv-00000007AeT-2fO7;
	Tue, 17 Mar 2026 20:11:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ako-00000007Abg-36Gu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 20:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 106854034C;
	Tue, 17 Mar 2026 20:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABEDC2BCB1;
	Tue, 17 Mar 2026 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773778261;
	bh=fAVZD87pbrERscO5EBbL4UXt/gj+nHPQY7XsvwsyJC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tlJk2j2MzYJvID+dpbCh1navkrRurTQmiczQjaillDfWg6ARn3tyVFuZE0uCDs7Nr
	 1Og1m41DWMpp7Ob8Mf+wC2A4HwTnFY+tHBbiM++QXHSrTQsZpOsxmQtzPWA06mcUFy
	 9gaaQBNQa17NHxSRA7V4coDfIPaFD91Jg1Dfnw8sVEBXWdpM+vFGNKI00WSF9bbk/c
	 hcpzZIZOzR4bdeKnB41pK//HsMwBvLU1xII/Mo2pkGFE+eFjd7VdWIsadC3TxiUi92
	 VrL56TROCKFlbC3kjADqiRifxwt5WSmLcbL3p42VcCyzKsK6CqpAbn8bo5F6m5P0WB
	 bu8Q7RBAjyFVw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Mar 2026 20:10:38 +0000
Subject: [PATCH v5 5/5] KVM: selftests: arm64: Use is_aarch32_id_reg() in
 test_vm_ftr_id_regs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-kvm-arm64-set-id-regs-aarch64-v5-5-a60f2b956e22@kernel.org>
References: <20260317-kvm-arm64-set-id-regs-aarch64-v5-0-a60f2b956e22@kernel.org>
In-Reply-To: <20260317-kvm-arm64-set-id-regs-aarch64-v5-0-a60f2b956e22@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fAVZD87pbrERscO5EBbL4UXt/gj+nHPQY7XsvwsyJC0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpubVEYd+aI9Wa+jg3Mcnf1FBheli96NlRfce8t
 XvXHerjELyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabm1RAAKCRAk1otyXVSH
 0EhzB/9K4jNR0iqFUOb78qCy2x/wNhKRW0krzdRLgpZt5kJiumqyovOYWOyNkcw5uTqDRZkasqj
 Flags4TK84CeWQ9JlTbSFDbBS9nDJ7pG8RnBlkjHfisWibJKEfa2g593d1DJpO/VHnXbm3sB+u5
 YKMfcYlFZjUi4TSOGNgbFsEWTMW+oSvqStZIjubMQjCSRQBcbUDE+RQkm7v7RwcIm/SFcfCFamz
 c+a8axfpP9fCLJC+y8sDmUOTj8935NnNo7+1y+SYja73ZnJQeITdXdu4CMe0aj9/RS29x5MRqQ3
 2b4FsxaEDnbfd6tHnjbGV0sSZ2JugFleYWSukuogEMO02HpS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_131103_945412_57F127FB 
X-CRM114-Status: GOOD (  11.55  )
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
index 127defebb35a..50e9e9b6a365 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -502,7 +502,7 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
 
 		for (int j = 0;  ftr_bits[j].type != FTR_END; j++) {
 			/* Skip aarch32 reg on aarch64 only system, since they are RAZ/WI. */
-			if (aarch64_only && sys_reg_CRm(reg_id) < 4) {
+			if (aarch64_only && is_aarch32_id_reg(reg_id)) {
 				ksft_print_msg("%s on AARCH64 only system\n",
 					       ftr_bits[j].name);
 				ksft_test_result_skip("%s invalid write rejected\n",

-- 
2.47.3


