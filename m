Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D4C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6bnue+8GMaHUKPSatEml+7EMLVxGaq46JpLrYMB197A=; b=AfBVEyGpgw7qKuAOBcgK5xzLUv
	8PqdNF9A8zb8DRpt0jXrBrH7xjTy0JCyBQjHx1mIf6g9I9jFDt0aLcUbTkRZcgCMW29rUrgL7LNKE
	4h7n3hYAaNXGedH5SUKbr/PorqebaVsA3v+1T+AYirVZ7SOX84hBhMVaUzcxuCzebGi+dqwJ+EOUB
	rCBxBAp7ArZXQy7PcRN6mDebenDEzSrH92A07aTKGctW7IEdCAuIUGrcSp6VTty8t59n9TDvBkNIo
	bJnmKygrQ6PqG9kVbqUsF/BLakAn8ByXUU9uixJSarMhOtzOVCh+cf47PeY/To0SivwdmknZnxF5W
	ty4lrBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woddG-00000004lS4-1Pjq;
	Tue, 28 Jul 2026 08:57:50 +0000
Received: from mail-eastusazon11012001.outbound.protection.outlook.com ([52.101.53.1] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodcx-00000004lLr-0sYk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:57:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq1xDcOLCclZeLmqyt6meVu7nWA2TUPJDs0ogTCZrk0l/4lDeFVuw+zgP2V+pN6Aa1Q6bmfi2juwRQ+pgZW46GIMuzoGDHFS+gxwoXIBcQbTOLKMvRNjFNL034CgiQupBYSkiJ+pkLTfxX5W83bqSplsvdjBb1kDCAcKZwINVxRvv3CbimajW25IB/5RjOdI/FrSRSRbb9RNkQsY5w3OwDyc8J4h+GajDZK8BlPyYWLAg7IwIsiYP//v3wgXjR+4MRloXKQ+INrQZAh33F8R5Pbis8Jrr9pvxQ2n+F+A6XzXbdEDgXpnWOWGWDm4yK6JDsBzA/Ka4ejGs0XG9ipgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bnue+8GMaHUKPSatEml+7EMLVxGaq46JpLrYMB197A=;
 b=nfhcpMEXiVQUsG+rxgwFH51U3BfgJbNz2e6tzCAnok+EX+Cko9LWsZ69C6bUNec7QV4owtYL/QZ98G0wdZqm7SQs7PBMzJ6W7pwOEGwSbDh5npM7XPxFUkARMEMlPXbFhVxwFUpX5VC9yqRbaQoEenYb9bLdNbdozipga1gXa5twFmWTrQRPgh1Qz/XDha1yPj7jneOQDnAw27HTV/lk+V/4xh7aZWDrMk2ygDFoX7TiwwJ8j6e/STD3ueo88PPPpooPrkzmObzPlbg49EPJRs6FIpgMXrJxrYN6ydyh1rKCMkMbjitwjjzk1Xrie5wqOpYyliHuc184fJfAbsre9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bnue+8GMaHUKPSatEml+7EMLVxGaq46JpLrYMB197A=;
 b=Y818SZwwgbVr1VYMztjJOLLTNCCN1FPPr3XyV+xhd68N4TLltdFkAaWPJXYAiiml16QOSErXs0OfoImqxSeehIHjS9/yM1Jzz2sqmBs9ABoIoOj0XIAOfrKlzlhpH5ewGkF7i1Ub0gzoIitOH9zhsU8zFFf3yVFUCyVktGzH7KOoH9EMwvJCitafkw+bpDoIVkpHWt2ZbWmNq/W/2mx60xQXAmut1P/7oHFwZoj2+siBFh9unlYOM9QzqNgMVZa0hCZ/71rYwANde9WRBRlm3fzp6jAMUx1R/JPvVDgqK0RETKqJ8t2uWN2tDtACn7afA81mGZ+apdg9EzegyhoZng==
Received: from MN2PR01CA0060.prod.exchangelabs.com (2603:10b6:208:23f::29) by
 CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.12; Tue, 28 Jul 2026 08:57:21 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::28) by MN2PR01CA0060.outlook.office365.com
 (2603:10b6:208:23f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 08:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 08:57:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 01:57:08 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 01:57:06 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, <robh@kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<andrew@lunn.ch>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>
Subject: [PATCH v4 0/2] Add device tree for NVIDIA VR-NVL BMC
Date: Tue, 28 Jul 2026 17:55:08 +0900
Message-ID: <20260728085640.1001890-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bac03f4-0b42-4f6f-89b1-08deec863bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|10067099003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: keF8Z1E3UdPw+/n8UbL+jF2hh60NUy9Sv23+TM1GNC4tQk5ayKgTOjAwb1AZsiG7gTOuUGKnEnLwV8DlOYwNX2RFyVuw26HlgDgDtqVN0Ty4sSu4Ym/n512lS99wnBHOi2Aaiv8jLrNgkCJU9gMT0Js9akRMpssxwyCNym/6I7LLoo6zI6w89LP1TFpnzDyDV6mg7SeS3VdaDE0N63em6aXLHIRA9/0KdNeo5gvmt54/LeO1t4iS2OrRSZPsqYNH/o3+0kySrzKZ7Lk9HSBiIT32LQra2q2H6Tcl5aWyNx161DZVbsGAvSzvEy/TELEp2wM5J5qj6w4rkopMJ7cR6YL7oZ+ny64ccwsLFIKHMTOOD6hzL5HrRWw9xAL9BVS+vOtWYehd6v/5VS2jjg9E4vD/SrGlAa9jwFxDwkxceuJWDyOhYFYKhPo/7GTSQbkC2luPrOtLn9nJ4gnbGCshj+jZHxMCK7H2HcnQRnYqclD+xv5GFdoVjnK8PdaEF+kvaAgEB/37/Qaa75BxKQ4RyoUQL5bl5wb0pCcw/8MAHkc9JwjgjWNPnLizriTCCnhIzLwQRRkU1orMfa9gmnCnh/xIIeTkv+xuBjcHuVpfCngORgu90wS/fxrosXzvWx87YkvaR33mVRr3H2EcC7wfXQjprc+G9c/mA3Lv+Ztn69yrgugKVEO7xoI/yjfljN5LhB732MV1YdyJ3Qd2lmyLCw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7Dyz6+Pvx5hfey0MRZoahxvKgSfTv4EBUZDh3lW4nX6i4vceevZhG6dFzDH3qetnBM2/n5vfIaDzJYVn6mR/sJr1iKd3E6GEB917WztpzHGGo8t4q+lSnksNIY1Jk0RLAZWvbquAGzAIY4B2zyiTO2MeaH3kOxiUs0/+iIIM5LZ2iS08ogbHO78O2qniiNTztGvKaBnQmLydGM8tRZArUqsLCmlZ8iqB/AWIJyO18nti4qCzRozjOdr/NW73NbCeBLgaHf0zvbYlGXnkxgSCCnCj2AexwodZ0nJTCNSGU5KCaMi+U1ZjmM7IVSWSn7UfX1orbj8zZh1s1ba6RBnIIZSNDNNuSjryedZFfvooR3ub64lSkXnP+0hwLtjKubcToBQ9MF+Cqe/5GrWCIMIXVcv/fzRvJ9t5m/KvHJImy2DLH5RAyA0RRJx8KIOwbuZd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:57:20.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bac03f4-0b42-4f6f-89b1-08deec863bfc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_015731_319005_9B793AD0 
X-CRM114-Status: GOOD (  10.90  )
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

This series adds the DT binding compatible and the device tree for
the NVIDIA VR-NVL BMC, an Aspeed AST2600-based BMC for the Vera
Rubin NVL compute platform.

Changes in v4:
- dts: address dt-check-style findings for property and child node
  ordering, required blank lines, and line length.
- dts: retain conventional multi-line block comments, which account
  for the remaining 8 mixed-indent findings.
- dts: retain 22 meaningful unused labels for source readability and
  future references. They can be removed if preferred.

Changes in v3:
- dts: reword the &mac0 comment per Andrew Lunn's feedback.

Changes in v2:
- dts: correct the compatible of the PDB I/O expander at 0x75 from
  nxp,pca9555 to nxp,pca9539 to match the actual part.
- Pick up Acked-by from Krzysztof Kozlowski on the binding.
- Pick up Reviewed-by from Andrew Lunn on the &mac0 and &mdio0 nodes.

v3: https://lore.kernel.org/all/20260710054849.3178747-1-jackyhuang@nvidia.com/
v2: https://lore.kernel.org/all/20260706101526.2556226-1-jackyhuang@nvidia.com/
v1: https://lore.kernel.org/all/20260702165524.2168091-1-jackyhuang@nvidia.com/

Jacky Huang (2):
  dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
  ARM: dts: aspeed: Add NVIDIA VR-NVL BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts   | 923 ++++++++++++++++++
 3 files changed, 925 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts

-- 
2.43.0


