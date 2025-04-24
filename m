Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2465EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoVyA4T/XR+PrBla9t1/dUC6ibbVMr9f/wkTq4NWm5c=; b=s7aOpBkAyNKHPg4GEDTDalaaU/
	L78O0Rx4IdPd+0b+an0dw1fFd1E6pijHNizUjYGOHigMqK4Y8cEBq3VO97Wh7njHe+1YvXQBF4aKu
	oqfJjEWswIFwJC1nUp4FMH8XGB8iv2xEiXUml55aXGcBRDqM1JMx5UrDX1eGhPlECbozhREI95MLy
	YvM9vWEyeT35QR3/2J8G8jzlNmSPtVgcma55tufIx3OTN440XIK4qxXADNdFKgB/rVVi49E5Lc3Hi
	z8/OcWAdd0mkm/yW64Eyzk6EdkrAyWIyBoo2/EdcCSa1wnEzoJBmEvB17fTqa+v6w6YR8oFKlN04J
	knuAsBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5X-0000000EdYe-0L4X;
	Thu, 24 Apr 2025 16:06:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xL5-0000000EKkF-3SiX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39ee651e419so654004f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504046; x=1746108846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoVyA4T/XR+PrBla9t1/dUC6ibbVMr9f/wkTq4NWm5c=;
        b=Jf1HKBqEQ0hzzoHp3sWFCM2Hn2s7iNhbQe4oKq1UCHA9ZijlurkgSpSA7YHhfKiBF2
         mgHMiWLnyN4834h9UfjzVN47bnOM9A4WV8hRI7WNaMWxo8R74jCUft3OVerF+ByV7A0v
         qfe2qqftFjSUj40T02jXADGLugAXZH6h/zVnDAcFAMoqBCreUz0AL8uWMeeGkupM4fj7
         qo1B8sFXYF12fKzvIxFlXkW/NCKaMasSr0yyV2RRGAHMjnvCG+Cn7/BBJ0MqlUhfUX3H
         HdwNqG/vHT5K1QPybE1LCo0zHdzoyUww3aZrANGr6NQPh/FFL1HRYsAlioFhgSELuwx9
         ix/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504046; x=1746108846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoVyA4T/XR+PrBla9t1/dUC6ibbVMr9f/wkTq4NWm5c=;
        b=LyzZIjiR7xQlt9BhihOXHeMzYz5fERTLidasDHIg2YaHWNUL6uEJnIJ/cl/v/7Cc6c
         +Phkt/GTZLbZEnPxXZlshIRR5iN3uV7W4ICr9yuZzF3HbG4xkaPFdBvALFYchtGr20+W
         ufuMmeqPGUuzRLZSFQEXJzbK3c0oIJYnRy9+iWCQ81jj3GW5Y13PnJ5M7V/5Bh5Ih8si
         dxNi8cYeBh57/tFPvYYdALg8H8u7XPyaj6kVBCQ+CVEEAqKenbfDuRzeuvW+FC/K2moo
         RLiVfsDrihw7ygfoC3WCeA3zPDQ/J1NUjPPVla6ptqvqIjdRBddOlTFhWIJTp1OXXo+0
         57wA==
X-Forwarded-Encrypted: i=1; AJvYcCUVBh9OiuoJpur9IoX2yVXTvcAGS5pSOaa8Oi08EXWcVCwiAHgICEmxoI4jo+cUMv9MZN/C8gsC1QhhWGE2PGXO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi5wi1UyRsCw2cMH2mGlpGaiWkSoSjvjUiWpQ2nrB2+jv4YcLo
	CGmMPc2SIYXDXTqciT4cp04wYfMsAcdXHGUZEchyF0YzBGjNzHElDuP7nvPvlpY=
X-Gm-Gg: ASbGncsOP8beIppeAQ/R2c3765cqYnyog8DU5F+maNaDPBa36C37ihsTu8auDdDuq4l
	zc3bO4fRqSA9PhOaTOKVFIElFeGcuSSa3JSCnqfhoDSc6aRYkh0GbbK8uKe+kMphI1a71zC98Ib
	sN6ssqwx5F0kZYqMW37yDO+tF9km1ghE/9jv2lKJTf2+lJo4tpYtPpOATRzthU7QAs1KyUK7YxS
	0DCMERcYXaFQxkLqg9KqZQFRg6WqifikHoEFc1LDzTQAGM1UcxMP9X0ktJqpOXsD2XXHAM98Opq
	LrN3jgeMDFWbVyOvWdjVHP+Un0MvdWl+TnBds4P0RIcv+yQ16xvrhe1NUCF7qRCnYbS1HxIZCfr
	MfeN9HqqJn0UFW4pw
