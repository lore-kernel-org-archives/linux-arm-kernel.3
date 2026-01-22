Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549C2D3EE96
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5hOGxm+CWyuV5Ad5ebOu/GND1qzF/WZWP0eSpnOZC8=; b=zglWJ0+YTVI+xC59mzkK3z1fDq
	AKcogVoUq1Gj2xpbEU3/Kc3jhT+e8qWRQdzSf6A78m30jj1PaqIdVIB/J10dwLEFdTLlIgodL4L0G
	9tXQlfaL6tCtV3l1RlMrMmqkiuse02MA33MkTajm2FTdtNqXqtl3RLeZSTNfNuIDOLtW22Ex4VuyA
	zvMarnWFpa+lFUdD8aoFSKecnm3QJ4LucOWVT5umsCi9s4ZFo5GIv8tg9SY55CaipiZEr1kPSLD7m
	D2ALtkr0ovImIRwG2hNz4Hp2Uf456CzZG2Vkn+UCCaanNr47TiO3wpUtjZuu4ed1+qIOZ2R060Q8d
	luiL9PbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy7V-00000007XEt-3xUw;
	Thu, 22 Jan 2026 17:05:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy7T-00000007XEJ-23Ew
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4AD340541;
	Thu, 22 Jan 2026 17:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48B4C116C6;
	Thu, 22 Jan 2026 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101518;
	bh=oGwVJwPhkUypqjfPNP7lgeDm0bczOg2CvbFMzcz+o7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTiRn1y8WqHg6NIcBpaDooI84i04C0FMbadxvr7w5YgQJWSJOxuhZCwX7pWYKQGC8
	 cjbXHtPAVIaX8FpqK0/QbsxfBll1RcPHu/ZDCWVzWGw/j539n7H1kLnd5GJS9v4DTs
	 W+Zf6Y9fUp9sESs1RGYnS7k7RA3NvL9mFgnHz5zzIJhCAM44ys45jCVn2hq5UmDTnr
	 GcUOxMizpORaFf6hm9ZDyKl+V/mRkto9Rpw1BHmL/Da0cDPnEpNK5yWOww8JiURw6w
	 Nm1AdUyNFDK71KBK/gIA9SJ7mGPP2a86+MEXtvBQOOA3IbWBtbW9ce/uoMfxWJJglO
	 jo+9dXSaTWhdQ==
Date: Thu, 22 Jan 2026 17:05:13 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 2/6] KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
Message-ID: <aXJYydu3SplkF68o@willie-the-truck>
References: <20260119105651.255693-1-maz@kernel.org>
 <20260119105651.255693-3-maz@kernel.org>
 <CA+EHjTzxbuyJcJRvwinrS0cqaVqMY03P6x6A8FH99onXphdjPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzxbuyJcJRvwinrS0cqaVqMY03P6x6A8FH99onXphdjPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_090519_547537_D3066BB8 
X-CRM114-Status: GOOD (  18.97  )
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

On Thu, Jan 22, 2026 at 03:08:32PM +0000, Fuad Tabba wrote:
> On Mon, 19 Jan 2026 at 10:56, Marc Zyngier <maz@kernel.org> wrote:
> >
> > Plumb the MT_S2{,_FWB}_AS_S1 memory types into the KVM_S2_MEMATTR()
> > macro with a new KVM_PGTABLE_S2_AS_S1 flag.
> >
> > Nobody selects it yet.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  arch/arm64/include/asm/kvm_pgtable.h |  2 ++
> >  arch/arm64/kvm/hyp/pgtable.c         | 13 ++++++++++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index fc02de43c68dd..9ce51a637da0a 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -232,10 +232,12 @@ struct kvm_pgtable_mm_ops {
> >   * @KVM_PGTABLE_S2_NOFWB:      Don't enforce Normal-WB even if the CPUs have
> >   *                             ARM64_HAS_STAGE2_FWB.
> >   * @KVM_PGTABLE_S2_IDMAP:      Only use identity mappings.
> > + * @KVM_PGTABLE_S2_AS_S1:      Final memory attributes are that of Stage-1.
> >   */
> >  enum kvm_pgtable_stage2_flags {
> >         KVM_PGTABLE_S2_NOFWB                    = BIT(0),
> >         KVM_PGTABLE_S2_IDMAP                    = BIT(1),
> > +       KVM_PGTABLE_S2_AS_S1                    = BIT(2),
> >  };
> >
> >  /**
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 947ac1a951a5b..3c5f399b1b986 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -659,7 +659,18 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> >         }
> >  }
> >
> > -#define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
> > +#define KVM_S2_MEMATTR(pgt, attr)                                      \
> > +       ({                                                              \
> > +               kvm_pte_t __attr;                                       \
> 
> nit: new line?
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>

If you're going back to fix nits then:

> > +               if((pgt)->flags & KVM_PGTABLE_S2_AS_S1)                 \

please stick a space after the 'if' as well :)

Will

