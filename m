Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD09CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 05:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w77rf8sJ0JUCzdThI9boJMxIZVV9fCYLzXBrSmIMf3A=; b=WvFFWnXOsLCJ9xC17WUgKfQ9mn
	qcoAQBfl9nrFOjCWA6nzuMbQnPYkHlxCDE/5kEZhMXPODgN6KpPrKzp7Hg7s2Xw+gljZXs8lhPEC2
	D3f1vDyJFLgPZAbiixwQyJD5j+fx/qFi750UW28Zshv85RxTMQyo8GNn7Fh9xa8hJ0rGFvr1vV1rx
	o2A2vz240c33QSLrQSRZ9+DdfDYcuW1oReqzd684YBEz/aOURoIVx1qm1LqwyayYqFBfFtH15vQml
	EL229H8PPABzOpwuW6ktEiBMdW2U/ZcjrrCa9sB9Qihd+t9O+QWEMoPSxny6GM2FA5L6PoY8v+UFt
	IjHNX36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccra-00000008fue-0vW5;
	Thu, 25 Jun 2026 05:42:58 +0000
Received: from mail-northeuropeazon11011049.outbound.protection.outlook.com ([52.101.65.49] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccrX-00000008fuD-1x3W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 05:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWHXBtUOcVneFg1Qypts6EigWygOIhDN0kW+bY6BBjPfwz03hdSQ2KV37MtOzsHAED2sZyszwJSttCpFtXmTgbQ2kAecVoemtE+vRK/luW7Wbs21cFcalaSCqLN3zAOXEkOKGc5UmBNgNpFX7mz0lSHE6YxH+HqpFRg9iDE0KkrrIIIwiq68Cl2iD8OCn7tZvPwH9Vm44FD7NJVJXW55DgC0qnflEdkCq64aqEoHRsJa570lbk0A4kc2A+vhzYymluh9rW6xQxMYxYTBpxgavFivMarSrmVvrfoK2mpbbSoFVuPAKe6W+xwR1pklLh2dePZdyXeZMh0KwMmhSCgQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w77rf8sJ0JUCzdThI9boJMxIZVV9fCYLzXBrSmIMf3A=;
 b=CM8j+L1X9fbBPpxNH7huVUUnqpNQ81Hcdg16vBMPZ8Vc2uJk4VdRMC+ltJzZD7yqwRhsuTD045BZDvCBPSz3llXiB61DDN0M1GqMoH9QVAliF7uo1G/MFASbSQaq/9Ve/4pT0Qn/Qj2BZpIylVPMjAPPp2Z1G40klvdZY8x0/GIRJSDx7kh2djJMD7dasJahyWdP87BhrDFrpqkOOXDBg8Q2a9+/0oTi9d9PpvwxvbJaRGUJUezyVRgNgH8ie/N6j7nyyOua9T/DsNx4d6tWiNo05FG84v4IsgqYugSW4Po5AWdz9btUkvmqgoEL2Hh01CwjBpXFQwrJ7PL/1VY5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w77rf8sJ0JUCzdThI9boJMxIZVV9fCYLzXBrSmIMf3A=;
 b=HOAq73usPaRNrSMFN3Xfr+p+zIgyepPFped5bLYPSIW7sg7Jt4CP3YDM0EJ7+CjmGeoAONv8aKFaIzCvMpAsr2P+GB6w6qoHYcFUTOwTQh1h0nxd26uYntlWN2AbQybLmQr8siArwJEEy+9flwSH+AnFI83VwW7wbtdRQChusmVzV/IMYhcEro5VsXHzbkvP3FfOoSJAUfA/bfrxUlk443ttIIbAkHp9d50vK9MlUxsDfbS+09cS51YFs+Cwzxc9BgQbk1JHuSHdPPIY2M06tDuAL7Dl4Dd3egx12zPGV5ZIN4yLGnZvV0tzZafMK2nn+pkBqbFgAxjqsxPun07yZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 05:42:48 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0159.013; Thu, 25 Jun 2026
 05:42:48 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-ab2: Enable MU2 for DSP communication
Date: Thu, 25 Jun 2026 13:47:09 +0800
Message-Id: <20260625054709.301209-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a46f38b-7eb4-406b-fd85-08ded27c96d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|7416014|1800799024|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: HeoYExsL0pE3hvYh82f3XOo4fgHklFJVpcR456Hb/bX8VT1wNP+jqYb8dXlmyu8AejzKBos7zqDwTB86NJNVdmZvFd7IqNWnTGqkzyvHEKY0TFbzQrtRnAGSD9Es68I+MPsOs5aPddX9pwYKxQMPlLz9h8HQdW/s+TIeiWodhFRIYhPfrnwisrqRW7AC5tExeetscxGC+hh+WMhyhZxk80M5Bu58mEdC4SrK17sYzWdXwxC1nB8ujaFeUn1LcqImFq5rK3nXlm0DOj2kaRnHNfVmvIEmBx/ykqNvbZuJF4anuQVmNtq2LE7QRb8DX2tdm76mbNmfXLQ6UBuNw1wg74R/MJaNek6eUsVfahpKW1yAPN6Y3H5Sp3A9Fttfj2zN4ZZfIi/DT9LhRUqPPKgToMAFqFLsJi27KAn9DgUYYNLLEcAQjp2jjk5gUEIDTigRhBG/FMuXU1LtugjvdCjLKQ8DXn0W+RcYA/uMcIQBvL9O/m01Oz+44fK2ndsV4ZOLsgXSPrXZEKa9zA7IpUQZYwsmfbe2s3SpoSfw60cNh9iIscev8uCtfzUL1GERzUEXZLlvx6NWFTXTISjcwk2gf3leBMupeCtocdEixFEJpRpnKZPB0iuQXsedKgmUrenPwGACmSIPERsYEHVWR48i4Rc2xH5n/tSEJp9GddAzJ+udrfM+iV426t9RTgDkbm1xaPKRIR3JPweuCmXdferoBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(7416014)(1800799024)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXrmhuoJpY0qh4NpYbpkPzrYclpKDZY2kqdm9iH7yneIYoc6e6ulz4oSEEeB?=
 =?us-ascii?Q?JHmuznHNrCiVW4RzvkaMB3v3Q4Ble/HV9ElxPhh4BTAUNRUeyvmhlEJXEGOB?=
 =?us-ascii?Q?CDjhVklJB+Qr28somQYstjb3tRT3bevLmlW8tsjSpvnnEqnLLCbCA0HvMNzc?=
 =?us-ascii?Q?wp0uK7X5vbgnLe2/WlRwbYXMtTEADRFcBpVb8XN5e4tAwJW7/VfTjwrwzEey?=
 =?us-ascii?Q?aM9rGdx5CsnDod2rQKZkaGphvrS4JYrUWtR2HhapnkpKruFYkceK8LacEppZ?=
 =?us-ascii?Q?NFRvXmoaUQBWjbPQZ9ohFsOW3L+i6f9sFznF7wMyp/GcXNYUPl8rkFJPB7TL?=
 =?us-ascii?Q?O4qeqfDb02GahxKn+6gL2HrxNG5l54z+ft41KdV6du/7jZE8phraMSzHrBJN?=
 =?us-ascii?Q?TAsKOMqmMGyrUQQOtPJ++DIr4snIWlknxovDqhx+4eoFOzEC2+AijUep2Xs/?=
 =?us-ascii?Q?y6SHK54TvGlvPGDmmeAfXzi7KiNbcQGwtMhqZSfhZrVlVzUFUqpWBzM8hhwj?=
 =?us-ascii?Q?/At+LcjdW6wryEwSsocBVK4w/hzFqL0PPaoQgJQTw6f5byhRPlr7e9UYDEOe?=
 =?us-ascii?Q?GOFxlHOhaZOp1UKJKZpEzIqpibjWyO3gRjFr1tvLUHgC0Wc8+j/1UJQYEtTk?=
 =?us-ascii?Q?+SMHeforLKXNKlCQBaOSbfFWhVIqPFo77AxEzvri1Nk8deYlO1utD5LPaZAB?=
 =?us-ascii?Q?JAiF3RzRVqW/QzTmyHKzCA4rGkMxBMUM4gLwUebwFNxFSx/HqsJ0IsO4vUqA?=
 =?us-ascii?Q?K0xwEfz4hzKe8Lhg8vZxqV6T1P1xJyV71gIoljIjSv3l1UKbP5fCx4WwaTP7?=
 =?us-ascii?Q?UQ9X2xdpVgIAhmLdUednyYMZpyWdUZqkrXunfogv7H/Gmf2ZZfOM0NOtCpmP?=
 =?us-ascii?Q?Pzz3MX+q7xbUfsemocs9NRydSxs5WtX1Ai6Inz14lOKLNYjw+Fneo2SBXX/O?=
 =?us-ascii?Q?NxGk47vPKPOHDLplZMRiGZxPftyGFSh0flxxuw7Mp6f0exbwtr+C/p+/VT9A?=
 =?us-ascii?Q?hpEFq3zBj/2LgGqDa4ab9Ezm73GdzBvKh0efOYmjWajoMdVu510VLGtvjoYF?=
 =?us-ascii?Q?yi/vVoEjleYnQjyF7aU/iP+XnBKWB4oAfxjht+qB+qHTxEHKvdFBXY/Mdqbt?=
 =?us-ascii?Q?NNVRGMtmew2tGtMY8Z7XobZee0xPmcPa2jeEbGyCkJFl45HUMlE9HIVZzFr7?=
 =?us-ascii?Q?mUKRciaNbeukawLeAH1BvHHP2LPTolgvqAYDUQjUhbfs1EsR8UYr7oRuv1ks?=
 =?us-ascii?Q?tx4PsJbBYh8rM9wQneYMsWxhmU8jVwdQytM/zYEFbw7JE1JSLkVNtfLG9TZx?=
 =?us-ascii?Q?ywYvpQEGOwBWBa6F4h/2uWrhTgsVsL+fQlEMGLmsIjYHvlJnAfWFpOLxdyWV?=
 =?us-ascii?Q?lMe8DAaeoxG2Dj9HlPJSRHnYBc3Z5z2C1bJqRfNGhn2cwf0UTV/uRh9K5mJk?=
 =?us-ascii?Q?CLuuY2QL7dJbQJgtd9e3TVTUQ5owcDxUgvqXiOkO0BtM+vkz6fF8YNN6fz/y?=
 =?us-ascii?Q?MnBTVZkOQrZY8IjmHM56fqlg4DwxLSwTUXZcPnxQ7rrAC2LzKAd17O20/ty6?=
 =?us-ascii?Q?7Lzv4MmKm0JmNaDI3OknRqVDuSDRDn7PigaD8qD9L32dG0HXxdw1lbNQY/oK?=
 =?us-ascii?Q?yLMt7UlQ/yab0/fyrPl+Z5xyN7YSQlrQ0iexllaJYJThJqcC98Wv1Iu0xpQQ?=
 =?us-ascii?Q?psXkI0VOuWVKqZwwbZan9gVEQJCQJS1f0oaOjyN/43wL1QTwBRv1K5AYqhhm?=
 =?us-ascii?Q?70CMMNUOQJMtxCIucsj0yR7UPcFlmjpP4UJ5tdiOo+M1yTdFq2zi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a46f38b-7eb4-406b-fd85-08ded27c96d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 05:42:48.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6Nj3OoRCiyla2WuRCZdHd6wgmj7xgRuwI3qOyD/zB7wi1/HUVoPHM/yl3dpjo8H9Rw8OJp2GmCfzwzyD5XofuWOVr5WMoGSs2LWdgZ8L0tl0uFqrYRODCa9VqVqANS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_224255_515486_424A4B55 
X-CRM114-Status: GOOD (  10.52  )
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Enable the MU2 (Message Unit 2) node on the i.MX8MP Audio Board v2.
MU2 is required for inter-processor communication between the
application CPU and the HiFi4 DSP, allowing DSP firmware to exchange
control and status messages with the Linux host.

Without this change, the DSP driver cannot establish the message
channel and DSP audio processing is non-functional.

Fixes: bf68c18150efc ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
index 443e4fd5b9bf..285bf79864eb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
@@ -775,6 +775,10 @@ &micfil {
 	status = "okay";
 };
 
+&mu2 {
+	status = "okay";
+};
+
 &pwm1 {
 	pinctrl-0 = <&pinctrl_pwm1>;
 	pinctrl-names = "default";
-- 
2.34.1


