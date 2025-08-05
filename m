Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377EAC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XSdyPORcOcEQ4J3OnKiTKjN8U+AEHy1K3NzmFwwhEL0=; b=29+sFmPS7ja/G4mRB17StESMZk
	+hFqllom2dm3ztxHtj4aeIV4x4fFNeuOVqeOZnFsgXWpuEd09o6+NLvPEVFHr0xzQQHaZv4lo1KuW
	2mN2JsssFE7C7MtinQf2hBoT1BFcB21oHzpvnbzUxxR0Xlr1Upf3/TDQ5Qk9aRGkc0qXPJDadt7Ih
	T7UC/YAaSHMgGOxTI+nJalcTjseYV+rEX0ZZ1FeMlQ4xcQmV9spfJGy6FS7v/InnMVFe9OTNMUk1N
	qmZmltFVAH2Zeotl8fmnX0YMThELro4mfpe944puBJ8H9EhfVBpQVqWaeydoGPnY6nK4rAZrIK3yL
	uimk0YEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEGR-0000000CPWB-38JN;
	Tue, 05 Aug 2025 09:47:23 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujE3J-0000000CMmK-0PIM;
	Tue, 05 Aug 2025 09:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVTrqm6gav1g6hjS/bsXfylDA9nYBSujqj3LxYuMK79S44uAQR2SHVYOLLz8Ru0xdsgYAWa8SEZ1VlrN1QaTAUAJ/tydyw8toIPZBZoVycDu3T4/pxSvQ89b+9zNli2y4Vy8qlzzPhoUr/HoRzsGUxbNVXSitPLZilmOGMIYd4L2b16FrEmTmR7baFyqbNrNf5qOxLsgBlG4tm1mAcDP/oW7GtphQfCbHKXwzZQA/kL/4L+UGG68AMRzErCTQpTe2YRDgwOVzUJI/UB/mjAXIICWMR0lD4Em1luFDPUhmFKF/uU5tyxgiSSiCgFd3EGXTP57tmJourZMfT4k1kDr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSdyPORcOcEQ4J3OnKiTKjN8U+AEHy1K3NzmFwwhEL0=;
 b=CRptoBsCLTGkHC+bJX51xJBFPeLiRBcfNOKnt+3bsre7Abp1rmjJcvSkG2a9qh5aLQC5+2o3lCwQ4t0ogqUgkXtqVXE5c3psQ4wKE5D/EZiwpjnh91mnpsIwzEZ7EklChRT1pcMjyWo2IQ9Lko169+i3LUToTr0xBvMVRI02xmLg/xXhDpzCXvJRogmRdesYNGm/ymiimZ56VqXslmJMYNYmb+duBK5M5GAkYPM5WlNqEuL5ZyGzYLoQ8hiJGMTmIMbNWV6RwN6iS4Sh25dv3fg9JYe686xeL9lvbdTp3wyoEwjx9+PdnlXb9QmmTXYq7cA1pDb1HQLq90GsEoxlRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSdyPORcOcEQ4J3OnKiTKjN8U+AEHy1K3NzmFwwhEL0=;
 b=SLuNOKYK2vSPlbKnmoPd12bdwh7jcHQ7QadrvWC0Ynqasp2pPIUDSNn6d5DrOXXCqRVA3IC64Pk3ls21hTDsgif/pdo9e1TSue2p+VyQ7UZWWkhZ4RaFhu8JX//2YiDtDKjTB70Tprrdx561FQfUHah6e0ChYHm7JwtEuGKew2U=
Received: from CWLP123CA0001.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::13)
 by GV1PR02MB8260.eurprd02.prod.outlook.com (2603:10a6:150:63::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 09:33:43 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::28) by CWLP123CA0001.outlook.office365.com
 (2603:10a6:401:56::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:42 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 11:33:35 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] phy: exynos5-usbdrd: Remove error print for
 devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 5 Aug 2025 11:33:35 +0200
