Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2293BF532D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 04:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMM0PIHjaGNSwkTYUN4aTP3OrCjUF8tNj7svjVlstlQ=; b=HFNfSWqSkQufI9Fudi0VswK7CO
	HCM41PSCovJ3HzZKnkyk/6aZWg+CMPFzwyOPJFjetyjPqEaaa8R1UlozSzVONvbZeqENzRmPrPuXi
	d+/AwvrLt4xjR3oJPpGjJHZT15g3A6DCjxLd957fyRBOroMYQzshJ6X+cgrl/vFlo218s0HXi0Rek
	lzaqvVA2nHgtwbqMTGEmjxf1ph0Kj6TPkkj6GvpdoO8TI2gmiOzpzQ/4/T1W8/g4abbEWF9bqp3SH
	wgaP9zZxBX0+DvBrQXlnw6/eMxWxwtupi9qb5mxHVB6KCNgRzTtGQBHZQsFZJiBhDwpACasoqSAxa
	KY8iJHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tCi-00000000X6I-0qEc;
	Tue, 24 Mar 2026 04:17:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tCf-00000000X5o-441S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 04:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774325836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMM0PIHjaGNSwkTYUN4aTP3OrCjUF8tNj7svjVlstlQ=;
	b=X4K2ebkIrnkXYXEgBpsZ50TNuHEb5sJMw/P+lmq3ihZtn9hQWglO/iEwAZEpuLMWOQZ6a2
	bAVhKs13LAex7RcRGVkpAT4mMlbyX8j2fa0pB/07beslg4moQ5wwr+c22Hqs48kPXHagKM
	AcyIwZYKREE4DqhApLBC6oRCr7tiQRA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-gyGMYuTAP4mxhAB_xeoOug-1; Tue, 24 Mar 2026 00:17:14 -0400
X-MC-Unique: gyGMYuTAP4mxhAB_xeoOug-1
X-Mimecast-MFC-AGG-ID: gyGMYuTAP4mxhAB_xeoOug_1774325834
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b9894f9ceso6047719a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 21:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325834; x=1774930634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMM0PIHjaGNSwkTYUN4aTP3OrCjUF8tNj7svjVlstlQ=;
        b=U2I/GpCyWDNWg8iN4+bY2i/hbZNIUO/McoXaX+cpYgHJ0ig1PHkFHFg3zrNwPpwnpi
         vbnFAsOzgJ0QNTlhwfDEjBAJ6JuRZS8667/KEi/K4QnMVFX4uDEQEtmpcIM3Jv3+sbW2
         NDrf60N0+bs9sc91cs85yLKnDDNa3pSUR+IfCeO/1EmWkU6ucwVjgeX5tx5f7qGI6T3R
         LooCvnnjo4gQ2wHIR6Pk6BcUlIWAbRL9kpzuXeJcFXDGV39ewSribTvLDUb+rDyYrqYR
         +wubGsxzfgX3IeKceniNq6sqblLJLvK6t9JrVKVdY17MKatcoMSTZjEMSm5lqhmGFgin
         igcg==
X-Forwarded-Encrypted: i=1; AJvYcCULT4oJoWYo2i4Ytpd/tvAJs2pNsmCP/HkjBGKCR5ULEYMuMceCLzTEsIXEd9V0ZeGeg/QDujc2//JW4Gm1WTzA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7EcYh1YGyqATQNQxr+FNHprKcAkf8JBx4kRAKY5bvwFeF5AJz
	rVInfKK9d+9DuplTUFqWwYRGDLTgnC/mVQ3g5SsES6qBjbHX451ss/f0k3CSTJiU8EB1JCHBWzS
	ZRp9+JDz8tcNr0GN9bOyYAfSrypvwj0J4969WEKGQh35hiIv4qCO4NZ3ORqJVwtbYyQLMcoVFw5
	uP
X-Gm-Gg: ATEYQzyKzsEBnY8TEmL2hfYqiqZ11ayPxyC2MCjykFawMzOcZv1bBWFsB6H6N06gg8F
	RKYkTq1V3LQ+GaVU7BjQMVbiFonAwfap7oa6V6xs8wLwXM6HFRxWNYstN2wKvyaymZ16U4FxbKh
	22pE72pl8FdTcrRtA8eubX0ytiWSewrlJauluHwyyTrxIGOycfJU2nnmd+hSnS+eFRS0zsl0Xze
	dyDfRyDW76uyXgeFGLw9SJP/kk7tpoo62UUmLb/+tkeL2ws80+fhpY679QUkznLN1JqdM4d70v3
	QCVjTgkVn6CY9Gek/rp41zYdLQwenem67sfZc8yK4LHPbvozB8/v8Pu5Zc12w7KItwvmt7nx6GA
	Np5fvbRnAQXSg75Si4HNzgWSC0FDT4f5o4vZzYhQfY7+cw2/aT/uPfIiEZQDvFfyJ
X-Received: by 2002:a17:90b:33cd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35bd2b9743dmr11784486a91.7.1774325833651;
        Mon, 23 Mar 2026 21:17:13 -0700 (PDT)
X-Received: by 2002:a17:90b:33cd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35bd2b9743dmr11784442a91.7.1774325833157;
        Mon, 23 Mar 2026 21:17:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03220321sm691413a91.17.2026.03.23.21.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:17:12 -0700 (PDT)
Message-ID: <7b73d10e-4bfd-434f-b05f-25c4859a7abd@redhat.com>
Date: Tue, 24 Mar 2026 14:16:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 36/40] arm_mpam: Add workaround for T241-MPAM-1
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-37-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-37-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hgYXqIgb50MtEpBOM7f3_1_f_c5Sh_4ZeJp81xfITmI_1774325834
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_211718_110094_05606AB5 
X-CRM114-Status: GOOD (  40.58  )
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

