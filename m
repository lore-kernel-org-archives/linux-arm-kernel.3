Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3FC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DlCBjrdcADEXb4al8UUYd6WZ5E6onWIqiEyimnlQY=; b=rNXpR81lXcpt/2LVZtplW004E0
	no1l9aRVLlSd09tn5BiIGyLmXmDBIVRZEn5gLNGyK79vAzGNrelyex4MxZ9P4Y2OVmmFyFZ7lPPwC
	vSXsvkvrx3XM5U0C+XVFnfyWKZ2E7UbnIzJ64KH/nxCb+9sjZRpZ4r1eFhId3r2yBOLLiKfv58VA/
	vjpa9DLOKd2YS6oZJyna8HDFoYBgZoDNXNM2N0gG8Lnww0hiCxJAdxla+yWK+d0TU7xNThyzseouy
	YL2RlGHrXHr6a/kTxxbXN5VKtVodEMA4jEQ3XuitU6CqO3Fp9bFqqQghinIo61FL4IgJixC1AYLrH
	eVVMieGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS3N-0000000DoRk-08A6;
	Fri, 21 Aug 2026 16:25:13 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS1q-0000000DnbN-3bQH;
	Fri, 21 Aug 2026 16:23:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHYMFEzkmV4qQzoDYtoPUXyUUzVBt4ulvtcOa2UBMm3jyNqMclGWXJ7APHSN6zZGzCCAQLwoiJknGIxwJcBoKNKB4afrnUYbtKpu9/PHVBnj3FqA8uVp1vXR5NEpIbL8OuLvq4S5otYX6j826FDy4n0OYbkuKh66fPVLN8pmgGc+AvLz/VYYcHHNuZ9fvpOnyutOh255AstfZrHIEggbrCM0Oe+G0dFSn5IuIibkYvN2xzPBEF2i6VK0TAKZ3ZAreD1vu7YmL39CPVOKkb8j7bUMNWvSbstFhsQB1gY29NNpqtnFgq2sRLWq+sRoZ873kzd+2EvoEfmFjs81O6kDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0DlCBjrdcADEXb4al8UUYd6WZ5E6onWIqiEyimnlQY=;
 b=S8r6N0ZcrSXhnEtzVRl7tw7P18bK5OWWS5wk4O3Q+BVIxjLq+8htaFJgjL71PTPBdaPm3t81pq0AdG1FlyuCc1wjVXGxAwoEHIQNKp5VkiVjmr0B76CNkq//Yiw689I/hEI75ACVfc+/uFZoxuNOrUnBEFx7LY8YzZIpGHtNGApruiIji3OC45mjRi0LJK0RFjQvFcIcQMOh7bmy7zGt+59z2lDPa/+QUQ6lfMmXiX2jjEk0WZCAJnPwJl3iIsH3/WmQAo8ChhLj9/St9VoC0LGX7PFfuFOwezAMTBz+rKRpKpEJ+EcCabwqAAPX2urk0icNCP6CUpC6Fw/wD3Dtvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0DlCBjrdcADEXb4al8UUYd6WZ5E6onWIqiEyimnlQY=;
 b=BAhN0AlxXe0058T22T/KV5SP8sw0eDx4lENnu6jltNfVvhSQI6JwP+3RbW7NA0Tp6DDJLZVFmFeayYdq0Sdes0ULGldKoqJdTTa/ZPr/C6+PRZtS/waGggX2BRLRtu0L29BvYEx/DKAtW+YK4mLCjNcp+NLfbnRBlaPUdzLK78XtmIyeun6MGZrSCpfW/yIKHkvlSBBvXrsutZkEp4Q/X/UORujcFYC36LuyusM9NmBl3Nh/axQDeYYvI5oPyRN2Df/w7T2q0m8w10J9R9ebjCNbcVFjVBNSwKG/hjpMmwvGX8kDjmnsEld1ueQQUyp3RlX5E2ONPyFsVSN8fpdwpw==