X-Google-Smtp-Source: AGHT+IFaUaoW58kCoH3cGCkS9884/3gN3P0U2I1fqPQYARfS16RUhRZKrV74ekkuGWYubSRTquJKGQ==
X-Received: by 2002:a5d:64ab:0:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-3a06cfa8400mr2501557f8f.36.1745504046320;
        Thu, 24 Apr 2025 07:14:06 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:05 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 16/34] gunyah: Add basic VM lifecycle management
Date: Thu, 24 Apr 2025 15:13:23 +0100
Message-Id: <20250424141341.841734-17-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071407_992827_DD13DA83 
X-CRM114-Status: GOOD (  26.52  )
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

This patch hooks up Gunyah virtual machine lifecycle management with the
KVM backend by implementing the kvm_arch_alloc_vm(), kvm_arch_destroy_vm(),
and kvm_arch_free_vm() hooks.

The Gunyah VM management logic—VMID allocation, configuration,
initialization, start/stop, teardown, and notifier handling—is based on
the implementation introduced in [1], authored by Elliot Berman and
Prakruthi Deepak Heragu.

The original code added a special ioctl interface to support userspace
initialization of guest VMs. This patch reuses the same logic, but
ported to KVM, allowing to use KVM's ioctl interface to create
Gunyah-based guests.

[1] Commit: 532788ce71c9 ("gunyah: vm_mgr: Add VM start/stop")
    Link: https://lore.kernel.org/lkml/20240222-gunyah-v17-10-1e9da6763d38@quicinc.com/

Co-developed-by: Elliot Berman <quic_eberman@quicinc.com>
Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h |   5 +
 arch/arm64/kvm/gunyah.c           | 196 ++++++++++++++++++++++++++++--
 drivers/virt/gunyah/rsc_mgr_rpc.c |   2 +-
 include/linux/gunyah.h            |  32 +++++
 4 files changed, 227 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 9c8e173fc9c1..53358d3f5fa8 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1591,4 +1591,9 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1poe(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
+#ifndef CONFIG_KVM_ARM
+#define __KVM_HAVE_ARCH_VM_FREE
+void kvm_arch_free_vm(struct kvm *kvm);
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 9c37ab20d7e2..a3c29ae985c9 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -13,6 +13,12 @@
 #include <asm/kvm_mmu.h>
 #include <linux/perf_event.h>
 
+#include <linux/gunyah_rsc_mgr.h>
+#include <linux/gunyah.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) "gunyah: " fmt
+
 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
 
 enum kvm_mode kvm_get_mode(void)
@@ -338,12 +344,6 @@ void kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
 }
 
-void kvm_arch_destroy_vm(struct kvm *kvm)
-{
-	kvm_destroy_vcpus(kvm);
-	return;
-}
-
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
 {
@@ -788,7 +788,189 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 	return -EINVAL;
 }
 