Hi Ben,

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The MPAM bandwidth partitioning controls will not be correctly configured,
> and hardware will retain default configuration register values, meaning
> generally that bandwidth will remain unprovisioned.
> 
> To address the issue, follow the below steps after updating the MBW_MIN
> and/or MBW_MAX registers.
> 
>   - Perform 64b reads from all 12 bridge MPAM shadow registers at offsets
>     (0x360048 + slice*0x10000 + partid*8). These registers are read-only.
>   - Continue iterating until all 12 shadow register values match in a loop.
>     pr_warn_once if the values fail to match within the loop count 1000.
>   - Perform 64b writes with the value 0x0 to the two spare registers at
>     offsets 0x1b0000 and 0x1c0000.
> 
> In the hardware, writes to the MPAMCFG_MBW_MAX MPAMCFG_MBW_MIN registers
> are transformed into broadcast writes to the 12 shadow registers. The
> final two writes to the spare registers cause a final rank of downstream
> micro-architectural MPAM registers to be updated from the shadow copies.
> The intervening loop to read the 12 shadow registers helps avoid a race
> condition where writes to the spare registers occur before all shadow
> registers have been updated.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> 
> Changes from James:
>    Merged the min/max update into a single
>    mpam_quirk_post_config_change() helper. Stashed the t241_id in the msc
>    instead of carrying the physical address around. Test the msc quirk bit
>    instead of a static key.
> 
> Changes since rfc:
> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
> return err from init
> Be specific about the errata in the init name,
>    mpam_enable_quirk_nvidia_t241 -> mpam_enable_quirk_nvidia_t241_1
> 
> Changes since v3:
> parentheses
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  2 +
>   drivers/resctrl/mpam_devices.c              | 88 +++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h             |  9 +++
>   3 files changed, 99 insertions(+)
> 

One question below.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 4c300caad901..a65620f98e3a 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -247,6 +247,8 @@ stable kernels.
>   +----------------+-----------------+-----------------+-----------------------------+
>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>   +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>   +----------------+-----------------+-----------------+-----------------------------+
>   | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
>   +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index e66631f3f732..b1753498f07f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -29,6 +29,16 @@
>   
>   #include "mpam_internal.h"
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
>   /*
>    * mpam_list_lock protects the SRCU lists when writing. Once the
>    * mpam_enabled key is enabled these lists are read-only,
> @@ -630,7 +640,45 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>   	return ERR_PTR(-ENOENT);
>   }
>   
> +static int mpam_enable_quirk_nvidia_t241_1(struct mpam_msc *msc,
> +					   const struct mpam_quirk *quirk)
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
> +		return -EINVAL;
> +
> +	r = platform_get_resource(msc->pdev, IORESOURCE_MEM, 0);
> +	if (!r)
> +		return -EINVAL;
> +
> +	/* Find the internal registers base addr from the CHIP ID */
> +	msc->t241_id = T241_CHIP_ID(r->start);
> +	phys = FIELD_PREP(GENMASK_ULL(45, 44), msc->t241_id) | 0x19000000ULL;
> +
> +	t241_scratch_regs[msc->t241_id] = ioremap(phys, SZ_8M);
> +	if (WARN_ON_ONCE(!t241_scratch_regs[msc->t241_id]))
> +		return -EINVAL;

Those IO regions aren't unmapped when the MSCs are removed. I guess it would be
something to be improved? :-)


> +
> +	pr_info_once("Enabled workaround for NVIDIA T241 erratum T241-MPAM-1\n");
> +
> +	return 0;
> +}
> +
>   static const struct mpam_quirk mpam_quirks[] = {
> +	{
> +	/* NVIDIA t241 erratum T241-MPAM-1 */
> +	.init       = mpam_enable_quirk_nvidia_t241_1,
> +	.iidr       = MPAM_IIDR_NVIDIA_T241,
> +	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
> +	.workaround = T241_SCRUB_SHADOW_REGS,

Perhaps we need a more leading space for every line in the above block.

> +	},
>   	{ NULL } /* Sentinel */
>   };
>   
> @@ -1378,6 +1426,44 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>   	__mpam_write_reg(msc, reg, bm);
>   }
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
>   /* Called via IPI. Call while holding an SRCU reference */
>   static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>   				      struct mpam_config *cfg)
> @@ -1457,6 +1543,8 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>   		mpam_write_partsel_reg(msc, PRI, pri_val);
>   	}
>   
> +	mpam_quirk_post_config_change(ris, partid, cfg);
> +
>   	mutex_unlock(&msc->part_sel_lock);
>   }
>   
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index e28a168419d4..e38954a735d8 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -130,6 +130,9 @@ struct mpam_msc {
>   	void __iomem		*mapped_hwpage;
>   	size_t			mapped_hwpage_sz;
>   
> +	/* Values only used on some platforms for quirks */
> +	u32			t241_id;
> +
>   	struct mpam_garbage	garbage;
>   };
>   
> @@ -220,6 +223,7 @@ struct mpam_props {
>   
>   /* Workaround bits for msc->quirks */
>   enum mpam_device_quirks {
> +	T241_SCRUB_SHADOW_REGS,
>   	MPAM_QUIRK_LAST
>   };
>   
> @@ -240,6 +244,11 @@ struct mpam_quirk {
>   				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0xf)	 | \
>   				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0xfff))
>   
> +#define MPAM_IIDR_NVIDIA_T241	(FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0x241) | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)	 | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	 | \
> +				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b))
> +
>   /* The values for MSMON_CFG_MBWU_FLT.RWBW */
>   enum mon_filter_options {
>   	COUNT_BOTH	= 0,

Thanks,
Gavin


