Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5528C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfSJcPPigLkZyh1D6Y6A7oOkGMN6ysCldYgH7QN1GW0=; b=IefY5VNQ7cusn4+iXd3c35tofZ
	L9CA5+cwX2C3JW4ro+kxUFoTj9yGBLZhmxLvke3s53wcrSP1Try0OXl0DZYWd3dr+gMzVRTn6NJwR
	xQUOsr5VeBkK3mKOKo/uRjCXGzZJpvgXFQWTjzATOANARyv6tioaPoaluCPpKfxPPwkUYnq/TX6YY
	fTkGzr6qOJZtkbfCbNi+j0FF0WCinQTfNyvysGiRoHdJAXSwZnXzhWSp4tuZsu+wslhCCORKt/MPQ
	fsw60Y3AV5pVddC2RddQr0nZQ6DWoRNBpSSwTlKXTRS7urgflfv8J7MKJgigjtfToHyb2xTOrbZ24
	5k9KLDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCbk-0000000G0wd-1G8H;
	Fri, 24 Jul 2026 09:54:20 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCbh-0000000G0v3-2EgY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWYAA/yAzrRrERl7PBkwgKuYUwgPZ3/bcX0cB5SJlUBiWg+DfJhGDNgvyGpXC3XpNsCwcfLblWYRiHBrv9fTWjH4CLy3dvM+EvreRAYfj699/NL3ed540SUwhQ8PXr8CHadtG7pwCFzqrnPUGu8MN/Wg+GlYpkP935jh7ViilS+XNGMl+HvUFNpOAPYxpbZVyLTasXgMwRZG7nhYDSAK+nK1VkalXbcPkVF8VdYKe5ZUiI891ua8hU50H6nKPQ82jBINzi2sd2VSnVQE+noG/4RuO1Q6YJCPSz3RFtMNI59SJ1AXypESLqwfhmFCDls1Inn51x9YfdSo5uO2Rr2RsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfSJcPPigLkZyh1D6Y6A7oOkGMN6ysCldYgH7QN1GW0=;
 b=ZJOcGEY5ioHWx4FauFPcMwJJ0vPBO+W3k44wIZcImd7F0CgSYDq9mTkoLc3ZHcreYTKOwBYV0d3Tyfz8DmA6ENDDeFtIcUWPEvyA6SfLhylD3iP44e2o+lOeqdT+IbNz8EUn7OFo239GnKzOnoiTb991kn+lnX+A0zYOZEPlRp9StHwUTu4+EkMCvajW4xO+E3RxcfQVe/1duj1OAho2SgF0QIudvOggn2WYRD15B6+gqPFzyRFWspSfaAgUHnHc7ke5yGrbtXo6chggwjnSlFGuh94/G9loGZjkvoLAclsdiFLJzv97N814wNHLtgMLkE7uAyPsnjg1L6t3qkZIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfSJcPPigLkZyh1D6Y6A7oOkGMN6ysCldYgH7QN1GW0=;
 b=j85JXuOiKI79Qjl50scbp95gxgUOLH64vg0+fwYbpO4McCPjxKyQQ0ha7Sys2Cr6HiOklZWM8t83y0dRAlEPO9wd9UEEQpn7b8RKIPzrQ4uqfdOu504+nR6pLPYGGObZyej+lLg+PSsCUGvpXRI2BoajQW6/lWpDEBT7SBOeQAQ=
Received: from BLAPR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:32b::8)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 09:54:11 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::4a) by BLAPR03CA0003.outlook.office365.com
 (2603:10b6:208:32b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 09:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 09:54:10 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 04:54:10 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH 0/2] firmware: xilinx: Feature check improvements
