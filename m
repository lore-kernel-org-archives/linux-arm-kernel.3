Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EFD606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pr6jMnk2;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bUQFIZYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=poQqnkjlBPuX9RdULowmTFcXX7UXKmqTRfjOTQXFTR8=; b=pr6jMnk2T23qsbZ097yGDZCX2B
	HUiqeyPLwnWEs/D+4TTJAsajm28us8KThQJ/uokoW735r2r00yqX23p7mZ0WdJvT7ZPguQlfXU/Ok
	UN97vw2kLOFkgUdNEzv9AAzP6qGYfzsCBEutpm0VzKK7JCNJX0OyFX2RwQToAlhDTR8Wqse305vXx
	wZ5TTmV4KvxqykFZpZA37ZEF5dcL8Bhfs67b14ypqAl3RhrXABsJ1D7bOz6HENWD8YGuhs1oWo+qr
	YKBOtZAFnDrWXlVRP3ufB44Bbasvd4bPDtVSMvtaBoXdJehEaqs+6ntLbB6KOQMXiTkuOiN3D+Z+w
	uFnag0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjs-00000002uDM-22TC;
	Mon, 26 Oct 2026 16:40:00 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjl-00000002u9n-2UJj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:39:54 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48dff112136so2221963f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793032791; x=1793637591; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poQqnkjlBPuX9RdULowmTFcXX7UXKmqTRfjOTQXFTR8=;
        b=bUQFIZYrCTKTsXly+aYUcMzWYPx7uUgJNCIspblQ1NbS9ZX7qcXSg359RCDdIIywyt
         equ1ophKIeRrTXTLzkAqzMTlhflZ119FwKZRyyhs2u38EvVwBoYiXdYF7AdcXriX1CWL
         8b+N33/qfm6CyMmbV/2iiaYnEotCr34+uYrFuYeY61AyRgW12DoQueIBBiV93+xN3M+S
         +Vj6RCCm80AszJggfph50OECsqtwHpBkAHzqMYGjD/JIOuQH+HdWsbl65ib8R5dGnmmB
         tu5+OA9mm6GpGVSANc2JCzqyMIaLavLW3QqSe7TLrRixbhRlFdFbVXGBL4tedJIeF9QY
         bl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032791; x=1793637591;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poQqnkjlBPuX9RdULowmTFcXX7UXKmqTRfjOTQXFTR8=;
        b=IuqsxUcb4I2JpEdw+8MC+TcoqZkgft0qvzS/UOcBAf5sBaUQo0dPcizWXYSJh36M0t
         28UXvNYFs/MqOEWniLbDJB93pSbXdBvH03MBLu7eGh7zELv7krbdey16UHY1WjoLXcdV
         yXg483tnd3oOP8fScUCzP5Q3i05iBCpKAXJIUNxRI2NKvpagibiTZKQdlBsODBYDIfgd
         VjqnIZ+sIQLhgP7vbBcSKMvBfbSIIymaQhQR9iZuqAzJvUdaRxF6sqjm8Gz9riNb7vjd
         j9X1uO0ad1tiG4zsgalQROUiBDysOLYfTGWOkXLnpBj9UdgmSlF7CiPmt5WZdrEfI3md
         oGlA==
X-Forwarded-Encrypted: i=1; AKwUvByzjkDNp7k4IVJTn/zoUloi0pyGMkREP+aClKEEo/sZfswGUdJr+l4GdtlNYYlzNGcEacAigCCgeJWCaVMAFRR6@lists.infradead.org
X-Gm-Message-State: AFq9FYLaKQPAuupQbziQoefDT78ACl1UBqDYKWFVMYumb9KJnCi+K4Km
	7/S1MEqYFCPwkT33ofpIUqJarnJqWDeKGPP6/I/yZd0nOfywE3W0ABXLtMPOKewwzoABdUCWu5p
	c83/R7Yy7GOx5uhi0Fr79mg==
