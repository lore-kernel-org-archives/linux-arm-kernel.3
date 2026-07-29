Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A5C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 01:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9K9cfY5Ty6ZcQoW4MXlClsqa5N5qXoNFuUNrZMaHUuM=; b=Tdlkf4v//UYdahVrWjDxDE2YMY
	cMYU+W8JPrPnM4E4re5MUoaP33tzL7HLSszG1apipzjfX61u3Eg6AB+jXH0TZEx9Z86HZa0zOwZlK
	iQJ72wIVCWRiI02VvUuXU2S787YL5k0Cn9t9c2tdkjGwwSBWRuslwB5XDEDnVf+a3odC8DaAfAeaJ
	QiP+ixz1d5Bvib+CGolvxLdO34EBHui8AjnUvLPrT8dq46ohWq6HJEPdobhxl8WGQnTGlFR6R+3uz
	IgKelG/WctjEhV3ZH88jK+pjTtqYakCjk+rDqsOl45gv0Ki+q4Rq07J8vXXsIWD1bxaBDRnClG1DB
	9m2pYp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wot0L-00000006aC4-2MKt;
	Wed, 29 Jul 2026 01:22:41 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wot0C-00000006a5h-0lUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 01:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlSu+3I1xkX/neCql0RuyaBUkHQB/acxdK6lvjn+ms8DAVUz7HbsgQ0dnY+wElPsgTYG61SU9SQPW/zb1anDIUp+64NA6+jACaKBnQ8bdnVCr4l0TZVLv/ZYBanYMo5/uP0VfbveuJGT+a1dV4PuPS/2HZ7lQylPmoHjNdbtpsmT/2+K1ICfMAhDTlpps5EO8/n37a3F93Nt44FyiSkftW+UzSOzpYgOLHUUziyrZDcGiU4Mu1ESmmrAJV5idT3p/15zjc9PfrDnm3n7CIuI4gZkMa+PPS+M4F0t3ulyqHjC5FELN1i4ShU/N2HKcDP9Yq8KuZU0P2WWBkGIZmdDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K9cfY5Ty6ZcQoW4MXlClsqa5N5qXoNFuUNrZMaHUuM=;
 b=eWpjBv1JVW1Ygom4lce1yWhCy1uitArRtPIQ7GQ/VWdZmzIHSBsNnaqf1k3K1dxiwzy8QhwOKhE5GlsWsw4bBpaPxOdDV9KZmezHZopCBd6BDQ2B+ynn47wvS2qBTePHEH7Ka+0DA+Lsymfc8SQExXZZft6ctZp5MOUvo2UJc9Qc+y6AJRwbrHG/bOSlEEm3PdoY+p3KZKqd1UpOHHtdc8Tbr0wqkVUbFJEAslM673gz04xx0u6/qY4OdkMiuo24Z9/qn3iMK22Fe9pBF9nYmWfiBJqyl3rrXYVB4gGbT0+qdPKk24fYlecSgX3PboJpIB/PXQojrHliZDS7MHh9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K9cfY5Ty6ZcQoW4MXlClsqa5N5qXoNFuUNrZMaHUuM=;
 b=vdYT8Q075G70R+7PwwinlytQwaHeS+I1ADDBF2jEkjekY9ALm5OB/jyOkIyTkG0zbe5K2WRBHAdpXddne7sjRQ8JzLZI3rrkBWPrs9C7P4o/bk6k9JQYaSMtCewAxSsAY7T+pcnzNfWdsn83UPxkD3zSFAPA+oMekyNUSXK4DLT2DHgz3wrvSRlEe3JhWoLyD0k2jijRc/+VqA1ZAJAloy/mIrUjwplBIaBXgHKSzGGplwOPP54CRMRL0tVYrHgtgrYzF2xO5aQwsvgUNuk/oJ+VDEwDL5GscHUo/wNGQLcgM/Bj8tGFynAQsacsoCkuSmpwM9YXQdXptNNgEwYGLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:40 +0800
