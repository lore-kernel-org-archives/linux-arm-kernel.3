Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65435CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQKjgq/6gWH4+Y1pZBVtSOIecLxCeJK2OJVHGV1hpfg=; b=OqBW/7TMxzoSoizXLYM5VzHFkZ
	WaEJqYsrlJXejMIME+cl9VhyLbMG2Fwzloe7Q8e+juEAi6Fj+5ipcJJGxHfB3FfM3BL1G8xblk1tC
	NRpcT6BT5VW7nKWEvivWcF0pyXVWzei6W5vj7q532eOiS+s7FPZW7c35eafKmT+Tr/erAMKmEqo/o
	G5f8dxy38Dp5oyVDi8sED8LiAaUhs+wyiUU9n3w/dhCuJzgFrBwdahhQeUZVREQLS9wucMmhnnVxa
	2Y3fC3ofJ9UHavOYhORFMzNm/jaGBBZEmYfNw0AvW2unUTxHGhgt5AL/BOKiBTQegE4I6W40BgcaR
	sb8Hyjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEB2E-00000002QW7-1TJ4;
	Wed, 29 Oct 2025 18:36:38 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEB2C-00000002QUh-2hjh;
	Wed, 29 Oct 2025 18:36:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGbXggvl95lyBdzUvNJdw1qtLVa9BnXg4jp832w3swRws74h3jxPJYB5+c17AR1jjB6O9DQUciouBVqpUZ30bwmAJjJU5O2t0DqX0Duw3ObB6Nhwvoq1iWl6fJjoBdNaHXdE3ixV+xb2oCfpBN6tLVI9z9n0pEveqkPKC5hwtL0nTGjZkl8OlfZ/KxzQabldcO5V/9AcNsYlIPxHJq3YG+xjvA8VxnhbtKaLwDfPDkf+6AfTpFMF6NObsycvXDOaIlrxOrsv4NFSf8EH/+Vl1Zh22CMumSGybQgw3G6/S+PUbvmTluOPLYuvp3NyRJw24oy7Z9t+Djf0f2e2RAgXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQKjgq/6gWH4+Y1pZBVtSOIecLxCeJK2OJVHGV1hpfg=;
 b=nJAXiydO8KkaThML689L02m96LF5AxtRDo9FMPJMIeO7TzjnjA5RN9BY50jFOik85z3SH4mGmT3mNTgymAAs8fVQSh4jVEprhpiFuk7GgQwEMeWho4UsB6ZZjxQ3XsKbHwJ85cdZTkLxQKCtfLVXM0fHJMIcs9CrIKXkzDq4oxjnlI4gAI+WJo6iAuPk1aZqqxOoWGY5SiP1DCKtaasInM2o71XlaEVQ3NEnDkdPxmU51noqyq8Hm5mICfwg38AfPtGbsmUmoMqLNi21FthZrYj1szHkYfjvpND9AUqG7G5DfwcMyE96/C/U42u53ESI3/vfXf2XHwgGIx7sHVUyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQKjgq/6gWH4+Y1pZBVtSOIecLxCeJK2OJVHGV1hpfg=;
 b=XhnbG6StevbBTK9eOKrJBH+r/KSjUtplEvRxJ6onNHL1RkXOi1BjtdWdIPEmnW7s+nfMuMzhIAZSXaNf+L9FiGAfvutpvOcb9+xQzHx8Ll7EjqPgHfj5TOvf1z8h8EEFbKd7rb8cegz4HpyHs6wUVMdPYvWzmrSGl0hwFsTOSgc74c2O7bOk14staR30U2guhQF0NwMRDlwPMs6COF32/wxDhmrquEM49kFJBmC1oBCzv5gCsfYJFkmuo5fdin3L+rEuvCxbrsgGen6xN3Nbp/5FiYdMRhCMjFEPlcaQkJaT1p/SkgoVsmYe/aXzHrtQqSIkJWw6AYXv0S8fxT0eaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV2PR04MB11566.eurprd04.prod.outlook.com (2603:10a6:150:2c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 18:36:28 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 18:36:28 +0000
Date: Wed, 29 Oct 2025 14:36:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v4 7/9] PCI: dw-rockchip: Add pme_turn_off support
Message-ID: <aQJepFIjJx+kdBao@lizhi-Precision-Tower-5810>
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
 <20251029-rockchip-pcie-system-suspend-v4-7-ce2e1b0692d2@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-7-ce2e1b0692d2@collabora.com>
