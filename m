Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32D8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1aPDc3pLTMtGBn0qwQs4lS11npWdKa2uPsX7K69hUoI=; b=HIGhSQpDIwzvOoJhP9caMl+nMd
	s9fpTvBJpP7Rr4dotYC6Dgb6Rs4yVxvPOPQRC8qIoN8U+e+AYUQMS1G0H7kZLb3qlVI+qRlWq7aUB
	4Eua4LgUx6mokrwCbsiyGoqF7eClPio1tgzgXXaVFArRlOjgnD4U2bSnva4bhw0uIDP1EbZ2Tc5/0
	yusHWspWak0W4nR6aZon+JbMMKaSmb+XFOloCcgZAg6M3+1penQAaUHl036yDKzWBRpt70n9iZ4xY
	KtEMaMiQR4IUTIk6yhuEDx1qlSIBWSgyqeTRO2zvNoRrT6QROw5wuWIpuGZWMrHsJOXJRoVg+6hQn
	gFAuj2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciyA-0000000COy7-2TFl;
	Fri, 18 Jul 2025 11:09:38 +0000
Received: from mail-mw2nam12on20615.outbound.protection.outlook.com ([2a01:111:f403:200a::615] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciat-0000000CKsx-3rHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV21cpLXFbQFW/nHR/gseYWSuZyfLfwYNeMUB8jeyqrI1UsppxYUpayft4AVMTNZj2oQeAXw/cKcqYUjsXcVB/fKCGdD8H6Ybq5JRez9euq4SLIObEO5X0dgqLSppz2k19xV46t+JJExZGozBaXTF25xM+FBbbTsfYQgfM5WB6H2D11BADVOtKJ3oPXupVuVebbreNm2w6CGwYzBWPUHTkeYqv1GDKt3EcNsi8SXUj1+OXjzJp32XR/ecFzkk/M+7DQmv4Nc7uAlaeUrifOqx+C4t+OidfOaiHEWrmrXIIDEbnix4KZMn79WUA5swZ58z356OeFNmbW1pLfbImBPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aPDc3pLTMtGBn0qwQs4lS11npWdKa2uPsX7K69hUoI=;
 b=ZGuRaUm0ST8Nzpe9bKKkh56jFt4EEPaNpw/Y48WK32z1mSMPSA3MBSfSU3yh4ba/fkCUX4HXpuld3Af7kMOdYClK6rTZWp2THctYPgYQJEzStZmpgKXvSHlxNrKRvGutGNxAOt6RxHZQ3kMWREBLqCnX8c3uzBnzShIhfSdEYlu20VLs3oV4vg1aQNlbIixq/N91w3KiaTnnLdtf+M4d/LkM6mmUqkBe+L53o2MmELTR/sPWwlcnYaViZCDdkCklsVFYm9yfxGCX1X8c7iD7H36zJz3b8xW5c4vju02QUvrkRwZgT6Lkv1mIwyfJpm/PyLmkOyvw3QscQ8njKpWjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aPDc3pLTMtGBn0qwQs4lS11npWdKa2uPsX7K69hUoI=;
 b=Ixk5Nj/HueBPp50zFkga77X1KH8nMG6hnte3DQucke8P53sqfAvMTDEdWOFvAceZupcbF7QXsxzdsIGPAIubVb+nLPNgeFTG/kzNGfpJmZ+PAHlqudPLY+oMXJFkKJ179BYH+jTidVfECWW8mrmMPqml6b8Py2WsafU6jrYWWak=
Received: from CH0PR03CA0435.namprd03.prod.outlook.com (2603:10b6:610:10e::9)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 18 Jul
 2025 10:45:21 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::9) by CH0PR03CA0435.outlook.office365.com
 (2603:10b6:610:10e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 10:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 10:45:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:18 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 05:45:17 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/7] arm64: zynqmp: Misc changes
