Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C892C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rR25wF+00D9fLEkRSslKXcQJN9H+YLNtyZjv4WHEqzE=; b=dVA71GBj9Ak3sH+F3vlGtJixhr
	6c3Hs0nnU7IN9mk+0cGlYLb/IJPGbWuAXzicvDhA/R3Yoj4ZRaRzI0vCRoM/vOzkPztWbaVHcvlUz
	CzuASc5lwJEb/8Aqfyra7Fm9nJPIcwAkdyvp0jkD5sr+8G6hYoWR9ZtqvNqgoZRaGu6DtJUJovsMV
	/dn7LOQVU7ts2MB220WAbx3K8BhZkq7Rsn53+WJhHt2+jKP+N01LUAnPdE0FpdsBuP6NH5xXGXpXP
	lwzgnn3YQEw0toIxviu/pfRBdRI0fuascMVPxfqmBI66rtDswm9Ti0Yu/Pxekj5kk9YTCzm82DUNm
	+G60Kt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckiV-0000000BSuh-2ctD;
	Mon, 05 Jan 2026 13:33:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckiS-0000000BStw-2I4I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:33:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F5C8497;
	Mon,  5 Jan 2026 05:33:38 -0800 (PST)
Received: from [10.57.49.14] (unknown [10.57.49.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7F733F5A1;
	Mon,  5 Jan 2026 05:33:42 -0800 (PST)
Message-ID: <c25309d1-0424-495e-82af-d025b3e6d8c8@arm.com>
Date: Mon, 5 Jan 2026 13:33:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
To: Dawei Li <dawei.li@linux.dev>, will@kernel.org, joro@8bytes.org
Cc: jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
 stable@vger.kernel.org
References: <20251229002354.162872-1-dawei.li@linux.dev>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251229002354.162872-1-dawei.li@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_053348_673888_60460E98 
X-CRM114-Status: GOOD (  27.87  )
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

On 2025-12-29 12:23 am, Dawei Li wrote:
> According to SMMUv3 architecture specification, IO-coherent access for
> SMMU is supported for:
> - Translation table walks.
> - Fetches of L1STD, STE, L1CD and CD.
> - Command queue, Event queue and PRI queue access.
> - GERROR, CMD_SYNC, Event queue and PRI queue MSIs, if supported
> 
> In other words, if a SMMU implementation doesn't support IO coherent
> access(SMMUIDR0.COHACC==0), all fields above accessed by SMMU is
> expected to be non-coherent and S/W is supposed to maintain proper
> access attributes to achieve expected behavior.
> 
> Unfortunately, for non-coherent SMMU implementation, current codebase
> only takes care of translation table walking. Fix it by providing right
> attributes(cacheability, shareablility, cache allocation hints, e.g) to
> other fields.

The assumption is that if the SMMU is not I/O-coherent, then the Normal 
Cacheable attribute will inherently degrade to a non-snooping (and thus 
effectively Normal Non-Cacheable) one, as that's essentially what AXI 
will do in practice, and thus the attribute doesn't actually matter all 
that much in terms of functional correctness. If the SMMU _is_ capable 
of snooping but is not described as such then frankly firmware is wrong.

If prople have a good reason for wanting to use a coherent SMMU 
non-coherently (and/or control of allocation hints), then that should 
really be some kind of driver-level option - it would need a bit of 
additional DMA API work (which has been low down my to-do list for a few 
years now...), but it's perfectly achievable, and I think it's still 
preferable to abusing the COHACC override in firmware.

> Fixes: 4f41845b3407 ("iommu/io-pgtable: Replace IO_PGTABLE_QUIRK_NO_DMA with specific flag")

That commit didn't change any behaviour though?

> Fixes: 9e6ea59f3ff3 ("iommu/io-pgtable: Support non-coherent page tables")

And that was a change to io-pgtable which did exactly what it intended 
and claimed to do, entirely orthogonal to arm-smmu-v3. (And IIRC it was 
really more about platforms using arm-smmu (v2) where the SMMU is 
non-coherent but the Outer Cacheable attribute acts as an allocation 
hint for a transparent system cache.)

Thanks,
Robin.

> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 73 +++++++++++++++------
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
>   2 files changed, 54 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..4f00bf53d26c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -265,8 +265,14 @@ static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
>   	return 0;
>   }
>   
> +static __always_inline bool smmu_coherent(struct arm_smmu_device *smmu)
> +{
> +	return !!(smmu->features & ARM_SMMU_FEAT_COHERENCY);
> +}
> +
>   /* High-level queue accessors */
> -static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> +static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent,
> +				   struct arm_smmu_device *smmu)
>   {
>   	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
>   	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> @@ -358,8 +364,13 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>   		} else {
>   			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
>   		}
> -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> +		if (smmu_coherent(smmu)) {
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> +		} else {
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_OSH);
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OINC);
> +		}
>   		break;
>   	default:
>   		return -ENOENT;
> @@ -405,7 +416,7 @@ static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
>   				   q->ent_dwords * 8;
>   	}
>   
> -	arm_smmu_cmdq_build_cmd(cmd, &ent);
> +	arm_smmu_cmdq_build_cmd(cmd, &ent, smmu);
>   	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
>   		u64p_replace_bits(cmd, CMDQ_SYNC_0_CS_NONE, CMDQ_SYNC_0_CS);
>   }
> @@ -461,7 +472,7 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>   		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd[i]);
>   
>   	/* Convert the erroneous command into a CMD_SYNC */
> -	arm_smmu_cmdq_build_cmd(cmd, &cmd_sync);
> +	arm_smmu_cmdq_build_cmd(cmd, &cmd_sync, smmu);
>   	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
>   		u64p_replace_bits(cmd, CMDQ_SYNC_0_CS_NONE, CMDQ_SYNC_0_CS);
>   
> @@ -913,7 +924,7 @@ static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>   {
>   	u64 cmd[CMDQ_ENT_DWORDS];
>   
> -	if (unlikely(arm_smmu_cmdq_build_cmd(cmd, ent))) {
> +	if (unlikely(arm_smmu_cmdq_build_cmd(cmd, ent, smmu))) {
>   		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
>   			 ent->opcode);
>   		return -EINVAL;
> @@ -965,7 +976,7 @@ static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
>   	}
>   
>   	index = cmds->num * CMDQ_ENT_DWORDS;
> -	if (unlikely(arm_smmu_cmdq_build_cmd(&cmds->cmds[index], cmd))) {
> +	if (unlikely(arm_smmu_cmdq_build_cmd(&cmds->cmds[index], cmd, smmu))) {
>   		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
>   			 cmd->opcode);
>   		return;
> @@ -1603,6 +1614,7 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
>   {
>   	struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
>   	struct arm_smmu_device *smmu = master->smmu;
> +	u64 val;
>   
>   	memset(target, 0, sizeof(*target));
>   	target->data[0] = cpu_to_le64(
> @@ -1612,11 +1624,18 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
>   		(cd_table->cdtab_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
>   		FIELD_PREP(STRTAB_STE_0_S1CDMAX, cd_table->s1cdmax));
>   
> +	if (smmu_coherent(smmu)) {
> +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH);
> +	} else {
> +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_NC) |
> +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_NC) |
> +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_OSH);
> +	}
> +
>   	target->data[1] = cpu_to_le64(
> -		FIELD_PREP(STRTAB_STE_1_S1DSS, s1dss) |
> -		FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> -		FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> -		FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
> +		FIELD_PREP(STRTAB_STE_1_S1DSS, s1dss) | val |
>   		((smmu->features & ARM_SMMU_FEAT_STALLS &&
>   		  !master->stall_enabled) ?
>   			 STRTAB_STE_1_S1STALLD :
> @@ -3746,7 +3765,7 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>   	q->cons_reg	= page + cons_off;
>   	q->ent_dwords	= dwords;
>   
> -	q->q_base  = Q_BASE_RWA;
> +	q->q_base  = smmu_coherent(smmu) ? Q_BASE_RWA : 0;
>   	q->q_base |= q->base_dma & Q_BASE_ADDR_MASK;
>   	q->q_base |= FIELD_PREP(Q_BASE_LOG2SIZE, q->llq.max_n_shift);
>   
> @@ -4093,6 +4112,7 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
>   	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>   	dma_addr_t dma;
>   	u32 reg;
> +	u64 val;
>   
>   	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
>   		reg = FIELD_PREP(STRTAB_BASE_CFG_FMT,
> @@ -4107,8 +4127,12 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
>   		      FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, smmu->sid_bits);
>   		dma = cfg->linear.ste_dma;
>   	}
> -	writeq_relaxed((dma & STRTAB_BASE_ADDR_MASK) | STRTAB_BASE_RA,
> -		       smmu->base + ARM_SMMU_STRTAB_BASE);
> +
> +	val = dma & STRTAB_BASE_ADDR_MASK;
> +	if (smmu_coherent(smmu))
> +		val |= STRTAB_BASE_RA;
> +
> +	writeq_relaxed(val, smmu->base + ARM_SMMU_STRTAB_BASE);
>   	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
>   }
>   
> @@ -4130,12 +4154,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   		return ret;
>   
>   	/* CR1 (table and queue memory attributes) */
> -	reg = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
> -	      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
> -	      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
> -	      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
> -	      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
> -	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
> +	if (smmu_coherent(smmu)) {
> +		reg = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
> +		      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
> +		      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
> +		      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
> +		      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
> +		      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
> +	} else {
> +		reg = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_OSH) |
> +		      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_NC) |
> +		      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_NC) |
> +		      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_OSH) |
> +		      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_NC) |
> +		      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_NC);
> +	}
>   	writel_relaxed(reg, smmu->base + ARM_SMMU_CR1);
>   
>   	/* CR2 (random crap) */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ae23aacc3840..7a5f76e165dc 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -183,6 +183,7 @@ struct arm_vsmmu;
>   #define ARM_SMMU_SH_ISH			3
>   #define ARM_SMMU_MEMATTR_DEVICE_nGnRE	0x1
>   #define ARM_SMMU_MEMATTR_OIWB		0xf
> +#define ARM_SMMU_MEMATTR_OINC		0x5
>   
>   #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
>   #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))


