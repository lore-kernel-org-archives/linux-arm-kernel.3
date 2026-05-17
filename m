Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C874CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Td6FiAaTmTkeflxhImr5px9zzqspJuHFjJUaI/KnqV4=; b=iq2ZYOr59cGPmGvyKaCwcdeW5e
	vnhIJmSJCvbxP3O63kz26gzoOq5IJTy350MsuMgOICXiMTzNJBj3+/rcVB3OMVd5cLUpSfH0Zijes
	4O6kqN+QM27wQRAgkSGBwvpDdOK/hHNkLhOaM31+IlvyyxazvlLkXmvOtyl/j0nHgUZYCPSWXJr1y
	E82LWKs4eDPju+4fny4nn0dPIkjyPYel6G1ChnlQ4hOxvBzqqmlE0odTp6Zrx3o3PdRMUu6WvhM2T
	AsOPdLocczJy+X3uR2fB76fSFm+0tMexVx9QQDx69FfE54UlSDB/fvPgzVOd688ieh3nMMBpaylPx
	QBuTs7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfze-0000000DBvw-03EP;
	Sun, 17 May 2026 18:13:38 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfzc-0000000DBvU-19XF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:13:37 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-912575fa768so331518685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041615; x=1779646415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Td6FiAaTmTkeflxhImr5px9zzqspJuHFjJUaI/KnqV4=;
        b=fwDGkeeEgmoVAcAr94D2sfEoUqR1m/uGK5LKCxRHu/AW0DaB7FoE86yIJxpntbD5yi
         9KLFLO8yP9lIwVxOcy2AMhWalSjsbYtjg2iNUUyE0GdYVtPtPH5nNWIC/QYthN7DRw1M
         /y+TiGPfPRJGdBxPldRujlSiR9Na6g4Odty6HxNzG16qlfknk7N8v8j6Fi4Pyx33pc3c
         y+a2rXX1DpETd6prevXJQ8kqG8XV+seGwP3oUGPPFhqJ1AV4KjxdVzegOIH5T+HkLghs
         cRwXurPQf2daGUBfhwqLWSd/KRZ4j9UkZmtbJURiozShSBkWY4OcsMdSoI8kP2fl9nWI
         XM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041615; x=1779646415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td6FiAaTmTkeflxhImr5px9zzqspJuHFjJUaI/KnqV4=;
        b=CnuChiQqEdrpb4V+oY8X+6SaBeTFPEgkXPDPjRiKE2BaLClLIkX8vlLL4MfasdgQxn
         rfwvuI/CPCYgjDszNYhkPHIDUPovPwDhggW6DoCiW1fevb/v8Q5fqn4rQsdXacwwiugA
         8Uua2AjsqljAO7AOlElTB5N4EpGnFtUqaUh5AJWVqfohOdzkZxLXBEnsAJ1HJR1ruVc8
         FAflg9NEpHqV1kpudArwMiwGS0oLg+ASFqec8x6to3LeqYiMVz3ItlqhUXZysU+FkGhO
         pRQ8bXajTUHXu6db6HzAUBXYbMKTkCyS7UdMQGgsli9e/FkyzdB8jGht/Dr+Ylk+5mTw
         DP5A==
X-Forwarded-Encrypted: i=1; AFNElJ/KvJiwktqXofIyIx7H3AhPjXTdr7uDNVdJrU1+/Qf3GPIm6QVb6mWYmFKJpVYG2+XCBp30v2GEevw+QfjHuoYL@lists.infradead.org
X-Gm-Message-State: AOJu0YwfzEEAVZxKOLF53mIfxzywnScaVQbm78m/8ctxzQjn4rhXqqnS
	nvgBdpnKl95PaspQ20EU1f/DyMeTm3a6hdpoE4DRjgxAZuQKuDMa/gKu
