Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81690CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQj6WmB8N4yfbHFaAWhSH7DYev6NaDOWP0xDdZjpTbk=; b=PizbsFjhWwtZYf0YsGC41y/xDp
	YZZUZbPxzQPbz1kBdcnXZE0vywXqRzshkxlFtj/Fr3pLgrJjLG/PEYb9+PU1slH7raWv64weF8SOw
	sMHrCyRlKvhDqACAanRCHGi3EwtfZ/rGvTxfQWXy5i7OFJDWVHuKZlSPMl0a0Wu3KYwlMDiGKsGCy
	kE/QGwpA7YuDI5Q8rddKGUOWsK9EXhhe5ILWCPV13WQbhKpEr2ZGr/W03c2l8K/Hw9CzoGg+4GaUk
	X7WUM9gQWck8jSXxhE5ADpxA/uCF1HEOl+Z4nEbDP8WR3plwtpwlb82aAhzJtTqAu60+7h7H2iYY7
	AwqlZhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuRd-00000006fdm-3ffx;
	Fri, 31 Oct 2025 19:05:56 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuRa-00000006fcx-1Rd2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgTlXppD3yVpMiz6ZZyI2wSIvAVfosSnHwL6iHbl3vmaQWB2P5hpgr3tK8w3mBBCherswpqsOphWrxYrZvbVkKXsBKp+oCgflM+q9ui6dmtLleB0wdZd28BeZRDKgE/+ZyaS8qgokHshfznYG8OB+6uPNGZ7V0msOIjudVuKJLo7GHT29itzGjfX78rCKkHfKXe9ZU2tFD1yBl+L7941/iOI7M31p6A6AKRMSj9KFu3Q4P4bGczOaUivSXyLyaRmBpso/+II3X2h4SZKRY9tre43KNxwa5jjJ8QGAp1TrZYE73vAmkep8aTgMCRVbWIe6ltHYiRDLaqdNhZDDpqsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQj6WmB8N4yfbHFaAWhSH7DYev6NaDOWP0xDdZjpTbk=;
 b=ZxM0mGAxUX0X5jWj+9cRxOwXolFjQMMbU/gQwCypUD1HPPbW5fZseLNcCUtdxUWkEyW/EuZOWAPs89VUBSTxd0Hjib4By/xmpNme2Q3M1IjFf63dfqmdKXNR7K0BHfMSMqdeHDVM480J+cGZrR8eanLcQzDu9recVoD7djMdQojH9l/31DcC4hZCsB9yisDkZ9vJnluvYzfxOFgaPWWsKHfUC5i3WoGhZxbwB1pdbbjIvaF8HKkLmb+bDhgptLnSDc+BjXylC4zt5FY1OHODYVde5LHBude8dyW4dGs48SUz4XzssHe9N2BZndK8WWRAAB0b6D6vSJA1n9OA+eGnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQj6WmB8N4yfbHFaAWhSH7DYev6NaDOWP0xDdZjpTbk=;
 b=LTOPLZ7rYksynW2kTtNuEzoyu56VdKNMySv8RjE5tuWpyWZshqCH0W2NNIzMyoz80Zj8lbWniytMKiVMgnEKknepiIIvLpu4T4Ybpo6K1sziHQGc6Ecm+PCXjY2j3h2SBTbWtaE0R3gV0/SFZfuZuVmqYPgi8vOAwSGNCsaiJ4avYgXdKrJIiu9MhWq4QrEtWOpeT6TIu12SbxINkKOEAsoOe9p5cX7Jkcl+PNXPNF1YnuDyfLIF3O2M/sKIIMtHY4+tT+0clxXFqzYkK2NG8jtwSreKgG09UhbQgjplh9dO3dAvlxnirq2YQisWztEj9fSW0Sy8SIUmVilI1onXAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS5PR04MB9875.eurprd04.prod.outlook.com (2603:10a6:20b:652::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:05:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:05:45 +0000
Date: Fri, 31 Oct 2025 15:05:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg
 closer to imx_dsp_rproc_of_match
Message-ID: <aQUIeks23Dq8e4wF@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-7-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-7-282f66f55804@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS5PR04MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: f93a5876-13df-410d-5deb-08de18b07e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jh11eXzfC8DirGTI0hQ56coKdOT7oblxq9XEGJB6N/Cp6ASpa6E5VXRDMxT0?=
 =?us-ascii?Q?GU5xBxmtWzZeFRaJAcNbZiimgZTzBlzm/uODcJoWML0CUtTQRx+hZ07fzUOi?=
 =?us-ascii?Q?mxaGhFJd4qhWl34n6VNlN/imaBjMjFDPcj7EuRpgH8VKfs6w1t8VU8ApPcRw?=
 =?us-ascii?Q?fDZzEcIzxObM2eDByrd9w1yP7TJkArqXWgf1gOZwUiBIRnTUrvqjXRHpaQ5P?=
 =?us-ascii?Q?cEysiXduZ/JwqhkuQjs3NhA99EUpIYYFqyiLId8UHEPkLlWk2lT83bk3SulT?=
 =?us-ascii?Q?99udqgmwQ/XN4JM8JvSyrcltPT6AFO4b3qhOErNpJusxT7n2+1DGGqFn/mQ/?=
 =?us-ascii?Q?XOcEagL8fs0CdWTXgLZTI4nnAjuHkqfcLIzkTz+ftCE2KPiT2i0Jc5W2W5U2?=
 =?us-ascii?Q?UjL35OdxdK/ImlMs3WkSkWh1T+gwtyya3fAWYIwPEt+0ZrDZjiQJhPsKWaSZ?=
 =?us-ascii?Q?4fnfAr4s7Oq46gz8Ib+juJGBF7WW0047m8LcKBATRjq8Ik5pwAGNtNUPaTt1?=
 =?us-ascii?Q?rS3YrIjBRh2Jc9mdluwHCQYXJkTarM/4ayY9V3it72t6jFwAG4Kq6lJsRh87?=
 =?us-ascii?Q?EQW9OBP0Sd+Hl6Zccni67riRyM3k0E/GGBxVG/kAziaE/qZAk3+qw0z15onU?=
 =?us-ascii?Q?WhLhN+TbfKToAmIXUa1YE15cwl8ZsZyjYNRvPtqEBOokGFkuZ9ByXniIqUsc?=
 =?us-ascii?Q?qU+HDyv0wI6eG7yJbkftEPhiZ/j3BbpY91Gii+UA7LZQkjV3Tz97x3qJ98go?=
 =?us-ascii?Q?79SvWBfwmFVoEZDN335UHYMG/AbNw3ssyq18LDZp7kpZiIIcTCePZN8Ugx9a?=
 =?us-ascii?Q?D4xKTJ2Shwa+RfH41A5bIOfmxe/7ANgRVqMuFPTHvJJ4cN85XivgWFMkxf7Q?=
 =?us-ascii?Q?38bAIc4E9NBdTPmCGvz5sv75GRtO8J3dBcyMJmuB46rxdvJByjzSD6K+yhKp?=
 =?us-ascii?Q?6Sz0+Iv0lZGwO9Jx18VsV7fu6d3XMyD1tr4TY3P/NBIs48M05W6jhjpx/mn9?=
 =?us-ascii?Q?Yh/0x1i2CicwCLyya4Icr83guk0lQ51iKSYxe7jW1h2qnlSzDQtUjVPFYz05?=
 =?us-ascii?Q?2TYQU4qlWV9wZ6ggVFDPmpMxDxyF2HCG4iPoyPd/BSysjalN7vUEmWSMKwu0?=
 =?us-ascii?Q?5S053HGKpH/rvas8zklSJW0Fg5gFHuNTn5pnajrP2e+a3Lk7x8D6fY+1aXYH?=
 =?us-ascii?Q?KTxS+wWO4/LWGcSJzxlkg9CP4VcsjdmAQ94UQxlQFgvF84UFrw5D/Cl2PEYJ?=
 =?us-ascii?Q?cPXwkJdtGNHuXPwq4JPui/pzFxxZ0W8/Az5QuFyrFz5usSaOuHXzFmmdMOa1?=
 =?us-ascii?Q?LZ2ObzPLh1znlRlVrylOYro+YrM8OWX7lPfyOhTIKk9QD44JEfMP71bGVsa/?=
 =?us-ascii?Q?titf+p3mB0McmeGEKT6T5+31OxswXApatGGixmmS4FowiXQDch6MMzgF7Luw?=
 =?us-ascii?Q?ErgX1ZTEANJLry/D9k1bRpem5LWvf5LXC4RVUu4I4gwX9vGxwNpMs3Ex0Mzq?=
 =?us-ascii?Q?Gy1h46+FjtEGi+gKq3PLXcJs1CFFEIOZnO05?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nOavcrHgrP3BFmJiUUrxKK0ZXmPwDU7mN+/q3OhJlkS8bLpjSiZ8vnW7pTzm?=
 =?us-ascii?Q?pRUa436IU5zZh9a8bHToBMOXatkRUJaLJNHMCbHQin5Cmd6p1ko9ub/ERKQ+?=
 =?us-ascii?Q?EiBT4aMOKXNbdrfDXnAm+IEuRFGRBBs8rieqVVmHemTwrDSxMbDhjgs6BwL0?=
 =?us-ascii?Q?hpKUjagH/Vk9XOBaU+OXBhZO2UTOBPWgAHMAhn1i5zKlCoWCfXL2iEbGzAjs?=
 =?us-ascii?Q?AnruKLjcTfjlMJNbeR5qyOgkmJbG41bRDgdS3z8KKj+jD6acsA/zDiM8UIIk?=
 =?us-ascii?Q?VrgpH7t+LXo4lYc/KfrMNg18JiuJNQadoU48pZTYEjuzm7tXgqzpltkl03ez?=
 =?us-ascii?Q?X3dqGvtmCNNvwb8NtT+qo3dVCtSqy4kIqdemmQNTtphVQrOwVf9ttHQXNxGb?=
 =?us-ascii?Q?rOpfM+xjiTOrP21dI0rM4j8nTEqbcNmK2CZCbQVtzIOIt8GpzIjxKavjh3pS?=
 =?us-ascii?Q?kxOvnXaXFgwh1fWC/TS3S46luqepkqWUNwVJi1LiLWs10sy9MlEwG8RcEDgM?=
 =?us-ascii?Q?BSAu9oD1XYp62KLRSaES1NGYoOf2u6ZLNfQ5x+q7ZvHL0jHEAOYmGo1jlcKY?=
 =?us-ascii?Q?r1gzBEROIfQjEu4PlUHlTj2W4AqwjD9NPjWiPJ31uh+InE2CPzluu1dVElOH?=
 =?us-ascii?Q?wn8ft9zzHGlj5QYfSGBv5QKXbB1VmZ/YPZL3V0VxYqPawX5B2jQtr6fPnqa1?=
 =?us-ascii?Q?o/NZz7t2625WR3cqZ4e2nEvdyxVGVKhsRyJSfPww+kLh2TsOC74W1yVHxmL2?=
 =?us-ascii?Q?5CaJLlw4//qTAIqkJ80x09NhB+B1d5ZSnrAbkIy0TJN0UKsaJzyQW125zskZ?=
 =?us-ascii?Q?lXu1zuBbOwcZNcEnEU9QiqCdGb1u4uYu4T1g1N7WTmpaV0MfwaIs4mkwUEvk?=
 =?us-ascii?Q?hAU+nSNoCdI8qKBZtpcZeirKImDNbnXnYj4c54hHH4aa10ASrOfxlOq+7GYR?=
 =?us-ascii?Q?39xsOvqVd3gLS+N0bRLV5GQYYXLAKMrpyitVIW2wBT26xLBj/uRW1uXseRcU?=
 =?us-ascii?Q?2AXP6fcBJLxPinXqqNRGIYst4mDSAx53y7BVhne3IiMADilYElHmMigaM8kf?=
 =?us-ascii?Q?wgmwN0uhqIuTyzpbjvTpm/qiwTDTDWXFKHsarzomMNZfcsHoL4eiAIxV8S/w?=
 =?us-ascii?Q?tyyqF7BZ+FI+NMsTi9DQf95d70mu6Llh39qLvnLeABfVhpFcqDPAzKpSSmsd?=
 =?us-ascii?Q?30JRW/FbnUK9lY3UI/Gr2InZ5I4p7vxinqwoYiIBQ8lnAo4s95wnn7M0FyBt?=
 =?us-ascii?Q?PL3dwdqFcMDzHYk27tLLIfc5z0aAf10iCR9eiu1vSPYDQ86JH7BQTT9zuc1M?=
 =?us-ascii?Q?K34wJGaVeWXH0s/KQZOV08Z5mG9jD1bUhhb1hWHZ7olCmKNFxtYRuvesH3A5?=
 =?us-ascii?Q?MOO/VJM5FWzd8zzR2j1AV0fUOOrn5WcwTu/fwcpgiPQ6Dr8TzH6Sl1bkqXaW?=
 =?us-ascii?Q?10kaBDb0NEyFvNUj2vw6SheKi1yMUTZMREbwNstkLql1wU8iw3kEzfvdwJ8+?=
 =?us-ascii?Q?YucaxOYQJevPLq33NcPazojojd2DHBTmgweldKUrKkkuDxmat9+qR/KA/SSu?=
 =?us-ascii?Q?hJ83Y1lhn3uROruZAuZXOsT4bkj3CkC6tLMcm1IS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93a5876-13df-410d-5deb-08de18b07e2b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:05:44.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0bb4n25brHFs6n55sxkWM6hxUeJJ0w9wwlg92u41uUG5+TMnzAY1YlGBWLVL4kjbZPyH39vJPOmizswc42lfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_120550_392554_C2F96923 
X-CRM114-Status: GOOD (  18.26  )
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

On Fri, Oct 31, 2025 at 05:08:36PM +0800, Peng Fan wrote:
> Move the imx_dsp_rproc_dcfg structure definitions closer to
> imx_dsp_rproc_of_match to prepare for adding start/stop/detect_mode ops for
> each i.MX variant.
>
> Avoids the need to declare function prototypes such as
> 'static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)' at the
> beginning of the file, improving code organization and readability.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 100 ++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 833b1bd4019614157f0bedf09bd348caab802eef..f28d25cab3f1d89e5cde37a04b528870a59abeed 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -261,56 +261,6 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
>  	return 0;
>  }
>
> -/* Specific configuration for i.MX8MP */
> -static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
> -	.att		= imx_dsp_rproc_att_imx8mp,
> -	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
> -	.method		= IMX_RPROC_RESET_CONTROLLER,
> -};
> -
> -static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
> -	.dcfg		= &dsp_rproc_cfg_imx8mp,
> -	.reset          = imx8mp_dsp_reset,
> -};
> -
> -/* Specific configuration for i.MX8ULP */
> -static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
> -	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
> -	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
> -	.src_start	= 0,
> -	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
> -	.att		= imx_dsp_rproc_att_imx8ulp,
> -	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
> -	.method		= IMX_RPROC_MMIO,
> -};
> -
> -static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
> -	.dcfg		= &dsp_rproc_cfg_imx8ulp,
> -	.reset          = imx8ulp_dsp_reset,
> -};
> -
> -/* Specific configuration for i.MX8QXP */
> -static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
> -	.att		= imx_dsp_rproc_att_imx8qxp,
> -	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
> -	.method		= IMX_RPROC_SCU_API,
> -};
> -
> -static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
> -	.dcfg		= &dsp_rproc_cfg_imx8qxp,
> -};
> -
> -/* Specific configuration for i.MX8QM */
> -static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
> -	.att		= imx_dsp_rproc_att_imx8qm,
> -	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
> -	.method		= IMX_RPROC_SCU_API,
> -};
> -
> -static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
> -	.dcfg		= &dsp_rproc_cfg_imx8qm,
> -};
> -
>  static int imx_dsp_rproc_ready(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -1351,6 +1301,56 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
>  	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
>  };
>
> +/* Specific configuration for i.MX8MP */
> +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
> +	.att		= imx_dsp_rproc_att_imx8mp,
> +	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
> +	.method		= IMX_RPROC_RESET_CONTROLLER,
> +};
> +
> +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
> +	.dcfg		= &dsp_rproc_cfg_imx8mp,
> +	.reset          = imx8mp_dsp_reset,
> +};
> +
> +/* Specific configuration for i.MX8ULP */
> +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
> +	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
> +	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
> +	.src_start	= 0,
> +	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
> +	.att		= imx_dsp_rproc_att_imx8ulp,
> +	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
> +	.method		= IMX_RPROC_MMIO,
> +};
> +
> +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
> +	.dcfg		= &dsp_rproc_cfg_imx8ulp,
> +	.reset          = imx8ulp_dsp_reset,
> +};
> +
> +/* Specific configuration for i.MX8QXP */
> +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
> +	.att		= imx_dsp_rproc_att_imx8qxp,
> +	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
> +	.method		= IMX_RPROC_SCU_API,
> +};
> +
> +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
> +	.dcfg		= &dsp_rproc_cfg_imx8qxp,
> +};
> +
> +/* Specific configuration for i.MX8QM */
> +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
> +	.att		= imx_dsp_rproc_att_imx8qm,
> +	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
> +	.method		= IMX_RPROC_SCU_API,
> +};
> +
> +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
> +	.dcfg		= &dsp_rproc_cfg_imx8qm,
> +};
> +
>  static const struct of_device_id imx_dsp_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8qxp-hifi4", .data = &imx_dsp_rproc_cfg_imx8qxp },
>  	{ .compatible = "fsl,imx8qm-hifi4",  .data = &imx_dsp_rproc_cfg_imx8qm },
>
> --
> 2.37.1
>

