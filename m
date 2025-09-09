Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABF1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzTBPzo1RmPhb8+X/BxESoLEFr74YKphkmy8Mb4+wuw=; b=W1TlIAZcRR7ONqYZkA6Aq8p/+P
	x2sJ2A2fYrcGriRSa+HLquE+/zXRaSO/jeaambs/SlBkaN69ELjyMRSO3a55+kPsSpKkXWN/LQQq4
	q3hCo9blmbETr4x67AIALdNex4f7LGJSiFURRdIE94L03RI+25mkQa1hh8zOcYVdb7mKS+z22Diy8
	APuEqVRhaRuoa0EJnlccsO5H2oBkl3k4E8vivSbga567exXWwUP9vTITH2KOPI1m0KFh/aExMD3Sn
	daiymsF26EzzRo7Mf9fSEMK1rSbav0z1NRjnJMc8Zjnw3IZNCJIqGCNyxoqzWn44ETonmlZWBHvMR
	UdYkKhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuan-00000005wcw-2DXi;
	Tue, 09 Sep 2025 09:24:54 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsie-000000058xv-0kOy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:49 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b0467f38c91so500110166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402686; x=1758007486; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzTBPzo1RmPhb8+X/BxESoLEFr74YKphkmy8Mb4+wuw=;
        b=udyYBBblbf9hADTIrkndUmHDk+li2a6ygn/FE6g78c8/lyciTVMrRrge4OBmQkYTtc
         FtpcFT4RO7bahY2Vz/x9JdZ5O35L9gHgPRAFnwDAD9qwv9rWpwBSzfD9dPLEpWbEZsWR
         LzhjReMOmtn3NbAd5uqoW6BoNHB3pXeNlx6H5Yaq+q8wOYco/WWMw+7HAL/FYECWYwqH
         oT94Q19MA2O64hMYIn4VHNCh9qRsL+xduiycVBLE/neOx3Vy7qovJWzFUCTErdNyjy5u
         yYtk23fdkmmbG+6B1GfNUMwRD9tmcfV13YN2WmY3zSzE5zgS4xgiCRRQB3gGc6cZ4OXU
         wVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402686; x=1758007486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzTBPzo1RmPhb8+X/BxESoLEFr74YKphkmy8Mb4+wuw=;
        b=XSqNGdYjxuO9rl5hLtLN3Bh26RqlsasB2qXOdfEzg93rI99pe+em5lcBRHImOS2TIi
         6G8tYajTIKK7lsn72cl90CJBVqAGgPeMelUoNsRbwGvptqlxfzRtPvZvvRgqCyS1zGwf
         Vcoy2X6YoluqRwDSy0OCRJP+qgMWT8patmG4jjyme21WAIadYfXrtZxKqfz2WhqsD1Q/
         bJW+gy0Why+vfm4zqCIEJg0zibbgdMJr6A1IHzm6eKx5oBJgvGoR+4e07Pzp1vqY555e
         5oYCDb88oAkKTqlw81hK1ClBTUJUw1zE1H3V8Nwmho5YD841zHwuvapTlj5s8GBRcOeg
         HGOg==
X-Forwarded-Encrypted: i=1; AJvYcCWomZ81i8a591PVm91HVvP9+Mr3phaZnDt+54PMO17VebK2PRXCVV41vceSecvlwuXenQR5H3NlkZA4QtgKxi/p@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs6lyvV2l0HTBthVeNAMKviPwj3lqunwa9mObW1tPKoj/I76CE
	YYHjv+vQGHzIgTKNLXPwjd60gtxZFViGAl4NC7Z0mKTb+XvWWuWDbutj/KZMvSmkITZUgXJhMtp
	TAQ==
X-Google-Smtp-Source: AGHT+IHmh166VNYe1I4Zw+3zEdt0B8cCwpziEei+0Qgr9xayp3BH6sGEsTZjQ1Gpk5CrVR6IZ8KwrbicDA==
X-Received: from ejcst4.prod.google.com ([2002:a17:907:c084:b0:b04:1c58:759b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:d89:b0:b04:2cc2:e49c
 with SMTP id a640c23a62f3a-b04b1408355mr1072484366b.19.1757402686150; Tue, 09
 Sep 2025 00:24:46 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:36 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-10-tabba@google.com>
Subject: [PATCH v4 9/9] KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002448_216709_7179342B 
X-CRM114-Status: GOOD (  21.68  )
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
 arch/arm64/kvm/arm.c  | 14 ++++++++++----
 arch/arm64/kvm/pkvm.c | 33 +++++++++++++++++++++++----------
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 5bf101c869c9..b77ebe3aafb5 100644
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
@@ -184,6 +180,16 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		goto err_free_cpumask;
 
+	if (is_protected_kvm_enabled()) {
+		/*
+		 * If any failures occur after this is successful, make sure to
+		 * call __pkvm_unreserve_vm to unreserve the VM in hyp.
+		 */
+		ret = pkvm_init_host_vm(kvm);
+		if (ret)
+			goto err_free_cpumask;
+	}
+
 	kvm_vgic_early_init(kvm);
 
 	kvm_timer_init_vm(kvm);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index be3a094631b4..d7a0f69a9982 100644
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
2.51.0.384.g4c02a37b29-goog


