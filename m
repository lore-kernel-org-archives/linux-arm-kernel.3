Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBC7CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cffr+eIma51cK7nOpsDIC/eI2O1x5D8kTab80e6RBc=; b=0QsmdO2mLtUAJkUMe+r6o7SEE7
	zGsENh2Rq8tzCaTXWil3eeRmXjqDbxBJOuKsZeEAKPJSoEHly6QIj0E5+FxlwLQ2XVyFzEOfRQsUi
	J1ynMnnkaCMdFCRV2KkzJTU7CFpT5hNTMEHj+9VMe4gSeu5Ko/dfaeFlYUS1nBPnzuCEXwNmsVQcj
	QZYkG5RFnCFjU0USDDepznkaSz+FL0wDKMUe29Fc12n5uyRLLb2mYJsmOgy5ytYmURYvkif9a3WtW
	s8gPwR1yXj+kuOiX1cicOhDNFM1hjmCDp8K4JiGZQ1yxpLCP2faItfzhHq+P6cLT9KRN7TbCVfSId
	Q4jNFwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97x-0000000BaA7-1A3O;
	Fri, 12 Jun 2026 21:09:21 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97u-0000000Ba48-1Vnf;
	Fri, 12 Jun 2026 21:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDJjBGPwuT5MjGGuoVRyi5FC8OA7igeo8wUOAXFLJUBF9oImA7kNvbd6HSF5l+y9xlN6I8l7RL9ErOUBouWjc28U+t49BTJWzgtQrrJxGrHpdQK9iEhUN+KnMOZmpUdYvM945Ri9WuhiKgNlHLVXI8BZ4Y1TrBeuUGNwOpgm61xEw27w/Yo353l4yLyE2VRBXLdmw/QbmvzENu7cqSNScrHDWGIlPZ8YAi7KMYQFWfR1fK6KSzv5vfAFGxykL406rIQIV4K4IFjfMeX5oZuHpcuKK1bklW3JWuRlud4I0mNM90MhjOyFdIqIf8EAjwX4L3q5WeaBUh2xTwbWthZsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cffr+eIma51cK7nOpsDIC/eI2O1x5D8kTab80e6RBc=;
 b=xaF3TVMYl5u9aDjXF5ZX6+l2mOxBYaaLBcWcMCi6c4Fw5ZfQ+GOk/r48yOKzZjKioSoEMt8wsUTOXStJ+e75TkbdwhOn5E4zivYcNVHd43wqAtIOMEZ3fUvq5yDUZLhT7bSLxRqmUFfOARkLWnvNz62U8W4EQ44ocZ0p3yE+0KyDpcBTw/szx1qh5I0NkGA7WPpjk6otcV2yzi2VTnuxeRO+a2Ob8oUg9P0vS65DIHdTPMxsYm/VBKntBXq0QNz2aOR47lvHvG4iYCfxnWyHckIg1fO2+SdoLp7Z5LOOdH2uR4gKNSdgGpp/2duNfgj8nlvBRC0pf+HNX3fHXalSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cffr+eIma51cK7nOpsDIC/eI2O1x5D8kTab80e6RBc=;
 b=Eerb6FbXGrvaoUIu6rUXj6uuuuODWru+/lkEebMgKI8iT3yc1eqSPx/shrfWmmv4z7t9LWNvhYzb13pR7jmDpSB4FyxWtAYRBcgdIsoNCQ1+gRnY/sBx/jXZumRNV9MLjd5THHxMCT1WrgOPXTGnARHkh6VUP/9b1/Kuv5/hh9giuayGXpXqFpVZTS55O8ZUEQlfXp2McWf+Lvi+0YLOtSD7SHImQRZlyB4GpD9lOjacKFceeP45teFMOFsza0N52CCQxwVTdf0DAJLeeFW+SMi7qB1epIDfaY2OhN1mkn/ECKb0d+zGSiMtDK66ttW75oO7S1Hd9Ehvi7t86VM+cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:10 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:09 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 phy-next 4/8] soc: fsl: guts: make it easier to determine on which SoC we are running
