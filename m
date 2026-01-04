Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BE8C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 13:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnzMXDHXXL9NNS4k3AnnQ9myHIZaZb8uzsVSt6dVi30=; b=o6ZMmHHDsXRf5FL0DQfqWbi2XO
	Tw92EonjeE6AlCSM9J/Ej0bnyJSSlq4xpmXCTP4PHSd54v8t+ZkMZp3C4fOWrDrEmYdM3b3PNn3Io
	SiXxIDUlmkT+lFLnF9Nb8eCs5n1mWSR2D/vGnNSuXihpbf+lp8UBCzHtBY9OU5VV/dtwt8k745jao
	115EnMAIRUA7TUHy2j+JPeG4eRBgP2/bB34ccB6oMlveILwYvzzEBEzDkukQ2xPgYIInYHgbA6+SK
	l8qis+arFrxA43lVJNoCYNl8PhLEoDLVctbuWrRfz629IZNxLX7lvQ4hD68afeWlrYGFeBjCAv8p/
	vuJlSWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOGz-0000000AGJC-2Kju;
	Sun, 04 Jan 2026 13:35:57 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOGw-0000000AGFw-0ldN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 13:35:55 +0000
Date: Sun, 4 Jan 2026 21:35:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767533736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tnzMXDHXXL9NNS4k3AnnQ9myHIZaZb8uzsVSt6dVi30=;
	b=qSrjK0AtRce/nc9H7pvBQSyTFKoO3HjCKs8u1Dp8B/5zTb+WB183UzOMgQAjXjSzwlVeNt
	ZgXqTmXFAvn7vS84wsvtHHjM+zDYs0g6WyWdcPK3oqmgajD8MJbjZH9uCJaIIwd+MuUZ8w
	z+LdLGNtOXOHa+kmLYDUeorMT+9ZZh8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	stable@vger.kernel.org, dawei.li@linux.dev
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
Message-ID: <20260104133532.GA173992@wendao-VirtualBox>
References: <20251229002354.162872-1-dawei.li@linux.dev>
 <20260102184113.GA125261@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102184113.GA125261@ziepe.ca>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_053554_453625_CBD25C0C 
X-CRM114-Status: GOOD (  42.18  )
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

Jeson,

On Fri, Jan 02, 2026 at 02:41:13PM -0400, Jason Gunthorpe wrote:
> On Mon, Dec 29, 2025 at 08:23:54AM +0800, Dawei Li wrote:
> > According to SMMUv3 architecture specification, IO-coherent access for
> > SMMU is supported for:
> > - Translation table walks.
> > - Fetches of L1STD, STE, L1CD and CD.
> > - Command queue, Event queue and PRI queue access.
> > - GERROR, CMD_SYNC, Event queue and PRI queue MSIs, if supported
> 
> I was recently looking at this too..  IMHO this is not really a clean
> description of what this patch is doing.
> 
> I would write this description as:
> 
> When the SMMU does a DMA for itself it can set various memory access
> attributes which control how the interconnect should execute the
> DMA. Linux uses these to differentiate DMA that must snoop the cache
> and DMA that must bypass it because Linux has allocated non-coherent
> on the CPU.
> 
> In Table "13.8 Attributes for SMMU-originated accesses" each of the
> different types of DMA is categorized and the specific bits
> controlling the memory attribute for the fetch are identified.

Turns out I missed some of DMA types listed in 13.8, thanks for the
headsup.

