Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D3DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jr3BJIgFhDTmrJKgUlUDwp61WWkXNwM6edIiv0GwGD4=; b=e22MPztt7VE2R4VyY+s7JUFlSK
	GMtIlHqh4j8dgfthvhGd2vQG8r3LmtSXFkpj3c3Q1o9Y8NbNRI3pDdzaswRy7wiiW83vLIa/yYK3v
	zwQAQ36rUH44rxEpTb4Z7bzAk8Jwsi1uukDUsBGjeuMj8jEXYHol7euAYVDsHmX6BHLg7vn1h/bJy
	qAVcNMgHqT5u5tHEZ0for1dO/9A6wpci8iO9oOTZvCFhpgO+S/Z69ZkKderzyPFUrOqRwCNQWdeqV
	lAaXPNWAZujmNZw/sBZfed5tJ2NGL1qBoQ2hA3ueuCjhES5FtDm+Zqn45brrn07lNjEtZw3b5XHPQ
	Z/f1bmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq51-00000007DOI-1SZi;
	Mon, 20 Jul 2026 15:38:55 +0000
Received: from mail-westus3azon11011063.outbound.protection.outlook.com ([40.107.208.63] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq4x-00000007DNO-36r4;
	Mon, 20 Jul 2026 15:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6szXohsomvOvzhQs44k/sxzAv0EK8kUZ4FJ/e+yeF2Scs7RCgWXUfjUOjxXbLjckACKYkeRd0EarZ7+qi3PAmhIJXEImRhgkhprNbsx8Jj4O+/i8OPbWvqFQgvWuiX0DSbnr+DUDUt8ZUsJSn9W6pDK7a3wXvEgOKrKl5fcT9v1cJ7WBbDccWhGnbFxm9wwm+Pbz4RvmTXpCAPd0Q/wo5u0N5dp2/80duQuqoQfMuYL0DFRLTSBcVUFD1acpUWaRJJi0BIUl1xLoaXb+ZEN4sdihnHUnT95gH1aqEmzAoEGKeYX7Q/I7CIoSCgq+5Y3Pb8cBKdG04d5t8b+iKvR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jr3BJIgFhDTmrJKgUlUDwp61WWkXNwM6edIiv0GwGD4=;
 b=ybMd3j3sFZMz/4CLc5/pUkilioagkeEO7aPMWaD/OE4dbh7Q39wJ87AjgrvdR7j+wIDjAqFKWm3CAAjeyi0SOZ6mf6HtQaf/d72fBwJSLHjKSKHGKiyavixLtt75aMXYL9dj5KpsuKhjhPRiZOZRD0bzMePWhAhNMJrBNOlcii3r47sTZZ3MoK/w+KHgVBPpr0v2nrxnccCUyuZxQozK/Gm1I/uN0OIArFp4Q4vVRqe62rkiStAVrPlNPSdLRlV9vJZf6vUTtIJUdJBt1pVpIZOZ0yoRUujA3PXPvAxAXyjw7t4vAMP9BxYEaMIHHpepTROFoNd7YFVgViJj/oWkkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr3BJIgFhDTmrJKgUlUDwp61WWkXNwM6edIiv0GwGD4=;
 b=SqXUcIYOE8edhEC4909V1RNmAYUIB44dVR29KBXH6AnkjtjS/AdkY4NOhnAPgQ2Ktq0+PS+IyqQ28jTukJJ4Bk8cf4gTJh+bucYTMBJtqeyCQTGLmS2PwS9tHgd2Vkhvba8cgB/3b3YWUtUbKT9mGWz4cl/WNCXH+OKiHCU9eTw=
Received: from CH5PR02CA0008.namprd02.prod.outlook.com (2603:10b6:610:1ed::15)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 20 Jul
 2026 15:38:43 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::4) by CH5PR02CA0008.outlook.office365.com
 (2603:10b6:610:1ed::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 15:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 15:38:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 10:38:42 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 10:38:39 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/2] phy: zynqmp: fix clock and runtime PM error paths in xpsgtr driver
