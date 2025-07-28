Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80689C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g1ZZrV9iF8dYVdhyBL4d5b4ftcnLDouNaKEg4YWgOvI=; b=HzhdJfKm9cRlslITn6WFeAkcvc
	fqP+ke4TvQOqUOGlSnkPuNaLfaNQ35DM2TDNv1kYnYX33p4FZD2ytCMin6hPYkrl2/XFxW2QqR7t6
	3zsZXiOap8Gef8Had2RP7VM9/+xkY6x7B41NnaW2ICOMfTrWWMb9l9MSJp6e/fZTx2sj8su//yTZH
	/R/3rWJyWQjxeP70ac1eSA/Pz+CLMjaZvK/UrsRR2ThqO214Uo59Cc2s8ynoXa4cHJltddX64yJCF
	IQpidPqtZZDwON3OBsqlpjY/9xiL/kbvt1X05kEyfZcoI9Nv5zkgsJRVQjMdOeQ6uKpFMoRyFAue9
	5xRu1tiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWWs-0000000FXh3-0nKv;
	Mon, 28 Jul 2025 22:41:10 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWT5-0000000FXT8-21P4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 22:37:16 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-615bfe1dd7bso4176524eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753742234; x=1754347034; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g1ZZrV9iF8dYVdhyBL4d5b4ftcnLDouNaKEg4YWgOvI=;
        b=fAd9ZC4zaypx041LwKhUleeHv51+2KVy0tWhvvpZuNlO/k80ii3FsEsE9BRnQgS66K
         tqXDnm8ZDNvLVXmxW01tPNSLM24PSi9Ax9I/vYWR983M7lO0aG5aRYtE3dSVmgQPa2uO
         veHkCmIzIdgtym1rVx5majf6grxDVXX4Gjk+J3ujgV/ejbzAm4x1iyo49b4maH1B6Sp2
         zNtFWqbRzUaAC4r+A/Ye8i0RejxR/iPHse4eGW3WlFKxN3kvAjC3Pfr//Wqjzp/0KJQ5
         bski8acRmo2wRQEZMCg4+RcxidORidqSrobiOOCwtc2BHUhTDVXwDyYkYBKLN8qQ29g4
         HZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753742234; x=1754347034;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1ZZrV9iF8dYVdhyBL4d5b4ftcnLDouNaKEg4YWgOvI=;
        b=xIrNrKk5j7td2Qc1SRh6GQdoerngydOBEb/lcJYNEPMelqqzMzZgGzYoPOJoWblYl2
         AX8lBCahpegy8QBpzjDLzNLI5a7XoG0lXTCZul5WExkDjW4uPKNY2uJI1lBjF2RStwds
         R6ULgDMUlqvjCtNn1+MR6P2Sv/xSkoav3tS8yNjO+MhZm6kvik3wUteuCHpBCouD9iN0
         k54GWctPtqx6JQzsx9UFhLReZGOFmw0CEBDAI1GgsvGHkHgY/RJ8wN9BPUAq5A1uvk0I
         Vnm77e6w/0+MqXtuj4bomofnPuEguALWfr7QVcO+BzxfsicEjQi7EVvhOmBj3Xo+1jC6
         /7jw==
X-Forwarded-Encrypted: i=1; AJvYcCWZOrW8P8uOzTDfumRmAQJK07W+5trY1C92LxE1+bn+YUTd3A9W2lmmiJDQoIWlXYH4uw/PrhnsY7kHaDucXXJJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhs/oD4Nn0ExgkHbkzbf6YXbVe9nwyoEWeyUO7HPvxj8UWwhFA
	nOL8C6bJQ4dtz7If9toMHoIY2R4+Fs8b+Sp/fdfzkNQurrPt4BN/WahP5Oc1QzMKGC6c2uiev4g
	paPC/RBNQiA==
X-Google-Smtp-Source: AGHT+IFMRJ908vvsWj70nTjQOvVm1PrziYCGSb3/MxBBTKnv0C5mcFnYcmNsuxDQFYN+4WMHi8+Bkj1Y0O5E
X-Received: from oabld4.prod.google.com ([2002:a05:6870:2b04:b0:2bc:69a2:7ea5])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:1b83:b0:306:9f8e:6699
 with SMTP id 586e51a60fabf-30701faa8b5mr8749981fac.30.1753742233877; Mon, 28
 Jul 2025 15:37:13 -0700 (PDT)
Date: Mon, 28 Jul 2025 22:37:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250728223710.129440-1-rananta@google.com>
Subject: [PATCH] KVM: arm64: Set/unset vGIC v4 forwarding if direct IRQs are supported
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_153715_524594_DC801A0E 
X-CRM114-Status: GOOD (  13.85  )
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

Fix this by checking if vgic_supports_direct_irqs() while
setting/unsetting vGIC v4 forwarding as well.

Fixes: c652887a9288 ("KVM: arm64: vgic-v3: Allow userspace to write GICD_TYPER2.nASSGIcap")
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index e7e284d47a77..873a190bcff7 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -433,7 +433,7 @@ int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
 	unsigned long flags;
 	int ret = 0;
 
-	if (!vgic_supports_direct_msis(kvm))
+	if (!vgic_supports_direct_irqs(kvm))
 		return 0;
 
 	/*
@@ -533,7 +533,7 @@ int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
 	unsigned long flags;
 	int ret = 0;
 
-	if (!vgic_supports_direct_msis(kvm))
+	if (!vgic_supports_direct_irqs(kvm))
 		return 0;
 
 	irq = __vgic_host_irq_get_vlpi(kvm, host_irq);

base-commit: 18ec25dd0e97653cdb576bb1750c31acf2513ea7
-- 
2.50.1.487.gc89ff58d15-goog


