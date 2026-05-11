Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5E7CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL6DZ+mhLRzjaNmcT42pTRNqIAAAh3F0VY/d9uQMcWY=; b=cHbxTPKZgpPUDFfs8n3Iar/GTz
	+yUaJE16qe3g1TG9+DAhlgyFNKsKwYQ8weT57hWIi91r3SR8dYJw/CfE2QAycJrMVQKT0+d5DqySQ
	SOAfGPwvd+UCZm/8zHr+LFBsZtRK1AyA6SXDuKUYwTkyKCcflOyYaD3Tjky3GUU9mc5vSXv3ugZec
	KaRuzM+DqDEoqPmaUMKXxB5R8UqBRV5EgZ/xY9NFg4LRtB/lmnz5FLmqeRQPR8k9wM7G/vSZqef5C
	pIl9uReAJv+WfOtSFSfeYZNEarMeGCXgIUy1BeIRnNAXfVDRA9SeOr8pb6g/buuKVPHRu4oTLg3E3
	IN8RZ6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBp-0000000E9gy-42mC;
	Mon, 11 May 2026 16:09:05 +0000
Received: from mail-eastus2azon11010065.outbound.protection.outlook.com ([52.101.56.65] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBh-0000000E9dm-3kZH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz02Cpasl3xq9hSQRsEU9d0hax/+HUPO0wom+9McUTbItH69zB8yG9Up6jA/82Q3uGGIcUMWxaV3ZpM9i9DEbFAlgxIFbNbvcm1/sYRu6Xpbf1oiuzTJPItGqzfhzFmwVu2mJ3m9wPOUpI2pZhnNsBLNvL/gpyMf7Y9AvrRD1HGeXQK6JCnCkjJwmfakeUWLj/tHQXbSNqBiLp42WpU3oK8oB8XS5qwGhgMIAoeuvofedCS+zkXcNaLvEdWEU8O8MOX8bl9atAr7DZQ+5DhTfc0hlZ9UdfAFMwSdcdOVAhYe5rMfiyBhI6asmRcl0NTtgNKvORfOWmwN7duI3X6cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL6DZ+mhLRzjaNmcT42pTRNqIAAAh3F0VY/d9uQMcWY=;
 b=q0UpaMkGP6EaRA7lCkfVadoe6xUxe8m5vSvu9g0qfSwm6Y1MjL6FlpnXYaoxW0wJkYpojPEtPB3rV28GL1kKM/keWFXimG+SUGstWCzsDf/2LmztmMK3MHYytCS4svSIDkT53uPqnC+5ya98ZbWd7lEmfMr/5DZYcOKV/Imop3g1c2JwOhNj1sP5tAR4i2ahrtT6yK2hyDMrR7rV5uIAsjrKhqDYGCWzNQzl7Xo9XzXbpnhgeu5qOw5PJUFi6pGjmMMXI+dWinKoLVwM2th4wmr3DsW/2kPQfULEqDfYcssBQsF8wvK0pxrkq2o5w0aOLznHEL2hsjZwqXJJ+z8cyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL6DZ+mhLRzjaNmcT42pTRNqIAAAh3F0VY/d9uQMcWY=;
 b=oE2jRyHWlaPbCkst2RGrcY4qye4H+DlfS3/FCFS+OjmM9oYsjAzHIWFfkHsyqohoQDrfUOr5rFnGX/E0O5XODVrY4JyYs3Dg3tvXnRSGOVN7HF/MLzR0aJAcxJByH2Wzsl58588CDEOEPCWdotEg+S1pQzSfQcJb9EkjLOq4Il8=
Received: from SA9PR13CA0155.namprd13.prod.outlook.com (2603:10b6:806:28::10)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 11 May
 2026 16:08:52 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::ab) by SA9PR13CA0155.outlook.office365.com
 (2603:10b6:806:28::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 16:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:08:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:08:43 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:08:41 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/3] usb: dwc3: xilinx: use reset_control_reset() in versal init
