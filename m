Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48506CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTz9UJSuLnUeUGTINRq3Is75pzH9w51wh7zvg4E2a/E=; b=1BTeCQSCIlKt63V4/IgwoPlXBf
	3CjOssR/cb+LkPyvQgWJwecTCdy+IQpPbwAAuJx7XGYuGC+YDP6NTZeD/VFxPpvuPvmtTC+uyjCqv
	xoXsOWz9YBILIJ4yGJLsghqVxyvujqSzpdURxJsVI8pu0F1GFvlcdjmiEyqRIUyL0fwDLLTv+DYIt
	I4istdM3jO//rO2FoHlFz6ajTkDfYvA/MbqwhO2yQLxE2sCdcoG7CtudONuzqsZX1VgljgU3sG7gn
	raEVVXkfu5lmEHurAf7a3dDniFiVX07y3J5AnbdBxnKYEpRHuTR6Bu+rPkiGmeluAEj83QQJxrDMD
	JknFp9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2hP-0000000FuYK-03ug;
	Thu, 06 Nov 2025 16:18:59 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2hM-0000000FuXR-3J6W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:18:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fro91cMQTmhpT/9ci68ez2Y/EPLtMH4baCniBoYVS6hZUWuhFOApEujuLYcz4kM1obrqvqE1PAciwSOupwYiMFXle3sqFu9k3NTt/Z2yNQgm9vKqWrksQBzfxrNM0o7JCHizqWmTUeXxBsmKA+ddIXBeJIompq7WBomtJDt+YgJOfGAxQhGwMeq0brktN1iPZzr0w8MoGzyT4td7//YH5BOESxXrmyeO5AIKMQbb6WYWhGobj5kt12IcvhLw5CDR31hF5ThaSps+yLhkLW5v7EIrr9cg2ziwMcScVhG2CgL3XhA2uXZD4kcRqEHjYccr14fsc5vEuYpfLhuY3AyMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTz9UJSuLnUeUGTINRq3Is75pzH9w51wh7zvg4E2a/E=;
 b=WO5pXicwrPNqliksPhaneraRRUzyryfKwfRdpF+trRQH6Q9FZuchpLb4tyBb/U/5NiWKbXDEPaNaAAdU3CSsKabjfpFpLMMkzBSkFEini6VqntGVZn0N21oRGm3T0tGp4u87hMWXYgvzU55b63ZbrUG8ubgfri52YIqCFrVMJsLbQDjAsu7PJDQ7eQb1WFCiLxp8BL8rHgOZSiNsC+VfNT+jATguW2PghZjliCi+crN37c9DzYCTPiCwrvlnUS46j3PQ0RRBUqVtOrpiWE1yu+m/Cd3zEOjX8Yo3CcYRROq21Zjd/ZxcB2piT8CEXkrfC1vXDquw7QVbHNHym75Cpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTz9UJSuLnUeUGTINRq3Is75pzH9w51wh7zvg4E2a/E=;
 b=VqgjbaIJSBfJaTZT4VLGEVNG+wmBwCLaeti95wAzswzd3ksQC5uN1DBe1Eq5Qt9Alu5XOpTAgN+TgdwsDDtYZeMI4wNn2V47LdrX1TF4l/MdpVkucwsP+v6NujfH5RRcbCtLrVoMMkxWWOINYlqkUk0+F6V8liMvoRFPBUPTN/zrBjJTCezRkQ17aQH4cyS4lrRGbu6FZUk2AdxxszwZHDN5ShUoJ+8jNxgwE0eUWo9gVlo1DmNRxkOn6fW/hLMz7hd1W0xxAzEM/BfGUK7jDkcOItqhdvCD8bRl035BsVIvOsJZjXKpLu1IMYJdDTzadXgBnhL1EBErDPH+iCpCqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS4PR04MB9315.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 16:18:51 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 16:18:51 +0000
