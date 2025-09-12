Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D7CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPTr3PPqDWRc4djKow2UHPQu3j9+zIYkV31B1iDIbjM=; b=oFSchJyZ4p1GMyQrO+q0xU0aME
	EsZ4xYrSWsFJT0wLRO+b8pmjDjWmhbUw69Rpm36CnUIaYosBj7k919uJqNTXx6C/JL8x6WoIwMUb8
	NQQJJFmGhPPSDEZ5D4k3wmsH9T+4wa9jwB4cM82EdNRu16eAuhPOoHmtufU9s+ro6PjC6s/xR2OL7
	m+JNuuZuBXjmYju3OxYRD1FqSDU7CnlhQc8DlLCyCKQ2zSiCzp8/HA6ETXr6wTrBAMFu3fr+Ewksk
	pHiqhXkT/PJEsPhLECmCX7FY9Yufbd1fVMgp1cK0EvEzhRA3mwH6BWVmAC1MTAmzrtBco3c8ZC3VX
	/GTIO0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4bQ-00000009oN1-1tMn;
	Fri, 12 Sep 2025 14:18:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4bQ-00000009oMg-04YZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A9C46023D;
	Fri, 12 Sep 2025 14:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3C9C4CEF1;
	Fri, 12 Sep 2025 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757686694;
	bh=1hy35R43ASil/Xah8GOzXEPYbvd1rzbSp8b9RvMG6Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlbPoZYJ6ueISXmeEesGaARcP6z4YBrYkH2IC/638nX32M8kbtDTP0p1jSKvVELs7
	 RlUkOMEPDIN3fC/vITW5mZ95dHxXGlma/5nu/1tIQRyj3Q22jbl4dOBZ8m/vEAb/zr
	 8ZbxNUMHritPukMqfvA971a40Z9vmj1g11YY01hg4i+ijIH8yxXn26YvMJ0DKYc2lw
	 TIbEPYPpPacojnhRmU6Et4QWk7+dqgfiwTWboOYaBsJGPN5aoEp2kQodjq76T+lo55
	 kAv3nLm3CaMsRDH4xN8NXlKabR6Z76SyN9hfVJfCs9mSfGktNJh//pIKQ6yylRajdi
	 8mS984t4j9I0Q==
Date: Fri, 12 Sep 2025 15:18:08 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <aMQroI4NDu74PDGT@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819215156.2494305-23-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:50PM +0000, Mostafa Saleh wrote:
> Don’t allow access to the command queue from the host:
> - ARM_SMMU_CMDQ_BASE: Only allowed to be written when CMDQ is disabled, we
>   use it to keep track of the host command queue base.
>   Reads return the saved value.
> - ARM_SMMU_CMDQ_PROD: Writes trigger command queue emulation which sanitises
>   and filters the whole range. Reads returns the host copy.
> - ARM_SMMU_CMDQ_CONS: Writes move the sw copy of the cons, but the host can’t
>   skip commands once submitted. Reads return the emulated value and the error
>   bits in the actual cons.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 108 +++++++++++++++++-
>  1 file changed, 105 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> index 554229e466f3..10c6461bbf12 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> @@ -325,6 +325,88 @@ static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
>  	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
>  }
>  
> +static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *command)
> +{
> +	u64 type = FIELD_GET(CMDQ_0_OP, command[0]);
> +
> +	switch (type) {
> +	case CMDQ_OP_CFGI_STE:
> +		/* TBD: SHADOW_STE*/
> +		break;
> +	case CMDQ_OP_CFGI_ALL:
> +	{
> +		/*
> +		 * Linux doesn't use range STE invalidation, and only use this
> +		 * for CFGI_ALL, which is done on reset and not on an new STE
> +		 * being used.
> +		 * Although, this is not architectural we rely on the current Linux
> +		 * implementation.
> +		 */
> +		WARN_ON((FIELD_GET(CMDQ_CFGI_1_RANGE, command[1]) != 31));
> +		break;
> +	}
> +	case CMDQ_OP_TLBI_NH_ASID:
> +	case CMDQ_OP_TLBI_NH_VA:
> +	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
> +	{
> +		/* Only allow VMID = 0*/
> +		if (FIELD_GET(CMDQ_TLBI_0_VMID, command[0]) == 0)
> +			break;
> +		break;
> +	}
> +	case 0x10: /* CMD_TLBI_NH_ALL: Not used by Linux */
> +	case CMDQ_OP_TLBI_EL2_ALL:
> +	case CMDQ_OP_TLBI_EL2_VA:
> +	case CMDQ_OP_TLBI_EL2_ASID:
> +	case CMDQ_OP_TLBI_S12_VMALL:
> +	case 0x23: /* CMD_TLBI_EL2_VAA: Not used by Linux */
> +		/* Malicous host */
> +		return WARN_ON(true);
> +	case CMDQ_OP_CMD_SYNC:
> +		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) == CMDQ_SYNC_0_CS_IRQ) {
> +			/* Allow it, but let the host timeout, as this should never happen. */
> +			command[0] &= ~CMDQ_SYNC_0_CS;
> +			command[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> +			command[1] &= ~CMDQ_SYNC_1_MSIADDR_MASK;
> +		}
> +		break;
> +	}
> +
> +	return false;
> +}
> +
> +static void smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
> +{
> +	u64 *host_cmdq = hyp_phys_to_virt(smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK);
> +	int idx;
> +	u64 cmd[CMDQ_ENT_DWORDS];
> +	bool skip;
> +
> +	if (!is_cmdq_enabled(smmu))
> +		return;
> +
> +	while (!queue_empty(&smmu->cmdq_host.llq)) {
> +		/* Wait for the command queue to have some space. */
> +		WARN_ON(smmu_wait_event(smmu, !smmu_cmdq_full(&smmu->cmdq)));
> +
> +		idx = Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
> +		/* Avoid TOCTOU */
> +		memcpy(cmd, &host_cmdq[idx * CMDQ_ENT_DWORDS], CMDQ_ENT_DWORDS << 3);
> +		skip = smmu_filter_command(smmu, cmd);
> +		if (!skip)
> +			smmu_add_cmd_raw(smmu, cmd);
> +		queue_inc_cons(&smmu->cmdq_host.llq);
> +	}

Hmmm. There's something I'd not considered before here.

Ideally, the data structures that are shadowed by the hypervisor would
be mapped as normal-WB cacheable in both the host and the hypervisor so
we don't have to worry about coherency and we get the performance
benefits from the caches. Indeed, I think that's how you've mapped
'host_cmdq' above _however_ I sadly don't think we can do that if the
actual SMMU hardware isn't coherent.

We don't have a way to say things like "The STEs and CMDQ are coherent
but the CDs and Stage-1 page-tables aren't" so that means we have to
treat the shadowed structures populated by the host in the same way as
the host-owned structures that are consumed directly by the hardware.
Consequently, we should either be using non-cacheable mappings at EL2
for these structures or doing CMOs around the accesses.

Will

