Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E560CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XKWKc0cqWwEX+WCi/oqxcE0aFsmDT6ywSAwRmgfNpA=; b=HOPg/kwZprbfw8xwNRzCYyb/OQ
	UI2zMH4YU8ntZOmtovuzFH0vleuCkbba0QHi7ENSJMhqdDiZRwkcGWDWghTyBTlxI61rGlODYipWs
	k/CsJP/52gePsrRbCq/xRjT8PelXXS0gJkdzi4feOq/X7Jo6Yujvy7cItH5mRWsdAcp2ifosgf5Di
	NgGYhRm8rzwlP+FTdodx2Ku7eTES+uORF+SrsO/3Qh5WeR2XTm+mW3G0KmdbLRoN9H4j4eZ+JltNQ
	vSIVb1b3Gr08LCO9XYse0Q8ZcsICQyf+yIcCvpHO69hUSiTfCWK2Flf1jgQ6x+Ne00Y3eCGNQ9J7u
	bYWKI1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLi6-00000001kza-0I7v;
	Fri, 22 Aug 2025 06:57:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGzs-00000001BdZ-38O5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7506143FC8;
	Fri, 22 Aug 2025 01:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C949C4CEED;
	Fri, 22 Aug 2025 01:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827716;
	bh=JcuB5ad9okGlXfOvq/M2PLI+WEiTQG4p3nyWXh3yr4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TxJBRy4BElKmGssn/oPyIydK7siRMUN67lZC2fbwAQAUHx3OXdkSY/SRCeLVVGYZ/
	 1G//mwpqC3mDnyp/T0PogWKZQHRm32/6WBh/vATFEP+a6sEH6jJXHBA/iw9rDslucI
	 R/HYclgTmiY4lA0hs9O0/sW6drG4DHWSr4GIRHRDlsvRPFDaHULQORSJIsZcyA2f8v
	 B+wMt95zPHMio3fH1ZNj/FysRHJJl/nPk23h8sxeHVr9V3CWSYzTQE+AJFi3jGpcHA
	 qlGiCAWvWDjtXCUO9rDmuxMMoChpiiixb+9iVa5ERhDI6LZWrXFzz4NTqFlFAtsVfu
	 ci5+zfkagLJHQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:42 +0100
Subject: [PATCH v7 13/29] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-13-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
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
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JcuB5ad9okGlXfOvq/M2PLI+WEiTQG4p3nyWXh3yr4c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop83C32/fF+7vJ0QyOE9+3q+NxhA/xjngeyDc0
 QcIxgvldM2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNwgAKCRAk1otyXVSH
 0P4rB/4vaaQhmA5bOgn6t6N+tIcos+QUPnK4+NAYZT7YjYjib34p6kw1JAcMmYbNJLzM7SBki6D
 pixEtkvuxIRciZcrQgb9XkMMielc1vXkq9ETfDrYcKuagLtrXZES0Llz162JyrYm1r6RNUPJXCc
 QXUJhmeIvnnV8xLR4BVjYUgYXsot9eFxPQ5QO85rFnB5mLJqbPq8ohNmPZE9HtLxf3UrfA8cGJM
 jO6XPLJrQtc1aTWlJo5l0a2yVhIKLkIaawX+mdU8G3BwQ/fbm92A8bS9Ugcs+lEZ6oNdbvGQKqn
 TIEUPQX5TEMVtuk1iM/6SnqFUHZdONrkDjMJ5w3v6uwueMvq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185516_832217_395A188A 
X-CRM114-Status: GOOD (  14.82  )
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


