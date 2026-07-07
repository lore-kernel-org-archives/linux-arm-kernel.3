Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1CDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kcg7kQLUCa7p9MgMJCiICIn+X652u1djELG/eK66UnA=; b=uLIMx56DE0UC18HW/fTrIkswjH
	XPYcUxZIwjN5+uDhvicDnM4f3tY19rE9+2rJrQ4da0M8I6muMW6YWTarzXCB0+g7tKae59ZJ+KVOP
	O8ywnnKPizRJK0DmlfKjIhC1b/buT8q0B1gZ+A6LEEgB2+tttzYZBgBWmLNgkf7Xgh4tWwXdGGGoO
	qzsnSsy+jwAgSOyYo78xTdPVnbdOA4urR65xFKcg8Q+bsd0abbtfxjTS3Zkw6DrD/c/gOFsJlLJ3S
	e5T93A5Cuu4p4hnLb5zJxGONv7dagMNjxQVSitMU9FzEV5Zmzwo0yzxSncFwI5El4nkd7lpFzDw7w
	k0QZT7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzlB-0000000EGzw-1fxF;
	Tue, 07 Jul 2026 06:58:25 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzl5-0000000EGsD-0Iev
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBfWiv5FDFEXbL6uZ+65TJgHh6nrrPVSbCeaiJeGHh9g0CfV1R3JLhQOLLK9Vrak9DAIHmFUovTQeZd1tG2gC6XcK2D+dQ4wCPJ2vdx9i39Yo1LeZFIb/cxPErzID1AlnCP3un+x09MaJZ/c5D5ym7atYQkBUtFD7q5jAQeWPOkNXGelTeDwP8OXIOZydndbV3tjkyfb770BhD+9PU8sLUeFljO8hZp976vUYr5oENLdhBeFixs1exhCHhKLpLJXq4o+4VoS4YNoggO/+3lDOO9PNa8DY+24WmuDGMx+1iolN35PBcpKCf3T3SR6CqbjmGnQAMDnMWisDE5HLDnhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kcg7kQLUCa7p9MgMJCiICIn+X652u1djELG/eK66UnA=;
 b=h9LBwObfNCddTdAYWEVujJ40HW/TDvHvlntmTqRZmyHEotLvRpOTEe6tZgyaVnii0YuLWr/2WOLYbbra87wQ6G6ekKtBeLOJ4a1z/n01Pxowi807ULJclfSptpspH0U4RrTrKIp9O70ylb2XQ9BqGJ/E8OIOjeNFT4XF1p+v4HAipt90vAj79KSh4yAXSxH/SqiDPjpMbWYUFtW9/707PNGyUTNZWYqR4rlZpdei7VQSBn47uP/1RgkwpDDv4RZ5ilPn96XWnirQwIz3FYbKh6s9VgXoQ0/ROQujfqwYcZoCxZvLEoHAdB96hijJ+Dx5fHe1/ydGmOVqAvC3dZIW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kcg7kQLUCa7p9MgMJCiICIn+X652u1djELG/eK66UnA=;
 b=JJF+FZkpfpvs67Es/OidfXpE9fnREXaY9K506nghZ2oOcZHFxgtv6MrIHfyxOwBQ/fBsTGjLUa9HhiIVzi0KWNFJRapZT0BTie+BcXAWKjpKYSRh22XkWU9rOE0W+/yVo6qL8S5cTDrAewLK6gGyztLe6EuHVq+tBJihEmftSxQVgXe8zeTHzL7HBkdVz6makll15YEJ1Lnd/i6oD+dU8TSMfx4Hphye3y15vYg/HHin5qrcHo131rJpY5/HNl/39Abrp5cQj0ZRox6OVfthJ/Rmm/Rs/q+daHtN4s1+VjXsoJ/crgGPxDOnRubtWWl7ocvDThKA7i2C45xjrH9pcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB10830.eurprd04.prod.outlook.com
 (2603:10a6:800:260::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:58:15 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:58:15 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support
Date: Tue,  7 Jul 2026 15:57:25 +0900
Message-ID: <20260707065725.312450-7-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0071.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: f90985f8-2b27-4af3-c6a9-08dedbf51df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|1800799024|366016|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: UfxggzmEl/G282uUB62nqGcrqNAtRZFWHPx2RRnq7mbz/w/ZQY/PmfrZQyy/uwl8YMmanib7MTA/GTeDZ8t0l8ZcGw+sfHolh5umHr48BhCGf0KxQ+1eZ7yYG49l/IxjOZENAm6WZWHIjjllHEDjz2e/n6iO6v0LqheztHwkFX+PvAfkWB8aKwviEDaN9R84cD0ncbq1HS+w9UGiiJI5f+aa+JntLyAtqwnDF9vt88hsZ5lZwnGV6yNzJFsWKiI/bMLHZyfpArEO1uqgypZaN6F0yj3krZfcdP1cUca2DeTLMcIzLTqxR7ptbTL7YomgmvNhJPvsH8X1yGv/G5QoL42+ehhgzwULtUCSxpejY5ZwfiT2pgCNUDZYbBnzT6PVDhj4HO3r/qjml3L4blfHIeg+en3cnbpj9TfCeBmKRbR10vURTWqhhglBsK4OrJzXFZkZ0neBCxa4vNefP2WogITKh5SC3czwG3ksuAaCU5DzHM+QlQPb89brolme27xV4MRRCWVzX15akRiUwFPvc37fUyWGUmE+nffYieFRceExLFYiTYrb592r5nKRv7rsf3VRNEbR0auuuVbnjcaqdaQE4Ojmqja8xNON2K/S8v9gBV7KtGWRWEkRrMFK1nZdHHcmpS2DFtyGbs3ebRAmu2zRg0sAWe8x43+/+pplsS4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qAPBooxowv1uj2CGddlXwN30n7FfcIYb+Pz66+cI0QPyReSOhHutVrzDNL/b?=
 =?us-ascii?Q?NM3dL2Rdg4bUyujJ0BieEyaVwuwtVSZtiTzFPman86/SfmLmBraGmi0H7EQM?=
 =?us-ascii?Q?26MBEhwOq7Ef1I4IudHtrLlJ5K41up4iOAPnjpckEFP3SzmmmMHmOSoFt14I?=
 =?us-ascii?Q?I3sWHZPVeND0ufD7INqieMvHE0ResHVgsPG1derR/OAXIrVsVLMFUP3DLBs4?=
 =?us-ascii?Q?Q5Vjv3/HECHR5JZGSuD0RSbIXpaWNMjUx/l9WA1sqYr0DErqGsymkDqWxILd?=
 =?us-ascii?Q?hNj5FYZodzJu+7YUftHvZJFowO2jHEjoGK6kriN0e60Q9ruEMMx9TVu+pyxZ?=
 =?us-ascii?Q?+0B1Kjqa78LCpVzJhWTLjBpbWu5mASSKUnuUa30a5TvsbnV+7GKto2XCEUK4?=
 =?us-ascii?Q?Rcim81Mf3CYiQJZsCAXaxUNTbITaOVYIO5ypmt47ZeZEUoEXu1tPC66bUGd6?=
 =?us-ascii?Q?xAL0Rs0KAkxhbvy3E55F17zPWZv9wi89U4o4sMLHwyfN09KpGWGUFogZCJ5n?=
 =?us-ascii?Q?rKuqCZ/JBAaJEM84jaAB97VS6gZDeFIk/wPKbUBMl9AR53X5fW9YAJX7dboL?=
 =?us-ascii?Q?ZfIgyhlcYm7veTRjx+iYV6T/1OjEy7/z8uoUvT0UxF8k6c9IthVEM9rCp8cw?=
 =?us-ascii?Q?lHI08ZC+6lM3rLk7j7KARMgrgCjtwpx02YB+aTMsuoCZpB4uMSuBcl75Jby5?=
 =?us-ascii?Q?/ILk6a0qouwI38T7srZQVvgEgcz6ynorm/qAojO37cz3GZlQm6mMTuxLEVJy?=
 =?us-ascii?Q?U3omEnesOXf9rFwvFvQOru8mtaK5RrW9nif2hX61b6pR4MOzB7tBws66GhHh?=
 =?us-ascii?Q?gtwJI/l4mZC4LutTmU2cGJhUDm78C5Y4sCVkPlcwvSL6MY4Va/L4RsLyW6UJ?=
 =?us-ascii?Q?ApqSDZuleB2zEXoct6kv3s5/vK8h7AMEnelQxk0cfXMNDo96qahyZT4OfNRc?=
 =?us-ascii?Q?Zhl9fYNGVq4OByapoYLj5qNrLCBtDXcGlGbhufqcP8puCE8j7OgKPXD9Xr8+?=
 =?us-ascii?Q?MoH4CkKPROSK4sHTp3OgjmxzWoxN49uZSvnIX427LW92MDbzDExXELD3T8Ln?=
 =?us-ascii?Q?tw2e8AixiOfY3BA00TAyAM3fVRNmomRUPtVNu/JOjHRWcHEe2frf2IBG+H8o?=
 =?us-ascii?Q?oQ1FvPmFFsGrSXcxc+ckI4idTGvA9l4q7UPw+mAGa+RWAwv4a2G8gnkuNF1e?=
 =?us-ascii?Q?Tu2NA+q3C/AuScLqT9Og/hMogF7uabWOSlvo7VlIq9vRFduWma0f2LSVYz8h?=
 =?us-ascii?Q?fhgpSiI/SVoUQA6g00OyZl3yeSFbD19ggoUIObHPNhyCDmNcIGPTm9KQoY51?=
 =?us-ascii?Q?61xk7Fe/JZwlWPCs1moTX7CvjxbUR4IjObHhpuFM3oWR/SWacsChh9UvdQGx?=
 =?us-ascii?Q?5b8BcaCJP2E7FCag1aQ4KuVQ6DZjR1wA8ENpqziWAPlEVWW6NGSu6QamNXRL?=
 =?us-ascii?Q?6Ofm4VgmTphuev1pXqKfsdT9rHBrbTR1yCUcT8lsHEXsP1F2DOehfrwtDhE8?=
 =?us-ascii?Q?4KlmsGGpEsFIW7Ks6C7Fx1mV4FKSx10z3aU/2bpkBbc+ijfx41oy12gDn37s?=
 =?us-ascii?Q?tlnqZFv9EwaPqXPgwtzOAZW6WMndVcxaDkHme9rrSCXF34hKIo/TjXD5B3YJ?=
 =?us-ascii?Q?PRNwFGQA2q1p05q8lcCQIDDuXR2Uyc+kE0ARBMp8FBqQ/VTHJ1c9/9JngYbx?=
 =?us-ascii?Q?Tt4AnwqfROkYJX0valzNpCJVH71hbo7pyFf6ZhkVo/tuu2d/nXW8UtdeIWQT?=
 =?us-ascii?Q?hCVpzzAKHZyQ0lvOcj76tsFKk3le3GxiiCZsUp4s1RSJx7IcD9c5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90985f8-2b27-4af3-c6a9-08dedbf51df5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:58:15.3874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRH8m+eyhEzppEM0RV2z0Ee08wmxD6m8GaGzTBHPcesh16EXKOkgaWQVdG/iHZaXNQkDVb00cFT8jUXaaWD+JR5LofvUsgf9eyRV+6llqx1lv3udl+f6wpB8RPHKPFFV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_235820_706990_6399A0C0 
X-CRM114-Status: GOOD (  10.99  )
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

From: Chancel Liu <chancel.liu@nxp.com>

Add PDM microphone sound card support, configure the pinmux.

This sound card supports recording sound from PDM microphone and
convert the PDM format data to PCM data.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index c5b9dfee95eb..22114166df8c 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -79,6 +79,18 @@ sai1_enable: sai1-enable-grp {
 		};
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <4>;
+
+		port {
+			dmic_ep: endpoint {
+				remote-endpoint = <&micfil_ep>;
+			};
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
@@ -111,6 +123,12 @@ linux,cma {
 		};
 	};
 
+	sound-micfil {
+		compatible = "audio-graph-card2";
+		label = "micfil-audio";
+		links = <&micfil_port>;
+	};
+
 	sound-wm8524 {
 		compatible = "audio-graph-card2";
 		label = "wm8524-audio";
@@ -202,6 +220,14 @@ MX91_PAD_CCM_CLKO1__GPIO3_IO26                          0x31e
 		>;
 	};
 
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__PDM_CLK				0x31e
+			MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0		0x31e
+			MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1		0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
@@ -464,6 +490,24 @@ &lpuart1 {
 	status = "okay";
 };
 
+&micfil {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
+	assigned-clocks = <&clk IMX93_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <49152000>;
+	status = "okay";
+
+	micfil_port: port {
+		capture-only;
+
+		micfil_ep: endpoint {
+			remote-endpoint = <&dmic_ep>;
+		};
+	};
+};
+
 &sai1 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.50.1


