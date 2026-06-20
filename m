Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5FACD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsOkV/o6reQDIjECfTzW5Gev5FTFz8SHvsOWAdAa8Fk=; b=T4f4wxKPh0xGtFvajRWDsxkYQT
	jeMd8eVqLt9sFyISztvw1tkjSLFjgURYZqdIqWwRX/jlI9ohjcz87LqedC5Bo+KKwXGPKFbzYqMCC
	V05dCJ3ASpZoDLdKdryWeDEZKSRgjTQZcHZWiVX7kB59k6uufmzdGHfcc0inw9sZEd+re5q5bVSUa
	ATHL+q6ugk/x29KIswlMNhVkQ210a2x3oWniVMW20PAoqMBc4Ln+FJ255uGq9P4HMNtgs0rzENll2
	p6p2tOveqQR6nOOcAh1MalIfsKVgd51hnSkjf0yUJ7sK0513u40j/p8V/QevE/wI892EKrUr/L27o
	1UTG+ygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb2Op-00000003YLD-1jwe;
	Sat, 20 Jun 2026 20:34:43 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb2Ok-00000003YJ4-0iiw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 20:34:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1fUWQ9TjW5zDU+eKxYb8SR8RhsninwtiPekMNs82iSLGqEcUflByZavYLuuw4+H/NWpxBMzYkkMttX3fO9mBFsOE42Z2Kfq5vYyjghMYivfRsq1F+ZwehhAm34qRue3mGeWL42lIbhRQzjbTi/4mSngboNeJhA0TgATP23sS63yOeVJVDAT+G9skS8liMkOdwQ9BsQ1e5SIM7eVmN+00nbns7mjCI9Fy1rx/rzwXRyggQxrhAtf54qqjie5QAnskhUxJqyU+jiQ1g0ibkuGqpYq0w/nSt2bXqqkehl88USfbTu3R2NccjApQdb03ffIQ7yk9qylXsRjC0+lyYlo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsOkV/o6reQDIjECfTzW5Gev5FTFz8SHvsOWAdAa8Fk=;
 b=m/Z9LoPnsYlakGv2apQkZBpPZEFoMWqfdsEO1s5+9/JXO+Q+lJRqn8ggIO2EFHkFU/jpjwg6YU2opYNO734pNYojoz2/Ek/ZGvGldvMatJ0zP2GTC2r7hixYXtE0Ln2LdZqVTRhNkFQN47koF7TqGnwe1PVctLBK4mqybU2v4eIhmI3oYeBO0hG3weUA+rnjWv4WThjAczoFi1/02FhlW2zj2h8LxP/cGFuOTdTONyArhTNmXPLIXjhRU+OnfmQPMp92jZqW6D7COR+h9MnxfCl4M7YQaGbW57NvJW0SUeuiDHtuDakLmDFx2p2JDFVJ131Sbk9qYoLe/ugF/+Jr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsOkV/o6reQDIjECfTzW5Gev5FTFz8SHvsOWAdAa8Fk=;
 b=crCmDRf9k5sZ8UO3/NMOtIleSX3vgWe+ZC89CASKRKVH7188SepUvnC8+5R5bCUdJo7fbRiVgJm8Dv2WRg+E88K55V3DL3aCcvpPc8geWOfH0OawwCsmCs9LnMD33WhvaL8p02Ak1FP0KF/CrNA+G/fzNJu3wqk5QHrw5ANj3CE=