Date: Thu, 6 Nov 2025 11:18:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: imx93: fix missing clock disable in remove path
Message-ID: <aQzKY/BPlNC5AUeb@lizhi-Precision-Tower-5810>
References: <20251106030822.1139-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106030822.1139-1-vulab@iscas.ac.cn>
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS4PR04MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a6e6f6-cb68-4cd1-288a-08de1d502c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y4e6EKiR8F47zpHCehMeC///J+fLH6MrV61/dk7RLmFtmn+C2jAbIs6Q5GQ6?=
 =?us-ascii?Q?1DxitiVDTsYU5RfEvEjMg4dMEgTrslajjiaZSDqBLbe0Htuz9pYb16+a55em?=
 =?us-ascii?Q?J7kkaWJURIJ9usQqZsohcXETQXiQ98HhmeyxlXCZgSTBGBiRx50Ns5zEOKHe?=
 =?us-ascii?Q?T9e3omhDj0oU+Tpz5mo60T+CDePRjtgJvMWVuXkrU48mBMx3SV1AImwkk+s3?=
 =?us-ascii?Q?eDxnpfS+jTUeMN6A4BP776SNNEZ4BBBoPu8Cv6aoSPzNrih1pYNj8yJHpivu?=
 =?us-ascii?Q?QBpJbXmjIXT4bFeZXsLX6VgfTnbaHOmKuCT53H3ukQY6GEg+pg7LR//9avpx?=
 =?us-ascii?Q?2cknvV54Vv32RCEFd1z8ydrqEcswxJ72c7/b3hmHHBj5Oq63ONBcgPKEL8p/?=
 =?us-ascii?Q?tVyVbEEGkRYFyNWga0BI90rs5Io9dk69oVfRtlxBzhnXXw+vIo6SrNIg6ta5?=
 =?us-ascii?Q?F9VTCfQZSE0xhVCYem9pHsUyClr+QKUKeQVSegT6VmOMEDc6yUEcqRcYLnQo?=
 =?us-ascii?Q?2m5ze3G7NLzCP1Pxc6ONp/52IwGW558Y1e4CmKFRCvo8k3hhn0iz+5Folo0X?=
 =?us-ascii?Q?THkGjoGDks/d8I1Hvd/IvAqguyDme9eDOO9nM359W9y8iziswzcHi0JoSVNq?=
 =?us-ascii?Q?IWOVUz/g5i1Hq5pZtGdtGv3OsQ2MfEqI/337v5dhZIzCzdidVTFo36q7ROjE?=
 =?us-ascii?Q?qVt7+/TxOfC4Bp6A0i0Djy+PFOvlFG6xmJ6dycG/1PPymQlLDQAOYXkC2QGL?=
 =?us-ascii?Q?wrE/j1rQ+WYsFs3gISR7xKk6U70l0gZV43nNuq6ubIMuLTn1bX0t312GQwHf?=
 =?us-ascii?Q?ZMZ6TIpACQjinee3X6G37gvSEs1mXAme8nlcSpngUzUuTC4h35csANy3LPux?=
 =?us-ascii?Q?6mSDPrptBUyoqhIh8Yhn+VT/E/W5QfIWffuqyPXlL9GLk68xIf257tb9JjOY?=
 =?us-ascii?Q?JV5NJUxwowG6ajl2FlN7ALGcm6qlPQ9W/PcO+7iyN19LrQTqg/z5xykSBHOs?=
 =?us-ascii?Q?FV5ftJhGk9m62wW79b2iIykO8+cLhpngKWInsXnMa5MR6SSq2pzWJ1B4daKr?=
 =?us-ascii?Q?q6TM9JiggvIrqsYrYeo2wW/A05rqSocojEPmjau2rYP+RXYng06dgIHMyx0g?=
 =?us-ascii?Q?a3fk73HvVsCn9AjnKaAQM7a0Y4NTFxCfc4pjGnND5vF9K/Zp8oArykiyk2yQ?=
 =?us-ascii?Q?RYUDpLLKyCLDCLUDWpIMI0NQvKuHzmyZdT+lPPIWMAeG7ecrTdXg957RyyOk?=
 =?us-ascii?Q?H83qTte3FXkh+M6gJWZA0o9Oe8d0g1yBDkL5DBqz7DyN+4rO6BPJ6q/Xk30m?=
 =?us-ascii?Q?l2isRDB9ANrvqrguRW3u1CYLtTh+NmLxfteyQ5iWWoukeL+gmLXtss7VsuJb?=
 =?us-ascii?Q?SjjiPXMMt1izkPUXcflnSuxc2Km5RAkfPSOTeU27NK3rsB7uNWD5Oikgq+26?=
 =?us-ascii?Q?mVM+uIcdFGZtCnJSa648KvzIS4qODAxTxPwrfXYdMzexNx2GRVa7ahSp1/o3?=
 =?us-ascii?Q?sQRtHRToqEXA3O1/Jv3Xh46WO08OKACixPoW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0wyiPkzgoJ6lanQwRmXkHEr3rd2bVguDkYxD7+Gp4EbdSj6E29sCRM+oJJax?=
 =?us-ascii?Q?ZW3Pz8kKDbk1venSqjCTOTwY2H033mLkGqBndSi+dBljfG2D5ZMds9ScG93O?=
 =?us-ascii?Q?yTRq9l897jPlXG9RnD0+5NHO/V4lE5aMxJi7btk8Y5MZ+KZONof37rWMoKw9?=
 =?us-ascii?Q?4Yrav+O/RgozmS/ot0qdcJZ/9G/qpiYO+8ekNDgPnAiI4kHcBa7M/TnvJG0S?=
 =?us-ascii?Q?+NYIKP/k1f8h1s/zVYQaMe6tK2v2ir2M8PpW8OuDAxKwd07wO2/Vbt1QKVdn?=
 =?us-ascii?Q?F4KFTDTJvzw9oEjkdyw5dL7rk1X1ENCwRERhE6wvCrytun/wBbGWHzGKFbZG?=
 =?us-ascii?Q?DFOvgmDOeLrOiHHNLLDUoRU9Day78vUT3MyxnRgTjkhp2CGqglxcBQpw7nRy?=
 =?us-ascii?Q?IvYzseTz7dys7G3FE1IHUtwjM335w3Qr1eZNwq5uLaqwMXebxkaikfAdNKeR?=
 =?us-ascii?Q?bUOjeU0k+m+RPImBgAkf8tXET5blMlaIwRftVehVJ9pEYQoUCcShBueFT2CD?=
 =?us-ascii?Q?BTh79MECuY3edlMNVEobeYMV2wbHtg0nYJRFi3jLm8MImInWOX6+Z/Om55uy?=
 =?us-ascii?Q?I03mMzrtG/nVNk2zUW7sR/SG8zZZbBZWXyGojzeq5rl+yYz7woSLAkoSKZu0?=
 =?us-ascii?Q?7RiMx5zZYsg2fc2qZQ8/snhbAMR2l3eF5b5jWxCwEtE+4jMzxE+3B4PIpq2Y?=
 =?us-ascii?Q?ySO+eK11MQq1jEFts4KHRVAMYrLSm3zYZORQPBrqsE8D3DnxS4/enDYZ8zbW?=
 =?us-ascii?Q?VCo8LRMbPmqQI4H1pZBPLJxqdYkTYONSVWmQo6mEQgjZu3xSVQFkpP7n+YMw?=
 =?us-ascii?Q?mRs/GcV0HkODsZ+hWCRG8vgYRehbqnLU3kWRsL8Fj35ijZLgw3obl+APH/4P?=
 =?us-ascii?Q?+/XYtFOzATipgxROWuBhUwQTjM7wuDbvkpHNyGchF9b3VXtCdgQWJ0dJ+/+P?=
 =?us-ascii?Q?GUC6QpVphDz/mSTGu82Bv6WShHHwwGnW2rDKh57g2U9WSoagISZI8f3dklae?=
 =?us-ascii?Q?PW944TAhA2QzzhFXjanteIr39GUzBQJbThUhZPSijMlnB1yP8EnsMhX1FlGV?=
 =?us-ascii?Q?ubGxGUehrDB0N5/atfM/1EWqisoPX3Fo1LMewUk4IUbzYVP9SA/pU28PYwPP?=
 =?us-ascii?Q?Om4y3F2KPU36algLJthVsfM+kc0MHQmUUQnULEL5msA1P9jjFTqQw8ujuaTE?=
 =?us-ascii?Q?1u3dzltZePTLYULubcWoNFUMBw6GeF+px3NXMVWvjpR3wUEfpZWzniJ7LPJ+?=
 =?us-ascii?Q?5foM5aHRPkQheCAK0Q58BdhpRiZB207qINRw5S2XSxZcl/+LkfQNwPCMw+MR?=
 =?us-ascii?Q?GKzRBLeZ1O3rjTg7OJfzOgNXU/ksBnf0MyqPjUqcWfNybf3pGAri7hjRR2Iq?=
 =?us-ascii?Q?HKH7vQB6aHMwF551FH05JmshO0ZmV7ggnnygfY5SO47dKQpH0r+NLVpXQcWp?=
 =?us-ascii?Q?TCOZp5tYZHO8B/lSpgKvJQDXdm2bjKdP52boZTO9xYq2VGdQ+gDSLD/KZBij?=
 =?us-ascii?Q?ktNPVdFzcedLJHyD+YxxR6ufILjzFrR7kFCVU5Crdvya8WF2M8DYaCPhUB3d?=
 =?us-ascii?Q?Beq+R0/mknAn2JLu+5BKExpQdjhoret6r9OvxQ7/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a6e6f6-cb68-4cd1-288a-08de1d502c88
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:18:51.7249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHeDMtI9IXjA6s/eE6UYpLmR5Si+dpi6kZvBzuwKIhfhYSy9dRVzh74WDVqVeAKyGaknFPVYmYzSDFq216+/dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081856_829641_461C3D2B 
X-CRM114-Status: GOOD (  19.53  )
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

