Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3E5C43638
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRn7+hN114BPqmx732KOHLTU2mhk8kHo0GrZnhlgCt0=; b=191+q3B4CQN3mWwy3wp6VTOg3w
	/7gRfIhGBHyV7ZI9l41nquxNIRypDGyzUY0yAugO9ACqv/xYbUsKIU+DUYPSbRhspsZJ6BfpUaKuy
	W7nHpFmrAM8qXSI7Rq16YWhpzqlsX6ZFfBmfBkMdhpooqTgZY/crcVIUjF5Ul3Oa0mTnSJxb6lerj
	lLVaSmDx56jDYBEKS6pKWUiuwLyn1wFugU5JGgcLDNMITlKPw1YFofYRaoWO0QEQmQ3Ft30yVQchd
	eeMcT7jAD1SL7RajzMJWM2PIlfOZ3RY0xl6BYZO9GirRK9nJbbF+WqKWo16K3uNKvT8QjJYC2m9gE
	/FVKtmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVL2-0000000CcJT-1XQx;
	Sat, 27 Jun 2026 15:53:00 +0000
Received: from mail-northcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c105::] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVKx-0000000CcG2-35tj;
	Sat, 27 Jun 2026 15:52:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJV4ckM++I8zMNoNg2tiEUSSw8WPOh5X2fTec27Q3FRG5cDQroiOBVDa+VY1aXth6cU+NRFWxC9e2joRZngi0D+DaAF41HQKYNVowiBZ6NC5NllMteXcBUrInkd1k3tymFB3bFgp6wmm4rxvdDqigQgwxxSlhGgSO9Az/l2sRI3gbIdZDBdnwxNnNhn3yutG9B+KGaRYYitTezmR1IF+Zw54SFHENSeVHCxmsUucZlt0lft95OMkmog4wmqzOsHS2XCvGSsThmgwZNjZ906iWl81LJxEC+SF9QsjscHnUUXI2U+CQmbaeqmlHWgEA4ZjjdlzH5pstsf6TeaVAommOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRn7+hN114BPqmx732KOHLTU2mhk8kHo0GrZnhlgCt0=;
 b=aKgfN4lpjwQTi3Sz6NYTmbvD5DsopVTAbwBZUclVNu27veDCAIVQD6I4zlyC/zGqN/9ikQmYcH0nnuGd6TpZy92QKJA5SI1Qs6yylTF18euTy50EtG20EbuSs8hbdU+//pIU61my+tn+FcTqXgn58GiDkzVIwY0rHBGIHDCxf2yx4xrXvgP6YCdK3WKRvM+ua3x5xo0JTEp4wyS28Y1lFAOe/L9W6MfsCjRPrsyDV/YLjN8/2QX1QHXeqEipzoszdgfA8IQH3k6jt9RQe0p0fIqwzM9mAxjD+InoYo7isZYqg7YngxB8/7bQ7KxbC7J78c3MqoTHF2QJbmXR7LMNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRn7+hN114BPqmx732KOHLTU2mhk8kHo0GrZnhlgCt0=;
 b=HHvnzNUn9qLSV0HCEefSzrtI1xKFZJsIDNKGYsbvDz7Ahg6n6wV1j0ZToIR10pc0ElpZh8UkruQ9lOlOpIMFLcfVuCTr9OCcIm+b9uJ9za0NGwqC+LqmhkTWgRLOzIwRJ/FyhdWOtOjX1R64bj+RlmupSuxFb6URaMSlU0OlK3Y=