Date: Fri, 24 Jul 2026 02:53:50 -0700
Message-ID: <20260724095352.2890326-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|IA0PR12MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: ac83da50-334c-4bb4-24bf-08dee96982e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|18002099003|11063799006|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: uB+Y3/AbIm8CY5NvJ1sE+dkthLuI8BHdvZL8/QK31bi2FkZkjlw/uofmWf8JKeXf2wKrvDuB4PkOQw9WelPaQca+o5c5jVMARJglZ9NCs+ka9hIsqrcB1gO2H21gy31924seTxHmwEQj/Pb3Efuut5wPQBGvuQdHRCE73uV16L99eCcsTYkd2iXV/o0br77FhJIX73XkafBrChp9jb1HXqFMhys5GNuy9Zy5ANhFe7qFGmc2fqJwrpSmwlAaLtiyxOsNx3ZIWwsOGfdoAir1p8IIvEpMZlVUPvUaXJSiJnhZT14mraDVjCRFeBMT8jjofg3OK0WB+4FxFrG/IVLNZKIEfhEZciYc7vfYumGEIc9sOUvUqkV5oqPiz5qk+iBEjh7F8kgQoFjhIbwmGCJCQaZoyk3oejQVqwgy/M7Vn76cSsYUK3iW3syLYkd0yibwI8gxy517tw7VcGTdtTBfheMX0XSw4IrDWJ73eUF5TysloaDjmyy7ZXld+93s49V/4i9LcYMqu3AD28GlUpMmMsPImZMb0W3ulczUF86DqkS4EM2PI5EGhznjEzBVimjVFf/z2ZqVQxTZo29eK8FfD8PoNQEl+zUBEybI/QFI8uga+08hP96wVMwiaYfFXxxKD7jtmrN1+3qn80NNqtpPDbGUozYlty/WA9SjUCvhyQgh1VahnEmxfHHJ7EnA/jOfQlRedhMQftV9kwqg9v0QQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(18002099003)(11063799006)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oHdXB7at3wIJb9Uq7hB3ipxn6xCM1qQixxBN/LyPHiw0WEiNr5S2ibnlZRu5yGdh8Xtk/ygN6x9Trl+SOb+tgm+aiQ86G6rCPPs6c/XTHt5s++9eYcwpR2wGes0x8AoTOWde2JhhkUFkcGIV5fn58wKDrr6m+KEeCmB/ZbLOFL1n3U3RZdy6IiSnDw/sbaVJHMWW/EUCEA9xnU8jrwYI7vrVKIlX5/AL8fHmxbqZGB43hyxFNfKREAeewdRV4p1eNrxSYwbNT5xx1PM8C/cSYm3yYiJQzTbIFTlPPR44OOQHjhuqlHtW1lZe17Db90qqFA7ta/D7xyyNjqo//J3DdtkGNQMboKan6BbCoLrVUIkox2+o3woWSPKhR9aZFrUe9KCJqk2voGaGYBj4eTWI3XcZVCVagMfxcf1QsU91uSu3cas2R6Bc8ltEH/Kz6Tfn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:54:10.9534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac83da50-334c-4bb4-24bf-08dee96982e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_025417_574846_A7189DC2 
X-CRM114-Status: UNSURE (   9.27  )
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

This series contains two independent improvements to the feature check
logic in the Xilinx firmware driver:

  1. Use the TF-A dedicated PM_API_FEATURES mechanism to validate
     TF-A-specific APIs instead of routing them through PM_FEATURE_CHECK.
     Falls back to the legacy PM_FEATURE_CHECK for backward
     compatibility.

  2. When do_fw_call() fails in the feature check path, propagate the
     actual errno from zynqmp_pm_ret_code() instead of always returning
     -EOPNOTSUPP.

These were previously part of the kexec cleanup series
([PATCH 0/4] firmware: xilinx: Clean up firmware and TF-A state on kexec)
as patch 4/4 but are split out as they are general improvements independent
of the kexec functionality.

Jay Buddhabhatti (2):
  firmware: xilinx: Use TF-A feature check for TF-A-specific APIs
  firmware: xilinx: Propagate actual error from feature check

 drivers/firmware/xilinx/zynqmp.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

-- 
2.34.1


