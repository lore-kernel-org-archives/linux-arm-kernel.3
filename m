Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CFACD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5SUIPw3uRSPV0LsL14eHJ/vGa542eKOH9eK3Bp8b2I8=; b=nIUFu/sXbiDGdoy/XQk7WFNuOc
	dFXYrwF9oFZ54N4QgWLH+PCoIuz3UxiOu+BsYBmhD0MMUwutfq7ORVLi37Xm1/mHr3FWYoAgyb/ua
	3cIVTisNHwBrw2f+EsxMJFBUgjuJPXBR0L7TZaXKPCXGbwfNsNxXS6L1Sf0I1FStvazUZg97xHJbF
	gL0XtavSoqg7PxegOeghzMh+RL8DT+DBzWooPaALZe6E06LNxfsV6au8FtgXYY8EQWCBLpobTRMQY
	kds7GJKQjPFeSEH2E5BGzPX6D7gvQT9PfqGX7UTKoBqcmhy+G2PtkHMtrQ/h2aSwWDh49Z8qEcVdm
	eP/iTt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6uF-00000000jxy-2Mf6;
	Thu, 18 Jun 2026 07:11:19 +0000
Received: from mail-eastusazon11012030.outbound.protection.outlook.com ([52.101.53.30] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6uC-00000000jwX-2hgl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMzKAxZFaZnIKYgVESX1IqzO7GGKDe3DyoykurqCKqMVgjNmK2m9XNTvmJuV9HphI7X8AhC4nFzLBtnt4f4Cq5Fpla9I7U6a35eWnZvuvnSOMvgf+k8EiqT4YxXl4rsYUIbyJ+R/5Wkqgg4QWk/uvdp7TLGaVTz9sa3EElwEdOFk+w+LY/HYHmMMk99tbXlOFM0p/wXFua7J7mMSCVzQuyasU1bLuR5bPCUvyChuDh7hOiIYziZ/I1CHZm1em/kYO37aRKye/BKl4HEAsB9OeIW+cR3K5dB2yW2lcKRJ0wRcf4Qx9wuOwVzZzK4kzB6iuz4aFPpZ4DvkwuM9C8IlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SUIPw3uRSPV0LsL14eHJ/vGa542eKOH9eK3Bp8b2I8=;
 b=ndWoWFxuEALSNy3JMcc60EBcCQzJGvXMHSVDmSiTPEusyR/cv70xPBvc6/nur7TtWseNb1N6n5tXUuxer1p5558FDMxaSeFzOZ+0OdYliiVcs95c/yAipRH6daKXuAlueey+7nwa/9tSCiLhh96nOGa2B8fS0GjxJZGQBJExcZEnVEmJ6DeRU/2r+DF4E7KHecRGBym/bvHD0ywVBaqHFkF1p2RAjKhYqlFOKAVL6nKsezl/vOkyvBFF+Yez88PQJOxK+E5JsptMho7P9HYC+qyPKqn3yFsuJkT1noZVxBNJ7tqVI5cV24f5sx59QicOSITOKxKN18ZyaYHQeFosMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SUIPw3uRSPV0LsL14eHJ/vGa542eKOH9eK3Bp8b2I8=;
 b=kEDlrq8HqKdApbrhdrngwKWH5J3v5XTVXWyXV107lR0ah+eWprGMekhDvj3O0/22odRhokmzwlDk3eCL1eh9x6NGOdrznY45aX+3Wv4n2PmOukLz7XAEmUZOW99aTFHVCttIWB+JUeGh34P7lLsrb8tLFGohS9Kmdnf2FsRXGWc=
Received: from MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::28)
 by CY3PR12MB9607.namprd12.prod.outlook.com (2603:10b6:930:103::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 07:11:08 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::7d) by MW4P222CA0023.outlook.office365.com
 (2603:10b6:303:114::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 07:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 07:11:07 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:11:01 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 18 Jun 2026 02:10:57 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nagendra.golla@amd.com>, <jay.buddhabhatti@amd.com>,
	<harini.katakam@amd.com>, <m.tretter@pengutronix.de>,
	<radhey.shyam.pandey@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 0/3] dmaengine: zynqmp_dma: Add per-channel reset support
