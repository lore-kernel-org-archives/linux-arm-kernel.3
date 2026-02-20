Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4DAC531F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 04:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0gtT/kRNEogjqBMZHK/l5JZWAfMZCG6uWxXQNhaULQ=; b=1cNJNDqIR2TK/3zRLplHtUM5GJ
	5P1Xez0BeZpkNAnnL9q4Gs72+7x0lFtrxTU1vlZp19QuI6KgBbl/NUo7jRaD30E5geDcAtvdnBql1
	kWZPRqRe8p0JmjuEyqGDQL5mw/wGluaQD5wYDop4IF000049RlG/BF1AiteSWy/TvE4BBjIhhO3cX
	/1yk8s7n5cCYsaMhArVEVbAp4k8E4q4t7ugZiNzfY0J2HVlH0d3l8Yt3f398p/lc+GzrriTnsQQh3
	VEoPtRNRSh3yKv+ea4lUSo1vO5IwhgcHWqEeYGPsykRYY7jzHwpDiBKy2xSgJ31XPhQUtfsCpCGUP
	kaawK+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHtb-0000000DEjt-0nfL;
	Fri, 20 Feb 2026 04:13:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHtZ-0000000DEiS-3VLp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Feb 2026 04:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M0gtT/kRNEogjqBMZHK/l5JZWAfMZCG6uWxXQNhaULQ=; b=Owf4Djrxnz3S6Ho4neaAJgMn/E
	v0Kq/1+uDkWYDQAHcL+tsBP8MlOuH17AIkPuIX6wuNFQvlNxI2ksM1VM2YPNWY6oZnMbhJdOoNuJ7
	yNRvtSyozuntlQrk01TJpMXi9HS3eIMGcx1zEa0H2YXx6ab2ekGMc7yV+A0+Op9rS9pXW7/rgll3b
	J2CJviGQ2gGW4TUCVnEoUtGWEp9a2pxJ8ulwwuzz8ZavQMciGN1ubrZgPZuEOV0j9VVQQpkImSnbt
	NXXgXR0wIUE/QPTMNHKQdD6ZyaWb1V7oZbb4BcM3Qerp9rP3PGLGFY89uDj0HqpQkq7O/mXmIGpr0
	8/7vVHHA==;