On Thu, Nov 06, 2025 at 11:08:22AM +0800, Haotian Zhang wrote:
> The remove function never disables clocks that were enabled
> in probe when the domain was initially on. The function
> pm_genpd_remove() does not invoke the .power_off callback,
> so clocks may remain prepared and enabled if the power domain
> has not been powered off before removal.
>
> Explicitly disable and unprepare the clocks in
> imx93_pd_remove() to ensure proper resource cleanup.
>
> Fixes: 0a0f7cc25d4a ("soc: imx: add i.MX93 SRC power domain driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/pmdomain/imx/imx93-pd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
> index d68273330687..da5b7b81dd98 100644
> --- a/drivers/pmdomain/imx/imx93-pd.c
> +++ b/drivers/pmdomain/imx/imx93-pd.c
> @@ -91,6 +91,8 @@ static void imx93_pd_remove(struct platform_device *pdev)
>
>  	of_genpd_del_provider(np);
>  	pm_genpd_remove(&domain->genpd);
> +	if (!(readl(domain->addr + MIX_FUNC_STAT_OFF) & FUNC_STAT_ISO_STAT_MASK))

Does it work if check struct generic_pm_domain::stay_on ?

Frank

> +		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
>  }
>
>  static int imx93_pd_probe(struct platform_device *pdev)
> --
> 2.50.1.windows.1
>

