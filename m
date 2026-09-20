Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5AAC982EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JBET6H7wwQbzb0yDh6SFrjkVIL9EVbuYOgZkfhLlmM=; b=Ab2xP5qLJtdZy+nUdWvzzHAMeV
	NFBG8cfHVWLY+KtxChWXM4pyTfU5Ly2xWAD5oAEaXGIwnNKJ5Hr42ry5d1Ecj/urWM1Iv2R3GXNU6
	0G6TlBmrkNjAM1kmqEKuWzVOaW7LcVMzBSBB761zDTzt8PCskIBHfq2+ehGGF4CVtM01w0OjUcpkW
	YcEOLR0ZIYCBjKpLJBhGfG0atN+tMIWx+oUjoezVW2TQmf6qt9qRbC69Puuy2G6YpiAYV0wwxYg0y
	PVplQ/yY9gfO6qRifPiBeQbJ997HKknX0mIAavMexumC0rQ/cKqz0le/Ox5qliDlR2jxZEeCZqAXa
	F1Xyca5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P7E-00000000SmK-0ce5;
	Sun, 20 Sep 2026 21:30:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P6o-00000000SQN-3Jqa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 21:30:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A1581596;
	Sun, 20 Sep 2026 14:29:57 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 157723F632;
	Sun, 20 Sep 2026 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789939800; bh=2dgJhNhp7pODA5D9cQ92Hsv7wb629Wj97aqSNHchHR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaiFThnA260h6+IfxTsrJK+/I0GdaF9zJ4ryW5m+1k59eqLeI11Yicqs5hOz3aD4M
	 occxFYw/oLEyAE017XSilDyvIVZLHM7Mc7reQ+6Et21ovi0ItIe4PH8a12FK2eE25B
	 NWm54COVQEL+aZarGL0YOzqdPIMWrWk6fC8xZ3ys=
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
Subject: [PATCH v19 19/20] KVM: arm64: CCA: Expose SVE VL register before VCPU finalization
Date: Sun, 20 Sep 2026 22:28:44 +0100
Message-ID: <20260920212845.707-20-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920212845.707-1-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_143002_945571_2D151BFC 
X-CRM114-Status: GOOD (  17.96  )
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

Userspace must configure the SVE vector length before the Realm is created
(as it is part of the parameter for Realm creation), but the Realm VCPUs
cannot be finalized until after the Realm Descriptor has been created.

KVM_GET_REG_LIST currently rejects the unfinalized VCPUs, which prevents
the userspace from discovering and configuring the VLs for  the Realm.

Allow KVM_GET_REG_LIST for unfinalized RECs and make the SVE register
enumeration handle the unfinalized case explicitly. i.e., only expose
KVM_REG_ARM64_SVE_VLS before SVE is finalized.

One adverse side effect of this change is that a KVM_GET_REG_LIST call that
only probes for the array size will now succeed even if SVE is not
finalized, but that seems harmless since the following KVM_GET_REG_LIST
with the full array will fail.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v17:
 - Rewrite the commit description to clearly describe the purpose
---
 arch/arm64/kvm/arm.c   | 15 ++++++++++++++-
 arch/arm64/kvm/guest.c | 10 +++++-----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index eab8543a4194d..6a52b102d0ce4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1993,6 +1993,19 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	return __kvm_arm_vcpu_set_events(vcpu, events);
 }
 
+/*
+ * Realm VCPUs can be finalized only after the Realm descriptor is created.
+ * But in order to seal the SVE VL, we need to allow the userspace to read/write
+ * to the SVE_VL, before everything is finalized.
+ * Allow the register list for RECs before the VCPUs are finalized.
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
@@ -2048,7 +2061,7 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
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


