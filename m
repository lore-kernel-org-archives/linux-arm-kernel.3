Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA80C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlGmQIimNNv0zNQkUs5tyS2Zt6/GWcnEpjM3m+LZ9Zg=; b=mWXiJr/C8QOW7dJEPOa5SNMAI+
	k2XXORLiAKixOmcyIqQ0PiNDo6dm71Ry3URXNwFJWIIoJ++w3wFbj+WYWcZ4C4Nw5DvgAgXIM/da8
	ROr6MAUxcmalCskyWTqedbsBtKSxiYXfpDK9m7vzwkRiJhGwHOOHp4cZSCYNl4NryIuawHN+3zg+w
	+c214IzyITUe0M3syKhCS+wiQ6j17Ej8AtZlPQ/hfsZ8AZuijvADa4R7mS3dSGRbIUjshrEn3Me2X
	dEVLABtJ9h6mKfTbNCda35iQeCsv6KOhd0td3ALXTTlOJQlWCB1+c8VbAcw/sp65g673RLEJ3ZDgB
	HZD9aUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hUA-0000000EvWl-2FBR;
	Thu, 10 Sep 2026 16:18:50 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hU5-0000000EvVG-3zpF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:18:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcCfDH6iLhVzdrERKmRo3aWr6AqmIhmnqwMk9pJurqhYVp8v/TRQWAWhHPiJhRZ+0T5cD3/f54UDxu81mn+T1garkOgHkdLhI2IvriXWZTMD/smhclbR5z9lemkjg1+JJZLQRX7XBW5I3f5UMji3e1A2qDu4n6VJ+hH5guOsguVgZqmHvXboFirzZohqbhIO1NcLiVGB8ynUHj+VOFgjcjNe0nWrhzrchPSjzE/sypkGpre+JLBmauZpPeCMXuHOQYzobCMd5fIOEseN4gIYqhVTiprx7Gws/+i7BPfP56CRThLy9lY7sHkUudOpx7iKtunPOc0b/8Ov496k0fMkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlGmQIimNNv0zNQkUs5tyS2Zt6/GWcnEpjM3m+LZ9Zg=;
 b=pUcUp4r3DEvPMK32PAuijq0EJGsRU9bPzm+faLE7qb+2l9oBQ6b4sAMLz9sF+0kc8UGrh1Axpve2iYsh6GKq92QldOLbvIsTWJ5Ahr7WkbTMGYwRKSREh/lszy14bHrrMHpyHmoF0yhWxwW3v2AjXVL3ZJtyo8gwVAhQjYSEI/gEpSyLmQmz21BfqIYE2PlM5kTzDMvhidfmUJJzRhQiGKeBOwvpbJHK2OBphX3DgdX6iicwCs2gmMT8oYq685I3+99XMESDdMcF33aXOZ8HWCX+p+TL5rBCn7nH/ao1+hN20jadIeZmXH8dTG0m2Dgl3IuaFVyC0Fuhz2ER7dNysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlGmQIimNNv0zNQkUs5tyS2Zt6/GWcnEpjM3m+LZ9Zg=;
 b=EzPY8qGCs2wXC6OQzA/rqgz6IFnxcQOuW8feXumVGIkojoQEK6uWZkugP9bel7Ry5XhBaqT1qvPLqAf+MbQn1V+A/AN++rwydEJH3m4WLhAwEGoZ/ji72seOrxGqiXOw/5zDRvvhajM0ioAgr+Z76HsQsjMrBKUhwC6sYTavg94YFvkq1N968QdSIaNIYJ0tSqKToPta1q18BEV6ThJ7aW+6KlZG2I5WWNWCkdV6WItyQzUz3lCCyPiDI1mLdscPyWRTk33xdQ/qYBqXebGPFatHvppQXv18MSAaJlUqa943W7/o8jCAdebgWinU4f5ti1UMZrRy2BjMw4jc3NTd4g==
