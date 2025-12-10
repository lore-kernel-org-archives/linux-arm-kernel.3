Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93764D3C52A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/8DaFSs5S8pvAq1NE0FGC5rC8tBOD/XHgmZx+oU3Kc=; b=XmQEO/U5/fhNVnr0HrGxZYiGBp
	6AL/icWgVAhVvDXL9AKjzGEjXRVQM+cHjoeyRpZcvc1xs5VUiEEWka1Jq2Ee3Ft6OtmBUaDogJ9S1
	i7qHN32Dfcojw4TitjZOBXb1yk9UsCu5XeS5nhDxr4lAfdAf4jMi5zlhRYbcPJZgRm3hv0Lobo7Xi
	N39fp84TbYwr+a68JYhqkvohDqsN0nNyC+U6oHPcnbrOhK97ixD7uxxKwgm3BUYbwHbqa17yePilc
	mhef1fV98I0FcGTl03cSfS+2JLhjguvkl0zD5/m4me8xYYEu9HMEGHuuBXSQQSDFBWCRVzoxRMPmK
	KgL/Lyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJBE-0000000FPuW-0TrR;
	Wed, 10 Dec 2025 12:20:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJBB-0000000FPuC-38gt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 12:20:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AD8B153B;
	Wed, 10 Dec 2025 04:20:17 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9CE3F73B;
	Wed, 10 Dec 2025 04:20:21 -0800 (PST)
Message-ID: <7b3fca1d-8f1d-481f-8635-ac973baec1c2@arm.com>
Date: Wed, 10 Dec 2025 12:20:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 35/38] arm_mpam: Add workaround for T241-MPAM-1
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-36-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-36-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_042025_896266_AB759E40 
X-CRM114-Status: GOOD (  34.37  )
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

Hi James,

