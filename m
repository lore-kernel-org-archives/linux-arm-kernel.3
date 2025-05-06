Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A86C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNkXtWomnfaFf/H4wGW9Wf9Ff4SZCermg3RHkTVkirA=; b=RmuMk7RhlvBhEsmAgXVX9dXK96
	yzErrJYP7b3dYBE3Ysj2m3Plvz32XMcoMFB8YPJu832LftQ5apXC/pFRZHkTwiWLH5/IcBbmj6jmk
	ejWaOzNx0chb0qfEtH82z+7FEXVL9vYjh/WdzvoGOgKDU0ofYFKpxuT5ca/BPwlp9q1p/Ygc8WOQs
	ZkwI/Tr5trb69blR/eluCE8jmfTjvbNlbXNiCXGFuIknDPtDIiR75zj9EUZCUFcRpGAL0DIA4iP8+
	FKS/XyqwGC5nZwxdG1vohaz1uFenX7FCLhqU8T8CCMWhFJ5goiuojGyWel7DUoncweqNG7ODcsbU7
	CGZuhsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJdN-0000000COD1-3AvQ;
	Tue, 06 May 2025 14:51:01 +0000
Received: from mail-am6eur05on20701.outbound.protection.outlook.com ([2a01:111:f403:2612::701] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGtl-0000000BofJ-0d93
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:55:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm1hE0tAj8Kfb5C/+aWLzyVPPfX5nT5Ej23gpN8B4TDS1xff0HUsd25jzpBPYA+AxjoANdDCGf/D4NtljYCuVuz7szxDBUqX+H8IV8hks/Fl9vlGCpsIavKVP/5UtyiSuB4O/YTR+d0ghlAHljSZt2Y3fCH9xmc2koTR4kDadmQDkAetT4uWUFCVauS7EP0mJ2dFT2y/2MMmw6HG2+b7eTJuyqMcS/Sr9NHP9Ya2z2lTa5V69mFSrWYSAxnGDEMaMdFTTqIc34m/fdMmdIAkGKsx5CMuR/E36FkbDhvtdTugYVX7s8nukjyG/MZ9sdWyHviG91iCnqBrGT6I2yUFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNkXtWomnfaFf/H4wGW9Wf9Ff4SZCermg3RHkTVkirA=;
 b=tY6Zk9O2oG+DSUZRqr4z0kz6U0/Oyb8OwMqWG6xpWs9bdEmSj7lz+D/1+ckn7Ujun9l+epkWkH4h4yLs/6puVrxJ3k71IUkQdUTQl8jHmM+rYNY2d3duhyGV1am+uLh3XfTekyzvkTbTKdT3B2sm4qQ9L6FsLTEtk8dA8kXta/ViA1l8Z9hdpWeLcGuheXYz4I6iz8D4V+yZUkgyCoxrajkLWX3HPs+/DB4uaFm6o9lQjg7yy5lu0NIUKX5+DEyJlldlBfiSZDXynfJy3p0h0wJCw9TlCPL7DDGn6rFPkblUB8uP4M0YcrWNEC9GXDcC4+GptudW5KgU3ZBMy/3Tww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNkXtWomnfaFf/H4wGW9Wf9Ff4SZCermg3RHkTVkirA=;
 b=eXZ34ZwYz0KfcKavq2KTmMTIaQgp3aVE0U+7J0/xITeqHtNIR78nqITNUnjyqz9OK5TNUUBcKcre9xRJLbwoCNZLyUvj4WBDGiwUGA188D0vhEK0gdqjnuo0mlbicXc2xvGQKjykBpomS5NGZpy72r/kzXIMvAZgXVk9A2oy3AsRiyb66ZFOaddDj42GypRK8iP/MSksgyr2l+qNDe0TULU4IeQCFl298K8ZsWTMyvILro95F6L6P0VgmPTiWsgPSBEzJkECVx9oJfYHxWcjPK6xJ5GnL2kS28BxEtQkodb3qPsocIh0aCLRZFZUac4dD8I01MgGfVtkQUCQWIVb6w==
Received: from AS9PR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::17) by AM9P195MB0806.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fe::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:55:40 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::66) by AS9PR01CA0034.outlook.office365.com
 (2603:10a6:20b:542::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 11:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:55:40 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:25 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:23 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
Date: Tue, 6 May 2025 04:55:01 -0700
Message-ID: <20250506115502.3515599-4-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506115502.3515599-1-d.schultz@phytec.de>
References: <20250506115502.3515599-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|AM9P195MB0806:EE_
X-MS-Office365-Filtering-Correlation-Id: 884fe690-421b-47d3-8f7e-08dd8c94ec82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p7BZZn2vmWG+saeqwQLgwGEsCwQg/cAT/nVGos2bCexcJcG7MAJ0j+JJI44r?=
 =?us-ascii?Q?qqGAKtMgomO4wP9XPdeJNVQBl5z84MGvmUXD9nfcupXtl0mS7ioTaMBs2Ks1?=
 =?us-ascii?Q?yi7oF+9Y3P9WESX8e96c4b2v7SLGeNWBtRhhTNSSubRvV0DzzwDNN8H1OoHa?=
 =?us-ascii?Q?IC+0uv+bePL9zK+EASPeCxPdtkukHcZUfhFjkZyxMdFIvFtgLIL5IA/xYwYp?=
 =?us-ascii?Q?eQ3MFZguEhLUeSdSb04ad8HORyivZ9w0RI1/79lmI4pv/vaBAxCWMg4gLXAJ?=
 =?us-ascii?Q?bH16wsCshMPdY90cVXWFQoj/wXLqmGCT71L2CBi5i1cQPKl8wqe19lpl/Q0K?=
 =?us-ascii?Q?qhF4JZsD6he28se8KpaPZaXeBCKcE1s8Dp+dpssrkEr+uRXJWDCQYyjT0cWz?=
 =?us-ascii?Q?0zEq1a+58SpFKBgLAoRwk+L0iQ+mzZmhbfx039Ulm9CU5KDav0ke75wZrbC8?=
 =?us-ascii?Q?d8N38ugd3Ngc34NtxV5lrhLcvjH2TmQdYylcbBBAqFWgE1H0Ooi1KrPzRt7t?=
 =?us-ascii?Q?7oQ0LVEZcr3R6W/I2Cq4dY+7QYi+lzC8JXjna0pJV/IIZttDIMbJm8c8NuIT?=
 =?us-ascii?Q?RwsoqOpUHD9MP1Ef82ajrXOjwsoBFcAjkFLZbM7BdZVfxj3YUISkhlD17Qpi?=
 =?us-ascii?Q?CapFyebPCxPYJk5W3y3ojvvhQibLq+ozfvXSW1GCntsdVGsgNftnl2Jr/ysn?=
 =?us-ascii?Q?ZGFBAsepzProyvWgAMJ5ihIv2Xb1+5BmtoynHSSrBG3Vd0dw45Idv12KJiIq?=
 =?us-ascii?Q?tb8swWz/MnYWcvmWRL4/fb5EmIro2dDa0KSHey84FVmFYhBtXFUAMVn8cebH?=
 =?us-ascii?Q?efmGQ6rkrIETqnXpuNQHE8RlyE4y+WVlPKPYNS3vrkauMNGh8z2kMmR1KzFs?=
 =?us-ascii?Q?8TvtJ84vQLNKrPNyKTFAY0EtVp0DHudWzuSoVrQkCdTjml51ZmoYYEAKNaDT?=
 =?us-ascii?Q?lt7p2UNzfoCOMiurBPiPIRsvEsbir6/FKKcyaNcUxwz75B9aalBqVgOAUNt6?=
 =?us-ascii?Q?T9K78odMW81CTejlsJlamtzKG2IRN9XkcQ2dZjFv/+sRNRPTFPl4y0yMSLvW?=
 =?us-ascii?Q?5E0oncsCzPYfL9BcJY9hh7N62H5T6vW0fWXXWxc7apDTEO11E39l7Ou+A7+G?=
 =?us-ascii?Q?+SxoK62XsKvK60U5w23/9X22lCWJjtB5WQMl1w/yoLfJ2ZJQKpAteKehiD4c?=
 =?us-ascii?Q?9d7iku89CHh6/yk16fpHODKBn9DC0EZ4mqUtsfUfSim2VGGm6uIdqjy6WdRZ?=
 =?us-ascii?Q?00m0aYuoywcggyu7HSvC0trV9JdchFnIQB3KNeZA271ISYtI544FLPwz9PlE?=
 =?us-ascii?Q?Va/R1iq/rpsjq5JUSXKc9Lx2ABErcun3VuYKlrS4ZVLMymsveXusMD4oRds2?=
 =?us-ascii?Q?zDyB/yk4yAPhZ2mdfeJdnA41nZTquTv8xvaN5CMZvTuNq8KrfTIkJ7eCNYTS?=
 =?us-ascii?Q?Qo6DGlC6A43iEe4WVINrg4xQbroRF6lVRVcjTSgloxBLMUn5Dkr8ZrilTF2K?=
 =?us-ascii?Q?yU+gKtKokfhncs33lZT8DtEHotTUSVWPVYnO?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:55:40.7063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884fe690-421b-47d3-8f7e-08dd8c94ec82
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_045545_186862_77747C3F 
X-CRM114-Status: UNSURE (   9.79  )
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

The main rti4 watchdog timer is used by the C7x DSP, so reserve the
timer in the linux device tree.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index fc252543f18a..343118af448b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -366,6 +366,11 @@ &main_gpio_intr {
 	status = "okay";
 };
 
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.25.1


