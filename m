Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF41DC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56TnglbK1xrAvqmnbHBS7x8Hfawflf/2HSwwBboYSo0=; b=UN8g9/n/DXvk20gytRPkAg74id
	lX6zvVGuPZTk2INYeaV8uAObeJ0HUH2UzSiEITTgqVVZFqf/lvu8eOVUW154aA0AGbidXMSreovDw
	cGu1qJT+tlTjUglrM+bmCAYrIA2pOCo5qXe4KxWXy4i2BUscRGYLECwD2IB9d0wFOwomj6ygs6ykO
	6ylEqMP8Bik/mMydZqH7wIjIXLyHBmOd49MFXSM6YceOjxWaChGzxH91el/pN7RXNBvXt1sspiLeS
	Ih10EVBcgvqtX89KsfoGIsFIF1nzHwyZlpMcMH27onR2BEXHvWXj4nZ5QzLyPjkKI1DHVn2b3V+wG
	5AApORqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsct3-00000009Bc4-24nR;
	Sat, 08 Aug 2026 08:58:37 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsct1-00000009BaC-185f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:58:36 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-490a767b782so3004675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786179513; x=1786784313; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56TnglbK1xrAvqmnbHBS7x8Hfawflf/2HSwwBboYSo0=;
        b=hRlfdCggbmzv2OpLuK3u5t2f6EbM3iP5HHBV5Q5TccdrUTAfz3OGwsuCnW+fAdv81v
         ZixOsk7lc+6Tq/GEqMWVc9aE/8WBz6zcWkwgFtNUpKxhwAOvkctDlTLhJJd6BVW0sG28
         enDOzc88GIHfmLhYTieFGIktB7SqZbhdX6aG0I8f5jmb/XziHu1Aok5gMyX6OrUENYSW
         SXGcEkxEgNZRwaZCXk2Mfu0lZXgfn0yvaP6fNnssmwMxFJm9NALnkUU0QwXplMwU6DvN
         ALqU7PlKlF+DdbUzBYlDUzszKtv1K/mGu7CSCfZJN6gRYhCPfD8D0zpzksolCyvsypgR
         mQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179513; x=1786784313;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56TnglbK1xrAvqmnbHBS7x8Hfawflf/2HSwwBboYSo0=;
        b=YCzdtniEqN0U3O9ar+y8UICJsuZj9qnU5xxr4IFnik4c81190gBF3FVEfBn64pVsy5
         iSAuhCX3IUHNrlWk5BIYpzzCA/8xLaOYJw41EMyRZQT+p7qfZKK6Tfgv4zF4AT5kMHAZ
         E7KYvX7FSqTjP36+xrbMhs9QlfeTSwGF4MJWz0/fyZaPU8WLwSSIIkRryUtTtbsnMOgQ
         mgrTjFxMGoaJT/hhG58Op4oRxe2MuUur2EsEB9RAU7OB8vONKb1qLQ3TYWLbb54Gj5Hi
         gaa/pU2pe4sn4a2ywumApYCdffrQmA0R6SMuFA15ksffL2K9uB3GySIYcN9IDB36UKut
         eqcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1LhGXFUxin+q+fh47xU9cakU8CP/mn5Gk+jgVc9l9G8SnpaV65IiboS4FHfUw7HY5cm5jTnKAsmRPzzEIkeVX@lists.infradead.org
X-Gm-Message-State: AOJu0YwRpWvjsgTPiCb5zZS3LahMfYwIK42AMT/pT3a+qDZhzk/uHukG
	2muzE2YxqC4px4nx/mdpxdV6UeYLo8xPmXIL3/ZOwL0rQbOYwe9CgRBcO2zlIC3ylfS1XJsXmfi
	+aQ/iQmzn94ME9Q==
X-Received: from wrqv10.prod.google.com ([2002:a5d:4b0a:0:b0:47f:586c:8371])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cc:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4995e085347mr124527135e9.6.1786179512744;
 Sat, 08 Aug 2026 01:58:32 -0700 (PDT)
