Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE99CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 03:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X0XUwA56prwfFwKLI4JZ7xS+ziNIpp0LCQipXNYHJIA=; b=gYxJYJua+ZauE8f+VhEuE4uzSo
	dAgDgDHcNOpl2M9sZDGBbUIwZblxVQuZG/GqLaCHZgIxgZ5YzaGH2oAFwzP9Dh7DuAipGYvVziN1+
	O30eVHgQzu5F5S/0larCZpLD5eYJKRTU3WtC38zmkFkvWmmiLOwXXOE0fy9BNHM1DC+njXtu/O9Xl
	5eGOcte3EzhbxcWQiCeAjE022TjypkjwPcD4QGcE3AkwOIgdIaQtu/s3ygfh9vpgqCjIk3a2Gn9kM
	I7dEn8bTahg0vORhXjCQf9uijVKmZYrXFK5TB+d5ju5pHsgpIcBxSMJOB3Sxob92HQgC8e1zgTh0x
	Fawm+r8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJ1d-00000004fsC-00fO;
	Mon, 10 Nov 2025 03:57:05 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJ1Z-00000004frT-1jSC;
	Mon, 10 Nov 2025 03:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mO8P41UP1uuu4bL9syPAy2wCDODgJinX7qga6eAOHKhysFuSAF36BX2kFHTmomS0i1EM0ARsJM7WXQit3eO/jhNXEv7z1CCxEwztmC32BN+T4gDMbyrZJxMFnSwBO6TLvejpQp2sSgjGvGMJrqXX6GMGKqoG4XlFVMLE7iuYCP8gz5zT9vCpH1T2MrZpUr+bcifrx5iq945OrWdTUHMpgagKYYG6txGT3tlnOS7bpG1dDpPnOJIB7ElMHz3jf3Bc4w5MoVKkG4lwxxsm85YwzX2d+oAAJlPb5czPw1y83SRtdsHMIlkVgGT70/+IP8ieJRz0dNuV85dsTv+IUrwKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0XUwA56prwfFwKLI4JZ7xS+ziNIpp0LCQipXNYHJIA=;
 b=vL+DArRa+fqHQdJOt+63kCEafgx5gqsJLjlq7k0Zgxe724Um1U0uNkep6kCo1pkGqSwmpg++0jGH6gBh95c/j72BylLqT9JldhP7TYKTYksN64UMlSOE1Nmk0DN+wi09YZKAxEsyTzYVBwMo3GWeig49ovw1Ob3JEsakvz8WNRs2WzXoSiG5CWdO5Y4nbzhJn6jLEO9eJIKtEPRwcPK6uztPxu2ypMCF5Dkb2iIB3M3d9uomAxTnf2eu6RTNr1u+Ys4KrQPvVBwCUgzEnn9U84z8zx2XJa22qdsnMCl9slLVJHGrcQsTfgFubwo6n4GFBuWjy1it43tiv5ZvfE1iKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0XUwA56prwfFwKLI4JZ7xS+ziNIpp0LCQipXNYHJIA=;
 b=VVH7OjAbCbWLSoJcXQZ5k5A+KFDWoyjI3gJZDraozemltHAFOAKPR33Cx339AvfRFjoXJw8NfahjQxQeOABJEyFd1zXn52i5zolBsGrlOZ73fmH3ElYGjs7XKtsfRs4DQrICkQfKZUi9ZlUhWiFmc129d0Bu8JA6xHPD9eL+bIM++FqBSS2FiwE+ocJBHcQsn4EI1k6cZey9ZE7skqMPr1H5FYvTY4VMrmk3/DNQBnxf9kbSSPjfc1Gj3jeAxrloiRnoeNcZznSb4u2TzlB5zJxMEyDMOIYZEYB4DCwN7XIXY1lNSWyMdDv1KrXn3CfbbU/K5BZSZqMHT3CZMTH4vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAWPR08MB10946.eurprd08.prod.outlook.com (2603:10a6:102:46d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 03:56:55 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 03:56:55 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v3 0/3] clk: en7523: reset-controller support for EN7523 SoC
