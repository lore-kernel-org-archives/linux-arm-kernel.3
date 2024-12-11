Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ABE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEfg+lySbHRHhIGWtFA5Z0NGYBFQY9W6kCB/vQHuUsI=; b=T9id4kptS9NcSPWPirB3X4djSU
	CycnwrqxSLMNeeoTxf5i7zeTiuzGMvpXiZmQjZU/fzCjZAE18X6Ov1HB6wNOHQt+zJL4oXEBPis6v
	znOE4Vl5cS/p4rBaKd2+FtgEMZIpyjywiIsdK94KOES3M38+JDd+Rmhxsunuq8OrchDya0k+kMXf4
	4iiyW9mWi8/AKqRP1AqWsOwWqyl6+b8Oi7PBi3Mj+lCfKQNvKBpIyGCdrt+z7+LIpze9lDMissZVD
	SCYS4nej7KdNxeeO0mYuAnNVePTKWEqg3YQmjWlgkjEe4Ek/a/tfyfmRAMm4+7p7chJwIHeWsQ4Pu
	itZ22oBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMEh-0000000EtWY-0dmH;
	Wed, 11 Dec 2024 12:54:39 +0000
Received: from mail-dm6nam04on2061c.outbound.protection.outlook.com ([2a01:111:f403:2409::61c] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLM2v-0000000EqvP-3WqN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cH1AIb+2k/5dy6AjHYz16qQFy4cyOElcM7hs5s9Hm4eFvCDwnlr0tQ0CufPNf7DAc6uOeytNneopoR11b2fU7cKKwMiFu+AYQ1HxtabZZ/EUHWkqmole/bfAPT1lI6kryg1ybYZHmiegEzFHUFU1nJLaCiUlwUVGtoLL2/SaIRocZ23fcR6cb934bf1Uazar5sIeqC3IQgNRY/LvQGd995GlT17ziSOSeXllFYnq64DHU+zl07eqpSGV583gUstJwWstI2Bmrj9btgFxjuCQu4v2a4E5cyyOv7hs+VtDBRyu/4zfoFTuliqLulMk0Q4bYL5mJcz52hVtQEGjqifWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEfg+lySbHRHhIGWtFA5Z0NGYBFQY9W6kCB/vQHuUsI=;
 b=Ytdq/q8SU/vgSOvk4D2QrtCNs0C86CivqSDBhFQ6xmlkM25shUVk95rkYmcBVhZc5+qn2OhhEBXOv5omPNaB5LJgjCChFscigrTE/B9ccdKlhcedtqcBRjkCu4gJ110kQg0F6CjE/YWbKG5k2MUPm4HgUhR2yTc3zq4Jb0On+tBtugdc8/ONNvqdRn9NlE/Qmk0Xp0YSjv40cR/cIOMYXUT8dES3UEMzfKCAWsEESpYPTGtIS5LxLQgUr2wzckTji7YtCeQ3LvW+hZ5xuxy9zWxNx3B9Wf4puV7UPQw5LwshmOr2TD955IpRDTDMYVDef7exqrXFpU6tMSZwczyuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEfg+lySbHRHhIGWtFA5Z0NGYBFQY9W6kCB/vQHuUsI=;
 b=VJByCOTIG4wDurLBFXAeDPcnzRtjL6H/x+L6smk/deqQO8WpJpvxqL5Nvn2Fk5a1Uybh0ug/YwQjMuwutr5Dr+BUhpGCKBkVfO/1nnIUiGXhTyTV9DpN/aAObxBQcUHTXhwaoJue5Ff4LZhh17HJB32kqfiI51KwVvHFwL5zaUs=
Received: from BN6PR17CA0045.namprd17.prod.outlook.com (2603:10b6:405:75::34)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 12:42:22 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:405:75:cafe::94) by BN6PR17CA0045.outlook.office365.com
 (2603:10b6:405:75::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.14 via Frontend Transport; Wed,
 11 Dec 2024 12:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 11 Dec 2024 12:42:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Dec
 2024 06:42:19 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 11/15] ARM: zynq: Rename i2c?-gpio to i2c?-gpio-grp
