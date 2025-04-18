Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65C2C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqWATxGpOSk5DcvJTw5qOdtRluRezYzDdrMcnoZgEIs=; b=FT5PU3YpjYyMQdpzej6w3DnqBx
	i6/rREFHj6lfKwXsd67wdKxjOqNyzumon9oijPeqNZizinPNYQKPt5mYVzCzAimGNz6QxdVuSvi39
	a8YeUooGRulklxEsLTqjfBp6Ttcc0gZBWXAt4wlpxViHBdsRsSKiQAAE+GRgjp1nmc8Sb8sxAIC3J
	3tIpCr/1XNhwUxvmmO+8m/XvcpIQk2zkrbCTo2ERLWgx7gnE4zTrlU/69pahVhW8pZ456HUKyZkca
	wEtLmwJJcgcJyhkQQP4SJhO624Fem0xZwYW3JZk9ZIWEPAoJEXGzRYPVSMWD+py8gaWXdHw+ON5bL
	OviJdVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5g8w-0000000FTJB-3Cj5;
	Fri, 18 Apr 2025 07:28:10 +0000
Received: from mail-dbaeur03on20623.outbound.protection.outlook.com ([2a01:111:f403:260d::623] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fqz-0000000FQhn-2mmg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:09:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDTNYvQjfshhQLDALytR2y+c9d56mvHB71slY30WRDY39CfEvkdkfHfBcpbH8XhLxk2HhArLGuY3/dV1Y+TmkzlawOaoWW2YtYNCtEOEgdUK8L8Dt32ZQut3g4RBvAjL7g18k693vUMqwAzqKl1YtRTHMk3rBXKSEoi/OkH16Ld708hQLRhGschf+B2vp8nbWyUXDOJKHsls/byL4+DOoko8b0wURHCGHo4eio4ErIa5CwQ/Jsi1xtZLOjsAea0tW/LpUjeUvjCZGrTPGcyuHSm2JszYsXAl6tg7JcYzHSWRDJfWsHUi1s5qK5eRvKVRQovJjOSHMoVAIrLDIHbZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqWATxGpOSk5DcvJTw5qOdtRluRezYzDdrMcnoZgEIs=;
 b=aHFxrJMAs1KT2EbShNymjaZB8XSIRkYLM/qqjbGrHDLefusDn0PDTc54Gs5XEtsKWiyrGZPzsjod4ZlaVVWSoL1ryArAmpjeJc4LfNFxk1fuUPDDqDTz/WQn8Nh22xLFN+L2rfCF11VGRcCnVp7IhWcDOAWJp1P9vQtt7L9Lkc3Cp+VwwMtEZ021ZkmPbJQrJkrffQ1VNFprpmPe+zMuyHBNjbKDEEjxhBBs2egGSf83z6l6cgd66AqSiINK6X4Dm5wp0SejP/SDi7FQkds1f4NmrfRN4jyqIpgM1mSz7BLGLWfmVZuxXRsucGZd2+fcyyJTHUwQ7OSk0KSDX8wcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqWATxGpOSk5DcvJTw5qOdtRluRezYzDdrMcnoZgEIs=;
 b=Ui7K0iv3qU+KvbmpBVXoRxp0OnmQNBatYYRaYeT6lDZiiCjl+IcfS31RNUcXtV5RSW9s/4eTTNVnYhRVOeV5LbPCayP4Itn+IX80YrzCod1u1FygD1alqq4qZLDWmZvX/CtDxOx7vUNyu7aYKMbcqFc40c1aiCtnL5AAhhQ7YlcjrCDvCoAjNmEeoVkAWMKQ0vCDS5USWYL/CY5Q3fpY5yxpQPkXPpv2EXIL+G90MpayTmFyh069da9Tp9lhqNhgDVyU9iT+K5RndOT9vAtV5NrhwnRDhnFh+1Wm60sv5eLB/IUExP2jWT/cxE2Fhuyn/cJuQyuqe8c+B9xpm3VIFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 07:09:34 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:09:34 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/5] media: imx-jpeg: Reset slot data pointers when free data
