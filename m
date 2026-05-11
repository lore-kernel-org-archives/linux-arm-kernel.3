Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFEFCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6bvowfY22m8biTaw0TdOcjMJUVZ14CmEpwh1B7yrxM=; b=D4LcDMuMaedxC0SlCzECQh/4Xx
	au3ogA5/MhvA3+C26a6ZGzY0MypFDEmR5zcqXJr0iBTct/bnSOJ4EsNzh5Kr7VYb6DszHN1Z2Tyh4
	DubJx2hky7e+qGmHgnyH7RLFmAW5/Am/ZcheNrmbZ231Vil+Q+IVgU2FG03XvNKnmKIx9KwF9IMGz
	rUaaZRwut8V3lXMO0EO5zLoKdqYa+8eUYtojJJ/0vzx2EexnHxg+J7kTflZfbDHrFMb+EkOJjUGID
	V5e0rKTaOFjtlVwVzVQXyY7rPvJ0xAyzFFLYeXxId32RC9pbExV1HDn9AqjDQdDyTlZhRbMdnSamE
	9xr22Prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBk-0000000E9eY-29hn;
	Mon, 11 May 2026 16:09:00 +0000
Received: from mail-eastus2azon11010036.outbound.protection.outlook.com ([52.101.56.36] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBb-0000000E9cF-0s0d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAdYmx4+g0mud8qsaEgKQLxyrEIVeYPYL5VnJVRg+qMZu+DEizLETQOB8DuCk5uQvyBufApU9lV52HP2vYMPnEhU/FRxrXo7Px5qtilKZS0DQ2iR7pnWjC9akssSVO0WDykLc0OymOeXWMJgPNT1J2gwRP//fO7/IQVuhbfihVsow042VytL4YqIfPyx2yOJDcJXlrzYatTzIjSy61qWN6o4RkWC8XdDv/5AhF681eeO7tFzmEsyF+g83PUwdg/Bu1LfP71zsld8pCAXyPC3oLH6gJu33xn/pRNLSluxPP8DMX6HwrMBeStQI/3nLXMCja3vkCN7R1k/UNXw8LxA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6bvowfY22m8biTaw0TdOcjMJUVZ14CmEpwh1B7yrxM=;
 b=oUBbkTKwyPhYKWwjcgxbakdHwOa2o83v04b+W2r9BHwG0w4qpN3qYidukiE8eoKjnA6ByVskESqv2ZDti3wo0pIX/kGcZmP6YxC/M/tzYrWvFHMKFkbK5G+Bpeepqc6bmw6gax/aXqU97h2irMyrrb6HcMF221Di++iptanqDmgSRIncYYaAXygpiW0yB8sH9mvA3/tJw4G8Kgii3mlK2rPlvpD9rTAn4+4ILVo8aedOVGbXn3Zhcc+uPxaMeKwaBVXBntSCGBGTJpKMcYzRkdbWNuUPH7xwKUvDLcrWpDa/MwEokdX02PKWxga+2PAZ3kWMrucatx0MlCygGdw3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6bvowfY22m8biTaw0TdOcjMJUVZ14CmEpwh1B7yrxM=;
 b=JU5poEU6bVKejaIhtRnfwaE83nNwYoHtloQQdgoLS4I0Bjp/dIaD2A5aShBCYJFTd9aL1503kXq5zSizdlN7NjlgcmWbtyax1eIlDWfwAyDm4oUb6ucTlcv0U+o6Kvj5nsAgtpdpGL50pNVF98r1ynDJnamPfdKeID4ZbZsCBUY=
Received: from BN0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:408:142::9)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:08:45 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:142:cafe::99) by BN0PR08CA0030.outlook.office365.com
 (2603:10b6:408:142::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 16:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Mon, 11 May 2026 16:08:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:08:40 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:08:38 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/3] usb: dwc3: xilinx: fix missing space before closing comment delimiter
Date: Mon, 11 May 2026 21:38:12 +0530
Message-ID: <20260511160814.2904882-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc6bda0-733d-4397-fdb6-08deaf7793be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: w5Vn/JJPhBJlhv2J7GZ8WgfSk8isRgbfalRtI0dyjqHkA0u+reifWmJKuZb9YkQTE60jL0H03qM7+n00kaTp7+utSyWKFzpnEuS/WtG2FOxY4X8gjiwV1wIMHr05QD7QZlHOLVWzypRgpy8f9gbPZS1oiLJpqSmu68ruNhy8wfi6U/ahJGGFKderStRy2D9vSlefTIGc37IMTkPBGMHoPiPUa8t2vq8lnNE3FUJMdVJ+iapvH8ADx8PVmjUcD1L9yeblNt+4lTB8Qzf79kGh1ESWweQmLlmHX5QM6BMHlPSpG1N6ywXEWDtigFLk2s32p/jpBv5cJA/fAbSpVRF4fGsM5MoKT0P+VpWicFV22ZFPN2c8xKa1Q75CrrMhOElzweoaFducMktZrEMP1Dv8rCSDPhQka7ptNeUKIRB75MfZav4lJvZxqlD1t+1r1HzWFKAo2BkG2yuTtkvUtVecTi9WknTUkuj1hnXGW8aqCKvd/Qz6QxtEMUskzjvk2/IGfd4AhoOYAecJNfps4PDOL5DJSYMro7mevnw3+YppbCER/ZmWY+ICN8IHm3aT18Y2J1ADG7ZEULACLpxJkDgaOzHhQpb7FVedgf+WX3aHKgvzp0R3uCi9FpPZbv3j48pIe2JZeAD42zV8IgU0K0ztTo/x7h/FjMCyr61Jj/sBNAgTaUlDr2GLj2W6g0Nj4InICAq1jHWmR8bwaW4hV07klfAhOgMFjvR8bUtNJY2UK+M=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6qE4DsYPArEoPk70DAsre9eWXy7QHkKtgBZLG4Lrs85puVhz1EgBH6LVgQL5C+SzFp7glZq9OFQMpxnuQP8tN6vdIBkK7fvAvBmj8e4+hB188EGshWr7MUHWYkH1oe3hGMPCt5MawNnYsRF1nWcugtuFWaBxO1rO8UQcWxO1yRU0xoef/0m3SgAOcE2cP7vnBFSNa/I5aaOx2mwxOXuJF7vWUr4B7aI9MM+llkj3GchSWtRZZt4x5dGVs6d89y5jb17p/g3DbbF0EGSdZduzLlLJHWT95y8wn27oqBT0tSmmUJ6JdlRJG/KOaLk8zS7vZMxECYn1+KHkeiWv+E4RhZaQ9OHzExa+7OIVExdZ+JQBToHWS4hNAKI2zmjmVSfcDhQND5FfnFx1uqyb6GoWQ4AVxc5bJA9y2EJ8XWGLnfxi8E8FhNH/R9qbHwy7TPP4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:08:44.7504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc6bda0-733d-4397-fdb6-08deaf7793be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090851_304388_0B5AF531 
X-CRM114-Status: GOOD (  11.91  )
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

Add missing space before '*/' in an inline comment to follow
the kernel coding style.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index f41b0da5e89d..a3c7dc258c7d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -196,7 +196,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	}
 
 	if (priv_data->usb3_phy) {
-		/* Set PIPE Power Present signal in FPD Power Present Register*/
+		/* Set PIPE Power Present signal in FPD Power Present Register */
 		writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
 		/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
 		writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
-- 
2.44.4


