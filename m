Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0293BCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Du1ON2cn/gA5rG1J/LCA3a0N7IBbDdNX/e5FSwy4JU=; b=FeRO46dBHWtyEtXef5L/Sql2av
	EoC734LvjqHOmOXDMmfgK5HMwCvZm2ZFuuNewzAq9Y/29+JDIwlE0QlBzIz7oxa4mAi/VISigIVSU
	hMSCbxLYpDF1pFAeDZq0YkPRufd+qQHFoqonH7M8ZKk8guGTHK3XJcGT3o7TOvxtXNpL7QwScll5D
	ls2lwjwVRP8jV3L+4ku4vq0qkNhuqRpQNn5xFgLskq7CtaZjeQNMGLkxek3+JHABb/jDqqIOUxkvS
	6sVbP3/j1NikdlCZdLywk7ZBxHapnCSOkKrpEDR5dNP8gZYlUYyq9vsrvS4QkKV25+zGm6NWfnSEu
	md3rat8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJze-00000001llD-2GI4;
	Mon, 28 Sep 2026 22:38:42 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzY-00000001ldl-1aBS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViL1QPeUckwN4+FOoZiaU9DhOKhBa31lrqQuMPHowZrkN6MhyfxeZmgcI33ZSY5pMZata4DkfVdiJWNs/0QOWFbG8OJbgW+QFXazRSR8xU6x73XRqcbtaIUA/hYgxkdo1YdUDCARBOo/GUxe0/ukyXxz1yPQzhid2ksN1Gq8eFmbs5LojgosaUYO4XTJKMiXFhkhRFqzNUmOscoD5gGpjA6bs3g5lPJuWLbgYYtQ2inWfH1xl/V4/5hKRhNhCA8WFJzBHnC/chPzb60p4tFJ68yqd+JkkUPo5Bdlz6ypRAgTSarENArcQ2nZ6SVMt0bmhu66YYAZjqJhYTYg5nMbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Du1ON2cn/gA5rG1J/LCA3a0N7IBbDdNX/e5FSwy4JU=;
 b=w0wTS2EjxfmelRs5+bZQLt0sT4lL7VtcCz6PXXA6Fl29pSGzHiLw8smtVNyzHuJh+DRFQaZjQZICSuyZ+Y0ttDsz6k5zaBRuztJv8kl/SMaof1DW/dc0FHjcbqcclSGynzo/o48XHf0ZKjKOBONgECSaAYaDB/OazvMtm1Az/Al1Nz8uz3/mbI9bAdpHwTjtxcV3ykloot51d3h/g3T3DtZSKAEdxhd74V9O8nf3hHpQ5vWYAGfnmv1X3IhwgyAfF8Z2/zvHbsTITuFIeTwFDsOEWAmDhGhr31P8eHIrmZh3psQSofuf7i55qFpPEn9iNUctTvIUGQDFd8nt07olkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Du1ON2cn/gA5rG1J/LCA3a0N7IBbDdNX/e5FSwy4JU=;
 b=T+zRt2j5z5Odr363OyHxqNuXIw0vuiFcQYxf5ljs8iF9V49YCmj4Lqp1oOhseTScVy/Tvq4gJUEZZB0UYqmuheQYItYPfD7QncHUHGaxfoSMCV7IeSpRuijFNxTpLF0zClFCLAZBOt7+eWFRT5yK8mmDHQHQ8iViwHyqmNSzLE8=
Received: from DB9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:10:1db::26)
 by GV1PR02MB8809.eurprd02.prod.outlook.com (2603:10a6:150:89::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 22:38:29 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::6) by DB9PR06CA0021.outlook.office365.com
 (2603:10a6:10:1db::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:28 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:21 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 09/16] arm64: dts: exynos8850: Add missing space in compatible
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <5e580526e283d90c2b4c13ef5bc0633fd20e41a5.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:20 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|GV1PR02MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 450d2942-6236-4a1f-c57b-08df1db13790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|30052699003|1800799024|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VIq7zx+JZ4BFs6qn9lB4pGRyW5hy/bs+rSlgehtAhSUez8DWCVBJAt56tUogJlB8GSiBLTWUZ8L4FRznUCPfYZcBjDST3dXHF+bsjwK7e7iYaWsKr3gPMz5Q/p6cGQr/7kJNyWeNZNeZGOaNCDzMeVUp/Gw656omO+y06h17c0/kFSaTURitYU0ZzuDp3tS0SlZdXWkyD1W0hfuQNkzkxUIl+0YB0xcdlCDgX8Z86Jb7NSC5lyN5jhZhEQd3fS1KO7ImA6Y47MVJJZIrk0qyQCpPeiGFFwMMl5v/2qjVR7kbUjIrgiFLGKQ46ur33cmBk+ENcz+CG/6Swg6fvQT4xy7j9IDmXx+KUr+ubdktH7U2ORsiizHW7bA/JxlK9doHjoVm6a6tR02rF9ljxveXJUk2aYi2g9Mw+YxLjRk8VLPRmK4D4gm8WMqEYQSim5jtJuo2KtytvEfq15Ic3Q3GL8JiP1l/vdtr0i4NlVVRb13Pe5cLLjFlBXpKLs+8y1fUbjvH3rgO/hYPDeWnCg73fy3BN+RiXiBZmuay6+Zz6rK6/gmfL3w2LWVqD3eSI+OVeWWkeRWnIqX3HK9RNdtXCkeb9a+seU5SMOx3bemMI45bBmXBLv+FHkmPmTN1zLDt3Kl2EFCDbE7yWj2dlrB69R6lme81kfzLf1NbVd/b4u7e8+D196WWbGyLORFIVYoLZgZVj4/dWt6EmlU2o1eT8g==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XQ5vEN2aFUWvLLVr1LQLFET7V5KlDq2UxemFdmk47TVyqGz2OOwKg8VIKhlc2XUrLUKUvdVeJkMhWnnhGN40bivlRmw0UdUALpvltZuayp4Gm4uqWXECrEAXtqnBTyP60SdUJtM5mdNVtGDEZ4MH3MXERDxjc4FuqNTs5BflTG7jtIVCRE3wI5S5furpS13N1YykeAr9K7NMQsnFBmyrYN9XxmSHFyhGF3OMTODDkGj1hLHfeJZp6z2XVbkBx7HEfx5k6T8VZvGzxyjOfh6acfnJIN3fOK6Fb3H4gPbsPlL8xAACy3YVF/l51xp4yEcXK/GaU13mft9AUJdaLCS1++VHc3WCp6gOZtkKc01asaKC2ZbNV8F+Pj4u9rPtD+oqH5freapxHDHehhJXEGRDCrNNISJNBQN8qYn3hqU5v/HQteCymS7phkXGLGwOPP0K
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:28.7556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450d2942-6236-4a1f-c57b-08df1db13790
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153836_420859_F56F3599 
X-CRM114-Status: GOOD (  10.20  )
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

Tabs should be a space between multiple property data. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
index e74ff8a1bbcf6..ec6db81536a4e 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
@@ -14,7 +14,7 @@
 
 / {
 	model = "Samsung Exynos8855 SMDK board";
-	compatible = "samsung,exynos8855-smdk","samsung,exynos8855";
+	compatible = "samsung,exynos8855-smdk", "samsung,exynos8855";
 
 	chosen {
 	};
-- 
2.43.0


