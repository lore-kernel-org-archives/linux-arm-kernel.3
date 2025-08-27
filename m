Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B5CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuCz5egXktmZGwWbzUOHComq39t7Vinsnw70AcEB24I=; b=vZc4fnK8R32VEUdvbYKc4HwxOG
	t6IH4fKrNW+zchCBpkFiAIsfLBXqiiwhdGLzC+Bgqo5Rqh+o+AZC7eC/AoeubONapVr2BcCXPByYz
	7ek9Mr8oCJBw32w4uq3hP5f7l+GQJoG94Thw5NXMBpADGaC3htHidg9CrtJ5X/hFstb18i9/vuaMq
	/0JSs5OvAr9u6yAsCw4Fadu/uxqN+wxSZrp20lkycuUxEtjUwmZ9cXh0HUuKzFLuDrLkZ4bpeX5UD
	HBVg436uIeqHjgIjRrUhQedIMoc8r3+LuV3NNkVvKqRXtBCniXSlKTk6lDOpSfWoWWp77lvqVrj5K
	T/sdpqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1f-0000000FCcG-0FnG;
	Wed, 27 Aug 2025 11:09:11 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDG6-0000000F2d2-146X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:20:03 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45b612dbc28so20244575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756290001; x=1756894801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nuCz5egXktmZGwWbzUOHComq39t7Vinsnw70AcEB24I=;
        b=VZ+HLNSkxLkKZpqgYzXO5xaA0/42OsFESWMcdEie+hl5wt+uIqhHtPO2O1l4nGfqHq
         +0qzvowCEDigqE8AoIwHE9vVw+J5yOlJN34jjKmD7Rlqwss1wnhxnxMuBd0npPLal1iC
         HpPh92uROFa6fVrpKsdVXm1fM7O+T5ScYPUj7UtEgILDO0bDbQU8a+90lSLUEiCJmcJx
         aMzhP8DDzzekiCYLqvRysI5NBaCS53txfXKT6eAPReLOENYkOCCFF+/N0yqRI6AUN4TW
         +cYdmQ5JQcMw3kA2o5uhfqlIlaAbO8ybutwfYq6NHARBE0iRz/N/kMAkhMHKtkdtOhS9
         6jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290001; x=1756894801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuCz5egXktmZGwWbzUOHComq39t7Vinsnw70AcEB24I=;
        b=GjvYBKm6e79fX+TXE2VJ6m8bthZCfe0tbhzN+RO3t2XmmUKW3SnglPf32kFjeY+hAz
         9IBbD0CjjBiMpTAf2O9L2OEjirwFoqS3LjXrNVl7cq7OSZTxmxl51iQgpcVBszMMadN3
         f7vNZWacV7Uism+pvpShVESDpOkbiGfUXKsjwkHktFac4rpCigC3eLETR5ctyWRm6ygh
         AHb1/7DnKYArt9OYh0QIR06bjzU4GRsGnoiIqxH/Iv/9iBZJzHeooQZPgjugGYDdlWM/
         SIanC82rlx1HdOcTq2CfV0nGBtDtEfu8TZq/J2rMwSTIcmC6PMjb27n41E26v0u63GfT
         7kmw==
X-Forwarded-Encrypted: i=1; AJvYcCXhkO/hlKxAGm09XoAj+7SjPR02vWTynM16LEOGndkonbJzIHOyDXUyw3aPqQUSkrHSnk39Fu+ElD5VWJO63LIP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywygdb4sYcGr4HExmRMPxuq8QYv/XokQtBDg6cQp6aUgtmXIN3I
	x8J+gh7tjVznFm4NP0/RmITQyhfdyhSTjdRoKG2tnp2JgXGVtPrl6wrEuqHTc7s40OJz1La2rOm
	thQ==