+static int gunyah_vm_rm_notification_status(struct gunyah_vm *ghvm, void *data)
+{
+	struct gunyah_rm_vm_status_payload *payload = data;
+
+	if (le16_to_cpu(payload->vmid) != ghvm->vmid)
+		return NOTIFY_OK;
+
+	/* All other state transitions are synchronous to a corresponding RM call */
+	if (payload->vm_status == GUNYAH_RM_VM_STATUS_RESET) {
+		down_write(&ghvm->status_lock);
+		ghvm->vm_status = payload->vm_status;
+		up_write(&ghvm->status_lock);
+		wake_up(&ghvm->vm_status_wait);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int gunyah_vm_rm_notification_exited(struct gunyah_vm *ghvm, void *data)
+{
+	struct gunyah_rm_vm_exited_payload *payload = data;
+
+	if (le16_to_cpu(payload->vmid) != ghvm->vmid)
+		return NOTIFY_OK;
+
+	down_write(&ghvm->status_lock);
+	ghvm->vm_status = GUNYAH_RM_VM_STATUS_EXITED;
+	up_write(&ghvm->status_lock);
+	wake_up(&ghvm->vm_status_wait);
+
+	return NOTIFY_DONE;
+}
+
+static int gunyah_vm_rm_notification(struct notifier_block *nb,
+		unsigned long action, void *data)
+{
+	struct gunyah_vm *ghvm = container_of(nb, struct gunyah_vm, nb);
+
+	switch (action) {
+	case GUNYAH_RM_NOTIFICATION_VM_STATUS:
+		return gunyah_vm_rm_notification_status(ghvm, data);
+	case GUNYAH_RM_NOTIFICATION_VM_EXITED:
+		return gunyah_vm_rm_notification_exited(ghvm, data);
+	default:
+		return NOTIFY_OK;
+	}
+}
+
+static void gunyah_vm_stop(struct gunyah_vm *ghvm)
+{
+	int ret;
+
+	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_RUNNING) {
+		ret = gunyah_rm_vm_stop(ghvm->rm, ghvm->vmid);
+		if (ret)
+			pr_warn("Failed to stop VM: %d\n", ret);
+	}
+
+	wait_event(ghvm->vm_status_wait,
+		   ghvm->vm_status != GUNYAH_RM_VM_STATUS_RUNNING);
+}
+
+static int gunyah_vm_start(struct gunyah_vm *ghvm)
+{
+	int ret;
+
+	down_write(&ghvm->status_lock);
+	if (ghvm->vm_status != GUNYAH_RM_VM_STATUS_NO_STATE) {
+		up_write(&ghvm->status_lock);
+		return 0;
+	}
+
+	ghvm->nb.notifier_call = gunyah_vm_rm_notification;
+	ret = gunyah_rm_notifier_register(ghvm->rm, &ghvm->nb);
+	if (ret)
+		goto err;
+
+	ret = gunyah_rm_alloc_vmid(ghvm->rm, 0);
+	if (ret < 0) {
+		gunyah_rm_notifier_unregister(ghvm->rm, &ghvm->nb);
+		goto err;
+	}
+	ghvm->vmid = ret;
+	ghvm->vm_status = GUNYAH_RM_VM_STATUS_LOAD;
+
+	ret = gunyah_rm_vm_configure(ghvm->rm, ghvm->vmid, ghvm->auth, 0, 0, 0, 0, 0);
+	if (ret) {
+		pr_warn("Failed to configure VM: %d\n", ret);
+		goto err;
+	}
+
+	ret = gunyah_rm_vm_init(ghvm->rm, ghvm->vmid);
+	if (ret) {
+		ghvm->vm_status = GUNYAH_RM_VM_STATUS_INIT_FAILED;
+		pr_warn("Failed to initialize VM: %d\n", ret);
+		goto err;
+	}
+	ghvm->vm_status = GUNYAH_RM_VM_STATUS_READY;
+
+	ret = gunyah_rm_vm_start(ghvm->rm, ghvm->vmid);
+	if (ret) {
+		pr_warn("Failed to start VM: %d\n", ret);
+		goto err;
+	}
+
+	ghvm->vm_status = GUNYAH_RM_VM_STATUS_RUNNING;
+	up_write(&ghvm->status_lock);
+	return 0;
+err:
+	up_write(&ghvm->status_lock);
+	return ret;
+}
+
+static struct gunyah_vm *gunyah_vm_alloc(struct gunyah_rm *rm)
+{
+	struct gunyah_vm *ghvm;
+
+	ghvm = kzalloc(sizeof(*ghvm), GFP_KERNEL);
+	if (!ghvm)
+		return ERR_PTR(-ENOMEM);
+
+	ghvm->vmid = GUNYAH_VMID_INVAL;
+	ghvm->rm = rm;
+
+	init_rwsem(&ghvm->status_lock);
+	init_waitqueue_head(&ghvm->vm_status_wait);
+	ghvm->vm_status = GUNYAH_RM_VM_STATUS_NO_STATE;
+
+	return ghvm;
+}
+
+static void gunyah_destroy_vm(struct gunyah_vm *ghvm)
+{
+	int ret;
+
+	/**
+	 * We might race with a VM exit notification, but that's ok:
+	 * gh_rm_vm_stop() will just return right away.
+	 */
+	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_RUNNING)
+		gunyah_vm_stop(ghvm);
+
+	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_EXITED ||
+	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_READY ||
+	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_INIT_FAILED) {
+		ret = gunyah_rm_vm_reset(ghvm->rm, ghvm->vmid);
+		if (!ret)
+			wait_event(ghvm->vm_status_wait,
+				   ghvm->vm_status == GUNYAH_RM_VM_STATUS_RESET);
+		else
+			pr_warn("Failed to reset the vm: %d\n", ret);
+	}
+
+	if (ghvm->vm_status > GUNYAH_RM_VM_STATUS_NO_STATE) {
+		gunyah_rm_notifier_unregister(ghvm->rm, &ghvm->nb);
+		ret = gunyah_rm_dealloc_vmid(ghvm->rm, ghvm->vmid);
+		if (ret)
+			pr_warn("Failed to deallocate vmid: %d\n", ret);
+	}
+}
+
 struct kvm *kvm_arch_alloc_vm(void)
 {
-	return NULL;
+	struct gunyah_vm *ghvm;
+
+	ghvm = gunyah_vm_alloc(gunyah_rm);
+	if (IS_ERR(ghvm))
+		return NULL;
+
+	return &ghvm->kvm;
+}
+
+void kvm_arch_destroy_vm(struct kvm *kvm)
+{
+	struct gunyah_vm *ghvm = kvm_to_gunyah(kvm);
+
+	kvm_destroy_vcpus(kvm);
+	gunyah_destroy_vm(ghvm);
+}
+
+void kvm_arch_free_vm(struct kvm *kvm)
+{
+	struct gunyah_vm *ghvm = kvm_to_gunyah(kvm);
+
+	kfree(ghvm);
 }
