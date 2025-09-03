Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED3DCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e0jXzWCsRbZUtWJ4Z/jKO4gxxLdrDMAiek9CZRUKCk=; b=M7hhE/csuuVrCz1kvnXVfZq67M
	Lj/0+285crcoXcirmCH5nW+cr15m80lhotSajdyCO8sit5A0RApMsdj3tbbxCCYtysVFKyyqqc73m
	v+l4Z2Ct2cCmMxycZ4M/phYnQ/FmJF+HTHh9tMm/Cibj4pdXFGLFMqJl/T80pyKfaPppuPMBogZ5v
	wbkTaqsBY6vGE9cQC8SubxM12pf0Jl6kwfp/xIgSgilNVt2DmIGp3uzGq5HaT3nUsqusTEdnwrICI
	Kh31UO+tC+IvjQLkN+ddMNtbqtRUAKz0ylhSr/7bh6wsH+qGxq5KKsIRRY6bE/9K4NJeIId8D2ZsK
	aXzZtecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utveF-00000007lBX-3M9N;
	Wed, 03 Sep 2025 22:08:11 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpUJ-00000006vnl-2QPS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k076Gp6XRrNakb8Qnq9/7kW0ZofHhMKJJ2WkehuAP/G90Q+gN1RfYk6oon65qftjeQOMYll4DewH+Ubu0Y2vbtUpSx1cv/H5H/dBtouucfrNl8X5ObcoDUFgY/cVwyW1k6UVJCVe+AaIAgm3UdQxD5Ms+NuN/j97fA4pFVqdLe/VFrmh59OvdwknZbzJDBwZtLIa0BKmahSIjE7OvJkpCIjPIldjs9e/r/uYqFgivgP3qHqBZuGY9D3UfCphgAk6JuooF9IEXSJcxCWkoHwmFRJw+jHwhNAV6X5dF4kcuivmk+8cYbr60sJigL/vOuX/h7S1EMRvQxOorzY0snlzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e0jXzWCsRbZUtWJ4Z/jKO4gxxLdrDMAiek9CZRUKCk=;
 b=EUznvlrZgL9xeRKEXm4jPQC/kkYDiBvCjIwIS4yWl/fFNx4H89BdEUMvY7khIWB7pXAnjyI/dWPkb03quFwd+8/gQD+JCgwnhlH1zJp8RHgBkhajLkulYa6oP0r6eaqwcgosCQKFUquM9Zmi1dW9On1L6h9CfPLnJpHaeklqxmPO1Bo8sUKUr2lGY5CWT57eOcDzFK35vmZ7eR5WF2dADQC740PXAHsj6K8Rkrxh6jwXOdrG+mIePTTbuwkvV77hY7uhfTnxrDACHotcLekyKZEnrTbkzdaTdRFgxM8tNJyfCvlCCeSsX29bag3guHEDqrExo7vyFpTj4SemOaYpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e0jXzWCsRbZUtWJ4Z/jKO4gxxLdrDMAiek9CZRUKCk=;
 b=AmBfCYwfCXnCpnAPB1rggJvahxLd6LmtVOcHNQzEe7X0HIhxGxSBAIADgaDn9WQ/52mWh+EeDMipg547XiGpIf/OhK4m0q0gUzXsLH/YIt5eg8ylv4+BLE4dglZKkUZWTsh+nr+LAI3dBwEqn73WCEfd2bfgXaz+ITO2njjnKjG3DJY10NG2kt5O3v3Fg1+sBRyC94o9P+tehu8wkIs3w2zMtxBvPhCrS8uEmJmHhzUQYmu83BtPMxNKXF0jslBjbX8cu4GdmNjVDJaWS34sfH7JeisHW3gRwjYpFpyV9vqsY+Lkzy1wjBuS2a15QLiQRtukt0cOykQYElQHK1TT2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV1PR04MB10848.eurprd04.prod.outlook.com (2603:10a6:150:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 15:33:27 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 15:33:27 +0000
Date: Wed, 3 Sep 2025 11:33:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hverkuil@kernel.org, nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com, mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <aLhfu0KK5NHIGH/W@lizhi-Precision-Tower-5810>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-3-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903102243.1563527-3-isaac.scott@ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV1PR04MB10848:EE_
X-MS-Office365-Filtering-Correlation-Id: 390b5d89-4d9f-4337-b84a-08ddeaff3a71
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|19092799006|1800799024|7416014|52116014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ebO5VYd+VH9ug1C4OP8vU3JhWl4pqHvgZYVljsTBIG6s15qb9ls0rtBBv8YG?=
 =?us-ascii?Q?IPJNlLe+fGQlRJRDK0vxEsZdoFrwAQopGIGIPrjiS5QcXtPA8CH22kHHLhw2?=
 =?us-ascii?Q?j3ntqZI/6llNwUvjcXVKPvfjXH1uIy7O6OqbLvKRt+Ugw331+s+J2kjTTtDj?=
 =?us-ascii?Q?lDyiMliGVi7TvjYdlMnPCEnZfSaBCRp0E8CMMSs/EcvWv6IEmKdIEgHbI1x6?=
 =?us-ascii?Q?IHKvaOL5imR0ho4ukOcg8yKWMFIG+9SaskQcnqEsAsZ3IqlVgKMnFJHEVLJx?=
 =?us-ascii?Q?yJc1cKxxsmr9X/wofKA2t3qMY1PI4YFLSmAQ3z8BjtFP6V4HglLcvshJjADs?=
 =?us-ascii?Q?Ed/4IBPZA/srf3cWbDhh5zcqlikLyDJBK9wJheEmSWYVcAuexRKItbx0zBIE?=
 =?us-ascii?Q?7l3U97hVU8+XPjhcxm8422clTXR15Y9WQH7DKOrmm/poEpS1zm4b929X0B3N?=
 =?us-ascii?Q?uV43sGphisLDAn65txC/ulMds8Qqq+0HRps7SofvfvUpiXx9pRokP4efMu3w?=
 =?us-ascii?Q?URFh4yM+8BRgFvuvCdTG6lLq0V/Y2elrDHBrPYgrenO0TfYuNXjevK4fAuEr?=
 =?us-ascii?Q?s8sdaFLWLB1kFy5g4hAAo8oyaxzNWddNXhtLVOlcwgWtXpM5i1+F5qEdlO4n?=
 =?us-ascii?Q?047p/cTQs1ZFUX9fw1entKhtESIO4FKYK07QB4KIPspKBYm7oeI+Tfrkl17H?=
 =?us-ascii?Q?ALsVu02PCDSgHRN9MPH8hiWLicyVjKmUGx7znSrzbq1gAOaOQ3Y1ZvYPCP2H?=
 =?us-ascii?Q?qZ16ovU6K4GhkS13ItMiftsPo6D9tWseSGebuSoMUe0sp1/GDCBcNvoFSg+i?=
 =?us-ascii?Q?9fbqToPRl55wWG4PA/kIUDDoFYqM0guxCLtHD8jWUeh9kxq4FfVvIJRAqyYz?=
 =?us-ascii?Q?hjZVmXuASgcy7wDBj3begGSuYN/HBRGZmUSPVKo9LB4wFTnnAo1BSc0PHM8g?=
 =?us-ascii?Q?JsKZxNtoJrWKBpb7tF5VHyH0ByD9KI7ZbDgx9aBUgDw3lGP7DEeM3OwE/+wi?=
 =?us-ascii?Q?H4R5zBKY6QvBMLpJ5D3itDue+xguCfiAjGIW6JnYV6HPHJF0VI5VA7Fv8+1e?=
 =?us-ascii?Q?S1r7kWsEqCuhku+eYrsmOkA4RGSAPpsowGHfrUuWnJBsuPTkId/8Qkk1+v4W?=
 =?us-ascii?Q?UXvvvTWeZptC1fFVgt+rNd+Cj8ce6Bj5ihg8U1OYFN13oJ1DKhEeFssyTtDU?=
 =?us-ascii?Q?AMPY1t05TiW4jZrSn7r8xGrL2nwIVP7bX1FquZeSw8DU0Vdq0g+BBcHX1Y+n?=
 =?us-ascii?Q?dHXg1Rb6n5GacvlL2QuQmtb/7sSrkBRmdWulK99pURnsXvdeiZUpJOApTLxN?=
 =?us-ascii?Q?t91D/2QAPdn2/kaNGE3+B5lld8F52FNBWf4Lso6A3v+SlDJH7u9YjsLqjl6f?=
 =?us-ascii?Q?84oAV3CZ6M1op2tBqAWRu9Th7Z55bSIKZ1fbY+6Yqh/D9REYucNn9SzBQ+9o?=
 =?us-ascii?Q?Y2SoV6k1/2U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ICy/cecNEo955wWpOszF9IElf3oejqkyJe7eqbQtc9EFhCm8Zc/umD8oqmOt?=
 =?us-ascii?Q?C1xriPD7w01y4VAJvHWtGlWkxU/aPtvwzrsqRE5+EGKYmPmEY5oGPZNxI0Wj?=
 =?us-ascii?Q?WSXB/cR0NVvmjocT7Bs19qeRFaWqSM2vAxT3kjQ8ZiFHJcdcyb5+hctU8WjV?=
 =?us-ascii?Q?uCbSmyuwfbzxWn7R8zwT+8L6qUguNlmRXQ3B+Tzfo60U/ToG8ddlxRnKcWx6?=
 =?us-ascii?Q?bkFMVOe5gnr10yfLacMkcnyFn8kvfOLezgE+t1I2/+uiEsh1vibvpr7aMftQ?=
 =?us-ascii?Q?f3710woZVw8+MNX6QIFjEA/Ex24tkBuA4p+YjWxK1728Q1l76tDcRB/ssFUS?=
 =?us-ascii?Q?jucMCaxdXUwr5aFaID8K277or1wdlJPsX3UNwGwFGqvzSGgMHVKlSK7tMlSm?=
 =?us-ascii?Q?ZioUpw+bMnX7r+guqSVKpP64jFQAfQ2tNzpRc5zCWtiJbOaAht2J+2r8HNNN?=
 =?us-ascii?Q?FMuUvgOQJfcZeoAtY6MMHfuPhTz01O7pAVFTI47Cc+n2cz0xouEYvmpRz8mH?=
 =?us-ascii?Q?cB4jFayEUKxYR4Xt4N2cbHjlcIpMnxw06MAB4aeiIc8HmJ7+1wzarvS6qnc4?=
 =?us-ascii?Q?I4WnJvn4dkVzQK6sWey3jyIb/44Xymar7YjtctXC7f0kYEvKBWUrkYCZL6Kk?=
 =?us-ascii?Q?fy1/eN3yol0RuHBz3vBXRYG2rmvvlQwdLUSDhRjx6T/ah10UJ3qgYwzMWfZ+?=
 =?us-ascii?Q?Z2eC9WGhWQkZQ7V/IZPYq+GIIRGNH+L3A7oc4y/RTAxONyJ6R2QTkV718cEz?=
 =?us-ascii?Q?tcfAQGR0AKHunYIHoRLzxIrWbDlserlyZQhPT9B6SpzCJP/NtE331K0I6yQZ?=
 =?us-ascii?Q?xpkx5Yj0oh0R+VYpNJ3xlFNai19olCvhOavCF49mnLI+bbluv+/7t4lCJ0xj?=
 =?us-ascii?Q?KRozrjcQDa5eIz74SKov6LvMJLa5Qe3r/t20Skw6qVRQsrPqVm8KVCS9PSbz?=
 =?us-ascii?Q?bsMe1iM6MUbAGAKX/NfgtvJfizdZfHybnSR5CMMymeGVZNB2G3XapOd/Kpn1?=
 =?us-ascii?Q?f9bYsrx8Np/yeSupdcl0gnGiK7eCdKu8iEInT3Sd7UUI4g/19N57wYCHLo41?=
 =?us-ascii?Q?bXRekxOZbs3/q8qhH+t5s8IF96TJionsLDkmnD5bpLTmFUab4j0JyYhQvKcE?=
 =?us-ascii?Q?33aSHuzfP9WaGIzLvTdeqTlP1zangBMY3XhlSomWhXEkLtnIMwMpXpctWQH0?=
 =?us-ascii?Q?saL0srlWRGSZbUgvdR4W2ewM7KZmM/FuKEDgLBmf14s49/UqENpHLZyR8QW5?=
 =?us-ascii?Q?0FBTmYHNWsyiy2GqXTXhik/xLBRAAD/bImmFz7TTsR7dFnqzfleMrTGcNF9H?=
 =?us-ascii?Q?pLxthEsxVV7SPGQz6ZqT4npiIkCQDztrlFwTerDiw3QtlL86clhGBDKin+Bk?=
 =?us-ascii?Q?GArBMcHb0aauPkcKVq9wYnzOjNurZi2UCpcwqa5ybCtF1pv6+7Z1xo5hHZPI?=
 =?us-ascii?Q?Lg2rsnJrYUM6oMYWQQUwJP7MqBkJDTkeTW5n6gghAIx6K4/mIMm+tIgiDrBy?=
 =?us-ascii?Q?qqFsHXuk9DbH+GeWN9m/vN0MMHxDBoeaA66ic2bP0yrIYMt45azJRH2Ileit?=
 =?us-ascii?Q?ETWEcdNMNocGTy530gkCG9DE+6+vLN3dqy/RRlLwadQXPaS8WIpUZoVGuq0Z?=
 =?us-ascii?Q?5gxNQmqiWIulFF/oBzWgMS1M6EblsbEyr07J/EMwrygh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390b5d89-4d9f-4337-b84a-08ddeaff3a71
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:33:27.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVIRv7nc7WK0sIEMboxvw7gj3vTg9KZYy0+xMRbd4RDh+SVQO5SM4aXZ/B1QSoYSRSEnU0UqgYQmnZkOeKrcLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10848
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_083331_617347_3A10DE0D 
X-CRM114-Status: GOOD (  21.09  )
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

On Wed, Sep 03, 2025 at 11:22:41AM +0100, Isaac Scott wrote:
> The number of lanes actively used by a MIPI CSI transmitter may differ
> from that which is defined in device tree. To allow us to be able to set
> the number of configured lanes without changing the maximum lane count,
> store the number of lanes configured in device tree, and adjust the
> debug print to reflect the device tree value.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..fc89325f2f94 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -313,6 +313,8 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>
> +	unsigned int max_data_lanes;
> +

is num_data_lanes better? you get from vep.bus.mipi_csi2.num_data_lanes

Frank

>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
> @@ -1299,8 +1301,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	}
>
>  	csis->bus = vep.bus.mipi_csi2;
> +	csis->max_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
>
> -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> +	dev_dbg(csis->dev, "data lanes: %d\n", csis->max_data_lanes);
>  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
>
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> --
> 2.43.0
>

