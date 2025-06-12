Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3A2C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCkqRQ65xZAC1T38W5bWrrAPN4EJG3gT3DO5Cch9Ys0=; b=m+MA1m5HCl1i4DDYUOWLNMenBA
	+J4gfGaXxvONcMRfz7a5bSLDZaQKEZDNWx4WrM71wbwzNHMVk+ohzvYbaEiF5M/krymmxFNvnIosR
	LTn0SxheSREGdNyfe60640BV1uw8hoR/ABStEEJ5FnVNFIlHOu31kEOthCSXZOsouXB5AmFTjh9qC
	lzKGDn5i8Xoxbg556adGuAPYEAayIFrqhg+q3FbtnC6umkKWWWwLEV/42+4i6gmIbcmaFCUGjecP2
	nvh5JrbE4WkfdFo/dNHbMLBrcYcHZc9hqyPSRxHvaPzySzFhPNtFgVQGbD+vMFxRfqgMMBYqBD2Br
	XLe5Cixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpM-0000000EHGk-3heG;
	Thu, 12 Jun 2025 19:43:08 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj0o-0000000DdQ2-1cxC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:34:39 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311d670ad35so1051536a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749738877; x=1750343677; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCkqRQ65xZAC1T38W5bWrrAPN4EJG3gT3DO5Cch9Ys0=;
        b=yo4XhfN3hLgi4l7D5cv1k8aMuonl/U0NpyxYFtl5CongYp/MRuQPdUU2M06m5YJFl1
         h3V961mUHUarVquB2+Zj/0mKIu3p91/y3JndW2Vm2m9DUsPpHf34BTqVkQbQYl9Q8r/r
         8pU1sQan+/APpyMgde3SJWZCHcB9FcTiwaKBBoFE6z4NCoeM+2cAdcdp8bQYgkM02e7P
         auNB1HUZRgLLAeYjSXIKu/NC/x6gHsDFazCc1V8jWWQeoGI57kIiMPE3AhWQzag3mV8e
         nFbyEDk7NKa7wmW6EhJ/KT5jyxtaRfTaSOtkTrRnzXFhj++i9f3gQ+mZPVkVmgPSvn1s
         KU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738877; x=1750343677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCkqRQ65xZAC1T38W5bWrrAPN4EJG3gT3DO5Cch9Ys0=;
        b=WM3fok+hNQn9UgLZ1w9/PAoVe23G8ONgddV8M5jHctrcrrPOf1/p7D9dd2L/1dZbsy
         PcW6xPo5ITcOq4IXK/EE1ch1oH8NxD+SM1SEEDykFOseQ3UTnmJjLq4NpDZYL2xaA/ab
         wM201mh4LNInd63EWkgKdxZl5TxB+Ts14ec/hNTkeiY8ooJdGy33oH8eBqPqsFlsX3a6
         8CXoVTVoJRZUf2+WnXCEZrloTGyVzYuqNq9rbTLDxDpEOkpudLSDgbF8eJJBztRaKMmv
         w9lUXtEPZkNpFkesjLt6dXQCCB5b7b1A0/MaVvr1iyFLwVP2NLSQqGn5oL0kpnpwtd2h
         Bd6w==
X-Forwarded-Encrypted: i=1; AJvYcCXT1lMRaTJb8PUKq2Pwpv9F94dJGCEpeVc1STQzY4zHDMr+lXwrLMtUtoN4HSP8n5VhZUPZa3w1+jxlIrMfKdVe@lists.infradead.org
X-Gm-Message-State: AOJu0YzBnuFtv0Qx/jF+Z5/uzYxvVdST4xhc0BQj7LjRJ8GmnGH21ev6
	E64xG7rrqDV6VVT1pk8isCehk5G4BZ/W8qknwQkAh7qfuMdp9V85lj+N9JBrCyiEP60JU7v/dfX
	NNk0aMg==
X-Google-Smtp-Source: AGHT+IFvgFX45fAef1k8uZ/3DR+A7ppsnjKdR6QYSkMmUdo4ZfmyvklPkUSYEBb4bT/S6wp2Q15cPG3uYow=
X-Received: from pjbof7.prod.google.com ([2002:a17:90b:39c7:b0:312:e5dd:9248])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:48c1:b0:311:ea13:2e63
 with SMTP id 98e67ed59e1d1-313d7dda00fmr200540a91.13.1749738876902; Thu, 12
 Jun 2025 07:34:36 -0700 (PDT)
Date: Thu, 12 Jun 2025 07:34:35 -0700
In-Reply-To: <86tt4lcgs3.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org>
Message-ID: <aErlezuoFJ8u0ue-@google.com>
Subject: Re: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073438_448001_97F4DFD6 
X-CRM114-Status: GOOD (  28.72  )
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

On Thu, Jun 12, 2025, Marc Zyngier wrote:
> On Wed, 11 Jun 2025 23:45:05 +0100,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > WARN if unmapping a vLPI in kvm_vgic_v4_unset_forwarding() fails, as
> > failure means an IRTE has likely been left in a bad state, i.e. IRQs
> > won't go where they should.
> 
> I have no idea what an IRTE is.

