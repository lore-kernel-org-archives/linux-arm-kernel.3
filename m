Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFB3CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGgWA70lT5FqnKk+8CQ+swW1c6q6S/SJLiE5Mcodpzw=; b=yYrvVNTUTARFhrLIUBlyQuqXef
	51KnmCM72b7vbe/58nAdppYwHMgyDeBykJvERGjCfSJzzxpio8+VBAwFTKfPuhzUhOk/i/TRVQuh7
	NwEQ0Dw1BWkpwHf5VM39nw/tq+GJrnfwR9OsMQ9qGprjdvWDdUWdET085a9tpFsz59sVxRLZQhaYo
	oJIMigz4RRz/O0AcT3ujZGGselBolgObBtjHQgMLk3/Qzyr0U/QC/bsGPAJ/jQ85R0c4/clwhYX/Y
	S9aXyM1nByw37urdrI/SGpWTAvveSVud8XL4PqNkgYWMHHyWPiaLRZ8uIyEkKBL2/eStYtcw1NUdN
	nYGbQLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjaT-00000005X2R-3tvL;
	Fri, 31 Oct 2025 07:30:18 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjaR-00000005X1M-06Ek
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 07:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f08hpXlAdIBZ5d8Y/BKBSPwvUKfC15E4g9qiM+dwcIOBTJjAwZMkU93ybSA6aWnfefs7iKQxqKzzb7fwDv9iuzwQ2XChoP0Kr6jYBr6X7r6KXALxkSSCL5TORk5He2ECsELhiv910LQI4TCehPIxPG65xyl042BFDWUK9NY9aoYFfUS3zjWVQIzQb0bfeNHgO+kYEzX7uqiX74zAkMJhEDbM8LyA0FtppRl+l79ODQw13w3bVHQ+LSfs1h+a9uv+4Yb0IqmMtSn5Vigxe02wLPJDm9GWqCBQrA9e080m+AzSdiHjvl1nk1Y3vYnojE2Nf/MD55S30kSE1Ij2bssV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGgWA70lT5FqnKk+8CQ+swW1c6q6S/SJLiE5Mcodpzw=;
 b=V3xf/U+zyVnUneM5Z+Ag7Z3bSL15K6TlHk0x3Y9Qz2cleh6RFS4KdN4yapldLLK/wpgZAQT6MOtU8qV7dqRQBirHJNCDRcBCZf6LD8A4i2WWPB/3RSXmwy5XOqLnrZcGcpccfh//NJUngo4tb6awA6uxs6gEviaIVGa3UkE5nlVvAi3jVb0+xtr9LOc4Zxs2JRCV0xX66voCVi0Jk93bYV5FKjvvCOf0535mGXX3E4FsX5HJu+RgARsZofPTL1cKmCYiLMuqZd4MKZpjZ7tvzKdz2BpfkqYdfQSgH5WVDb4GdHIhUj5eTmhTTls3OfGs7cZopJ5w6SrKYiWyjETjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=amd.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0087.apcprd02.prod.outlook.com (2603:1096:300:5c::27)
 by KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 07:30:06 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::11) by PS2PR02CA0087.outlook.office365.com
 (2603:1096:300:5c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 07:30:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 07:30:05 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8D2CE40F0506;
	Fri, 31 Oct 2025 15:30:04 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	michal.simek@amd.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v3 3/3] arm64: dts: cix: add a compatible string for the cix sky1 SoC
