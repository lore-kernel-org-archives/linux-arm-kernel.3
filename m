Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02BECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0WD7KiNmciC2LKDjY64BC51rr7W6CvBAPcLYIAbNoE=; b=156MLoT62dx1P+7b6OWH09NSa+
	RpoRHOLSyU8ia7BF62I0FwT8yrl70I8VdurVRtOar4PSj0REvNwbvEakxR3kE5BH8q7PPFLyOi+xC
	hto4g5ceCxia/7uExBlRfLpn8BbC3Y+nqZiQVAFkBZ+bkBEfnvlIUltzw3IZb9uU6173bYQixPicV
	YBh/LfMKApzMmirwc6tCAlFZHbRsA/Adt3ct5wE4mJsT9wkpl60QYsH3bACPbAmYwzsn4j/fqvKQf
	NMv4gGIg+/xOTywNVm8vergb1jEQ3Wpd90LbTLXXuiWEKoxd5eqJU/+dLhb2l3lClwCQPIS3IBajV
	/eAwIr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBK0m-00000001mZV-2yv5;
	Mon, 28 Sep 2026 22:39:52 +0000
Received: from mail-westeuropeazon11011048.outbound.protection.outlook.com ([52.101.70.48] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzd-00000001lg9-24aR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTsqt+bS+L0RPC2j5wqD0w5vxR0J57PL7Y2F3ZZ0C4imVs13ZPaYKVTDj4Ynx33irrdRUXfZ5mI7vOdW48KAJky/oJZd42GDa/evSJlZj3lLsuGmMHnYoxEW9Md2p8Kh7htbID5m1MbR4EWkWM14U2DQzminTCjNYP9g9Q4gmcrKgYhoZjgnVwUlqiRBtcQ7chAcht5vkjOzf2qaVyy/XZ0OeWWUqtwQIkX4KI/ed/eKiogv46KBXfX+4zW67TPuccWAdfRR9ydC3xogV9o+l4H79/1q+FaqvixP0RD7REaqozRybz+6r9W4G9fBVt1LCHZyQllM2VquqNitv4X4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0WD7KiNmciC2LKDjY64BC51rr7W6CvBAPcLYIAbNoE=;
 b=CtF8pnMSIHNgsB4HcEmNQi7S6OykUh6iSERwAEivDHgxxi4R2wmhRMgeIKiLVFNiwpELjyjZMlUz4orcw5DzCip3Y7TCMoI2GHPFx6YoPtkTxtpt2ndfYZroWdPShvO36o58cIwcdFL7lTuDF7TcgmSJ5DG0fq1dYKI+5CI7ry6+S3jEXYVQXJu81W89qfJrFp9MRUu+i8prhTebgJmLEINlEALIL5I/oL8mplb1EViLpPAr5ggYAsx7aDpOVkC43JcBRRYJCbvKs4+TON5TyjHTjypGMmYcXtvS+IySceyyoSg55Z6zr0vUaevXLf8BY7Zq6IXJOYWUKr8Hi0Q09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0WD7KiNmciC2LKDjY64BC51rr7W6CvBAPcLYIAbNoE=;
 b=ODRPlCBzklJzYZF6noTGyj0iRIiCT1w2dccQA2fwac6wnWM/TEXrmv3dxyo+HvrvvZpJdOKL59QKGIg/FdDCbZ0oAcS032DEOIZqtsljDnddVVWoKKPEYPJzZZHE2YzADQCIRXcwRX+bQ5gakfvA7LfLx87cmbKe1YQtTM+EuFw=
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by DB4PR02MB8534.eurprd02.prod.outlook.com (2603:10a6:10:38a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:37 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::50) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:37 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:25 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 14/16] arm64: dts: exynosautov920: Remove empty line at end of
 node
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <246845529886b0f8cc2ed8237d648dd83aff70fe.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:25 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|DB4PR02MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 946d4f7c-785d-48d2-7985-08df1db13c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xL7rJfZEoHwG19YOJr1dQaie5jsJ4uV5wC51Qje/A5e+cMP+6SPtqNXQrA0nwpcRZ00p2tSXYtENMwsrJrK1gkEl71gi3SB6R9OKzTfZEE71l/aKQ09eoF5bvE7xnKjIUa1Z0YbZS1Csb5ooyNF3EjZRQUpLjnM82yNMjp5yA6WNOaY5xHMOOw3t1WztwQbLybX0iX0P37B6GTDadXfzslxiRlFE1gFweS/iN8VRuk6H6eC/7xITkqoJmXNjHCswU0SG9vB2H9M3jJx1e7i27BLqN9ADGnNk4U4kSb6uuZnm9dMwjbHnyJnMvyBeepn0YlLpDJjZN7iq1hEWg9pZBysiwsLwr14JyRIvpdJwNC2cuRnI9sCsThokBPYNsGc9bwg7Ggfh1WbftAoXvMsdg1jRWu6YftN5+2Ptl20eJSggOTK3CZbmx1vFdIzfphWlDe19VYeqFacmq3OJ0GMOz4zq3HuA+2NKzoJ+iX2hUfguChzNjkt33FVPI+tF9/K9wOrhUwMZoyfUXRJ3SxoA/WkG/5bckW+1bL8Ew4HnRg5Rw2tIsHPrcGYNhzUqhhp0sndljJpsDTDGUw7JUsdXCgB7+bwU+yAWVjeVv4Bt1LRtmtJ5SEM5FqYU9CHv8FOkcXKDyXkjG3pjjKN9dAR0vqhwoWZqXm2UBvviFyQpkAO45n/cwAaRSoZBqVH88Sw3+Sjdyo5zXLTXyZsDEEwlug==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IBP+UwlW8s9N8uV3lVkou73V30IBauS5IzW0wFMjX8YC/OZW7dF+6A+q9I2ryn+3EWXp0gjMKrwvV0eakfILx6z0jusH6IpJ4+4nrCEt2VQMDRjo9soigmNaEJ1Sfu/WXml2diRMojoxOf1HQk/ZZzG5BDQtk60Sh0Yto9BZc+6+BfH2fL+l8ho8gRInLWKUJCjQ2tQP/0qnLTAdg+SlfY208xP0cV8JpxE4zU0MqRF6aUL8LXWVxkwUOJKVIM//5Qa+MKqEC5C+J8zZ6W3n40+Q1pdyoPWc1wsIt0l4Qoq/TJOlTywPGSNgr7L4jiChJHGcr2W93UmxY7AT0OIly2mn2INMsmK9vwFLrwe4gZZnwlNt2B8a3MnhLN7B2BjpLyYUpeteJRSZG1NN1TL7X/Yf/llC9RVDu9HgvkDVRl1nun9tAEfAqPTd39TmsuNO
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:37.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 946d4f7c-785d-48d2-7985-08df1db13c8d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8534
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153841_561351_DF67B0BC 
X-CRM114-Status: UNSURE (   8.82  )
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
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index ba02fc28e42eb..65a75b18d3739 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -901,7 +901,6 @@ spi_8: spi@10980000 {
 
 				status = "disabled";
 			};
-
 		};
 
 		pwm: pwm@109b0000 {
-- 
2.43.0


