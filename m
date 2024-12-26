Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7752CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 12:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVFD/D+DtQfgF1702wWPEIXtuc9PEWxzd3ob5QLZJX8=; b=gLLivnK03iYkuBu+r1yUAIDro4
	wbFTJJ+mf2i0JKW5ICTq1uWus1xxs8gS0s4P7Lgy0kOACEme9qe0y829nTm5M0miTpIKZOnl5wOgG
	V9yisoDnI6KcfswUwCv08xkFJcNDvfd6gufDM5b3OVlcAWyKnWk2gcjmm3z5Nm00XK7OPXZbr9Gdw
	AU53sqwOtgEpemsT5lVN8lchG7fNOPx8XCe4ukke8/cjultfEJbzHZhAQRHBo81X35I/SFBrXUNSt
	oU7sqYC1COpzpNA6waCEFAurkQwsJZXLZ6u9GKe0La0QndJqG0SMpbCWycLPXJmVmc6iGET7zRrwk
	LYFR60tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmuX-0000000Fl6b-3rBm;
	Thu, 26 Dec 2024 12:24:17 +0000
Received: from mail-bn8nam11on20627.outbound.protection.outlook.com ([2a01:111:f403:2414::627] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmr2-0000000FkVQ-3qy9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 12:20:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbTD0E9tN7mjdw5P/vWdCqczPubRldb0cTNA85nAGZZVQheTxVexfDJzUsK7KTfH1V1kxccYIaBmvKvnKoTvG0gABmOSwPLOG+r/QuKjoXf1Lz3vl8yOKIoj11cmMZBtsIRA13sCG/VZLCybMdLREWpN4UR+qoxWM8wx04B+cIg1mNyWdY+UT61EQXr8vUcd6khxcifbxqDKiDZ+/0a6qiN41I0AIF1t5Vx20ruCxfnc7Obw1jg2x8XeUfiskQcr7utpR7mY73tbZXqKQpQ7XZFMIbSHpYrpsAwUCG92SPKiM+QzAnFLBLND/43SAOHqCmwLkPMiRGNoebyBmEAuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVFD/D+DtQfgF1702wWPEIXtuc9PEWxzd3ob5QLZJX8=;
 b=LxaR80wse1qoMpwCiqPqitoarAc9o4NmI1qxzcbfj68W3j1B/40i0K/3Vui0sSXsIkoFuVP993XmfwUmJBLvV7d2sctD7rEre/IupR6yeFVFEcjRm2s+BtzYZobTB1Jpuf3brQ2U4IpiT6XBM086bTSSFgC9wDs2d/iE8DWYrHkBm0tCQYhcys6nouON/6xwWr0acLVmp65oEFBHM+SrUUJk1fLFHi2vpDQJKozDhiiTFvjBsdvGkXgtzYyFihQqQBEnVJ5TUWGaIrdxxDuo5hX/upr4+5Oa3Zjh3gqHkBt7kMWTkDidtzRmClhqw5OVZMd6+e1qUVBh4VloIEjm4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVFD/D+DtQfgF1702wWPEIXtuc9PEWxzd3ob5QLZJX8=;
 b=T46aSBla+Zc1BK5cYXTyRXhsVlQW8cuBc+kJavVI89f0qYcLKR8dyj/020W8HoHTYayDjVBNCKp1FEPhqXdzcFZbKl1rZsiDY+2mEgFqbbPYx9/u9ikMeobdP82g3PapMaq5bpUjKB3kHeZXkckLeBGOz6y0TyjHkPWWLXulweM=
Received: from MW4PR03CA0244.namprd03.prod.outlook.com (2603:10b6:303:b4::9)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Thu, 26 Dec
 2024 12:20:30 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::cf) by MW4PR03CA0244.outlook.office365.com
 (2603:10b6:303:b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.16 via Frontend Transport; Thu,
 26 Dec 2024 12:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Thu, 26 Dec 2024 12:20:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:28 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:27 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Dec 2024 06:20:27 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
Date: Thu, 26 Dec 2024 04:20:21 -0800
Message-ID: <20241226122023.3439559-2-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241226122023.3439559-1-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DS7PR12MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d4180f-9d0f-43a4-18da-08dd25a7afc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DGLbCja8kD95pVHFe3d+a3vTz1/Ex8cPdbU6iatidhCC3SRIpJzDrz9U6TUV?=
 =?us-ascii?Q?F32upUHoVFb1TqRhKhgZFDfBZ78+ZoHdfq/fQnfIiAvmyuwzhlZ9hxpjFZC0?=
 =?us-ascii?Q?8Z1DeWVsjV6rFEJqb3b2SSJECNkNXLVHL1jTPL+rQVc3ZrFlRj4X8jdBHduL?=
 =?us-ascii?Q?yAIpMLZ23Q6IkYXR1FIRuEFArYN/kUXJORv/ZW4hPn7uYhGo4AqDsyxK5O5I?=
 =?us-ascii?Q?1QJf1C44jl2k66dW5qZCBaKXPpuRw9NZmCliW42y7m1Lipqn1XVHVShK9Byz?=
 =?us-ascii?Q?m3ZZzRqeYeZzQ1ByGT5ykW7XY8/u58+/ZCy8DmBceo/nPED71R5Y2xWPxDwH?=
 =?us-ascii?Q?aHj000FTqC2lFVhft+j0gDyNC7mpCWjdyMvpqzb4Eas1oveA163MzQUlC9Wf?=
 =?us-ascii?Q?BZw9vY4TCFuhIfRvK9YA5Iynfkv+xutPEnuKtqlBKTh3eHDMGZq2yxR7eAUd?=
 =?us-ascii?Q?gAcvK/Fd6P8ofRFuiG03f3VAgA2iu0+CCxVBQNvUARYPYwCcT5DV4OVVJRZG?=
 =?us-ascii?Q?sQ1F++/5EWzxd9cS/afK6PXZlH3HYam/OYqse5LCTDkw0NkHIgcJGDmbiAxR?=
 =?us-ascii?Q?kFWdaDbGIgoppmqEOeCxQ5v+EfOBIkFU7xukN7izqqUmoeUXsgE9aD5JKt3m?=
 =?us-ascii?Q?u2kHLSJbKVfGe8bUJ8PvBPYMO5pw8Fnj6klOo4lQggdFi6QrzeuK4nH5FXig?=
 =?us-ascii?Q?ra6HAwwuCMFlFelz5Y/eWGChdu63u+1Z/S2qlzZJNpIqYUzb8GL47P2eD3W+?=
 =?us-ascii?Q?RbLYBG/Mfd6dEBiW0RIUP/d0OhbjJmuRlbgDVpu1dYVUaig+BLVF4gQ/islL?=
 =?us-ascii?Q?97qfd5LyM+afp+b6pANS+jRCVfGuMKc4eFRbK73+YqI35a1kioo9F1uTmWpB?=
 =?us-ascii?Q?nSbLN84fR+Uzr1UlMIk/lD6qiCCPkF2fF5edmYZW/PiaoZtP/B0GsRtG1Kbu?=
 =?us-ascii?Q?NqBXXOnkYUYPc8jpoHEpGXxs1bGU/G2H2mUAjZ/XgMiJgKQE4HYxhinwWUsh?=
 =?us-ascii?Q?LZzbt15m50GO7jz60U7x1c/PPi56dUVs0mZVbadenBtXon8rSjzyQdl33c/u?=
 =?us-ascii?Q?WlvbCnqP+Jeyf//cEGmrnZp9M792mi5vwh2FN1V4yJbhC4SOEbMbGa/xlHCq?=
 =?us-ascii?Q?c9LJW5/nskobiHVzu60GB7XnGAZcm4n2jJXsBd00IRBRjHa5tbWXo0OotG6N?=
 =?us-ascii?Q?df0cTfsk0pqsJk8z9UVfzxO6/mnIf3NsnmfuzlzaEJh4WPlE6EpAFL6tZy37?=
 =?us-ascii?Q?TdDguY+f56kfn9P9B7cuttm9aNQZJSWl+ElrTrKSu0DB/f0ju747Zult5mOM?=
 =?us-ascii?Q?ElvCxMNGzI4znnUIwWOh47sU57FKz4ZtrRGic9O4aHE7eWvkoT02QZ0iSpYP?=
 =?us-ascii?Q?lH9LG7a2SjiDgcg/Hay9DO8gHyEXVvhGYnu+9XH6TRLsQMwla8y/34bw0yl5?=
 =?us-ascii?Q?95tZPaRnei000Xeij+uO+y5Qxk/M9DTtW+NIdpXNOkptoYvbQVHUfw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 12:20:29.3546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d4180f-9d0f-43a4-18da-08dd25a7afc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_042040_965290_3D53C1AF 
X-CRM114-Status: GOOD (  16.02  )
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

Updated vcu init/reset sequence as per design changes.
If VCU reset GPIO is available then do assert and de-assert it before
enabling/disabling gasket isolation.
This GPIO is added because gasket isolation will be removed during startup
that requires access to SLCR register space. Post startup, the ownership of
the register interface lies with logiCORE IP

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 81501b48412e..f294a2398cb4 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -11,6 +11,7 @@
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/xlnx-vcu.h>
@@ -51,6 +52,7 @@
  * @dev: Platform device
  * @pll_ref: pll ref clock source
  * @aclk: axi clock source
+ * @reset_gpio: vcu reset gpio
  * @logicore_reg_ba: logicore reg base address
  * @vcu_slcr_ba: vcu_slcr Register base address
  * @pll: handle for the VCU PLL
@@ -61,6 +63,7 @@ struct xvcu_device {
 	struct device *dev;
 	struct clk *pll_ref;
 	struct clk *aclk;
+	struct gpio_desc *reset_gpio;
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
 	struct clk_hw *pll;
@@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
 	 * Bit 0 : Gasket isolation
 	 * Bit 1 : put VCU out of reset
 	 */
+	xvcu->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(xvcu->reset_gpio)) {
+		ret = PTR_ERR(xvcu->reset_gpio);
+		dev_err(&pdev->dev, "failed to get reset gpio for vcu.\n");
+		goto error_get_gpio;
+	}
+
+	if (xvcu->reset_gpio) {
+		gpiod_set_value(xvcu->reset_gpio, 0);
+		/* min 2 clock cycle of vcu pll_ref, slowest freq is 33.33KHz */
+		usleep_range(60, 120);
+		gpiod_set_value(xvcu->reset_gpio, 1);
+		usleep_range(60, 120);
+	} else {
+		dev_warn(&pdev->dev, "No reset gpio info from dts for vcu. This may lead to incorrect functionality if VCU isolation is removed post initialization.\n");
+	}
+
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_VALUE);
 
 	ret = xvcu_register_clock_provider(xvcu);
@@ -690,6 +711,7 @@ static int xvcu_probe(struct platform_device *pdev)
 
 error_clk_provider:
 	xvcu_unregister_clock_provider(xvcu);
+error_get_gpio:
 	clk_disable_unprepare(xvcu->aclk);
 	return ret;
 }
@@ -711,6 +733,13 @@ static void xvcu_remove(struct platform_device *pdev)
 	xvcu_unregister_clock_provider(xvcu);
 
 	/* Add the Gasket isolation and put the VCU in reset. */
+	if (xvcu->reset_gpio) {
+		gpiod_set_value(xvcu->reset_gpio, 0);
+		/* min 2 clock cycle of vcu pll_ref, slowest freq is 33.33KHz */
+		usleep_range(60, 120);
+		gpiod_set_value(xvcu->reset_gpio, 1);
+		usleep_range(60, 120);
+	}
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
 	clk_disable_unprepare(xvcu->aclk);
-- 
2.25.1