X-Gm-Gg: Acq92OEu7I+Bz2/VMdPcQPKdSe5QMt47Iepazqfsu5NUCraBJQraTh/Gs2IqQDGkR2R
	MKMNbEVG63Hj4+N0+H1PpogN+zBJU8CAa4wY8K4ewi6atqp3R90t+BWIsln4jS9TCSUiM23xbVG
	Do6RWEUYKMk4W3/m9vuI0bsgimSH88jc4ZSSwWLWO7NeMOuFh7xB4B/ta6DAktpgn0jS1ZlfkVR
	vF/1NJ5uI9IaFsnMw+9ebZ59EHtNu5u6xjuO/m3ypFToKOI0ttn0Ks9B++sn/YJC7bgWoyJtmhf
	2MqZHAXBobc9TwK+g5gFP12nS9IqNPNfC6CIMb+wNvmU2+P8TLCKsDZncJb/9dX6U23t1Q2cW3k
	GILoXN6pdJyNzMWqIaOfA1ZiXRATC/BKIRfy2Wn0fgQkMT3qQo5smXVWhlk782PDQJp1kLhGEiY
	h/lOl+97VSW2H4YcK7iJnEusLawmQo3mqlufLeXip1qIt0v6+INHLEnVcUnROkjgNv1ezmmuSQE
	ZjfhSB2sF9/ZZuHaoz3NhmlBI/kct6yodk3XSHFw2c=
X-Received: by 2002:a05:620a:45a9:b0:910:87f4:9a26 with SMTP id af79cd13be357-911cde539fbmr1929262685a.41.1779041614662;
        Sun, 17 May 2026 11:13:34 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc936407sm1237378485a.22.2026.05.17.11.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:13:34 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic: free private_irqs when init fails after allocation
Date: Sun, 17 May 2026 14:13:31 -0400
Message-ID: <20260517181331.367676-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111336_330702_561998F9 
X-CRM114-Status: GOOD (  14.53  )
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

Companion to commit 250f25367b58 ("KVM: arm64: Tear down vGIC on failed
vCPU creation"), which added the missing kvm_vgic_vcpu_destroy() call
to the kvm_share_hyp() failure path in kvm_arch_vcpu_create().  The
kvm_vgic_vcpu_init() failure path immediately above it has the same
shape and still needs the same cleanup.

If kvm_vgic_vcpu_init() allocates per-vCPU private IRQs via
vgic_allocate_private_irqs_locked() and then vgic_register_redist_iodev()
fails (for example when kvm_io_bus_register_dev() runs out of MMIO-bus
slots, or vgic_v3_check_base() rejects the configuration), the function
returns the error without freeing the private-IRQ allocation.

The caller kvm_arch_vcpu_create() returns this error directly, and
kvm_vm_ioctl_create_vcpu() jumps to vcpu_free_run_page on
kvm_arch_vcpu_create() failure, which does not invoke
kvm_arch_vcpu_destroy().  The vCPU struct is then released via
kmem_cache_free(kvm_vcpu_cache, ...), dropping the only reference to
the leaked allocation.

The comment block above __kvm_vgic_vcpu_destroy() explicitly anticipates
this case ("vCPUs that failed creation are torn down outside of the
kvm->arch.config_lock ... it is both safe and necessary to do so
here"), but the caller never actually invokes the destroy primitive on
the kvm_vgic_vcpu_init() error path.  Call it now, mirroring the shape
of the kvm_share_hyp() cleanup added by 250f25367b58.

Per-failure leak is VGIC_NR_PRIVATE_IRQS * sizeof(struct vgic_irq),
roughly 3.8 KiB rounded up to 4 KiB by the kmalloc-cg-4k slab.  On
systems whose /dev/kvm policy lets unprivileged users open the device
this is reachable to any local user; reach is policy-dependent and
varies by distro and packager.

Confirmed with kmemleak on v7.1-rc1+: 50 failed KVM_CREATE_VCPU
attempts (run with the per-VM MMIO bus pre-filled to NR_IOBUS_DEVS so
vgic_register_redist_iodev() returns -ENOSPC) leave 49 unreferenced
4096-byte blocks whose allocation backtrace is

  __kmalloc_noprof+0x390/0x4d0
  vgic_allocate_private_irqs_locked+0x68/0x1c8
  kvm_vgic_vcpu_init+0x78/0xd8

With this patch applied to the same tree, kmemleak reports zero
unreferenced objects under the identical workload.

Cc: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>
Assisted-by: Claude:claude-opus-4-7

Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 arch/arm64/kvm/arm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 176cbe8baad30..5d5e2f81b9c94 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -554,8 +554,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_destroy_mpidr_data(vcpu->kvm);
 
 	err = kvm_vgic_vcpu_init(vcpu);
-	if (err)
+	if (err) {
+		kvm_vgic_vcpu_destroy(vcpu);
 		return err;
+	}
 
 	err = kvm_share_hyp(vcpu, vcpu + 1);
 	if (err)
-- 
2.53.0


