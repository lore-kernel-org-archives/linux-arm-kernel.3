Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD440C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaGhe+xd94/mwDCmiiZovvRgP7Mu20k+rn44NKzPAVk=; b=MKgvI2f3KXLV9xmgIOKavySGir
	c67zYOAT0d4Lef/PlXrrNh7M0c0Y8ItTryyBB45fGkq+TY1eheNVjj3v4Fe//qmhFN1W18brQPLbS
	iWuW5XtvcvrZpEdxEAtC/QO+AFRkgJh4Nc1Jez85pNrIVpT5e0fGRPu1OY70vfdSVn2hd+E1vwoij
	pGkF+3fAaEyrQ0W8rna3OTQzZeYzdDWxOZNRAxKscI9fZPRfPNLGj+Bth0DEkKKYbOiqE90seVJ5x
	GJeQ8zXwynvgtlnA8Nmciz0Nw+8jucGhZZ2+XEduKhi8hCTyH5sxDDCaAxbkesVqjvhwjLuYscTSS
	9aqsO6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilJ6-0000000DKSW-0x1l;
	Fri, 14 Feb 2025 02:19:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til1W-0000000DFNv-2NPb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8BB00A42AB1;
	Fri, 14 Feb 2025 02:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8B2C4CED1;
	Fri, 14 Feb 2025 02:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498505;
	bh=7oEn9JxWKjIxLobpHaNyNb12TZw6+6uiwp1XA6eEegM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p+F4oTkpozV7snpFt3fdCgJVq6nKLyg+8JltSzmOX0er8Pnhusvsvnt2Ow0F1/38D
	 CsNUDXU+zlkiX7W9PJutlWUeM6gVTR5UhMwtnz/zhBW5NEamT1NdIE28m7VZ6Nq+jl
	 jUDppL4qH/OkikFuN5Ss3C5P4TfTuPZo5/cfvTT/kxQkNTovI+MDjJA0BdQVIRgyZW
	 T4rItVd5tOdlW7IiITsS8JlTiMyDDq0g7W2mfNTV140LGv1Pwh+xHO56tUvVschtDv
	 cAEteINxVg8RnZ78/1p7KoWv1mI/SzYskTdfa4Pz1P8FY9zRSNTToo30EmLi1I+ZLY
	 RpAMhMt+x3J+w==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:55 +0000
Subject: [PATCH v4 12/27] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-12-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7oEn9JxWKjIxLobpHaNyNb12TZw6+6uiwp1XA6eEegM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPJB9CR2UPbX0fWpOibgiY5nxylbHYm5jWAgsCo
 Jsy7w6iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jyQAKCRAk1otyXVSH0EfWCA
 CEkw7voavvsVuT5pnWuMXdHPi0zjHWDseDCrnmxlGUHHB9AYDra2ISrlAWxVf5nw5nV0QQ3BSZJhh5
 bow6ezrC/HZJJBr6rTKKfbS1mMBNSqH8SjY2ilujeh/JYS1V3ZW9P6qumTwadR81zhb/fFrxwtH0w2
 QFynp5VAST+RMHDUPTgiOJBMHURjQ3wAWVqXLfVq2Y+S2RlYBWX14aQ3n8b6aEk09GI/lpoT5cVK5S
 xOHqIkKXOZS9bgxxDCtV8ap4fho4yX3DQN5nkgw+K/YYapMwFvzYskdMIoxM++2lhbvJbGYLRwfd+X
 8t/IBJmcgFcCk4aGTOQEO+nmmJp/sh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180146_762570_4CC206AB 
X-CRM114-Status: GOOD (  14.22  )
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

As for SVE we will need to pull parts of dynamically sized registers out of
a block of memory for SME so we will use a similar code pattern for this.
Rename the current struct sve_state_reg_region in preparation for this.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/guest.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 73e714133bb647c1d50fc67d5c8bf0569520a537..bb4b91e4392359026a4115468138f16f48a5b850 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -404,9 +404,9 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
  */
 #define vcpu_sve_slices(vcpu) 1
 
-/* Bounds of a single SVE register slice within vcpu->arch.sve_state */
-struct sve_state_reg_region {
-	unsigned int koffset;	/* offset into sve_state in kernel memory */
+/* Bounds of a single register slice within vcpu->arch.s[mv]e_state */
+struct vec_state_reg_region {
+	unsigned int koffset;	/* offset into s[mv]e_state in kernel memory */
 	unsigned int klen;	/* length in kernel memory */
 	unsigned int upad;	/* extra trailing padding in user memory */
 };
@@ -415,7 +415,7 @@ struct sve_state_reg_region {
  * Validate SVE register ID and get sanitised bounds for user/kernel SVE
  * register copy
  */
-static int sve_reg_to_region(struct sve_state_reg_region *region,
+static int sve_reg_to_region(struct vec_state_reg_region *region,
 			     struct kvm_vcpu *vcpu,
 			     const struct kvm_one_reg *reg)
 {
@@ -485,7 +485,7 @@ static int sve_reg_to_region(struct sve_state_reg_region *region,
 static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	int ret;
-	struct sve_state_reg_region region;
+	struct vec_state_reg_region region;
 	char __user *uptr = (char __user *)reg->addr;
 
 	/* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
@@ -511,7 +511,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	int ret;
-	struct sve_state_reg_region region;
+	struct vec_state_reg_region region;
 	const char __user *uptr = (const char __user *)reg->addr;
 
 	/* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */

-- 
2.39.5