Date: Sat, 13 Jun 2026 00:08:55 +0300
Message-Id: <20260612210859.266759-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612210859.266759-1-vladimir.oltean@nxp.com>
References: <20260612210859.266759-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0004.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::10) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee97141-d950-4455-fb51-08dec8c6d8a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6f7roU4J+JleRfSpYtmm/sfMchAs9Hv0EY5Aa3ekM+GnSxwovS0Pm1zhK4hMb5MmXvWnO27TeYYN4Aw+08El57G4V01g1AETxYX0im9ZjPHycD1xVwLdVbG3GsnHbxJVV//ABuOWtJnI75/eHyfyYs4U3kpTAVIwyP5TsIN3+9uqKir2/8g5Npx3PaDI4Gs7Hb+pFQzTTQFJIX7MaTddwPGo0fn6Nwe/B/ERjo8JPkRccJnccIJZqhC0K6KIaxTljQzed73NIZ3yI8n4hIPpTzz/RGPHjsqXRNDaZeb/wgTxwIvjH2yNgsf7p3xmvWVSMArN/Wfyb0cTFILG2iT5bPiOo3u62Hep+VbR8Trbo7w7URgntwFg5gzL/V1NZFqWtI8f7WioSnnjDZ2kPXIrYY5QSBmatrYwxjWzeV7Zeaufgjeoi/fnLIIVJ6YGA9ynws5Oe8yjWS/MXZMw9uEN9It1VNVCf4UHFsZWL5gb6AraTAICPG4uy5puUnsKd075bkf13MWb+fgmFgaof3Ti92AdkPf7RBEfuXX4pOAuf0pwRbSsrijLkJBq5DiQ+o83NLXc1zZY+kStSIG/HgepI5J4SJec5MHXaHysoJ88YtsMNq0kCEdGMvkVlJ+IupymQkzhlv3DsBcxVT5v2aql8e9JQj+x+YVMCWPkkOvvMcOyZGjIwpV3Kxbx2WjMnE5Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5XvWB0rxlFyzfhztfziOLKCHjavBO53ssEAgS+NbvuiBiW2bnIU666dYHiE7?=
 =?us-ascii?Q?mWQeAbvb4w1+mMUtb7Ob9bLexaK80GqV6RrvKjljnfhy1s48CdZw+L4cK5Jb?=
 =?us-ascii?Q?S/LCexFzxwRXM9d0b+EXFflFmv17piQkhstROX0+mZQWMwVF6sp4B+CDdzNa?=
 =?us-ascii?Q?rYg68Jj6KAur/Zo+svXRdcJbQc9LcJeOVk2E8IiBaXik8Ga8SJxletqBl8zG?=
 =?us-ascii?Q?jl6n9rIQH8OZMlsqouw8P0ycxeXWm2vNWWcZJRubGF03DEMdviT50Hdkk+0k?=
 =?us-ascii?Q?QLbjMkBs/5YGEo69To+VinrISS9ewyhj/bCREEunIA7RMMzY1CAH6i1bExoX?=
 =?us-ascii?Q?gJKrRfWSzV7hsnMpZkQji+R1WPc3++lHDVSWkBWo/ZrglvFIjuL0mZNyrkYM?=
 =?us-ascii?Q?w0cQG0vLu8z4a54IAFa8oD1yDtU25FmZAFDevUiBBSUJChK7kdYaafq2uw+y?=
 =?us-ascii?Q?dmVvddp6z0YkwNbl9sMm087tUBwsVgQBfgOPyLbFQjLTSnk77IF4onE8oGB3?=
 =?us-ascii?Q?XXd9oOosaNA/udWVVUmHUsQERAmCx5a7kBlmreBo4JG0wMgsC0bzbw2/CXDR?=
 =?us-ascii?Q?nW67rUdU3gCpYREpe+AqsL84QN8nQvVk3GKmi/oF+8mpejpOv92c8pocrpgJ?=
 =?us-ascii?Q?Gq7FMpvVz1yUaUuPLXDA+303vfLkBkHlFrLpsQjSn+KvNas/GkJIynhAj49n?=
 =?us-ascii?Q?w92lcztcqh0AkuVTgDoUvLSVyw40izhA24Hl1JqjYC7tcslMSRjy/cucdmLf?=
 =?us-ascii?Q?SCuwesxkIAZI/eXUIe6wrWs3nPb13A/xIuDR7Q6Y1AOQV9lnseS7S8OUO4XS?=
 =?us-ascii?Q?WxCPr3vnZF+x1/IhCvsdutcnw30Gho+MegpZev/zt0x/Z/9ykJgkokHqEsl1?=
 =?us-ascii?Q?+weBnQUBoqaCcmq9eC/fkxcZkztyv4rzdYkKrizOlXKnG0UAHAf6nfb/iE0i?=
 =?us-ascii?Q?EbbVqlHE2844orkqrIl4ZYSUmc+0x+31WXV6D9b/3+8vPPD3YakBinBH2Ij2?=
 =?us-ascii?Q?7dNYZnx5Vvy7+CIk9Kgyl3G0Rq6Yn8Mj552bOVPfLMCp4dZCFmheTNKxI+ft?=
 =?us-ascii?Q?u8gkNHgz6+OlIFWhhEEXBTzraeiXaWNQb6PHOFsTTOeuDXdKcLi/GXLk565M?=
 =?us-ascii?Q?6qLN38lKPwGPXqFlIpssUJA4JdUhhwJTpzQMcTatAn7xRLPuUVINIc6IDXFo?=
 =?us-ascii?Q?ahvekB6sNMEJ3jM4W0LxLRN+R4z71mrOXrCzTGsICrsgtNZvh9RktTGymi7x?=
 =?us-ascii?Q?N96UnAMqYnxKXWAjxJvKHok7uif4nT90BkJ0PWjNVp2Cziz4/zhBMCg+N/cP?=
 =?us-ascii?Q?vHUkB9UpVUkkh/v5f5/K5pJtPC4uMytOjiISovuOWuSb6LQ4slcxJ6TYszwh?=
 =?us-ascii?Q?4N3lzjA7UyY49c0MkK3xLm5Y8WE2RJxk/1VB3W9BL3Gk+5OcFF3tP7MniX2R?=
 =?us-ascii?Q?9zR60hjvQFy/YA2OrNOEGLprYtjEafPDbxYz+yrTszTEccLav2FAMM9RE4HF?=
 =?us-ascii?Q?HgAC4PPuQF13nI908zloQxlFLH6v9n0aa7T2bPG1zWmXHfecUxcxn1oPxsHq?=
 =?us-ascii?Q?PajBzw3q7ai/OsHOwOG9v2KiX69h7IePXMIrQkU3A5qGPCLRmn5WSLL/568d?=
 =?us-ascii?Q?WA9Le1YM4/wwnEKiIFc44Smr49AwsS5B/Dc8KyiBeZhGu5ttPtOr8B9bZM45?=
 =?us-ascii?Q?GlDyHcNj9vh8n8gduvY2jw8zsHP/2nFqwhlgFYU5b/PYYyKe/zQju9v/RmeK?=
 =?us-ascii?Q?nvGhIBs+VgPPNcr+jRQeZEvrAzDOJT6htUdNW8Oz+xFaRpGjEZA8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee97141-d950-4455-fb51-08dec8c6d8a5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:09.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deZlH9K0sVrOOthguX+W83IruVj8GWvI0TKpASMV0um0JAQsQXcU2INeX/Y1InIeRZK4yIyFTyK7gFkzk8h19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_140918_409170_000983AE 