Received: from AM0PR10CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::25)
 by VI0PR10MB9054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:239::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:33 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:20b:150:cafe::1d) by AM0PR10CA0045.outlook.office365.com
 (2603:10a6:20b:150::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 16:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:32 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:32 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:21 +0200
Subject: [PATCH 10/16] arm64: dts: st: add tcpp pinctrl entries for
 stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-10-c5e27cbc0795@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Marek Vasut <marex@nabladev.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev
	<pankaj.dev@st.com>, Marek Vasut <marex@nabladev.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|VI0PR10MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc9babf-604e-46e5-f510-08deffa08b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|7416014|36860700016|1800799024|10067099003|11063799006|56012099006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +aJ50Vpq/HlMoGxl1vK+AZaaFI1EfsL2KbssdBPsPCo+Vg0OXzgq/iJkf4jfOnqPBBpQRFj4d56IE8V2FHjG0woCu14/BIfh2T0gk7RCFFEuCUYhReYLOg7Gu9GO8bR6L9szKuN2NY90+Nh9eX8FBLLMuv2x1FJP1H9IQ9FTmo9YR/C2mG1VQ7P+E/zeo8YDZh3nnI/3NYn8R8gqhF7Vtf1sEUkRjEWDjIPMH54tC9GYFNwQ1raNZaHoDavDgpff5UcK8pk/hewsqclBp1ibu8d+kvhF+qSPqVr/Rtuh7GkiPCmqiuxAKETvRpV7wQkd/iyEKQJUp1Zu6mubHhUWVrJgR1uU9MmTHtdkid+zljt5s3zbyuqfSRSjUNpOK3Dg+fViSyUDdao8o80tp0V+uLferZMDQs/SF/HcXb0KmClhDOeboKPQ7EzAmWtmnx6Ut5KSL3ExcUXlugeJhtxq/CsMktMcFb50sVT12YKPu19S2FkBH5/yTc6spsEqTkcMRceo13RfmqN39T9TwONwsVb4x+II8Zz809ve3DX6pWReJFSSBnLeA0E898ZAMVmMHiXElSXtxN+GvLMeZDgoVOtH74DaqCfCG0FRaI+XD5A1WJpMOSaQDVjXHwpI7tjmn0axrMOYWJI3gwjmdk6yTsB8k2Dj4Urc81lKT5wAHYftq/hEZsSdRr4sXUvQ5r3i1UvhYC+T8kzU6rffRtc1jzTd0xGbX0/PDx5ks01+73og/aoGg401UprkoYmPwDcn
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(7416014)(36860700016)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sUwTZd37R7lUaLZMPAwdAcb2/ANmVcF2kemY0mrXrFh0WYxOAYh6iXIfqwP2Xg+XQty+rDqMZPnymO/G0nWujZaLLzlqHO3KqzeIt8bYQ+fLK8N39vacz9/bwKcH8hkZhxSjuu3VUL+VJGKky2XFT9EY2dLm/bQayTj4vYva0M3L0cWDqVtCB/WnXBtWJzMhES3U+8+OK5ngS3bIXPfD8OTtqUpzioFaUoT0DSNBum9xTaj8kB0xIGUDVbWUEUqWensKt4sxIa+2nBKpaBt7dbwzHqhYROs9p7nWRQNkfSx2nWC2iPq4zB/M2OVoaro0VFWUx6Bo7gY1w+kvMAQEzkj6BFuCmC/THWc0B+EjGdN4RH3auW9r2ilT1e+x0HnKehCmU0/6II6XiSUBpaZiqjYMzrwCTOCGoU0Mcs4VjcjVpPGLn6XVSHu5HQoXXWEC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:32.9773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc9babf-604e-46e5-f510-08deffa08b5a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_092338_924704_14057220 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Christian Bruel <christian.bruel@foss.st.com>

Add pinctrl entries related to TCPP03 GPIO in stm32mp25-pinctrl.dtsi

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index f97ce299d6aa..85d94973bc4a 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -474,6 +474,14 @@ pins1 {
 		};
 	};
 
+	/omit-if-no-ref/
+	tcpp_flgn_pins_a: tcpp-flgn-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 1, GPIO)>;
+			bias-pull-up;
+		};
+	};
+
 	/omit-if-no-ref/
 	tim10_counter_pins_a: tim10-counter-0 {
 		pins {

-- 
2.43.0