> 
> Make this consisent globally. If Linux has cache flushed the buffer,
> or allocated a DMA incoherenet buffer, then it should set the
> non-caching memory attribute so the DMA matches.
> 
> This is important for some of the allocations where Linux is currently
> allocating DMA coherent memory, meaning nothing has made the CPU cache
> coherent and doing any coherent access to that memory may result in
> cache inconsistencies.
> 
> This may solve problems in systems where the SMMU driver thinks the
> SMMU is non-coherent, but in fact, the SMMU and the interconnect
> selectively supports coherence and setting the wrong memory attributes
> will cause non-working cached access.
> 
> [and then if you have a specific SOC that shows an issue please
> describe the HW]
> 
> > +static __always_inline bool smmu_coherent(struct arm_smmu_device *smmu)
> > +{
> > +	return !!(smmu->features & ARM_SMMU_FEAT_COHERENCY);
> > +}
> > +
> >  /* High-level queue accessors */
> > -static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> > +static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent,
> > +				   struct arm_smmu_device *smmu)
> >  {
> >  	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
> >  	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> > @@ -358,8 +364,13 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> >  		} else {
> >  			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> >  		}
> > -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> > -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> > +		if (smmu_coherent(smmu)) {
> > +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> > +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> > +		} else {
> > +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_OSH);
> > +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OINC);
> > +		}
> 
> And then please go through your patch and add comments actually
> explaining what the DMA is and what memory is being reached by it -
> since it is not always very clear from the ARM mnemonics

Acked.

> 
> For instance, this is:
>  /* DMA for "CMDQ MSI" which targets q->base_dma allocated by arm_smmu_init_one_queue() */
> 
> > @@ -1612,11 +1624,18 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
> >  		(cd_table->cdtab_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
> >  		FIELD_PREP(STRTAB_STE_0_S1CDMAX, cd_table->s1cdmax));
> >  
> > +	if (smmu_coherent(smmu)) {
> > +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> > +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> > +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH);
> > +	} else {
> > +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_NC) |
> > +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_NC) |
> > +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_OSH);
> > +	}
> 
> This one is "CD fetch" allocated by arm_smmu_alloc_cd_ptr()
> 
> etc
> 
> And note that the above will need this hunk too:
> 
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -432,6 +432,14 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
>             !(smmu->features & ARM_SMMU_FEAT_S2FWB))
>                 return 0;
>  
> +       /*
> +        * When running non-coherent we can't suppot S2FWB since it will also
> +        * force a coherent CD fetch, aside from the question of what
> +        * S2FWB/CANWBS even does with non-coherent SMMUs.
> +        */
> +       if (!smmu_coherent(smmu))
> +               return 0;

I was wondering why S2FWB can affect CD fetching before reading 13.8.

Does diff below suffice?

@@ -1614,8 +1619,12 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 {
        struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
        struct arm_smmu_device *smmu = master->smmu;
+       bool coherent, fwb;
        u64 val;

+       coherent = smmu_coherent(smmu);
+       fwb = !!(smmu->features & ARM_SMMU_FEAT_S2FWB);
+
        memset(target, 0, sizeof(*target));
        target->data[0] = cpu_to_le64(
                STRTAB_STE_0_V |
@@ -1624,14 +1633,24 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
                (cd_table->cdtab_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
                FIELD_PREP(STRTAB_STE_0_S1CDMAX, cd_table->s1cdmax));

+       /*
+        * DMA for "CD fetch" targets cd_table->linear.table or cd_table->l2.l1tab
+        * allocated by arm_smmu_alloc_cd_ptr().
+        */
        if (smmu_coherent(smmu)) {
                val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
                      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
                      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH);
        } else {
-               val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_NC) |
-                     FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_NC) |
-                     FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_OSH);
+               if (!fwb) {
+                       val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_NC) |
+                               FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_NC) |
+                               FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_OSH);
+               } else {
+                       dev_warn(&smmu->dev, "Inconsitency between COHACC & S2FWB\n");
+                       /* FIX ME */
+                       return;
+               }
        }


> 
> > @@ -3746,7 +3765,7 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
> >  	q->cons_reg	= page + cons_off;
> >  	q->ent_dwords	= dwords;
> >  
> > -	q->q_base  = Q_BASE_RWA;
> > +	q->q_base  = smmu_coherent(smmu) ? Q_BASE_RWA : 0;
> 
> CMDQ fetch, though do we even need to manage RWA? Isn't it ignored if
> IC/OC/SH are set to their non-cachable values?

My first thought was "why don't we just whack them all?", yet the spec
reads:

"Cache allocation hints are present in each _BASE register and are ignored
 unless a cacheable type is used for the table or queue to which the
 register corresponds"

You are right, gonna remove it.

> 
> etc..
> 
> Jason

Thanks,

	Dawei

