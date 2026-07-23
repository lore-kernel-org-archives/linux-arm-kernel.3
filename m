Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB299C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWttKvpOIJT8y6GXsV/nQaPdH51Sl75N2PiyzIP110A=; b=JUisezwsjplgTB9Iszv3/dbfTk
	R1z/MEhfH5X4/2cCBKAOZd32QibiyrKNKeJn/EiDSBhNWPjQl2oGqUOcyrEeyUiSnQbKwUm8LMzhq
	AzaFSmHg6rsTevQoMQvdHihUOCcLoz8F2uXI4jAUohvJIeN/CdTv5v6D7dUTsySK8fwUyKFoAb+KZ
	S3t8grWeWYaHn2xABW7wPqq3svCeKPn5xg59RXDmQQaxz/CALTK7C3Ar0QrTHVM1UK6RSuG2KNHb+
	Ztznjy+amyrRZS4CYuc+j5R0h1d1iYtlbC4064qg19fu7vmnWzyArvGsmX6Q75NZZJIcvdYEid6AS
	iRDLV4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmip6-0000000DBf5-04Lp;
	Thu, 23 Jul 2026 02:06:08 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmip4-0000000DBea-1Jfx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:06:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq3m5cRswqmluVdirFyBZHcIUWz7ETAWpVQvNVCZP48xTxQTt0fs/qfEf6Q7y5FGRRnmMmhDch0WFZgHUYS3RirVwM1HrI4SICOwRPRBDfc0cpv66YFRjqO6UooLoUNyW7CrExXaIDz6+GUGw7BaT9XNc1c2iHx+BxWPxyTzeKll1mZf0m2V4J47Fz2LtOpt0rwleT0zZUS4p6xb3I2DzKyDG8OwNEUtG2maOg8bYrbbdSLiW20wsOTShA48cd6zTxppFZyAmg97/SCzm4BqAr9sGTweFpRp8gEUh/eG1/0LJsM8Q4AgWmc+y1/Nn+ZCODktS5viB4DCASjK8n4ofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWttKvpOIJT8y6GXsV/nQaPdH51Sl75N2PiyzIP110A=;
 b=CG934ctuVR4i5cS3sJrV3jSNZJ3knkZEfxR8GStpZeZbKxUa0Ipv5gGkU3zllrVvwseZLn03tnYnP6bzd9K59kn1DqALLMN+u/EY7gbyXy5pPOC6meJJ75LTzmrMIDd5WOpfwAe5z40utbLLcOrne3I2GJ1uM+OBZQivuTnkLreQyyHKkyUrG5zNEfcWSVBCArgHExmM+HcY7EmwFgPhOXBpuUA3etfDatXjJuQnkHMdXI+ANfztWzQW0zN/+ptGSSzwh3KjgKM4hmndiHrdsOF2yOIE1dC9NZL8ffkD+8PM24aYNdKHyhqsKMtzqXskV9Thtw5WCQn5UZ/vIAYEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWttKvpOIJT8y6GXsV/nQaPdH51Sl75N2PiyzIP110A=;
 b=FuAbfob1hiIF3p3xsAecDjjMTU4aofXznr56ghrdHW1N9vTXB84Al+tbu9MgmVRcy8PYfoe5RoZ2d7hQVtYA/4v+OmAjAIXVXNJy/V0l14MR9lkN4O2yjd1OggRXBzL3LMjlDAqXzcy0Kat90Vhd9cwUUS3i8zgrufowTDp7uaxr1Wb1XxtPeHExGvqJW8ncPuCiTxwxG3e3hxW8v7FBzJd82dgWyszEN4XBJCFuvR2jxbUR76aseD4WQbdOxS1DPRhJyhL4WLRHjfKSBMy8LtoVTN6m1IFtPw2LLxtLoL9eoLi4DbPh4vLJy7UvBplqR6HMOsAtDVKYv/6TaLpUYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DU4PR04MB11053.eurprd04.prod.outlook.com (2603:10a6:10:589::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:06:02 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:06:02 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: robh@kernel.org,
	saravanak@kernel.org,
	ulfh@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 1/3] of: export of_stdout symbol
