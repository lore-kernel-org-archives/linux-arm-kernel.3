Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35815C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dkSAFx3ZvLpceW0cZFgVx3mLSASxC60pjiNxF8y1y/c=; b=scob7N0TWncAzIsXtYUFPVwqWg
	XWVIvqgbUMPN2/FwwcrdZjLByg+iO81n/kmhmzotGGysgUv9oDDwc2NtIvMcrvkRO8WkCWYW/74je
	x1wHDHcrqAmNkZpP6xL2ettZq/sjJwpOPXI5faLDIUIn6hyX8M0nW42f9+Qb8nRCiViDFQ8/4pU0n
	V1ySdQ8ZovR7oRxGff6MbzMeHxjcnqttHS+b0BnzTx7Bnb9Bw7bHZ0p2yovqiIWQoJ/cPmujDFaUR
	qOj1WKfZ18eUNdZzgrEL9V4rVVb/hTuY7y8gZ9Xoe0VDM8t58+/RB66ubltS5gnvbr2k7G706CN0W
	2Ts0C1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpWv-0000000BeHE-0myt;
	Thu, 10 Jul 2025 11:33:33 +0000
Received: from mail-mw2nam12on20631.outbound.protection.outlook.com ([2a01:111:f403:200a::631] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoGd-0000000BQnG-1qyl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 10:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q48ZQrZ4BCVXtEpCoZO8O2e1yZ013gAjKcL+0ZfZZP2lDeYIDhXUM1JunM4DjLfztHVT9dYV2IahqCw0RwuuJwIC+KUXKYEWIZDh4mGBAfwsAB5ZpmiwuogJrKO+CGmEUjluEihRA1PQXjHr4P/wsoiHtH4SA1PlxsBoo9zgrdh1qSV6EwqtsUcioUSvYBonE+f+XmkAsFmCt8Rw9Zw/4a0LKxLUEQuSth+mjYlkmT31MziF0EPIlHm5aO1lE3VBD1v3VKcr+Pyrzxo2mwLz+grQUauw9OJAnukbxIeHWAmxLX6ZWgV6b3ahc/jjimQpPRsZBIeYZqOMqL5uMcEfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkSAFx3ZvLpceW0cZFgVx3mLSASxC60pjiNxF8y1y/c=;
 b=Msx16EmThzoMESqVSysLj+61u7J37iWnpTwA65Q4CcTWaS4dn5SnbnDtR51YKKm3SrxRePETeOFrhs3QgosacmXNvA5pCc1xG4NQnDNjsUFKhfykMXPD6PyRhbZAAvDSayQ/LJdVlO4nA/Zl4z+5s6TgGIJfx0cw9yr5ls6jFfyhZV7DGuahNR98DhgF7YtNlnaDBUulqqAzA/n11r4ufQrbA6Jb640SvT2qJTr0pIXdPIDVFfqCYd5+PNGNO3RsagMwiGNL7gho6701rnGSEeU/wQub5GYypR0quFv23+CIZjoVyzasQdp1eX/CkXZlxvEg0r1u7CKxMDKdJVWf5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkSAFx3ZvLpceW0cZFgVx3mLSASxC60pjiNxF8y1y/c=;
 b=p0Mb+ztOzSB2wrtkjAkcAfDwGs5R+etY+RPpLwKAQW77JxOsUdogtvopbOBXW19G+/3ExiKu4FoE2tJzdI7ljWvjsndRLzQGfOD/ds82VxQaaoEd/DZuLzCfc0ROdXeoixMbc5E1Fb5iOcQ6v4lBLsTWfj7vsyp9V1KgxSGVsEE=
Received: from DS7PR03CA0338.namprd03.prod.outlook.com (2603:10b6:8:55::31) by
 DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.19; Thu, 10 Jul 2025 10:12:34 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::1c) by DS7PR03CA0338.outlook.office365.com
 (2603:10b6:8:55::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Thu,
 10 Jul 2025 10:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 10:12:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 05:12:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 05:12:32 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 05:12:30 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <vkoul@kernel.org>,
	<radhey.shyam.pandey@amd.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<harini.katakam@amd.com>
Subject: [PATCH V2 0/4] Add ethtool support to configure irq coalescing count and delay
Date: Thu, 10 Jul 2025 15:42:25 +0530
Message-ID: <20250710101229.804183-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a6a05c-7ea0-4bce-9950-08ddbf9a4997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?03G77YZ2YxmcsM16Auzt0uvlf7dtKAPETATsSFrYclDDQL1QEyqbQp6OubEj?=
 =?us-ascii?Q?bRmOfjwQPYqyr4MPXgjfL5efBUdYXpk6FtcmiX4FwmkfToQzwRXHikXDnu82?=
 =?us-ascii?Q?P875gQAPjqEhLCwGdYfOpd+vFo9AUAjcWjQe03J4N1IWnlHrzBp6vA5y4I32?=
 =?us-ascii?Q?/aW59Y8hRF6bpn9rU5+kSGuc/BFnymofCMnX+0CauWDTA2APZRpTbiDPWEkS?=
 =?us-ascii?Q?OMWbVmGh2C5+2r3mJFjUCMriBMO5qpQ2P0HC5EQt2quMjFg4QeVQbLifsRDo?=
 =?us-ascii?Q?QKsOCB/QAmX0iVQRHsWZhL30h5A16ki8oLbReq1GZCH7jev8VZCpqe3aVPLn?=
 =?us-ascii?Q?E2/Nz1oi2ujZC8/ZSIhYwFTsb9WlEkX2rfeT/zaMU0pNohFfAnUslVGdoAmh?=
 =?us-ascii?Q?8TnU5hWiqXsUd6z84wbn20Q77bEG9Oo57TPHhg7rMfusIJZtEIkfGJeublyV?=
 =?us-ascii?Q?fdb/yJ9rdtNI7XQjEkguI5Pp++1yIviVOW7uYdXO3iBY2TtFFxFBLgDUFxwW?=
 =?us-ascii?Q?domuyBiq+pDFtsUq4xsWUPn/VsCc63pyhkxSwXyPMyyX9DLGVBrdePE0J+Xf?=
 =?us-ascii?Q?Nq29wr4+evNQwcNS/o7z6piUOuBbGCap+Aid7h+Y9cK1FRg4Sog3b7ZNVCbu?=
 =?us-ascii?Q?Uh0qXdrsMwXmzj0Ik73AlZlkLaQKl5+UcW2XjzMGTExi9vlpY18pCQ9pwKnT?=
 =?us-ascii?Q?xVS/28ECS0cvOdBHM6eMfVR8O9sm5EHAY1fruCiicIiGDFczZVJpLiiQU7uA?=
 =?us-ascii?Q?Zzvbcq0yaIqH9qMZUh5WHyLiCy49jAFX87MU/NoJUmcyEU2bdep7xWW3AxSw?=
 =?us-ascii?Q?Mh9Ii29Jmmkj346VK0GbrDaMNEL8rK9/T/nZC0XfNz2MYadSvIq7xkl4euDu?=
 =?us-ascii?Q?1PZA+KTW9BnOvDm2lwYKYfzH5tjYhLTzFSDGhZLzhdtvNlCIW077fX59SwuC?=
 =?us-ascii?Q?woleYcsT6K3tl9J4MO1WAxmUMxLEW9qUSwG9THorczB5PfbygQb5qBASrONZ?=
 =?us-ascii?Q?svAtDMOU1p42NY5/SB1wR6KPTAFPPKTAvzg0T1MKLQP7Oi/m6+A8M9UCIoSp?=
 =?us-ascii?Q?z3Sx/mH6XUSZWEYqEpVOg66HFRnAFlxTeVyTaNzcY6uJCEfFHR4aZpOFPU46?=
 =?us-ascii?Q?HOF3Qe/S+pGcMVnPhmDQ/XAKKnmOAQtFRntKBuwFBvn8G1WXih/fvVFPOzoF?=
 =?us-ascii?Q?4ECTsLK1W1F3TG2Q5b9uqZ/7d4uPM7w6Uz76wJr9PlxXecM6z7ZPZ04tpctv?=
 =?us-ascii?Q?LIGtTeVNU8XWBy8q91Ke+2NJSQe8gIml/esxB1Olpatr+NXk5HqzQsAq37yS?=
 =?us-ascii?Q?rAuLdJJjrdyzqcvAyPrmywWipklXyns3+hXxqm792G41CPbnlxUpG7qBRr3F?=
 =?us-ascii?Q?lElpWjnIaCR+GdBzLLpleoSImM3+Xo3TcoFSo6DpLS+YjxRN2NzxXzTQF7H2?=
 =?us-ascii?Q?jtfJBmcUzQ3IZNt9Nm7cQXq4dgqOPaE3lb3C72/rokVMvTtqghS0dG55iwYt?=
 =?us-ascii?Q?55COzGNLrxHEJZRF9BiDADoYO3uNivG75MIn4PAIS/g042RXMhsegBLmpA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 10:12:33.6274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a6a05c-7ea0-4bce-9950-08ddbf9a4997
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_031239_766347_B5C4E50C 
X-CRM114-Status: UNSURE (   9.73  )
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

AXI ethernet driver uses AXI DMA dmaengine driver. Add support to
configure / report coalesce parameters dynamically during runtime
via ethtool. Add support in DMAengine driver to communicate coalesce
parameters between client and DMA driver. Add support for Tx and Rx
adaptive irq coalescing with DIM in AXI ethernet driver.

Changes in V2:
- Add DIM in AXI ethernet driver.
- Fix following LKP warning in V1:
 https://lore.kernel.org/all/202505252153.Nm1BzFUq-lkp@intel.com/
- Consolidate separate Dmaengine and netdev series in V1.

V1 axienet and dmaengine series:
https://lore.kernel.org/all/20250525101617.1168991-1-suraj.gupta2@amd.com/
https://lore.kernel.org/all/20250525102217.1181104-1-suraj.gupta2@amd.com/

Suraj Gupta (4):
  dmaengine: Add support to configure and read IRQ coalescing parameters
  dmaengine: xilinx_dma: Fix irq handler and start transfer path for AXI
    DMA
  dmaengine: xilinx_dma: Add support to configure/report coalesce
    parameters from/to client using AXI DMA
  net: xilinx: axienet: Add ethtool support to configure/report irq
    coalescing parameters in DMAengine flow

 drivers/dma/xilinx/xilinx_dma.c               |  93 +++++++--
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  13 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 190 +++++++++++++++++-
 include/linux/dmaengine.h                     |  10 +
 4 files changed, 276 insertions(+), 30 deletions(-)

-- 
2.25.1


