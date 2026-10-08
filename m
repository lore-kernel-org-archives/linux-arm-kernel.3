Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846A5CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09vdsORecMf9R07NLZLGzvSGWUHz+vByZgriB/KkWl8=; b=qc2HoMcd7GPiRbxgqv/DKl83lz
	AlKELaILuaryZqQ5fcf3RObrQTfewieB0j2oIkcUh0nrZjB9W4BVJ1x9k+dG2N2TageCcO9delKzh
	ZExxhPsetAHL4XiffbJraN7gKtt9OqqFy89ku/nwuv32I3FWWslrQWqqjjgic8SNtILPdhLniJUSI
	KgTyXoFfmzrSzRsMSMleKjVrpW9NxP9IzjQl2NAdxPuOunzEnlI4zDwRFn2vDzT/IivOKZIp/6Hrq
	H6NfCJdMOG8Mm8ICPoD8b/QKHmnpoo+xZ4kJW4YOqSSP/8+YIko23LzZX67BvFIva99f6E6CoF0i+
	lIOp7ouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhB3-00000003aGf-2nYb;
	Thu, 08 Oct 2026 06:00:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhB2-00000003aGG-0suM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:00:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9085341801;
	Thu,  8 Oct 2026 06:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E8F1F00893;
	Thu,  8 Oct 2026 06:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791439223;
	bh=09vdsORecMf9R07NLZLGzvSGWUHz+vByZgriB/KkWl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P9UImMUkB6ZBa0F624VUITeS94cpMKfiMuu5EaO3MED3RxVnqOLaVwp7WKx7GQwDZ
	 4xjbA3wxek8XKsktpGJQhwYBDUh9wxHXfgcImpQWcYQyBfOEGMn5Wl5EzrqIPWHnnM
	 kflInl1v/KR6ZELgOsVxBTwE7o4opHWHGsEcaW8NdyAWA3D+bPWE3gsRD4bqg974Rs
	 j+A8lIytq+lK6vBh/izbBj+Z6UReMVMYwJWXkUzazqs9doPCl8rAEmHFbImtD8SbBe
	 dd42fX0NRnY93iRcSV0pR4PVXDuz2E+5CNfB69KuYL8xLkgxVhOPaR+nZNq3GlK++B
	 IKAE5PneqHjpA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>,
	Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH v7 01/16] KVM: Introduce file_to_kvm_<arch>() infrastructure
Date: Thu,  8 Oct 2026 11:29:40 +0530
Message-ID: <20261008055955.4014342-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Steffen Eiden <seiden@linux.ibm.com>

Add a macro mechanism that generates an opt-in and arch-namespaced
file_to_kvm_<arch>() to convert a file reference to a kvm object if the
file handle represents a kvm handle.

Activate for x86 and for s390 (native KVM only).

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
Acked-by: Sean Christopherson <seanjc@google.com>
Acked-by: Janosch Frank <frankja@linux.ibm.com>
---
 arch/s390/include/asm/kvm_host_s390.h |  2 ++
 arch/x86/include/asm/kvm_host.h       |  2 ++
 arch/x86/kvm/Makefile                 |  1 +
 include/linux/kvm_host.h              | 12 ++++++++++++
 virt/kvm/kvm_main.c                   | 11 +++++++++++
 5 files changed, 28 insertions(+)

diff --git a/arch/s390/include/asm/kvm_host_s390.h b/arch/s390/include/asm/kvm_host_s390.h
index cd692f8fb764..8a7eed5847e1 100644
--- a/arch/s390/include/asm/kvm_host_s390.h
+++ b/arch/s390/include/asm/kvm_host_s390.h
@@ -27,6 +27,8 @@
 #include <asm/isc.h>
 #include <asm/guarded_storage.h>
 
+#define kvm_file_to_kvm_arch s390
+
 #define KVM_HAVE_MMU_RWLOCK
 #define KVM_MAX_VCPUS 255
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 683bb8bf43a9..e460073ff176 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -44,6 +44,8 @@
 
 #include <hyperv/hvhdk.h>
 
+#define kvm_file_to_kvm_arch x86
+
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
 
 /*
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 0474604ab8a1..e6d395ede9e2 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -61,6 +61,7 @@ exports_grep_trailer := --include='*.[ch]' -nrw $(srctree)/virt/kvm $(srctree)/a
 				-e kvm_page_track_unregister_notifier \
 				-e kvm_write_track_add_gfn \
 				-e kvm_write_track_remove_gfn \
+				-e kvm_file_to_kvm_fn \
 				-e kvm_get_kvm \
 				-e kvm_get_kvm_safe \
 				-e kvm_put_kvm
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cf7fe835c4ad..bc3abfde8393 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1082,6 +1082,18 @@ void kvm_get_kvm(struct kvm *kvm);
 bool kvm_get_kvm_safe(struct kvm *kvm);
 void kvm_put_kvm(struct kvm *kvm);
 bool file_is_kvm(struct file *file);
+
+/*
+ * Architectures define kvm_file_to_kvm_arch to <arch>
+ * to get a typed, arch-namespaced helper:
+ *
+ *   struct kvm *file_to_kvm_<arch>(struct file *file)
+ */
+#ifdef kvm_file_to_kvm_arch
+#define kvm_file_to_kvm_fn CONCATENATE(file_to_kvm_, kvm_file_to_kvm_arch)
+struct kvm *kvm_file_to_kvm_fn(struct file *file);
+#endif /* kvm_file_to_kvm_arch */
+
 void kvm_put_kvm_no_destroy(struct kvm *kvm);
 
 static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 85f42289748d..07fc874a38e1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5519,6 +5519,17 @@ bool file_is_kvm(struct file *file)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(file_is_kvm);
 
+#ifdef kvm_file_to_kvm_arch
+struct kvm *kvm_file_to_kvm_fn(struct file *file)
+{
+	if (!file || file->f_op != &kvm_vm_fops)
+		return NULL;
+
+	return file->private_data;
+}
+EXPORT_SYMBOL_GPL(kvm_file_to_kvm_fn);
+#endif
+
 static int kvm_dev_ioctl_create_vm(unsigned long type)
 {
 	char fdname[ITOA_MAX_LEN + 1];
-- 
2.43.0