Date: Mon, 11 May 2026 21:38:13 +0530
Message-ID: <20260511160814.2904882-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f318bd-cbeb-4720-f71d-08deaf7797ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8UC34AYWLGZUyh0MQaEfD1Na582uyQRXi9tD/n8SddJBKcGzjf+qwXr8BG8qB1kfXDahpJFUx6iOfaZo6HUYWuwrptpKleChLUYlh4XKcBRl3H72LUf5sVo0enGRvVuNKGc5m3ZvSjWbJP2rzru6QBDLpwmNuoU0oJgJ3ppJMTDCANmEIKohk7ctPeEMVv6Xx83MC4Yv0h7ZDPLIGMHTz/73Oa8ikOWoz3JeFcUn7kEy28eM2p/4vLOjcV6y6uvOY87/0N+laC2wxEw0np02Hmkcb7Arl329efE7VQyiNyZD/I83RqY32f4kLRq86ey1EMDZplVSDnwErDqHd7GJPGO1aayrtZLkWNdbOQX2RCSpLC4N4T4mf8MyUhaiGi8UT4ve5Nb7Y3DWJCKw1U6CXn7qp2vT2QUigLAZ1V92m97ZPAx8XJJ2hSKKxcDm+MG01drMpJmOeeLk3RT087QXAhQ9vXBIILCsM6Jwir23Wf/K7DDqx/Qicdz0uF8bW0RdNGwMaqFW8oAWztoynHfF1sLgOfCvsz10tmOERX7nWoFzZbvO9MW6Rpl3Se2rVrMwuzFwgB3u/U+Pa7/9xm7pgKIbIL/jSoZkAs6CG10YuBR6nizBJ11gkhAPkGskVOs/GzkvEs3R4NxQA9nf/pdLMpz/7rJIgRrzAm1mXsjPXS16oQcQVsear+hGnRGQHLJrwaMxKWX746mbcVRzHf7aD2jwlU2OQIWqPyHw0c9F6bc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4qdNHZ1VqdJuWoWqk/kYoH0PPbYVMJ8sVZEt0AkhBM0fLMowBM69BH/U/YPHsC+EfxF9H3bZD94aO5mRUEWgMr0iw2vXee/9lPQaYuOij0Qxu8n3rkmd767/TXlsJDxlobosX693/a3926my1D1Uc9bAnNQnl+kNnMv9co11/YrxPSuMoYhqilSGys2EuM/bX2noqm/Zwwr8FDBC3Ini7ihLVLLXASRqtv3iMmbUhdT9WxYoDEx+gjusdSZgsG5K7qT0azmAW75bC2AT1N8Oj9z0qVbshOLuPjppWcEg8CbCAkNye94WHEOkHKttVpBy3JXWFKt4dxmXTyfgOX/poWs/YtyWWE7s16uSZ+LjpVxUzk7XaQBmKS/GtVzkHYi17I3Dd5UCW1KuMfubVutkeelUmaTna4JsJbxujjSA13ZaRQqexmbu6MBB6EBYYgEy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:08:51.7799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f318bd-cbeb-4720-f71d-08deaf7797ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090858_413127_518D87AA 
X-CRM114-Status: GOOD (  10.89  )
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

Replace separate reset_control_assert() and reset_control_deassert() calls
with reset_control_reset(), which pulses the reset in one step. Report
failures with dev_err_probe() and a single message. No functional change.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index a3c7dc258c7d..94458b3da1a0 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -98,18 +98,10 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 
 	dwc3_xlnx_mask_phy_rst(priv_data, false);
 
-	/* Assert and De-assert reset */
-	ret = reset_control_assert(crst);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to assert Reset\n");
-		return ret;
-	}
-
-	ret = reset_control_deassert(crst);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to De-assert Reset\n");
-		return ret;
-	}
+	/* assert and deassert reset */
+	ret = reset_control_reset(crst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to assert and deassert reset\n");
 
 	dwc3_xlnx_mask_phy_rst(priv_data, true);
 	dwc3_xlnx_set_coherency(priv_data, XLNX_USB2_TRAFFIC_ROUTE_CONFIG);
-- 
2.44.4


