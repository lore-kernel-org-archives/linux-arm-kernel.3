Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C29CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bAVQ7xzTmIVtjM3UYB4HE6Zzx4t7mj/lid4gyv+JD0=; b=aYDGp4znahR+4MHUSxRtcj1ofL
	ydmamoVJOavPnrxCzwxQfj1hhVuMt41abuakzSlClSEi1wus7V6p6tnnYP0nSo5FlI8AMQDWBNB5D
	Igobt3opU3hN/zVts+pYayoDu+Ora0x5txwJ7cRoqX8ZFl4Nh0YujvHE2gU+6dlRd5DjJETZdQwvU
	5cf1SejPpewCEYjY6vIKoH9aS7IFnYZWXFPw0YYEqqu1TkSTHTL4ERh4Tmq6oRaPZsJZ7dotaMpuA
	0+yVTwFWb0DXVYsLuVv4U6f5laK+35IFXwcH5KTv6CKgXGmnPzDigbeIvzaZtlkFJn5kiKwhoalHC
	2OQHXGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzaX-0000000ErTJ-1KSM;
	Wed, 17 Sep 2025 21:21:17 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzaQ-0000000ErNM-3meK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:21:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758144068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4bAVQ7xzTmIVtjM3UYB4HE6Zzx4t7mj/lid4gyv+JD0=;
	b=QfGI0FR0Cl7Pke36kXSYjJP4XZb3avjny91cjvn+WPnNX2Bo0R/2fCpmtMYNI/P3MJPA+q
	0jTqJHsUTTGeDq69IqN+TFu8VBGKLJZwDwZOBmhHuSj4sfLZsITnI/ObEdNIo1U72xGupa
	hdY8rgwTG2NEZ8v/JIJ8CsDeFDJB1qs=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 04/13] KVM: arm64: selftests: Add unsanitised helpers for VGICv3 creation
Date: Wed, 17 Sep 2025 14:20:34 -0700
Message-ID: <20250917212044.294760-5-oliver.upton@linux.dev>
In-Reply-To: <20250917212044.294760-1-oliver.upton@linux.dev>
References: <20250917212044.294760-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_142111_099755_2EF93D75 
X-CRM114-Status: GOOD (  15.10  )
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

vgic_v3_setup() has a good bit of sanity checking internally to ensure
that vCPUs have actually been created and match the dimensioning of the
vgic itself. Spin off an unsanitised setup and initialization helper so
vgic initialization can be wired in around a 'default' VM's vCPU
creation.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 .../selftests/kvm/include/arm64/vgic.h        |  2 +
 tools/testing/selftests/kvm/lib/arm64/vgic.c  | 50 ++++++++++++-------
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/arm64/vgic.h b/tools/testing/selftests/kvm/include/arm64/vgic.h
index b858fa8195b4..688beccc9436 100644
--- a/tools/testing/selftests/kvm/include/arm64/vgic.h
+++ b/tools/testing/selftests/kvm/include/arm64/vgic.h
@@ -17,6 +17,8 @@
 	index)
 
 bool kvm_supports_vgic_v3(void);
+int __vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs);
+void __vgic_v3_init(int fd);
 int vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs);
 
 #define VGIC_MAX_RESERVED	1023
diff --git a/tools/testing/selftests/kvm/lib/arm64/vgic.c b/tools/testing/selftests/kvm/lib/arm64/vgic.c
index 661744c6532e..d0f7bd0984b8 100644
--- a/tools/testing/selftests/kvm/lib/arm64/vgic.c
+++ b/tools/testing/selftests/kvm/lib/arm64/vgic.c
@@ -41,24 +41,11 @@ bool kvm_supports_vgic_v3(void)
  * redistributor regions of the guest. Since it depends on the number of
  * vCPUs for the VM, it must be called after all the vCPUs have been created.
  */
-int vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs)
+int __vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs)
 {
 	int gic_fd;
 	uint64_t attr;
-	struct list_head *iter;
-	unsigned int nr_gic_pages, nr_vcpus_created = 0;
-
-	TEST_ASSERT(nr_vcpus, "Number of vCPUs cannot be empty");
-
-	/*
-	 * Make sure that the caller is infact calling this
-	 * function after all the vCPUs are added.
-	 */
-	list_for_each(iter, &vm->vcpus)
-		nr_vcpus_created++;
-	TEST_ASSERT(nr_vcpus == nr_vcpus_created,
-			"Number of vCPUs requested (%u) doesn't match with the ones created for the VM (%u)",
-			nr_vcpus, nr_vcpus_created);
+	unsigned int nr_gic_pages;
 
 	/* Distributor setup */
 	gic_fd = __kvm_create_device(vm, KVM_DEV_TYPE_ARM_VGIC_V3);
@@ -81,10 +68,39 @@ int vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs)
 						KVM_VGIC_V3_REDIST_SIZE * nr_vcpus);
 	virt_map(vm, GICR_BASE_GPA, GICR_BASE_GPA, nr_gic_pages);
 
-	kvm_device_attr_set(gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+	return gic_fd;
+}
+
+void __vgic_v3_init(int fd)
+{
+	kvm_device_attr_set(fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
 			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+}
 
-	return gic_fd;
+int vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs)
+{
+	unsigned int nr_vcpus_created = 0;
+	struct list_head *iter;
+	int fd;
+
+	TEST_ASSERT(nr_vcpus, "Number of vCPUs cannot be empty");
+
+	/*
+	 * Make sure that the caller is infact calling this
+	 * function after all the vCPUs are added.
+	 */
+	list_for_each(iter, &vm->vcpus)
+		nr_vcpus_created++;
+	TEST_ASSERT(nr_vcpus == nr_vcpus_created,
+		    "Number of vCPUs requested (%u) doesn't match with the ones created for the VM (%u)",
+		    nr_vcpus, nr_vcpus_created);
+
+	fd = __vgic_v3_setup(vm, nr_vcpus, nr_irqs);
+	if (fd < 0)
+		return fd;
+
+	__vgic_v3_init(fd);
+	return fd;
 }
 
 /* should only work for level sensitive interrupts */
-- 
2.47.3


