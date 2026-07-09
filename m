Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B98C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8WckkdslO+jqzhb243ic0W1zpfpgFKz9U8uw4dwQBU=; b=yzTmEBNKH5H/SwLBixoEHd2JSl
	Zpk3hO3bL29iutQQ2CX6od7bMtyAmIZfpoRFCNqzbWnrfWm1hwTkl2d3BFjiMiv6A1N5NWvDBp4fI
	F3oGf/6Q5K/616/rNFSheA2lJ73eM+YZNPw5HrMUdbUXg0rd0kCOu6O+e0uy53RXp29Qvj7BHaZKO
	5ydt6y2/XWNZPkxIP6SaMkJpmEHmIkLUjDru2Os/p+JG+dph2WT4hVe8CNB+FNP9P72e7BES6VsU/
	ueesBST72ck4iCsguo2RHjaCe6WjMPejLTKbhP1SH1KRA24UtLmEvfb4L+G1Y3rNYh1WW8L+ZbadG
	/PRUBZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd11-00000000goC-3Udp;
	Thu, 09 Jul 2026 00:53:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0z-00000000gjU-2xMd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:53:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6241E40E15;
	Thu,  9 Jul 2026 00:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5912A1F000E9;
	Thu,  9 Jul 2026 00:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558401;
	bh=H8WckkdslO+jqzhb243ic0W1zpfpgFKz9U8uw4dwQBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VEbIvYVUmBSP2YH2SvfoWe4QvzEUo2Wm72B/7LzNLqDWbz1zYnv98vsX9C2UeVPfc
	 +YRBrC9XdOSlRrc2rZHUmIhfq+KKSc9hi2FFKJhH1d85w4B2rI+Hl41C/Z40AVJ5js
	 lw/JeVDJfUw1rPJvm1JQgQTt3SkBlyNkogrOH4/yDSD599AVox6RKu6a8Mxr9bgaFA
	 RoxN0EWngdgB+pxqCadUX28NUGuUG9eToNumUhYrW82YlM5+7MmqF2w0eccP8/LMeH
	 ougroLephZiEnV8IzDDe2OAuaNCGhTJ3mX/iwlYm0r1Hfc4a6lewn/2vkidF6WWyGQ
	 ymmDPxLhM/LKw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:47 +0100
Subject: [PATCH v11 10/29] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-10-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LymwA3DqasGC4ZFs4/KMSvspNgOVO26BbyCDy7Uzk5Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvDBbc3eIaO4qCJRHHzmA/HIrsN32uVBkBpLy
 8+k8L83TtGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wwQAKCRAk1otyXVSH
 0BCFB/9ZbSYLT235uqPFdXnZ5Pso8fs/HwaciS2mcZS1J70uCVHJq7dUqwK63s+0U5Lvt1TMtmE
 BMyr9jg2We1L+/i5OVepzt3dbrzXzM27EEtm742LIjVsPXiiPMGnzBG7nmzB/u56/uiR5OjZHHA
 LIbHsuubJB9op69NyQDpwD8nJet+kuhVavO65tQp74tdCB3RPmzx/fWHAx8j3Zg3gpYoGuuUSCm
 O7iy2+PxwhjGTdB/xEGkBLl9MmlSfOI634CZjCJawzKOfez5SyXAYmGkC0zYUOtul4eOsUtUZsq
 eyZnKjCX7+XnI1J0OG9v5kX1W+7osNrxDw3VlycV3eWW6xXs
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

As for SVE we will need to pull parts of dynamically sized registers out of
a block of memory for SME so we will use a similar code pattern for this.
Rename the current struct sve_state_reg_region in preparation for this.

No functional change.

Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/guest.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 0b789f73bf7c..3ae751e72c95 100644
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
2.47.3


