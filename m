Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73013C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NErYkcwCW0ofBX6e5hYOIbXlxwjpJ4sRagkANyVcFH4=; b=gl4LFprMWtcnODRGsejxzOv+2t
	VzaVS4NhkRpOyaebFSsCWJ0CCRamBU2SEKqv8YCsws4XA9mr64wd+moNVwH0gaGpRdAREoSBw5da0
	JwYRmlrL9uQja36S0VrdWJAaJbqGmRv1ZjLmoZErRw1VBAoWdNobsoPthFU0W5M24YvbMB+SpS2/R
	WuT2+Kkv5x4WpIMWpHT1bi1tKe4ye4yu8UMwglj43m0gpEWsIRslmPM09CjFbeAxxPrPqwb53RrYq
	ou6Vdg/68cWB7IWlkhnhgNkiDDHXCjYAnWYikonYdMZZnBK3T5O2OeKdAh5PxxXsz7TQjpZUfGtYF
	XCs5rf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfZq-0000000GF4Z-1keh;
	Fri, 20 Jun 2025 17:30:58 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfRj-0000000GDss-0YG4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 17:22:36 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-313f8835f29so2748393a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750440154; x=1751044954; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NErYkcwCW0ofBX6e5hYOIbXlxwjpJ4sRagkANyVcFH4=;
        b=l/03zbkd6RBdH5kiUSrF974GHvAsLWxRyR3g5DC9TQ3pJI8CNK3D2OoSW8k4dwucXr
         oIgAW/Ea1Lck0MbUua/c8WMR4ZrD+Idf7zKvHIJdLtkSXFp1PrHKNbsZqjctruBx/9xd
         cN1/yQeY+nNbJWPo19aEEZXvGUh58R7870oew4Blly7Tw4RDlyAFHdD284GPBnb+xKFC
         uhcwe4+Eo00x6iaKstn3Y8Ujml5iJNEUVX6mHoMR5OfRnN3KAycbJ7uXqp9ABqYfB8ke
         eZZoK79myVYmM2j6LrsdeTlRf4vf7S+k/NeI30OmZQdnz6K+8zYWpRCzwfj9lzNnuPQY
         x9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440154; x=1751044954;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NErYkcwCW0ofBX6e5hYOIbXlxwjpJ4sRagkANyVcFH4=;
        b=g4v0sQOxy76fQ4mu6OGK697R/dfg4wYKxhF2VXoqI8oAIwVi3h3g8RnP5tJ6wUvor6
         wO8Nn/goQsJxzvb2fTpqyFrAHB+c+Kquphz83NOFz9Q2pPGg+t7DmJ/NG5qITmfmvUgF
         4GDYxKJvKlSrFLg1rbmc9GeVL6d82qUCN+jLDP0w7EEQUOUiaIblnozXt1OGmaHSfoOQ
         x4P6f7NX042RAjFhjb45DCnHiRMjLHBEFjVxl/ZxOJr99rEKs/R/61EmCa1jGrNeWWUT
         2kHttlMR3pAHlL2C6/SAEydtt+OkTyjO89wV5aPxDiBoOPeCKltu0XOuAc1U8cc4sSEo
         rWNg==
X-Forwarded-Encrypted: i=1; AJvYcCU6TpJ2k8lJN5+9+yT3j/WzjhhrYCmwIPVVp+nmEY3yr3CVeKdOyukMmM5CPTq/t2IsI9iWBCCruTtQLOUdfwVT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw404rO1chsT/praHBC4VQn5n3bx8nnmJeCfdecNckpGXAQZxe
	7bwF0xcrWgtjse3rligI0aB6FbjB+SPtz4eYOQeaGZwc2mlWGJ++fJFsOh1KrpyS44OOwdJ2Sx2
	gAkB9Kg==
X-Google-Smtp-Source: AGHT+IHXGxBdpxT88k3O204/zN4ifc12tJw1aK+nMcKj7rx2Ml8z17hcOCexso6J6CnRpxLft2px3MEAX6w=
X-Received: from pjbpl17.prod.google.com ([2002:a17:90b:2691:b0:311:4aa8:2179])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c883:b0:311:ab20:159a
 with SMTP id 98e67ed59e1d1-3159d8d9098mr6199506a91.29.1750440153664; Fri, 20
 Jun 2025 10:22:33 -0700 (PDT)
Date: Fri, 20 Jun 2025 10:22:32 -0700
In-Reply-To: <aEyOcJJsys9mm_Xs@linux.dev>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org> <aErlezuoFJ8u0ue-@google.com> <aEyOcJJsys9mm_Xs@linux.dev>
Message-ID: <aFWY2LTVIxz5rfhh@google.com>
Subject: Re: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_102235_169891_F5C48695 
X-CRM114-Status: GOOD (  31.27  )
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