Date: Mon, 20 Jul 2026 21:08:29 +0530
Message-ID: <20260720153832.1130006-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: f44a6a12-07c0-4638-08e1-08dee674faef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|13003099007|18002099003|11063799006|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: D0/GfQ/qatJw5ZstPS+WZvqvBrK5BJcDU0KDBB4jhI5lYxh4uPkUmDcGFGOZg4Bkf/CGCg+q7ciH8wtxFL8QBPslD8kLaMtDWM7DBmGMHHLvh8Yi+IVBroRPt+7CAGrH7TdWajQMKrLHQG8LoeGpO60Tts4YgcjnAsU92JMaopbAvO38U0gK+J4NDXjkifUbqDiYEDHJ96qiTRVUAhEqpCA3XUW5mu4D6XYj+6ID8BvJaURDpufHioxfwxIknK8hZ42SCBsnytSqs8NepcWElA+tLIMIHK9PWvk28tZru6ISMgdvB2h6oDg9lEOLDiLdsmlwFUkfrD1v6TjUb8mrDao/FOAD+x3WmILJfmhTNpI7nEGasQ1zsWaXsO3Nh08JyqL2UUg0e0uj6w4+7KbkvzcR8XgNbsHi5Mm06UKnFVQtcm9bYu0pNEXMSL6qQncsN5475l1FmvDZAfacU/+ACZTVAshkuOejo23459Kkqxn/Q+VURgjq/7p1ZkhifuQUUv4H1WmW6o8Y2OWwSD5YgdRyR4pV35Tx3fU9Ma2Leo/7eMXEUDSnI0aR9UBLwuIM+D1EQCpzb4gSFzxoWSx+LkMDCQHq2wtrI8MDy0wAJGM4NPZ2q71zJSpIVbV5wJnNXO1YoWn+hyz/7wxT3MMoGS1vgNj6ZZGxiG5afxWbTrk3MQGvv4pBrF3VhyaBlSJsH+yGIYLhoNU+ZXR/bMVG1A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(13003099007)(18002099003)(11063799006)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TXaA0eyC8qCV+BnaQFFrTlPB9f5NBtTu19VSNAtkBG+qVx+wcldL+Dlii6gr5Re/7003kDbhz22EiOsfQk3yJxCav6+Ex+wwx1QMUShNNlb1pwUSlrqak1h5MHgT2nYW6wThkN4gwNgEMf9eoy7SHCEVzcGmU9fvxQRdIK/0A23HHRIDo/R6U2MlUfPiWUlpyXmC/PHZaxsWUFr4Ztrc2P5Rrr/pl8ifII2b0ujL3EcWjkxm6Ha8VD/KYgyzNhLoqDNFzLSwreHtYvHJ/0SwnI+UbWhuHhD9ECdr2XeLgQP2drH6WpdA5JVxsbpTbvPo7zki5FpFHpWR2sQBCa5FtPYSxWX1ahc5MwIN/9ui7XHy6UEZ+/Ylwc5p4zCQcHfW9O+cUVatrKyPNXfPj5bc9KFTQDsLceUFGybbzYPoHf+wOI+OdsAPT3iMR/ZTce4Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:38:43.3215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f44a6a12-07c0-4638-08e1-08dee674faef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_083851_777102_E18D0D5D 
X-CRM114-Status: UNSURE (   6.46  )
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

This series fixes two pre-existing resource handling bugs in the Zynq
UltraScale+ MPSoC Gigabit Transceiver (XPSGTR) PHY driver. They were
reported during review of the SERDES scrambler series [1] and were
intentionally deferred to this follow-up series.

Patch 1:
Propagate clk_prepare_enable() failures from xpsgtr_phy_init() and 
disable the reference clock on initialization error paths.

Patch 2:
Move saved_regs allocation before runtime PM resume to avoid 
leaking the runtime PM usage count on probe failures.

[1]: https://lore.kernel.org/all/20260627155229.2791113-1-radhey.shyam.pandey@amd.com

Radhey Shyam Pandey (2):
  phy: zynqmp: fix clock error handling in xpsgtr_phy_init()
  phy: zynqmp: fix runtime PM leak on probe allocation failure

 drivers/phy/xilinx/phy-zynqmp.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.43.0