X-ClientProxiedBy: PH7PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:510:23d::12) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV2PR04MB11566:EE_
X-MS-Office365-Filtering-Correlation-Id: 7310e080-e4c4-4845-1e14-08de171a1285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cUCnId0AblVV0ElQFIX1j4TAl2N2IFL6bDLBxcbgTAdLUd9sTc1NploPEYAG?=
 =?us-ascii?Q?dxKzLYprKoldeu9JQHVk6LSU4JC884PQsM11m3xtISQizoCBGy7pajTIKsHZ?=
 =?us-ascii?Q?fKIuGipe9cW+IYwCuZQjolUvJN28W0z/F+SouoIQKl1FQxFMfUpx0avGm9ei?=
 =?us-ascii?Q?0uWAjR6ucg/cXd+2uLwZgAfBHA2kLWksV5QuJRNW8TzlG0ckJc53dfvscQac?=
 =?us-ascii?Q?aCjVqHdrDSKXWPE+NQoalt85RA4dji32Lz215gpZ2O1HhXcJpNLHby5aqdkK?=
 =?us-ascii?Q?GOAizOH+t5dWOA+OTOdk+HCDQiarigrhPSl+izPkAxls0kakyYRW5s65oHZ/?=
 =?us-ascii?Q?HJXsn4Uf2t//2Ba+eRckzNksnce+XwfL+J9i74hgGR/CdVulh2GlzUWrWsQM?=
 =?us-ascii?Q?+67f3YMcojbNTcXAlDvPjsb1q0FfR9UZvtuY+kbg1ITPwmP4+xNbkhD8coTk?=
 =?us-ascii?Q?FF5eReZ3y2b3i/6L/Xlgm8HOm2BeSgzaBWXKpXgwPNnHd7KMeka055wr0E59?=
 =?us-ascii?Q?wJ+LYreXsndgrS8b2Q6Nm6sO61P1+pb7woh7XD9MBaVQRatgNOKpX0QlQsMi?=
 =?us-ascii?Q?p/2XTuVgAYz2O+QXGJ4DqQWj7hW4/htCdxEPX/hMVSlGTKJcaiJ12yTs2/Yv?=
 =?us-ascii?Q?WvDuf6GsGrLyQxuqSNb+UKEPGR6Oezkh2rTd4/RMSTS/UGgu8AG9W0O6Q094?=
 =?us-ascii?Q?DKlgfC7r5ldHgH0Z8laDQ//HrJRPnMMgnE7EWYWCdLgjOkPU1ACiqmiwgdds?=
 =?us-ascii?Q?icmuwlaQQN/cC0acAEE6jdUi8q2YVyqu3okHeuqvhwGM97cup6tt7LG1zwux?=
 =?us-ascii?Q?W3VuZcGSK2gebB6EN68+s6QQ5q30N/+FvFAlHNQHlVwhv/8/jwz8UOhRtXW1?=
 =?us-ascii?Q?XbvZorIy1l8OPwXt9w+fSglr2c2AF7EZtMBSHIHS6m4DXcYjE2EvZoD6iHzd?=
 =?us-ascii?Q?msWE1aNOjsJoK5nIv8zXM8dBIITf8w8+x381SKpm1oatcwubQpWn2J2RC7X6?=
 =?us-ascii?Q?mYFBEzkL3QaEmHqSNLByVZfdWqdj/4UW4W/Sop1OYGykNiEKkL6icu3Xuzp/?=
 =?us-ascii?Q?fhHf0NhAUBUqxixpihejD6ILtBy6JZEkuyGqZR/aNMAT4Dd4sneLdFrs/tpU?=
 =?us-ascii?Q?cRBFydsi4vFIB6/3aAuTeyX9YELezDjE/0MC60FurdTYRCIdQd+xCOt8+d5C?=
 =?us-ascii?Q?F3kr3BiKPBc5tjJgfxauFdW+FvpoPHSquPnx/3VBUuTJQvxSN01bIw7ScRl+?=
 =?us-ascii?Q?8qDPAwXw6F8u1vXBrTBXlF/YYubRxc6kCsiDWHCTYuc+m/eQ4Q/ZtPFQtCuM?=
 =?us-ascii?Q?nsyMbcXBN0jliY16oJC8p6PoPtbmxA1aUMk1Wr7/E1UMSMQ2Kx44y9yLgVVG?=
 =?us-ascii?Q?iozLp8DVGc1Z7dV+yAW+3G5FdjAYlDTieeMkfBEn5l0/fKCD2ajCm8WG4dlU?=
 =?us-ascii?Q?IZvupq3CDMsx5WcGVQqEM8oxUR3RjPrZKHpTWtmWJeY3R7Y0/kxpU066TKh4?=
 =?us-ascii?Q?Wg6HUwJaxxRzC0uXQGRWfaDSb5rV99fodnBi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3SIQx5Jn93xJF40qKrsCqgDPBmIKVFUhpyHjzysMP56FEDaWnZhW7Kn8071o?=
 =?us-ascii?Q?4EaApSzXaDIwzV2zdMuQbQK4h70reb2607xYemD1hd9FcKbvhHoPjTMdDwhC?=
 =?us-ascii?Q?qbCJt0DjcS5WSBtDst7+XamfC0au+xAig0HwXFVwLkUYjLTb0Kd2Lk+eAcVf?=
 =?us-ascii?Q?CKlBWk9WhXsqIL7b3Rc7plnmqceMoSDO+0GP5AZRlEZt2EcIp5cZO6COKrny?=
 =?us-ascii?Q?be2kl5eFb9zD5/ZoZY41hDWQHxkwRiWZ3oWI9sqMew86LDKCEHuR6rGnwXEW?=
 =?us-ascii?Q?k+tHtmiiY78YSp/oq0G0hv6Ox5wRbx47UTNak9CQFvsLJkHMN2jygoT3PA29?=
 =?us-ascii?Q?sPNo5gxiNHXtq8NYYLqiGdvTZd7YOphGkNVMKJ4eAWuWviQiAgvGK7xZQnQG?=
 =?us-ascii?Q?K7pyUSrNtRFqRfyYNf8aWkcAglHIkQTBztOYs3/ZQvbthOs004kosbM9I+wd?=
 =?us-ascii?Q?a96Tmml0WXUcM5G0CiOCD+earoiKe5zHaq+Tk/qSkYl0ETQRYaopGEjBDU/A?=
 =?us-ascii?Q?f7Yfxr7ts6cABHkrWaw+3Ie/NmPROZ0qKSTUK406DwQbQ8WCjX0gGpe8WWGS?=
 =?us-ascii?Q?e2HPSEbK9nS68yfg86PZVcSYHvtt3QxfttyyETuEOgpSNmm2bug50AhupbHS?=
 =?us-ascii?Q?4errW3PWbRb/3dSnQj53pji9a0cdEjqro+G3u/KZTJxL3zF5UDXQ3b50mfxe?=
 =?us-ascii?Q?w+FdpsgYOLcVL+5iqZfb+4/RTF9ZJx+Im2HlKiZ6bWPC1gMPf+FSvJMt3ZqM?=
 =?us-ascii?Q?fHKMa4+t/H9dSdNqhtGrX6sCniMd4ffnVfB7W2N+z0wdAdgbQhAGrnveZSrz?=
 =?us-ascii?Q?xHrkP+VAiDCo+8gMuhk8qxteCPOuwntzUbMrXCMEAGniwLPOhncXUNX+vv/+?=
 =?us-ascii?Q?S/TbECWh1EexBZDE2ptU545BlfFHRY+gi8cjSV3C2KKc89h+9FLAhW6c/iMB?=
 =?us-ascii?Q?sy+jby3psMvt3kjQVOYXyhG5BJXuTLpRZ+oWZM6RvFwR0Fu8h21CgXzl3Z/I?=
 =?us-ascii?Q?86rmQqdoUI/+2DaMuvvnI1VVzrMwWrxD1ndOZ2xXf2P6oCjpRv50t+RdQxxw?=
 =?us-ascii?Q?Q1LhaUCMlNCHXWhhGeDxFrEujmh67KPKw7dMTbSvUGCehoTmrF5KvKAGl9PM?=
 =?us-ascii?Q?9mTkNsq+xRw+xvCdSvhSO/Gnn7P9uCj3KfrGBRndHHv642cPtW1Jg5NWEMg/?=
 =?us-ascii?Q?3C7UCZb8j/jruoh501pLeF2VqwOf8NXyM9cjEMIh6AYotU8PZA4/YLq6Ixde?=
 =?us-ascii?Q?3a5b7lfvxYFPd41jNWYkb8h6ATWugUi7WydjmZ2hOUBjHX9w5GdUPgxAuPo7?=
 =?us-ascii?Q?VVeedrZeqMctdkw45U86VA5hHZ0kgVhuG9cCghtbjP0ZlU3jzbfwWQm8ntLE?=
 =?us-ascii?Q?xop+X8RJDGPTwQ0xLZ6QCxU+EgCu6PVbxSMWwW4xlrkVcsbfjSo9qJvb/cLA?=
 =?us-ascii?Q?UCgjTOp0XdNAQJ7A4g+aTvglxzJfe8o+F2tYr+yaQtKAc8KzT5Nu1Hvsm++1?=
 =?us-ascii?Q?Ft4+Ku9SVb9rFijkL0Fd7zdqKWRLw/BX8+NhWjXhDuJLi8+QFSQqZahRditj?=
 =?us-ascii?Q?4LUvAT3ETsgOn9pckuUYvusCeWuu+Dqe5zvJGknS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7310e080-e4c4-4845-1e14-08de171a1285
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:36:28.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2E+UMrq1a2YdRXkzhXj2I9QSkQk1qji5NiC3sBLm3f+Zv3uUzMd4sqnhp5UeuR2crHHaBB73scTvYuKKkEyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_113636_705739_9944858E 
X-CRM114-Status: GOOD (  23.10  )
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