Message-ID: <pnd34a6m7tc.a.out@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|GV1PR02MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fe37cf-c51c-4c0d-cc47-08ddd4032b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ko80Gj1OvHB2UutXT4EkNI37WT+8cudgDTMRMl2sjqL3Is9oq1RB1YNeSUoO?=
 =?us-ascii?Q?zNV23DHMFbx0uzorPm77PjdVGLbn7g2o5H0bbuol9p2g7Itk9BTVWb4qW95A?=
 =?us-ascii?Q?tW4sRRu9+iRQctx2/Jj/mDDJzbV827xWu+devxL8PD9AgOKC8f8lR1LyFacW?=
 =?us-ascii?Q?1gEyuAKw1dyOHtFahV6fDP5jsA3ppo6QHW1YcaSJgas1OGyDIqJjy0IOMoHU?=
 =?us-ascii?Q?sq3KQdI24pU+TqZyb0A+6r55utQIG4UywGS46SFn4CIwbw/L1ky/0kzoAFWW?=
 =?us-ascii?Q?u44+cRmmNeOZBv/CDeiCMj0tyx/A/EoL0lU26PU060wGNAAshlY57tldsNIk?=
 =?us-ascii?Q?jHTrZ77YeZ8eaRQPPKAG9GNE3bk7RhSnHVu3xxyK28VuLeCBtXO/GuOYaAPP?=
 =?us-ascii?Q?KO/JSaudEJztOTp6MgCrT9581artRr9cNYZRuzkjzhA592+rnchYVPMuQagp?=
 =?us-ascii?Q?S7VNiGb/V+gPXu7DSL+GYIiUDzBq72Heg/KgaVq4ayJCpOBunOetDzPl06uC?=
 =?us-ascii?Q?eCt/Pmc6uydiPCWBF3qq8jRCmNjp/u3G8XR/ArEV/xuXF24mZtnnOqa1Z0Yw?=
 =?us-ascii?Q?Q22hDZT3snk7+ZGuToOy50/2y8GURO/t03HHIlkk4y5v3Le8PvSdJLgxaDri?=
 =?us-ascii?Q?G62YblMFivqBrhV1xoxNSclE+DnJ8m7ozE6kniA4CT34FjwlsjN5WE8TRlda?=
 =?us-ascii?Q?mHtmIl6imXKdeL9qg0hcvneOyBMe4uuYUS6ZZ2xENfVt23fH6BHiw+RDynYl?=
 =?us-ascii?Q?q773Iebv4MIJnQMzotZUv2T4d/y2P22rLUUx9++NC6a5xddcmgAnnzZAQrDL?=
 =?us-ascii?Q?yN4giA7X/OgEQYPU3i2JWv6Ex1mEy7ZGwdQnNMDcR4trIjhfeciPArsY0rYs?=
 =?us-ascii?Q?Ypi4EHmFjFM1D5BFjx3mupasXypsQfm4Y5ZoU+BoxlSoSsOm+56rNlvdOo9N?=
 =?us-ascii?Q?ux5Es0zyBeSzfYX9P19EQU3fvkoJS5n56rIUVeVr0Ssei5lX5phD8Fw8KmHE?=
 =?us-ascii?Q?0wv6inrTjLLvq5Bd8hcfmIB8bENaGXRp8/d4AuNPp35vOb4jhYRZBU7o6ewU?=
 =?us-ascii?Q?kGFp4gPOTQOFT6LXQtkLZ1mFQTv6YiIduTqNGOx3sGjRjTzgzJ5Yxmjg8kZl?=
 =?us-ascii?Q?ACaeAQPkTsh+SrmPoK0HJYwyf18OuAwwgzIvOuSgFKGofyhMSoXQKOqK0AvP?=
 =?us-ascii?Q?ahxrMSXTKpLEc9vkRf0C3m82QwQwsxk4xO0EflvxWi5TUN1L3mF89GgCn2Tb?=
 =?us-ascii?Q?qyH/y01+J+8lpPyj6xemcefhHmFUYhXsv9yx5bXaN+SoyFlL4oGd4wJ88EXS?=
 =?us-ascii?Q?nXobKabEbrq3EW4u5mztZq2m1rQ97QcKmdpTVteGXiNeojdKFq6p7WhQ6FvS?=
 =?us-ascii?Q?K5DqfafIFzQLpIYInNOORJbFw2kaLj9WUcYjQL4LlTJOjqpNBgiZzWaO+zLb?=
 =?us-ascii?Q?oeHORXCqOSDGs82JhGyJ1BbpFri89c+XDLw9SJI+twI5nNZptkaQVhEYl+t/?=
 =?us-ascii?Q?6p72hQIbcpQgKi8Gad3EoDfwK1oixtQerdV0?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:42.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fe37cf-c51c-4c0d-cc47-08ddd4032b0b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_023354_193635_F8E5855A 
X-CRM114-Status: GOOD (  11.57  )
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

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
Changes in v2:

* Split the patch to one seperate patch for each sub-system.

Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 917a76d584f0..28ba11e42823 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1859,8 +1859,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
 					       exynos5_usbdrd_orien_switch_unregister,
 					       phy_drd);
 		if (ret)
-			return dev_err_probe(phy_drd->dev, ret,
-					     "Failed to register TypeC orientation devm action\n");
+			return ret;
 	}
 
 	return 0;

base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5