Date: Fri, 31 Oct 2025 15:30:03 +0800
Message-Id: <20251031073003.3289573-4-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031073003.3289573-1-jun.guo@cixtech.com>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KL1PR06MB7330:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 206b9706-169e-41aa-20e2-08de184f5023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i02WVFXukgQuOgvvL0lwHAaa9mY5EB3sEaUKQYnbN8MJ+LZnaaPVlC+rtJiO?=
 =?us-ascii?Q?AL82MICXU2r9cjj3k5QYRbSMA3u4ZBI6nUkH6wimXQcbM9AMK4sIJJiICdNa?=
 =?us-ascii?Q?wWoFhiQDHTIbP0XkpxE++FLEUI5LMhID/rNV2z/2YmsU0ExjQzApfsUTYFH2?=
 =?us-ascii?Q?QBV53LZysm3yh/m3Y6OcfG6QmV2aFpJixzbHBctdq6Ikh8zc2vmy8FMZvifD?=
 =?us-ascii?Q?OlPlrogAHJ/jVeV6brjbjjFX0ihNs86qwSRkcxvJbJ1UbdBPsD5AG7/MsMwd?=
 =?us-ascii?Q?76q8Kun73zbAY5BshNzXxu5c+ENk0MLqTpCfMUjYgINuWL4q5VMC5v4usv1J?=
 =?us-ascii?Q?PZ5Y20ElhwkHKUfS1yIKMuk0onVM1YI6Sb4mxXuEplTDTsPm/d8BnSTFBosL?=
 =?us-ascii?Q?V7BgywCPDVyz0tR3cODoQQTLZsG9no2rOPqeyVjHsZOO8G//fP8FbyPdZE4S?=
 =?us-ascii?Q?XGjQezmYKom6UZm9/uo/rqh256WeYWVAD609Qa9oCKNccN930AkRda4TcAy+?=
 =?us-ascii?Q?snChuVgCq4l/vzUk/ADovad8paTfdZggOp+JHZcTWuhQISUAVYxMYVH4raz5?=
 =?us-ascii?Q?kjukr3nLEYEDNAQIP91MdlbazIWI7SOgMpxkOS6DftGeXGp37xJagt1pmn7C?=
 =?us-ascii?Q?80zD0kYRgouiyzAmX80wnw7TZ9GY7R/IVBtrN829t9IvBvi2RgQQGZaAJVBB?=
 =?us-ascii?Q?CSMxaRxnJokWJ3A0goaEkGW5PbI8j1kSa680WBDBHbBdKo6MFIr7m5jFUbxj?=
 =?us-ascii?Q?hfS44L6NeoSf2QppXH8HvTVND9XkmwpMEVCCnitdha6N97wkJt0OgyOV4Bsa?=
 =?us-ascii?Q?w/L3XhrYGAFj6V1vrKh45JkqdLLBl69FUwO1yb5m8q/3S8h+ArbtV8DlsrBL?=
 =?us-ascii?Q?5gC68rQOPpxkMgd2nKYNwkPtrUE6SvD4+iTA4db/KqB20mys/JiMAKe7yJY2?=
 =?us-ascii?Q?1KVrD397hSlPnSIi3KlFf1BZkVeYj/eUmx6TzoXOE7ijxB8bwV8r8gEbYaF9?=
 =?us-ascii?Q?uPCjdQXu5K2xjbU7Lwg2tnmhGMp4pwasOy07pa7hf0KLMGpSNV9kiF0guA8m?=
 =?us-ascii?Q?IpCHGJ4NsNFiqrUC+eIuUCuffUalthIw/pOo0N5ALjXwMOHtIcX44icj5wy8?=
 =?us-ascii?Q?KeHlMJSpxqSxeNaoaEnyccE8+4lP9OPn6LetGktMV5Jr1w1k+JMxkuGZFXHc?=
 =?us-ascii?Q?HURHcbbRUlowFR5da4xW7cqq/3RHMcMfAC/TGyR3a/B3DuSYtD+mCPXqRY9r?=
 =?us-ascii?Q?3Ltt3Mtlz66FJucOGP0HGnpiLYDJIfGSp6gSNMgBAc+09yP9hEnyLBSxqB93?=
 =?us-ascii?Q?5g7wHbjHuxxbK1/XsASqHx/7xEOtZbZzbnOjal5xUyNYrJKycWcipb3vUKDV?=
 =?us-ascii?Q?XX8r6wzbN/k7g0gdScQu8gOz7aGLYFmqTCR52uxkYHs/C/eW8Fm2h8eG1YUD?=
 =?us-ascii?Q?ONvZaqK39xzC00o5zR7Hhy9IONxtOz0K/cZaDtjfwUkzwMjIFi5TorbaVktg?=
 =?us-ascii?Q?i50hfgFb36Z6BE+HT8Z+8c7IPWnx7k1RmHiS20W0QnUxwrYLSN4T8LerNZPc?=
 =?us-ascii?Q?SeOuPdK35J/TybXEe7c=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 07:30:05.6832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 206b9706-169e-41aa-20e2-08de184f5023
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_003015_124910_9BABB302 
X-CRM114-Status: GOOD (  11.19  )
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

The SPI IP design for the cix sky1 SoC uses a FIFO with a data width
of 32 bits, instead of the default 8 bits. Therefore, a compatible
string is added to specify the FIFO data width configuration for the
cix sky1 SoC.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index d21387224e79..189b9a3be55c 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -265,7 +265,7 @@ i2c7: i2c@4080000 {
 		};
 
 		spi0: spi@4090000 {
-			compatible = "cdns,spi-r1p6";
+			compatible = "cix,sky1-spi-r1p6", "cdns,spi-r1p6";
 			reg = <0x0 0x04090000 0x0 0x10000>;
 			clocks = <&scmi_clk CLK_TREE_FCH_SPI0_APB>,
 				 <&scmi_clk CLK_TREE_FCH_SPI0_APB>;
@@ -275,7 +275,7 @@ spi0: spi@4090000 {
 		};
 
 		spi1: spi@40a0000 {
-			compatible = "cdns,spi-r1p6";
+			compatible = "cix,sky1-spi-r1p6", "cdns,spi-r1p6";
 			reg = <0x0 0x040a0000 0x0 0x10000>;
 			clocks = <&scmi_clk CLK_TREE_FCH_SPI1_APB>,
 				 <&scmi_clk CLK_TREE_FCH_SPI1_APB>;
-- 
2.34.1


