Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700B4C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLkcmV32B6VWrV829QV0kCz5xp4E9A11vPCVrFGsNfE=; b=z8s3qd9d/Uk01QPmqgu0RLDL88
	ECyQLfMLgbuafuxpPQZR/Id1MBWdbzezX5gzxd/Ik4oXGBcXc2A/xjbQg5dweegNed5uYaRXDILOX
	TqwrmhGm4eC7JoICtdA0xqcbflyCVBDDXeWHmjKJ6yY+ZYPh+/whe/Z9htJ+cSmohFF1rHVv2P/5a
	5Eb6hNZLcRNNfEurlqr8SammD+CfRB/e/KEdEu6HpfFQPtUW8L5LsP2bCNeIeVNiPNffb4EMZPxcz
	0tSJcFf0rtK1KdgEGw4CP1breq2KbIqZ7YxzTULEarkZ/IvnR78Ze5977uOLeEzn5q7ZlHyBnt9GN
	HJH9asjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5aH-00000008G09-40Uj;
	Wed, 16 Jul 2025 17:06:21 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5Xm-00000008Feu-3VeW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 17:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlhnSMugzzTpzV0z4/NIvMcr/PqcBqwEdAGon0ybTR7T89MZa5wvm/qy3HF8DBZXqpwxM5iXtgkxWh14XZbfDZGxPCN3ER34FA00/YT2BhHHfnq+VhLDX/3M1wWEVSxlwJKZfk9XFmWIgKuf3AxTMFRTQ5LBQno9Xqu85jzctfyPkRTz1aOLMjzunOiSI+jI391f4x7Ea0cZ5pwWTGOqckoNod3i5omfGfgW5nHR+cCDce6nEdDYfPSL/gHurt3IFHRHDvXOuvFhrHV/UheT2z6nPLDdAKeobMR7zSrNiYUpQbR6zm88pZf9ZmLSU1sjzTDJcs6Rjkrb/ETwbYz9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLkcmV32B6VWrV829QV0kCz5xp4E9A11vPCVrFGsNfE=;
 b=SiPF2ciNdUNeI+sUqqzNitiI9sK5V5M0sdrALxmH1U62LCNIXNf7C26zsf1veipXZMmB2yF0Ky4uF+Z8O3GVQguawjE0oHfT1LBcRF0x60yujsF7CT1HqvM8qrsbR1LfGNpJXA/97yLNNw9UANCNW6+U2mK0S74NOfERgNg84vo9GZEfs9GI4b6rM361b040znGNJR7nBJmpbM6zIVdeppDmw4x87yzN+wRbi7cbUkbpqnEtIqhZ9psToJezzGzIUqori+kPaoi7mEoupA6lQMjnsPDMHWdkwKwpYyDcBx36p3bxg4CGmI8v0jDw0gjdkqVD6mB+EZ/hRdSyu241Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLkcmV32B6VWrV829QV0kCz5xp4E9A11vPCVrFGsNfE=;
 b=CYfgaO50pXeQwPE7nb82FtUDdle39qrEMLtAg5o47aHTfROIfjAZBczlFY+rwQDPK+38Tv8HRM/XCA0Vc4LOIKT3oRGmfzBR/s4yKRLN22FpRbTS7bxLZrMcrGQbnVV0aP9G4zdlYKZQTuPCdEXW6wN+G4m2QjlIUi+6Bl+wmjX27Y7mXnbqahnLQi9BSSfxw2Vl3Ahw2182cwGWRd8He+2jmVuaI0BwkyjgAaXPj80oW95U9ILA8fYACBxFGL9ABkKJg6wVJH1zMsdGJUeWIphLD76PYjx7ZVU1CD3s7fGg2PeUdPyIiPVoOvwj96ZYYgpkah7Vlpqpn2tS3OMSHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 17:03:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 17:03:42 +0000
