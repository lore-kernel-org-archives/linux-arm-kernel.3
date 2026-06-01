Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1511BCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKRFzYvXWuNL9Vqrh3NvKjoD05ULnG52YciFxh7iz+Y=; b=PrLMKWFLdXSOE4VkzHbWIeOIAe
	WNadW5PpJHt+H6KFz7eQImAeGkEG9z2fzorgBLb69YL7b5yCZgpSzHv13T2I3bx8etLD4iNrKLXbU
	I2BtyxjK63sNr90BNFru3BHUOgrw2nnoSWPq7mjuPsQf48Yvwj/ElJFtdVSHar9y+NZgBv5VZ+NXd
	Xx28xXmjGUtjiIBowRHNKXz+5ECZnwtIRqJk0KwuTGeY7DVKIJ9dGWxiX2UNKAZJ6zTRMyMSBf08V
	6D4TVFQnGSiEPwdbqp4ZUYdlFSL1a9suTu5RdLcywnkVb4+zC13DYgKdOaJbTH20+YJpQvFzmtiLB
	lmfMiEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6ku-0000000Bbzm-26Ce;
	Mon, 01 Jun 2026 17:48:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6kp-0000000Bbyu-3sY6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 17:48:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7032175D;
	Mon,  1 Jun 2026 10:48:38 -0700 (PDT)
Received: from [10.57.36.65] (unknown [10.57.36.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FC213F7D8;
	Mon,  1 Jun 2026 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780336123; bh=OpzHICScFogskndyr2+DyN1dxiPGmzVPdDXVPfFt2kE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mpZWNuiqI2HXeRxY/CAO7WyiRRhaHAFJJivZEEl2i1t7Z44zAfp2IRFVsfNX0+5Jv
	 A33U8QuTySQuK3bbL8vp+tCFLhLbsKPGAiz/327mpls++d+PpMMXRajFcFvmF1txEv
	 qewt3Jwdyv01/x2IPtkPZOGBIkJntPja3uFtC32Y=
Message-ID: <2eccafbc-f215-4021-8491-31e5835de49e@arm.com>
Date: Mon, 1 Jun 2026 18:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] perf/arm-cmn: Add workarounds for CMN-S3 on
 Graviton5
To: Aviv Bakal <avivb@amazon.com>, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, zeev@amazon.com, blakgeof@amazon.com,
 ilkka@os.amperecomputing.com
References: <20260524153848.16334-1-avivb@amazon.com>
 <20260531110447.10095-1-avivb@amazon.com>
 <20260531110447.10095-3-avivb@amazon.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260531110447.10095-3-avivb@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_104848_130414_28C036EC 
X-CRM114-Status: GOOD (  24.84  )
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

On 2026-05-31 12:04 pm, Aviv Bakal wrote:
> Graviton5 uses a customised CMN-S3 implementation where certain
> discovery registers report zeroed fields. Add the following workarounds:
> 
>   - Introduce a dedicated ACPI HID to identify the Graviton5 CMN variant.
>   - Derive the DTC domain from the XP node ID, since the unit info
>     register reports it as zero.
>   - Set the DTC logical ID from the XP's logical ID, since the node info
>     register's logical ID field is also zeroed.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Aviv Bakal <avivb@amazon.com>
> ---
>   drivers/perf/arm-cmn.c | 32 +++++++++++++++++++++++++++++++-
>   1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index f1978a53d1c1..3fb71d9a57eb 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -31,7 +31,8 @@
>   #define CMN_CHILD_NODE_ADDR		GENMASK(29, 0)
>   #define CMN_CHILD_NODE_EXTERNAL		BIT(31)
>   
> -#define CMN_MAX_DIMENSION		12
> +/* Some implementations use a mesh larger than the architectural max of 12 */
> +#define CMN_MAX_DIMENSION		14
>   #define CMN_MAX_XPS			(CMN_MAX_DIMENSION * CMN_MAX_DIMENSION)
>   #define CMN_MAX_DTMS			(CMN_MAX_XPS + (CMN_MAX_DIMENSION - 1) * 4)
>   
> @@ -214,6 +215,8 @@ enum cmn_part {
>   	PART_CMN700 = 0x43c,
>   	PART_CI700 = 0x43a,
>   	PART_CMN_S3 = 0x43e,
> +	/* Synthetic part number, overridden to PART_CMN_S3 during discovery */
> +	PART_GRAVITON5 = 0xa5,
>   };
>   
>   /* CMN-600 r0px shouldn't exist in silicon, thankfully */
> @@ -2250,6 +2253,18 @@ static unsigned int arm_cmn_dtc_domain(struct arm_cmn *cmn, void __iomem *xp_reg
>   	return FIELD_GET(CMN_DTM_UNIT_INFO_DTC_DOMAIN, readl_relaxed(xp_region + offset));
>   }
>   
> +static unsigned int arm_cmn_graviton5_dtc_domain(u16 xp_id)
> +{
> +	unsigned int x = (xp_id >> 7) & 0xf;
> +	unsigned int y = (xp_id >> 3) & 0xf;
> +
> +	/*
> +	 * The unit info register reads as zero; derive the DTC domain from
> +	 * the XP's mesh coordinates over the 10x14 mesh.
> +	 */
> +	return (x / 5) + (y / 7) * 2;
> +}
> +
>   static void arm_cmn_init_node_info(struct arm_cmn *cmn, u32 offset, struct arm_cmn_node *node)
>   {
>   	int level;
> @@ -2295,6 +2310,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   	u64 reg;
>   	int i, j;
>   	size_t sz;
> +	bool graviton5_workaround = false;
>   
>   	arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
>   	if (cfg.type != CMN_TYPE_CFG)
> @@ -2305,6 +2321,13 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   	reg = readq_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_01);
>   	part = FIELD_GET(CMN_CFGM_PID0_PART_0, reg);
>   	part |= FIELD_GET(CMN_CFGM_PID1_PART_1, reg) << 8;
> +
> +	/* Graviton5 has a customised CMN-S3 which needs some fixups */
> +	if (cmn->part == PART_GRAVITON5) {
> +		cmn->part = PART_CMN_S3;
> +		graviton5_workaround = true;
> +	}
> +
>   	/* 600AE is close enough that it's not really worth more complexity */
>   	if (part == PART_CMN600AE)
>   		part = PART_CMN600;
> @@ -2394,6 +2417,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   
>   		if (cmn->part == PART_CMN600)
>   			xp->dtc = -1;
> +		else if (graviton5_workaround)
> +			xp->dtc = arm_cmn_graviton5_dtc_domain(xp->id);
>   		else
>   			xp->dtc = arm_cmn_dtc_domain(cmn, xp_region);
>   
> @@ -2472,6 +2497,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>   
>   			switch (dn->type) {
>   			case CMN_TYPE_DTC:
> +				if (graviton5_workaround) {
> +					/* Node info logical ID is zeroed; use the XP's */
> +					dn->logid = xp->logid;
> +				}
>   				cmn->num_dtcs++;
>   				dn++;
>   				break;
> @@ -2687,6 +2716,7 @@ static const struct acpi_device_id arm_cmn_acpi_match[] = {
>   	{ "ARMHC650" },
>   	{ "ARMHC700" },
>   	{ "ARMHC003" },
> +	{ "AMZN0070", PART_GRAVITON5 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);


