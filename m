Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27392E6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMpedUeQjU+6HtPqeE9tE6wgZN3ELhkWDmgo0ac2K7c=; b=loole6vBcx89SyJFXPQUlMwgae
	JA2WktY7vcKM/JbZDFwzDKK/rsR7GAQrQxcAVSr7OqQ8K0/zxaJbdM9nT1DT28bReDMHgz68WbLjD
	MbgSbnyeUrSemyY06RYx8OhHS+cFuO/g4B1l6gua1aF0WqFXt2jJkBNwaLHiP0HRsqDlIHzwOVYhX
	DpASrVapgYnKbfd0pmIoLP3t1NRVuK0YMxEOT7V2HF5RmXFqbsO9PXRnTJzln0QNXJTW7NOnghtLm
	xlouWp0bV3iY7eO0k6khLonW6CeOriTiM1EX1F2RuvhdBiTDrLnh0+V9uOzMPMM51GxYftn2nqBLc
	Q5bG+9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr6j-0000000ELwL-233R;
	Tue, 23 Dec 2025 01:22:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr6a-0000000ELns-0Epf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3073444D2;
	Tue, 23 Dec 2025 01:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7D9C116C6;
	Tue, 23 Dec 2025 01:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452947;
	bh=gfp0s8vq4GgXX2OhDBoI78/711AOqvXjX/EjV4hM7Ew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O16FGqKTNdczc4/lSuwlD8138gQJMp4jx7y/Ez2gACQQQQOeVbrimke1N8wcOMoWW
	 HJa+cUenUXOtb977SVm42D9WFm96+Sc0R334clTxAw/YhFxqtOaRJ3S8Z8kNKYCi8W
	 OmqdKB56h413grtXnz5KyTp3nwAhp1i5J/DYilqmE+LfPjR/VhQsnOp6rFO7R2Jbxp
	 e4CEOaiE0NIR05xpxYTSFn1euO6OCZl2p99U8vTpA5+59WKBpXlieg+c6p7czbqaSL
	 UYOF6Oetl4xHRptAo1TRRwilN6T5dgCMcCynUTzohRWk0E9OHzfSNtKIqPKbybMjmN
	 /29wPbOYOaVlQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:06 +0000
Subject: [PATCH v9 12/30] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-12-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
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
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gfp0s8vq4GgXX2OhDBoI78/711AOqvXjX/EjV4hM7Ew=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6LyU2hP4tGR98SafeORWHn3VqVtWLVYEDpd
 9CqFj8boKKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnuiwAKCRAk1otyXVSH
 0NW2CACHCG80SVmspz99x7BNFLI22yJy0+S+koe679BIRDvbUunQDWWrfFfutWGJd1iIEAvK3lz
 1/JEhESq4l3slRuO6tHz7i6C+wTnYkKCKwZhkqAD9Nc8KvxlT+cAp6VjMNREnKwIdDel2kGMJRb
 Bs59xm00prmh90JqAMmJiVM0+fcJrZLjkLgqhgUaAY68qq/8OkCTTBRk8lztbdxCa5tzsR/7nfE
 2j6l3m3lLniNnkryNJ3tkDJpxhNmvuY3aL29KG4pGElJZ+Qo7dV6o2Gt3vkukCSzLR9wNrDBZ8s
 ff2/OUBH70tHxthXBek5qXQtyI4+QLubkHoYa19SIqi8gyuw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_172228_190958_692B0CCC 
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