Sorry, x86 IOMMU terminology (Interrupt Remapping Table Entry).  I think the GIC
terminology would be ITS entry?  Or maybe ITS mapping?

> But not having an VLPI mapping for an interrupt at the point where we're
> tearing down the forwarding is pretty benign. IRQs *still* go where they
> should, and we don't lose anything.

This is the code I'm trying to refer to:

  static int its_vlpi_unmap(struct irq_data *d)
  {
	struct its_device *its_dev = irq_data_get_irq_chip_data(d);
	u32 event = its_get_event_id(d);

	if (!its_dev->event_map.vm || !irqd_is_forwarded_to_vcpu(d))  <=== this shouldn't happen?
		return -EINVAL;

	/* Drop the virtual mapping */
	its_send_discard(its_dev, event);

	/* and restore the physical one */
	irqd_clr_forwarded_to_vcpu(d);
	its_send_mapti(its_dev, d->hwirq, event);
	lpi_update_config(d, 0xff, (lpi_prop_prio |
				    LPI_PROP_ENABLED |
				    LPI_PROP_GROUP1));

	/* Potentially unmap the VM from this ITS */
	its_unmap_vm(its_dev->its, its_dev->event_map.vm);

	/*
	 * Drop the refcount and make the device available again if
	 * this was the last VLPI.
	 */
	if (!--its_dev->event_map.nr_vlpis) {
		its_dev->event_map.vm = NULL;
		kfree(its_dev->event_map.vlpi_maps);
	}

	return 0;
  }

When called from kvm_vgic_v4_unset_forwarding()

	if (irq->hw) {
		atomic_dec(&irq->target_vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vlpi_count);
		irq->hw = false;
		ret = its_unmap_vlpi(host_irq);
	}

IIUC, irq->hw is set if and only if KVM has configured the IRQ to be fowarded
directly to a vCPU.  Based on this comment in its_map_vlpi(): 

	/*
	 * The host will never see that interrupt firing again, so it
	 * is vital that we don't do any lazy masking.
	 */

and this code in its_vlpi_map():


		/* Drop the physical mapping */
		its_send_discard(its_dev, event);

my understanding is that the associated physical IRQ will not be delivered to the
host while the IRQ is being forwarded to a vCPU.

irq->hw should only become true for MSIs (I'm crossing my fingers that SGIs aren't
in play here) if its_map_vlpi() succeeds:

	ret = its_map_vlpi(virq, &map);
	if (ret)
		goto out_unlock_irq;

	irq->hw		= true;
	irq->host_irq	= virq;
	atomic_inc(&map.vpe->vlpi_count);

and so if its_unmap_vlpi() fails in kvm_vgic_v4_unset_forwarding(), then from KVM's
perspective, the worst case scenario is that an IRQ has been left in a forwarded
state, i.e. the physical mapping hasn't been reinstalled.

KVM already WARNs if kvm_vgic_v4_unset_forwarding() fails when KVM is reacting to
a routing change (this is the WARN I want to move into arch code so that
kvm_arch_update_irqfd_routing() doesn't plumb a pointless error code up the stack):

		if (irqfd->producer &&
		    kvm_arch_irqfd_route_changed(&old, &irqfd->irq_entry)) {
			int ret = kvm_arch_update_irqfd_routing(
					irqfd->kvm, irqfd->producer->irq,
					irqfd->gsi, 1);
			WARN_ON(ret);
		}

It's only the kvm_arch_irq_bypass_del_producer() case where KVM doesn't WARN.  If
that fails, then the IRQ has potentially been left in a forwarded state, despite
whatever driver "owns" the physical IRQ having removed its producer.  E.g. if VFIO
detaches its irqbypass producer and gives the device back to the host, then
whatever is using the device in the host won't receive IRQs as expected.

Looking at this again, its_free_ite() also WARNs on its_unmap_vlpi() failure, so
wouldn't it make sense to have its_unmap_vlpi() WARN if irq_set_vcpu_affinity()
fails?  The only possible failures are that the GIC doesn't have a v4 ITS (from
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

All of those failure scenario seem like warnable offences when KVM thinks it has
configured the IRQ to be forwarded to a vCPU.

E.g.

--
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 534049c7c94b..98630dae910d 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -758,7 +758,7 @@ static void its_free_ite(struct kvm *kvm, struct its_ite *ite)
        if (irq) {
                scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
                        if (irq->hw)
-                               WARN_ON(its_unmap_vlpi(ite->irq->host_irq));
+                               its_unmap_vlpi(ite->irq->host_irq);
 
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
-               ret = its_unmap_vlpi(host_irq);
+               its_unmap_vlpi(host_irq);
        }
 
        raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
        vgic_put_irq(kvm, irq);
-       return ret;
+       return 0;
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
-       return irq_set_vcpu_affinity(irq, NULL);
+       WARN_ON_ONCE(irq_set_vcpu_affinity(irq, NULL));
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