Received: from DS3P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::14) by
 MW4PR12MB7430.namprd12.prod.outlook.com (2603:10b6:303:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 20:34:32 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:45e:cafe::2d) by DS3P221CA0009.outlook.office365.com
 (2603:10b6:8:45e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Sat,
 20 Jun 2026 20:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Sat, 20 Jun 2026 20:34:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 20 Jun
 2026 15:34:28 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 20 Jun 2026 15:34:26 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<linux-kernel@vger.kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srinivas.neeli@amd.com>, <dev@folker-schwesinger.de>
Subject: [PATCH RESEND 3/3] dmaengine: xilinx_dma: Optimize control register write and channel start logic for AXIDMA and MCDMA in corresponding start_transfer()
Date: Sun, 21 Jun 2026 02:04:16 +0530
Message-ID: <20260620203417.4000360-4-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260620203417.4000360-1-suraj.gupta2@amd.com>
References: <20260620203417.4000360-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|MW4PR12MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: faf49c5f-3d4f-4c07-03b2-08decf0b54ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: GhHfjiUS/Et3jsFzYoSsnDGUmv7jyDQDUcwdISbs37ptjrd8NoVsfzWZsins4gV4/H19ILn/N5Bskn1taCC43c/XuE0gYfoqaV7AOfnvLc+Oy8aQ0+hlO+IWJ2A3Iyz4hOmEIroWEXzYJWqPaTn0UIeoK/AoJLna/TieCnvjerVKEZhvdpxbZZlZlAcrMuj2G8TfRVFUGvoPrzh1Zu47rAdyGx+DApvAFjCfsT8yrOGD2FKXwcj/AWgTtD20E1qlJ2yzPngxF5Z5N5+PDkCKTpALTzORrWPM0O1xU4fHEEADBphmqLrNQIA05WBfj+ZU7fYhD2u89WV6N+DvSbOfIZdIWfOyPsrf8wgcpQ+uodj6UvgykiMsI6ylno1uW4qb6f+kw60qvWNYj2rhYCaRLPyQ0ovkrqPq9MKpny2dZuVLuf17eS8pIUCMIqpQSuWhEX7a1GwXNMHNqa3WaQKco1fXgFElb+4XdNrgwQOydoaUbojhYBHCS7l08PDIjMnlssAJPL6cdwPbMlpOT6utBKHY2bRHakD881SX2XxqJXNtj0J2ZjOZrKPDe6JeQem8pMd3VW446vJC9CZo13pke1JS+b8PQBchW7ADCqiFm57j5VW9HTVCobXbyNJPbhQ/swOZpPkSUAn+t4rPmCTTt0lUkdjPIuad2rBVKlDFqnzl0uzWYAmrlE1fHjY7KDzIgvRYAcQhf11EnwaAF5hlUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +JdTQRRSoKIbahDuFTAxFJQI8T91e+6dkf7kzg+kZ5RTY6KMtfebfFENwttAAqnpSBXoBN5HPXg0S2T2+ZlBgEFwDQHah44LhYOg94K4P4bJ1yFgHExwWoC3YGoFTqx2FLf2ldBlZx9QZdGImyUUkCOOMrf56SK2zg9x6N5iPttFwcJy/ypcruyoYosfLeh61b8E98o+L2biKktaMXy4xsXByjM7c2LrM9kHVPurLhvE//XjlbzY1HNjvw+oyEshiJl76l1ikvJBWyr2ZOVtVK7XMLNZA6UjESk0X4OO0PPZC9gJWo2mTwkr9+JdOUNXN03e1Gv0x9mRtZsfFeGqxawtwv0WENnAZIYALV1YmpIQ4W8g8giunJtEXK/xgeXbT8My505AK2Jlbz7XSsI0LtS8+c/8gf/6wTd6oDXGvQgH4CcLc+q2nCd/CADnZOqz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 20:34:30.9286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf49c5f-3d4f-4c07-03b2-08decf0b54ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_133438_218470_F035EC03 
X-CRM114-Status: UNSURE (   9.82  )
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

Optimize AXI DMA control register programming by consolidating
coalesce count and delay configuration into a single register write.
Previously, the coalesce count was written separately from the delay
configuration, resulting in two register writes. Combine these into
one write operation to reduce bus overhead.
Additionally, avoid redundant channel starts in xilinx_dma_start_transfer()
and xilinx_mcdma_start_transfer() by only calling xilinx_dma_start() when
the channel is actually idle.

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 35b553ee3205..aa3dee0dc2fc 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1593,7 +1593,6 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 		reg &= ~XILINX_DMA_CR_COALESCE_MAX;
 		reg |= chan->desc_pendingcount <<
 				  XILINX_DMA_CR_COALESCE_SHIFT;
-		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 	}
 
 	if (chan->has_sg && list_empty(&chan->active_list))
@@ -1604,7 +1603,8 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 	reg |= XILINX_DMA_DMAXR_ALL_IRQ_MASK;
 	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 
-	xilinx_dma_start(chan);
+	if (chan->idle)
+		xilinx_dma_start(chan);
 
 	if (chan->err)
 		return;
@@ -1693,7 +1693,8 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
 	reg |= XILINX_MCDMA_CR_RUNSTOP_MASK;
 	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
 
-	xilinx_dma_start(chan);
+	if (chan->idle)
+		xilinx_dma_start(chan);
 
 	if (chan->err)
 		return;
-- 
2.25.1