Date: Mon, 10 Nov 2025 06:56:42 +0300
Message-ID: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAWPR08MB10946:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b471d1-f3d0-4e22-8ac7-08de200d2feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DE5isaudy8OCTFeJtqv27xNBPgLKc5DB7qA/o5Zz6oJ/nF7HxT5ZXLlgLwgO?=
 =?us-ascii?Q?C5OWET28UfWH6BxHCr3RCi/uiOkxyESr/1acpXUIo1rk4Hd2sUpKVlIRhFs4?=
 =?us-ascii?Q?Kn/EX6C7m2hIrhHpoghPZTKKnkhVozoEXKpZnMjhkjIA9hqvRK2N8SbJh8IA?=
 =?us-ascii?Q?RQts+5MIDRaVXh9sT9ywoGbmOXqWvWgUgeC2SooLwsHLPu9oYtvYJarooxqg?=
 =?us-ascii?Q?LZraBWf7RnAJICAHkngtGlouq/XCqGV2kX/o+ZzGBk8Kiqsox+g2HWm7t+Qa?=
 =?us-ascii?Q?RSR4YtLRYTLz6YWT6ibIRWe4ZsVwV/f/XjR0eFlcqjM1qmS61cP/LMJtMPWU?=
 =?us-ascii?Q?hAQvrSPdYa4J8gWZBrFjUb3oPotQnd9QfIn+/xWmnuuWbyW7eX1RZskTrx8j?=
 =?us-ascii?Q?WGzZYI685lUYLzID/3I7MoUpqcv1n1iXPdhmZK4/P9EdZZlolEgYUiRXNN+J?=
 =?us-ascii?Q?WeFG4hGgUlrTA4rqbNLnS3UMs34knaJEGK9/kcqvzkcxhv+RZESBLx1mMWTU?=
 =?us-ascii?Q?0oYrx09GdcaPsdH+O/5jY5V4rPLEv518hQPEIRyaJ1rO4UZxTlrvaPCXu/8A?=
 =?us-ascii?Q?B+JjQgG0Y6WIUx1NkWAb4g06ldmNQaIwgQfVRp0/DyZrTtUFXhuzyjTsd6wY?=
 =?us-ascii?Q?Fe82uwwx40KCT3v7waqkf8ivG54bcoX3SLy+1icGYb3yeX8V+1SrkfT1c44k?=
 =?us-ascii?Q?EDDMYqaQIFbttPgNR7tkp/H3m+rvQ+sA3/QlKuUm7iLYUCm6/I/Qdo36mc62?=
 =?us-ascii?Q?vBpY8VKmeMuGBP/17qmH3zQm1olq/sZC7nviiVGX3MgsVK6NdAX56ffKmleo?=
 =?us-ascii?Q?hyD89USVhCQBiYDboROkFjM+YVIPz6UeEELugDyUur7BEl80cswzznQWsumY?=
 =?us-ascii?Q?BX9gzhKpI/5qkjJpwxP1XQweH+xn6q63cYzDDj3szDmOkSrJhPYhF0hmzCBN?=
 =?us-ascii?Q?dfBm3vjkOmHiCZkVrs9p7FvhrnxcfA0Eg2OxjpDxWxe8Kx3Anq4crteHA6OB?=
 =?us-ascii?Q?EPLs9WLHE3N5Qymy3pzdd9YhiUvYPbzlB3YELXc2rqyRSlp3dG/XxnKxhFw5?=
 =?us-ascii?Q?ggzkQ8WOJ63pXqGxYnzaWME+Bl9ZbhafCBPBUUqaPKfXcNR3gEZASrjiV4Id?=
 =?us-ascii?Q?qZ3meUrgwYON0gYN6V4aAxBHdsqd1nkN3xGRMIFW/B9fI11HC52KX/86HbY7?=
 =?us-ascii?Q?l0QL9uDalxPVA0VMT3EWaqekNCD/5oYbdEghdgeFOa3rSDRX/nJvqUoY52HS?=
 =?us-ascii?Q?WRRD//5bAhCG22mhYD5vxUZK6qGrdmvzCYpgL3ITFizwsCjHj8domYyc/PGW?=
 =?us-ascii?Q?zmBlaFzOM2/yPPBVqSADqLE7GL7ly+Z3yxHYrJ0Pl61gWz7msfB6xvKcUHYj?=
 =?us-ascii?Q?KkaxVcCi6bAaCIhgPbzL4tEPXx1VcbuaB1w1pBWRBHaE2Af4qxRkR+96QCVP?=
 =?us-ascii?Q?CZolo2fABDvPKEHBQK3tzxC9fU191V5MyPBjwWRJcwa7tjaM7TyW8ONkdBuR?=
 =?us-ascii?Q?DS3m0BhQIcLTneSfpJ94glnkWegmOppGtqlm1dOMoI/PXMJx4NrEh7R+dQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H5pTEnk671wuvVbdXXRfzxUmkPmrJJR5U5lHc3rgLX/EE8QOP5g/DHVCh1ai?=
 =?us-ascii?Q?t80Wu4oBVB1+PeXJ3Lx7LsODHILAPNax5RY2hO63FWA9BLjN5ew1hR0wd/5L?=
 =?us-ascii?Q?Kxr13LReuYZv452Oad9P6C478LijvnA2VCCv8GedLgwbKije4FAgJ8l6SxnC?=
 =?us-ascii?Q?JhQBxwUJC42Kob2hgiJpgzHY+MgdZdsYLl5fX2dxMY4b6SDesX1vYad8aktv?=
 =?us-ascii?Q?Veo7FeIGIWW4gT1KNVJ1I/cYvsO7ab/jA3F15GEuJxN/1IXNb0qtpbt6dgo0?=
 =?us-ascii?Q?3v8AKAxuvw0kJ1dQZkaJVoX1gMjPKvyg5VEkcOapUtbAowtrwvEPcNFd01PX?=
 =?us-ascii?Q?R4gr3kuc9ENbYK2b1dfqSTtwWHRMqq9T/nUU72AJxJ1mR2UPzoVrPt+CEBoQ?=
 =?us-ascii?Q?jbkEVLReOAa6vqP8dF25BeZDlQQBs6Mc0qDHZ7b5ekf6/BUNbt0yV+KOyhvO?=
 =?us-ascii?Q?nhYEuw+/0Z69HFTycnF8m5ppOOVgpIyzrk4kt3yPryzO5P1qXLD/cp8wexLc?=
 =?us-ascii?Q?ZBHFhjvZt1AwwFpi447lDn8gKVu+IlVV4eYy3RxjPwzi70Gk0aLVJt1wL+pX?=
 =?us-ascii?Q?PKtIA5v+ffA/UY+sp9L1f8en5wBOLokDdKxT6dFU0Zpt4YZzntzeLxlhjI8L?=
 =?us-ascii?Q?nGqIV0+7HFNJMEq5r818EQHvD70e/FVJ1ePRiC+iaanCK1yIXR5mj68TShKK?=
 =?us-ascii?Q?SCif9xFx0Kkru5Cj+qE9aOAjmalJaLtcV3xbhCGIvwj7GZ5ZixrtdLQ0kyRh?=
 =?us-ascii?Q?07jj8pQeBOXPxfCbIDywtnCZOYmCyxZFFujExkThtyxyyoEmmTQk2qLOm7Ay?=
 =?us-ascii?Q?N9c031ecnJ31dAENkAusRNyuXG/wOVifYG4jlD6DJUeMLDDo94OCAhwK+2cB?=
 =?us-ascii?Q?5eEcy/D4elOoac6jsZRq+ZAhYkybYm17QEZiehM5k44OKNoXynTeRmjVr32/?=
 =?us-ascii?Q?yeZ4prhrEGOOFEN3tpHn4L42Y7r3Rj4Uh0iWPLRa3vamV2OsD7Kgtuo1j7gs?=
 =?us-ascii?Q?CkV7NViF/ucWyebS769Z15tUTyRzy4ZmbghMvbqZvJd8/dcP0ybAXtrxuhyi?=
 =?us-ascii?Q?q6OgJqIyyo53JrMjqCSkZPE+C8LLWM8TweDiuat+cnEmpp0mrA8MoPCH//nc?=
 =?us-ascii?Q?6Ljrs4oXN33qemsM3wk6i+EyWuZGuOlqjbleJAkNIb4RyXKRmxC3axOQgO+E?=
 =?us-ascii?Q?qkt9dy4m27bets+c7z8VcpPMCwfg8ePLu5AHcLr0NvTPxfZHAn3iqJu6/4Y8?=
 =?us-ascii?Q?7qctArkKudvea7xab7S0nDcnq83hlnmxv+gvRfsJJrQ5I1IfXNFZ+MiLoCKl?=
 =?us-ascii?Q?HcrYrIXn1vq3DSOsIoeJuf611k4kWK79Ufid/JSa+H7PLzjc4BdREES2DKNq?=
 =?us-ascii?Q?4avX6ZP8GVUH0KdXPYeeqI5uN8Klqxcvng3K/n+l1FAYsAPizV5TapqQqKPx?=
 =?us-ascii?Q?OLBQsifSUkWH5uDeRjQEdZCle2DRpSlRQk+b3/T+t3g9riUqCVtW5c9deM9z?=
 =?us-ascii?Q?NoeuB4wUMK68h/AbF8Sv/Ts0D2dWMVarYG9jBH7vsD+fj7jCD6aa29IF4PMQ?=
 =?us-ascii?Q?8+psiD82IqUPP+jl3+gdiGjFFiIH17KCCErPNzRQp2OWQjERThiu6F5FrNIE?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b471d1-f3d0-4e22-8ac7-08de200d2feb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 03:56:54.8397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrdOPjNTpC6RZj052zha4Q/a1Y8gRL/oVXc6xSWNVeUr60mMu0wnDNbQqMLOS+PdN+7wVX3I55Rj7PgwMG13q6/XdqSBljOB1T+88POYSZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_195702_520424_F8E37107 
X-CRM114-Status: UNSURE (   9.12  )
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

No any activity for a long time, so resend

These patches:
 * adds reset-controller support for EN7523 SoC
 * updates dt-bindings
 * updates en7523 dtsi

Reset-controller support will allow us more easily reusing of en7581 drivers
for en7523.

Changes v2:
 * keep '#reset-cells' property optional
 * put dtsi changes to a separate commit
 * add missed dtsi include

Changes v3:
 * keep en7581 prefix for common en7523/en7581 variables and functions

Mikhail Kshevetskiy (3):
  dt-bindings: clock: airoha: Add reset support to EN7523 clock binding
  clk: en7523: Add reset-controller support for EN7523 SoC
  ARM: dts: airoha: update EN7523 dtsi to support resets

 .../bindings/clock/airoha,en7523-scu.yaml     |  3 +-
 arch/arm/boot/dts/airoha/en7523.dtsi          |  2 +
 drivers/clk/clk-en7523.c                      | 64 +++++++++++++++++--
 .../dt-bindings/reset/airoha,en7523-reset.h   | 61 ++++++++++++++++++
 4 files changed, 123 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,en7523-reset.h

-- 
2.51.0


