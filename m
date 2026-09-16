Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AC4C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhXpFZ9VswPhvLkxuik9i+Nt4jMBXcRn/oG41k/T1uI=; b=48ERFDhibcU7BuxnlOmEA7zfZy
	eqykQjJiGkOZuBresIJvCD7Nms3MPDYiIRdqNFlmP7Sy680nZB1qMLL0SfqmNzvVuegc1VEw6pAmQ
	O1V2WUMkau1qkA7QURPdICEYuzk83j6vZZyQxgBX3Qr8ibnGInx1Eb7+GLeu6Lf2kUKafRIDUUTrj
	0c3XMvXu0d+PXSokZI+mnXG2ti6kmu51xJBbNvRD4rszehFPhbNSiw8rg14/+P93DWFdqnDs1e/rV
	ozRCbx9r1xKRSXZ/m/x5jLNSbT2tZLVpuotYNSJ/gHOh3i7iz8SzhnueaNOE8xSpl1CGJq8EU8cls
	3Wqwku+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6deJ-000000087OV-27hg;
	Wed, 16 Sep 2026 00:37:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6deI-000000087OL-1jRm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 00:37:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89D1960008;
	Wed, 16 Sep 2026 00:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139BE1F000FF;
	Wed, 16 Sep 2026 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789519037;
	bh=KhXpFZ9VswPhvLkxuik9i+Nt4jMBXcRn/oG41k/T1uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iOo+6B/Yvvx05OkVOSWtJrtXZBBctiElUpb+YdCas1bze8OsVyQZ6cXF3ODvv6xyU
	 19Dmokvl6NZMSZO/0u9No8KATqKry+dWiIrGu8ClSBu7Jv8v9YZJydNnRzK1epCf+2
	 uyDZBY9TEr3sbezw7f8OIaiF437g7W3s0bhLbrlCTNNng5pdkKdsPvF1IoXS5+ESSF
	 R3zAWlDbzgZgdUtWwe7XtrSvgYjplCmgJRJiQbqMsCBYAgq+g1I6pinLUg5N8OLO2X
	 9yE8I4xTnhcvnkpYUOhUHemT1p7MjLWorbUBBkc7YcafptTkdhqkUt4DduVfe+LL4K
	 xY0MFIWY2cwkQ==
Date: Tue, 15 Sep 2026 17:37:15 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/5] KVM: arm64: pgtables: Change write bit from
 S2AP_W to DBM
Message-ID: <aqnku2TcFzIKhjQl@kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com>
 <20260901171558.2674031-2-leo.bras@arm.com>
 <86bja17cg7.wl-maz@kernel.org>
 <aql8jY4o8SzjJuFU@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aql8jY4o8SzjJuFU@LeoBrasDK>
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

On Tue, Sep 15, 2026 at 06:12:45PM +0100, Leonardo Bras wrote:
> > Yes, the HW should ignore it. But we have also
> > seen quite a few broken designs in this area...
> > 
> 
> I lack experience on what bad thing could happen. So I will expand on what 
> I belive to understand up to here:
> 
> - The PTE is in memory, so the DBM bit can be set regardless of being RES0
> - For SW pagetable walking, I don't think 'bit 51 == 0' is checked
> - For HW pagetable walking, maybe some faulty implementation may rely on 
>   bit51 being RES0, and fault otherwise.
> 
> If that's the case, then we would have to actually support both encodings, 
> and only enable the new one if HAFDBS is available in the system. 
> 
> I just wonder how high are the chances to have such a broken design, 
> or other broken designs did not come to my mind, and if we have to start 
> with that multiple-encoding option.

FWIW, the host stage-1 already uses the DBM bit unconditionally,
treating it as a software bit on implementations without HAFDBS.
Although given the quality of any garden variety Arm MMU I understand
where Marc is coming from.

I don't think the HAFDBS enablement is complicated enough to be done in
a separate series without any meaningful users, nor would I really be
interested in taking it without, say, HDBSS.

Can you please work with Tian to get a combined series out for this?

> > > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > > index 17123f0b6dab..eb8dfffc32c7 100644
> > > --- a/arch/arm64/kvm/nested.c
> > > +++ b/arch/arm64/kvm/nested.c
> > > @@ -379,21 +379,23 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
> > >  	}
> > >  
> > >  	addr_bottom += contiguous_bit_shift(desc, wi, level);
> > >  
> > >  	/* Calculate and return the result */
> > >  	paddr = (desc & GENMASK_ULL(47, addr_bottom)) |
> > >  		(ipa & GENMASK_ULL(addr_bottom - 1, 0));
> > >  	out->output = paddr;
> > >  	out->block_size = 1UL << ((3 - level) * stride + wi->pgshift);
> > >  	out->readable = desc & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
> > > -	out->writable = desc & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
> > > +	/* Takes care of both RO/RW and RO/WC/WD encodings */
> > > +	out->writable = desc & (KVM_PTE_LEAF_ATTR_HI_S2_DBM |
> > > +				KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W);
> > 
> > Absolutely NOT. For a start, NV doesn't support FEAT_HAFDBS. But even
> > if it did, you are now actively corrupting memory by turning a RO
> > mapping with a spurious DBM bit set into a writable mapping.
> > VTCR_EL2.HD exists for a reason.
> > 
> > Do you see why your blanket approach of equating DBM with writable is
> > plain wrong?
> 
> Sorry, not really... please help me understand it.
> 
> When you say a spurious DBM bit, what does it mean?

You've implemented the exact sort of bug that was alluded to above. In
this case it's a software page table walker consuming DBM regardless of
the value of VTCR_EL2.HD.

If the guest hypervisor sets VTCR_EL2.HD=0, the expectation is that the
shadow stage-2 MMU treats the corresponding bit in the PTE as RES0.

Thanks,
Oliver

