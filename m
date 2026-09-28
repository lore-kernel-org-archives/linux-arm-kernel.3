Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077F8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pacV1dOEGAGQ+xJmsjAi73AxmOV0G4uV3H4IbfsDMxg=; b=JSfDS8D5cbyp93t6YeWSOD5g2L
	rFElfbyXJqnZ6F1aHECV7Tf97BYujgiZML3A7hvxVf3mCNLf5ZcQbuLoiNcIKctFsctPU0Q/3KeZU
	iGqYy5Ruv/kFaquyTIe6I2StHsG1A1bYO1J4/AykMeKYPqk4T7eraVW234N09/CeiT0xnN86ZCsIg
	5cYHgH5GNjKJbRq8TS09KKJKm1FSFokpRssOjna1hsxSB7BO6kLsGVKHisygHqJCllQ/2xN8CA6i+
	E5EInj7l+JBm7J6hxUnVOKYEp6OPMCTyzj7dT1T/0A0t6yd/RDXgUdudrp37L87umrZSYPs7lqiXD
	jL+77uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzN-00000001lZa-3zk9;
	Mon, 28 Sep 2026 22:38:25 +0000
Received: from mail-northeuropeazon11011062.outbound.protection.outlook.com ([52.101.65.62] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzK-00000001lXx-44AW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dThWcTqFqzllyP0HBh7YP4ueaxUcyvnSwVXBiBwrl0njmfNJ9k3tzefGIuepvLkDKL4aLENBdlaj7jviMCkwj9sKzgzEufO/KEn5IWGoU3em1BOXPEV9xqaxbltfRAs5YQMYW6YeU6iMpClfUWvFRbeRhi7a7xQcU+p7moB1VQxQqrzlRUu5AF32Y/jLtulespwjuaTyPWX1aH1O1zJ38Ip+hSF1/l0XOkNzVshKTuO22qDVdW4MmdCaWgdNjdtq2pVWKjt9aDK3ylEISwNFJgSPmnyvLU292Yuw8PPbxFS+u/NTqVypnKNawWZYGLlMH4O0FLFdRfK6YQG3DJp5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pacV1dOEGAGQ+xJmsjAi73AxmOV0G4uV3H4IbfsDMxg=;
 b=JSZgKVsD0ezHUgbOfzWHt0sPblyTVhx0yejfO/g1RTZuCq8Mc83AFC9b+NP9Q99tjorxNIGgPXFaB9nX2OwCwTO7DvUc79UbcbktVPWzm/HwQ8kqB8wbQhFxklvJ2SubhYymiyZCaViHCXWSfobuJ1rh4a9xUZPQ3p09WiHcLI3RgKQFP8xeUiZYv1LGUOeGXLg8zGlxY/pg8FXkAqGvYd0qCytdBu9e1sa7+yclantyDU6nVI511njc1LBwUfm5d0R3msHZyYV+HdYwFyMTr/FkAV8xZiglkuujAqOBL6kjd2VSWUuSDRODLgXPdynKaEbno6XvRgvS9QnFwIAfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pacV1dOEGAGQ+xJmsjAi73AxmOV0G4uV3H4IbfsDMxg=;
 b=ZqcNJPoiKyA9fYatA+CdIe8UDawns/+lPS6mxT6iQu3smCw9ub+uphcuZxXL1odK9Pb3gbya8qQ+T2J8mcqpGFx+bs3ad+Ppk0kIax4m9A/PhTuW9DfeVcUqMN/F+CK6Zh9zl36nz0zLiDRq9C6wcMZ9p2MdTlE0uLkReb+lTR4=
Received: from DB9PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:10:1db::9)
 by DB9PR02MB7178.eurprd02.prod.outlook.com (2603:10a6:10:248::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:17 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::1) by DB9PR06CA0004.outlook.office365.com
 (2603:10a6:10:1db::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:17 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:13 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 02/16] arm64: dts: exynos5433: Use tabs for indentation
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <570cec29c898348be764392da9e06d420401297f.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:13 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|DB9PR02MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a98fb0-ac53-4632-f439-08df1db130b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|260925021311599003|260925021911599003|260925022911599003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +NnRqjvkx8kT1/K411ydl7ckej6enWuBUMAzQ1IYLDFuT9VJcJ0QJCnlsbhobq3yOANtXU5ec8oBj+Iid8Xnu+RzvY1li533xT1GZWGepcd4nu5rYcl4pO5K/Gnxb5VogiRfirokpsfPETK0JMC6qnM6r6LJr8cDYzIGy3x0eRadgmOX2zelIKhRMRgjKpGxsYEld1byB0Gb4bCV9RtXaVda27UYPUFCLFOzA3bECDr1aTJ9wk7ZJLkTqOQDckGF54bUVKDO22+juOsyazfBRO3gazTu6efvkd3BsvNgcMfre+x/BHHKBK4Yhd5n6c25yq8/gWj8Fvpn2BcEvqnyIgIRhEeOGexKNhFSQI+mp7Kodxt0t5BjW5spplZzfEecXtapyZpyGgyvIw+cl7clFLU80M7CnbKIHMFyaisuyjqlcrzHLSQSvmoUZKDrVWoc/5KI0zk2ZPUt+P5ZcOjSzcQTxye5lBBJgGtR6mAMGGCwOI3/q12Uq0DtrFhJ2mZEISeO5TnIc06DCgUfLLEFKuTERB8jKT4xVsXu+qIKQGy5KOEWiNAe7yG66mlNnrSi6qotrJQpvsecbo/sWjdAD+1kwmCc/KH1evLZ8Rts2ylJ9txCaD+Cxx3QG8iOQMN66/9rrpzccVNleqnNCHV1CllG/kWH2uJWeAbuEWZruDRdXtXSxQ3jPnjUMz1cn3VQxFX6HO0yf0EXzhlVUMOtig==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GNh/i0wawNXY4UzTKqpDEw1XxlpiSv18g0iONC9LO0enbJaLXNyu8sQMEhqXOJahZyZ9H5Gck7fvkjmRVF3pCkAcBz8um9WlQ0uRD/OvaT+RqCCBW4ONCcyfMNWSHDH4ksn81HLoqhdp3b0ELRsnNOz7XZI/SeA725893wScS331EOCITOqlDbvyfIFDwTqzl2sqynmXSHrYbSNkqz6DyFqHhxbDZihsxjUTUeXLeGu/ws7SEpuuyLnU58NVUXEOO6A7xLtkP1ZoLYHa+Kbs6y/NawyGUm+Bk0nQT1Bg63F/qAv1Ak3WBT8VDoDIUGe6Vmdt16Mx8leKd+iEn+LrW/kLKMZH8K4runzgO+8IPuuoVHWEdmSbSahxxRFsyyCYwaoVek0liw7NebhdUNKUTt9c+Ni7uyd2I6WiRKZkE2SGRL3KMlm7in1MYwQsvunn
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:17.2488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a98fb0-ac53-4632-f439-08df1db130b5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153823_012370_06EF40FD 
X-CRM114-Status: GOOD (  10.47  )
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

Tabs should be used instead of whitespace for indentation. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 0ad02a098765d..4f3124069849d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1064,8 +1064,8 @@ &ppmu_d1_general {
 
 	events {
 		ppmu_event0_d1_general: ppmu-event0-d1-general {
-		       event-name = "ppmu-event0-d1-general";
-	       };
+			event-name = "ppmu-event0-d1-general";
+		};
 	};
 };
 
-- 
2.43.0