Date: Sat,  8 Aug 2026 08:58:23 +0000
In-Reply-To: <20260808085824.732659-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260808085824.732659-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260808085824.732659-3-smostafa@google.com>
Subject: [PATCH v2 2/3] KVM: arm64: Fix timer offsets for non-protected VMs
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	yaoyuan@linux.alibaba.com, Mostafa Saleh <smostafa@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_015835_328203_983D43DF 
X-CRM114-Status: GOOD (  15.80  )
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

With pKVM, protected VMs always have offset of zero.
However, timer offsets for non-protected guests fail to take effect
for two reasons:
1) In __timer_enable_traps(), enabling of traps check for
   is_protected_kvm_enabled() rather than vcpu_is_protected(vcpu)

2) The vcpu timer offsets were never initialised and kept as NULL.

This is problematic for cases when the timer is trapped in the
hypervisor as the with the case of broken CNTVOFF_EL2, which leads
to the hypervisor and host using different offsets and causing VM
hangs.

This can be confirmed by running the arch_timer selftest which fails:
./arch_timer -o 100000000
Random seed: 0x6b8b4567
Guest assert failed,  vcpu 0; stage; 3; iter: 0
==== Test Assertion Failure ====
  arm64/arch_timer.c:137: config_iter + 1 == irq_iter
  pid=310 tid=312 errno=4 - Interrupted system call
Guest assert failed,  vcpu 3; stage; 3; iter: 0
Guest assert failed,  vcpu 1; stage; 3; iter: 0
==== Test Assertion Failure ====
  arm64/arch_timer.c:137: config_iter + 1 == irq_iter
  pid=310 tid=313 errno=4 - Interrupted system call
Guest assert failed,  vcpu 2; stage; 3; iter: 0
==== Test Assertion Failure ====
  arm64/arch_timer.c:137: config_iter + 1 == irq_iter
  pid=310 tid=314 errno=4 - Interrupted system call
[...]

After the fix:

./arch_timer -o 100000000
Random seed: 0x6b8b4567
PASS(vCPU-1).
PASS(vCPU-3).
PASS(vCPU-0).
PASS(vCPU-2)

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: cb0c272acebd ("KVM: arm64: Initialize the hypervisor's VM state at EL2")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 14 ++++++++++++++
 arch/arm64/kvm/hyp/nvhe/timer-sr.c |  6 +++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 24d6f164129a..89f3d5fb55ca 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -529,6 +529,20 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
 	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
+		/*
+		 * Timer offsets are pointing to the untrusted KVM copy,
+		 * which is pinned in __pkvm_init_vm() for the VM life time.
+		 * It is worth noting that hyp_vm->host_kvm points to an EL2
+		 * linear map address and timer_get_offset() will use
+		 * kern_hyp_va() which is safe as it is idempotent.
+		 */
+		vcpu_vtimer(&hyp_vcpu->vcpu)->offset.vm_offset =
+			&hyp_vm->host_kvm->arch.timer_data.voffset;
+		vcpu_ptimer(&hyp_vcpu->vcpu)->offset.vm_offset =
+			&hyp_vm->host_kvm->arch.timer_data.poffset;
+	}
+
 	ret = pkvm_vcpu_init_sysregs(hyp_vcpu);
 	if (ret)
 		goto done;
diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
index ff176f4ce7de..51b4f5010b66 100644
--- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
@@ -45,11 +45,11 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
 	/*
 	 * Disallow physical timer access for the guest
 	 * Physical counter access is allowed if no offset is enforced
-	 * or running protected (we don't offset anything in this case).
+	 * or running a protected VM (we don't offset anything in this case).
 	 */
 	clr = CNTHCTL_EL1PCEN;
-	if (is_protected_kvm_enabled() ||
-	    !kern_hyp_va(vcpu->kvm)->arch.timer_data.poffset)
+	if (vcpu_is_protected(vcpu) ||
+	    !timer_get_offset(vcpu_ptimer(vcpu)))
 		set |= CNTHCTL_EL1PCTEN;
 	else
 		clr |= CNTHCTL_EL1PCTEN;
-- 
2.55.0.654.g21b8a5bc05-goog


