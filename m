Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D94CC5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 05:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzZIYfQijzU/stSMMQOIrQ9i5UMdRdRKxn3PAIWUegs=; b=NgHQOQiMWe7kuj8ImzVrVmN8VY
	hehk1/p6jhHvM/ffgx8aQ6dorFbwcw14X3y4Eog/u/h7ecJcGHmvabssuURh+DfFKfJ9M9cYBFPSO
	g6Ntj2+YICDjB96X6K7Ue1VOx+nI16ATv+MLIM8EAgiGsGiyZ4qlty5d4BHR81MDLqp+bLOzlWN1m
	06zojbVY1pap92mYFU1OHh2cXZnTMGmYDcasWecmSuVEd1U8Af/6Y0v8/AMjKcev2hmBx+3S8v5fA
	OKxQWdZebqfNCldrZqlA7zCtWjEPXTpWcID2N6BtetcGqvv7hyft9toMIQUPQY6gDZ8eQAXMlxRJ2
	Fp5JYXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHym-0000000CZTS-3HAh;
	Fri, 21 Aug 2026 05:39:50 +0000
Received: from mail-northeuropeazon11010035.outbound.protection.outlook.com ([52.101.84.35] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHyh-0000000CZSN-3vT6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 05:39:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SndXKFKpx/849jXGlds2BQqqdvaZRSOQFIhj6yvNXPlJ4e+z3GFl8m3tFJ+zikbb8fY3Exu/ePQzjjpUcgcwnHzwjeU5g+bl5zrOMs8kTtskTWjdJC4IrJOtuw5gvLwrQe40JY1mqovFXRfPN7Adqug8gxl5lTRyo2DU3T/e03uANceKPSVLnz3Zdsyo+f3YC8lK/2gS3igcF6Es3BOSKaf8KFoaqV+FfokBiU8v1V7Nh9orEjTImlTtcXRnngCR2S/96frkTPr6aa9sFJE/p44Z2K8vCREnigqLh0enUFymUFsF4grPDM2w1MuI0vdCUu3wfXvPFTiuzyYp/7FgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzZIYfQijzU/stSMMQOIrQ9i5UMdRdRKxn3PAIWUegs=;
 b=jPvBNUNJWlQfLjW4prfUk5LwbEpvpnCC6lbqiUFfxybZoXwpJPpCiOT0ktrIwXAqV3JBjkopaU6BJg82NiRBsbI/WmQWbzaSfzxs90heY1cnZaa5S84ytnHoWlyt9a1keOMzbTjqm0JRNrOsoSk03oajqOazNXHgTaOS6CtY5uCdAu6a/LNxTg0UCBpd4Zoizzz1GGNT7CI2IBzRY3JaZ0XrKJ/9FHHbS8ogoqCAk+Dv9cfiwdCKo/diBtKzOpKarP2100Dts9hEfRKbP82lLPMvRN7PTj+goBljAd0um0ypHblcfykwlsULiP2L53rqPg27ee++sE9O4Ff9zwCnZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzZIYfQijzU/stSMMQOIrQ9i5UMdRdRKxn3PAIWUegs=;
 b=WkrrzTP7no6OSlNG2+rR/DqjNHvOWkAADhtRrqV7LTu9OPIfOIOHiU+aDuI968sdMWiLqv2EXq8EOl/h87yCu/DdOREu/ZQEO2W28BHDmETAXsEQf84Z71ZCy0PSi5kI0JORf0VRnrEUX92xYItsvbFBGgnzPYGFxzLd8LO8aljXaFtCzx+YN5TCEerqmN/hNG42bdMaBWJw/0vlSXgF/27ng3y3I2mU7rsNLaejo72gVx1bS679IaU3OkGom7p2t4Oggy5ay9O9RUpUfzHXxq/7UzTsDgZGhCngTntir4KjVZr+nJPzXBthffw97iMS8gbutsozyc/4jQffDBl2Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 05:39:41 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 05:39:41 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
Date: Fri, 21 Aug 2026 13:43:32 +0800
Message-Id: <20260821054334.1277088-2-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
References: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f1e38c-1ad2-4867-439e-08deff4698c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: q7lEnbZFoB0XPYQvdOc+WSkO10aqFU5yvlVsxOGNYtbdIQlI5mMLlFdUJbh3PsbIiYe78P4NZw912HH9Br3yfJlTwzVdAON8WzIz87KF18FK8ag433N2xXfyGU1rsv7EMPT0pkmhfV64fAkdooKzL5bJzjUfStUMKeSm7obNnC5T5EwqHmqeOy9j0I+8rmaJuA65FuUxIMzXTw6JrGb29lXgO1f0puw9RVcWMbkGz11AOCnuxAENleYfZBT26E9Tdglpq97N1fvANgpNhzaSwnqGqxvPcdNeqxIX9imdwJKEtuLgw+dzt9W78Sfdv11p4N5W7o/qdfRFzerSUTG8/gewg3zFWDMm9np6oLHVJe3pYFNrJ4d6dTyd4xV+H84AHzDgbN8pkRrGXebfNtDKyE5LPBdT1ZN98Fv07Yox9BjdskL+zULZTgVYcLtemO5HIhOwv6qSWFpTxyQoHdDnAXxYJMoth0oNoJXfkazfQGZy/6oFbyvblrRskeLRf7n8nmlZmNMBADeF2rqt4ZPRRB93u2ikY2FUd64+waod7Vxeg5GMS08hwmS5fYxPPbqs35y6mhEilCG2Jza5jsJPPnY87O1e0BQTMmH7KqZVAo7mcwzSD0Vg1w1uWkao6Fcf06R62Ut80vtOgGY6P0z2IVbCVZv/nWSo3NiozShftfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ZmRF4ivXav/DXwlrpzACDvajdJU6qvOPNvU9iPIHeE9WA6+N+wVSZPp+rDS?=
 =?us-ascii?Q?l136boFa+nXoidQZ3CKaVbgpCkHhuarqHVgKaEaHCLObuMTLa708oBx3FXAW?=
 =?us-ascii?Q?8SwxHS0j9P/frzvGa4bQB5hd+keLfS2hBEWGPr9mTgf3E8Zc4icJeyAUPYt9?=
 =?us-ascii?Q?JwxJRgNoC6Iht7GEu13GxdwLFnQF8G1UwEqKi/dmBfN0H7Br22t5C8oSAp2t?=
 =?us-ascii?Q?GAIvksqlJXqb/iD9s/k9MtOC1Ev5ecEupZwUf/lE57tDSIYFelUrPHrKAix2?=
 =?us-ascii?Q?M13BkFeELJlyx4B8eLV+TPPieZDIsXFfqjEFtqZIMiBqVgkA5X+cRAiDaqUa?=
 =?us-ascii?Q?TRVexxjyAom5doP+L6EamBm97mLQsANhiP275iPgu0u7QQfdLUDfyWv0vK41?=
 =?us-ascii?Q?xK88PEjSD8mAbI6nQF9Phj/hIpChUO9DJDMqPrPraKzbHCUX+T9LOJE8fqyu?=
 =?us-ascii?Q?BNXkE6fscQhztl1mCV+InHmGFEr24HFGBbKKaDcTbzuIeVNtgh1/k25B5vAn?=
 =?us-ascii?Q?Pe333dJDQXq9XXnd9AmmnuezqHuEfXGWFt2mAvIvWhr+pLMpfiGQsxVky2gy?=
 =?us-ascii?Q?H6L3plLQUHuOY9tQ2B2TIalOa0h/tn9/xGzISV5j0+fh6iPBDdyWsBb1WLt5?=
 =?us-ascii?Q?SFJcBUo/YjevHQBSkbA7gtF3ad4R73yGbropIRwEvhOeDDrykL2osNmr+Jqg?=
 =?us-ascii?Q?5O7B4ICAxdHbWzsLrXSNMjYRz/EtGMXRSnFzeUUYYj9c+NRepGiIloLUw1x5?=
 =?us-ascii?Q?Q78yN7wLMhvL6oDA3ee7mO2yNYjDdmfoTg5g6sIbKAJB6RlrkzPPgRgckJYR?=
 =?us-ascii?Q?1449A0HSpj3qh+wYjLAT3Y0hu7z3qMMRTGqRu8R2wz8KKgnd6w8f/ogrPxc+?=
 =?us-ascii?Q?0QUxcrnIUDHNUT92OVUzxiZcrtSOgV04SwcbIAw1BkKzRHqrIb4k0g31a1BE?=
 =?us-ascii?Q?pccJMjPKGBwHfdwyPpi8iZN+N3sSx62DwYOeazGcpMU7kqImkM0XVRlyCCfd?=
 =?us-ascii?Q?FPcpSknrfaixmC6xmueqT/kpRHtLFUvH6ZrU2F+twVEXX1BBp81H32R2Kwcd?=
 =?us-ascii?Q?WrAeXlxqXc3+BVIT+usekuE73a/tbdqYbxCCOdCRg6uY4AL2ViyrFn+Z7B0A?=
 =?us-ascii?Q?JOxizNhnEK1bQ5lgqug5Cu51K0VDbIc/5tUI51i+vnv4M9BORcDvqQJYoYD5?=
 =?us-ascii?Q?gT4gs6BYblfsykaVPVy4np39h4tqmQmp7KdrlYXcJVOVs0QQCqmbgip22Fcr?=
 =?us-ascii?Q?/3+lGWjG5JTF3dpYWHcNCwRtBZHAueoYX2puGPKinGnDgSzW9hmHJAwo8Emb?=
 =?us-ascii?Q?ZS1YuhShW4KYWP34vm+6iqdC/bVAc1FPlialiB22rWWMLyRT+ZAIxL4XVAKg?=
 =?us-ascii?Q?USxMukjhmkVRE8EYTvsOLiuE8dz1wRnnKmW873dr6NBAgqGwP4pw6Je9PUj0?=
 =?us-ascii?Q?IwDqqQlg9b8nTW/rAWCZdk0sWiEPGM/PRcbM3yzbxIk2ReAwDcw3mSpXOw/J?=
 =?us-ascii?Q?xfXzTRMSx5fiN7lpEE2bRH+mJu/q5nGZ3nsylBfOF+GhvrPFpdAmrwuHBOg+?=
 =?us-ascii?Q?qLRUYA63wQuiNt92tweQIBMNzHL28wbSa67SI8N7mFpMD3bb+zAwPxc0SsqQ?=
 =?us-ascii?Q?2sE/uT2lWo2SDqDsODXt588y/ETEw2qPh0zdn2ac8+J4W/n+UXtK0BIrJ1be?=
 =?us-ascii?Q?rPflQwIH/LBAanUkSILAVdMMQZPIC1jf4lUnm6GlqiRLn3FP/a62d/rlTGZZ?=
 =?us-ascii?Q?myHYpobNgBC5QBs3sJZvIdZNqSQ3zzZQzPf0hUfRXMMOqFUOanUs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f1e38c-1ad2-4867-439e-08deff4698c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 05:39:41.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfprDJBTrr9hfvsaDxQkgWI32KOT3L6dz1tintRrMEVHTZwUJwxCWOa6IkFeta7VUwH09Lb3PLzREnUukhFhCwsBIGL7KP4IUSWdG/snQALOLT97DIucoxwIZd8DyPb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_223944_001551_9BC83142 
X-CRM114-Status: GOOD (  10.38  )
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

From: Richard Zhu <hongxing.zhu@nxp.com>

Move the PCIe non-prefetchable memory PCI bus address from 0xe0000000
to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
reserved and safe to use.

Fixes: dbecf38e60d4e ("arm64: dts: imx95: Correct PCIe outbound address space configuration")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 38fc47024841f..0f03b85aaec17 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1948,7 +1948,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -2039,7 +2039,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0xa 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;

base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
-- 
2.34.1


