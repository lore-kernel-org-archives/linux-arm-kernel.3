Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A0DCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLyeI1YyaiLRHWiV/agxA4HOxcKtrVcJ48UcZJT/KPg=; b=Co70kj0n0Zh1oPQHg8P8mWwda5
	iYey0UvAER/2MlhTv2LeUD0X8N73VatgJ5CBQ0cvE1tZKClC3FdOR0DScFnqDT7tBuFVXt8I5N4kL
	qEzEuFVKp5edpA0i9xsy+LJVrsHchXFO5u2vdpCHTFqiuTsohPW4eeSGcTU1WEuSsLO23OtbrZ8Q7
	ybP7uj88uOvFhTnbpV7VdCqY56bB/vbD1nPp80f2+xhbP+04m1e8TiV2qY9UL8c6Tip5kNrtWEwIT
	uoIKhsOJSlZjSizEQKmWSuC8sEu3DElegBo96oeOLSrVN9DDSum0RXaY6VAI3CffnERzayWstFvgw
	RMd+qYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzd-00000001lhU-0ktY;
	Mon, 28 Sep 2026 22:38:41 +0000
Received: from mail-westeuropeazon11010040.outbound.protection.outlook.com ([52.101.69.40] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzM-00000001lYO-0iXk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoYC/n2lr0f75Lj72MmuTqHCQp0nh3umPs6KExasjZK/BCXrkX5i7C1hGbDgrwaWLMEHSsOvakrGftlDBlkungGbXn42JpU55fwmFNfv+GzWCR33QC/xl70LEXIzH9RNXPz7e9BfBwQaqcyYRdSsLk2hzn8B6RbNoizwmZXBw0W8aq7cxlryXUNbR15YkbX5GynLZygsLPYO2SlyEw9JheHbbg6QLYH4iA+pWg+aeABOWAmSZm82aVE75mvYcRTontXQqYZECsfr4FJJelTY/oS5b5/oWVLu7+0w7faodHY6JasJ8imx7SsNJ7LH8xUAEb9OfEbIji2qm5JgRsZ9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLyeI1YyaiLRHWiV/agxA4HOxcKtrVcJ48UcZJT/KPg=;
 b=S0Yx7cENyciygus8930LT9caAUrmksE3Ms7Hjs8GZwJalxVS4uSEElfQIkxCFNKAfU8M+PSYWFgrMldYLZNTXHSwf0KNNj7EZcbhglDE88RpLlyP5RqKKpnt+pGn2Z+vz67Tpnf0OUWpp6PJ63w24pgozCNigTL8fySIUQJ5NJXFAq0oLTExNufsB3K86Nk9inFyw46qgxnOpzegcbMpof/g2hGVTG7V8JiMVHjyJ4UjKIMPhLWQHpi9pD7NUwF/XmZq7g9tA4bcNMLh7CKDD7+RflU2Fjen6spy8Wi4UPiYXAmHvrRz3xjitutA5iefBfq3jsJZztFxstWQoMCeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLyeI1YyaiLRHWiV/agxA4HOxcKtrVcJ48UcZJT/KPg=;
 b=n9MurdeZFbG6bhhOYgt3AMCrfdEnySlfMme+cuaF6Oj+kpKXkgoIgN8tWjqh1+xHKwU9ytOWYfxTenJy7FZk0sQCxQPCAQj7nwy/6YfUto1Mbv52t4C7SolQjv2JLD2hAANVARWhB9CRM14aOnncEo4X3RjsBKYc48dhW7fhuxA=
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by MIYPR02MB12283.eurprd02.prod.outlook.com (2603:10a6:290:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 22:38:19 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::59) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:19 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:14 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 03/16] arm64: dts: exynos7: Remove empty line at end of node
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <8fa13303ff3b3d93e824cbd008f8845219962901.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:14 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|MIYPR02MB12283:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9da413-0911-422c-defe-08df1db131d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HOOF7EHft3DUJpEEcB+MYChaajuL49R7w+5z1OB0BnGLdzpTypFLlrpNgzDnXMRjl3SjODDOWclqC7B66W9i2QcYYcMKEoPr7ymORoiD8T+Exlp0o2kVCtTiaD6rAEpV6DyhYcuGs+9W4lg3pmHbiLQ+JCIOjdjk/WNcq4GGQqQzyzYqxBzOLGvLmfqm8Dzj6kfaU6KjO8py8ZPJ0IJzkKpSz4Kcu+wqjrGAAjEXi4EYnE6bQoSjtsszoe9wLVZTIz86wn9Ur/a30Fu93ypC3cVskJtcCVYxXDFzkNvBGx93DTK0fAw8V3Vh9vG74tjZGm7XRgxStO85ACc+BfN25yTUOKxakIKUGXODRDLUYFLBk232p9DgscOQTt3AxHv2IpQocVkQZBSzSdr5ghqUEzBmlBaCxAhHkkIWB/aJFeO6RXLglM9Q5BnG5dAaXS5Xtr3O44iuH4byEqGfDJpRdpYb40CTnGz18M/6Yue3a5ZdLz6XSygf20E6XUAxRd9FJgiFfd2Sdd/mt63mPdaBiIm202xTIG/+dyCZD66/6HRYjVmoAwzNXUOxTrwGdDLT/KZ917hBKFyuDFQsDk3tb2G7kmAp6tK0+uKvvM3ynkvk1wf677r3FsPywYw3xkcs619cgW+DLUWtxmo+1EQxWxTC4kgkZGdXgKtKpWzkWI+vJcL7BjcaZWNh0NKtKBsqL8zLfI0irP6LGbg70QwnPA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KtC7z7mUGVfLnCL6evIXCPfVEmG9lL0LICv907n2a84MKWFpW4UubMPBkM0j3uQ7+PA1XM2GqrToHedc1LvIGNeqKg/nPghWCXGhRLmbcP7+bftQt5qZeIcWpvgG6EwJyZLbaNNGcWMDxZKykbPUrRHFkcytLkLLCCWiEHQwiVGoQHhvrQsXdqcTOcvW0PHWOLDnbpSQ+KDkPP5X5MsflU8Vaq3XpQNzmswmxM+79lE0DrqTVr6fJ/nk9B/7d/wdFoCQpU4YKy8dPKBuMzaBdvN8yo1oGl0XGew9iiSAgK2aQSfB6c2C9u+eeFnJ1jsAx9UIjxxDYT++mrCJDNgBxkdWbvtdTFzUbpq9XdVGq7nlF7iInwjIqXC6yGUOVs0qF9c1IsY6g2tVgLlMNrv+VwEIXYVP1w64T+NFab5XvhTAzbND+e4YR42IqYrUCvXg
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:19.1631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9da413-0911-422c-defe-08df1db131d7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR02MB12283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153824_215673_72D35F19 
X-CRM114-Status: UNSURE (   8.94  )
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

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index b3d5b447aeb68..bbc5df5a1dace 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -52,7 +52,6 @@ usb3drd_boost_5v: regulator-usb3drd-boost {
 		pinctrl-0 = <&usb3drd_boost_en>;
 		enable-active-high;
 	};
-
 };
 
 &fin_pll {
-- 
2.43.0


