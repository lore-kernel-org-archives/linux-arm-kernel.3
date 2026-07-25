Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05668C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3lkRqlcMCl08pqlr+6aVriT15XwFGt3vlX3oAKf1iQ=; b=MlTtLl5EtyEN3sLOdCX6ThAaJi
	H6/tldWcLveu3rxTwL72Jr8eE4gBkNNVwNVyAMBzWt3jvA1ot0aJuKac0WX5RwetGBHBRk0yRlf9a
	QpeRiTqHCjbwKNqx5RVzXOaX4gxjUpYDzhWZ9JpGoL0LOYtKSt+8LCt9vc+oGuPnREZMXXRIrjUUZ
	z+rogTEZHlUiaG5+cWb8Kfxz8b76K7D83jDQdo7T5ELZePjz8O0Yw08EgmSgqSrAMn7sXEcvfXABR
	y1uE3lsKpKUQt07KXTxkcV87l24IYtCVoawoHcFjxfomBeYkzwRG8aViVwJCl9hHH9XvxKbmB4oIj
	izHpMBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffm-00000000YVI-2G39;
	Sat, 25 Jul 2026 16:56:26 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffk-00000000YUc-31VJ;
	Sat, 25 Jul 2026 16:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDN18IBcgKhwN+xFzxDMQD844cvMgnBDCkECXYNNYKmr2pLlnpsH/lm6vd60xHq+WqptKSsJna03pP8A0OGaiq4AJ9FUQVJt3JLMy4BX/DA1XeciDBEd9aYY9hBSpmHsxLb6pIzhKt+SffZbrh7f5Cq95utOBlm9QBmmsTBCEhfy0UAs0RRlBuPDbvImzu1mVAfU2jdWpOF9/+gd8gKtvLesGAikieaJBfRHJay8aQreiSBIucTehlbVZyG3fsPvPOIYDBRVYHYJVX3HybVFxtc1Z7crxxply0IJ2tt/DINFqd4eDcy/YNKTRlH4Y4mhUtkPgpXBkxtodPkD0a/l2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3lkRqlcMCl08pqlr+6aVriT15XwFGt3vlX3oAKf1iQ=;
 b=IIM9+EhzHJcnz1r4WCjA1K5+5b5l8gE27UdAnN/KVzfZTPaeecTTlmaTHNNlh5o+QVoD/hJS/XzBGsBY/Rr/XrttSiw+WzepKJfdzzuZ8gPsS7lgQKgXW/OfUL8Jks+AGUb7C2Whq73vfItPQQsXeOK4LH/hdvejRpJJFtzrz7Er0mUOAvGfZDaacpxRXRko+oP7QmoNiC0PTvCtF9BFvG2XjeaWBlWn8tSGKoWgrwwatNVL+yJ4fe/tHt5TDB81VZh6kpeEN3CWqPorSWkfLtFaVkzt7kkZwXOpprCECy4w2EQd78pQD5lnTBtzzEFvoLvenU45oLVxnCSLsBRa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3lkRqlcMCl08pqlr+6aVriT15XwFGt3vlX3oAKf1iQ=;
 b=l+tOtxlMMAmv0YDnzMMMPkjxgOi0kOnf2W+H+uQesSRAOTb30yT2CguNhuHt5CBe8fNp3s10G27FER7qglq9prGfoxp8vzxITnnHQxI9hGVciCpDDL+kBD5Z9FjFDHatsiZkNzl9U3PVl9ejA/R68/P4CHkRuCbIi4jMek/AJNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10789.eurprd08.prod.outlook.com
 (2603:10a6:150:163::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 16:56:18 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 16:56:18 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Sat, 25 Jul 2026 18:56:04 +0200
Subject: [PATCH v4 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260725-feature-mipi-csi-dphy-4k60-v4-2-5b2c4626d31e@wolfvision.net>
References: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
In-Reply-To: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784998575; l=1343;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=gsb3kIgLVfw8TVHsx90GcFRFRQa70jJK6PQfa4pNJDg=;
 b=S4U+1+Odj/D3fcnYAmG/fEmiE7Uz1bP9Sh4oYSARzUARKrLOMXffuUgeJKKnaPkMpJBklVcLh
 PDmS2PXBBkjBCA4t9UmWRACXoBb2PJcycwYMJ29/KVkU/RNS5cSVn82
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV1PR08MB10789:EE_
X-MS-Office365-Filtering-Correlation-Id: 84dc2f61-6de6-48ee-6280-08deea6da55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|23010399003|38350700014|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RKmktbJniQpSA5vZinqKghxsGnspsUKFdDWEMc3rV6j2SenrMdpVZ6gSoyNxfD7URvbTkqmYSL0GJV6iPshAbEgptamY8tmiaJkt0sDxLQ/m1jO3wlgX44qnqNjYIi38nsrffEqWrTvis6FJ9iuso6UtyRVO1isCUWihFBHZijcgKjyaE94z0GiBtG4VXpbwXMkm3qrl1sESUQ82KzjcIOp9CPUheYlWt5X0q81uFrgQ7hHy3SSHCz8Ja+ihEgTGiYh20p0/SzpiXaBSH/Mi/E2duv6iTRlbMeCpHSK2AIWumFRa3m2Z4L/ahgnhrNbYFnlfDwKH6KcM2eRzUAQQcVOtcfG2M90VV0y+xW4+i0hqUERguikkJTKfDtfpx4K3CKPAUwG7APiPeDa96G+izZAmHMHv2fGY6VTy/CgU4KxFCsIEFhalkFoN1Mf23Dka3hJv4AccQgKXg3xTHxpgIEqKzAfGlF/7dQKMxgfipkhatJ4DLpH4WVNtrVO18brJk0kl6/b2RdJ6dM+X0ssDl0HQJ5P8Wp698eh4z/WJIvnvg2S1NGtm8/whN4f7v8ICJxq3vF+UMrangase2TrbKlirp6M9DUqOWFFtuKy1nUnNNSsp1ydNH6S6yiwzdswV3HJq3SY8EvItloUaCK8C6GziokjeZ4PEHfyVE6/dR2iAsxwZd6ARPrzjvnisbZOQx10tc/srkAKh6XYT+mb4tWg0LuvgDSfkGRyqV/mDgeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUNpejhYMGNmVjN0T24rQ3RMQ0F5OTlYdGo2UkFKK1N0UU5LUVRlL1BGbW1P?=
 =?utf-8?B?d08zMXUxRkRnN2Q5amlneEdYcElVbWcxL3g2K3I0ZzQyT3VZbTc2eDlQeS8w?=
 =?utf-8?B?azBRZGlCL2ZPNkd5b0FWNWZ5bDU0MWhFSER2Q1o5ZnR1RVlTYTNZOVJrUktG?=
 =?utf-8?B?ZnNNQitzVWlSUFVHOUtEckVwUVFqN05SenlHQ25GOVRoZDI1SE1QSTRTbEo4?=
 =?utf-8?B?TGZyYVk1b2diaGdQMjZVZmIwY2EyQjNTTVZLdnF2VzhwNHJzVDcrKzdGVWow?=
 =?utf-8?B?bnF4T2RLUlkwcDNmV3o1OTVCYjYwUXl1TGdHczJMcUFzaFVIOUM0R3RHeEN3?=
 =?utf-8?B?QmllTk1pTC9tc05IcFdtVWZlUFZmclI5YnE0amRmekI5UnZ1d1lrbDdzQzZB?=
 =?utf-8?B?cEdESW1rVUREbXdzbVBDOXVVMG1VZWl5MFJmRnRsUXRBS05qMkRobHlYY2VE?=
 =?utf-8?B?aGROYlVURkdDY0dCY2drbThFZW82V1VPRmtxNitpQnhwZlpkMi9pL2FOWVRO?=
 =?utf-8?B?RE1RZDVNODl4ZEJNbEx5WHZubk5aZnFFRUMzYWxQQWxWbFA5QVB0RXl5QWFy?=
 =?utf-8?B?SmF3c2xvMkN5UUtIdnlIWVA2U2g5Y2V0eSszRDlVTi92aEQvTmQ2eWMrYnNm?=
 =?utf-8?B?d3BZeVppU1Y2akt6ZXFTT0JKdjFxWWdlS0pyTnlIOEpoQUlrMEZKQ3o4Um1k?=
 =?utf-8?B?SXhEa0F3YVZQVFFTMTBVc2hhd2RLK01oRm9mcFRGd1Vwd2hpaEkzc0dOVnk0?=
 =?utf-8?B?SmlYSUhpWENVeHZJeEVyR3NZMU13UWh2cDFTNTZMcEx4eUpvSHFiUitIN2NJ?=
 =?utf-8?B?YXRCcUpCWTd3Ylc0WDVNSndVbWJiWkRsejVIak9vbXUvZStxVTFxNVN6MjFp?=
 =?utf-8?B?T2YvU0x1MktIR2RLWE5ta1NEZW03MjZlVFJkVERNR0ZEakVvOEIyS3o0WktC?=
 =?utf-8?B?dDI5RXJsQ2JQZGZiTFd5UVkwb21RT3M0K1NFb2orOTBSY0hSNThUVUhJMmF5?=
 =?utf-8?B?TXcvYVFOOXVKNXVLMERpNXBBK09ldm0xSWkvRm54SUF1RXp0SzZDRFpRMzd2?=
 =?utf-8?B?TlB2eUFncXpJKzBST3hlNTYvTkNDN1pGbmZ3dmNaVVZkenFPQ2J4bml6ZUt6?=
 =?utf-8?B?MmZ1NmM5WVBJZmF0S0VYeGpoQ3VZVHAxaEtDYmRWUnQwZmRNT1dDYmVtSi9k?=
 =?utf-8?B?NWpDdDErTFNhZnRwaCtsdjBxUWZvWEV0OWZLVjhNZ1RXQTRBc3J0NDF5NkdN?=
 =?utf-8?B?b2dDNjJ4UnE3Q3NaRU1LU3ZWYnZDbzhMV1dCeXF1SFJuR0tRSXl3UTNiend3?=
 =?utf-8?B?ZjJJcDBXV0dsUXl4RTFZeHhUU2FjbGJoRFR2Sk5hdVRieE8vYjYrR3dtTFNu?=
 =?utf-8?B?SmVrYlU4c2YwSXhjbVhWeTNHSWdRVjlyT2lCYy8vVzBHdjg4MERyY3RqVEkr?=
 =?utf-8?B?OThaaks0MUx0cGR1MTcwdzNlcVMxNisrdStDSWQ0dXVDY1FRUXZlS09Fd1I2?=
 =?utf-8?B?ZVlQZnd4eHMvNE5VSHdFanVRbEVkRzFuelFKNHk4Y0pTVFUxbHJXYlE1SUFq?=
 =?utf-8?B?RTE3b1hDYlFFdTRqVXRNaWFlMnVDanFlYmY4UnF5S3Nlb0hFblV4Rk5SZTRL?=
 =?utf-8?B?L0xMTFpEQjRNUmQ0SzJyM1UweGVQQU83T0ZxYy9FaXFkVHdWMjViQ2diUmd0?=
 =?utf-8?B?ajhBRHRGdWJRTWFWRDJzRk9aY0E2TGFEVm93N005TWRhMVUwemZBTDBaLzlw?=
 =?utf-8?B?bG5RNmZ1aDVwMjNQbU5WL2Z6M0lzc1RKZEVmeW1tT1ZqYzlxWjU4SGhvTUJk?=
 =?utf-8?B?azdtZWh4RjRUSWJDZXYxUEczekltbzhvWmxtZnRvSmtaU2pmV0Y5N21NL0xG?=
 =?utf-8?B?WWJyT201SFFNbHA4ajZuN2FaR3dFcFRUR1FPODhDdzZ2N0xiQmRKaGlNaUN5?=
 =?utf-8?B?eDBmUW8vczREdExVdThXK09sUnl2dDFSdHp2bW8rTGdqTEpZWkVMRlNodlQv?=
 =?utf-8?B?aXQ5aTZkd1BsNnZqaGFLR05iWnlHWVk0VStlcTNsc3VKN09RQWNzcllJVDc5?=
 =?utf-8?B?Qzc0LzRjdmkvWENWMS9LRi9rbFBLYzJuQW00aFZ4eEVwTFlaZk4xcmtIeFV5?=
 =?utf-8?B?dmpIdW15Rmx6ZzVBNTdYb1R1S0VzVUF6SzNVdXFmTjBNSmJJSXBuckhXemhS?=
 =?utf-8?B?ck0vV0IvRmhEYk1Sck03SmtFN1ArSU14VFRIYzJLR01HbUlEcjZES3RhYVRt?=
 =?utf-8?B?MVFZYjZydDdDbVBLclZQc3lrMXZtUTBOQ1l1bEY0UldQY3p2SkFLNE5ISzky?=
 =?utf-8?B?dE90U3BHM2FQMlczc2ZoK3pmVUZ2TDdzejgwVzVhVFdRUWs5M0FRY0JYQzJa?=
 =?utf-8?Q?pIgue0lfGRYNgx0c=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dc2f61-6de6-48ee-6280-08deea6da55f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 16:56:18.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZRJmrdS6VhLLyS13SqNMIi5XeXvASexsGtLOE73QnzWNpZz0w1RNa7s/8eDG52+qEH7aQOK7CWO6hZ6PNLx6HgT8SxX9LKggz6/74r+sgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_095624_780229_88C23FB6 
X-CRM114-Status: UNSURE (   7.54  )
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

Add support for the optional rockchip,clk-lane-phase device tree property
to allow board-specific tuning of the clock lane sampling phase for
improved signal integrity across supported data rates.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 03950b3cad08c..913aa688c0ae9 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -56,6 +56,16 @@ properties:
     description:
       Some additional phy settings are access through GRF regs.
 
+  rockchip,clk-lane-phase:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    default: 3
+    description:
+      Clock lane sampling phase selection (hardware tap index 0–7). Each step
+      corresponds to an approximately 40 ps delay as described in the hardware
+      specification.
+
 required:
   - compatible
   - reg

-- 
2.34.1