Date: Wed, 11 Dec 2024 13:41:30 +0100
Message-ID: <43b2f451bfd2ebce70f3ac6442586838d3e21951.1733920873.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733920873.git.michal.simek@amd.com>
References: <cover.1733920873.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=813; i=michal.simek@amd.com; h=from:subject:message-id; bh=7ATunKjmzemt91ghMXZc7ULU10aX6uEWV0B9W1clk3g=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvTIjtoV15lTb3hWOS3Kf1b4mz9v1a5te0U/Rh1lMHi1y obXUI69I5aFQZCJQVZMkUXa5sqZvZUzpghfPCwHM4eVCWQIAxenAEykM5lhfiRj5gqzrb8iX9oc WLSUkbtP9r4FP8OCBhXz7sPuZ4tcna7lrTir7jnjx9lUAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fd18d4-fe45-4eef-2d90-08dd19e14230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kW1y8t93EyOQbzA8ZF6eMhjB9VKJBqOxs3SbAILYi0amm+I8tdyzxaNTim+g?=
 =?us-ascii?Q?MtvIQPgX7LkRgTX/tUFPTu5d+H3iYr5THG8TNg4nMJRWQcdr64ZuGUlpoBzI?=
 =?us-ascii?Q?ortddi+UHWzzmHu1/K5YZpAxQmyxZcN2ycEaWufg8MJhkcyVpsPZEUeb5nDr?=
 =?us-ascii?Q?SaDP6Q2AbjJ7j2rtWlmnw65eiDgTvYYD3jAfV5EpV4Le8zh8KUmQFTEPNVUX?=
 =?us-ascii?Q?aQuIQRPf/3K+yRVq8bavA6IhHNB15cq0lS2s4dttyhyuBwjgISbGmv7L1l1o?=
 =?us-ascii?Q?YSb9J2q03WIA7Fg1Zf+XXGy514K5f4RSCNEh+XX8N+e/lbYfXr9diFOE0tbZ?=
 =?us-ascii?Q?2UdTWwNozrIbrMS/yCfSlymBLKHGq6W2YPaS48XvrqmBMn+0fVSCnZOmOkQ6?=
 =?us-ascii?Q?H5FLu692qrilGCEbTV1KswjIYCXF8ojfVWUuVDNkoZGojQUrjOGipnoDn1qt?=
 =?us-ascii?Q?GfOaz6QUOXspnx5FrpcpAMiL/6emBuFc+tyKJcENP84vciTfjPrbnFdlGzWt?=
 =?us-ascii?Q?2BwXm99+jnkZSBfoce4TAVjP7ga4yV8Hz0eyOEzcYZYEawtUnfBhz9I6XpZc?=
 =?us-ascii?Q?YLFrK2L3pGgdt9FrB/lGgKrlfRHVZ/yBrvBhL71oRKx5nlzySEvb4RZq7gIe?=
 =?us-ascii?Q?1f9Dy5wEKqf0FntL5vQzZBA5wVyNuCNxziHeRBnK83ralKGoLC4b8KFjmlqq?=
 =?us-ascii?Q?/kiM/fwl9PCCI1+EWGeTL7NGYu+kwOc2vkM0vJfkkzqanFbhBZg5qpvFTaUl?=
 =?us-ascii?Q?ryEKJil6l4S6aE1ZAqzQF6XnIpJd5APZoPelXdoyhBpKHfVpYkYSU0JGo+is?=
 =?us-ascii?Q?v4wxf/EqMyJK4et/VHlnKzbxpck68tChkKu93obN49MkQe8DxWVZgG+a0VTo?=
 =?us-ascii?Q?VFrcCa3eBbcLjAuDVQR/k8b6V01u+73PLLmrtMA6bFFHgwop9T60WfReNJ9f?=
 =?us-ascii?Q?hWDslzaJzJ8ZistuRCSjI7z16RH/wyR4+RKGupdLNH36uXX3k8x3h5Ge6aqb?=
 =?us-ascii?Q?IkFQo/HAfWOOd9Lx/LiG57u/OjJWFd1BxuXPTBKATyncUzduQ3FFJtTd1xoG?=
 =?us-ascii?Q?2d5CRQk7g0/eUggsari3WPfGm+QZCpqVj2mobShnvTKgRggPN7SFoWVze0e6?=
 =?us-ascii?Q?lBKP7I3apj2dM+rY7fD3cqa+OBW+h0puzfjZCH9Ql+mSA60ZSuqDDH5Jh1mv?=
 =?us-ascii?Q?s7EybHk/Bej2TKsA6sKg7BrUcM55wvstMm7XUPZ+O26XTMrDHybhHELOAIah?=
 =?us-ascii?Q?Wz8l0JwNME8VT02BuVg1SLbu2qWbHi7Hxyezcx1G/uOID2XR317fqISxHa5w?=
 =?us-ascii?Q?Oa27FXBOT2zx1PVAhkp57vFexzxNxonf5xtHVVMWLp+EMnKbI/IkaFuXe/YB?=
 =?us-ascii?Q?OKdVCwGrhmSxnsK/zz9XVVQpaNpkVvqGKpp2ULovH4q26NZdEyWI94AL5g4F?=
 =?us-ascii?Q?q70yVy5x1+i0wdSckahBfkuJbF6WkrgY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 12:42:22.4486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fd18d4-fe45-4eef-2d90-08dd19e14230
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_044229_876539_FC913841 
X-CRM114-Status: GOOD (  12.38  )
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

Anything ending with gpio/gpios is taken as gpio phande/description which
is reported as the issue coming from gpio-consumer.yaml schema.
That's why rename the gpio suffix to gpio-grp to avoid name collision.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm/boot/dts/xilinx/zynq-zc702.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/xilinx/zynq-zc702.dts b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
index b5db97dd7192..e4c9491081f8 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc702.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
@@ -292,7 +292,7 @@ conf {
 		};
 	};
 
-	pinctrl_i2c0_gpio: i2c0-gpio {
+	pinctrl_i2c0_gpio: i2c0-gpio-grp {
 		mux {
 			groups = "gpio0_50_grp", "gpio0_51_grp";
 			function = "gpio0";
-- 
2.43.0