Date: Wed, 16 Jul 2025 13:03:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
Message-ID: <aHfbaILkxv8pe3fa@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AS4PR10CA0029.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ecd267-2462-4c90-1304-08ddc48ab7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fWflJWoBdzDJ7L+JEjkr87RxPFEBO2JpBndodjLiyitn/iZgNNIYT7iytk3N?=
 =?us-ascii?Q?k8XbdXnWZAjvEj44a6i2+SSAKe4vjYKeP60lRpgAUVpNm/MzOHgGuElFXHH4?=
 =?us-ascii?Q?7M7Qa7Ly+vkbrragCfp8cveGwtaKYr8NYV9NHKe4eCe5JGsJw8a8EwaYN3Oa?=
 =?us-ascii?Q?3GADmahl4PzteHBLMtiZaLuhqJzC+SzrhX/7Uh/GbtdGk41kCbLIJdL5ref6?=
 =?us-ascii?Q?ZI8xudpDcyybbnSq616P9AZvF+UvLDdNhxvkgbMng4Ocf/ErrKsqoWv0pKSq?=
 =?us-ascii?Q?mEVqXyxXw46tccRl2L8NwuXBtBhXmi6V2VVeNgo98TldfaBd7smJ0V6DjaY4?=
 =?us-ascii?Q?Z20ppD+Uuw/VTKD4p0nMO+jDknaH7x+4dYzYNGsglUMxk7mGEkNVTJcacxqf?=
 =?us-ascii?Q?+aF04u9q18Nr8ULVF8glyxgErYDrrVkNVQRfgxXdkd0AoPoc/6jL2RvVb/bk?=
 =?us-ascii?Q?BWm+mJTlRGIVq+PNqKzN417TGwQmErFx25xcVxEldVzC/QfdEaD4/w7yY8+v?=
 =?us-ascii?Q?hlv736YdkS/t6CvO+mHI0D3LVfRl9Fb60f7RPM6PylkgVqJhLXfMThkI82Kr?=
 =?us-ascii?Q?cLpZIPGvltKz/iy3tadcfXocsgcn7yvdDW525mhi+nQTx29rVrUFl5dkQCi1?=
 =?us-ascii?Q?LTnmMln2svs+hMXkdzftoBBWSLk4PH65oCbQgG7khxf1GBQFUeBCh/eM3NnA?=
 =?us-ascii?Q?iKjUVrT62t7ruhtVF37z63gqtiqQIHtYjYw8v0tRVVFYc25wa6jw1KdZlmNq?=
 =?us-ascii?Q?Ezg5AMYZG/Ophz3amGjUgK2mqlcE3c/byWx62bLO30zspJFLOw0BSPiLRjv9?=
 =?us-ascii?Q?anPDS6Ghkt30+lDPCxDJrRk6taPw0+juLoVjG2OOEUwcNMRBixD6dirERCw0?=
 =?us-ascii?Q?LtVDWmmg0C3MhVGVPxO4QvGt/6lZoru47T4sf43/UQT4XXWw9dvINprEOnI2?=
 =?us-ascii?Q?mM7tJzlGpXQfxAa+R+O7x19G9dqEfR9k+KyQ2FY4PgAka1Hmi+nL7FZNT3NZ?=
 =?us-ascii?Q?21TWZ48/rEEXgGUTNjwShjxTtZa7rWLPbT4DycaDWh313NrxdZaqL3L7ezwd?=
 =?us-ascii?Q?0DWW5tLkv1/zFP/ekVGgVZOOAqPwxvTPOM/LAYiviCzHNairEagFUM/72zCO?=
 =?us-ascii?Q?ZW8UB4XjdDiFK+tZY3dBNeLSzB3DLgHS4uv7LtjVAjvsSKlHKpIJ7ht0y6fN?=
 =?us-ascii?Q?W6ZxIpjFg/2owKMPgwT8b65ExK0M0aGrYee5Gc26+dtztsLY8o8OdVMcwG0/?=
 =?us-ascii?Q?F2X09GvnWRjepSmNniPTf5pAZ3Tlt6iOyMfMYGTHG8yqxAtXGGqH5Ijb4Rhu?=
 =?us-ascii?Q?hwEc1Twfx+0jlKFHoPZVyKqLpkW98N7KPx2Xtvtbra+zYd4mo5xeE0ijwpc/?=
 =?us-ascii?Q?0HUBK5xdZcp080mVPXJrg4AiIiyZkZVnqDb0O8dOc4lUQU0klSeXv8tMOlSG?=
 =?us-ascii?Q?XdasM9F6IeUfkuq9IseDamZo46Jg+Ea/5iqQWwIeY2FE9atd/Sa5Gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sCqxKTUAR+oVgi54+LdAqn3YYbOPwPlGNLviBHnJDHIxqthW/zuLgyiJ6jgN?=
 =?us-ascii?Q?MAsYlTwYLJnS873GCru6MggpF+CnoHuUXjXDfki9VnuCki7GuCD32b2ROS1Y?=
 =?us-ascii?Q?lqIKF+Rl/qHDLX0XKlHMNkOJ80GDVwF5BSla5fITecgIf6K0MXn06u0+98iU?=
 =?us-ascii?Q?NEWVzZPBFnl/PCp2QXfuu+KxxXBxUAv/qU7BuR3a7BbipAjpa/vAp26ew8oj?=
 =?us-ascii?Q?kJ27cWifR1tqMHcTL5/ocVpZ+nargo2ug0I4CthCOyH/YHHi3RZ05O7nlYY2?=
 =?us-ascii?Q?hnVijMEpD/uYyGdeCadF6jPmUmNryz+j78RF2c7IDRDfNYHdHsBanfFOsGtr?=
 =?us-ascii?Q?TOGsAKJL6UYFdAL8PfOUSRMBZFLJT21dwusRyS5/o38iHMVvoswNXCeUEOgk?=
 =?us-ascii?Q?xcPy5+dHbXtIWZKEl1m1v4ArpHRb3B0Ymh7FE2Iwu/8fhSJTIfyWTI5/bK/D?=
 =?us-ascii?Q?o79Y0KbsVKK7uXmH/UKy5yduFxGUtd0mK354vcEQyroqEz2aeAfla7on1qIh?=
 =?us-ascii?Q?wxtXVEIyZg52pGRPKzMXgpylxWgteqFabQ7ciCIbhiillVzAp5lmhpFllQz8?=
 =?us-ascii?Q?ltkvV3FKcMfMbWBHxGd08pwppxKDxLgVbZrxdHWPH7UgYIesPHkCM+oOjTEy?=
 =?us-ascii?Q?zmwlV/htcqTp9ZfHjrWIywnZJViOGalUDp0WzWIXVkBh6aoj08ORQTz7cqZ3?=
 =?us-ascii?Q?6U03e8IZr1xvCdSZQ1vnrhNBrfUPjrMlwQHoWJG/XuLsnVvjNmsj0VDErfpw?=
 =?us-ascii?Q?y+dheuIS99lNAXe1AazDmuXIrViBQBAA+vYVLYv6YpCjK5zIl89ExYvB7dwN?=
 =?us-ascii?Q?RYdcBFDsXz1sBaKZW0dAne1EduT59+urdUbI3E3OAWnpqoL1Rbp/YymY5BBH?=
 =?us-ascii?Q?q64KqoR4qnhJN3TLIo3J9dmiKJutL8yfrfEx3mx1RMhqfcecSDqqzrXKzoFZ?=
 =?us-ascii?Q?SkeH1+oNZeu5vc5BHcABrcKkzn+IGsHouRFV+d8KJnwIfuDYmM0YUjGAeXW2?=
 =?us-ascii?Q?Kvg595jfeweIxOcvhEWvvlH1mQ28fNqPPaB/Z56GrzarMTboyKlL5Z9hAWkt?=
 =?us-ascii?Q?simwfRHuwwLA7lHeRhKpACllWWO9EukP/d/yJOpyie6tFZ2a+2cEhU7xKn3T?=
 =?us-ascii?Q?FY7Qh1tMqwfGsWmMl47aLOeENS050hqq1pSfRp0gzAh6AA/n4RgMbjUL0Y5I?=
 =?us-ascii?Q?FLqapsuncW/KmyyMVx5j4+oCl634+XflEjd7QtnIfzKLk2Cqx7SeKATy8jSs?=
 =?us-ascii?Q?RDdXeS0+1q3FukdZD7hnP4DTsUAaW/soojXQNj3Yo+VGtabIVwKqugKfzX0i?=
 =?us-ascii?Q?McrPJr2KvCB65d85Tbn9wKhAS3f8xY2cQU1Rusm8vZqiDzHc+Kl0I50xW9UT?=
 =?us-ascii?Q?LRw4uIiS1c+XiGHSreuDBPscR2imBSgTjte2VSibYJ8o2I+vJwbENoce+l5j?=
 =?us-ascii?Q?F8C0hFGreZ432zl2o5NnLcCYUwDVj0RbEGAD/+Ehny90HUrc31/hFog50/Pr?=
 =?us-ascii?Q?a50BXDLTxiy1tqa070F75vx/bPX5Y6PWttWwVE3sG6BT3AZhMGSUldpkaDXy?=
 =?us-ascii?Q?XjqoyTtz2wINmh8IOg0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ecd267-2462-4c90-1304-08ddc48ab7a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 17:03:42.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoTdX0NqSyL750Is7Or6zJGiNfPhh727dp5WFk9hh4UVvMUfEB2gpWien9lquTOxQFgjCooUu6QvYHfsJ8IpAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_100346_877472_89801648 
