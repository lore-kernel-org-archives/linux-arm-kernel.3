Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65057C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M2YPgBHQuoC7/WB/SmpuDfCa5kN2HhPaOepCnlv00Ww=; b=HpoGrGxGi+Fq2T8/zEYqQ2Ncro
	fFxTEfJEo7DSwmXSussBdfFLDEaj2n9PeFBQaNrfHSsP1mx71r9N+NN7km50Kf7b8S97hOCoQNBcH
	e5UaPxlc9Rm6RBF4k0Br1djH8FMPhFMmSEz9jnGPFh5q3cfJtlqqygvsY4Tbk11IvcB8YNu18LhKE
	+3ytljw6rj1igAzN0yYG5+QXk+/OlP2QKklMJZ4bSXfq6Q1i5UGSplSNX/AlY3e/K3F07AdIss8kE
	bWOIVvJhwZjzevzmSX/GZJBbu0hDrpaHs7uRiffKsUX/b0Oaa/w3uQeG9Jv7/IF+Z8J6gx/0iLUmg
	BapEgM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmi2-0000000266k-3p8R;
	Thu, 09 Jul 2026 11:14:26 +0000
Received: from mail-centralusazon11011053.outbound.protection.outlook.com ([52.101.62.53] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmhx-00000002644-2ami
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqufP+cHUpMwcxt9M9MUTa44G2H9umc4I8W+iZim9Zxio2XoXUppuMs5MvQsl2A0OkyzMlKQpOUOCDg90LdmG9x316FybculiHqox0YOv04qhWRfaYpQRK1vrPGGRDDKHbHl0lwE/5UY5ke1uZEHnIqR4Otw7Mmbq3ywhymMdrbqcCFKpaOtR6kkhdA8vke6OZKvG91rPipjgP0MQQG9I7UAjvYYWJL+JiCn0+1vBpwMEHdUZ3sFCZYiFJkww9SvdJF2RJNERXiG7Bk8BK4MMy7W3x5sUxARKQQbMRBGezLyfhEsU6/OXNFoukjB5uY/B12LNyjSfArzIs29+xZ4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2YPgBHQuoC7/WB/SmpuDfCa5kN2HhPaOepCnlv00Ww=;
 b=TYvaCuA7lTfzlLoO/mSmE3wHlPTB2kH+3sWHaeTHt50ad4Sjw7kjZCWp7ch126zFaJZh9B8tlnGCvfhDSz4Raumz6V0LcYJnXkwdaEQztvwuYHuc/NBUDNxueMgDh8ZA7rnWhpRJhkG7/jx6jzeTF+i+ewoDO9iTyGrqLIaWpwN5O8jWRFuo8hyomPJT5/JnmOZURIeICg2LVPCSWV8WKfLGUwbArQ1HiZZlbNUXKr4h/TSI21UuoF8tJ5LDZZw8cyyfvyiir8g4alVnXINXiye1/OqCVGD977e/E1LCIYRPlGpaaX06wGWh2RywrHnshWNcDBERxeLmcp/hGAPUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2YPgBHQuoC7/WB/SmpuDfCa5kN2HhPaOepCnlv00Ww=;
 b=YpJZK9yjLE2UsaGMLruPStWXJxPlj4prplV6jqJqSX2EKwnlEYGFdHG07MIGUjU0rKqXzOxlA1NCdLZqbIOwqbKJ7zyUwnRjxxpYaGNuy7kWklet1QXJU09izubXcZPVkLCQmDDsde9WPO9OI1QQi+cURP9UpqH/mbEE5RuMnVM=
Received: from SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::19)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:14:09 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::28) by SJ0P220CA0015.outlook.office365.com
 (2603:10b6:a03:41b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 11:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 04:14:07 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:03 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/8]  clk: clocking-wizard: Add static-config clock provider support
