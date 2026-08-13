Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B00C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/2i4P8CGRhuM3zoa4ua8EG/kR830HFwDvJHIuR7MqQ=; b=s/jyL1KJ3JzftQxE1owZXYZowS
	WV7WCj4jts1L4uM6o5JclRj1fd3yMg4TYL15Uq5kW8hlIQFBF7iGMcFKJV7mMaz+nqVYyCUimwYyy
	jQAozuBqe/oQYR3zAMPQEUBkffr0HfhIGAYt1gDtpVFsrYKRu4KyZPh1Jjp4fJtnAdXOxJjGm2Ppw
	le+3Eb6uhZFVlfEBdtW4wyJztTKoUm0UdcE/Abszxy9Xi+0E7Zr/74ll5vN45q/nQSdqBNBUxmPLh
	hyfv8hJOQLqo7ufnmnykaquF/oPZIi6nLgT+/4k09PT483/SEIg0kQgbMv/6RcUVTDASowgPB3Sah
	tei2dpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSbM-00000000SaZ-2Bwb;
	Thu, 13 Aug 2026 10:23:56 +0000
Received: from mail-northcentralusazon11012046.outbound.protection.outlook.com ([40.107.200.46] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSbB-00000000SOn-03aX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:23:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g60w+w1BySBLq/Po+CAbS7RcnTkS80crAKiRJeJtClI31su7lKOolj3gcSktqB2LQ3/yVb8geMPdu3rbtwGakqaSVnC5gXRqL/wgDEYgC0wLW2kf51Iaf2JBtD4gUvifJOvWTrCZpoxaKAVZCBuxhOogm/du1Wd4pQxDCyaU1wba0WmydsEWCJ9LPHvdF3/uZKtfgc9T1XBrEK/RDrLNnnOosKhP9z9rCEfuQ+wZp8UlWzXQAiSCFK7oN8mWZdIq540BKT4cAA0wb8V2K7XnI5mJsxgBHPIcP8QpmmLWkMA/IHXjoz1uMtsPB8Nu5MVfQgOlODjEt/U1uoHgXUgGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/2i4P8CGRhuM3zoa4ua8EG/kR830HFwDvJHIuR7MqQ=;
 b=R53mLbIhd3u1+6ESYjwUCNej9VJRO9RFqFHYaQG45KYe1Hkg/hx5DHUouwO7Bk/uCrk62Ipbo3RYi9ky+m8qRRfdHhShfYHu2PMNXAV/weeCHOcWrHobe2pdiNQGLd5MR5LrLIF4OnxCFwtrlJcL6TBehQplpmyzhbmqX+2Wo/dI4ED+eGMMJPAoAncHM7uVnLKuB0AJ/bYNmnQFm3Y74no4TMpUdTDEujhzQ/ajzRscIhUhhegA76e7eltbFJUZgcPWYrnhJXOCv5dNgmNpH6Vj3T/+JrEeJase3w8asthqMdL8KqiNjt9yS4UaU/wiOnFfDtjW/hBGzDjn3KXtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/2i4P8CGRhuM3zoa4ua8EG/kR830HFwDvJHIuR7MqQ=;
 b=afAYetcM2pUeGaQnbxreE7mHLcoMgHNyXH96C9LEM7tNnTbfexSSJePAt+GqxlRJtYjPNArjWd8+LLydML5dklE7/N+ycijKLokMiSsovy2840WCbq+8of26khhjwotgqxlIXbJ7XbfAZ1GUllreewfSppPspLqsSH3rtmPp8u3qnM7xaHC92mogE/vfu55KVL3z0LeKINxhM66NQTdOrS3Zh5wfknSXV69XDv8DD2M47aOc7Dnuz8dX5pW9sMRgAPvzsaFlHabXsyBpIls/oAQn3pCL4cl0FaSlrw3HuxVo+WJe6EZyFSAQc9o6GfsYDNDqggNQxnvI8YPigXZPAA==
Received: from CH5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610:1f0::13)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 13 Aug
 2026 10:23:37 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::9e) by CH5PR05CA0020.outlook.office365.com
 (2603:10b6:610:1f0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Thu, 13
 Aug 2026 10:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 10:23:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 13 Aug
 2026 03:23:23 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Aug
 2026 03:23:21 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: [PATCH 8/8] ARM: dts: aspeed: g6: Remove board-level flash stubs
Date: Thu, 13 Aug 2026 19:22:33 +0900
Message-ID: <20260813102233.3088939-9-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813102233.3088939-1-jackyhuang@nvidia.com>
References: <20260813102233.3088939-1-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ac03e7-ac83-4f6f-8255-08def924efd2
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: K7dRX/RyhRyoGD3nsEM2cH1Z6NyfEDKh/W+NCpfS0ws5j4we8tpHERuRmYR4JwIaeZPjg/TfN6Gvys8qeGQsWi0XX6cdvxQsNasq5eS8GExMCFaT8dElsZaCZNzz6losHf3DqdsMlSfLkSZvTMT7ZeUY/4ufC65Ic9nPsvwm9CqBjCs/aXluFKbNu6XvGhkfNMst94GgARQ3YpPimmsLq8cEMP2OXTDcA/SYnxi6l+LMca6/JMP6EzD+Ve3Z2ax92kgdofjdZyiw5wbXjt9ep0HXFlfiP1TKxZxLzdWcmSweN1qYYOKe2acHjQdM0jwIK3QH6LSph8BiFlA/cNcJyv2Z1XnRakTMiJZU/9/qj2JcPC0twgRS1vNG8yOjGVcekOp2eV32dyK5+WppWtqYdHIojQglgMfMhQBas24tikmOk+QfwHyoTKYyiOeaTV/yOA2P8wOMrVR4logzvOfjy9DQWSrsnWMwozNTFm86lqNgAhM3HTQK9tfoasZzy1fDX3QD+BPijaHniSBQM9XUSc1KLg6DZEm5cxWitVHvqTDylnn5NoEYMwnh1oaHNfhfvLwsxRF2n7f3bQ/qQkBugl0+o6yj2kTQF/kAp4gsUVSM5LPpF4v1W+S9S4LRx7Bgyi//aPJRQSeT6ibO5QtGZZyW0RIJTafnU7sA/XU5Ji1Tu6Z2FKst2hmiTpCbetVBAyVk+ZOczU3jcMUHY0FIQw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: az7FLPFEmdOK42U+exp2XbuQt52zyB64LTxn0YdeDs3+hmLNM+pcgXsKVD3jyFc4Pehyw8t/rsZhCbwyHeyEX/L0hyYAqnkntmOWc9WUKgW+wvSrRHJjyelbjZKzLukSzIcILheB2saq8cluURjhfC6cEYnmuxX7Rx+0wepJC3g8Xpua0lK/GxXGFtwi2gdCYFBC4NhsBcdhCJ6OnY1PVHnNu9qH/ehL2wlgCHozYd4LDaJvtx4Y/l4keAbwLwED3ZJpEViE57InY85sbqHNB/S4GQp5Vf+sZdIZZbqQjRC2JBwKOvkqaSGdKsBiL1zKMU/xJUXeaJJiiQ5Rvq54Y3+M/4QPeJTYzRFvERaY3mgNbIhZ8P2+i6fvQRVZitHT5PLoBspIRgVhTIDsL16pEqeA2YAusk9qV24Ij87kGtmSIInIG5yLfgWsjLbohtCc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:23:36.9494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ac03e7-ac83-4f6f-8255-08def924efd2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_032345_070974_3BE3A1EF 
X-CRM114-Status: UNSURE (   9.33  )
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

SPI NOR flashes describe board population, not SoC IP. With boards
now declaring the flashes they use, drop the disabled flash@*
stubs from aspeed-g6.dtsi and leave only the FMC/SPI controllers.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 -------------------------
 1 file changed, 56 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index edf4b74f5aba..de705c544847 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -119,27 +119,6 @@ fmc: spi@1e620000 {
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@2 {
-				reg = < 2 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		spi1: spi@1e630000 {
@@ -149,20 +128,6 @@ spi1: spi@1e630000 {
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		spi2: spi@1e631000 {
@@ -172,27 +137,6 @@ spi2: spi@1e631000 {
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@2 {
-				reg = < 2 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		mdio0: mdio@1e650000 {
-- 
2.43.0