On Fri, Jun 13, 2025, Oliver Upton wrote:
> On Thu, Jun 12, 2025 at 07:34:35AM -0700, Sean Christopherson wrote:
> > On Thu, Jun 12, 2025, Marc Zyngier wrote:
> > > But not having an VLPI mapping for an interrupt at the point where we're
> > > tearing down the forwarding is pretty benign. IRQs *still* go where they
> > > should, and we don't lose anything.
> 
> The VM may not actually be getting torn down, though. The series of
> fixes [*] we took for 6.16 addressed games that VMMs might be playing on
> irqbypass for a live VM.
> 
> [*] https://lore.kernel.org/kvmarm/20250523194722.4066715-1-oliver.upton@linux.dev/
> 
> > All of those failure scenario seem like warnable offences when KVM thinks it has
> > configured the IRQ to be forwarded to a vCPU.
> 
> I tend to agree here, especially considering how horribly fragile GICv4
> has been in some systems. I know of a couple implementations where ITS
> command failures and/or unmapped MSIs are fatal for the entire machine.
> Debugging them has been a genuine pain in the ass.
> 
> WARN'ing when state tracking for vLPIs is out of whack would've made it
> a little easier.

Marc, does this look and read better?

I'd really, really like to get this sorted out asap, as it's the only thing
blocking the series, and I want to get the series into linux-next early next
week, before I go OOO for ~10 days.

--
From: Sean Christopherson <seanjc@google.com>
Date: Thu, 12 Jun 2025 16:51:47 -0700
Subject: [PATCH] KVM: arm64: WARN if unmapping a vLPI fails in any path

When unmapping a vLPI, WARN if nullifying vCPU affinity fails, not just if
failure occurs when freeing an ITE.  If undoing vCPU affinity fails, then
odds are very good that vLPI state tracking has has gotten out of whack,
i.e. that KVM and the GIC disagree on the state of an IRQ/vLPI.  At best,
inconsistent state means there is a lurking bug/flaw somewhere.  At worst,
the inconsistency could eventually be fatal to the host, e.g. if an ITS
command fails because KVM's view of things doesn't match reality/hardware.

Note, only the call from kvm_arch_irq_bypass_del_producer() by way of
kvm_vgic_v4_unset_forwarding() doesn't already WARN.  Common KVM's
kvm_irq_routing_update() WARNs if kvm_arch_update_irqfd_routing() fails.
For that path, if its_unmap_vlpi() fails in kvm_vgic_v4_unset_forwarding(),
the only possible causes are that the GIC doesn't have a v4 ITS (from
its_irq_set_vcpu_affinity()):

        /* Need a v4 ITS */
        if (!is_v4(its_dev->its))
                return -EINVAL;

        guard(raw_spinlock)(&its_dev->event_map.vlpi_lock);

        /* Unmap request? */
        if (!info)
                return its_vlpi_unmap(d);

or that KVM has gotten out of sync with the GIC/ITS (from its_vlpi_unmap()):

        if (!its_dev->event_map.vm || !irqd_is_forwarded_to_vcpu(d))
                return -EINVAL;

All of the above failure scenarios are warnable offences, as they should
never occur absent a kernel/KVM bug.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c     | 2 +-
 arch/arm64/kvm/vgic/vgic-v4.c      | 4 ++--
 drivers/irqchip/irq-gic-v4.c       | 4 ++--
 include/linux/irqchip/arm-gic-v4.h | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 534049c7c94b..98630dae910d 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -758,7 +758,7 @@ static void its_free_ite(struct kvm *kvm, struct its_ite *ite)
 	if (irq) {
 		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
 			if (irq->hw)
-				WARN_ON(its_unmap_vlpi(ite->irq->host_irq));
+				its_unmap_vlpi(ite->irq->host_irq);
 
 			irq->hw = false;
 		}
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 193946108192..911170d4a9c8 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -545,10 +545,10 @@ int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
 	if (irq->hw) {
 		atomic_dec(&irq->target_vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vlpi_count);
 		irq->hw = false;
-		ret = its_unmap_vlpi(host_irq);
+		its_unmap_vlpi(host_irq);
 	}
 
 	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
 	vgic_put_irq(kvm, irq);
-	return ret;
+	return 0;
 }
diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 58c28895f8c4..8455b4a5fbb0 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -342,10 +342,10 @@ int its_get_vlpi(int irq, struct its_vlpi_map *map)
 	return irq_set_vcpu_affinity(irq, &info);
 }
 
-int its_unmap_vlpi(int irq)
+void its_unmap_vlpi(int irq)
 {
 	irq_clear_status_flags(irq, IRQ_DISABLE_UNLAZY);
-	return irq_set_vcpu_affinity(irq, NULL);
+	WARN_ON_ONCE(irq_set_vcpu_affinity(irq, NULL));
 }
 
 int its_prop_update_vlpi(int irq, u8 config, bool inv)
diff --git a/include/linux/irqchip/arm-gic-v4.h b/include/linux/irqchip/arm-gic-v4.h
index 7f1f11a5e4e4..0b0887099fd7 100644
--- a/include/linux/irqchip/arm-gic-v4.h
+++ b/include/linux/irqchip/arm-gic-v4.h
@@ -146,7 +146,7 @@ int its_commit_vpe(struct its_vpe *vpe);
 int its_invall_vpe(struct its_vpe *vpe);
 int its_map_vlpi(int irq, struct its_vlpi_map *map);
 int its_get_vlpi(int irq, struct its_vlpi_map *map);
-int its_unmap_vlpi(int irq);
+void its_unmap_vlpi(int irq);
 int its_prop_update_vlpi(int irq, u8 config, bool inv);
 int its_prop_update_vsgi(int irq, u8 priority, bool group);
 

base-commit: 4fc39a165c70a49991b7cc29be3a19eddcd9e5b9
--