Date: Thu, 9 Jul 2026 16:43:55 +0530
Message-ID: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: d653e5e7-cdc9-4a98-8240-08deddab32c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|56012099006|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: mJE72Ep2M21lJYLGzcD22Kwjv8qEqEPGMc9S/vXkz8wWLCwDG1XV3jhcxGYbJGtNeVSovS3ZB0B1vlvQZ+VWl0GazubQi9fQ5YHyTjwBPhBbAqeEz5GMku4+wwtzjgF3yElvxikCx3LoJoP1Rt1h9XFwYqM6nHG7a7NmG9f0KWleDDOMjGhycPWuJkbSdIGF8LXLm3frenvjTkmUDR8Z6zBXK1gQFe2hZWRtGkd3sS3YRSKl4QZtmL3mKXGgduOi4z3zzFebNDG/M8SWsIaHI+0lnh1Be37iPp7/qoiDTb8LOrhcYE8lpODkBy1mJAqTyApGciaqep8A8OozN3ycAduOjQYqxcvSobE0wl9k0DQujtt0VJ+Nl6myY3MmEWj8E76Bklfv1jioAcHihQUT14BJYQAngIGaDOtULo8LABrqR3XzDjBgt4M8JaykEGjwswGXrRCYHZyHblGn7CvOT2d2XUyTWCbn0AhYyxLDcdS1ZWRtwkJrIh4LG4kIFySYRgT27k/arwXVkTuzwomGn3nTAXsKBYe5TtBf5/76wdsfvA+1YXzEFXyxz8/ub+g7qfZRI7otqJari/J0fwBAn1kiJBHhx4Jdhg/NrgjfXPeAyyNqxvmCx4nXE+JhzEnknQ5WIsC2pdDp81O47kmxkzlhTqkquGWdd8YIN/HpJFkTsKtJyTk73imbrf+qIP8YoHyhenYYFWzTGEt1xC9B+Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(56012099006)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hzTsz0fJcL6z5fyy/8oWhyxaRSPnHOUeKjBPjJHHHsmzSun2VYyWEV5V1TCG+vpGP+GU0phixaA4diSy9F4CxNwSA6bJmJ01aAo0xfhYjajkq/xR9/uYIeswD+d0BVC25eKvIi7+dOtIUpwBb1b4yFoqCc0SYzmEkltDD+gWLfEHCOUMRHaYggyZA0QHPxfiLyZ+QLHDBTdy4Lw61nMEY3NoMFPYFQqqbGzSswC5LZlZq4RNPrXUrSswCQwfo80z0rdrm3JdEbi7IN8Py7E1DFAztqg3dwO14Ni8PSWpJ2BghsgHNNCTiiE9MJb4+oOtWl4YWH8oTJRxfhPOwE1Rvrrdh3jvIVOSRs1tEmnYwtA2X52jw8wV3RC1XQN7ch9YRwTZ5Z5evJc0Xn1r1XAP+8y/DCh9u+tDYAUrib9SKBOGvHF2dg904dQAxyds+fAo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:09.3391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d653e5e7-cdc9-4a98-8240-08deddab32c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041421_658520_02CDFCE9 
X-CRM114-Status: GOOD (  13.80  )
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


 The Xilinx clocking-wizard IP can be used in a static-config mode
 where the hardware is pre-programmed at boot and no dynamic register
 access is required. In that case the driver should skip ioremap,
 read the fixed multiplier/divisor pairs from the device tree, and
 register fixed-factor clocks derived from clk_in1.

 This series:
   - adds the xlnx,clk-mul-div binding to carry mul/div pairs
   - makes the reg property optional for static-config nodes
   - skips ioremap when xlnx,static-config is present
   - moves clk_in1 acquisition before the static-config check so it
     is available in both code paths
   - registers fixed-factor output clocks in static-config mode


Changes in v2:
Merged the devicetree  patches
Patch added for notifier block and division by 0 

Shubhrajyoti Datta (8):
  dt-bindings: clock: clocking-wizard: Add static-config mode support
  clk: clocking-wizard: Do not map the memory for static-config
  clk: clocking-wizard: Move clk_in1 acquisition before static-config
    check
  clk: clocking-wizard: Add static-config clock provider support
  clk: clocking-wizard: Skip s_axi_aclk for static-config
  clk: clocking-wizard: Use dev_err_probe() when mapping registers
  clk: clocking-wizard: Fix division by zero and unbounded register
    write
  clk: clocking-wizard: Use separate notifier_block for each clock

 .../bindings/clock/xlnx,clocking-wizard.yaml  |  53 ++++-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 195 +++++++++++++++---
 2 files changed, 220 insertions(+), 28 deletions(-)

-- 
2.34.1


