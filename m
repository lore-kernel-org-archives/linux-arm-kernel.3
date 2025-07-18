Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FC0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BostBz4+mvCg04JtX6TfTodv0lKsiQad0GAT8aPZaIU=; b=fXOESYv2t7aURags0x3UTjkcdX
	SRDMXRkZuvPr3FXGLU5Ooz6McNQTe9Z0J2YT1S/caryNQOhnzwTl/7RkwjmkrjbyR3EE4M6GNQOPL
	q6m2S5HpeF++BFPRhLqGz8/ESOSRwbzV30XV5/+mH3YYbFasB667bmqVWwXxbzdL9KX92fk86dQiu
	NkFHkfK8ktgVMhpUgnYqJllgT/Tq7QvNisxVjIOtB5RfE4IGKkoqX3/hlTU8ADNzu/5vcwEwY0GGK
	aPPWuj3MFlT4y7KjLAYyUBye60G2NrTxYOL7EZbxMyWJmhIBMuo2cOKk33xi74LaoXP/Eirdv3AaR
	IamMPf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaTq-0000000BVrC-2X5d;
	Fri, 18 Jul 2025 02:05:46 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaGb-0000000BUAj-36sZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 01:52:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcFZTuZTddxdwaOY58s0Fnp7o5N2wHja7KP3ZVb+yIzsnTb77jHYqqqRMdP6020L1hO99ryZH9y1gWBY2LX0jgF4vynepW+otuRJafV6dNGtnkabzIyOmE5e6PZqOxw/MA6hOKeNZgGkyM8pEltRdpPpjD5hBW43ozp+vD3ffh1F5lSRzNHkVMVthEZaJnVAmfHoGJ7NKs8ks1AJBD8zUdoAtehz4XHyCGeSuQiWP0w0jPQ0hH7e3tVLKerBGVIvRPNLZ6NgsPDO+wkjRQj1dFcpR+9Gi5kog+GgI+bvS/XNrEN4nTxF/Jd/8f4dSjrq8g+yaFAb0892iAHWFLy7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BostBz4+mvCg04JtX6TfTodv0lKsiQad0GAT8aPZaIU=;
 b=ECOvUeVhHLlCzEL1ttcZ4eEfQn8bk9Rr4XxiX+rxzp5yblzqp9L/VJxxWFfguQFUMsGzkeb9MT8NfxKnLYZ3bgvBU5afEe9MWHSfFTJS5UDPQb/LUEOxWtwqZQNtnPJeV++VC3ZNBFxkwpNpGFoB4Mpj8W3nn8Xxa458G48iaR2wV4JJ4dUnZOmY+l1lmxDcTrrfEt6KjptdNyBQ0yMupK2tXwiS+KE//QVD/u7t+czpVRcHfEWM6FK+l9WcsNApgyRd+rgYdsZqG+YYYMi7KvhGnqvDKvkVrCVVKE9ZUotChRD/m799Sf5nqX17jNrB7rDQ6QXerOv0hdmaCmWr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BostBz4+mvCg04JtX6TfTodv0lKsiQad0GAT8aPZaIU=;
 b=C+53kIRtrIxrZQytO0cySQlXnI7wbHwk5i59nYTWiHOXANyaSlzQ/AibS521Nsfzv9is7P/GgGJnWcDuX1DVi8bkL4rv31I+eGm8p7ZCYNou5LaeypDfaUIc/8meqICWqi+B3TnmVOVBt2KEDPcueSDBJydatOZ4Cs1ut9+JN5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12514.jpnprd01.prod.outlook.com
 (2603:1096:405:1aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 01:52:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 01:52:01 +0000
Message-ID: <87ikjq5kqm.wl-kuninori.morimoto.gx@renesas.com>
To: rmk+kernel@armlinux.org.uk, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [resend][PATCH v2] arm: omap2: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Jul 2025 01:52:01 +0000
X-ClientProxiedBy: TYCP286CA0237.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12514:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd21430-5cbe-41b7-0a25-08ddc59db06b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ADv9D8xNjH/DaRioewB0mPiNd750n3uvAbPoSbg4l9/HQxS+vj9VW9PnuZ4J?=
 =?us-ascii?Q?Tzv+8GAHUy0DX1Mhdj4ugs8ReY8X2KZptri4w3Cro/VYLMCIhXmWNvUxyCw8?=
 =?us-ascii?Q?GY1xENz1Ai9ee4zCc06vX2oQJr11DTxxq5kLZ1glkTufIFUyrLFcD7qTlA0o?=
 =?us-ascii?Q?Tp7ohjLxSg29HQqappm+4e/JFszi6iEOvnSlJqdenGEDDMnr3J9t3+W3Zt7O?=
 =?us-ascii?Q?8BVpyZ4BS1/UamLpCK3FX6etWrsqbPZacJ1/HnQXzVQ0lFhr12Jk2H/ncdc+?=
 =?us-ascii?Q?N3tZD6HColTaekS/hPoEBLfJmyHrMZcVuaOwg9inxRzmqr0ED3P4+ySpHkuu?=
 =?us-ascii?Q?4BhyhBAm7MGSl2OsxuUZddUoiw2AxiDuA+TjX5/KJJbw2s/23i2v+QeKBxvi?=
 =?us-ascii?Q?JJ2FG8IZuPFoesjqRRQBeKlsvbXwhOdJiyX7o8mDaYHVPSDpvh879aJnMhaS?=
 =?us-ascii?Q?SfFY2MxrT6p9g47X/syQ+dQPhmJkzJj56BGX34t77hvv+3HB6c0qt57euH6I?=
 =?us-ascii?Q?zalTZakPrJ/m/T2uS3He3XhJYHMUIlXqOuKaaqMS0ceB7rx2e/Uv3mU7Qyln?=
 =?us-ascii?Q?BGUZOiOSMVuJd3V/sm37KWQKISUBgcssCj2g5MseponeR89PohWWD9PRJ6UR?=
 =?us-ascii?Q?E7T4ZdedkFp2XviBXPMnTV/GhNG0g4Q9C76jRErYP0aqw0tcjGU0kGFt6Bp0?=
 =?us-ascii?Q?d6+FwIhVyvWNW3Ucn6FlmhqgSxFkhck1XqsuAuKzoMH3MzaoNlCjZnEh9362?=
 =?us-ascii?Q?HThn4AYitZBtkmfZ+tVL/IRBo4xvSgJb/5oRDaGfZnL0eRRZpAEzyJAmkJom?=
 =?us-ascii?Q?k+zm67PAwSS659W8NcUgiMCVAE8lLjXvFa3ocFQjVAvttcOPJSTJo1r3j7/a?=
 =?us-ascii?Q?Bniwq4xVqEHVFAt0fhFOi2OpeqgS0SyuBRiGvkOZWUeZ0doJCODQXt9oy7Vj?=
 =?us-ascii?Q?+nzJU2Hmr8pvDRYZQgnEELKD3LVGFjPcIAeYru8g/siRxPPOuA5i798b44HT?=
 =?us-ascii?Q?GTmeheS5KRR0Mm12NWtjOdOh8249oSHCWql9tLWKrDRrjp4eGEC7unVDo7hL?=
 =?us-ascii?Q?MT06IkJ6xL1RW/R9lOJx0Jklsa48FCgydgRTe4BNtxBeAnOlrMN1+cTq1QJ6?=
 =?us-ascii?Q?P+st0chzEOJbRmy/E7TrAWp1KvitJWhBmLqaheqqWNNktMai0bk+EjsNKEFF?=
 =?us-ascii?Q?VTTEbZjjmxu8IZQhUmamFi2yOPglgStDrMnvKqsV39Ap5x59F0pFCH/aPrjD?=
 =?us-ascii?Q?TaC21PPDYJ2WZBAbEYHSyU7lmx53y6w5dAgGgX+tiolhod9oG/3ixof7XjxH?=
 =?us-ascii?Q?2WZnMuUZK1tqM4PsjAZNp1/qR5IrSTsni2/wAKUGxDP+3oQcfMdrOttl84/U?=
 =?us-ascii?Q?wW3JXpzCOh3mxFN6168fgjN8w+bUUTKrWsz/o4NsE96t8sH4BTgK5ZzwfHuu?=
 =?us-ascii?Q?OuJN3zH6XqS57Xlb7gjANzkcRDEeOzK0Q/zJOmUBXvrJWTDxJ8AQog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vIQMr5QilBweZnRpCBMolFP+TUFsLEjVRgQ4him5lKwD8j+YMWw9NO3hncnS?=
 =?us-ascii?Q?GX5t51mOn3CShqQqsMeDJqmDSbjLc8SZjLTliO4YNWMBbQHo1J3T7RaZTb+x?=
 =?us-ascii?Q?QUbE5yNAXFE7Jo6T7K1bURf5sit9A0EseDjJ4CsOZUO+eXDm01DMUnr0yKGJ?=
 =?us-ascii?Q?g85J4p8oDO3joc9F/Y0C4RuwcKYxP/ROSs7owbEqbpsoKAMHuSWMyKhi4t+Z?=
 =?us-ascii?Q?UxD+sgSpM753DpyW/sx7Ze7+JHVYG2gHn+sP9/TqHT7+SdCpT5GxsrGjUaQ8?=
 =?us-ascii?Q?ci/UdTDsk/OylAcer0RiBBI89J4TLtDzbjGAEMiB9TXD3wrbfdjyWpKpmtK/?=
 =?us-ascii?Q?ntqlQD3jVIagxiSuFgplXCVUzRAEw4EdF06Sx+SeWa/isMpwslGqKskmBLDf?=
 =?us-ascii?Q?pyrk69ZcVPpfW0OQkFGeRxDNboVJJQ+AngMBAqHuDS4wHWT8DEcfne8EYFqB?=
 =?us-ascii?Q?9SFf3Yb+wYnpzr+w8hg9y3JmGw2y4SS6OOvd2NMr1pZ9SlpobOedw+uLmbeg?=
 =?us-ascii?Q?5yKLxWncuBjSehqSABlpcZ0fC7P3SjR2tm1r7+09ZSUpcvBEyGvq5w4CYt/s?=
 =?us-ascii?Q?cytaqTOM4pXt9B6/o27euISg1VE+cEUIE+GXyD5KzDVX057SWBp4LWO76/B5?=
 =?us-ascii?Q?VXFdH1jdYgAYnhMH1LOiNgNkFHOXWGPRu83+aHsAW93y+e30oSawh0SQwPTz?=
 =?us-ascii?Q?MfATkLTgRKno9U3yJnQ9akhNTGmw7qyaRSja8k8u5NAhr4IFs944zuL30qoO?=
 =?us-ascii?Q?ScjeB2TWQB3I0o89/ogVSuCvbwYDis5zNTf6sl+Y5hFAYtQEtoyhPDuiwZyT?=
 =?us-ascii?Q?aL3bOmn4tJfALD1VoP+B5RJbsYZg8tG6B+iV830JCdXA3GKXMoinfWZpRpDy?=
 =?us-ascii?Q?sUeAh791JWPUUBl5eIP6sl+DEfPyuyNqfyNAzrN2n6rMPQdusFrxPGXIQcD8?=
 =?us-ascii?Q?yegWO6Ic16bLJxaIZ6BNRJDTXcrB+8RJdLbnU3ivk43RdyMimn8kZONFPqLy?=
 =?us-ascii?Q?V8L7XtK+dy4LHWN14ZtOOgPN/pBzR2xcEzsR4dmbjWAXbw1dnKbl4+zupGaD?=
 =?us-ascii?Q?AzNiFeM5MHUQgRYjolCk+QvDOSKOB/JWCCZfgV7qYLDxDLGYFASXyxb/VUuD?=
 =?us-ascii?Q?dPB4C2EJakzKg76u+MffulBKNHgiirBJO6zc62uvw4mPZIPUmPSnCBrD/wok?=
 =?us-ascii?Q?BQaiav6CmbZ9ixg8nrMANyPPGzN85QW7LBYxjVjWQ6aZg69w7+itTqiuZb8D?=
 =?us-ascii?Q?t/t2etmE7VC6OIEx85UQzj1ulDGTuexRlAUx8tJJ54thmXlzAsKq9syGySxl?=
 =?us-ascii?Q?DAMXRXtSKhIQePsFyz6RRcYRsYyvVGag8BTPnNQsszTF/tR3NR8zmoEXRrvK?=
 =?us-ascii?Q?j6XDAl6JMj6G3KptxZT+VfrcizspUvEpv/PgQDLTQ1O6qrQsyAr6XqBH6l3L?=
 =?us-ascii?Q?IMMf8jgReGrwL4nN273SyXeQeE8vzf9XHVQE9zdBy+QzAetPUE66zI9Chbpr?=
 =?us-ascii?Q?crvuyh2+qHRSgvLJCvHjT63U5sgceppAga2v7DqKvIXHZsPYuXZOvz3k+Hvj?=
 =?us-ascii?Q?WaaMkeJ1N3ZfLNVKpiJMeZeU7Thdf8+g78CdKnE0fAU6zTMOY54RuMRUHEY6?=
 =?us-ascii?Q?XQv2vu3TlEmNzCrsT/Pvbh8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd21430-5cbe-41b7-0a25-08ddc59db06b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 01:52:01.8384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkHhVxS17wep0i/OWEzm9eS69MmCyMFku4H8mICe0JRFolzyIpohz+wN8joeUrMtwXKMa73keJFRSTNcNz7wmvfCg+3BBsQ7ha8RGqIy+zgILluaInjmos6YLkve2plt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_185205_781599_5A086952 
X-CRM114-Status: UNSURE (   9.25  )
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

We can use string choices helper, let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 arch/arm/mach-omap2/board-n8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index ff2a4a4d8220..969265d5d5c6 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -167,7 +167,7 @@ static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
 
 #ifdef CONFIG_MMC_DEBUG
 	dev_dbg(dev, "Set slot %d power: %s (vdd %d)\n", slot + 1,
-		power_on ? "on" : "off", vdd);
+		str_on_off(power_on), vdd);
 #endif
 	if (slot == 0) {
 		if (!power_on)
-- 
2.43.0


