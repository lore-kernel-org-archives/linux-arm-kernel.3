Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2729E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQHuheijM5S9Ev2HmelYR2pqAQgPuPjmjnQQD9As+4g=; b=Ld4M4Qyn5j2Qbv+mhR2biXbVvv
	2ek+xh4K2gJqp6xZaaRZlqy8BZhaznwCJaq6v6sVSTYTyZYVABvhvpzcUYboEspvHvdKkjrI65Afu
	m20djpBSVzGR0sy4oKD2u70+pjGOfrrzFqh1udY2jbkIwFZPVef+hVDJCx7qollafGz6fdhSO85dV
	n4sd3ie/OnzEpHDI8mkJjoyRwXAPJps1vau2YwFOUkA4+KHddCD+BU+GUHsxPsqjRoiiZU62RIZSM
	BCVNXwtRjAhGfX+QmMRoI6OC7gdAAVM4Tgk5DM6P34jA8yCUJG0v+TEWS89l4cHkNFIJmV+jRJ2ph
	kdJkzkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWExS-0000000FS9m-3wEB;
	Fri, 10 Jan 2025 13:21:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEdN-0000000FNt3-2zLp;
	Fri, 10 Jan 2025 13:01:09 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ABKFQQ018513;
	Fri, 10 Jan 2025 14:00:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	FQHuheijM5S9Ev2HmelYR2pqAQgPuPjmjnQQD9As+4g=; b=PrWj7vKwAgn4GprH
	hAFpW29a/nqNL1YcXdNh3xRvaX516JfYUlTqtpWAZwdeLA2Fw+o/0FKArGuwKCQL
	ZaRssb0GJC3lVTUEtFrAiXCheBmbgJ+JVfr/WsouR4MegR1JQWrzkfI4KskEunDu
	2AqeLPGWvJ/6+461Y8Uq0VGvpU6YYNmAPitLTNPkZWXiYqvvd9djy2tZVYm/DKdg
	tsP6dVn8MA077hhIMW0FHmT99HeofutidR1llDf6DjDLJhnEzJ46PSWB2rym96FV
	rWOpIr0r6TKGeYxt116/WZQdTKEgHiC+FKDK25ljqsmNni81+BuILH36+lZjT8sr
	ugsywQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442f5q53pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 14:00:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C9D3140046;
	Fri, 10 Jan 2025 13:59:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10BD42B0C96;
	Fri, 10 Jan 2025 13:57:40 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 13:57:39 +0100
Message-ID: <ef1ea5da-4344-4c59-8d2b-1b52533ef0cd@foss.st.com>
Date: Fri, 10 Jan 2025 13:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: stm32: work around constant-value overflow assertion
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon
 Vijay Abraham I <kishon@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Arnd Bergmann <arnd@arndb.de>, Yang Li <yang.lee@linux.alibaba.com>,
        <linux-phy@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241111103712.3520611-1-arnd@kernel.org>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241111103712.3520611-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_050106_058048_7168D697 
X-CRM114-Status: GOOD (  24.51  )
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

Hello,

Sorry, I missed this patch.

The gcc warning bellow is a false positive as the range is necessarily 
between the min_imp/max_imp values, thus imp_lookup will catch, or 
returned -EINVAL earlier

So maybe a more explicit way to shut-up the warning would be to use a 
boolean flag with a WARN_ON, something like:

     bool found;

     for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
      if (imp_lookup[imp_of].microohm <= val) {
          found = true;
          break;
        }
     }

     dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
                         imp_lookup[imp_of].microohm);

     if (WARN_ON(! found))
        return;

     regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
                        STM32MP25_PCIEPRG_IMPCTRL_OHM,
                        FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));

Regards

Christian

On 11/11/24 11:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> FIELD_PREP() checks that a constant fits into the available bitfield,
> but if one of the two lookup tables in stm32_impedance_tune() does
> not find a matching entry, the index is out of range, which gcc
> correctly complains about:
> 
> In file included from <command-line>:
> In function 'stm32_impedance_tune',
>      inlined from 'stm32_combophy_pll_init' at drivers/phy/st/phy-stm32-combophy.c:247:9:
> include/linux/compiler_types.h:517:38: error: call to '__compiletime_assert_447' declared with attribute error: FIELD_PREP: value too large for the field
>    517 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |                                      ^
> include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>     68 |   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
>    115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
>        |   ^~~~~~~~~~~~~~~~
> drivers/phy/st/phy-stm32-combophy.c:162:8: note: in expansion of macro 'FIELD_PREP'
>    162 |        FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
>        |        ^~~~~~~~~~
> 
> Rework this so the field value gets set inside of the loop and otherwise
> set to zero.
> 
> Fixes: 47e1bb6b4ba0 ("phy: stm32: Add support for STM32MP25 COMBOPHY.")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/phy/st/phy-stm32-combophy.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
> index 765bb34fe358..49e9fa90a681 100644
> --- a/drivers/phy/st/phy-stm32-combophy.c
> +++ b/drivers/phy/st/phy-stm32-combophy.c
> @@ -122,6 +122,7 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
>   	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
>   	u32 min_vswing = imp_lookup[0].vswing[0];
>   	u32 val;
> +	u32 regval;
>   
>   	if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
>   		if (val < min_imp || val > max_imp) {
> @@ -129,16 +130,20 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
>   			return -EINVAL;
>   		}
>   
> -		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++)
> -			if (imp_lookup[imp_of].microohm <= val)
> +		regval = 0;
> +		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
> +			if (imp_lookup[imp_of].microohm <= val) {
> +				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
>   				break;
> +			}
> +		}
>   
>   		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
>   			imp_lookup[imp_of].microohm);
>   
>   		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
>   				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
> -				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
> +				   regval);
>   	} else {
>   		regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
>   		imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
> @@ -150,16 +155,20 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
>   			return -EINVAL;
>   		}
>   
> -		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++)
> -			if (imp_lookup[imp_of].vswing[vswing_of] >= val)
> +		regval = 0;
> +		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
> +			if (imp_lookup[imp_of].vswing[vswing_of] >= val) {
> +				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
>   				break;
> +			}
> +		}
>   
>   		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
>   			 imp_lookup[imp_of].vswing[vswing_of]);
>   
>   		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
>   				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
> -				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
> +				   regval);
>   	}
>   
>   	return 0;

