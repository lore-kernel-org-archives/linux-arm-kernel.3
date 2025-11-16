Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E0CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=vWwXkFte9zrqNf+2Gw/I9XjisR
	6abt0Bovw4Z01Wey8qFXRa2qCITJ6mqiLVhWLu0ErPGyXBCAtldssKE4xZ6ooq+H4cKF9gLhBbjBA
	YkVVmpdSaa/Y4Cpj/cjwXe7gMqz1mz3dfDbNMquauJ7v8tRUx8vBcUkjwaldRkQm/bSl810EUIgDt
	CCbxi6znIkXKfCDF3uLpwE9mj0TK1DGDLwFOfL09K2iDFaWFk+6j8teNS70/0qVYU0W9TWrzMfkzn
	cnoH/l30ItsS9RfmiDZXP0u/xzYXsdw1PgpGUAb5xBALsiG4ZXjgJIkMJJNvKGYYtdJekRXmgOaqr
	Ii7JSkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbRG-0000000EbB2-3MU9;
	Sun, 16 Nov 2025 12:01:05 +0000
Received: from mail-westeuropeazon11021107.outbound.protection.outlook.com ([52.101.70.107] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbRE-0000000Eb4A-0QGW;
	Sun, 16 Nov 2025 12:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smb38EC6EdsnW3Qe97DJ8Cbo6d7u2p/ZYjVlhzITAQ0tMnJx48KKJVWD9ehn4DGpkY+p9D+ID0N908WKJx/0gY7sjQ+ejJX1Rw3zEpzwuZj5kGE64UXiSb89CCA7pu+durXLa+R481QSbimQ5f0USxu7PUEkNmuG4hJ16Rvm1dCxAkd3WHE4e7c+8I/DhXe1GlXww5bv1aorLd492ZHcsy4Pq0mVlG+K4FqPFl8HOdz6neioL8/vTN9WsRfQn10fzMW6P2iOh3DctyyPy5R4daAKxrng6S9zgXIM2lA0qw9HpMWfK0AexCAyzO58ZrbW6GuYeoVGoFtr0M86mjwwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=G8aiZ0KrM5p0sea6T2xT1Hnw4DL/hNlsiFN0/DzyBSgPNtavVUFS3M5y6PIh2R+jX6TvCmLxhwy2X659bS6/s+SHgvFiWyci0rbckpF8cWshpxFYGGwYcwC8gWcrHBELUz0A1xaLaz8P6hPmFcgyPNIY6q+mAWcwMP5cTW0o4hN1CyykkqUom/oFBS9MIH27UM3Yj3F7awO5T0ymnar91et698OxcKRCBrAkG0MywVre/IgpsrJAhfN2dKNDzkOg6IVXtmEFwgA4nQWEJsScavE24AutEosAhM2cQzTVK7y5vZMgvaZOW7Lv4MZNq6jgLRAob002wIb1pKsqvq3L8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=Det+5xLfEyh0dNE/hF+4/44Uwq4S6TsYoDTHa9gIzOsxkrW+g1QTPCy+T7wdLHOt6P40j2Tm8FX9FW42QuAPi9RA6kZteCkfikyymxcMoz97ailun9Vl/Qa1cpGtWakzWmO+dQD2JuO35qgRUe6r7YRSN4QHnZcSA0n/9A6ukE3KLqU68WNEhGuhXk+lkEfE/rjtfRXUcyQH1meAvMGa4KlrO3xIsD0B4ohKQIKM0ySIlOqVS9zHvg1xxWrrZ3up5xTsANCCiXXFFmooBlxui/CIn5OsDtlllvXT9+7rD+p1kPXa0vxeEz+KzXqDT6Q9kTNQIMR7QAnILSVWdrS4pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAWPR08MB11201.eurprd08.prod.outlook.com (2603:10a6:102:46c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Sun, 16 Nov
 2025 12:00:52 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9320.018; Sun, 16 Nov 2025
 12:00:52 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v2 3/3] arm: dts: airoha: en7523: add SNAND node
Date: Sun, 16 Nov 2025 15:00:38 +0300
Message-ID: <20251116120038.672178-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251116120038.672178-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251116120038.672178-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::31) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAWPR08MB11201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7189dc-abb9-4c4c-3c89-08de2507ca8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WN9G8SPrlitXjAhdqZXDW19wDQGY42YsXl2Qx3RXIa9aWUNPrdEEdp5+cLOW?=
 =?us-ascii?Q?PtlmBJU9ywXIqzrVpnzVUQ0AMSfnjdNNOpYXivW/hzAxGIMPPzjIhlIoEsSo?=
 =?us-ascii?Q?ytbwiZKyYJKoxNCmth6bxuFyuu/RLk7LY5NEaKT9cowgKm8tjMpE+IqxREe3?=
 =?us-ascii?Q?8MQZbxIaXBY57q72qg9pnWMLbawovcEvpExUXhIvj5pChLpdNb9WWue/Ew/c?=
 =?us-ascii?Q?Xlt0fcig+aFTRs9ONQHN3nl3CYG65UnNaDjnlYWRTQ3J/jxPdrGQvKvD/X6O?=
 =?us-ascii?Q?dm0nQFUFlY7P4j2xKA97M4exae4ijbb623mC1VLCQJ0dJqgTgofEFyXqWmbL?=
 =?us-ascii?Q?IjpMWC0Da38rQzi+Dsv3Il/ichKWw5N2KvO1TOWwxbqmqBhK2u0Sk4SMMlkk?=
 =?us-ascii?Q?xpUvXCKZmQXR91v+hY4uIeRDNOCeV441eEfpy4SLojwbaYy2GRRqZKjBkvlg?=
 =?us-ascii?Q?P8DfX6wpEmAvS/Pp4aZEnwNj34N5CYlET3BI3VhUcr8dSNeOPispWBiIJA9b?=
 =?us-ascii?Q?uyWi7O9C2pykEF8CIzz0KcXKjeYmoFA+4LmWt8Rzrgi5tyd20g4tO17KWYQ/?=
 =?us-ascii?Q?REL2YVU2lb9YgG2P//mcwmCtypTPFnXGjCngoOut9efjeJXvAYKfdkIuWdpI?=
 =?us-ascii?Q?/Ua0YWs2954q9+LR5r14vRRuf0aHWOprg1ZIP10Gt2FnoACGERonWbAHxpLO?=
 =?us-ascii?Q?rV/bC2z8pOScULAvOw3ff+gKu3FoT6ZQvSmaMlr2oqGBdDOs65GXO+e7lymZ?=
 =?us-ascii?Q?59IAo74KlcRT48mNgu/Be5hQu+fDt1rNoLgtQr9ruDmmQo+TjsDbJCxNf4Af?=
 =?us-ascii?Q?qm5vKndFLoOknM0RH1vFDygp1b+WU7zLZikpgpgEOw1/ycItUfHF2bfoi7fJ?=
 =?us-ascii?Q?R35Z3uQ8U4zYHV5eYCYIynLsG+kc8pnANYG/uaOd94GvzJBuzd/m7H+YRldw?=
 =?us-ascii?Q?anapyVC5F085IFcQwrKTHzkfheusakxVYsm324HwYRbANIi40XoEl1CrSEQy?=
 =?us-ascii?Q?qNk2vubR4011mTSb1MMx+kMWag8jJnAR2w9db/mSOVCl5uqsj97iddtmXyxp?=
 =?us-ascii?Q?2MLj9ODMu/K0gka7Eo6rTyw58liITxAwtwo6qVmpz/nB3/WehQoA16f0FQhV?=
 =?us-ascii?Q?O+LdyIspgTqDEyToFOf/ueWXJnh1Ku3vysfsAvZQ3Dwj3alieqFH0ptBIm8z?=
 =?us-ascii?Q?c+75ejpkfOB7PW+BlRNWq7Ia24CHTnE6tgoxeJpal4RaFCGZNHcFeepkWLD1?=
 =?us-ascii?Q?vFHfWM8PcdVpOjJ2ly7Ug767LBxuKOQZjqaWVMN9fiYfKocyKYEaBPWouvZ0?=
 =?us-ascii?Q?riN+Aka61hmiszxAx4sEDCqsJLB+sbtWS+P5aaDuMIjiq0Pd1A7UM+erBSse?=
 =?us-ascii?Q?cCr6J+GcUCcwOXy1vr8WnMm850igDEmE71QYt83AehqVhaoiRZUhdcryTkt0?=
 =?us-ascii?Q?eMLwhRMlTYARvb+Agc2LK9yRaC+yP6l3tFDSdyjo+R+LwlraPtYgPFH6wl1u?=
 =?us-ascii?Q?FDqO4yaTtbGNoID8XpuSF2Ubz5Wpnt+lGPhEx8NJ3PmS4Q+lkoAKySW2IQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdr5d+wwyIZS7trajFFQgv4NT1km0IgGt+YdA+zsIu/9XkGU+wh0P8QjHy0E?=
 =?us-ascii?Q?Ad62UL6uWofLgbf6xEAw1N9/cTpiZxWEuGbUEfd3HKpe0Mv3fgBe8ip0ORfp?=
 =?us-ascii?Q?d1GfVYcgmOxk1l+fSfRXUeap8JDQ7Y4hXxZSJ0oYXkuU3iV8qcLNJ1YVZMxT?=
 =?us-ascii?Q?+jgHo6h2UCZmtsk5dLlPs6pnKra9+zxz+EBqsCH1aPuS9kfvjjyBFEPC3j+q?=
 =?us-ascii?Q?k5dXDkDW5o4+pplU2kRAfpOt0cCIKo3DmFBpgyFROa6YG7u5fBZ9yjzaHzZq?=
 =?us-ascii?Q?K6peLJ4myT4f9JMN3vgfe36W3uYg3k9uoV5no27pzPhBhdvR7zE1F6TrAtsu?=
 =?us-ascii?Q?7V3Z3X+la2EE1drgPO0czz7bBDGmWvJgB4tfV3YmLN9b/N1RamSTnsbgHLFw?=
 =?us-ascii?Q?QvWrsipnsadP9a5v3j9VccgiiZEKmkDM2XPjdYhycJMB3ja2nfk09juJde/J?=
 =?us-ascii?Q?1/ChkoTyecFxUkg6Wu7nvzaXggsz1TFUXtznxncHhNPHdmhKzrdG+41l+ou5?=
 =?us-ascii?Q?GldZ85FXQkLOLJYPelW9Js3KeUsFMCBtV3fr4VuDaq3MSB8BgKJxYCpdbYvC?=
 =?us-ascii?Q?TZoAdMyoilAftiWZLGL1K+ZsE29jmy+n7LUklE6jrfVI22HAkcrqIb2D3D85?=
 =?us-ascii?Q?SOplEiDQnBtBpZUGiyFJ9SM+HRSJ7v9ZYq11kHOXgnCQ4UGRl1XbcyYBYv2I?=
 =?us-ascii?Q?rRHS0eT8ZqST6LoXJ66Bns/7EhYgZEQBHwCUUJyllJkHrIxa/nD8x7WQnG+A?=
 =?us-ascii?Q?Z4qKC40a/uerzfh3u/EiI9/hbEnLGFldk1YcJyst3qnNd5Ru3ty1SpeQ1ckF?=
 =?us-ascii?Q?ChhUMkOx6lDRijUu6Ummc5yAityP0YDVxw+sYJaANh+fjF53EZnBLSy9ZLZD?=
 =?us-ascii?Q?Sb/+cr/xSeEmvKtfAHCfkzuvqXTSD/RFjIortCpUtw8HulnTshLcbapT4qTr?=
 =?us-ascii?Q?feLQeUhW8YVUJsXudvFFLvMAiC0nPPdi1hHQaj8dvtSFSQ2e7VaAhYY/y33K?=
 =?us-ascii?Q?VXvM8fes29TY/5prroK56zGWy7BOY6UHfIkhx4hUltmA49kfcURxeQtx5EuT?=
 =?us-ascii?Q?848JQbbABoXdh57htv5wEOaYgbmBD9TJlkZMgpXGaidR8rSSA26tH/OP/k8E?=
 =?us-ascii?Q?Iml6ETg7hOUXz6FEwB7t04+1sFKGIj3re45OFkehNQb8ArZkC3K9KNMA5vYM?=
 =?us-ascii?Q?d5e+nni+sb6Qb5NAPPRA0s7CXP1zE/vz3ZVfty9iUcUhKyAcgN9FE0/QQGmS?=
 =?us-ascii?Q?nDx6Cn5Z/3NjIMHhbQudxGrRx2D30Gjq7xJHkPIY8Hp1eW2ftvXYuqfq+3a2?=
 =?us-ascii?Q?NiH+LMrYBfMZfTJATLmkrcC0cQaMTEDf3ojvRb+ub62WA5CwdcCVbZZc21Xh?=
 =?us-ascii?Q?urKncbMoaLg9SYtKeoqieLoh0lRQwFHru+PzpqExbeVqyrGlxKISmoKxA3jY?=
 =?us-ascii?Q?LlCJkaO/SXqDZ2ObkXZpAMn06zu4J6rXFL1wb6TQGUlfFyjyGzqYOyEAEniG?=
 =?us-ascii?Q?T6j8fxmyYl+9G5c1q4+RLpyTxrjAlJQxtt4ABR9m/MfGV/z5n571p+LK0HMP?=
 =?us-ascii?Q?meyNIDGTlkZz9Lxdl7ALtHjaCVs+hYiwGkYVSl58OR1y+90v5FeEtVEWmogZ?=
 =?us-ascii?Q?asIrsydoH6HnKBXZ6BqAD1c=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7189dc-abb9-4c4c-3c89-08de2507ca8c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2025 12:00:52.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzTRrXWm1hxwNoruQfWnbfIleuL6savYGOUi+hIe2PW40QWkSImi0GKSiribDcf59jQn4iAhpcLVlYj9rUJhdFDpZj8Db0bA050P55Z2EUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_040100_138104_060B2DC8 
X-CRM114-Status: UNSURE (   8.80  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0


