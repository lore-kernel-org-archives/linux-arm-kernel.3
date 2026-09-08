Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153CCC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYQZM72P8zITh7vsA1gxA6a2VjUxEAhoeYRRUWWZsHw=; b=JNetux+Mr8MkMoq5lsXZW5yUHy
	WonfkDVyOsuKNYDIimmmNscZ9tBNmNfT1k0J1al4AhgKSsmqnIV/lixtXd10EU4bTpDPoyrjm7cUD
	hkylGMsFjRW+yZjiXtXsdrhqBjXmki0oOOZeLPPdWOcKst5k5J95B90MeH4U45Npx420LA4JCZ+6c
	eUE4xTJExIFF6Nm8paLs/VBNU8oX1tmFhUYS5wBoGcxGOlUxY+PYv4iMvr/mZ6FdQFLuoZt2lfmYw
	Sz/ACje2LXaTwNFh7Llt73nhLqhgmgOBX1FHnPZ7kG0eRoV0eDqm1kA6oU3uQ8WiaN53iU8yj97Xu
	MbueUnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yc3-00000009e2j-3lBY;
	Tue, 08 Sep 2026 16:24:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybr-00000009dlr-1obM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:23:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0828E1C01;
	Tue,  8 Sep 2026 09:23:43 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 491C43F7B4;
	Tue,  8 Sep 2026 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884626; bh=S77v1BDbvfQaK2gnhv9ZUvhfNvS6strceig1vPocSBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZrgX2Fl8MhqU/CcGK6RgBT06B4x2UojJLSg1+Vkgu/tAthB79yuNwIXm1/DqfWxH5
	 fhKk9UEMmYwCf567408u6vmM4aLe2J/mJudjrcgCqqcvPRVnf4CWLNOP4PyTZV6Gyb
	 1hw/OQ9/PF09AoSuwAK8nzqxCa1lG7Dij9B6I+UA=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 16/20] KVM: arm64: CCA: Provide register list for unfinalized RECs
Date: Tue,  8 Sep 2026 17:22:19 +0100
Message-ID: <20260908162223.1683432-17-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092347_555867_5D0B7029 
X-CRM114-Status: GOOD (  18.27  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

KVM_GET_REG_LIST should not be called before SVE is finalized. The ioctl
handler currently returns -EPERM in this case. But because it uses
kvm_arm_vcpu_is_finalized(), it now also rejects the call for
unfinalized REC even though finalizing the REC can only be done late,
after Realm descriptor creation.

Move the check to copy_sve_reg_indices(). One adverse side effect of
this change is that a KVM_GET_REG_LIST call that only probes for the
array size will now succeed even if SVE is not finalized, but that seems
harmless since the following KVM_GET_REG_LIST with the full array will
fail.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arm.c   | 14 +++++++++++++-
 arch/arm64/kvm/guest.c | 10 +++++-----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index fbb4d6651ab51..3fe5a4f77738e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1980,6 +1980,18 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	return __kvm_arm_vcpu_set_events(vcpu, events);
 }
 
+/*
+ * Realm VCPUs can be finalized after the Realm descriptor is created.
+ * Allow the register list for RECs before the VCPUs are finalized, but
+ * after the SVE is finalized.
+ */
+static bool kvm_arm_vcpu_reg_list_allowed(struct kvm_vcpu *vcpu)
+{
+	if (kvm_arm_vcpu_is_finalized(vcpu))
+		return true;
+	return vcpu_is_rec(vcpu);
+}
+
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
@@ -2035,7 +2047,7 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 			break;
 
 		r = -EPERM;
-		if (!kvm_arm_vcpu_is_finalized(vcpu))
+		if (!kvm_arm_vcpu_reg_list_allowed(vcpu))
 			break;
 
 		r = -EFAULT;
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index b01d6622b8720..c3ca369882273 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -598,8 +598,8 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
 	if (!vcpu_has_sve(vcpu))
 		return 0;
 
-	/* Policed by KVM_GET_REG_LIST: */
-	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
+	if (!kvm_arm_vcpu_sve_finalized(vcpu))
+		return 1; /* KVM_REG_ARM64_SVE_VLS */
 
 	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
 		+ 1; /* KVM_REG_ARM64_SVE_VLS */
@@ -616,9 +616,6 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
 	if (!vcpu_has_sve(vcpu))
 		return 0;
 
-	/* Policed by KVM_GET_REG_LIST: */
-	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
-
 	/*
 	 * Enumerate this first, so that userspace can save/restore in
 	 * the order reported by KVM_GET_REG_LIST:
@@ -628,6 +625,9 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	++num_regs;
 
+	if (!kvm_arm_vcpu_sve_finalized(vcpu))
+		return num_regs;
+
 	for (i = 0; i < slices; i++) {
 		for (n = 0; n < SVE_NUM_ZREGS; n++) {
 			reg = KVM_REG_ARM64_SVE_ZREG(n, i);
-- 
2.43.0