On 12/5/25 21:58, James Morse wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The MPAM bandwidth partitioning controls will not be correctly configured,
> and hardware will retain default configuration register values, meaning
> generally that bandwidth will remain unprovisioned.
> 
> To address the issue, follow the below steps after updating the MBW_MIN
> and/or MBW_MAX registers.
> 
>  - Perform 64b reads from all 12 bridge MPAM shadow registers at offsets
>    (0x360048 + slice*0x10000 + partid*8). These registers are read-only.
>  - Continue iterating until all 12 shadow register values match in a loop.
>    pr_warn_once if the values fail to match within the loop count 1000.
>  - Perform 64b writes with the value 0x0 to the two spare registers at
>    offsets 0x1b0000 and 0x1c0000.
> 
> In the hardware, writes to the MPAMCFG_MBW_MAX MPAMCFG_MBW_MIN registers
> are transformed into broadcast writes to the 12 shadow registers. The
> final two writes to the spare registers cause a final rank of downstream
> micro-architectural MPAM registers to be updated from the shadow copies.
> The intervening loop to read the 12 shadow registers helps avoid a race
> condition where writes to the spare registers occur before all shadow
> registers have been updated.
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> [ morse: Merged the min/max update into a single
>   mpam_quirk_post_config_change() helper. Stashed the t241_id in the msc
>   instead of carrying the physical address around. Test the msc quirk bit
>   instead of a static key. ]
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 +
>  drivers/resctrl/mpam_devices.c              | 87 +++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h             |  9 +++
>  3 files changed, 98 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index a7ec57060f64..4e86b85fe3d6 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -246,6 +246,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
>  +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index f0f6f9b55ad4..f1f03ceade0a 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -29,6 +29,16 @@
>  
>  #include "mpam_internal.h"
>  
> +/* Values for the T241 errata workaround */
> +#define T241_CHIPS_MAX			4
> +#define T241_CHIP_NSLICES		12
> +#define T241_SPARE_REG0_OFF		0x1b0000
> +#define T241_SPARE_REG1_OFF		0x1c0000
> +#define T241_CHIP_ID(phys)		FIELD_GET(GENMASK_ULL(44, 43), phys)
> +#define T241_SHADOW_REG_OFF(sidx, pid)	(0x360048 + (sidx) * 0x10000 + (pid) * 8)
> +#define SMCCC_SOC_ID_T241		0x036b0241
> +static void __iomem *t241_scratch_regs[T241_CHIPS_MAX];
> +
>  /*
>   * mpam_list_lock protects the SRCU lists when writing. Once the
>   * mpam_enabled key is enabled these lists are read-only,
> @@ -630,7 +640,44 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>  	return ERR_PTR(-ENOENT);
>  }
>  
> +static void mpam_enable_quirk_nvidia_t241(struct mpam_msc *msc,
> +					  const struct mpam_quirk *quirk)
> +{
> +	s32 soc_id = arm_smccc_get_soc_id_version();
> +	struct resource *r;
> +	phys_addr_t phys;
> +
> +	/*
> +	 * A mapping to a device other than the MSC is needed, check
> +	 * SOC_ID is  NVIDIA T241 chip (036b:0241)
> +	 */
> +	if (soc_id < 0 || soc_id != SMCCC_SOC_ID_T241)
> +		return;
> +
> +	r = platform_get_resource(msc->pdev, IORESOURCE_MEM, 0);
> +	if (!r)
> +		return;
> +
> +	/* Find the internal registers base addr from the CHIP ID */
> +	msc->t241_id = T241_CHIP_ID(r->start);
> +	phys = FIELD_PREP(GENMASK_ULL(45, 44), msc->t241_id) | 0x19000000ULL;
> +
> +	t241_scratch_regs[msc->t241_id] = ioremap(phys, SZ_8M);
> +	if (WARN_ON_ONCE(!t241_scratch_regs[msc->t241_id]))
> +		return;
> +
> +	mpam_set_quirk(quirk->workaround, msc);
> +	pr_info_once("Enabled workaround for NVIDIA T241 erratum T241-MPAM-1\n");
> +}
> +
>  static const struct mpam_quirk mpam_quirks[] = {
> +	{
> +	/* NVIDIA t241 erratum T241-MPAM-1 */
> +	.init       = mpam_enable_quirk_nvidia_t241,
> +	.iidr       = MPAM_IIDR_NVIDIA_T421,

MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241

> +	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
> +	.workaround = T241_SCRUB_SHADOW_REGS,
> +	},
>  	{ NULL }, /* Sentinel */
>  };
>  
> @@ -1372,6 +1419,44 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>  	__mpam_write_reg(msc, reg, bm);
>  }
>  
> +static void mpam_apply_t241_erratum(struct mpam_msc_ris *ris, u16 partid)
> +{
> +	int sidx, i, lcount = 1000;
> +	void __iomem *regs;
> +	u64 val0, val;
> +
> +	regs = t241_scratch_regs[ris->vmsc->msc->t241_id];
> +
> +	for (i = 0; i < lcount; i++) {
> +		/* Read the shadow register at index 0 */
> +		val0 = readq_relaxed(regs + T241_SHADOW_REG_OFF(0, partid));
> +
> +		/* Check if all the shadow registers have the same value */
> +		for (sidx = 1; sidx < T241_CHIP_NSLICES; sidx++) {
> +			val = readq_relaxed(regs +
> +					    T241_SHADOW_REG_OFF(sidx, partid));
> +			if (val != val0)
> +				break;
> +		}
> +		if (sidx == T241_CHIP_NSLICES)
> +			break;
> +	}
> +
> +	if (i == lcount)
> +		pr_warn_once("t241: inconsistent values in shadow regs");
> +
> +	/* Write a value zero to spare registers to take effect of MBW conf */
> +	writeq_relaxed(0, regs + T241_SPARE_REG0_OFF);
> +	writeq_relaxed(0, regs + T241_SPARE_REG1_OFF);
> +}
> +
> +static void mpam_quirk_post_config_change(struct mpam_msc_ris *ris, u16 partid,
> +					  struct mpam_config *cfg)
> +{
> +	if (mpam_has_quirk(T241_SCRUB_SHADOW_REGS, ris->vmsc->msc))
> +		mpam_apply_t241_erratum(ris, partid);
> +}
> +
>  /* Called via IPI. Call while holding an SRCU reference */
>  static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  				      struct mpam_config *cfg)
> @@ -1455,6 +1540,8 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  		mpam_write_partsel_reg(msc, PRI, pri_val);
>  	}
>  
> +	mpam_quirk_post_config_change(ris, partid, cfg);
> +
>  	mutex_unlock(&msc->part_sel_lock);
>  }
>  
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index de3e5faa12b2..70b78cfd1f5b 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -133,6 +133,9 @@ struct mpam_msc {
>  	void __iomem		*mapped_hwpage;
>  	size_t			mapped_hwpage_sz;
>  
> +	/* Values only used on some platforms for quirks */
> +	u32			t241_id;
> +
>  	struct mpam_garbage	garbage;
>  };
>  
> @@ -219,6 +222,7 @@ struct mpam_props {
>  
>  /* Workaround bits for msc->quirks */
>  enum mpam_device_quirks {
> +	T241_SCRUB_SHADOW_REGS,
>  	MPAM_QUIRK_LAST,
>  };
>  
> @@ -239,6 +243,11 @@ struct mpam_quirk {
>  				FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0xf  ) | \
>  				FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0xfff)
>  
> +#define MPAM_IIDR_NVIDIA_T421   FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0x241) | \

MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241

> +				FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0    ) | \
> +				FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0    ) | \
> +				FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b)
> +
>  
>  /* The values for MSMON_CFG_MBWU_FLT.RWBW */
>  enum mon_filter_options {

Thanks,

Ben


