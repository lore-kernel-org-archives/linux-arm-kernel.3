Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B385DCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Taczx4EuxBhk6tbPphLZ4zBmKXAIBhM8RCEuArAq+Wg=; b=etdpD4W+rzARSGHhD7ipcjZOY4
	W2l3Xe2KDOpxUBoaGXuIXkQFm5mTT3tSaow1GgmUfyROjHY6VVxlrzihPZnmrZS6Np9o0wFjceEn5
	RiHEYi1twaSSVk0n59ZG19QJzrYcDcFUlFqy16CurRA5UNHAK4KYs47KygMeS7tMx2n3jNdtOX/kp
	Jeh0qzDqqfNhN6Rr3SHQXCx0y9DVnRlSh5wE5LPMMV1X9OL8hnDKdUT/nXahguR38AoHXJs3l9Bzy
	nG17JRJglmY5lOQcn+5JODKbSy68Ib54twshc9DFgfQ2qvTLpnb2JlxxHehM3BijnNeA7AHVK6g0D
	e3k2QXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBK0m-00000001mZj-3ODC;
	Mon, 28 Sep 2026 22:39:52 +0000
Received: from mail-northeuropeazon11010008.outbound.protection.outlook.com ([52.101.84.8] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzg-00000001lmp-3yEP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/USXO4f+NMKbfgygAn2CTrBFUZ2Xneg4O3JqUI/JuphyKG0T55DUI0fqwfDooqEF8X3o+jT331UqJI4XxXArpTRyAR+DyunN+2A988VQofhqyc/scFh+bE6fuhYN1IV2xx/pjfs7Dn3d1aUE3CCNzRV3qRw0w++d2Ci0UyA0fq1mSCxFx1Pr7WaC7k/CTTe2AQUVxwRXkIuesx9B0TqKz+Yr1cxFMhFkEcGYQD/QHfSyv9qR5ie2AfQ4SewElBhz4PWbdMJ0bVZQ/QIZQaCXM5PqYYYKQdjTB5Ds9UbbTpvwoQ9NakjFmtYexTEw3eialk7m6SnlbTOOhuKuxZ3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Taczx4EuxBhk6tbPphLZ4zBmKXAIBhM8RCEuArAq+Wg=;
 b=X3N6kh4MzELLBOiecr2H1Id3y3VYvWSDpKgFfLBzANOfqUvdNCpoqYP/Cz5+QknW6TldFD0t9O1VaUJ7jzZa1RLikLciU1wAbXhToVEjgTm0jxVGtUyHVmjn024uYkbIjIPviwYCacJ614XMDrZITbNI97oiuORtRTJWebaZAhr8cyTS4BwSMtFTuB0x2wsMRlMJYh5T3tcF561+T9ijUfde42+hji7+maI+YaCkPPUuvo9DYsik0V8GidHAhL/XjQaizIWxEvZ7dgO5lF7EdxGEHDQ3jQFZk6bXDq25FjFzfrc0+zGfog4JjHMOj+KXeKSG7TyARzQHfuGeEfcmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Taczx4EuxBhk6tbPphLZ4zBmKXAIBhM8RCEuArAq+Wg=;
 b=M9IHvQfG1AVm5TGW0wfQVxiXGWrrdkZE/LTOAMLCktigC0StsIEXFqBd8OWWTzkgtOX3QXG3yhrp07pwoRjRmAIE+WjJHrNHyCAVzuV4DwPDJTvqVDO9D8mTMXhX4d6ugscm2qnPQGovjqwZQPQRRnuYUKzJq1NYfUw4PPk7Hto=
Received: from DU2PR04CA0352.eurprd04.prod.outlook.com (2603:10a6:10:2b4::23)
 by DB5PR02MB10216.eurprd02.prod.outlook.com (2603:10a6:10:4a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:40 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::77) by DU2PR04CA0352.outlook.office365.com
 (2603:10a6:10:2b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:40 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:28 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Peter Griffin <peter.griffin@linaro.org>, =?utf-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 16/16] arm64: dts: exynos: gs101: Add space before line
 comments
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <2134325f4cc601585513ee5f95fc9ef2666064cd.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:27 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|DB5PR02MB10216:EE_
X-MS-Office365-Filtering-Correlation-Id: 333f6f43-fa99-440d-398f-08df1db13e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|23010399003|260925021311599003|260925021911599003|56012099006|260925022911599003|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VzS/5knCQUE4htXPFFHe3PtRyNCS4j3pprQVhWe8vpZm4jyhdYIAFkU5LJENZT1DGhaClX4a2ZckWFVEeXjqQMyoO4YuDBVY1x+tRFjA9YqHz+RJJ2ApxWLun9LW428LFqnUHbIThqufor8ZI1ucsli7tBeXwhQNGpr6QyB4wgVbReSpVIQEh1lA/2xU5h/x1UNfb2jYyTXXR8+YE7R1TAuzwKrkOZZp+pr0flOlS3mp4x9p1kek6jR09+s/xrxzTag65pAIywHYKINwl2AvtMNnwZOyhy5M183c4l9SDzyzjD66D9q1F68BLZBSzq76/yCjOOWz6+oAoGb+2bCvToKk55gHNEBEvUXqgYwd+wV/MAjWyh6AkTt986qBmQKA7zveKKWeazrUN+/THWaRGF8PlLaBOGhmNoX0sfD+D09MDotsGJdctfWnCXxHTK8S7trjj8Ut96fFA16yaGz5DH0+Ntk1UATuX8aYDEmBUgbQSiCOmiGevM9LTsJAvPnFg9mJnUYTbYjUxy2oiQCGWgQuUkuIUhBar4wS3R545afzTYI4bNuD/ALJUhCShP11FwGLSHPxY7aQn4LxUhsp1m5wl8bovCMNsMtLwEw9ASd29AhFpm44BpCdfhC57VCz++2s/dfI4R6IUJu9pRFV/EsHeLDW9qnS3MyaKuqMIlC0JFj3knT156LKXzT7XC+o
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tyTLmSLFPeXX9zR7Xegrq+QOPkkq71l9+fMnx7Sr/zb+2yBVn6pGzBnJgk+b7WjoV0PF9g2BvA2d4YGf/fSumQsiFgH8c+DslO2g6/bMTdZYnX8pZdUBpVZXtxQObox6IBgQ2W3f0vlNX2Vw0/KYV9J47aLSh0RAy9ot8n2YX7vr60LXaKWDz/MxY/MU4md/Qi3Gy0CZcq3X5+xdFG2ORmaSwNpTQaEZu8O1nY/aiQ6133Etksn3XJHwErc1i50Wc6knRv6E+WPi8EHRuVIV/Z6C7dKsOnwbwflIpAfRpv8WuEjBTaaNOc6IRJ7zwmuz6YtSGa16alWg9MU+gza2Ybrf2uNLp6/ueT/rQ2uOlggPt8N2Z/PsbTFtLnEdehJCZkGi1rbW1nfsG2WaKDJ0Tm6Y6zwyiUIah5cOgA2Lo9+wVficKaMrxWjTTazVUJij
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:40.0050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333f6f43-fa99-440d-398f-08df1db13e57
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153845_041359_42AF8BDE 
X-CRM114-Status: GOOD (  10.13  )
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

There should be a space before start of comment delimiter. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index b67d98ff99fc4..1af8087838467 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -661,7 +661,7 @@ gic: interrupt-controller@10400000 {
 			#interrupt-cells = <4>;
 			interrupt-controller;
 			reg = <0x10400000 0x10000>, /* GICD */
-			      <0x10440000 0x100000>;/* GICR * 8 */
+			      <0x10440000 0x100000>; /* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 
 			ppi-partitions {
-- 
2.43.0


