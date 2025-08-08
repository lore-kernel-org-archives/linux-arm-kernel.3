Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2388C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY24UGFb9u8iBNPpAsvI5S42JTMXlvmtmnVmWqhoT3Q=; b=pE7O96mG0vS7FfLrriSwajEGJE
	VZ9bmdfp4bWbe5Z+eTVW/hMOzy3Hcq5iN1HpQfO9zBbMUtROgzUF4E1XviZaTdUNabMzigMjcwd/o
	9aVOvfVy/KDBk130qh0NhruMWhCUe0Z/ydQFdhMPBbm1DS7VrmLjcGnLHIUOUzVMLdBbMqRbmqOWl
	/FxURJETURoEbpPFXpg42PLELk0GN6nCLIfXMOu9ZFw/ocNaqIAEvIGbOSwurKon50z5GK93L2PCn
	4YrrSIU8hhP+Yx2PVzNkqQ6hVQeA8bZx576OOMraczs5GI40KMSRlsgxQ2UTRvVfPcPg8dI0vNec/
	eZuZJOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNWW-00000002xTk-1NZp;
	Fri, 08 Aug 2025 13:52:44 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNTz-00000002xBl-3QuS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 13:50:09 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578Do1vZ559922;
	Fri, 8 Aug 2025 08:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754661001;
	bh=KY24UGFb9u8iBNPpAsvI5S42JTMXlvmtmnVmWqhoT3Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KpOZXcJC6UI0JMMIQjjzKJFL3DcBMf+ucj7oZ1/1T/+XF1kGHfowUNj1qxMEpxrTW
	 YK7TH/Ccj3q0zUHj/Qlvwn9olPCyWbOC4oRkB02Rjbs7IyQey/puymev1Za1m/YmRZ
	 DmA+9MF+Fx9EQjpYOQGxA8XKfweH31IrdTO2afr0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578Do19m1624400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 08:50:01 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 08:50:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 08:50:01 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578Do0JB2830670;
	Fri, 8 Aug 2025 08:50:00 -0500
Message-ID: <bac04814-ed8a-4dad-b5a3-72d0a2fc5d76@ti.com>
Date: Fri, 8 Aug 2025 08:50:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: ti: k3-socinfo: Add support for AM62P
 variants
To: Judith Mendez <jm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf
 Hansson <ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250807225138.1228333-1-jm@ti.com>
 <20250807225138.1228333-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250807225138.1228333-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_065007_948219_E020414A 
X-CRM114-Status: GOOD (  23.18  )
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

On 8/7/25 5:51 PM, Judith Mendez wrote:
> This adds a support for detecting AM62P SR1.0, SR1.1, SR1.2.
> 
> On AM62P, silicon revision is discovered with GP_SW1 instead of JTAGID
> register, so read GP_SW1 to determine SoC revision only on AM62P.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   drivers/soc/ti/k3-socinfo.c | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index d716be113c84..81d078f15cd2 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -15,6 +15,9 @@
>   #include <linux/sys_soc.h>
>   
>   #define CTRLMMR_WKUP_JTAGID_REG		0
> +#define CTRLMMR_WKUP_GP_SW1_OFFSET		544
> +#define GP_SW1_MOD_OPR				16
> +
>   /*
>    * Bits:
>    *  31-28 VARIANT	Device variant
> @@ -66,6 +69,10 @@ static const char * const j721e_rev_string_map[] = {
>   	"1.0", "1.1", "2.0",
>   };
>   
> +static const char * const am62p_gpsw_rev_string_map[] = {
> +	"1.0", "1.1", "1.2",
> +};
> +
>   static int
>   k3_chipinfo_partno_to_names(unsigned int partno,
>   			    struct soc_device_attribute *soc_dev_attr)
> @@ -83,7 +90,7 @@ k3_chipinfo_partno_to_names(unsigned int partno,
>   
>   static int
>   k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
> -			  struct soc_device_attribute *soc_dev_attr)
> +			  struct soc_device_attribute *soc_dev_attr, u32 gp_sw1)
>   {
>   	switch (partno) {
>   	case JTAG_ID_PARTNO_J721E:
> @@ -92,6 +99,14 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
>   		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
>   						   j721e_rev_string_map[variant]);
>   		break;
> +	case JTAG_ID_PARTNO_AM62PX:
> +		/* Always parse AM62P variant from GP_SW1 */
> +		variant = gp_sw1 % GP_SW1_MOD_OPR;
> +		if (variant >= ARRAY_SIZE(am62p_gpsw_rev_string_map))
> +			goto err_unknown_variant;
> +		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
> +						   am62p_gpsw_rev_string_map[variant]);
> +		break;
>   	default:
>   		variant++;
>   		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
> @@ -121,6 +136,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   	struct soc_device *soc_dev;
>   	struct regmap *regmap;
>   	void __iomem *base;
> +	u32 gp_sw1_val = 0;
>   	u32 partno_id;
>   	u32 variant;
>   	u32 jtag_id;
> @@ -163,7 +179,14 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   		goto err;
>   	}
>   
> -	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr);
> +	if (partno_id == JTAG_ID_PARTNO_AM62PX) {
> +		ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG +
> +				  CTRLMMR_WKUP_GP_SW1_OFFSET, &gp_sw1_val);

This is wrong, you cannot read from the register GP_SW1 (offset 544). In DT
the region is 4 bytes long (reg = <0x14 0x4>;).

This only worked in your testing because the above ioremap_resource() has to
map in page sized(4K) chunks and we didn't set max_register in our regmap_config
so no bounds checking is done. If we fix either of the above then this read
will stop working.

So yes you'll have to make DT changes and fight it out with Krzysztof. My
suggestion is to make a efuse region for the 3 GPSW registers and use a
phandle from this node to fetch the extra info you need to get revision.

Andrew

> +		if (ret < 0)
> +			goto err;
> +	}
> +
> +	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr, gp_sw1_val);
>   	if (ret) {
>   		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
>   		goto err;