Date: Fri, 18 Jul 2025 12:45:05 +0200
Message-ID: <cover.1752835501.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=michal.simek@amd.com; h=from:subject:message-id; bh=yz8DpwRuSGDm8ALBYmQpdh//CbUVTQ/NxyGWYqla7KE=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRUqW7Sdrm6t01gi0G3bRP70ekr1TfO3rH/5g//zC1Z2 7sd1lgxd5SyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBELogy/LOblLLlf2vHlmlP t51wz9KxbpnQtG5OUaNp8A6nW/sWV3Az/FPhj35b81TX5G3VkwVPojzfdc59Lvl0xpbidx2RKQb 37fgA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4ac463-6654-4139-ba9e-08ddc5e831bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GQgjl4CqWYLE30m+pfsq6w0+m0XwUq+ER9w5U/35/f/3jz0iYeHRkXRqbBgO?=
 =?us-ascii?Q?spT7BR1hB93N7jlN7k3cexAsTKS2PZ5wbQ9w9m9kDGwnXufrw5EpE459X+LE?=
 =?us-ascii?Q?NnTjd4BWpRJ8TR98rgmrVo51CSYZCAPyMd+3t+mIQm1RxgoGEqB1w2OCecLs?=
 =?us-ascii?Q?uwOH2NznvQAtfNd5Lc5p0QFVIGu3wZ8GCeE90z88Tx84rDk9/Djft9DRutrR?=
 =?us-ascii?Q?uoVaweAzm4Qvh6Z4PuuiaHZij5Wlb0hqWGVcsQCxm/FbwQaonEOHdE/bxiKD?=
 =?us-ascii?Q?i16pc1P/dzvRV/qWOo1nbtC9a/VV8qfat7mJNSMaoMUNmGcQ9cGcBuIqp8rW?=
 =?us-ascii?Q?UdLaj4dqYCE5ZqhqI8zXsP+mBLQLx7k341tqo/5xrgzf6f/1C9+63fDT5RA/?=
 =?us-ascii?Q?UsjgRwCKlvZ8jQBZsgVEKCepenRrQKc4YrfNn0j5BiUussDkU1f8bdabfA7L?=
 =?us-ascii?Q?UTFlkhlWgOisKqTv7C0schphJOh0y37n/jBUWYgt1rjuWvffYRGOydgjC/sY?=
 =?us-ascii?Q?1mOyITGv00c1TKU/L/T4gRVUJ2MDpwprW6zSBUwDlfoJw8wPvD0WAEHWDcwx?=
 =?us-ascii?Q?xGdv80EeP18HXe8G8cMG7XK1JbEg55bz0OyWFFiEcooF8pCWjRJoFwPP6XqJ?=
 =?us-ascii?Q?bs+2RJASyhse1rBrgFiz7eXuBkfw30Li48ibAAy4haq8zMP6aoDl+kmvVCPh?=
 =?us-ascii?Q?HUrafUTjWXg6Bz08BQCneWvKQCQp1qDUtpSok2RPszH6NSzgilgcb6n9c7NR?=
 =?us-ascii?Q?fBCQGqcEUeQbcxm/ilYewAjrYsYdAxWJjcaAVzyw+5DRcUcamDB2d3f1La5r?=
 =?us-ascii?Q?i9J1JM11p76/U4TDqmu4L5nJF5pnpk8var8LKgXyWXHULkm+GBzNYsnyAzVa?=
 =?us-ascii?Q?Kb74h2+eBLOEEKknwe7qu5LBHiYlzfQdcth7GWvR8YSR/2IzcRHphgIYJHLf?=
 =?us-ascii?Q?+NxfkMd6UoHPlE0+goae9acD3u3DOfYOZr1EheLtzRHj/i1YixZYAZ4cyNqJ?=
 =?us-ascii?Q?Vq0Gduz4gL+E7oW1Z/aVsCA7i1rHnk5BysZ/lEpY9sXI1pKdnTzzqoKnYnmW?=
 =?us-ascii?Q?kguk43Bsim767u/bgog9HOoD+ZQAUDhS4DAbyvUGxM04o/9iuheSN40AIP3J?=
 =?us-ascii?Q?Lv+4O5mFEhouXrVjHMsNv2dhuezkjrHi91STYQoO7E7aR574yxoeWF+mj6oA?=
 =?us-ascii?Q?P/jysnLtADZFkDMWCOT8eJFJ0oUxkoNqZdk/mQDhlMnqf/xIx34txZt4w3jX?=
 =?us-ascii?Q?PrPY9WlwWGbRjW7ynHy4+nePagm33aXWH5qCyDuuzuAMuBPcjA7sSsYPbBVA?=
 =?us-ascii?Q?o5V2WqIe+/Z/xq6MiRKnkR/FcYeCZv1mX2U6dYNkuO+q5+t9N87cMKwFQiyt?=
 =?us-ascii?Q?2wJa9NCTOdM7LjMzO6Qc4nMw1xjOu+6pt3JtaXmdEwbP3/SBDXkYZgjt2mcb?=
 =?us-ascii?Q?PSJ/YqyZ3SpQIFcygjVtSzOT4Ej7R40AlZDp9JCQfZgdkEFn5R1R/ELW8ZW4?=
 =?us-ascii?Q?rfY4mBn4iuhADZM+im878fy1TllEhwGWipeW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:45:21.3409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4ac463-6654-4139-ba9e-08ddc5e831bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034535_958317_2E936D12 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi,

these are patches which I found in Xilinx tree which have never been
upstreamed.

Thanks,
Michal


Michal Simek (3):
  arm64: zynqmp: Use generic spi@ name in zcu111-revA
  arm64: zynqmp: Remove undocumented arasan,has-mdma property
  arm64: zynqmp: Introduce DP port labels

Paul Alvin (1):
  arm64: zynqmp: Add cap-mmc-hw-reset and no-sd, no-sdio property to
    eMMC

Rohit Visavalia (1):
  arm64: zynqmp: Enable DP for zcu100, zcu102, zcu104, zcu111

Venkatesh Yadav Abbarapu (1):
  arm64: zynqmp: Update the usb5744 hub node as per binding

Vishal Patel (1):
  arm64: zynqmp: Fix pwm-fan polarity

 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 19 +++++++++-
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 35 +++++++++++++++----
 .../boot/dts/xilinx/zynqmp-sm-k26-revA.dts    |  7 ++--
 .../dts/xilinx/zynqmp-zc1751-xm016-dc2.dts    |  1 -
 .../dts/xilinx/zynqmp-zc1751-xm017-dc3.dts    |  1 -
 .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    | 21 +++++++++++
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 18 ++++++++++
 .../boot/dts/xilinx/zynqmp-zcu104-revA.dts    | 18 ++++++++++
 .../boot/dts/xilinx/zynqmp-zcu104-revC.dts    | 18 ++++++++++
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 10 +++---
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 20 ++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        | 12 +++----
 12 files changed, 155 insertions(+), 25 deletions(-)

-- 
2.43.0

base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf

