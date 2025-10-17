Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448FBCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 20:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWSaJ/J7/NhXRxmf6iuMtujSLfqOvakh+QOEwHSOP4A=; b=LoEdCa73oznuYYnTSyBEAriMES
	cP/uHJbOj75XYJ034ZcZtSmDU6FzrZf4nzFr9fCdQAvhpT3sLsYOLUVcdox8efotjMs+NrJ/aEOhu
	17pwkdV6F+VyMjsWs3oYy0hJZsUXtVlmP6XfXc9F4nMzll76wvZMidKof0f4gQKyFNZ2+bOeDSHz9
	yy+8nB+dLMLt+RsOu+gmHiiZRvgoRl9l9I5X3dX1Arlhsu/+jVy7Ad5+YL2hgHjaGSMcb1zzfsyqk
	g5rfafgDLq5qmMDp6ALXYVM3c2gl3/gbxOwEar72W04mm44TWZdREKov3cb5MwUAW2Eeue42Ei9Ha
	xNadQuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qnz-00000008srB-27Yn;
	Fri, 17 Oct 2025 20:12:03 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qnu-00000008si1-1QFq;
	Fri, 17 Oct 2025 20:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYNpSbULC7POY5d9z4Jihn0W5JB+S7roG2WKkHiA9F7k1SAgqkKAO1aG3sRrLaoUQQ6XO/Z8htcgcAKHHFWISDdw6/HzyhrIsRZWEPReAVMPb9Cyqq6kv3HSknRnNNBzkKNrcWi+PK7XmvwczG0TadUap+QM6YJrLKDJ1aIKl/fNa8mk+AJvrIbzvaKqS5SgMgMbrzWxNbfG17J3cWvWMGLm0hhinfUrXbxflXVKS7xmeV3OSs6Rtihm1KsLPBOhiAo2vsotEp/TpZUh7XYe/69/eaAELf76hB5GfXQjbR5AqbAzJ84TA5Qc6pivENcvyezaP5ynk4cxt43IN79xTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWSaJ/J7/NhXRxmf6iuMtujSLfqOvakh+QOEwHSOP4A=;
 b=EBofnPdfvV3VMihnUq7gyhgzkqvn8H5iqooDMV6jTNRMzo8+LCeunm8eSI8ijgxKbDrBCheIfs8S7Z73+vgxQUmUmfA7QWumCtdYZmCIZ3yFaYQl9jnbf6AsewbaTC8BqKNAecq3eBMY/b5fJwN3JEqxa3XDUSseSNZnSOtn42N3AE1pm/Hndt4b81+RtudY8uXGarPhUQZDcSbfTIiPXjozHiY753umWhR7D4HpRXCajZJFu3ago8oEwHE9woBT5SujJXhG3anA8zp4J4seqjX3ixy6enCU4h80W5rjKgzHiZxS67JYofSqQKDuGjvx1Ee6a5vseArRCFkLTCfVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWSaJ/J7/NhXRxmf6iuMtujSLfqOvakh+QOEwHSOP4A=;
 b=n1O9ZDxaWvCMTXvGZtwbCDvymIGmd6w5cKnRgFpqcV24lEbsapAmPW8xV5v2kLHww/3AVzewa7TeOaKUN3ai/K3CaB/Lky1wpjaP4pNOWXnr1M1ns/1qzxZtL8n53/UKiFHHSfCTSQIvf/nxNvVffyXLpb1m8M4QyxIBURutP2CkIVlGNegGGi8+R7ms8qtP/yOvfyZ4o2HCe9+bC+xEtgx9dLYc6W8q5poM40UxbVfw2UuAoQ5kmtvogg1nGXp3PD7KNaNfXvgmGQHuqzHUm3TUG7fF+KNfQzkasPRpxAbU+h/NGm+0NcT8dyRezoQsTEXgIf/dLqfghB2N8fcaPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV1PR08MB11247.eurprd08.prod.outlook.com (2603:10a6:150:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 17 Oct
 2025 20:11:41 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 20:11:41 +0000
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
Subject: [PATCH RESEND v3 3/3] ARM: dts: airoha: update EN7523 dtsi to support resets
Date: Fri, 17 Oct 2025 23:11:26 +0300
Message-ID: <20251017201126.493496-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0067.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:270::16) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV1PR08MB11247:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e45ed1f-5b3b-4527-ca7f-08de0db962e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6rSAgTK0aageu/ji9IDTk2BWL4iT4KNQyc/so3pkBD/9NWODdob2/ECBK/00?=
 =?us-ascii?Q?zB6jzWqizTUW2xEUwKK8tJZF98/DjEjpzcSKDSWesPylctVYpf2J5ZF7yXs3?=
 =?us-ascii?Q?OSstID9LVeT5zIzIlhPofAcCtcCSD+hMH9AfijAXC1v061Tty70NeOZIrBQM?=
 =?us-ascii?Q?9FrheDV9q4PclDsLj3QI1GPeQAW7vyZT9/XqI9oEiExNmGk4jFSizgpmN34t?=
 =?us-ascii?Q?95JivymtnVs/ZKgZSSsY5pbJQMc30yPPAAccMMjvg3r0Tdvckdp7Yml/uxBi?=
 =?us-ascii?Q?CxrtRnkEwKN7yFtOCATymZ60SRGvGEUL8vK6BVYVZdM2RfqGy7hDiMMwrKXn?=
 =?us-ascii?Q?GHTndxPkRTB1ylOSZ1LWQnJuQ4L5ut92zJ2swUzF2gqu/U14p5UQ2f86+qsq?=
 =?us-ascii?Q?NxmWXd0cbMSaqd6LYOYaQvhcpRoNDaEAdMcjvyEnQ0Kqa6MGDAefTjXZDL6A?=
 =?us-ascii?Q?daCtscf8+PQplxyfI4COQ5m1zrK9iM9o+iny7avLPA3OUFwdjyGKZW5Js18m?=
 =?us-ascii?Q?E+eSMQmb3X8lU+tl4pkDqP34P8sCB//0JHJxnyShCeYQADZf1Emu56ME9b6Z?=
 =?us-ascii?Q?glSo9ty/q8dbKSQ54H1iKdaaw4cp7K89O0Wi1sGDESYHUMCe/xXZ0F7N0Laa?=
 =?us-ascii?Q?YDyFa6vGsJo9/9esZ46XNlb1l4la+rKq/NFsuMtvIKthLyVGyZrL3/vE1c6z?=
 =?us-ascii?Q?MRAPa2cIWEI3+guS06pBFXSpY+XeAO7A7wkZX2V6ze+0p1PNlm4XZwUg5vay?=
 =?us-ascii?Q?C3FLZK/2CUZ24WG5O9PcjxoNtCeAXtmrlLuQwPmUio4DUqoGPMu5xn/SFPmt?=
 =?us-ascii?Q?jnfvYkZmQ1oNjau+DPM9ja9GeOXdGABcRCXYSiBbfepcLFWc48LUpRdw5+VU?=
 =?us-ascii?Q?qELUPvcJsm1ssnhiixjai361KxL8dTwEKck8ssSu8+rAGJXBrXWfZ6ZVs9OI?=
 =?us-ascii?Q?7SsvbDs1W+zZoteJIOh1iEB1wkIbUAAGyL17Ueuz8tHyJN0Z7XyNk6DGLYYb?=
 =?us-ascii?Q?AHf1dtuws1ozaYNzjLOtd+BOVX5lqPal/JMq0QrRj1cmERV/alyIDtwJuxVX?=
 =?us-ascii?Q?lZqqntK/pyyJqxlIxvQkpFbyZHDaPQ86yeiLMtkBkV6CcEw7KW2R5UwbxbWW?=
 =?us-ascii?Q?F2q7PUEwtdYVhqDtFw2CtCKvHiE14G99arlm51P2WiciQTLfPIHlCnSDyqdK?=
 =?us-ascii?Q?IQebJCwm0Gjz1himnyLQ0P9PdYgPDdN+tc+MC8cZRPSVEf/vDTCfBJIU1Xdx?=
 =?us-ascii?Q?6jxSO1lW1RC9gw4sWbvqAIx9aL5pxPVBs8ndI73KvUBUhhfxGp5uYPnlOVSi?=
 =?us-ascii?Q?as0bRsqF0/ISQ8idHulZMgA7n0EtT2ADPNazLDlnWWzmppWdfTYIAEbuR7Y2?=
 =?us-ascii?Q?Fd8ZUn/ArirTgwQjRl/TO9azBQwmuerVNqNTcAGXP6pFPg0IXM0dQrN032RL?=
 =?us-ascii?Q?6QFRUZHSiEl/p9Ug4ypmfOHzPOl5xD9qk6Q19EwxKIlgT55QSgJNnxuEF17W?=
 =?us-ascii?Q?v0KerEPYQqB/4+j/94AerQLh8zmJ9MKSHQWU9oVdTjZCHz8Kvud7agX8cg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WKcrYUrbrG46S9Wc8tsDFrRbO2KNYBuK6ELdXGXQ5OkYwe9yR/FXzR2os8LL?=
 =?us-ascii?Q?7lj7Y34WCf/FrRaQHyK4GXG/n7QxMYBpRU8dQM9pkjb5lpG9YkwYrPSKaUl6?=
 =?us-ascii?Q?1NLeDfuK7UlwTq4FZ/o0Tj248tiwZDVfoUG13t98r23OVPWbNt2ODEHwkgMM?=
 =?us-ascii?Q?TNUXKdvgTpUioxdeubc/E+YFd4dGq751++d1vtYUWB1eJX3zevOzhjf9rBx1?=
 =?us-ascii?Q?LSJgi6mO3abulL4HScekwp3hRX6jtZx2un93BCoE7og3sGYeDJUmcjheiLwn?=
 =?us-ascii?Q?ZrUiT03Xc72OFx/6bmIzWDzPcndWRSK/pRJ0v7h9H0fkgLZVZSXLzf6Fl/Wd?=
 =?us-ascii?Q?zN72CkeDdxrtlUj4RF/fZLIlfWcaVWDb6RXcs71am4lT3ucT0PQYSA+2kO67?=
 =?us-ascii?Q?c4aB1MocFydypM9vPX3hXpfDzXx7VjiPlKnxmwwz+chedXE6iJQlPC+91KGC?=
 =?us-ascii?Q?ntWo23ZfNRvRgRpnNMzq8jpontP6P3m5SeX1cYoBNGCPl7YNUTjSoIO4Z7Qh?=
 =?us-ascii?Q?RxcXPkq5yk1H6/vRAzFOa0VG2Zem1XIy8qsbsopJsZPP1kUX4RYpyTEcmJJu?=
 =?us-ascii?Q?PsH0tX4DXrOAk0Ehu8hndvw8FUPbocazaAFlLGqtlrfkpMNqqSOGk3PWPRSU?=
 =?us-ascii?Q?ItKTBXC1p83+VJNfo6AvsdMBa424XN5rSaH6p50NLzrqvb51w9ibdVyB8unF?=
 =?us-ascii?Q?W8nj+fMzmSdytkuQsDtMVnqTknzS9gVKMdFtCj/AUmFs3aeLgLNHAR1AmMxi?=
 =?us-ascii?Q?ef9QnaeH6fcC9/9DOCMyE7XAdTxCynD8rY99jUFZeXcH9vinWOxv9psya+EA?=
 =?us-ascii?Q?RGxzNmYz5N3dFnhnv05kqDghHv+PDPlXm7WCe/7wQH1JvOFPs8q5iJmWSK6S?=
 =?us-ascii?Q?uNzbV5wlAqopZbauwlc21qfOsAPw04QuCBAM90umsee86yPs8lg/r/XkkRXt?=
 =?us-ascii?Q?2CvbIOmmIZp78ZsRw5lozAxl4PHp53DfrKVN1uczH0TpCtiZCKVEpZtCn/1j?=
 =?us-ascii?Q?uFu/07Roi7wS217EMNtvRn5kpASAlHRYKAB3W1eMWc+Wv1dhLjGc7Y9i06DT?=
 =?us-ascii?Q?4yyrzKvn4Y4jDw55fp84wbEZMBM676r62aCGJ986eCVZ3imN8CJXpGQ8cl8b?=
 =?us-ascii?Q?YZqcTojim6v70WCzCJjQf9ZqC2h4pt6kXq5Tu9EIt4qWNPPjGMN6E8c8TFqA?=
 =?us-ascii?Q?MB3jFj4oZXxvPj63/xOuAq2voq4vRulPVl06ZJzkmefsulbVPR3UubApLXi2?=
 =?us-ascii?Q?StHFSoOIzPAVxG/jgZ07+UCiI/XJZ5gYAZpcwP9few4nJLD8MUaSb6a6Td1I?=
 =?us-ascii?Q?YesMtk5dMexXJOc7UlXBVtkCST0za6zhCNdc33Ul5ZECE2lwgwqz2XNadaEK?=
 =?us-ascii?Q?PgDCGdElS1qWfaigKUK6kV1MPCX2QYl+3vMlivDrReLghByieXhHg5xjVZ3m?=
 =?us-ascii?Q?JetDdRq/Tmes5AoYXsAbyHwtTIpiElYiBaLer2kLKrt+CyC5j9tYpu3exPxX?=
 =?us-ascii?Q?4etJnBGzh5s26N2ueTj1Z+2ARGG2ejK06dgJI8uHYnTZGSGNZWsMy1hQ180U?=
 =?us-ascii?Q?dYPiXaKmXhFjskdN2eXUf1Ypo4Jg98kmuM9cKSqYFBo6M35NuQiV8Zi1JOCr?=
 =?us-ascii?Q?qutDu2CRZMJVsKnEtk9xgf0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e45ed1f-5b3b-4527-ca7f-08de0db962e2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 20:11:41.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHFpgLGRsxZceZ8VXj277HCrRt/XAbbRseErdEppJr5HmVLK8LPahCcvD+YjZ6343biS1SlX9Q0B5isCMjdY17H8kP6VUWp7/SHpq04iFlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_131158_380045_012CD827 
X-CRM114-Status: GOOD (  10.15  )
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

This patch updates EN7523 dtsi to reflect the reset-controller
support for EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..231638b25c5b 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7523-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -91,6 +92,7 @@ scu: system-controller@1fa20000 {
 		reg = <0x1fa20000 0x400>,
 		      <0x1fb00000 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	gic: interrupt-controller@9000000 {
-- 
2.51.0