X-Received: from wmbhi16.prod.google.com ([2002:a05:600c:5350:b0:4a1:f1e1:c6d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e547:20b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4a6b49f9e0bmr33320305e9.34.1793032790938;
 Mon, 26 Oct 2026 09:39:50 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:39:36 +0000
In-Reply-To: <20261026163937.963087-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261026163937.963087-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026163937.963087-3-vdonnefort@google.com>
Subject: [PATCH v3 2/3] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_093953_675851_395F16B3 
X-CRM114-Status: GOOD (  22.16  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The vGIC LRs are architecturally UNKNOWN when the CPU boots or resumes.
However, in protected mode, only the used ones are reset, because the
HVC __vgic_v3_init_lrs() is never called:

  * During boot, vgic_present is only set in init_subsystems(), after
    cpu_hyp_init() was called.

  * During CPU hotplug, kvm_arch_enable_virtualization_cpu() never calls
    it either because kvm_hyp_initialized is always set.

  * During CPU resume, no notifier is registered for pKVM.

If left uninitialised, those registers may inject spurious interrupts or
worse, if EOI is set, livelock the vCPU, since no one is in position to
clear it.

First, return the error of __hyp_reset_vectors(). On an error, we know
the hypervisor doesn't allow a reset. Only re-init what the host has
access to, no matter the KVM configuration, which is the vGIC LRs.

Then, cpu_hyp_init() is only called from init_subsystems() and
kvm_arch_enable_virtualization_cpu(). Remove the kvm_hyp_initialized
gate. It is possible because when pKVM is enabled, a CPU may already be
initialised but then cpu_hyp_reset() simply returns an error, so we know
we can skip the full init, while for the other modes, we know for sure
it is never initialised when it hits this path.

Finally, enable the PM notifiers for pKVM, it is now safe to do so. It
will ensure the host properly configures the vGIC LRs regardless of the
KVM configuration.

Fixes: fa8c3d65538a ("KVM: arm64: Keep nVHE EL2 vector installed")
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/virt.h |  2 +-
 arch/arm64/kvm/arm.c          | 50 +++++++++++++++++++----------------
 2 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index b546703c3ab9..a5bde8cc5df5 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -83,7 +83,7 @@ extern u32 __boot_cpu_mode[2];
 #define ARM64_VECTOR_TABLE_LEN	SZ_2K
 
 void __hyp_set_vectors(phys_addr_t phys_vector_base);
-void __hyp_reset_vectors(void);
+int __hyp_reset_vectors(void);
 bool is_kvm_arm_initialised(void);
 
 DECLARE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0576c2022ef5..dca6b7a43e92 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2246,10 +2246,12 @@ static void cpu_init_hyp_mode(void)
 	}
 }
 
-static void cpu_hyp_reset(void)
+static int cpu_hyp_reset(void)
 {
 	if (!is_kernel_in_hyp_mode())
-		__hyp_reset_vectors();
+		return __hyp_reset_vectors() ? -EPERM : 0;
+
+	return 0;
 }
 
 /*
@@ -2300,32 +2302,38 @@ static void cpu_hyp_init_features(void)
 		kvm_timer_init_vhe();
 		kvm_debug_init_vhe();
 	}
-
-	if (vgic_present)
-		kvm_vgic_init_cpu_hardware();
 }
 
 static void cpu_hyp_reinit(void)
 {
-	cpu_hyp_reset();
-	cpu_hyp_init_context();
-	cpu_hyp_init_features();
+	if (!cpu_hyp_reset()) {
+		cpu_hyp_init_context();
+		cpu_hyp_init_features();
+	} else if (WARN_ON(!__this_cpu_read(kvm_hyp_initialized))) {
+		return;
+	}
+
+	/*
+	 * Even if the hypervisor didn't allow resetting the vectors we can
+	 * reset the LRs.
+	 */
+	if (vgic_present)
+		kvm_vgic_init_cpu_hardware();
 }
 
 static void cpu_hyp_init(void *discard)
 {
-	if (!__this_cpu_read(kvm_hyp_initialized)) {
-		cpu_hyp_reinit();
-		__this_cpu_write(kvm_hyp_initialized, 1);
-	}
+	cpu_hyp_reinit();
+	__this_cpu_write(kvm_hyp_initialized, 1);
 }
 
 static void cpu_hyp_uninit(void *discard)
 {
-	if (!is_protected_kvm_enabled() && __this_cpu_read(kvm_hyp_initialized)) {
-		cpu_hyp_reset();
+	if (!__this_cpu_read(kvm_hyp_initialized))
+		return;
+
+	if (!cpu_hyp_reset())
 		__this_cpu_write(kvm_hyp_initialized, 0);
-	}
 }
 
 int kvm_arch_enable_virtualization_cpu(void)
@@ -2353,8 +2361,7 @@ void kvm_arch_disable_virtualization_cpu(void)
 	kvm_timer_cpu_down();
 	kvm_vgic_cpu_down();
 
-	if (!is_protected_kvm_enabled())
-		cpu_hyp_uninit(NULL);
+	cpu_hyp_uninit(NULL);
 }
 
 #ifdef CONFIG_CPU_PM
@@ -2397,13 +2404,11 @@ static struct notifier_block hyp_init_cpu_pm_nb = {
 
 static void __init hyp_cpu_pm_init(void)
 {
-	if (!is_protected_kvm_enabled())
-		cpu_pm_register_notifier(&hyp_init_cpu_pm_nb);
+	cpu_pm_register_notifier(&hyp_init_cpu_pm_nb);
 }
 static void __init hyp_cpu_pm_exit(void)
 {
-	if (!is_protected_kvm_enabled())
-		cpu_pm_unregister_notifier(&hyp_init_cpu_pm_nb);
+	cpu_pm_unregister_notifier(&hyp_init_cpu_pm_nb);
 }
 #else
 static inline void __init hyp_cpu_pm_init(void)
@@ -2526,8 +2531,7 @@ static int __init init_subsystems(void)
 	if (err)
 		hyp_cpu_pm_exit();
 
-	if (err || !is_protected_kvm_enabled())
-		on_each_cpu(cpu_hyp_uninit, NULL, 1);
+	on_each_cpu(cpu_hyp_uninit, NULL, 1);
 
 	return err;
 }
-- 
2.56.0.257.gf7497c7d27-goog