On Wed, Oct 29, 2025 at 06:56:46PM +0100, Sebastian Reichel wrote:
> Prepare Rockchip PCIe controller for system suspend support by
> adding the PME turn off operation.
>
> Co-developed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index ad4a907c991f..d887513a63d6 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -42,6 +42,7 @@
>  #define  PCIE_CLIENT_LD_RQ_RST_GRT	FIELD_PREP_WM16(BIT(3), 1)
>  #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
>  #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
> +#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
>
>  /* Interrupt Status Register Related to Legacy Interrupt */
>  #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> @@ -61,6 +62,11 @@
>
>  /* Interrupt Mask Register Related to Miscellaneous Operation */
>  #define PCIE_CLIENT_INTR_MASK_MISC	0x24
> +#define PCIE_CLIENT_POWER		0x2c
> +#define PCIE_CLIENT_MSG_GEN		0x34
> +#define PME_READY_ENTER_L23		BIT(3)
> +#define PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
> +#define PME_TO_ACK			FIELD_PREP_WM16(BIT(9), 1)
>
>  /* Hot Reset Control Register */
>  #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
> @@ -277,8 +283,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>
> +static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
> +	struct device *dev = rockchip->pci.dev;
> +	u32 status;
> +	int ret;
> +
> +	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
> +	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
> +				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret) {
> +		dev_warn(dev, "Failed to send PME_Turn_Off\n");
> +		return;
> +	}
> +
> +	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STATUS_MSG_RX,
> +				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret) {
> +		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
> +		return;
> +	}
> +
> +	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
> +	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER,
> +				 status, status & PME_READY_ENTER_L23,
> +				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret)
> +		dev_err(dev, "Failed to get ready to enter L23 message\n");
> +}
> +
>  static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
>  	.init = rockchip_pcie_host_init,
> +	.pme_turn_off = rockchip_pcie_pme_turn_off,

Does common dw_pcie_pme_turn_off() work at your platform? which use iATU to
generate PME message?

I know some old chip don't support it, but I think rockchip's PCIe should
new enough.

Frank

>  };
>
>  /*
>
> --
> 2.51.0
>

