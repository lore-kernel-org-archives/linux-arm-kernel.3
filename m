Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEC5C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9/QBsgUl+YAHSU3KRVgzfp7o3z60FnCLy+stiPlLsM=; b=oJsBl8fBtJbPJJQO5GPBC0FAYF
	4PXECpxsyEi2uZCdngMR2Z96SeZK403wQqltOObqPmtX/NGJwjVIOFRrd4WI8qHVq26CU7k7jXeIn
	im4ZD8cpDl8OP1WXf18Kx+11W3n1j633/HdprzaWMLjsVm5/Y8EnHK04mN8sfdZ6rzBJAQx0RIxic
	td2ZtUqm46Z/DlgaOFtFc4rvBHv4SbIqkjEqciDlH+2l+yEU1+IWr4/ZCwVlFjwiPEdKdXMR0+G8Z
	EQBkNAuU0VEOlvsyxz21ZHPKj2+88Jd3caUzraxZSoKEyAaWQ2hGme6oeoNmv/WwA2hEpy+noeta5
	g/yUmPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlag3-00000005Tuc-1wcN;
	Sun, 19 Jul 2026 23:12:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlag0-00000005Tq6-0Ew1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:12:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C5CB60A85;
	Sun, 19 Jul 2026 23:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3DC1F00A3A;
	Sun, 19 Jul 2026 23:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502723;
	bh=V9/QBsgUl+YAHSU3KRVgzfp7o3z60FnCLy+stiPlLsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WdEWLgimdUnWOOMh7FlriNY5lB2TMDa7fzH5p8GdEXBClHyHlkgeLOYDw8BDUkGGP
	 Yuj416Tx9I3dwbAJa1JeMc5LYada72J7fxsTKb8CPnFHL9vJYEpbqxsCQOg7aMG1hi
	 hyoTxbfjfpk26uDaubCPqQ/oRXoFFnHLbfmQ+UTP+r7GFW5L+jI62yPOQxW3ckXyss
	 Z5+iUf0aip6JDmGutBekHnVQPdvnqX9Yk692nG0AWDM7JAzEtqQ06CBI0QtT0QpwLg
	 H2F0KMN4ov7a1Nakx0FGTwo42gla5yYn3gPObx/ZnNM6XhmdVHU5HEy8aLny8x9paC
	 bgzIp18v0KqVA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:56 +0100
Subject: [PATCH v13 29/32] KVM: arm64: selftests: Remove spurious check for
 single bit safe values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-29-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3zzAFIxW4QntGIfc+v0S58ciMfKRPipxII9rhMorBnU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVk+i+hoFBVdo38ozyAZpmD7uyLRsmokr6on0
 fvkE/s4sISJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZPgAKCRAk1otyXVSH
 0OZAB/4+liUc/7Segb5Y98e5swH5Q6abXU8BYD9Up2joacK6G3YdivbA7aQZrxhqP3HgvrAHH2S
 YTOoePIimv09sem9sOv23eUrx6fk8bEqNogZya4N4P/ate5M9m5kZ3kP9BjhaXgVtwj994o0h9g
 2I/zqxMSggIJCnKsU+husmvow72vRFhpCkHOdxVgVM4CdJHow8i9uR1mbLsdAISjd4go0oeu7Vc
 WVpqqHZm+B9cntnQBFpYdrgRKyXGP3YKPYYX92P4CXjgU654VHF/D8oD3XTGP3xXEMfv+PF8pyw
 ZivDGw/E+XryeI+5WhQ5Rbev+pALkxLlbNPNyXN5krbnr+Na
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

get_safe_value() currently asserts that bitfields it is generating a safe
value for must be more than one bit wide but in actual fact it should
always be possible to generate a safe value to write to a bitfield even if
it is just the current value and the function correctly handles that.
Remove the assert.

Fixes: bf09ee918053e ("KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user")
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df5..9eceac84e297 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -279,8 +279,6 @@ u64 get_safe_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
 {
 	u64 ftr_max = ftr_bits->mask >> ftr_bits->shift;
 
-	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
-
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:

-- 
2.47.3