X-Google-Smtp-Source: AGHT+IEOQLpBwftS3XTIfWvMVc8KCrkmcTWprSbLkzguiMao4KsAhSZA//2vOVdXK5qUkUe1Vh2eIeZMWQ==
X-Received: from wmbdt7.prod.google.com ([2002:a05:600c:6307:b0:459:df20:248e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1881:b0:3c9:28f1:d858
 with SMTP id ffacd0b85a97d-3c928f1dd27mr8198451f8f.22.1756290000977; Wed, 27
 Aug 2025 03:20:00 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:49 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-10-tabba@google.com>
Subject: [PATCH v3 9/9] KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_032002_310285_DB8151BE 
X-CRM114-Status: GOOD (  21.82  )
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

When a pKVM guest is active, TLB invalidations triggered by host MMU
notifiers require a valid hypervisor handle. Currently, this handle is
only allocated when the first vCPU is run.

However, the guest's memory is associated with the host MMU much
earlier, during kvm_arch_init_vm(). This creates a window where an MMU
invalidation could occur after the kvm_pgtable pointer checked by the
notifiers is set but before the pKVM handle has been created.

Fix this by reserving the pKVM handle when the host VM is first set up.
Move the call to the __pkvm_reserve_vm hypercall from the first-vCPU-run
path into pkvm_init_host_vm(), which is called during initial VM setup.
This ensures the handle is available before any subsystem can trigger an
MMU notification for the VM.

The VM destruction path is updated to call __pkvm_unreserve_vm for cases
where a VM was reserved but never fully created at the hypervisor,
ensuring the handle is properly released.

This fix leverages the two-stage reservation/initialization hypercall
interface introduced in preceding patches.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/arm.c  | 12 ++++++++----
 arch/arm64/kvm/pkvm.c | 33 +++++++++++++++++++++++----------
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 888f7c7abf54..7f9ebe38fdd2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -170,10 +170,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		return ret;
 
-	ret = pkvm_init_host_vm(kvm);
-	if (ret)
-		goto err_unshare_kvm;
-
 	if (!zalloc_cpumask_var(&kvm->arch.supported_cpus, GFP_KERNEL_ACCOUNT)) {
 		ret = -ENOMEM;
 		goto err_unshare_kvm;
@@ -184,6 +180,14 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		goto err_free_cpumask;
 
+	/*
+	 * If any failures occur after this is successful, make sure to call
+	 * __pkvm_unreserve_vm to unreserve the VM in the hypervisor.
+	 */
+	ret = pkvm_init_host_vm(kvm);
+	if (ret)
+		goto err_free_cpumask;
+
 	kvm_vgic_early_init(kvm);
 
 	kvm_timer_init_vm(kvm);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 082bc15f436c..24f0f8a8c943 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -90,6 +90,12 @@ static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 	if (pkvm_hyp_vm_is_created(kvm)) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
 					  kvm->arch.pkvm.handle));
+	} else if (kvm->arch.pkvm.handle) {
+		/*
+		 * The VM could have been reserved but hyp initialization has
+		 * failed. Make sure to unreserve it.
+		 */
+		kvm_call_hyp_nvhe(__pkvm_unreserve_vm, kvm->arch.pkvm.handle);
 	}
 
 	kvm->arch.pkvm.handle = 0;
@@ -160,25 +166,16 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 		goto free_pgd;
 	}
 
-	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
-	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
-	if (ret < 0)
-		goto free_vm;
-
-	kvm->arch.pkvm.handle = ret;
-
 	/* Donate the VM memory to hyp and let hyp initialize it. */
 	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
 	if (ret)
-		goto unreserve_vm;
+		goto free_vm;
 
 	kvm->arch.pkvm.is_created = true;
 	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
-unreserve_vm:
-	kvm_call_hyp_nvhe(__pkvm_unreserve_vm, kvm->arch.pkvm.handle);
 free_vm:
 	free_pages_exact(hyp_vm, hyp_vm_sz);
 free_pgd:
@@ -224,6 +221,22 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm)
 
 int pkvm_init_host_vm(struct kvm *kvm)
 {
+	int ret;
+
+	if (pkvm_hyp_vm_is_created(kvm))
+		return -EINVAL;
+
+	/* VM is already reserved, no need to proceed. */
+	if (kvm->arch.pkvm.handle)
+		return 0;
+
+	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
+	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
+	if (ret < 0)
+		return ret;
+
+	kvm->arch.pkvm.handle = ret;
+
 	return 0;
 }
 
-- 
2.51.0.261.g7ce5a0a67e-goog