Date: Thu, 18 Jun 2026 12:40:53 +0530
Message-ID: <20260618071056.2024286-1-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|CY3PR12MB9607:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ac8a26-6751-4980-eec8-08decd08c4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|18002099003|6133799003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: /idZklhEaEfMrSc2QiSrL7YO/1pKxdnmtX3YUkHNE5z+ipmWNGuMHLa86DKGRhil1t3X2Dkvc4Aa+UyLC8XkKS54AQWcxlAvq8Sc47IbVgp0bs4/o3sYV6osFXwA9+sfWWE4EoP+BoZN4dxFfzDIJr2Y+RU03yAYqjboKBGRdLCtLv9SwC6sTI37A+rCtfX+CHjrhp/DFcEgwcdL6fIgFHfCo9MZpQA2xtrIRMq48X0BMQowNM8hvYY9Tno0OCgSvO80Se5uFYYWJo/8nm+TVKJ8aS6aiPtFlqd0JNPjILRZ2urzDPS6LZAlmCqZJScTCTe8FQcr+u1LqAobpzFLBxm0rzG2m5hqczgc8akuRMEZDhtRPKjv4VvTrgI+cGUaa4M1wEZbo/egK3HJDC3J8MuxwUrRXBcE0byhGjMhyPNVl6Gc/C0gnd2BovmwXbK1Wy4WOjVtobYFoPL5mS+M332IYfziC2QUkDj6lZrCHOZZ1B9m1ELUPbPlFZ/bWEDIocHGCSLUxvz7KCHytzecYdIM/DwugUe7x3jFZygfeVu3yCBMJuLEXXn1Lx3nCj2sSJN9WpXGUIBD4JyoP/U7c7SFHrprlNiSkzBSGBRdh36QPYmDtnD9/A1qdS3lBuLvQKB7DWY3DPtmS3wUmm2wIQ8z1tAshj5oBp/0kzcQrDsKnyurlFxyzyWkvjTcSlovHi5yaPtGv64pjDsNrm33YoWPuPkAq+ckCN1GXIodlTSSrr+prhURDgxBdxQKU9uMXElf8aOEiBMAJ0dPpYzC3Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QPyJCZGyNIfMlm3YVWNQs41TCQJjPhSauurZ85Z8PRGZBI/ReLZW70sU227DCjCWz0s0vOEBsqfdgEdsO3wZsiAORJXonWcOWuCQTV0fNRxRFxu1GNdo7YgswcJee3xAgke03KRkAiLYr3pV/wAdZOsHh/U518gLnS6Atw+wxwUWCBaayckDRJBM/n9ZDMNirt492aeH3fNc3cbTDLP7q5VVO06U3TaVpkIrMbXZt5mQO+ykPyvbFGlPj1KbYQ9QLGzcDmlROIoiP2VlSCfUSDtMHxD0MBY+gfg9X139bChZAvJtqNigdOcnYqPf4QvOqh88xJdBpnWl21cBj5+omBBTJPUlaxcrBghN14VkoiTvZMQRGKhsU26W5ZBpLHaQy6sjSOg/S1nV6/xYOpcekxJqEBQ8gpn8cqRIU5vWCJK902Tan4uSQLWkBdRvqeUd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:11:07.6392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ac8a26-6751-4980-eec8-08decd08c4c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9607
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_001116_837788_A7574BC4 
X-CRM114-Status: GOOD (  10.11  )
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

This series adds per-channel reset support to the ZynqMP DMA driver using
the generic reset framework, along with the corresponding dt-bindings
update. It also adds a runtime PM guard in the IRQ handler to handle
spurious interrupts safely.

Patch 1 adds the optional 'resets' property to the ZynqMP DMA dt-binding.

Patch 2 adds reset control handling in the channel probe path to assert
and deassert the channel reset during initialization.

Patch 3 adds a pm_runtime_get_if_active() check in the IRQ handler to
avoid accessing hardware registers when the device is runtime-suspended,
which could occur on spurious interrupts.

Changes in V2:
- Added patch 3 to guard IRQ handler against spurious interrupts

Golla Nagendra (2):
  dmaengine: zynqmp_dma: Add per-channel reset support
  dmaengine: zynqmp_dma: Guard IRQ handler against spurious interrupts

Jay Buddhabhatti (1):
  dt-bindings: dma: xilinx: Add optional resets property for ZDMA

 .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml     |  3 +++
 drivers/dma/xilinx/zynqmp_dma.c                      | 12 ++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.34.1


