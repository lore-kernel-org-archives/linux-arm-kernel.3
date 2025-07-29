Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3C0C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G6k6rF4VXujQbr0gf19z0lGEBcf3iyQdves2PsQcakU=; b=a+8zXaUSyJ/08wnAP2EgZGXSbx
	9+coausCv20RgbFM4QKzI34lQIl+FLuCU7OKobT48xt7+xv85+bTo58jOHxxeyeQOWYsfy+IsbFqM
	Ja0dOwRvm0K5yEE7n8FBGBpuBF1ieyKbzZrFD7JURo3aluunlBFD9ZXmq8ijPZMkz/ESyCa5HmVpp
	WdymSB2m7OVI+p0B5nlaTmBhji7BQu6+pC8UrRH14IkWOmiYmfDyzf8rcM1eu79LEJ10fz0zBDobw
	6r5gF9rg0ciY+MfS4BRgODx+fn3EzATZtWe8V0hTurqKy2GADDHEVjH7zh80s9zOGyrUnhGlFPAD0
	JqIT+WRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugraR-000000006SV-2Tyw;
	Tue, 29 Jul 2025 21:10:15 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrX9-000000006Ch-0ELe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 21:06:52 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-73e89900fa2so228523a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753823210; x=1754428010; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G6k6rF4VXujQbr0gf19z0lGEBcf3iyQdves2PsQcakU=;
        b=OCoUwnCiP0rEZkZetfuwus/YFQ6E0+1u7ePKMq0/CgATeGTPYjvlwjLCpiHfUVkyb/
         g6QNPavr9t4LCAW8S62XHvLtPa6NGFpd4ljzxwiui7FxWrIVShKY7J8A5i6Tna671Nb0
         py7exjLyKArWfB4NxrAwIn1qdYIO4QuqWgij5N/K9IjlVPGxOtM0za2cRifN4eIzE/6s
         lX2Ps+m1pwYCzCO/s42t3gOjlGLGhxPPw/zReOLoRtwkGsZtaJkPeGxxLUbRobBVOC2O
         qBYLfijim2THujY84gPN2MXgz2qZvX0IUgGNAXV1UHjGfTZhzkBtKpYRpWrAeafsrclD
         IY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753823210; x=1754428010;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6k6rF4VXujQbr0gf19z0lGEBcf3iyQdves2PsQcakU=;
        b=qF2iErAvVPe/1pLjMeFAzIJrYv6XHOH8M3RSWeAr46670NJfRMB8234Q1ugUQdqQHH
         kLDNZeoD1lQ9w8ypUg8yxrAJou79cIbDYQKrZJb6kkGF6wMTswcp/oj1abUBQuZIxPZ+
         xF+wwh0R34LG87bpIOgGTe5VDVgIo35leDyoaFYlTESbGa7DuFDbo0ERpsj4uq/6UrcB
         g8/Ay+mcQ45SmOWYewkR/X9fIe/m+BsmbYMXx57Km0KB0yDWP2FiE9xlKcevS6RtCDOl
         l8gX4UbqHurGPo3hrAQNLfJMPWiGT50FLM3xgsw28utYyFVmjTr9qIvrS9/JAYbifvVE
         Hmxw==
X-Forwarded-Encrypted: i=1; AJvYcCUEtCUf0hmnVKFGvLe1eklInqaJqhMwRgGJvjfdfyjzwbhCw6cVRk0UHuOZDMI3ZBElEVGVDOygxrw8jVX1sA4q@lists.infradead.org
X-Gm-Message-State: AOJu0YzgWUieCmbuqDPMrSqLYpSpBla8ZJyRgqKQ+d/Pj5iUH1mHNzPz
	MSNDGMlQRqLBbpgSaDW15i6P/Mzms3rvyQzvGxBKj0rgONxDXC7CDCiAX/qzXgItBwmYiMaQ1qD
	qrKzh48/R8w==
X-Google-Smtp-Source: AGHT+IEdDyp+BjUiIv+U9x5e1bEY3i3OfuxGF5rUpR2eomh89r+PqVcOQdhBuhPRclIawhrP0gMOvkGnjamH
X-Received: from otbdy16.prod.google.com ([2002:a05:6830:2110:b0:73e:63da:b19e])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:7196:b0:73a:8bf8:56b9
 with SMTP id 46e09a7af769-74177a49ffamr908477a34.1.1753823209769; Tue, 29 Jul
 2025 14:06:49 -0700 (PDT)
Date: Tue, 29 Jul 2025 21:06:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729210644.830364-1-rananta@google.com>
Subject: [PATCH v2] KVM: arm64: Move bundling vLPI and vSGI to vgic_supports_direct_msis()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_140651_126923_F959BCE7 
X-CRM114-Status: GOOD (  14.28  )
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

