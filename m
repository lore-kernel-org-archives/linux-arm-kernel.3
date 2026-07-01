Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A641C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHLVISdzurZic7l7i2k1INz/1p0kYk6YH6IRHv5/J9I=; b=IW7Tqeqyffi00aDKpOwt8zIB0h
	VXhIeWI5M/h8J7zEBBr5icVrdlM9ie6V33RSGoRG1K4caz2RPxM8KGzjQ9rWkPIFs8XuP4gLNbwiA
	shGq/knhMZG1tbWUc1nj1i5oyOKoAqBlMHKxvtP7wQUo8Qu4BmmlTMil/cpiA6iNlT1JMnujnqRCt
	k8LlHW60asVMYmIWTPnfhuYb6CZCL6eEj/ouDwypzZU1qRKhqTyE7lpHHlSjWdotDL8SN4XmiC5i4
	MWxTW2zMzRWfkgEUh2jHoC1PDzXW/Ld+IkWQwQc5IVfvbb6AtnI4gxhd7cT7ozcMX+dVHP0RdwgxH
	KRHaOarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew7Y-00000002KaB-2QLD;
	Wed, 01 Jul 2026 14:41:00 +0000
Received: from mail-swedencentralazon11013069.outbound.protection.outlook.com ([52.101.83.69] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew7U-00000002KZM-0lJ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:40:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJHlS/l2W6sWPHserplMbBT3UvH2ae074PKbd6WDdR1e2D1Saz39NtD/RZAf6GJfA8wJdiu0JCbTGCjeCzz1mcrNrdVFOeZmtxGwuYNH+vfacOSeCmwuFBWhgIbuZItB8sAqL3boJoC01tbqI2qSzO7KWZRtkJcWV8MpJe3EhywmOCJ81i2fn8lY63GUXBalTf9MgHt8Jla0q99hQyv9HzMz1rFTkYJuWRyLXA6e6mZzp3xQBlhTGh35tQSB/FkzLuzfNkZPPH1yOc1UJxJ3HDccHEyR1M632XuVSgmQVIKs6injjMKtUNe3yJsSqivx3rXI4QR4Q+lxUxysF7exTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHLVISdzurZic7l7i2k1INz/1p0kYk6YH6IRHv5/J9I=;
 b=PjlX40QM9aBs5rKHJrhmKUYlAoSI9xHrANYTbQXMIOWRpXtP1d5V/PuG5+SLP7PhFYXOsP19s9pb+XSnxHzm0VzHwrmAazdXPwkOWF47PFRBCuLPthQfRuCSjby95SM38Tcu0ABYclq0VjrLlwtPdjMweQZw+SZD4o1KYYQ5+aLrQLUM1tCrHCF/joG1fjpddb83aGLkrh5flOWtJ5TocoUyT1BWLqFLnTbeQZmGHx5nXK2kfWmgD3lUK+MS9dZ+tcDY3O4GAS+Ovo4t5iJBEHLIRsPEIJaawTf05VRsn/XXRUJIbuf82Z/c9+ncDlsVSxJ+ndDZLUd9pCsFowDgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHLVISdzurZic7l7i2k1INz/1p0kYk6YH6IRHv5/J9I=;
 b=OAV4t5Sai8RMChhIaguhf23IpmEhiXf2PPDTB6JTTm4jbal39ATe8xyFD2S+38bOaYnB3wLZhDjGrQKA/37qDRiGeqCKG4VsK1Yi8SIHI35r0wZOlie7TREj6fVf3O9nkBuxKMvEOXdpRny91BZlxZ++eSQCz1TZtPUl6VHxc98qyrg73tknrxE8rFfpaQD9G7sJc4JZdACN+geG1Pbg7yamZ53wOu+dtcbCH8O5NSfPJEBX++w2YpvAL1msMbZb10quLHSws0Uhb0585ljleUJ9PZ6/PviGW+ne1p/uj7YwMFwT38Nvy77bLAUMRKr4Urxq6SDS+5P5afhmI/dalg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10710.eurprd04.prod.outlook.com (2603:10a6:800:260::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:40:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 14:40:49 +0000
Date: Wed, 1 Jul 2026 09:40:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 2/2] pmdomain: imx: Fix i.MX8MP VC8000E power up
 sequence
Message-ID: <akUm5AFBhzNwuA3r@SMW015318>
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
 <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-2-ea58ce929c84@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-2-ea58ce929c84@nxp.com>
X-ClientProxiedBy: SA9PR11CA0007.namprd11.prod.outlook.com
 (2603:10b6:806:6e::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10710:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb4c4a0-b383-4c29-b980-08ded77ebe09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: nO2/zkoFhz7t5941ChBkGzr51qNlalGZnDlWXT6RGJk+SkW+ZHmxX3iMVVzE5Boou/8WFppA+tOhLA4c0HLfPcTfd27tzIw3F5nTlbC2Y5G58qTFaRK6tgvMwnPHaXGPLAf0DVK9khaOfWL2YCfl8S1oLdYyNBo0Ur5hASeohQGO+alNqlOs1GN3sd5JB+grpra70N3NZrScMccSiP/4+33CUYV624z5j0b81UWYnPLgGDbeDHafHPpnnasdWWpqtdDLi/PfLc25QLLJ2epQCyOhHDw8pPgx/fnMlR0qiFvCaUsH9hiaO9wJ6q+kG1gOCW/YhYKE+qLbtXyI/yvx+udQ4wPO5Zv+qLFvnGSbzkas6UCseHFJecYJd/rq3r0qrcvrTZyRUBQuW6uMVPaD28oCCLRQTV305m7uA3wGUVOrWHayLoX+xPc9gu0Y6vLjb9Lj3NzXyraIRjBG1w8Wqou6eGDAlWBP7OPCwS6vySgbJt5XRulJC7Nvbsy0U0OWlhtbAsQO3YsnlGAGiMJBwJzXhRoTKlIo0hnn42QLGE9A5+mSVvf1xP2wkrQnL6r3Dfyu+qjNolnTvZl8j+Go2sf6W9NgYBPNK8dI1Qwm+hbkHoTprFkCwxQFujXc8YT7pIDWh3WJq0SEVG4U7BbAZPh8t1Zysef+h+AK5GTkjnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?08HqyORT5F7yQKAivoW4AanVk9mdfFfcrPbqJWqsYYl0LYX+VKwHOhdcyWB6?=
 =?us-ascii?Q?ciYI8AclWEU4CduRf37a7FA16s2w7JJTyqCLz9Ac77zQtDGUuZr4MEKZrp7d?=
 =?us-ascii?Q?y8Nn2G2rMS/x6n0T6LSHoqH9tOjsIqdUl8XEMF7/DPnKhD27uH+ZkwXHMy8V?=
 =?us-ascii?Q?T11Rjvx1EWM56lF6TExWyvJONqwxqb1o+YkG09W7PmBJJ069lymK7qII2hHV?=
 =?us-ascii?Q?k06XX97nnt3eYpep8uk3/I/H214s6X61Z2IBMA/pdF8OIdfFiOAEExKzKT2N?=
 =?us-ascii?Q?O8w4XU+qj8R9BXg854fDty6wjEU4hsEZi6vaDJKSu0ThJUuflQXn9ThYRQWj?=
 =?us-ascii?Q?2bTqytj0u7v9+eRJLuC0BfvPPT6yOO5+xENFkJU0h7/3nmtod0hL5MnugnZC?=
 =?us-ascii?Q?2ZlEQkoyqn8uDQU3GRmXLBcgx7aze5Q69zuozwBy3JwgTKNYzG5gXzIwtrCM?=
 =?us-ascii?Q?GgnVHE3I/zJn48cOsMmkM0c98S9Jr5qpS+9azrb4NH6FHeLil+RVvChPqJEU?=
 =?us-ascii?Q?fRdJ6sxfFzRKCOR56TyrrjHXEnwc87D/PXADuuIOgkNc+ZiSGlQVtn8kj8/R?=
 =?us-ascii?Q?gHRF3fUgjrYkZKLHQYmYc5QizyWU9npumiU6ywwVMoK/W/Csg+naYUEOUSHr?=
 =?us-ascii?Q?H093CoVQwzFf6ZG5Po/SL17wn+J8V93PJQay9yYbYxJO1jPJVDSMsgi8/lje?=
 =?us-ascii?Q?hEpRghFLUStFlIPy+igeHzVWM8mrksmMEzgC3MVgvqSsF2rH1QdaLEWWOEEE?=
 =?us-ascii?Q?K2qNTBPckJg29GRI4vR9xIN9DOHD6RErFZx+M0AqBB1B8Q/63s2RZc84kXP3?=
 =?us-ascii?Q?2JVLSKBuYQUgosyPc5vAKh2wYOUEbEG8uYHR81Gn9+3ys1y7bkJGtjv8nh3l?=
 =?us-ascii?Q?4R4G+ENx7kQJJ1vAK1LLGCXgwBoNFwdw4nj4XH/S5EvRIqQfA0VCrqY2myat?=
 =?us-ascii?Q?ERb+rzkwasNzUKV0yrr0bHfFZ2KFEvYiQwdY0zXan4KqU1RagiKyqjje+RlL?=
 =?us-ascii?Q?KioanP9WtQfE2eFPs/ZjXiJu/YCqHgT8OmOLL4vq10CFKY/P5nSwN3tW/RDz?=
 =?us-ascii?Q?8HFQbVCHrla1dSNkRPLWyw2pqxjzGH2HY3g8TxAFum8+nE7XzASkn6bwRvRr?=
 =?us-ascii?Q?KRh3n1J3NrfwEQI6NNjsF/AQheh8BA/UWK3t4b9YvnyyIvpywY4hg0u1zeyj?=
 =?us-ascii?Q?bFqAAN++iu9B6TvcWqnVrRSNojnHjXCDmNgkRq/rtKjcRdyLaeYxKR5w8TC9?=
 =?us-ascii?Q?1XEDhgt+lFi7BCOCxft1xHl3fvbVjYSTyg08uREsT2NlAsA5q3dDD+tfBl5X?=
 =?us-ascii?Q?5udbVsxDBdzgiAFXfHB8a/CMzgFDTmh9N7CCzU4GrcWESRbxAwPHup4YWNB2?=
 =?us-ascii?Q?+AmOD9RqUAmLvIp/MFr0CUYDAO2LLIag+DPYwlN6ltkuOPrM3Qwh5ZzDuPy2?=
 =?us-ascii?Q?8x0F3yx/Dr7JamRyihG8fp+/ABdz6mg7DCFhBmpRt7CeYH6RQ86aetPxYFw6?=
 =?us-ascii?Q?pJ+2IgwespFDgGAmojSbYMSxIu4IZQw5fw7tVQt7GHLDLz9JVa2YYBwCPdza?=
 =?us-ascii?Q?TXZJPSpHmjeLZkpeGcs4sJIbGh8rX7CzWGMM/U0FVaTd1x4DvMCM14yBnmKf?=
 =?us-ascii?Q?tnDHemnznbsrSR+6k8rLTmwoZILOWkcf93Im5hwHnQH9L+u3lntGefri3W+M?=
 =?us-ascii?Q?/v2PB6pE1XtbKF6zwHEM56T1BSgVwdhod/YTb8mC8h6Ur9WS2QVU1cmVEM+y?=
 =?us-ascii?Q?z0MYrOnX5/bNpDKGGzlLTOwVGsCaAVtucpw6ZjNsScdzxNM/gUao?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb4c4a0-b383-4c29-b980-08ded77ebe09
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:40:49.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Yh/yuA9lC/goHs/c+5A5JP9VhQwEeYhVH8hQwKn6sVHIdRu5JsmJGGigfVT45fojUc6vamNd5DivtKK0GZyENHWtmRiCr4LkZViP14pKirSvw+SErfooeVwuRpfBQWJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_074056_220745_8584326D 
X-CRM114-Status: GOOD (  22.13  )
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

On Wed, Jun 10, 2026 at 10:39:11PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Per errata[1]:
> ERR050531: VPU_NOC power down handshake may hang during VC8000E/VPUMIX
> power up/down cycling.
> Description: VC8000E reset de-assertion edge and AXI clock may have a
> timing issue.
> Workaround: Set bit2 (vc8000e_clk_en) of BLK_CLK_EN_CSR to 0 to gate off
> both AXI clock and VC8000E clock sent to VC8000E and AXI clock sent to
> VPU_NOC m_v_2 interface during VC8000E power up(VC8000E reset is
> de-asserted by HW)
>
> Add a bool variable is_errata_err050531 in
> 'struct imx8m_blk_ctrl_domain_data' to represent whether the workaround
> is needed. If is_errata_err050531 is true, first clear the clk before
> powering up gpc, then enable the clk after powering up gpc.
>
> [1] https://www.nxp.com/webapp/Download?colCode=IMX8MP_1P33A
>
> Fixes: a1a5f15f7f6cb ("soc: imx: imx8m-blk-ctrl: add i.MX8MP VPU blk ctrl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index e13a47eeed75..99d100e1d923 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -54,6 +54,15 @@ struct imx8m_blk_ctrl_domain_data {
>  	 * register.
>  	 */
>  	u32 mipi_phy_rst_mask;
> +
> +	/*
> +	 * VC8000E reset de-assertion edge and AXI clock may have a timing issue.
> +	 * Workaround: Set bit2 (vc8000e_clk_en) of BLK_CLK_EN_CSR to 0 to gate off
> +	 * both AXI clock and VC8000E clock sent to VC8000E and AXI clock sent to
> +	 * VPU_NOC m_v_2 interface during VC8000E power up(VC8000E reset is
> +	 * de-asserted by HW)
> +	 */
> +	bool is_errata_err050531;
>  };
>
>  #define DOMAIN_MAX_CLKS 4
> @@ -108,7 +117,11 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>  		dev_err(bc->dev, "failed to enable clocks\n");
>  		goto bus_put;
>  	}
> -	regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +
> +	if (data->is_errata_err050531)
> +		regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +	else
> +		regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
>
>  	/* power up upstream GPC domain */
>  	ret = pm_runtime_get_sync(domain->power_dev);
> @@ -117,6 +130,9 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>  		goto clk_disable;
>  	}
>
> +	if (data->is_errata_err050531)
> +		regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +
>  	/* wait for reset to propagate */
>  	udelay(5);
>
> @@ -511,6 +527,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mp_vpu_blk_ctl_domain_data[]
>  		.clk_mask = BIT(2),
>  		.path_names = (const char *[]){"vc8000e"},
>  		.num_paths = 1,
> +		.is_errata_err050531 = true,
>  	},
>  };
>
>
> --
> 2.51.0
>
>