Date: Fri, 18 Apr 2025 15:08:18 +0800
Message-ID: <20250418070826.141-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 67742a20-969f-4be7-a15f-08dd7e47f915
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L0F3SZeh6ANTg+wCtesd789wR3SKCmOi0yLoeUmW6R/alSTuNLmQi2SJK/jk?=
 =?us-ascii?Q?BjCyfWvh6zLnohkgr1L5HaVtFeuxNOU4d8YMChwc7rmDzo60d1GHw49Tqv0G?=
 =?us-ascii?Q?gb/UmPWTJ6lPir3GR3UMSQ8AHthUddRZT2GpOq/CnE/PadZ2T91NL9ZcBOAS?=
 =?us-ascii?Q?lxJbdHHCP3C/pHyKP7OU5ANEyN3zkaE2Hnk+fngh3ltVabOwgrFq1Y0MhJ2x?=
 =?us-ascii?Q?fXB2Eo65IeNyu445VRP4DE6VHPDGGoCkdHknGVqBxuWRx4zoXEWsDTkSCSsF?=
 =?us-ascii?Q?9NaZViTHbl3Zd9qilOSqBWeD2cW6flUCKK0cuViGkCYtP5+YVeY15uP9KH+E?=
 =?us-ascii?Q?JHgnQjha/eQdJHwEZeZfsPaPlBLu/BF2Kb8W8vhzupXukyfm0OLkG6ut+68h?=
 =?us-ascii?Q?shajcWme6sKEeSA5CwLi7sEYmPZ7o9V50kt7Dan7Rb/NiV4AFizX3EIWaJBT?=
 =?us-ascii?Q?EG5uzLRNwMThOaQrbkma5AY8P1TpfHRG1fU1GbC2xLENLAxd5yXqa6vQSAD1?=
 =?us-ascii?Q?izjbdvFV6sU3x/lb0fqyqdUduzZh3WX+yXgxonHXHbESD4JMYEN5S2bDvB00?=
 =?us-ascii?Q?dqQW0l0DPZFa6MzTD9jh1qCU51A2vfBzwzwcqRQgIhnAUIW5MDHRjNN1NIdy?=
 =?us-ascii?Q?ss4YAaAqXog586cR2jfkn/VIKRQygt5XVTw1wrODJjSOlGfydILfB1IwBz/l?=
 =?us-ascii?Q?fZ0aZxGiT6hJx9gM22ZkIzIJ3z0xvqUSOdS3uKsEEVBlJ7Pe2095dg5ZfKHs?=
 =?us-ascii?Q?4OX1PsnKg1qqNTsAU5C5vgDDNOv3dKaBRfRXocpGEFHK+x2eR5yXQ3i0DUSu?=
 =?us-ascii?Q?EBmJ82kzCHOgFzPMvjl8ctuo9O664A50OftCG5S6wmmysL/zKAIqX0rAwo9a?=
 =?us-ascii?Q?s+sh9XCjrVeQ24U23q+JhKVSJqlpfR65tD3aObv0SemHvJyNbdZ1H5yooM+J?=
 =?us-ascii?Q?cIyef2D4FXVyClrKcKdUyG1HcU5EhlPEEvy894NbNfjjj0iPRBzWX1+OjNyG?=
 =?us-ascii?Q?JagryVlFBJzxY9RNY5U2b3q+wRjJWr105V55rtgpOjNHWML6SznlizFc8iPW?=
 =?us-ascii?Q?w61j3vODV8ux4QUnmFWs18fVaQGqLXLpNcgn05AUfWf4FGpqBsCFKrUMjy9o?=
 =?us-ascii?Q?SFwX6dJOo9EO2moNuBYcGFG7t/i1OnQXln7s0Rdc4kgJIva8MnRHNPjvEwr9?=
 =?us-ascii?Q?9W9b6xJr2XojTQ2EzPRXjplXfOjFBLFKujgiul6qnwWbM5k2ijXsNRcQnH2Q?=
 =?us-ascii?Q?wMUc1IWb3YBarQaU9pORPBTHtNx9MXmvDH1jJMq2u2bCg0OGcO19Kmi8kf7U?=
 =?us-ascii?Q?4hEHTCGxqUbF3MyxZziGIi0GXeMsaTceaVlEY2E55WY3khUvGoOelPB5o/A7?=
 =?us-ascii?Q?PDsEie46fGcaRsqsC/Osf8SxUck0GI0a8EkbDRLVkWmXRHtSz+1WCOOo8tLc?=
 =?us-ascii?Q?hjTTzMZ1Jw3h8Qe8+lxjXOmAF5AfeYRs5yjpp+qKnwn1qQBftmb4RQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HE3M6MZv2RWut4ivi653LxOoXd3WCGDgpftu7YciAWHgrWQ3qw6DP9rGz8ta?=
 =?us-ascii?Q?NjiIl82dmtLsP+iRO9Ak6c8GiSz+AM5amSBx322IVSCCXGxHiz6iFApiMh3F?=
 =?us-ascii?Q?cqR3oEjHKxGhcSA9/V/4SrroLuZIwe2E2QGuyikDbn+36deri5PzfkOkF7Dj?=
 =?us-ascii?Q?/6lf41Aoq6Qz0WyxcxbkYjq7MKHb+PNtbEPkWIWZ/yJw7b8Lb4o14o2EH/hv?=
 =?us-ascii?Q?SzjlSB2rKX+FqS7lZyAmLcKehv+ZxV53SmPYZpJfp7ibczKz7rLlAYDmCc3k?=
 =?us-ascii?Q?92hxWrJRKqSfpUu6jcFMLQHrybfVaCsmMaxL9r/EQFtnVwrND4y0BVB9XjSr?=
 =?us-ascii?Q?gVzMOucZNce3Sy4GAkF7UegHBBoIe/CalX6TX7KeSAOPfr7EngDvK7w8pxLJ?=
 =?us-ascii?Q?Bk+Tivs6ie9AfbkZ3Hnm+MaNSq1iZcWcaPDXU7p3QaZsc0XHwAL2CfmwNb/B?=
 =?us-ascii?Q?+YC9TmIqKEpCUGXGglkIIog3mSF3siCigAKKxbjI07vSSFglpFtG1tV/DESF?=
 =?us-ascii?Q?kj+ulNDdPQ2pDmpYrWZ17/o48XhI1yHaDpGCoG7h712+3gbuGil9mmyaq0Oh?=
 =?us-ascii?Q?xRBA+j4YgusSxj8UHhCwUMwuEmK37ASQkndY/JozQiES8p9NzV2Xjop9ZlDq?=
 =?us-ascii?Q?KSvZC4UN2rA9h5AXAujws7gF/5iqUN5giMir054StTc7r5q5XvYbde+pn76m?=
 =?us-ascii?Q?fqOx/W4R/kHYiAHKKU+xm1HDLAPFTojMzgtQSPADWjkBKzIytCnlWLg4Dg2d?=
 =?us-ascii?Q?LKqh5q4qF6J/SaWpWeEYcJeQ3gljwL2Nw1TAGm/iz96c+yYVnZKYpl2nStrb?=
 =?us-ascii?Q?2HA7W96hb46OMD+IiU93+28dSopfpbUGfpr4IYTU0WrtIUMrzx6g5zKZjb8k?=
 =?us-ascii?Q?HsktZiQbX861OCJ0rc6N8CFVM6y+mqZZ9hFFD8s3jMj+6xIdr8qpDQqa7ru4?=
 =?us-ascii?Q?5g7cvz0wcy8G71VW7aCfTkPdhRFFy7jUDD9wZcjuLvpvcFpTAyTdYlRJG8bZ?=
 =?us-ascii?Q?qlFOmnbwncjQVDEWYiQYiEL21En1/j3W4ENoXC3og3j32F2C6g2GYyryBOJ2?=
 =?us-ascii?Q?dskyg3LjOtNOB9/lfbDtBApeg0Zz0XQkO3TiQLydbq614C4brXAeTp3CU3lw?=
 =?us-ascii?Q?TC/0KlBzWNlwGh4FYCWlbLTxP5ba4Ale2lyzjZp0uMYB88oIjx9N2YyGJ7K2?=
 =?us-ascii?Q?R0KgrlxkiUYXna5peDSk//7Ql4bknJXJAvM06f40aShdt21+k7tAB2EU1HY6?=
 =?us-ascii?Q?9h+FaGpXm7RNUZu6m9fGwuypxCwjj0XOIEuxj255lS+mULOx1yhz0rRS7ivn?=
 =?us-ascii?Q?yuTU/q1kz78e0l91P54RuVTodd2LCTk0xD+opEpsRCm9hwz3Ak6MO3zFGNyO?=
 =?us-ascii?Q?FG7y7Jh27HB5L77I9o8gsF8G1EMuYb193V/zRR79EnnSWZG/duGsrIi2wQlQ?=
 =?us-ascii?Q?QIeEBu5zjr+vHfcfTrBjQ4V6+aGsDYWTsOCq0LKgXu0Z0itVOo+1DiSAlLA5?=
 =?us-ascii?Q?Hd92HMuw6gyAG7QB+q/56dPSbrvXnn69V45akvdmSAuq3KYJdtfCRqvnYsqA?=
 =?us-ascii?Q?L2BVZmPuYolTDikBpp6TN/zJcAPnSG3Wsg8IlhoH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67742a20-969f-4be7-a15f-08dd7e47f915
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:09:34.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LW5jeJpehetsdPs3FIpvjhu4EIxo6IK+/A3YWx/xANo1gLXq8/DLDR8+PxQAqiQwHVga4rA3BMJ6RsIqtUbv8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_000937_704702_4B953C73 
X-CRM114-Status: GOOD (  10.12  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

To make the function mxc_jpeg_alloc_slot_data() and
mxc_jpeg_free_slot_data() safe to be called multiple times. Ensure that
the slot data pointers are reset to NULL and handles are set to 0 after
freeing the coherent memory.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v5
- Make a single patch to reset the slot data pointers when free data

 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 2f7ee5dfa93d..b2f7e9ad1885 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.desc,
 			  jpeg->slot_data.desc_handle);
+	jpeg->slot_data.desc = NULL;
+	jpeg->slot_data.desc_handle = 0;
 
 	/* free descriptor for encoder configuration phase / decoder DHT */
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.cfg_desc,
 			  jpeg->slot_data.cfg_desc_handle);
+	jpeg->slot_data.cfg_desc_handle = 0;
+	jpeg->slot_data.cfg_desc = NULL;
 
 	/* free configuration stream */
 	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
 			  jpeg->slot_data.cfg_stream_vaddr,
 			  jpeg->slot_data.cfg_stream_handle);
+	jpeg->slot_data.cfg_stream_vaddr = NULL;
+	jpeg->slot_data.cfg_stream_handle = 0;
 
 	jpeg->slot_data.used = false;
 }
-- 
2.43.0-rc1