Commit <c652887a9288> ("KVM: arm64: vgic-v3: Allow userspace to write
GICD_TYPER2.nASSGIcap") bundles the vLPIs and vSGIs behind the
GICD_TYPER2.nASSGIcap field. While the vGIC v4 initialization and
teardown is handled correctly, it erroneously left out the cases when
KVM sets/unset vGIC v4 forwarding, which leads to a kernel panic of the
following nature:

  Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
   Mem abort info:
     ESR = 0x0000000096000044
     EC = 0x25: DABT (current EL), IL = 32 bits
     SET = 0, FnV = 0
     EA = 0, S1PTW = 0
     FSC = 0x04: level 0 translation fault
   Data abort info:
     ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
     CM = 0, WnR = 1, TnD = 0, TagAccess = 0
     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
   user pgtable: 4k pages, 48-bit VAs, pgdp=00000073a453b000
   [00000000000000a8] pgd=0000000000000000, p4d=0000000000000000
   Internal error: Oops: 0000000096000044 [#1] SMP
   pstate: 23400009 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
   pc : its_irq_set_vcpu_affinity+0x58c/0x95c
   lr : its_irq_set_vcpu_affinity+0x1e0/0x95c
   sp : ffff8001029bb9e0
   pmr_save: 00000060
   x29: ffff8001029bba20 x28: ffff0001ca5e28c0 x27: 0000000000000000
   x26: 0000000000000000 x25: ffff00019eee9f80 x24: ffff0001992b3f00
   x23: ffff8001029bbab8 x22: ffff00001159fb80 x21: 00000000000024a7
   x20: 00000000000024a7 x19: ffff00019eee9fb4 x18: 0000000000000494
   x17: 000000000000000e x16: 0000000000000494 x15: 0000000000000002
   x14: ffff0001a7f34600 x13: ffffccaad1203000 x12: 0000000000000018
   x11: ffff000011991000 x10: 0000000000000000 x9 : 00000000000000a2
   x8 : 00000000000020a8 x7 : 0000000000000000 x6 : 000000000000003f
   x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000004
   x2 : 0000000000000000 x1 : ffff8001029bbab8 x0 : 00000000000000a8
   Call trace:
    its_irq_set_vcpu_affinity+0x58c/0x95c
    irq_set_vcpu_affinity+0x74/0xc8
    its_map_vlpi+0x4c/0x94
    kvm_vgic_v4_set_forwarding+0x134/0x298
    kvm_arch_irq_bypass_add_producer+0x28/0x34
    irq_bypass_register_producer+0xf8/0x1d8
    vfio_msi_set_vector_signal+0x2c8/0x308
    vfio_pci_set_msi_trigger+0x198/0x2d4
    vfio_pci_set_irqs_ioctl+0xf0/0x104
    vfio_pci_core_ioctl+0x6ac/0xc5c
    vfio_device_fops_unl_ioctl+0x128/0x370
    __arm64_sys_ioctl+0x98/0xd0
    el0_svc_common+0xd8/0x1d8
    do_el0_svc+0x28/0x34
    el0_svc+0x40/0xb8
    el0t_64_sync_handler+0x70/0xbc
    el0t_64_sync+0x1a8/0x1ac
   Code: 321f0129 f940094a 8b080148 d1400900 (39000009)
   ---[ end trace 0000000000000000 ]---

Fix this by moving the bundling logic to vgic_supports_direct_msis()
instead. This would still handle the vGIC v4 initialization
appropriately, while also helping with the vLPI set/unset forwarding.

Fixes: c652887a9288 ("KVM: arm64: vgic-v3: Allow userspace to write GICD_TYPER2.nASSGIcap")
Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c |  8 ++++++++
 arch/arm64/kvm/vgic/vgic.h         | 10 +---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index a3ef185209e9..70d50c77e5dc 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -50,6 +50,14 @@ bool vgic_has_its(struct kvm *kvm)
 
 bool vgic_supports_direct_msis(struct kvm *kvm)
 {
+	/*
+	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
+	 * indirectly allowing userspace to control whether or not vPEs are
+	 * allocated for the VM.
+	 */
+	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
+		return false;
+
 	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 1384a04c0784..de1c1d3261c3 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -396,15 +396,7 @@ bool vgic_supports_direct_sgis(struct kvm *kvm);
 
 static inline bool vgic_supports_direct_irqs(struct kvm *kvm)
 {
-	/*
-	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
-	 * indirectly allowing userspace to control whether or not vPEs are
-	 * allocated for the VM.
-	 */
-	if (system_supports_direct_sgis())
-		return vgic_supports_direct_sgis(kvm);
-
-	return vgic_supports_direct_msis(kvm);
+	return vgic_supports_direct_msis(kvm) || vgic_supports_direct_sgis(kvm);
 }
 
 int vgic_v4_init(struct kvm *kvm);

base-commit: 18ec25dd0e97653cdb576bb1750c31acf2513ea7
-- 
2.50.1.552.g942d659e1b-goog