Received: from CY3P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:fb::16)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Sat, 27 Jun
 2026 15:52:46 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:fb:cafe::42) by CY3P220CA0003.outlook.office365.com
 (2603:10b6:930:fb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Sat,
 27 Jun 2026 15:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Sat, 27 Jun 2026 15:52:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 27 Jun
 2026 10:52:45 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 27 Jun 2026 10:52:43 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
	<michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Nava kishore Manne
	<nava.kishore.manne@amd.com>, <stable@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [RESEND PATCH 2/3] phy: zynqmp: use read-modify-write for SERDES scrambler bypass
Date: Sat, 27 Jun 2026 21:22:28 +0530
Message-ID: <20260627155229.2791113-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260627155229.2791113-1-radhey.shyam.pandey@amd.com>
References: <20260627155229.2791113-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b4f71a-6a23-4b8f-f866-08ded46421c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: qGTZAjktLahN6vjOP/xQlr8MukWZf80cy9YAuR5j3pkW9BmhTGm2zN4NgEX1YyNR08C+mhXFJhPoghU7wcA7DPyUR4Rwl1nM5x6W0WL0XN+CACpnXohu0cwHP9EIotBXUof+h1C6ktr+weh1wGxlagoDgSIb0T4kaeadWbHPU7A01QA9O9wYncVbZKIymme6el8tgooreL8lVVomdSMbj3oGRSW7hQMWFzuXORg72Az9b+VpnPx91qT5BbDFjbrEnH51tRZyixAEly+XxGi2PDhMx56/nmT2jhXdNsxwUUqV0z7gNgq4vgSXY+SytEAJVYggvRa2zehGjm05dpbp7ADIwiAkHHteDqxdgExi1nGLAtmQczbqua475J8Jy4BtKvlPrm5IECryv2tz5h0FEEr/3OyVrjIoVHVkBQe0woLx778SrvhXmPlCmRCgzWwdSOSPUgUmsJtDEirSxJN7rFMY/zQhw5AALOjPitKqPcwX9ZvU6KjqWNCUwl+ySzax/oWbNhUHAmoVXso0FdvtWrlQt0lElqnzXmKOBTQDt3vZ0KHQMkehy3ZR+CvdeXLEZvasrfUXnJqZGQ/GBWSz4Ifz+mqNflVl25w9snF8ORn4W98drByVydrQchh2T9KEB1LNCIkWiCMPAN2TY8E8cC26v+cgFQIpLu70mh3pyHRe3mxkdHeLG9qK0xq9CBBI3OcnGaOY8fZ+f0hIGV8lUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hd0ngbf9BJWReiod3u4rP1bdjHVI6+udQT08e6/0FQub/jQ5E2JvEH5aKg8AWHadUjFdVfB/hdvKaC9OnZs56SvpEsBpkd21r/S9n8gqADjFqF4MoNBMC1iP0MrCPzMJ7qu/5AIaez6Zs1JzYK9AQaBJGs5s0VwKBGj6rn0Aq1zelGeWcxHMczipN+6D5keoXKPjUFOauXLGMLWTwzG+Y6jWAgtG4lt7wlpz4hsrwpFbcziA4QTyPsjpOrCO4Nn5oSM8kC1Qh4KTULckmsq4oV8VWe/n2MGUmZ8X/OXl7aRUMbJo2w+N9anqUjBCEuJ4qYNMmKhgj0j/B5puMzqoRIiruD6Sac/t7A+03AHgsnSZH+lzIrZnSkQPqCO144DCtFwEigm6Qg//dEJ4iZv5F3pZsJSrsif8YBhA3P3paG5XINJ4UCB5ykCuIFDpc6Gh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2026 15:52:46.0798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b4f71a-6a23-4b8f-f866-08ded46421c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_085255_785710_0D695A39 
X-CRM114-Status: GOOD (  10.23  )
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

From: Nava kishore Manne <nava.kishore.manne@amd.com>

xpsgtr_bypass_scrambler_8b10b() used xpsgtr_write_phy() which performs
a full register write, silently clearing any bits beyond the intended
bypass control fields.

Switch to xpsgtr_clr_set_phy() with clr=mask, set=mask to set only
the bypass bits while preserving the remaining bits in each register.

Fixes: 4a33bea00314 ("phy: zynqmp: Add PHY driver for the Xilinx ZynqMP Gigabit Transceiver")
Cc: stable@vger.kernel.org
Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/phy/xilinx/phy-zynqmp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index c037d7c13d48..6c56c4df8523 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -505,8 +505,12 @@ static void xpsgtr_lane_set_protocol(struct xpsgtr_phy *gtr_phy)
 /* Bypass (de)scrambler and 8b/10b decoder and encoder. */
 static void xpsgtr_bypass_scrambler_8b10b(struct xpsgtr_phy *gtr_phy)
 {
-	xpsgtr_write_phy(gtr_phy, L0_TM_DIG_6, L0_TM_DIS_DESCRAMBLE_DECODER);
-	xpsgtr_write_phy(gtr_phy, L0_TX_DIG_61, L0_TM_DISABLE_SCRAMBLE_ENCODER);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TM_DIG_6,
+			   L0_TM_DIS_DESCRAMBLE_DECODER,
+			   L0_TM_DIS_DESCRAMBLE_DECODER);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TX_DIG_61,
+			   L0_TM_DISABLE_SCRAMBLE_ENCODER,
+			   L0_TM_DISABLE_SCRAMBLE_ENCODER);
 }
 
 /* DP-specific initialization. */
-- 
2.43.0