Date: Thu, 23 Jul 2026 11:05:22 +0900
Message-Id: <20260723020524.1886806-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DU4PR04MB11053:EE_
X-MS-Office365-Filtering-Correlation-Id: 50077634-bd9f-49dc-2b3e-08dee85eee39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7iuYHSMuWWm6ScrdMf+9t4UeEDz+LhnrgwHMqx28DNHBiutr1IKi1XwgChsvjq3ReK9XGOmLX8B8kNVsn6WgftuP9eFUAmnDvSbxbDVkDi1l4nRzBJxSrWXvfe+QH1PZmwuSe3DyGeH3K3KfkIH65JDhhxD90vgG2+E46aeMiEhd0LQGEAlU7KD/RbcBLu0HHkSXfB3wcTAxR33GmMRiJ5pPaX9/Mn7R+AcCr64GNNt04ueK/XlRHxzVlBs8Yi+t3GKF67XZDjsMf/SumRDPXd7/7u+FWwekSocKGgbPhWb/Pc0B3U8/G9n1pW/NqMvStC/Kza8beCsZeqTwuMOECW93oSWuWDR7N4F/8D11ZDdPYpG+RRMh0nuSLiKMvFSaC+uJ31nJxffsv+eU08RMIgKTi4DE6IEPN6jlErPNXg754VNZ4bnixMFmRiW3E4QJfHrIFdQm5h/k7ZQReLhokRltKRt39gFKsNvG1YiAY1O+q/TGcIGK6qh0ml/SrwEe+PCf+JP72a+AHp0KP5mO5ybbGw5CRfWZL2Y0SaqvXxsQzvgGuJiJ1Nwr2yOK2IjCDO5dPOiklifdftXwlHMDSEnV7SlQp4jaTUZQuhba1sF+oJfSn01csGeSSXqDni8scDeoo6HXCLLTxBtmns1aU5evu7joBthuraDCvAi0wSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VyTMadhVMVp/szelOdfRL3Kf9W7edFF9GqFALvBEemYag4/9eIc8wmKVzThv?=
 =?us-ascii?Q?ecIklnijx/h2aoEe+VeAtQ8SHBPZHGyqvwpq3lo/zr+E7cP6Mr4c+0xXMqrC?=
 =?us-ascii?Q?+9L58tgpSX/Hp8WaUQJS0UJp4pLu6Rv9ePH6RRO3KBEV6BRmH3IH9zMk01JU?=
 =?us-ascii?Q?J0iECg7debIF/XpHfghJSql3jNpnxSrX1DxiDEK+9831yJ1W2FDII9gEraXs?=
 =?us-ascii?Q?bB3pQfE3rZyKvAzhJeCjoCKcZY6YSyYZB23v1+sV2p0FeL9erUzFsWKqEKkt?=
 =?us-ascii?Q?tw9oiREKSchGnnpWeBHgkx+BbfKOm7gxszFEDFr5vMnq31bbxIIeGeoLIv/Y?=
 =?us-ascii?Q?//gNg8B8RMuVugayfQJit/70cGJPpowDPB88swEyUuETVSMh/TLYZaMKG+rL?=
 =?us-ascii?Q?zgj7Zhm+esDUKSZ8qWX2imQRSh47sxtKcWwioVfgtC6yr/uNjuPXXZImcU2z?=
 =?us-ascii?Q?NBBmm67TkybVJ4Cqsv9d8ag0fVMsQmXGoVE7p+xN1nRCOOzI5ukgFSHCZkLD?=
 =?us-ascii?Q?nmM0Idi3m43bfAV+eXvzQmq9doQlrTj8oklsZVmS9N9evj/N52rdKe28bG+e?=
 =?us-ascii?Q?36/7FCnQj2Y6Gk3lIaR/BQWNbyc+rV/fieIpXS9VAvo/oGJlUW7ot4T4tpou?=
 =?us-ascii?Q?ynxiA26+YWvQnX7ZpkOL6zmstlFNklzdjxjJXIQ5U33WJl4BleyzzBQPfNeU?=
 =?us-ascii?Q?tFdHgNbgB6OMXSRPEwfJ7qZIuUP+aZXac24GdtoE6MUrMvk7rX0xq2pnUB5T?=
 =?us-ascii?Q?2GZlEUWynsUeSiXR9WOe051SU7Tr8zcF8OxhoPG+ses2hcqI7LdiKlj5+JBU?=
 =?us-ascii?Q?kExir/fBmi+sxPtQs9Q0ZWSyLUnOnqzrC40uLd9WgfO7taWMIgk6mu/pR5qs?=
 =?us-ascii?Q?XQ841xVCTo5vDFb+7Ff1+FL46DDV7jQIXjLmsNKVRbL0diION9iKqcx8Y5N+?=
 =?us-ascii?Q?r2Oazq1ExJzxJUypj6TXipaygkXJTG68QMCLpyHFXVLY7MRyWRck6ZOQIrgx?=
 =?us-ascii?Q?iIui+/tZM+rV+lkuiPMMttrkpoUksyPjL1gfE4+1tpQ2/UpeLZtzD+rnKZhg?=
 =?us-ascii?Q?iDsxEDvjaOcPfn4F41wDpGfZY2j2uxynCiGJobP64gDPS8IKoxoRx4AgrM9E?=
 =?us-ascii?Q?HONXGIEYiK0Int+Z1WMu+r0ab81gyyQP1xiHGXESzvj9XJHtWawnvmEU66fY?=
 =?us-ascii?Q?VqlPrfwVOcc6DAuXkNr9ERaDq/gzQG6lRlXe/oHXg9RFSgd/RhQYfZpgRdy2?=
 =?us-ascii?Q?OBI0RfYn13DKWqvUZa+9bxL+hGxUWdfNeMgvdczxBK0YCkx/ix0BKpjdgykm?=
 =?us-ascii?Q?TkvHoY7kNVJVpFJLq8pI0syAGspfK7QxnXMkZYP7VN9zchs/vFVNb5zFZ8Zb?=
 =?us-ascii?Q?lpaM2a5DZrxD7udcpG8vMn0LYaREbqPaH4fIjoLsk3SXacTkfM3oEXiU4KHC?=
 =?us-ascii?Q?LL6Pu8qTT2jUZ9ramrxhy7UxKg78xSQ4+sbL+Tx2UcBz8+AO2Qohv70ebZBW?=
 =?us-ascii?Q?9/NdZy6Z0xxE7HPDiF6QcvmVvmG+iEb2vgiXVT+NI3Ed/sEg1V9/yAUgEbry?=
 =?us-ascii?Q?711w0nomiTnwspFEDYLC6lhOgw1zNgjhSUrGO7fvg0M7Z9zgtPKm+vvYec1a?=
 =?us-ascii?Q?JK5/4hLtkF3m6dWrlVUQpzUGo0ySBpTNiYqFBXekNKPa8Dy0GfYw3uKLrgna?=
 =?us-ascii?Q?738xWUeekGvv+tjx6AGpCSLXfKHJt8RVFPGG/07XFssVgVq40Nak28JLF8aj?=
 =?us-ascii?Q?4JkfOG3qqW/7hrGfyyjJF/tpIoUKcnsaycN5vpmHt8QNuBavBGfH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50077634-bd9f-49dc-2b3e-08dee85eee39
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:06:02.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrIM4iLjmWC8KYsa/LUILnKARSyVAmTcTPJWDNErdOSEMWtoqb/kwMt5BTdBUzoeOL8LIURL35mp+1b1z5rny5rqvA6iB5AisxMpzCrhjkwjN989u/3mx/FpbMUkdJrf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_190606_359291_341E3867 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

of_stdout is declared extern in include/linux/of.h alongside of_root
and of_chosen, but unlike those two it is not exported, preventing
modules from referencing it.

Export it with EXPORT_SYMBOL_GPL() so drivers that need the stdout
device node can be built as modules.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..a25c95800719 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -39,6 +39,7 @@ struct device_node *of_chosen;
 EXPORT_SYMBOL(of_chosen);
 struct device_node *of_aliases;
 struct device_node *of_stdout;
+EXPORT_SYMBOL_GPL(of_stdout);
 static const char *of_stdout_options;
 
 struct kset *of_kset;
-- 
2.34.1


