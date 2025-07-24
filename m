Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BFCC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Q28tk5/wEddHaLhqYUGiyX97GLYr8lNa1B9eCru5P4=; b=caCEMki+rOW5FFWSrAkIfAxF1l
	A8eVdQCBSd2h7MWn8mGl/ltsUY4doCnhLvZT4y0H7VbAmOFnfRzDnoBvl7h9/GsUteNrZnpRXGyVB
	LFPgpF//Ek+FxwJQEIP4zvFEd2q0n1ogj0+JdYKK9OamG68OVw/7/Thr9nfZ2NTztfLHcoJG7dUDU
	HnuIkiYde2VLxsShPw7VhF18HJXVaVBAVnEm/c23LnjFtrVk3UYvOVG8Q3ulRTTCiwcR1P5WGvuRx
	rNe5FtTwfC0VuamJCz1MOYzNxRj1yUFr37Q6Pr4TakBF+6ZrIWXBUxwtPTJnigsg5GzHl2N7oB9/d
	tzZEcRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o1-00000008DiD-3bJD;
	Thu, 24 Jul 2025 18:36:37 +0000
Received: from mail-bn7nam10on20619.outbound.protection.outlook.com ([2a01:111:f403:2009::619] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezOB-0000000840A-3la6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnQZfA+8waWDmW1ZkB0jTk6jfWKmHF9oDdbmK1oMLtSuhaQDw2D7akcg1s2VHbpChTz5QV+bAZrMQB2OSGCeS1GSjrdgfUlGtIW693qAxIYSsSNZPo82o/+t+10ICM/AvsvzgOa9szlZczyKjr7v5cDckSHhM5HuOcjrXTYEAqT+v7qAWRJ+bHmBHPMgS+miVKIl8Fdd4ARJAFO/IRPcj+rMTsoRkqlQ6k0PxWxkcw6kTs4Vn8EcbBg13Ad5ydMFR/DWkfs253gV0ccn9DgVn6FUMFPeIOa9h7VTwc0KUQ7CrIF/9s1H/WGG4qmYQp6QT9AECTtfUjXmL73+kSSJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q28tk5/wEddHaLhqYUGiyX97GLYr8lNa1B9eCru5P4=;
 b=tDcv6kaVvhR9zgzFd2jTNbAPYTPRKXtMo9D2/LY77RRG0EjmRrnpbu7xnU/DKQvc/fJpujvI9t5xXjipEi0ZELAKM4XJtKYjwVTKUIG5VWXT7rdTmpbCjp4GHXev7AZu0CAfeUoVCHAcr9xozBWxYSp0OTCn0tiTw1S7XO3PsXxC4vyWGXYmspA7HTq14M7mJN/ceEbkY7BcJh++NZorbAH/LFvnCSM5Fq2KM12Ymnd3/W/VLWHKpTPoecci0QDkW6wv23bfx/Y9dNzMUoPx8s15cffvRbpafwiMC4tcpcUQkMwkeQo6l3yYjl7YI3d5XLuCFLnn/YPCXDOIHMUEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q28tk5/wEddHaLhqYUGiyX97GLYr8lNa1B9eCru5P4=;
 b=P/LeDhnTAgKesl5pbyCT7XjbS9so7e1OnmHSDAdlCLqdHfSegNgV9mIGBXGNRIzSMVzFt2pJn0ULaQQIZ2wr3FNWiJmSeNxHuV7iDBkp9L5pWwtgxB3BTnQpxJsz/OGPvO2+TU51pHwzbKlvsi0ILogXY96nP8T78wuGKB42Y28=
Received: from BN9PR03CA0079.namprd03.prod.outlook.com (2603:10b6:408:fc::24)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 17:05:27 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::7) by BN9PR03CA0079.outlook.office365.com
 (2603:10b6:408:fc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 17:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 17:05:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 12:05:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 12:05:22 -0500
Received: from xhdharinit40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 12:05:20 -0500
From: Harini T <harini.t@amd.com>
To: <alexandre.belloni@bootlin.com>, <michal.simek@amd.com>
CC: <linux-rtc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH] rtc: zynqmp: Add shutdown callback for kexec support
Date: Thu, 24 Jul 2025 22:35:17 +0530
Message-ID: <20250724170517.974356-1-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 545fdaee-3a34-40e0-4445-08ddcad44962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K2tFCaT3BXbPrCA+X874mFfdOHSgW+n2SwfxpQhymC3RE49U9S1uvzW6gbLr?=
 =?us-ascii?Q?pZijTYS6WeT37Tefb/Sow/KniXuka834IRsPP2AZ1dQ1eJSzpvDMMOTNWGur?=
 =?us-ascii?Q?cxj6flYGzs5mjHM04UexyO1k/3vItB9hpkgy2TYr63GZm7uqn4/Il4FKWjvE?=
 =?us-ascii?Q?B/7BM2x4jhDf4vF6r5XAZNhKHDy/zYuBmzMe2IiVbzxsxKlEA6IikRIk0qV/?=
 =?us-ascii?Q?dP0XiWuNNTxNSADZ4FUmUI6FlRnfkVNT4VijCbF9J2NkGa8htqKMQxETUrpl?=
 =?us-ascii?Q?DSsAbKQhSlbazp/IZQMNl9psOhqNqMmIJ2sBtyCr9UsJ19stsibb8Sg2T8GO?=
 =?us-ascii?Q?tZOZvY0dFzFZAnfRr4Ftl0X8S7pkOIiqE5kr75Ecv/bxcva52ctV6oX/2vSA?=
 =?us-ascii?Q?2lt92FnqEFQbm2Go7ovkCwQkS7SgCkYOEPMn8bR+UaNhFuGLlO73EH4VrYVe?=
 =?us-ascii?Q?qIsKdqMDQmkNZGff0xQjfhP+2N+foqrkn8aoN/fujGOZ9aGLZ+39/wPZIHj7?=
 =?us-ascii?Q?ARwdf0T1XprJmPIGm3dlRCoUtuOH2ETbld+RCGU4seIgJec/b01E10dnEYcb?=
 =?us-ascii?Q?vO0etX8rRgvGzgTCggZ9VMEGGOGLgwl0zHy+w58Utevh6qB2MiOWPE/wZgSv?=
 =?us-ascii?Q?JZJVzEMy+nuWzcq3OUlIiK0US7mbQ9swoGIuKgz/tmyFOTx2f+5d27ecjRvF?=
 =?us-ascii?Q?1bsFHixbleLivbSkNW8Ne/dq0tsLEp7xHbhWhHuKIPmKy+uZ8Gu2g9dHXZVa?=
 =?us-ascii?Q?wX0MNATvG7yHv0g8NZyJLzrSokCrttfH+AH1rLZGZHjRZThq2VikrmJlTkCe?=
 =?us-ascii?Q?9I/26FJeqVj0Lr0UfRaj2qgrh11rOe3FPVRIGC0x+v6J0r98sQnHsqjl/DfT?=
 =?us-ascii?Q?TQvNG9zRuXmnqQ60u6DgEzNVELcfbNOz6vhPvLoNlIIrPK3ZbO0cVnGUjHB+?=
 =?us-ascii?Q?w+lfu+Re8CSxeLX31qpZPKMULfxiPU8qjMBxCab+6/BndGLS8+wZPR9dCA4N?=
 =?us-ascii?Q?RV518oLTelKUgViW5N0K048Mh29AKnnV1tOMFmuVOFquNfCc+so+RBr+81tY?=
 =?us-ascii?Q?HSZyF+CtG4wOFV77Jg0D/nu6JbenwHyvH7ocPoWRmq6l+9n65hiQKx3cXxW8?=
 =?us-ascii?Q?eHDv0fOpNW7qZv+gG7RZaxOr3tal00sg2YFt12FrTyUSQBxfgOmV9H0WRUZK?=
 =?us-ascii?Q?GIEvt0HWDY7aBfbT9z0pWRK+06nDLjcmWYA8LVx8tmfCoHa7oVP09v7mSfjE?=
 =?us-ascii?Q?SYsp3nk0Cj1BvHgidFNlqyfAELOjEW1gMMadK0rtYPOjbJQM4uh3nxrpoDLR?=
 =?us-ascii?Q?CSkHiXrKoRRa7kphMpwqlUxEVRhbtcbAWcCse6hLE3MKbMZ1ZnV4sbDHNjnR?=
 =?us-ascii?Q?qwU2KX0fwB0EhljqHA3rm29H4cn6gDM874ZuWhooRmT8ECqsPlIuPOEhHuBh?=
 =?us-ascii?Q?G7fZ9Z0K92aXactPfJL1fHK7v9R3ZqDRi101sgbIcimQgKdlXJU9LAQoYTpY?=
 =?us-ascii?Q?+760rvDe0gr9wAAgC+De7dJP9eaVapP2ZTsN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 17:05:26.9096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 545fdaee-3a34-40e0-4445-08ddcad44962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_100552_011516_72EFD4CA 
X-CRM114-Status: GOOD (  12.84  )
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

During kexec, the hardware is not reset and any enabled interrupts can
interfere with the new kernel's RTC initialization.

The shutdown callback reuses the existing remove function to disable
alarm interrupts and wakeup capability, putting the device in a
quiescent state rather than completely removing it.

Signed-off-by: Harini T <harini.t@amd.com>
---
 drivers/rtc/rtc-zynqmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f39102b66eac..26893367f0f5 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -383,6 +383,7 @@ MODULE_DEVICE_TABLE(of, xlnx_rtc_of_match);
 static struct platform_driver xlnx_rtc_driver = {
 	.probe		= xlnx_rtc_probe,
 	.remove		= xlnx_rtc_remove,
+	.shutdown	= xlnx_rtc_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
 		.pm	= &xlnx_rtc_pm_ops,
-- 
2.43.0