X-CRM114-Status: GOOD (  19.30  )
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

From: Ioana Ciornei <ioana.ciornei@nxp.com>

The guts driver will need to easily determine on which SoC it's running
when it will need to perform RCW override at runtime. The guts driver
knows this already because fsl_guts_init() reads the QorIQ/Layerscape
architectural System Version Register (SVR), but it doesn't save this
for later lookups.

Add a new qoriq_die enum to be used as an index in the fsl_soc_die
array. A new fsl_soc_die_match_one() function is also added so that we
can directly determine if the SVR is a match with a specific die.
The SVR value read from the DCFG CCSR is also kept in the global soc
structure so that it can be accessed when needed.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: none
---
 drivers/soc/fsl/guts.c | 47 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index dc1a42cd9544..1494b545bbb4 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -27,6 +27,23 @@ struct fsl_soc_data {
 	u32 uid_offset;
 };
 
+enum qoriq_die {
+	DIE_T4240,
+	DIE_T1040,
+	DIE_T2080,
+	DIE_T1024,
+	DIE_LS1043A,
+	DIE_LS2080A,
+	DIE_LS1088A,
+	DIE_LS1012A,
+	DIE_LS1046A,
+	DIE_LS2088A,
+	DIE_LS1021A,
+	DIE_LX2160A,
+	DIE_LS1028A,
+	DIE_MAX,
+};
+
 /* SoC die attribute definition for QorIQ platform */
 static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	/*
@@ -34,21 +51,25 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	 */
 
 	/* Die: T4240, SoC: T4240/T4160/T4080 */
+	[DIE_T4240] =
 	{ .die		= "T4240",
 	  .svr		= 0x82400000,
 	  .mask		= 0xfff00000,
 	},
 	/* Die: T1040, SoC: T1040/T1020/T1042/T1022 */
+	[DIE_T1040] =
 	{ .die		= "T1040",
 	  .svr		= 0x85200000,
 	  .mask		= 0xfff00000,
 	},
 	/* Die: T2080, SoC: T2080/T2081 */
+	[DIE_T2080] =
 	{ .die		= "T2080",
 	  .svr		= 0x85300000,
 	  .mask		= 0xfff00000,
 	},
 	/* Die: T1024, SoC: T1024/T1014/T1023/T1013 */
