Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64994FCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdvxMf9RmhaxBPBgG9so73X6Go/HWtLY4eEfNMwccyE=; b=O4YvuAe3fvZyvj+24sZjkrwxce
	7LyegtSL3x3yMajyk+lTUKM2yioFZ9pYBkjny6AX2nvthIfeP3Daloj+uUeX04u3MyHMctIX/ItHH
	JKdMIYKqpJY42RoAROb0/BzZ5HgyVtgHhedipAODmhiYUeRFE2IjEe6uxTNj1kWUBe08Wh736+jsT
	qOhh3hX9ygWCWMh4PZvF2fxJdJM73V2WjO3NMdIFU+J6eKq75nfqV5F1SBkLWpecT+HsTBSrJHwYt
	ELXG1zZVcin5V600Z4/sxT81mUtn46lq1HuuvwszCDR2hoUFGyc5JsVnmhtVOJURk5jTWRxmdH7/s
	92ehMTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgn-00000004D7Z-12X7;
	Fri, 06 Mar 2026 17:10:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgj-00000004D3T-3ltJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BBB540E0D;
	Fri,  6 Mar 2026 17:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEE9C19425;
	Fri,  6 Mar 2026 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817009;
	bh=AeF1hwoxwxrE+FMHOeHAJ/eu1PU3teMN7UxNIXZFRu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r75vkUAu/Ivoim+qAOgFwBMiq6Degl3W4n8qhfLU1kdj4bUTnAO8wGqGwdYmIA1QI
	 eTAB3nQ7tg8d34Z6XrC4Vox4AfPxC4zhYXFKXbY8Kg/AY0GGn/nVr53+EULqcHxC18
	 X8excN0n0yJTo8FXbnl8z0et54+0vX+A3SBWbzDkuc0CqFMkDdm+zuZNisTosFq5sI
	 sQaoSsrtOmZ/poOHXoyVx2tIF62gIDwm+D4Uf3pauXkKhHQZeSv9V1nC21v9YW3HIl
	 0XmcnK46NoyyODn1+jGxr8q036LCzVg9kwc7rYv2nJ1i/LwHlupPAa2c438mym/GYj
	 zemUZETwL8/rQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:02 +0000
Subject: [PATCH v10 10/30] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-10-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=2396; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AeF1hwoxwxrE+FMHOeHAJ/eu1PU3teMN7UxNIXZFRu0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwowm0AizuLxb3k3mbTwFO0Nw0hKiV2IvV+IQ
 ZGhfsw3qniJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKMAAKCRAk1otyXVSH
 0NRjB/9CvSUYqf+SB8M1EfZF9tK8iXowB2O5hAp5YQBqreL7Xpw4K+/+OuvVB8C24881Dy+mtlV
 secGqXbax1KsnZuQl/itCOrZdaaxp0n6ONiBptopP6OnpixecCDv3DEY2xtLZRj058MPZF5HUIS
 bMtIrerT/FkHNDM8oKgNxHufFUwhm4o9xWCyhTNX8cCs59HWUcUh/Exx0SxkljV3WOa795FZUGc
 MPThGNES8vTi0zf4cHfhVCs3tQ6H2cCPAhoUxDflvaLzph8WT9hKOXIiIWxnvf0wcdoZPt8p63i
 QCVKTkEBfc77YrmfIUp0Z+XbFH86IkuKKu19Yc+XLkXfgaaf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_091010_009652_8CF89B8B 
X-CRM114-Status: GOOD (  13.81  )
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
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/guest.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index d15aa2da1891..8c3405b5d7b1 100644
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


