Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1485EE3682
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bz46680MJy7lJ2kGX5Hu5TMlXFdS5ZCD2yZKBChOJwI=; b=CYDjTIZAxvsCWt1V4ESKavcUr3
	n9X5Gs1LHAZLUlX2AKRrIp2++pVGgPt9cMvpCGz+jhKSHf7EpvPCyecF+raz5WWNkiZ6MV0g8YEYh
	/1V8f/QxG7hvj/aAWegobY3pJCalu//JkfaNaLd2whS0jDiXxIbpHnTPYsHsz4LP74s3gNh+cNP0H
	CTuDf+RwDYXIp++g78lm0PjK2bzO4MqPQObiwXnuPgk5k2IAgSZZ4DTHDDBzvknz9gXxygBhCBSuX
	8xABPW1BqcNV+K4xeJsyqyINYagNahh8OBvIqACFmLtpwUOtgBN29u2btQnwihbEfkOZShAOa3ToP
	Y6SZhQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX7S-00000002A2D-2JiM;
	Thu, 12 Feb 2026 13:52:34 +0000
Received: from mail-centralusazon11011023.outbound.protection.outlook.com ([52.101.62.23] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX7P-000000029z0-0bLd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 13:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt1rTSnMhVkC2cIgCVe7ntFBXyCiMytqZ/GloXL5Dp102XtDXSXtgEHohmMIKF1jZOV+xRS+AILDBM1WJbWLZk3H1hhVM33OzGK1O42zep+mbjgOKyROnY3H4CzeXFF/ecO2qanXq60wbN5zCoWd3flpXqG8ivX2fI76k8CMnonjV2c93gwDNbjfwVI9Gen4oTuVzfwvt/Ib1A8AAPieys1z/kDeOpiTccP8t20YCyJvndt/HELUy8nQBWLC9N1j4Oshk6/wjMpNA3uyeUOmHgHZDvvi7F0YC8jryE7wfl8wQ2648GNLq6mIEc3nL4EfRPp5m5mpZ0UUICV1dedwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bz46680MJy7lJ2kGX5Hu5TMlXFdS5ZCD2yZKBChOJwI=;
 b=GNu4NiKapX1KxaDhLYHr0IKHarxgMGLeeuW2p31Kt20Qv+7mBTJ9J88NZhxfw+PafsOqajoHdKJ9qI/Pc2Pb08CJSbUUneS2nxYM1pZP1mA9sTV2mCv7H+ewOPSLVOqy+BIUHf2QUvxt4dd5GADeGEp+c7RuQohjUdBnBDbJozC4SZsDNVBxShOPN6NCppaBB9QybeklW6H1PCR8O7rac3r50BiEvQY+2UVASCHf/lC5OG3p4fWL9TfkCUXkJcBHHYzJtiBkkV173hgUrv140kK1oy+dLrToIGOEPqdf9pMgezA0KEiz5HLhNfFTsLJU994LEesjjouy1X89VtG+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz46680MJy7lJ2kGX5Hu5TMlXFdS5ZCD2yZKBChOJwI=;
 b=1UY7xrnZGJoxBrwX39acGy5LFtUpaD9VQAcfkDYZdOGbnB0J5aoVEbUh1NeV8vLd7ok7o0Cemal5jJ1RSJzQO7ODL8fghhdmkWMpd90wb/LWv5QpB0f5BbOCp4peCxUe0W1u5F4NnB/upLel+aP4I7a3BDUP0cNtONzvsF20/UY=
Received: from MN2PR20CA0059.namprd20.prod.outlook.com (2603:10b6:208:235::28)
 by DM4PR12MB5843.namprd12.prod.outlook.com (2603:10b6:8:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 13:52:21 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:235::4) by MN2PR20CA0059.outlook.office365.com
 (2603:10b6:208:235::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 13:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 13:52:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 12 Feb
 2026 07:52:18 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Feb
 2026 07:52:17 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Feb 2026 07:52:13 -0600
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: <vkoul@kernel.org>
CC: <michal.simek@amd.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <suraj.gupta2@amd.com>, <abin.joseph@amd.com>,
	<radhey.shyam.pandey@amd.com>, <dev@folker-schwesinger.de>,
	<thomas.gessler@brueckmann-gmbh.de>, <tomi.valkeinen@ideasonboard.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, <srinivas.neeli@amd.com>
Subject: [PATCH 6/7] dt-bindings: dmaengine: xilinx_dma: Add "xlnx,include-stscntrl-strm" property
Date: Thu, 12 Feb 2026 19:21:45 +0530
Message-ID: <20260212135146.1185416-7-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260212135146.1185416-1-srinivas.neeli@amd.com>
References: <20260212135146.1185416-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: srinivas.neeli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DM4PR12MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: e641e7a5-73ef-4c57-2043-08de6a3df1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5o7MrVZeO+hwRwgM53omA9tx7NHzT+y6fKS0lRTGzgNP4vxrhdsT/hX9pn48?=
 =?us-ascii?Q?O0sEkH++qV/ej8WPb1N0obUz7oVUwqpNwsmcEgzFQglfUtnnv6k3LsF3UZDi?=
 =?us-ascii?Q?KPVHNhkfyH3Uq4HvL9dH0qRBeGdbtSh1kVYRDOVuSl+TJMgIUsoWbArW4hSQ?=
 =?us-ascii?Q?/eyWMGKs/AzADpPsqgpku+jMoV4KSYm96Lo9XH3XWm3z9fQ24bLD4rGIYF8I?=
 =?us-ascii?Q?dug+BBSFv+28fcUS7bGXO2w3WztKHqneCwE0Hqc5L0I9wcuaZgXRgZ1Cn/R/?=
 =?us-ascii?Q?g9gAyFi3nqNSZJlshDQOL3N4hBbltx44eGE/h6xK5Kh53oHrP31jaq0Km5uK?=
 =?us-ascii?Q?YbKy6SraQ0wyLFRJQdtyLbIe7Rh0D9D/31ZLkGdvR/QHgfyAcUkhsiuTkDpd?=
 =?us-ascii?Q?vE4advrYPwVa0sM0QqAH1T4p/rx0mDEV3Gvqw8FM/7QVGv8re8QOfWcFYzoz?=
 =?us-ascii?Q?PlcPi5Ksl2OfBdtzsckYx32QUqgZTSL57V8IuUNbFwj4jc1Ha6TlIz/RTkP8?=
 =?us-ascii?Q?LGqhmMUrnMP3F1KfaqVDj0O2FxgRCTL4LgHQdOsmmN91FkbtHmihwc+xT+8z?=
 =?us-ascii?Q?bTaarNxdaSC3mbKtBDV8h9sveBK/+V1kXyD0H7vz7LB6ikG/qGj++GsRe01N?=
 =?us-ascii?Q?+QT7uLT85yvhhVyTwtpO3nLQqkRQ0UKUsHCQjoL621ASGBYn81R67lgT94I9?=
 =?us-ascii?Q?GmmP21sB2rKdjrQA2nKrMV+QOBAywK2zQ7VFI032/f5UB9GLCm/hzpyPQtcy?=
 =?us-ascii?Q?D0jdxlP4dk+5bKCHnSQ5E+WoIGNxk2rDXBpunD3+kVi/DVMgG+HbOflYhiLY?=
 =?us-ascii?Q?H2IQHTX51EreiGeluNyM8diB0qlHgYZXRSuLRyPYGqElpVu4invz5wzbuxH9?=
 =?us-ascii?Q?HpTVclK31K8jW997XshKKXC9u0VV42Rocem4L6ndLfvWDlI/9rym3HVFrsZA?=
 =?us-ascii?Q?xQQRBJnjNqfdn2cOThRimITeL5oO8YHbFWuYhgZ/veI330/Q1LNyBLkNAUas?=
 =?us-ascii?Q?vH+QfOfxd3jrVC8sov2VoNq6s+n+OYwJwdcbmfKt3wAKj6GP83FjX2HnE2tx?=
 =?us-ascii?Q?uLlU24SKWjOcuJeTLs50YRwH/cZJjWYz7ypAcCUK6EhujexudWtRhGpQjQM2?=
 =?us-ascii?Q?YPgQ7jgbz7ERFOlE3IHouJgsNe71zjLPZj6th3uMy3hD2G8wrVKKWsNUgvak?=
 =?us-ascii?Q?amdG4yvidhQsPL9qjNCPH9ToU/GwL3fkmvffAi3uaHjV7CDizgvRapPaAHG1?=
 =?us-ascii?Q?kEIPby8EvRK3mWgsi0dYGr6aySj+z21M40WIekE3/pEp+xjqpLDpbpLXJSIq?=
 =?us-ascii?Q?EwhlFXJQZOuR0qYDIeEFqcm1O3aJ0KYBE/9Uz5QkxSvAM0wJjODL0iEU8QZb?=
 =?us-ascii?Q?0iYJnner8vxWdB9JXX/GWJql2Oi/WF7DCtiDhJYViQLjqJo7kHIUjoDim7ni?=
 =?us-ascii?Q?Hwouy+4qYFm6hS2XfumnwgRa/2GY+lJtMcj3HSgVUHNLqNU3YcK80W5rn9Ra?=
 =?us-ascii?Q?9CLowhZ6H6MHy2Wgb3krzhai7ytgVi8CjrsvtUBY29w0fOlLpmsvREqWuZdZ?=
 =?us-ascii?Q?hpcqrgZeAxgIrqKn3++/yaAAuuYQ7aCbQLkxWomcT+1beOrC/+LLWQBH4vnw?=
 =?us-ascii?Q?YM6kjS1uD9tLd2xaaf7yykMv5vL1IvjMmwRq+GR/nEYIsId6SzVYGyp+F6Xo?=
 =?us-ascii?Q?LmM7ig=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V3KAx1wk+LYkWJNtWB5v+3XO21NaTC+FUuvsYMTYdqKXYLMhsH/Wr5GjPFwyFkzaKMoOuQOZXim+a5GdZVHXrGaoBhcwQQsdFjdMVMaW8mxz+JvF9ph1vtcmTK4fMrGEgPaRFsh9Mp7iXZcLqxmmeB4WV0j+EVvoWJp1OazDAWrJrUXzF7rPl53g+5nvgkfI3XsYpMVudXL8k8/nMATWbEt6KTwg0W/MBhN7Sh893cSutcly8Rv5AI3TRG9xcC03z++l3NtE/DkHc94tFH1oVk/zmyuA44OOHAcWjXDdo5qiIykiV6ztLtd8brRxXllajYiPSQk1PGCwz978OccyTJQj+/sEWpIWgPD/OoG26FdsEm0x1VTNilKvO71iOREGPg08d1O6Kc1ffyJFmlWYx5nwrOA8ftE9wtyOzZgmJJMYEwwTpXJck75wkl0efnwP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 13:52:21.3638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e641e7a5-73ef-4c57-2043-08de6a3df1b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_055231_183856_C4B52E9D 
X-CRM114-Status: GOOD (  13.55  )
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

From: Suraj Gupta <suraj.gupta2@amd.com>

Add an optional boolean DT property "xlnx,include-stscntrl-strm" to
indicate that the AXI DMA IP is configured with the AXI4-Stream status
and control interface. This enables the use of APP fields in DMA
descriptors for metadata reporting.

This property is distinct from "xlnx,axistream-connected" and serves a
different purpose:

- "xlnx,include-stscntrl-strm": Indicates whether APP fields are present
  in DMA descriptors. When enabled, the driver can access status/control
  metadata through these descriptor fields.

- "xlnx,axistream-connected": Indicates whether a streaming IP (client)
  is connected to the DMA IP.

These two configurations are independent of each other. For example, in
TSN (Time-Sensitive Networking) designs, a streaming client may be
connected to the DMA IP, but the status/control stream interface is not
enabled. In such cases, "xlnx,axistream-connected" would be present while
"xlnx,include-stscntrl-strm" would be absent.

Adding this property allows the driver to correctly determine descriptor
layout and access APP fields only when the hardware supports them.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
index cab66742e168..e72f1bb5a520 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
@@ -56,6 +56,8 @@ Optional properties for AXI DMA and MCDMA:
 	AXI stream IP.
 
 Optional properties for AXI DMA:
+- xlnx,include-stscntrl-strm: Tells hardware is configured with AXI4-stream
+	status and control interface.
 Optional properties for VDMA:
 - xlnx,flush-fsync: Tells which channel to Flush on Frame sync.
 	It takes following values:
-- 
2.25.1


