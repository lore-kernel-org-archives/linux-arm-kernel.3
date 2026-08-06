Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04812C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz/0QLtoO6Ht4cHpgxRB3mMpt5uDyBa2kwI4zN90unI=; b=zqjByx0FFgEiqTEnQRlKvD2rES
	Ayvr5i9n6QZ7RFbfsTXUFurakf4DxnKwZC6xhqWsn7gfjKaWjtcjXu4QN4a98b9F37N+fbREeOLmW
	ZIK5y+dRhGEWjjUquSseCFDsJlaLRS4m4EAFrswjKuJk5mjSUnZF4qGW5MJmclcJi3CS0m1ZFWMAR
	1tc/wjbM9AYMZKUegF932vUCwkSD2+wpaWL84ljq6Zcw1Q8KtiRdUQ+RRzStg/Ddu7SIFXHPT2F8J
	jBZGPVrxuDffV5UbIZf5Wh2+Im9KN5wLI0o7dGyctPDwYcMtwJ13qGi+m1Qz7b4RYDUBLUjhNP8AZ
	pU+mEi8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFX-00000005n11-3F0K;
	Thu, 06 Aug 2026 12:31:03 +0000
Received: from mail-westus3azon11012053.outbound.protection.outlook.com ([40.107.209.53] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFV-00000005mz8-133u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+RIEjXm0774zPR70yrs+WKuOY63/+JLu+6wMPp3xTKyJ85BP2Ayu9OZKDe9N1NaqYXQh7Zqwhy2jDSvN1gdNFYqeTN/saJqGZD4o8dFekdwqrTy7tvFn3iZnB3EpE2ysVJI5qLynYsV0JJgHjG8ArMzBANuc33bmwgTJrH43vAX8JIxJ0H0xJU4pQaTORy6sTPFwIsGtJkiT/vHhTFa4qddWCXyDvLcT4qzWfVESXGBz3GmoX+epyOa4oMsx6iCZzPn6jS7rF3ROxh223vjLaBMQv5+TniXcP9Y1T2Os86+gPeKFDRnJnPll2AcjildL7fzPwyxFSp8z+HLNXyImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz/0QLtoO6Ht4cHpgxRB3mMpt5uDyBa2kwI4zN90unI=;
 b=LUTBcV0DS0JaiTbuxmMnTGt18Hs76zafwydm0Piu3o8rdpLm9EqUCxPrCKuShI20Y/DI5prLRyfRevb7F2J/h5xRLP4P/tVx76U400CgEv2GTpSCMfmiCg+nksm0iZv/o8a8g30H2eZ78Q2ueLO9X5UbkoQwrfP7jVFZ1ytnhrQarTfgZzFBQ+a4iDMS4rMfVOM2OGrKXpG+LTIjObCoeeM7Cp3rcbGYuZIPtWh3sCk6vtPJW+jqxMQUq1DAEqIeEb28yoxDBOLiTVBVk2YFl59qeO9mt+6G/upy1q7CQSE5h0DsJJA1o8mVhd3DpSdVJrpPFWG6swnSRxPjKAAvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz/0QLtoO6Ht4cHpgxRB3mMpt5uDyBa2kwI4zN90unI=;
 b=hNprmBP044Dvkh3RANh3UwMPlT0xvPHTmZHJTUVtEWmjd2P8tu7ISfI0JSqi3BSLJOp604SXl0UCuDmjpSDTuDGgweTU44LnlIIXitseRVdyS+rOmBNdZB8JRBcXngIeCTgMEc+U/ccWExrWdzSfOMbTFl0ISSqjDX2ruYho1jo=
Received: from SA1PR05CA0005.namprd05.prod.outlook.com (2603:10b6:806:2d2::7)
 by PH7PR12MB7870.namprd12.prod.outlook.com (2603:10b6:510:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 12:30:40 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::2) by SA1PR05CA0005.outlook.office365.com
 (2603:10b6:806:2d2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Thu, 6
 Aug 2026 12:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:39 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:35 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 5/6] dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
Date: Thu, 6 Aug 2026 18:00:13 +0530
Message-ID: <20260806123014.2120447-6-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806123014.2120447-1-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|PH7PR12MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3c61bf-0d95-4312-6d3c-08def3b68701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9CVdp9EuNP4h4+f0at3+XaAFwzT8YKFs2zQymnVt/QvNj5bcWti2YjkJfqut6/ulAELr4+L/MRIFSmlkt/WSXyx3bKh+HWDH14b9Ns6yBb5BqZB1QC00DtPn8dtbolQMSQis5ZdzSk1AaXR3wrAG7h/Ca76p5ErmKNPDB+8v5cJzjYH4ebfyaqd2S4qx1go92VnORiYPt1bLqKEeKoTSDL0ww3FofBi3GEttSOBUuQsb6MFFAp92Dsk9ZQWvqGn4SyNCl/kLCTBZjFDtlcujmoKbzk1pLWPmUxK3E7MjEHmJtIUzIejNv9Ej0HeECd5cUTaZUBN44XboKHKyuej7P6pWbWiqUJGeVbtRzVs7VBoN0tpOGE4U/0IyrYCOxQn3HI8oeLgYe+saQlRC7zub2wnTjcxcEGjyPz7paRrtzzCfxVjnRMlCzhjKf53nwQZFJkBoQQSzt3LWe7SGG43H04352+Z7HRnsZUJya3WJB7R4U1fVJF/bqUhso2gNNrHD/NEI+NjGoIL49Uwz2ckVezyxZptWuYFRSwGJE2NOPL2YNTtcd5TJiWeEc1IouTfbD+w96ed/13ltEi+zVA4C/dx0J31fANZVo+2wzvaCgI7KG8Fx6qyFSOUW8C/PSAGxtpC4CQ4y+a1uxr6JOj1eKfYOGdrGUyX0XmjYreQij0ahWAiZ2J5eM/UaGclx02iFDp0+ukyQ7OSVOdtVz8ZZvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G0tUkKUt283pKSljuHCku6LQeD7gr0+ZdBQ+xfJFxlNlv0ZGbJXmu+GQAvzAvkb6jMPcrqvmSwtX+uNCECSPVbpNvaed45E+2S9h54qNmbbucOdufTZgzmDXrYdaXhvn0k/iEADxRR01Hb6nmgxKCjAXzhPA0Egry9YmxCkQIWGQQ2koJ06PfVYbY55wDOXllwrKkC5UzRq9k9kjovIpyBlkndZIQrz1jRLOFUaD2cTugseXrlh/VBr6iAdfZKoD8zivaKVMoGkHQyJ/UZ2mZ+alRQ77xElWHOy/Zcfe72nmdyf1R8k7CTsRIPDzr/YqgetWY/1uqocda5TpxfCjfsC0V9HA9GliFdRFwM9Ax/t/HPuUYy5PCkl/T6gh5HiNufUN5srRYiPSCgqZfyavZuQ+UANjMonr6rCNI/Yc+5Tb/DZ8IECiKwtHvlirlJE/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:40.7055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3c61bf-0d95-4312-6d3c-08def3b68701
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_053101_290319_78F03C1D 
X-CRM114-Status: GOOD (  10.18  )
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

Zero-length prep_memcpy() needlessly consumed a descriptor slot. Reject
zero-length memcpy at prep time and document the behaviour.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 2d56ea08ce45..e70874d65123 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -836,7 +836,8 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
  * @len: Transfer length
  * @flags: transfer ack flags
  *
- * Return: Async transaction descriptor on success and NULL on failure
+ * Return: Async transaction descriptor on success and NULL on failure or
+ *	   zero length transfer
  */
 static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
 				struct dma_chan *dchan, dma_addr_t dma_dst,
@@ -851,6 +852,9 @@ static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
 
 	chan = to_chan(dchan);
 
+	if (!len)
+		return NULL;
+
 	desc_cnt = DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN);
 
 	spin_lock_irqsave(&chan->lock, irqflags);
-- 
2.43.7