diff --git a/drivers/virt/gunyah/rsc_mgr_rpc.c b/drivers/virt/gunyah/rsc_mgr_rpc.c
index 626ad2565548..936592177ddb 100644
--- a/drivers/virt/gunyah/rsc_mgr_rpc.c
+++ b/drivers/virt/gunyah/rsc_mgr_rpc.c
@@ -3,8 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/slab.h>
 #include <linux/error-injection.h>
-
 #include <linux/gunyah_rsc_mgr.h>
 
 /* Message IDs: VM Management */
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index acd70f982425..1f4389eb21fb 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -11,6 +11,12 @@
 #include <linux/interrupt.h>
 #include <linux/limits.h>
 #include <linux/types.h>
+#include <linux/kvm_host.h>
+
+#include <linux/gunyah_rsc_mgr.h>
+
+#define kvm_to_gunyah(kvm_ptr) \
+	container_of(kvm_ptr, struct gunyah_vm, kvm)
 
 /* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
 enum gunyah_resource_type {
@@ -31,6 +37,32 @@ struct gunyah_resource {
 	unsigned int irq;
 };
 
+/**
+ * struct gunyah_vm - Main representation of a Gunyah Virtual machine
+                              memory shared with the guest.
+ * @vmid: Gunyah's VMID for this virtual machine
+ * @kvm: kvm instance for this VM
+ * @rm: Pointer to the resource manager struct to make RM calls
+ * @nb: Notifier block for RM notifications
+ * @vm_status: Current state of the VM, as last reported by RM
+ * @vm_status_wait: Wait queue for status @vm_status changes
+ * @status_lock: Serializing state transitions
+ * @auth: Authentication mechanism to be used by resource manager when
+ *        launching the VM
+ */
+struct gunyah_vm {
+	u16 vmid;
+	struct kvm kvm;
+	struct gunyah_rm *rm;
+
+	struct notifier_block nb;
+	enum gunyah_rm_vm_status vm_status;
+	wait_queue_head_t vm_status_wait;
+	struct rw_semaphore status_lock;
+
+	enum gunyah_rm_vm_auth_mechanism auth;
+};
+
 /******************************************************************************/
 /* Common arch-independent definitions for Gunyah hypercalls                  */
 #define GUNYAH_CAPID_INVAL U64_MAX
-- 
2.39.5