Subject: [PATCH 5/7] arm64: dts: imx93-11x11-frdm: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-5-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
In-Reply-To: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: 368cb14c-81b0-46f9-700c-08deed0fda46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: O/up1385ewjUN6LSbltxPoIYXY9hE6FWrvYPYhmAUE0Zh5xREWw8KrhC42zr1HJdDiaViWGpYlX1gYCNUBjuWZ5fdWXEieliehbLjL0y1u6WzEwo6mTrOQMVNR/fs3mSDGHl/oMY3AymEw5AHKjrsQCo9UXivoDcRnjR09F+Qf9E5iJCrBiBdBxgXscNrFxscG2NsJz5QebulYctygtasZftaePgB4fbXH6B7m9wCn+Om8qT1YNNuM2nTmdxwrufj0zlQu/WzJmdN13t4iwUlUo9YD+PD22UNIPy7cNu9ZlMlPyroOk9RMSUP8lHYmm0IL1rXG9gjgozGiPqrjpAVLaFG1Xz6ZBzJWdT4Qgg7TfW4NKEteMdVJlmD9/jAlkmSc0xKDvpJF5GU5TK/LSBnBDXUiDYhWtU2i76ggP05+lXFHViML9IZkVG/QxaQIJCHu9p2X954xqHGL8SM1TMy6na4UUQ0VaB2nrAdMSiKWBloHwYQ+SIm5QIPpXbev8b+d25pRwTozuzZf7aWacScQFp6JlmCojEoCkC49dC00uDwwuBJUo3vXjNvkq+bE+2doLkoUlbXUH0SYelpTWvg6oKHbfG5MJugdueXfMIPtcqWzv+nKRSF/5qzs76rbhMTyAm4cFDMLk7McOnT0Rb+nVGDB0Cr1AOMkVUJw7qEsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2JEN0N2WDdSMSswUFl2ck9NaXR0TCt0UXlaU09wSGpUcXJFeWVSeTR3bGtu?=
 =?utf-8?B?NmxoUXZJYWtyNm1reUZ4Y3JJWk9ScnZnYUZvMjdobWdNZVIybm04cTg4U3VV?=
 =?utf-8?B?RTYzcjJjSlhhTG5LaEdTM3lIMjlVWnRMR2Q4UktKM2J1cytZUjQvSUpaNWxt?=
 =?utf-8?B?NEpnR0VTeWNIUEl5NVNTUGVQZ28ybktwZldrY0pNemlRN1VKZHc2N3g2OXVH?=
 =?utf-8?B?OEl4R0NEUkx0OWhNK0dYaVBDc09Od1dkejFhTFJ6UHkrUVNMalVvQ05BTU54?=
 =?utf-8?B?aEJsV0NtNnk0UlcvdDhpenFabEx5THEyY1ZQSHlFenc5TTg0em4rejR1Z2xk?=
 =?utf-8?B?dVlwWGh2Rm9YM1FrV29UQXVLZGlDSDRVVTJ5REtPVzRqM0F1Y3pZMk5pUlZk?=
 =?utf-8?B?c01oeTQ5QkN1V2hkQVJabTJranRlT2xGMGRncmtOVnIyZVpJcVN0T3pkTEF6?=
 =?utf-8?B?VGtzREE2OXdZZW16c3hLbUZHRkxWMGVKTUk2TTZ2RFVjV3lJOHZSOXNxbjNK?=
 =?utf-8?B?TTlhcXM4aW1QSHdEdnd4UXF2MVlNSkFDYlBIWjZpM0crL2FHbzBwaTJIY1Jh?=
 =?utf-8?B?VkI3MVNKcXR5MzZib25LaXJTcjNXTEhST0xlZ1NmZEpEd2dadEtKTlFlVmEx?=
 =?utf-8?B?ZGxTbVRZVFpEZi9BWHU3dzliUHllN0E3MUtQa2xhQi9lYzUwSnBMcVpuMFN4?=
 =?utf-8?B?VDIvVnFXVXYvZG56UDBtb3piV293bCtxZUZNU0JFWWw4RXp3aDFTU2pIVU9U?=
 =?utf-8?B?Rm81bm9tL2xMOUk2VlZZRGpNdG9LZkUwYUJUS2pZa3VUK08rRmp6L1IrOXk4?=
 =?utf-8?B?VzkxMkpvamZGT2E4QUdWODNHdi92U3hDaFJxTnlmOEViV0RpVm5aK3dGWVRW?=
 =?utf-8?B?QXdsay9FajhUM1B3OGd6R2JCNnlva2I0SnhVdWhxYVRBY2c3RTlSWUJUUC9V?=
 =?utf-8?B?UjdmM25pZG5wVzB0ejVpa2hOVkF1OEpLYXI4Ny9RUUZ5NzAvUnNpdldVcGZO?=
 =?utf-8?B?K0xGMUQzTDZmWkh4c1g3bFFjbGVFejNSb3pMck1NMkdkSytKQittcHZ5UzEx?=
 =?utf-8?B?Tk9JRHVjRzZ3cTVvV3Npa1A2U0Y1MU5jbzdtSFgySE53UlcyN0p6WFFOam8z?=
 =?utf-8?B?OFkxZmE4R2pmQ3ZoTDMvbzlWZ3pCeHVTMnB3QVhRYjhiNVRDS0ozeDB5aTBh?=
 =?utf-8?B?cEhuWFRJNVVucjltUUFScTJ4aWltekU5d2hJR1dEdVkwUGE0NVRpQmIyeUts?=
 =?utf-8?B?TDIySnMyMFNiWURXNW15VUwyRlcxWG4vQjltUXRCVDlEUnZISTBSOXZVRTRj?=
 =?utf-8?B?YnFEckFWcWlyMTV2WXQzdmM2cWtaYUFXL1NkMjQ5NU03eW9Wa3l5WWdDK2c3?=
 =?utf-8?B?ZlRoUGNmSDJXd3NjdDc3MkQ1a1hyT2NYYUxhSDgvM2R2dnJ6MkZOWnRpUzMw?=
 =?utf-8?B?MU9LN3NwWU15ckRqSytXMGE5VW1mTExtSmhzbkx1OTFJc21YTENoby81ZzhF?=
 =?utf-8?B?aGV6cEJseThNeUUxVitYRzlFVHI1NzFseVErR2lKZXoxcXJnd0w5ekk2MEVV?=
 =?utf-8?B?ZE16R0RtZ0hYd1l1OXdXS0hBU0E0ZVpydGo0WjhZZks0cXlqdW9KckcrOWVL?=
 =?utf-8?B?Mlk3dURWSXNLbGMySkllTys0MjJ0WWlWa29GdE93T2o1d1ErZnQwKzhtTGhN?=
 =?utf-8?B?UE84NEtVRExtYUJRQ1Bndy9ubU9ub1N1ZEVySkdtNldLQ1RWWFRVT3k4cGQv?=
 =?utf-8?B?S0tvUkhHZWh6WmxaaUJOYVJOeXVsbExrL2FZR3ZPK293Y1dFWjVvMHVPdVlY?=
 =?utf-8?B?YWE0M2NFSnZpTmIrRXR3cmU5b1hYcW1qVHVLenBsRWlGdG4vWGtId3QzN0o5?=
 =?utf-8?B?QnU3eGlJbDJpOVI1eFNMWFgzdklTTW05VDBEU0lTKzZJSEk0Q0x1dFBrbTRZ?=
 =?utf-8?B?U2d5K1dDNVpTT0psVlpSR2hOc3N2TndQV1ZKTmdVYzJ4TGhaa3hhNmxNazZ5?=
 =?utf-8?B?YndiWlVKb1IwSkdBQjNZVU40YnFieUE1eUZmWC9venptNllNUmtlVGxac3V1?=
 =?utf-8?B?YjUwbGp3eWhuZjV3S2sySHgwQTcwT3k3Yi95cGRlR21UNXl0d3RqRVhsVEVM?=
 =?utf-8?B?eDI3cTRzNm15TGVOanBpWWFZOHRhV3RNRldmL0g3SStGMERlSFova1JBTlpW?=
 =?utf-8?B?YlI5QjNETDZIMjc5cXRyOXZOYStXY0ZlQnNCbnlMUi9mekl5Tk9nL2dSOWRw?=
 =?utf-8?B?d3ZjNjM4cFFZTEkzL1RmS3l0NldvVHY2Y1d4YzM0WkN0VUVhWjROdTg2S2dj?=
 =?utf-8?B?VytqcVVLQUF3WjFna2IwQUNqYmI2a2lrdVd1bGhBVzNPREZIV1kwOHE4bGEw?=
 =?utf-8?Q?84lVvLeDX0TR/WpTX/GCeUGsWUBuF2WRDSb91?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368cb14c-81b0-46f9-700c-08deed0fda46
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:27.7532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugtwsd0A35S5Kvi34cQkaeilwwY9Xhsd6Fj42Z6PCKNZyapJKbBPiJCcEvV5hlWsqQ+x7GgIR/p4SrujD2lmk7w+drK6eZFyeud3aLz4XIZm5IclD0tgCQEm/OU0Z7PW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_182232_244836_1BD6F767 
X-CRM114-Status: GOOD (  12.89  )
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

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: eb2f28413e23 ("arm64: dts: freescale: add support for NXP i.MX93 FRDM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index bd14ba28690c0..0f75524ab7354 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -114,7 +114,7 @@ vdev1vring1: vdev1vring1@a4018000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a4020000 {
+		vdev0buffer: vdev0buffer@a4020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa4020000 0 0x100000>;
 			no-map;
@@ -148,7 +148,7 @@ &cm33 {
 		 <&mu1 1 1>,
 		 <&mu1 3 1>;
 	mbox-names = "tx", "rx", "rxdb";
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1


