Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5ECCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ziHY5y1MjEtOA8GvuMDbSSGogT3TQMJj/w9FPW1T/DE=; b=Mu5cavs43M61R7wRyAz/Rb0LrM
	bmgxvnU4cG6D2EI1yBVbKD9GmrA1fldoqqrPbQ4a22o1aq69mqtv+fYUpajS87Ne3G3ZdH28Bpnn8
	cwAxArNZDf57H6sze2Am6G3jmC3MxFVhUycgoTyUFrkNXVlYeP7X2EL1bNMkNSZER29kKHe21GhRU
	xjmXfumg/fNWyZJz9YPbOrQ9zwxkKOd2tI55BuZFyYeyJkag7bm+GE8eQ+5iCVuZvoe3pNwvnyLb2
	GlPAFL4uL4aZccVDYUTsv+A5A932Cipu/LfTlRYd4De978RmFcmNMu2JoC32063Ko4wMuvMaT8r5d
	fMSdZALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogX3-0000000DG4Q-253M;
	Wed, 20 Aug 2025 10:59:05 +0000
Received: from mail-bn8nam12on20605.outbound.protection.outlook.com ([2a01:111:f403:2418::605] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofhK-0000000D5KC-3pGl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umAN5YUrIqT1U0qPC/VOaopNOnVIc1BdA+LGfrdfrmEzjzXJ2BGhMTiwGke13g9fmNU1dk2UPdyaEeP3NnKa8EEqZLqcmE11FQh2krlGqQODvDaNS7Sb1Gh+CN9JYWhXoSe5NkD4tCYP5oWTSUmcj4XPS+RwQR/l45+XovzJ8vYGvk64FNKOlZmu2c61epHDkiyNqIzN5iKrPUDvoDsCDsf3X/lKrw5tzEEBHJIK4eJO+G+QS/gr9hDfp8F2M+MUKupHBObk3Vi2DeEXlr1PsIzS3yF3OJ7UMDNWIhvEKiWFFeNOLqMkB1dhfMlzCatKZNd02DRsxzZR1HA7vCj8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziHY5y1MjEtOA8GvuMDbSSGogT3TQMJj/w9FPW1T/DE=;
 b=vwFwrDkzxBrfISr+nx4eE9/11NDF/S9N7UIDaZIzigq4cZW3E8iPY8M4DFVof0Tb/b573iBQYTZ01prtYXvORWtOWwZQbPLXQtwXpCvYzwJJBPfC+rFhee/OWgFApiGgheOM2yHi6FeEZVvNHHTP8BUvR4w/Bb3uR4lfUatSMWMmbqWr2cTXztLvYb8LVcjCxtE/Fumwjt8LVX7neuTnw8J7mLQnVOYoK6rEn6fjCf8FbK629yCusC9c/4l1kSzVIMvpROAPzB4SJmJ3wOj1nQrdfASLfgkALQ/SNHpKewXDMrv3KeJ3qso6qk1F9Mh16nGZjah2+OUppNbZ9Ymi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziHY5y1MjEtOA8GvuMDbSSGogT3TQMJj/w9FPW1T/DE=;
 b=iaugJSdrCCfeTr+rZkrSdQlfpujFgHERci3K0A4kA718Skuxu9gSpC5PDNpk+ZDAyenqszybL9FUw/ZNVSBpaGr8LJQBwjAdhHMdu33J1+1xgbw0GLwf2uijpQYLQF4yAMOmSbDjVdSTGbqncAqJCqtfBspWSmm49Bo2iPQQ17s=
Received: from BL1PR13CA0281.namprd13.prod.outlook.com (2603:10b6:208:2bc::16)
 by CYXPR12MB9279.namprd12.prod.outlook.com (2603:10b6:930:d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Wed, 20 Aug
 2025 10:05:30 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::7) by BL1PR13CA0281.outlook.office365.com
 (2603:10b6:208:2bc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 20 Aug 2025 10:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 10:05:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 05:05:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 20 Aug
 2025 03:05:30 -0700
Received: from xirsalihe40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 20 Aug 2025 05:05:28 -0500
From: Salih Erim <salih.erim@amd.com>
To: <salih.erim@amd.com>, <conall.ogriofa@amd.com>, <jic23@kernel.org>
CC: <dlechner@baylibre.com>, <nuno.sa@analog.com>, <andy@kernel.org>,
	<michal.simek@amd.com>, <krzk@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2] MAINTAINERS: Update xilinx-ams driver maintainers
Date: Wed, 20 Aug 2025 11:05:19 +0100
Message-ID: <20250820100519.2272509-1-salih.erim@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CYXPR12MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ede33d5-5918-4da5-7511-08dddfd11861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8euGYi6++pi0zCwaNZafFGdwVEirBi8lP0a48q+Qn2uW9cgDVQE7Hb3Cj6cU?=
 =?us-ascii?Q?36QGovcY/58Nrjs28FPuuGXglKJtbzQYuZO8cT4ZVVOr12pgPboFUUBaEnWY?=
 =?us-ascii?Q?GqMMj6VuqkDCuMlPmxsSNotYAtWCjGSCB0/V1mzAMSAFCMs8oHuNz+o3Zyg0?=
 =?us-ascii?Q?eztjlxq2cPSdy/gDma7hsKOxu48SsALJIpdngPJJ5Ylk8TB5kScgS3iqfGIa?=
 =?us-ascii?Q?GoVQKqYDGdXN+I7sStfFTQt32xuCrdp0I22P/8AVlMyt72gChzu/29oLQkQN?=
 =?us-ascii?Q?tcFfqI2CSJFKOjcff6dC321gujNTsxIMkTXMT2xXwalIz5Mdcg3TfztV7AG4?=
 =?us-ascii?Q?cL18fdimxd+oqwxbmCGgxVlJ0mgELGI9uCtlSGCmbqaj6H30zr5akozEBHBo?=
 =?us-ascii?Q?FrZqzIBI997yGntKNwgRXrsT/u3aurDKsMkWwGhQi4rlKuHQ+WFB3O+ZPSTZ?=
 =?us-ascii?Q?8oehjMgtj2tWjEfRH7STkEFMSz1Trin5ZZ1TJII4PEQD1OKuY+UUHWA3kUxd?=
 =?us-ascii?Q?lUvC0Gl7L29yiwM/dGkqAhWKGn8JO3q09/UsuzB6o7h7uzS05WZhzXyKdunK?=
 =?us-ascii?Q?p9GKL5mIA/8FAORK1jOSq7XjWPlukyztKVyEul1jGQYt8C70CK38RiwYq+Vr?=
 =?us-ascii?Q?ftrxC06ahfoddU5lcc1ODLObl1jzdSEmvKnwCXRfhinH+S/vv4WD6WYy8ORS?=
 =?us-ascii?Q?P7VKtOiq9AH5DBSJV4tk+TSltYUrPu773iIrTWdFW78ITgRK92c4X0jwJ1WB?=
 =?us-ascii?Q?9f3lUBo722wy5hgLs8LbtqTSVltj2w/4qf239iHTiFLpidFJdWD1Ge2AX3St?=
 =?us-ascii?Q?CfHMIlA6gozoiVvzQOTF868t9oDDPmNKrdyeGReR1t9AJ/kza+Lky+796ah9?=
 =?us-ascii?Q?QSkFfJwPygq0BVX58ROKWwAKbGo/yuB9o8CmHLN6ohCnyGVXxJ9ysTlAi6N7?=
 =?us-ascii?Q?vGoN9P1X1Z+3iw7eiLGnsRcB0ef3/lxRKWf5+tsZKQzyHt6fYZWvm7LxAPnH?=
 =?us-ascii?Q?xkDQcp7ErHATrpWAwZk9vu3FPwY0KZBKg6PTJdnSmfnoeDyfqQ+8nf/tEBnO?=
 =?us-ascii?Q?fJ/oVlPHxmXEtqsZlbpQlKdCV5Bps63er9Rj08/8Xa5fVVcv8opQ3P1dKt4x?=
 =?us-ascii?Q?hSl5VGbqx34pCHrAiHk6wqazmo0hXFkCrTtZlpPT3eFmYV/3dkJYZoCOgvG3?=
 =?us-ascii?Q?aN0Pn5lh5x+yZ+WXjj0U6qKDATFpYDKtO1eLwY8JHwlcGROIBX/F1U6APPP/?=
 =?us-ascii?Q?qVLFhIosz01i73cP5OHljuok22uQq1FYReIFEdnZeSsAq1nN8pAPtK+3F9W8?=
 =?us-ascii?Q?hMZdjO/egyaKbuZKNUM6mbCt+LrqIlimwKgtDRsLk0EWJw5d7D2ev8xVTRCt?=
 =?us-ascii?Q?0YSRu+LRQ1GUhUO97uFx6YZOwqy2ykNcWHkzRjlvQk5VJ0Ddb1vWDbALlF2r?=
 =?us-ascii?Q?tGk2zLNL5C6KfMcIG/XoxEEXGlQyL1fUzLHQPbk1JZ3dhW4SMxs7ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:05:30.6240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ede33d5-5918-4da5-7511-08dddfd11861
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_030539_006055_D0483DED 
X-CRM114-Status: GOOD (  11.40  )
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

Anand left AMD/Xilinx some time ago. Salih and Connall are new
maintainers of xilinx-ams driver.

Signed-off-by: Salih Erim <salih.erim@amd.com>
---
 Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml | 3 ++-
 MAINTAINERS                                                    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
index a403392fb263..3ae1a0bab38f 100644
--- a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx Zynq Ultrascale AMS controller

 maintainers:
-  - Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
+  - Salih Erim <salih.erim@amd.com>
+  - Conall O'Griofa <conall.ogriofa@amd.com>

 description: |
   The AMS (Analog Monitoring System) includes an ADC as well as on-chip sensors
diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13bdf..b4b27a31a782 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27537,7 +27537,8 @@ F:	include/uapi/linux/dqblk_xfs.h
 F:	include/uapi/linux/fsmap.h

 XILINX AMS DRIVER
-M:	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
+M:	Salih Erim <salih.erim@amd.com>
+M:	Conall O'Griofa <conall.ogriofa@amd.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
--
2.34.1