Received: from DU2P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::32)
 by AS2PR10MB7021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:59b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:18:35 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::2c) by DU2P251CA0028.outlook.office365.com
 (2603:10a6:10:230::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 16:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 16:18:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 18:24:36 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 18:18:33 +0200
Message-ID: <ced0e0f8-c077-4329-b7cc-4387ab415d27@foss.st.com>
Date: Thu, 10 Sep 2026 18:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3
 xHCI USB controller glue
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Rob
 Herring" <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260910052340.246717-1-marex@nabladev.com>
 <20260910052340.246717-2-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260910052340.246717-2-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|AS2PR10MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 596af608-397d-460b-c033-08df0f5729d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|23010399003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: eed0GDtw734op/yOSD3vaFdfIiJKhU8L1xcZymP+z0XulC3P2O9nXDRrQG9ZBMzJFikFNZsFJpmnp/3WZ254eVNRf+/ZgnWm8fb6rjDVsXD9MRL7x5WsIkOGOl9E9ESRkN0TdW0DO2vRV+kzRkS6gryiDiMM+erYLO6aCxwbCel/cW5JKmHF2ckYKhXecA0r63ER5V3+OY/PUSj113Zv84X1/9XyLc20Y0sSq5kFbagQLUeg4FYHSCIyy3grEBN4k4UJq4Y0mKXadMO13/G0M/APYT0msuhlu0LIO46xl4kr4Psk5oibOrRr8GtZfh3eNDWqIWjZnpZ5IkhoqnmvNi3eVCJ2NE205ENxmG9+z9ApJvNjm4Kb92qL0oFEghN/qtyCei6uXUloAP0xNhjS28Lgj11qHJDzzCJld2XcgOtKiFpil4RYLu3x/34pf/WvTR84wZ8930cbGp/tqpSlaSGjvz4zLHhgIv+4xZNvdVPCnU0v631FC7qNzEXHcy573hymb+DW3W90/DH+F83mpcQz7TGJo30WI5+LuOGfKj30VxPlAWF/eB/p5l/+gutBWK+UyZqXfE9yzuQWmAnn/D7/+k+vZY7xi42pOfROxXfmZ12GSXFRnk6NfTFrzuJ1WXBY/nohftMk38C39gblKcuKUlzP661P66eVKmeKfIMxdzmGGNlgHhEpmsAjAFFwbJk933yl73v7dbYXd41l3w==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z4HNUdDPxFzwxr5e72N47tzHBVCIOh1wYmo7rcbCsYi+Gicblmg3mI+cN1L+gRkLm3sBmhOkZVofKqJSe3c0m0EMltxj9Jfqae9PvVrm0PYZ2pHrOdH5y4E/nLuL5E51EePjK61xxbOs7jLrmtH4Fn14V24lQYEFfoFaJZiZyh2obkDxaj7K6AcmKubZTy+6I6WYaX4gctRl5SOVOAZuzm/FLf4PGesEfSLo3c4bwcC4ak1yFbEqSFMNdTsE/XCgoZCPXPpRj82YEjAzVB+8aTn0YVgd0QiujVqxmHa+AV5orGBmvBb0FgBZPd+TNwzn6auRzCx/0u8sfUdWuV+Tq1Xbw6+11Vcwa5iSoimoox2RNOiLS21DzIT8LK/HMGDn7Qs3Whq/kIqb6uBKCtlCKSXO7C7PcBA4N9HEBeLKGw7hoz9viS9QSKl+ao5rNO6u
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:18:34.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 596af608-397d-460b-c033-08df0f5729d5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_091846_002498_82C956D5 
X-CRM114-Status: GOOD (  21.48  )
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

On 9/10/26 07:22, Marek Vasut wrote:
> The ST STM32MP2 SoC contains one instance of DWC3 USB controller with
> glue logic wrapper around it controlled by syscon. Extend the generic
> DWC3 platform driver with ST STM32MP2 glue logic specifics.
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Hi Marek,

You can add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

BR,
Fabrice

> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: No change
> V3: - Use generic over-current-active-low
> V4: - Include bitfield.h
>     - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: - Reorder usb2only_conf to improve readability
>     - Drop superfluous !!
>     - Add AB from Thinh
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07ce..2dce1f24615c8 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -7,6 +7,7 @@
>   * Inspired by dwc3-qcom.c and dwc3-of-simple.c
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> @@ -22,6 +23,12 @@
>  #define EIC7700_HSP_AXI_LP_XM_CSYSREQ	BIT(0)
>  #define EIC7700_HSP_AXI_LP_XS_CSYSREQ	BIT(16)
>  
> +#define STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT	BIT(0)
> +#define STM32MP2_USB3DRCR_OVRCUR_POLARITY			BIT(1)
> +#define STM32MP2_USB3DRCR_VBUSEN_POLARITY			BIT(2)
> +#define STM32MP2_USB3DRCR_USB2ONLYH				BIT(3)
> +#define STM32MP2_USB3DRCR_USB2ONLYD				BIT(4)
> +
>  struct dwc3_generic {
>  	struct device		*dev;
>  	struct dwc3		dwc;
> @@ -85,6 +92,39 @@ static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
>  	return 0;
>  }
>  
> +static int dwc3_stm32mp25_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev = dwc3g->dev;
> +	bool ovrcur_polarity_low = device_property_read_bool(dev, "over-current-active-low");
> +	bool prt_pwr_ctrl = device_property_read_bool(dev, "st,enable-port-power-control");
> +	bool vbusen_polarity_low = device_property_read_bool(dev, "st,vbusen-active-low");
> +	bool usb2only_conf = false;
> +	struct regmap *regmap;
> +	u32 drcr;
> +
> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
> +		usb2only_conf = true;
> +
> +	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg", 1, &drcr);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "No st,syscfg phandle specified\n");
> +
> +	return regmap_update_bits(regmap, drcr,
> +				  STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT |
> +				  STM32MP2_USB3DRCR_OVRCUR_POLARITY |
> +				  STM32MP2_USB3DRCR_VBUSEN_POLARITY |
> +				  STM32MP2_USB3DRCR_USB2ONLYD |
> +				  STM32MP2_USB3DRCR_USB2ONLYH,
> +				  FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
> +					     prt_pwr_ctrl) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_OVRCUR_POLARITY,
> +					     ovrcur_polarity_low) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_VBUSEN_POLARITY,
> +					     vbusen_polarity_low) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYD, usb2only_conf) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYH, usb2only_conf));
> +}
> +
>  static int dwc3_generic_probe(struct platform_device *pdev)
>  {
>  	const struct dwc3_generic_config *plat_config;
> @@ -231,12 +271,18 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
>  	.properties = DWC3_DEFAULT_PROPERTIES,
>  };
>  
> +static const struct dwc3_generic_config stm32mp25_dwc3 =  {
> +	.init = dwc3_stm32mp25_init,
> +	.properties = DWC3_DEFAULT_PROPERTIES,
> +};
> +
>  static const struct of_device_id dwc3_generic_of_match[] = {
>  	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
>  	{ .compatible = "spacemit,k3-dwc3", },
>  	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>  	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>  	{ .compatible = "starfive,jhb100-dwc3", },
> +	{ .compatible = "st,stm32mp25-dwc3", &stm32mp25_dwc3 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);