+	[DIE_T1024] =
 	{ .die		= "T1024",
 	  .svr		= 0x85400000,
 	  .mask		= 0xfff00000,
@@ -59,46 +80,55 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	 */
 
 	/* Die: LS1043A, SoC: LS1043A/LS1023A */
+	[DIE_LS1043A] =
 	{ .die		= "LS1043A",
 	  .svr		= 0x87920000,
 	  .mask		= 0xffff0000,
 	},
 	/* Die: LS2080A, SoC: LS2080A/LS2040A/LS2085A */
+	[DIE_LS2080A] =
 	{ .die		= "LS2080A",
 	  .svr		= 0x87010000,
 	  .mask		= 0xff3f0000,
 	},
 	/* Die: LS1088A, SoC: LS1088A/LS1048A/LS1084A/LS1044A */
+	[DIE_LS1088A] =
 	{ .die		= "LS1088A",
 	  .svr		= 0x87030000,
 	  .mask		= 0xff3f0000,
 	},
 	/* Die: LS1012A, SoC: LS1012A */
+	[DIE_LS1012A] =
 	{ .die		= "LS1012A",
 	  .svr		= 0x87040000,
 	  .mask		= 0xffff0000,
 	},
 	/* Die: LS1046A, SoC: LS1046A/LS1026A */
+	[DIE_LS1046A] =
 	{ .die		= "LS1046A",
 	  .svr		= 0x87070000,
 	  .mask		= 0xffff0000,
 	},
 	/* Die: LS2088A, SoC: LS2088A/LS2048A/LS2084A/LS2044A */
+	[DIE_LS2088A] =
 	{ .die		= "LS2088A",
 	  .svr		= 0x87090000,
 	  .mask		= 0xff3f0000,
 	},
 	/* Die: LS1021A, SoC: LS1021A/LS1020A/LS1022A */
+	[DIE_LS1021A] =
 	{ .die		= "LS1021A",
 	  .svr		= 0x87000000,
 	  .mask		= 0xfff70000,
 	},
 	/* Die: LX2160A, SoC: LX2160A/LX2120A/LX2080A */
+	[DIE_LX2160A] =
 	{ .die          = "LX2160A",
 	  .svr          = 0x87360000,
 	  .mask         = 0xff3f0000,
 	},
 	/* Die: LS1028A, SoC: LS1028A */
+	[DIE_LS1028A] =
 	{ .die          = "LS1028A",
 	  .svr          = 0x870b0000,
 	  .mask         = 0xff3f0000,
@@ -109,6 +139,7 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 static struct fsl_soc_guts {
 	struct ccsr_guts __iomem *dcfg_ccsr;
 	bool little_endian;
+	u32 svr;
 } soc;
 
 static unsigned int fsl_guts_read(const void __iomem *reg)
@@ -119,11 +150,16 @@ static unsigned int fsl_guts_read(const void __iomem *reg)
 	return ioread32be(reg);
 }
 
+static bool fsl_soc_die_match_one(u32 svr, const struct fsl_soc_die_attr *match)
+{
+	return match->svr == (svr & match->mask);
+}
+
 static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	u32 svr, const struct fsl_soc_die_attr *matches)
 {
 	while (matches->svr) {
-		if (matches->svr == (svr & matches->mask))
+		if (fsl_soc_die_match_one(svr, matches))
 			return matches;
 		matches++;
 	}
@@ -202,7 +238,6 @@ static int __init fsl_guts_init(void)
 	const struct of_device_id *match;
 	struct device_node *np;
 	u64 soc_uid = 0;
-	u32 svr;
 	int ret;
 
 	np = of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
@@ -217,7 +252,7 @@ static int __init fsl_guts_init(void)
 	}
 
 	soc.little_endian = of_property_read_bool(np, "little-endian");
-	svr = fsl_guts_read(&soc.dcfg_ccsr->svr);
+	soc.svr = fsl_guts_read(&soc.dcfg_ccsr->svr);
 	of_node_put(np);
 
 	/* Register soc device */
@@ -229,7 +264,7 @@ static int __init fsl_guts_init(void)
 	if (ret)
 		of_machine_read_compatible(&soc_dev_attr->machine, 0);
 
-	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
+	soc_die = fsl_soc_die_match(soc.svr, fsl_soc_die);
 	if (soc_die) {
 		soc_dev_attr->family = kasprintf(GFP_KERNEL, "QorIQ %s",
 						 soc_die->die);
@@ -239,12 +274,12 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr->family)
 		goto err_nomem;
 
-	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "svr:0x%08x", svr);
+	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "svr:0x%08x", soc.svr);
 	if (!soc_dev_attr->soc_id)
 		goto err_nomem;
 
 	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%d.%d",
-					   (svr >>  4) & 0xf, svr & 0xf);
+					   (soc.svr >>  4) & 0xf, soc.svr & 0xf);
 	if (!soc_dev_attr->revision)
 		goto err_nomem;
 
-- 
2.34.1


