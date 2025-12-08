Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0DDD3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=YVTZ8uQMW2dE6p+e/1BfM5DDJG
	i+GPv3WC+EcWaBtVFCOSNhfY0QfmEYjYW4ztdP5DaO9nOH1CjWL7tAcZJHwFxSfoSckbklihiL3Wj
	2db8U3RJ+xexnwuI1qT8sN1x7A501yA3Li7S2p7y6ijpjEY/ltJp7xylIMQdHdwssIbXrxIx+qK9s
	LWkEJNOQYuu8D9Ybeer5bB8sx7GMdJN3XDlnPqzYZnhUT1CJtpKGNj0ixPGtpEgKSwI3iShNDeWAg
	tQhMedAK0+iTTeZO0POn48Dj5/zYDfBfCvy4jLFawfXH7qHBn3mPk2dofdlYCWmtJ+q9Dp8iPjN7J
	FeoyMkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUri-0000000Chkr-0RxS;
	Mon, 08 Dec 2025 06:36:58 +0000
Received: from mail-westeuropeazon11020094.outbound.protection.outlook.com ([52.101.69.94] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUrf-0000000Chiv-1ZjP;
	Mon, 08 Dec 2025 06:36:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtbu0tk7akjwOXiUCwUAcig3NN6RcoruJdFueSrRMHdLWJz+X6J30tq1hW21TCzb4JU5qoLDMG5XAb2v0EzmRYlq56YdvCFl2OQNN75LnnTOswOU8xBYU+/iPMUKuSJTSm9e37A0iUa6UciT0oQP9CfgxxaHIVtLaT+fRVT65HhnDfS8Obm51vAVQg9Ds7MIwszhCtAipO3IBCmw3y9WGGnf4tC5l+KyN8fu0qjKKTBiZNlnuYfE0I4AuarN3QMrBt4VQl7nwGUx7IQyzQ857WraPqsqh2LC4l23ps+a9mcfxp75QhUUJcM9PCG+V9aFcX+o3yxqj0GixVZqR7gW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=kRnZlK7Nay5CaWzENDfSHTfWtdEmBn61j1TkAE7C8f5rV71dkycItJL+MPMJpkfmI/vX2ce+X/8D0qadTQiv+OaJOqtNKlEMQpEZwWhF/tO+AYez7Kh9M79VdZ/uZcJjFMe7G/GkZjAhMWl3LFcPTkIbxj635PPMguzjdaZtmdp4zQmmZHDmLTQpWCAvkVZkfCWS5/3R1hBaX8wl03m4nrZqE155g8omg9qhI5yQ/Rg5/ItotgedaFnubI5PHYdJV4sJwsOHNzWZrmb/2mTXs9CsL7miu4MaquEynTERE3ea4xyIev/N1xPVvQkPjQkvUjG5IQ6VsawceHBFIlakmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=hSSFr4wvzJpm67DjhNqIwr8nkbbpbCQwhYbP1HZ5qKiX2iPV5JJ7wSqcGWkLP14cG3pHnHMYBJouIAQudpkepTPZjyibDWu2wtD6R2C6jbuDRr03lTYdfXnTs7lSsEH6RHSZcFnOgpnrpAPF448PhFmr5rOQhd7c+35sabMxMhZQNjrSzT6N/hKeC+81Eghk0q4nYLMq++y0nVD6XwxWu3GEWV8CpAPlrdUPD1gUN7N55gm6eWedfcdCdXxDculnrCVXCRCYeQWN/MB9p5kRvw6Fvq8RTodPVLYB53vfu73MTSjgJSweYOcbpemUPA0Otg9Of9RxLMJZ0SdD5qUfBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM0PR08MB11704.eurprd08.prod.outlook.com (2603:10a6:20b:745::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:36:48 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 06:36:48 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v2 1/2] ARM: dts: airoha: en7523: add node to support spinand flashes
Date: Mon,  8 Dec 2025 09:36:37 +0300
Message-ID: <20251208063638.3009460-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208063638.3009460-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251208063638.3009460-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM0PR08MB11704:EE_
X-MS-Office365-Filtering-Correlation-Id: 63486cc1-3343-4199-ffe4-08de362429bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g5bBrTi7d5dvpMSAEJ0eoXdrydkrWZnCAUGGpSaOgFPmRE48HK66qAd2qMNB?=
 =?us-ascii?Q?ENrvl8xSfTzuo0jpcviiCM/BHPVv67D0ROlTw2CAF1J3O9vztuLIug61og6V?=
 =?us-ascii?Q?0WLBOvQYbHlEcuuJEdMehy7M5ddUL9jqti7Uw1W2RvE3WbSNgkohSZ4oDR/+?=
 =?us-ascii?Q?yhyv2ZMSAKj6nuIik9cWSkp56eW5vuezBZt4XZdZUtE471vjZZiA3gJMWCcf?=
 =?us-ascii?Q?cGHkxfC0k+X25JxJRJ3ZHOnvulxTPklm2QbX/419OdZbdk4VMfLNZI8HAUYV?=
 =?us-ascii?Q?8igcAzfGRNYzCeaDwveZuRpm7yAk+Jx9DX5HBbJbJv71AZ/m32pbMLe1OJjx?=
 =?us-ascii?Q?/hCNdhNL1ElzwGbFacfVrqdsvMUOrbq73TC9nM+BIXyrU1n4gbqTD18yUsbU?=
 =?us-ascii?Q?rvKjNbKLti4sW8EZSNCtq4RNrdN1ksCxf8+K3VVTJ3SUFeeFQZ1UB+sLDkvg?=
 =?us-ascii?Q?80dzGvBx8/Sm0aNodvW5HgY918j+2LxtSrmCoVq42Qnl073yDeEt6SMxvayy?=
 =?us-ascii?Q?fJqHRWw57AM7+cKSN2cAFkP1EpX8w89pBRO0EOGa0eZ3JpYtYGws3ZgOYwcZ?=
 =?us-ascii?Q?Tjbn+m/9lswXiKOtTTueCmO4hcvZ/BYCGggzr8QHr4uYKrroNufReQPrEocY?=
 =?us-ascii?Q?rLz/M+EbukxejgKq6a5kei3C8HXb3og4LZrEwLhouFdZJc3EUUzBcSQVc/8g?=
 =?us-ascii?Q?HRDBG3WxDd2WZyMu16HQnWq2/How7D5DUh6lRZdCbPoKbvPUjA3fQWpc8N8T?=
 =?us-ascii?Q?AcFrY+HLhRs0HhmpBXv0pktJ0G86hjM4DP/RkuwyYoWBejHB3JCbIiZSKvCg?=
 =?us-ascii?Q?N6xqH3SjihG+M+znuZnI8robLzwlms4ZzR6FJQ3IO19vd86u3Ot7vkeDYC8B?=
 =?us-ascii?Q?pJuP3YVgvJsH9Yy/eowP+Az8UPEvFLnVZuHB/6EzRZ47spE+a4TaWq+RcaL6?=
 =?us-ascii?Q?Gwo89eP4oHnPMOEKDY5F8kB452IPM2cGBUd2TEramlx2kKb5Y6CBzElR7qy8?=
 =?us-ascii?Q?KYlCNrvtzBvYJ/OG183N/yS9WjzxM9RaHZugaHjm0waVdiBwmFg6bPSrTbNv?=
 =?us-ascii?Q?rqI+J3xoFb17loyhJBn0lLdfbCRI3gyjASewykcga0emU7t32WY92QGWMegl?=
 =?us-ascii?Q?ScdI8ehz2UBYhCaJmS9TVPwcAeByemPEEoKHyE3hvFx3QNww4fKcSTE5GUwr?=
 =?us-ascii?Q?wHee5vulQCk/MVpB88AehjufIkUO5A3EesxXx8st+2XqeFw4+3GSbaet7qj1?=
 =?us-ascii?Q?5EbvixKS9iIS6aaFHj0rdQxFpPcKlkdRN42qNk5Vlez2STVsVMw3nfoH2q4b?=
 =?us-ascii?Q?xTZs2oXyk5hvAPOyV6PIsUNWE5t/0Rh2sCbXQPGjiyzBjDUJ/7qVnDkW/tG6?=
 =?us-ascii?Q?kWgAPEjx8EdnI22l5IEY53h72indpLyAUBbEQS1Ya4eJoJTbxjwnoK7eT/Bw?=
 =?us-ascii?Q?naGjxgH+nD6y0IPHTJM3vBrX5yzH75Oz+H1XZeaDa/2L7UI6ueYwAvgdHauA?=
 =?us-ascii?Q?WCPN668Np95scDeC9MaIKQaNauF14L5k6dQJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4UbyJHC3yQzMUIXBll9wD5XEHovTBdAm2jgbgZR0znLfOozzcL3GIYrK4CIA?=
 =?us-ascii?Q?y1KiPw549jWq4oZJFul0EqicITMKg30RJuq/ONsJGWuOCu+bueA7swVKOtxR?=
 =?us-ascii?Q?/Wc/blEV8T4O5ididLqQ39zdQWWxscgtA3iZ6ne4huwrfORofojfhCvb8Zor?=
 =?us-ascii?Q?cIQdFORBdgC3kC/AtvIbqserDGp+/J1+Ug+94Cpwym+HO75KpmgHVCYBuHE3?=
 =?us-ascii?Q?JvRcr2FjP2sosl5RDC22fk2zkDR+9tU6DdA3z1KOZWUcQzG/+CD9L4CBXyo5?=
 =?us-ascii?Q?tiRY7+3ycZldKCuZwwew9O/pOKP86BMjbFUsKx8R2pTFrcwOrciWOTeLF27M?=
 =?us-ascii?Q?nFEWB5WAQ88xIre1rwwCi2g/KM/k5l7Lnksil3mxLByPcpTJsHG8PMYNO+IO?=
 =?us-ascii?Q?0OzeMH+PZuurLGIXD+Xl8srHMSNe0yY15wI4higw14XR//aChR9bGNfp0/Ov?=
 =?us-ascii?Q?ElOr6sDVaIBMspfKx4RN4WleT7dWdwbcAVaHXFv6f5/L+pFByjFlPJ6H+EHi?=
 =?us-ascii?Q?XDRLCgyorGvje914HLO86EBJam/7aLiW0TMb8KIQf5YJGNSrbo827KKUD8AH?=
 =?us-ascii?Q?TVpxMBdfyBlLTRl+PkvPMsWAGsmtBe5Lo0XeMtzf8I7D+XEdwUm9w2L0Y84P?=
 =?us-ascii?Q?dsCkHgzLzxjxs54e4vuMij5I5jmHUPf6FpSWgHxUY5ajwRyBlzvlVIv/O0+C?=
 =?us-ascii?Q?jHIPMypbiS+bo9TIULrpHyHHCUF6kjwKQkhOQPy11KLi/AOOhr3Ft+cJOVIB?=
 =?us-ascii?Q?k16x2Tr0stxuGXoToWf96ypZLe0lhKW/wmgN+kIoTiZf8TKA4eUj8ugYuu+j?=
 =?us-ascii?Q?S3cO3qxR7xKbsJgg1aMZTrd1Vx3zt4yECaZlv/+G2ljYgT48r5kq7h6gztOT?=
 =?us-ascii?Q?iv7kmstLjDpVArbQskVMtwVC6T2W9HZ0PiSNoa/oRaB3DbmOZvqJn4o8Sr9L?=
 =?us-ascii?Q?bxfsGWVXIlnqibL0d84aFN43E/Z0cBmwW3Pk4pmzuA56xMsOPejUAdrrs866?=
 =?us-ascii?Q?zfbY9El+UokluZ1IwGRg8wWaIpdKL2C10Gz0VqeqmmtiDGglDBqXEuzT+tyE?=
 =?us-ascii?Q?M2yS7N1m1ke+YE074J+pScNj7j/dr5OFsugrSveZhPSW7MO0yJ1uml2owkf8?=
 =?us-ascii?Q?rPVruQTn1V19BYgGkzhofnXwTAzLRZNAh81/b7hw28ZV6K97KmtJzhcoVWLT?=
 =?us-ascii?Q?pEtO+3mDHDn6n2rkPF6GIUHU+ojstDte01StAriSCwwNmN5CMHKwtEqyhJmx?=
 =?us-ascii?Q?cTbwVue+YmWDgY4H4vqK+eBP2Lv/+1q60oz0/QNLDdNnP8oZsdv/rbHJneDT?=
 =?us-ascii?Q?AKzHdf7tKeQZbBop7NlsqQBPsMTFQu7Tqc6aHZa9aTX+j54ROVQjR8MM6jOL?=
 =?us-ascii?Q?jskKVvqCaeUaaypxBYF5Sl6ql0+Qb8NCYWzdhzJmXufFQWofdP2OV90ToDnU?=
 =?us-ascii?Q?25UdVSuXXgKnLsf1/ittye4cbfVHcBLkMCqLP6g9jGjW96ZvjYMO9cndY5ub?=
 =?us-ascii?Q?SDeq5vvBuxO7vjXbQ9NkI+nf8S/wNgEp1d1XJPOOeLaczpoWPxsAsQ2uYfwW?=
 =?us-ascii?Q?xSrgrWyMWerEf57HOF8bLi/rRnDhBG9v3vEAs9KLaB5gdPx/mpxF4ifEtwRb?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 63486cc1-3343-4199-ffe4-08de362429bd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:36:48.2925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8Bl2oHriGX831fRUYWFrR7g5Hc2DgUHWRqhsOSX0S/53pHOtfUCM3+31WgFf6+zSy02k0VrA1QaQ9qJxnD/SGbOVI2KZYqcsbsXufa5cUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_223655_415776_214E199F 
X-CRM114-Status: UNSURE (   8.87  )
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


