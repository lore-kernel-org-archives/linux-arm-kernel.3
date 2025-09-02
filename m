Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E1CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XKWKc0cqWwEX+WCi/oqxcE0aFsmDT6ywSAwRmgfNpA=; b=O3oS7QK7l9MqqU8NLoWynhY/C9
	CiIlUj/AKSbWFcFRF7ISHFvACp4y34ircCRev9K6k0oPyztXbFRUMnR3Wbp9zGHlY1ezIKi0GDqCb
	kgSGeUBhRsudMtzKL1UXowdv5KPWIdMW7Iy3GhNjHqlaFtVeqtnz9Jl9XXTF1c+lxozxWl2+MCEEz
	JlIOcqIkWPzl5LDD8FeThhTggcsEBFMVZtZWVs6w4UNKsRQ/MwmRRW7Ki79lbVO/vaGEI1hI76DmM
	H6rsCsyYX9gh7hxruF9Mme3n2/M2+nGM7jvdLm6r8iJZ3aSdmQhiTZuDIvR2EyytwxMewg+yIOx7P
	eTGqDfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRM8-000000009Bf-2xsV;
	Tue, 02 Sep 2025 13:47:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPRv-0000000Gyw4-1i3U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F82A43AD0;
	Tue,  2 Sep 2025 11:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC115C4CEED;
	Tue,  2 Sep 2025 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813519;
	bh=JcuB5ad9okGlXfOvq/M2PLI+WEiTQG4p3nyWXh3yr4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HeapaFPsOuaJuO8zENcjOE77JPfBIwTOCMRrOra9z3WeFMngcAPJKqaFJY/e/yfYM
	 mNt/A7C0RKNhGCBWgCtniznsK6akAv2OIxdm2b6h4KnFVklRih0/y7S6NBs0vv452k
	 a7HG+FK3Xbf4M7DORn781fDwLR0AdilYZVtS4BfK2WqNEdTYWspQ6pFPCJ8gTaaeZp
	 4OWMDXRpeRgbLUvCYbFutsjDwnbgmgxfGYc9XXde3+C1UjylpQbjDj+EZJ0wW2bKS0
	 xGkcV7p2F4TwnCwl8yjV/MkAMnEQTpNGW0K1P2eogzF9JCtWisQ205ueDpmsyOJiP0
	 62RyA2f5gIxiQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:16 +0100
Subject: [PATCH v8 13/29] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-13-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JcuB5ad9okGlXfOvq/M2PLI+WEiTQG4p3nyWXh3yr4c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiEVhFwdz/qXdy0wHnP9UFZExCHy+Qz/8oSH
 DRaKuGMIy+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYhAAKCRAk1otyXVSH
 0AQ1B/9U8a+0/H9lS9eFV2eD1eghMokg0qYk+XDngVDPJbeIAVtzGUxmw0PRQ3a7Fi3IUQnkEiB
 sHmCZGWKhUu9sYMMPQUir4KMBl0OdEHARSv5E964K8JjF1alpWxdweqJWWb8zQ23LjmfDbvbXCY
 UsEFyjrr8Pa4HAjIfxApuT9a9b7sdO9AWAqsDWYxmNdMF7dbcPBCDu34S2DrSLW/iJUuY7o+e3W
 METIAtW0nlQoSZxWPhcPaamINw0qKMm7nWlp7T12Km2L3KYPCQaKpJNUE7LIV5E2GKOrBuYaXk9
 QYhxDMus1mGYBXj7BagdJR6gkrTyIlD+Ao9GwXMF+g8KXXBh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044519_493377_D0D64FB2 
X-CRM114-Status: GOOD (  15.12  )
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
index f38b95a73169..6eb273b525d5 100644
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