Received: from mail-centralusazon11011060.outbound.protection.outlook.com ([52.101.62.60] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHtP-00000002ALi-2IQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 04:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RInp3b8Rv5+A+c3c5TVieSEVFKuU5aRZ+vm4Xtv52inqHnUt6sQ6dvge4L2Bkkj/xlzcEDi5MoS1Bd0IkRQuA3yzIWkaRlcSfhc84QDjWsQ0wL/EXrkiQ/7rBI0E88nI0kuKfxkGquc9V+FqutbvI/Nh7tEMJcphICd/rsTkrVCnAdkkvIdMRZPGfzusRVQG4pWYW02UK8xlPoRReK5cCFjURKRiJW0MbA20ZzvCK1rSMv6pkbnawe8+sTrvMWqdjRJNAHjAFizOidzM3Lvqj5VTlYUBeRoWyKHGB7rtKkFgebzRNEzWy6qMbMXBZdACXvoYrAVBJl3EkDbhZAACNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0gtT/kRNEogjqBMZHK/l5JZWAfMZCG6uWxXQNhaULQ=;
 b=RLOTrx+xGvtIhO+F8trAMGx6hW6p2hJ4D0X9SQ2oGSLQdovs158rez0ZRiKdq+RL50HAP596/DBIzLwlqVkx+PLjNwts2kS/uunBrWR9p6z0igFbIMP0NdW7OqBsnk5+dYzHDQgT+HcHkynIu4K39TOil1gUYeSf7S49h6lE3bzlxyyJBVqhzQYD/Gr5ch3iQPp7UIt1SnVIcnh/7Nvvryii/izkPU4B3kNb1yKtJ5FDatslw0LKZhJ5HuKbK+qiMGOixF6qRqHZuhK57qzBabgQVohITKcpcyYyfvqSXdMP9DtYE81B0piCLAEzk6O8h6PWtRiopEDO14nl5+lCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0gtT/kRNEogjqBMZHK/l5JZWAfMZCG6uWxXQNhaULQ=;
 b=qgYW17rO1UoqYnMBmXKbM0bo6glQcMVz79z/UF0DjYzOlKrS5rhkS8NodLAOlT/zFRHD/WtLHtrztDnqDu8sKSn1HKgORJpJlZAZkFFvXHY7mWKOEDxXlpffphV6O7nJqz9ti6dfNY0mRRDL6m22yuui8fDiK6gAbXwBQBK8pRo=
Received: from BY5PR16CA0002.namprd16.prod.outlook.com (2603:10b6:a03:1a0::15)
 by BLAPR10MB5089.namprd10.prod.outlook.com (2603:10b6:208:330::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 04:13:16 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::bd) by BY5PR16CA0002.outlook.office365.com
 (2603:10b6:a03:1a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 04:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 04:13:14 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 22:13:14 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 22:13:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 22:13:13 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K4D1Sr3237911;
	Thu, 19 Feb 2026 22:13:08 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <danishanwar@ti.com>,
	<rogerq@kernel.org>, <horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>,
	<v-singh1@ti.com>, <vadim.fedorenko@linux.dev>,
	<matthias.schiffer@ew.tq-group.com>, <vigneshr@ti.com>, <m-malladi@ti.com>,
	<jacob.e.keller@intel.com>
CC: <stable@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH net 1/3] net: ethernet: ti: am65-cpsw-nuss: set irq_disabled after disabling RX IRQ
Date: Fri, 20 Feb 2026 09:41:57 +0530
Message-ID: <20260220041431.372610-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260220041431.372610-1-s-vadapalli@ti.com>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|BLAPR10MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: ead8d15d-ce05-4e48-6b58-08de70365e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c/aqMflTFZeiHIBw3yTSB1Oeb7uJmDtooDPHMe6L9XyTlsKKlexcKGvRQLgC?=
 =?us-ascii?Q?j7VbZKv1qYcWzpxfsScO0+zz1f/coxFQMpYkvk3fI7Pg7R7Jg+tUHRR6EmvD?=
 =?us-ascii?Q?BWrhv98kMaRoIhzyU2ifcqzIGCPcbMa3YChl3PEXrF0pF1AtqltXT6hg5Xl5?=
 =?us-ascii?Q?ZXLDVhVcjeDoLJ5RrGqolmMAEn6unTU0RxdY/u6SnkGm5iu9wYtnOp0yaXVt?=
 =?us-ascii?Q?O1x6VqVxY9X70PoR8owZ4leOBn3yv+M4/DMgAnC+RYefu4qLrS8yit2sWoY6?=
 =?us-ascii?Q?h1AGFFzw9/9twMnHfA3mUJG7ebDxzPm7r0d0U1G1FJ8wzTzrX8oN4WKrbC5v?=
 =?us-ascii?Q?24aHvI4rnK/vPActq2zUrT3PPmX9PDPE6Z9tgwSNLAqfvKtc4yGToXyafW1h?=
 =?us-ascii?Q?M6WyM4RH7UAt0Yz9GqVzvHi/ppI0CB4o60oX0a+kESs6m2YtTvK9lRJfy5CT?=
 =?us-ascii?Q?FDOAPN+3VqvAanHNQfTHKqLYcp+KOZUq86Z7tTt6WFbDCXCkJGxFJUVaJY1c?=
 =?us-ascii?Q?NVFqWK2vQQISWWn9GhGpJIv33IK4TMxMJIOVOaJyq9bpWV9UQITuNO9S7tTl?=
 =?us-ascii?Q?/Y3oUyVHyXcFzyJhqBPyvXIu/xbZB9JH47dQ6sYygW4QOIPxEyOL1mpwSf72?=
 =?us-ascii?Q?+vTaTM1kf8vlzTelVETlh9wy4pzLh7QLtpZlxdN8S7fzIasDE72wBpLqpFvu?=
 =?us-ascii?Q?wVVTMqJhtCBQ91nga75UjPPFSxmTBacPAeuxs62asWKS1zUCkWPvWjtzfTEB?=
 =?us-ascii?Q?4tsZ70iZavggAtl9/A3ugPgjLqZRWfJly0DpwNJVN56RCI8LwRWirywbIzLl?=
 =?us-ascii?Q?pD5SmNYOfJ0sa2zXIsEvFG4ygFVQ/Hv92mJhGGSNcnPHGB9RE++fwyTa3RWm?=
 =?us-ascii?Q?xL3Sar8bQgiGHfPTXMQzzHAh4mRzGUcqU7q6WsudtdfKgjBdwT1YDYJeqPTs?=
 =?us-ascii?Q?UJeJonkKDXTRCpLVYprAkqDX89n3mh6Cg6AHsJEKiUF3zVOP+OhmpSSA8tkO?=
 =?us-ascii?Q?sF015OXhKcHE5P0eOrrZtWUgCwTZgw7u3im6z7bSEDan6gCiXZyEsAREBRDZ?=
 =?us-ascii?Q?bua0gjqb721/ylFSmYP4wQh96erEIuM9eXJb8DNPZiVaU7BiOztch4ZUU3WH?=
 =?us-ascii?Q?HanrZwlMvQnTxL+G1VNYsaFLvc2RyRFZyqplCJ8R/3Y7GYmijewoH33rTlSz?=
 =?us-ascii?Q?Sht94IEBpmXbo3FHbNcVzYOMEczsbLEH98ob2Z9nzRUt3laO3K3L03WH/rbw?=
 =?us-ascii?Q?3JeY32A1IPzPiC3z/A2jEY3QCwA419pYyogCd3oaaNalONJMNXipyKT5l1v0?=
 =?us-ascii?Q?8pQrJUw8ps5KSKVwqhm9IEkI/QC4O0Y+YZxdEDWWBAL086nT9m04rteT/0ib?=
 =?us-ascii?Q?2eIsl2/LnaLlJK7TY5dIr50Xm7naxEld8PSYMA+kHnqI7lhjn/1Pfvd+hpUL?=
 =?us-ascii?Q?iVZhfeAfqqtSimUtxhyE6uAaFFgxC7VfaQFwXq7cifwXVhrio1sMCe7OASig?=
 =?us-ascii?Q?BwtSywFRwpGsY+9m8Vq7RZySXe37n/6ajY6p/ZyCGooSWDvtawJVLTo7d3o9?=
 =?us-ascii?Q?xrA4JmMRl7cOU5Svh2wKbV7MO0yUSkmCx+Z5evrjzlG35ziOnR9wPmD1er2f?=
 =?us-ascii?Q?kXdSOrPMLKwcMXtUYwQ1uLpI/KmQhrsc0WnEyxrKqNxbMGVZhTa+PUdwCCF2?=
 =?us-ascii?Q?QSeUhtSokAbPKMDd4R4SYcxMa6o=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gA1x/yw6jb/xatCVMNIdiX6KJzfQjZLLh6ZjqdLtjOvYcg9vBWRXz7dW2QuaJ9uhQC7YjcXMn0+yT+1R0S8stfZgT+1hhzfrPWdUEUfK6wdq+ZPiUS6ZU1G9A8IMAgzwAwE7zOsBaff4pEckLG7MtwxnAzxFrfDyGjeY53c97D6z086R1GjWyf0ylNtNnnATXCN6Z4ZDsIBbzqciedCT3F3qQqArXt5psMz709a0+IBJc2M/xg1e6zirGN7fvx8pt4RWntj5uHY71gj5Npq4UMuV8lFUw2aGHpZ1gayPLOGehB86wlEBa5o5xc0EQKFHy2pLBLT0K3IKITNG84xPx/VhVJJDCW3wb6Bv5EOeINC3NSWfIns1nv8ewBmwG9I1x88fDRg3rCS789575Q9sQHK8RC/n8rb4+0I44JUaQE+cLud+wEL0WcBVPO4mmgh0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 04:13:14.6254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead8d15d-ce05-4e48-6b58-08de70365e67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_041329_613426_2B2A0D50 
X-CRM114-Status: GOOD (  12.68  )
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

The 'irq_disabled' variable indicates the current state of the RX IRQ and
is used by the RX NAPI handler to determine whether the IRQ should be
enabled.

Currently, 'irq_disabled' is set before actually disabling the IRQ by
invoking disable_irq_nosync(). In an SMP environment, this leads to a race
condition wherein the processor taking the interrupt sets 'irq_disabled'
while another processor executing a previous instance of the RX NAPI
handler sees 'irq_disabled' set and invokes enable_irq() before the RX IRQ
is actually disabled by disable_irq_nosync(). This results in the following
warning:
	Unbalanced enable for IRQ ...

Fix this by disabling the RX IRQ using disable_irq_nosync() before setting
'irq_disabled'.

Fixes: da70d184a8c3 ("net: ethernet: ti: am65-cpsw: Introduce multi queue Rx")
Fixes: 47bfc4d128de ("net: ti: am65-cpsw-nuss: fix RX IRQ state after .ndo_stop()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 5924db6be3fe..8785ab40f157 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1570,8 +1570,8 @@ static irqreturn_t am65_cpsw_nuss_rx_irq(int irq, void *dev_id)
 {
 	struct am65_cpsw_rx_flow *flow = dev_id;
 
-	flow->irq_disabled = true;
 	disable_irq_nosync(irq);
+	flow->irq_disabled = true;
 	napi_schedule(&flow->napi_rx);
 
 	return IRQ_HANDLED;
-- 
2.51.1