X-CRM114-Status: GOOD (  25.63  )
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

On Wed, Jul 16, 2025 at 11:15:05AM +0300, Laurentiu Palcu wrote:
> Currently, besides probe(), the platform data is read in both suspend()
> and resume(). Let's avoid this by making pdata a member of imx95_blk_ctl
> structure.

suggested commit message.

Add a platform data (pdata) member to struct imx95_blk_ctl to store the
result of of_device_get_match_data() during probe to avoid redundant calls
in suspend and resume functions.

Frank
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 36 +++++++++++------------------
>  1 file changed, 13 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 7e88877a62451..c72debaf3a60b 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -36,6 +36,7 @@ struct imx95_blk_ctl {
>  	void __iomem *base;
>  	/* clock gate register */
>  	u32 clk_reg_restore;
> +	const struct imx95_blk_ctl_dev_data *pdata;
>  };
>
>  struct imx95_blk_ctl_clk_dev_data {
> @@ -349,7 +350,6 @@ static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
>  static int imx95_bc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	const struct imx95_blk_ctl_dev_data *bc_data;
>  	struct imx95_blk_ctl *bc;
>  	struct clk_hw_onecell_data *clk_hw_data;
>  	struct clk_hw **hws;
> @@ -379,25 +379,25 @@ static int imx95_bc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>
> -	bc_data = of_device_get_match_data(dev);
> -	if (!bc_data)
> +	bc->pdata = of_device_get_match_data(dev);
> +	if (!bc->pdata)
>  		return devm_of_platform_populate(dev);
>
> -	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc_data->num_clks),
> +	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc->pdata->num_clks),
>  				   GFP_KERNEL);
>  	if (!clk_hw_data)
>  		return -ENOMEM;
>
> -	if (bc_data->rpm_enabled) {
> +	if (bc->pdata->rpm_enabled) {
>  		devm_pm_runtime_enable(&pdev->dev);
>  		pm_runtime_resume_and_get(&pdev->dev);
>  	}
>
> -	clk_hw_data->num = bc_data->num_clks;
> +	clk_hw_data->num = bc->pdata->num_clks;
>  	hws = clk_hw_data->hws;
>
> -	for (i = 0; i < bc_data->num_clks; i++) {
> -		const struct imx95_blk_ctl_clk_dev_data *data = &bc_data->clk_dev_data[i];
> +	for (i = 0; i < bc->pdata->num_clks; i++) {
> +		const struct imx95_blk_ctl_clk_dev_data *data = &bc->pdata->clk_dev_data[i];
>  		void __iomem *reg = base + data->reg;
>
>  		if (data->type == CLK_MUX) {
> @@ -439,7 +439,7 @@ static int imx95_bc_probe(struct platform_device *pdev)
>  	return 0;
>
>  cleanup:
> -	for (i = 0; i < bc_data->num_clks; i++) {
> +	for (i = 0; i < bc->pdata->num_clks; i++) {
>  		if (IS_ERR_OR_NULL(hws[i]))
>  			continue;
>  		clk_hw_unregister(hws[i]);
> @@ -469,14 +469,9 @@ static int imx95_bc_runtime_resume(struct device *dev)
>  static int imx95_bc_suspend(struct device *dev)
>  {
>  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> -	const struct imx95_blk_ctl_dev_data *bc_data;
>  	int ret;
>
> -	bc_data = of_device_get_match_data(dev);
> -	if (!bc_data)
> -		return 0;
> -
> -	if (bc_data->rpm_enabled) {
> +	if (bc->pdata->rpm_enabled) {
>  		ret = pm_runtime_get_sync(bc->dev);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(bc->dev);
> @@ -484,7 +479,7 @@ static int imx95_bc_suspend(struct device *dev)
>  		}
>  	}
>
> -	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
> +	bc->clk_reg_restore = readl(bc->base + bc->pdata->clk_reg_offset);
>
>  	return 0;
>  }
> @@ -492,15 +487,10 @@ static int imx95_bc_suspend(struct device *dev)
>  static int imx95_bc_resume(struct device *dev)
>  {
>  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> -	const struct imx95_blk_ctl_dev_data *bc_data;
> -
> -	bc_data = of_device_get_match_data(dev);
> -	if (!bc_data)
> -		return 0;
>
> -	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
> +	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
>
> -	if (bc_data->rpm_enabled)
> +	if (bc->pdata->rpm_enabled)
>  		pm_runtime_put(bc->dev);
>
>  	return 0;
> --
> 2.34.1
>

