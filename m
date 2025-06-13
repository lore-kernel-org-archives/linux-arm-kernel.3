Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35444C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3QpAmNx5DNk1sdY/iNHtbL5cVsrP4TaKvA4vwlUxSU=; b=ku9dWM+DQ2MM1N9nvnHL164DsU
	6XXVUH1zb1CcmcLRdoe6i9WlxxOrLXTeG5XLf3BWVyBuisdHB1eggpEpuXkYAK6v4p4KQ6HQmc+da
	4NuZUxL+o2Sr5IwO+6cTkO6XsexkYldA30hyanPSi/vcXpfh9IkKQ7Pmd8zXIXorPKRp6g2lDEnUD
	nVaF+8eySVcOLdTxQDQWZLms+sLTKtZvimAraERnpXpeL8m8FlV6um9KSD2i/9wv5UCuUXkELBzln
	iCnxP7XioCHckmKocxmgFsB02K3lCUi9LT+dJdem8Pd5raeOQWsnXdk0boVDw8d9jobmdeALH+wnt
	yOlLR70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBLw-000000002Cw-3S1R;
	Fri, 13 Jun 2025 20:50:20 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBJm-0000000021R-2El4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 20:48:08 +0000
Date: Fri, 13 Jun 2025 13:47:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749847671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g3QpAmNx5DNk1sdY/iNHtbL5cVsrP4TaKvA4vwlUxSU=;
	b=AqDvl1P8NSuH5w8c2k3rrqa4tztuUbtzwZhM8R58zilGZUEQn3cguoYb3i7WeQil7suGSN
	TUl3XKReXwAFZSIE40AuXO/BLTeer3hKffnbZb/Q2xvuMFJgLwLYcVAtx4dcUND5W926Fm
	Nikn5r4AiputfvGWyYEK/a9eli+bP1g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
Message-ID: <aEyOcJJsys9mm_Xs@linux.dev>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org>
 <aErlezuoFJ8u0ue-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aErlezuoFJ8u0ue-@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_134806_708714_2FDB09A8 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Jun 12, 2025 at 07:34:35AM -0700, Sean Christopherson wrote:
> On Thu, Jun 12, 2025, Marc Zyngier wrote:
> > On Wed, 11 Jun 2025 23:45:05 +0100,
> > Sean Christopherson <seanjc@google.com> wrote:
> > > 
> > > WARN if unmapping a vLPI in kvm_vgic_v4_unset_forwarding() fails, as
> > > failure means an IRTE has likely been left in a bad state, i.e. IRQs
> > > won't go where they should.
> > 
> > I have no idea what an IRTE is.
> 
> Sorry, x86 IOMMU terminology (Interrupt Remapping Table Entry).  I think the GIC
> terminology would be ITS entry?  Or maybe ITS mapping?

We tend to just call it a 'vLPI mapping', which under the hood implies
a couple other translations have been wired up as well (vPE + Device).

> > But not having an VLPI mapping for an interrupt at the point where we're
> > tearing down the forwarding is pretty benign. IRQs *still* go where they
> > should, and we don't lose anything.

The VM may not actually be getting torn down, though. The series of
fixes [*] we took for 6.16 addressed games that VMMs might be playing on
irqbypass for a live VM.

[*] https://lore.kernel.org/kvmarm/20250523194722.4066715-1-oliver.upton@linux.dev/

> All of those failure scenario seem like warnable offences when KVM thinks it has
> configured the IRQ to be forwarded to a vCPU.

I tend to agree here, especially considering how horribly fragile GICv4
has been in some systems. I know of a couple implementations where ITS
command failures and/or unmapped MSIs are fatal for the entire machine.
Debugging them has been a genuine pain in the ass.

WARN'ing when state tracking for vLPIs is out of whack would've made it
a little easier.

Thanks,
Oliver

