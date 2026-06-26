Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3948C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knZGSNK+WfsDl49FolwSmSyQOJgxNJi6A58awQ3htQ4=; b=VP8L6OMXmYDsxySGjqpZkFr02c
	YkJ6+iv0HA0QIZShk/mvSTTJrsLfUMj4ZXuoHCd8EjB7VNKohp2md0k/koxbk/WwoeMil54R2CLef
	mxoZMqK80olEp/2Vkw0j2liAMEZexaupL4uQc9rjn2HCI5sjNsuZtp54jtfLdpyLKDdwvdON9hdLF
	G+T7c0Xjedhr076Beoj/NG3qMcBbbkzg+3/tSiDnqH4h/qnYWUgXybgZreAx6kHnZGsCaVD4ekppA
	wYIb4SgG3iLQCAyU8N0spRwvPwcWXUDpLZcF1SioMer0untAcGCDfP2IA/8QSQvN43TuxoFJAznmo
	nC4eNxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdBLJ-0000000Bl5R-2FlS;
	Fri, 26 Jun 2026 18:31:57 +0000
Received: from mail-northeuropeazon11011063.outbound.protection.outlook.com ([52.101.65.63] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdBLH-0000000Bl55-0o78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 18:31:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvNXmCvlqmJJjRrLWOb4Q2CIhyQURhuEVioAk2M0Uu91ms9b5WfTDcirbqxwomzq8fItm5/QCGa9Fw5y2Wnvk3u9kL5+yNiI9I/oa0T9CBsTr2JMXjxuVSaQ1giWReBpLfzeXhnS2gLmm+hU27IL3OixyXy2kUN17jC5EGomxXsvb83HFuxuJtVEZypwSEyhHukf7fri1SP+uIo54tsEqNg5f1wCGcY7sHpiz9SAtC4EZKf4uGe+FDcIO3EXsZQhLsMmKwaqAuexIj2lyx9n/3NQ+U6ePxnFUy0CJyr5IBXGJNhYQq8wOBmk44B6js4UDed9OCwFys0loHv7ExXeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knZGSNK+WfsDl49FolwSmSyQOJgxNJi6A58awQ3htQ4=;
 b=E2NTxYGKBtFRYa1V0z50j1616K/JbKcPiAa7ThmeKgmPD6jsBDAMnErVwxqkFyzA05wZdMUd9hIPxdL9fSF3/LnePpRZVOzMuD+Hu78YLxRUm3C5vE3DR2cc9Xzfd7+9gForRo0wfoUSiFd+DcUGHTVENSgFQpTHcj6iyWsDNfjXIvxKqihENnWcV7X5hjOKIcKwu11jdYqBbjDor2WbB2nakcuXd3js43MC8AO99lLzrKI7w1ohnF13UgZgy5GRnh778K7FOHL2+y8JhpPnVDGzzx7P0cMKxLoVEqe8rlG4DYije38dO/HECooJ76B/FW/76PD/15ccsSfHW0WwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knZGSNK+WfsDl49FolwSmSyQOJgxNJi6A58awQ3htQ4=;
 b=bLrsfzFMuPq2QIdAg+gNJmEOrki8viXpgHUugURu974/bHMSFJ8xQ3D/B74gTZgXK/neneKQ+4/HmvvRg4n96fqtcYhYJyOBblP7F9IhQ87GHm7382YJhWTQLSIOFDhQf5Fj0uNQuGsckFVB80J7AtUveHUa8laeoInbjVIkelu7zFtug9bcvGm+X19lQLiVfN221oxT74hitlLzbtRUdn+Vayo+rQyjojLvP3C4kO20NoTWR5h8qpoK/pUIG6BqtXP7q1Qd1+S5InRcnJV5UXYY9NxJfEPj0CLhi1ziFdNaEhrVeCcur+CB8dymlKLzj7hwfbGHF2NTCPZM4FF4tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10951.eurprd04.prod.outlook.com (2603:10a6:800:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 18:31:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 18:31:49 +0000
From: Frank.Li@oss.nxp.com
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dt-bindings: mfd: st,stmpe: document st,stmpe610 compatible
Date: Fri, 26 Jun 2026 14:31:39 -0400
Message-ID: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0129.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: f39e96e0-d7be-4f3c-981f-08ded3b12f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|19092799006|18002099003|11063799006|56012099006|921020|3023799007;
X-Microsoft-Antispam-Message-Info: N2dIWUpPdvBhFg8KMGTcy7vH7qPsq46yEXod4Yzq+npZg0ox58xGxmmsywULIHWeWtR8obpU0E6badHdRZKVj0HXquqMGGXVfAILv1YN2weOcgyd21NhFlCeYdnQWfciIFTrWHQv9f0T2SS0ffv10CJQBE+JmRcv/5CpZ3EVGAY6OIuIS9MQW1hm/Cwna2Hz4rVXcuq5wsfYQ/0Lhm3CcWUxQCNdueUbPbnbvXD2OBQURnwEz//l84LXviUYZaoRKeEJDqYjEd14nnEKcM4o0ggQ4o4eyvuCwHwGYHGpcnd+788Y3PyZTriSBJU1/1itTUMN/C3uhOH8pgo2/ERdv7eGf6MB30GoUkB3dCPZHdL5ZkJoRc9+rTweQK8VQfywPDjT55a61oVEtORpj6CWcG7gWg/7zwrvSwTmrZvD2BwND2+1hLcYw/so76JozOIAoW3ZVI8BsMP1fM6P1O/LnqqRmcG+zjPUYvXg7RLjiuDOoWODMytbzJEjAQUVhbNoDFFiYKHDyWhVDLi/hJ4ar+RbC68+NbM3SDs0vcB8UvIbs1KXm1vN8hFOFSyklCfb4P1uEqYiiz82hkbP2sxaVVeZzJQX1FieB/uyNb7O06X4P+FPCgR6vVZB61/yJDa+ZJXOi3V6fHI+zc1wH1sRQKU9+vJ5IFscYihkFWkmZaxjJMyoLfwaZz7ApOxLwWLVIYWr8bzCjm2A0g5z6lL7gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(19092799006)(18002099003)(11063799006)(56012099006)(921020)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yRjfk64wPIRKxlSMGRDy447tJRTIdIp3XQQwsTBUqNvgjxnR/O021X8AKj1B?=
 =?us-ascii?Q?BCydeSyDlgAc5fgBDaCT4wBWX6Gs+l8mvhifsi96Jo+eraccrw318eqmmjOX?=
 =?us-ascii?Q?lKbLJd7spVsP0dcqRXgIRfMIMpvLnATwgA0pol1KY0EsGbbVslQdWXNahWfE?=
 =?us-ascii?Q?7WKJOQUCWLdH0YTal8He1Jp1/0+M7PXY3A40sXkpFveqKh7MTCm+dTRTycgm?=
 =?us-ascii?Q?BB/ygN2l0od5I+hV+FoVA6vr1mDb64r+On+3K1ZBApnxpT0r0er6CUW8cbbb?=
 =?us-ascii?Q?t8sg5FhTzKUPK+g93iAF5/hNd5WQ1pxOubVFrL7r1Y38Uh/Gj2aBSSswyarc?=
 =?us-ascii?Q?TCtFf0e82DzJc41POlFot+zeiWgpRRJj5z4eT8znpDVkLmXy3uD1sPm80Lkz?=
 =?us-ascii?Q?1Kuo4QUYGi9pbGfv9pXZ3nsWCgF2aXxJ4FKHfZvGT4QaQ+PDipVkZJPD42SB?=
 =?us-ascii?Q?yyAbHqaifyMo4V12eRkEkYdHRIWRHS109dNB2rth+thpzAnKONSwTY49mfyP?=
 =?us-ascii?Q?EbHSxqryQxAG4IF1vNuxUFfY5Fyb582pYUVrxEJ6ekQ9t40DQRBAvOfUhsp1?=
 =?us-ascii?Q?lgZFxnWwB6Fg7CReaHm5FAFDZRNAd+Qw0tv4mFIM2kFo0OqJtVeM/igoFKhn?=
 =?us-ascii?Q?tdH+M2cim+CtW6orEhaDtnOs18A1tvAmze+PNgKhrhIMfHiLYZX24dQXwgnm?=
 =?us-ascii?Q?79OgyeLvXYIpWph/0sJZrfKoOmb2WQLSvthLTFEIZqRhpK4UGqZkzl73dFh/?=
 =?us-ascii?Q?rTCb2ObcDd2r7AFkv7ilDBUUOWopPwkR4dKT9ZCKN7MXEbQ9FNcbAA7XOL2/?=
 =?us-ascii?Q?SvVjZFSNgx6tkOkZAOxVjhICIxortLouTBH0KyDG9Lr+KWDeF2xyFkTN/QIh?=
 =?us-ascii?Q?emCRJmK4DhlsIWamiTOX7NjW19xsgUASYEebSinM0vAyvyi4nLf6kvc2Wi6t?=
 =?us-ascii?Q?n8e6I8RWvVjofYeP0zTDhb4i65YiGdGiAJux0naEzimO7tYGXCmYMmTOFnex?=
 =?us-ascii?Q?MT32G/E/MM8JWj4W5AoD7cehCe+Oy4mXXiCTO7vLzpLJxYsVN5vVwSiNN5l2?=
 =?us-ascii?Q?gODgfpRKTT/Qb+TEVExhAUvgRAyPEyvO2TNoynXcroXABLM+hjL2QPAYp/JP?=
 =?us-ascii?Q?UY7iOer5w4kyknF13bYtxbxrgX8vrJOMGWeziyhUI0dm57I9mmqBlwFo0RTk?=
 =?us-ascii?Q?YrScmcAWPoQlbjrCteCNX6yCdmCfvKJCwhdnE90J9Y+19CV431L/CKPQzS10?=
 =?us-ascii?Q?EbUZoLG9syG7Udg/PVTHUMBb43wrfZHPD7WsinCql+Pk2Bl6OnMi7tTSqnny?=
 =?us-ascii?Q?R9yjS0x+YdBuhQ4OO6UqyaD1pLgcWHar38irbsOGr6XA46rw9l6ytetGijvv?=
 =?us-ascii?Q?AUaLmqz3Ld7I3dcyPeLVEwz2jwzcxTbVjxSyr+2E3N9er41CkvS/ssTG/co9?=
 =?us-ascii?Q?ffHybvldSI+nXiUwDDOvK8rhfn57FBM2SPnWV40NyzGTdNCRdIYbux2mmqIx?=
 =?us-ascii?Q?QW5sLn1/5zVs65p2T+IRunkjcCGO/6kF/Rl9PkQssPeyHs6KTZTYONQiqcbO?=
 =?us-ascii?Q?wZSUNoySoSpdwqEfqAzg/qHks+MujXz27aR5fkqHHDpuF9Z8y0Z+7fg5dDvJ?=
 =?us-ascii?Q?GxS+nWcdRQIFQeVMJ9VPn9Xl06Uzoo27ZOEOPIgNd7nipUBOAN7OmHxrnZEI?=
 =?us-ascii?Q?KdUT//bEUEkYLtnu7tI3tEba/mSn2uwC5vSFMm8q8Uqge8ZOW+EeusDgIZHM?=
 =?us-ascii?Q?WMsIRVPxmS3QU8WpZbub0OmzKN0oE+v2DWludZjKCbXEYf+ZhJlS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39e96e0-d7be-4f3c-981f-08ded3b12f5f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 18:31:49.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWJlDyrrjf9AeCf8KBXCiMQxTZP+F6j5o1ag5xHbjHRTCAEjSFlPa/BOgC72NdMZmEJiPllrKR3xt//Td8EN+XuoRQ5qUwjata6qWGQ3jDmasKUH/E2J2PiYq0ejWKPG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_113155_245686_419D60F1 
X-CRM114-Status: UNSURE (   7.99  )
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

From: Frank Li <Frank.Li@nxp.com>

The STMPE610 has long been supported by the STMPE I2C MFD driver, but its
compatible string was never documented.

Add the missing st,stmpe610 compatible string to fix below CHECK_DTBS
warnings:
  imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 4bb05d544901c..70afdf68a0546 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - st,stmpe601
+      - st,stmpe610
       - st,stmpe801
       - st,stmpe811
       - st,stmpe1600
-- 
2.43.0


