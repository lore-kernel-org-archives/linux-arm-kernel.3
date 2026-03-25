Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44435103A9A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSVXXzX+7YEculvibBHwFwLpTRS4o/JrRp5O6mI0ZS0=; b=ladG9OAxwZFdodlqzlLfhUSOz7
	fKqGFRHZuuFgsuRi59/cOeJQCGVad410k3OfChYDY4RMR/exSmrPzRy3OXc+Rg6zSHkVeSYgi/Dxq
	tzaYLWghDzLbDkJxkjo9iY4fcsX/4JcAQs2KoVsMWa1M5qSnSyChL8XxUQBFelzSglkaP06A3XeC9
	a8PLbpKHs4JgYhFzGPkr/KBFDxQc9ZMHYuWDx1oXC7s8/Hnyz+EBG+HdMZsPTCsQR5yhPhmqGQhDw
	0IjzvlKO5Fn8GtH73dAciSrKrAH4p2Q9xw/IGFMmG3TKMIfmuJfc3OhJw+PED+oOhvAfyeZsxj31U
	JwL535RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MJR-00000003FIB-3XoZ;
	Wed, 25 Mar 2026 11:22:13 +0000
Received: from mail-japanwestazon11022093.outbound.protection.outlook.com ([40.107.75.93] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MJN-00000003FGr-0pAS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckGdc7A7J0blXBeVPmbgZTE99u5xZLB2nzPQMfKoqMsGYiCc+TTxkzzSZxm6TZsXWXqYt7uxWNTTd+oGIZhCHAr/NDMUKd76G3dfqcOYvB1AEG6Up0WzGLKazDHug/4EU+Bu9tVd/ftUluVe0Wgmj/bB0tb8m9iiLbaoezlG2MtC3gvVwENvzV3zwL7J3Ojt9bXpyqVWAacLWrfZOmpRWnfJcVknZ1295lZFaiCWvQLK/5eKJy2aKcWFd0np9Qhxd+OYeVmdffpJ6ViwWqcoQ/Opo9fUeCZq+oUBkXOwz2FUjg1OXL5vSk7o468sZDcF5qed05YLUZoqEUbsFxWCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSVXXzX+7YEculvibBHwFwLpTRS4o/JrRp5O6mI0ZS0=;
 b=HjrpRor+/oM03SfGIsdhhU3RAxV7OL7SupeAcrevxWCQO7BGTCGZt6sdrlbwI30Vnn7FuOArUq8JH4qTEpMHAK8rPBufNV3dyG6Zsg0XHF2ZykdR2dH3WuXjGZrgS9sOpt+lv8+X+EfOsDBbyxEkTvHs7/nl2pr5V3VygylYduWoQ3ncI6D3FWnTx8M5Dft9Iw4quY7qnyWE6qIZmlX97rQU/aMwL8x1WFOqQh2bpZT7r3DRjF4dOx4//UZhn7gicAorn0LHxClDROqYYcHbzT5cAfrrtKBZ0TnD4AsiqDwcuKsfBpfSAVMCqxVGiu+MtEBHmXMtXqW1mF67AaUXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) by TYZPR06MB7064.apcprd06.prod.outlook.com
 (2603:1096:405:3a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 11:22:02 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::9e) by SI2PR01CA0033.outlook.office365.com
 (2603:1096:4:192::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 11:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 11:22:01 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA5104126F9C;
	Wed, 25 Mar 2026 19:22:00 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robin.murphy@arm.com,
	Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v6 2/2] arm64: dts: cix: add sky1 DMA-350 node with channel IRQ entries
Date: Wed, 25 Mar 2026 19:21:59 +0800
Message-Id: <20260325112159.663881-3-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325112159.663881-1-jun.guo@cixtech.com>
References: <20260325112159.663881-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYZPR06MB7064:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 300dd731-bc0e-47b6-1f3c-08de8a60bc88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: DISGWF9hrKl8RS8QJuLXPl7YbpypybOhNHwHXQ+yzZOCRsScZRfny9zoFQHrmr5QvUWzk5wUuAMyG6BNxXq6H+A8OazlC7de5A9Z9k1A9tCNwucTRkBWpHm03g4MrJGzo2RhVY4QXLsjxiUkCYYO5MCn7YNx/TngLtZbFGbyyxlhGdab/aJPg9Q0/NzC1GADfngdpBaJFjf4mWjLvb52wjQjpaFFCsqrL8sqb9mc3Rt6pVfiCxc6wLj/z/USK4Z3gvOPGfLnzH+PeXeFAQLStyNLa8q5C8RKXgzrixrNWjcBbDH8yBDBsd0/S+3QKqkNNPfjDhiW85C4TRkI+JCJDFIbEPNO+Wv4kLAPWhwPQLwPdsBU/N55CF9mUe7E+dMb8o0Dpdjn0LCFPDu+u1zxxOcub/Fl2x9E3pPHMk+KvtdG+uY82x/IE7wD0crOS+mrzaMjCY5oBanC51bDM6FYT8F+oudfvrh1EX/VDM3S3Ej6yQ0nf1NHowkFFfSC/mWchRDRS7eLHwdQUAIDwOMMBNu3elFt5zQFbg9YgJRq4aX8XvNz/Gqi9dz39etFeaLAeuZOObqKjvllFaovlZWG1P42fYXAMtopdG93F1Q3NCRhrawuqNt4PHxg2bMNNywwingCgFztEQGF5Aopd18qIdQnD8vp1qZUgVyCRd6Exee2lKxiHG7CY/rPMMN/CMfr5f8Y9326l21Scud86Rr/HmFmLuX2gZrJQRDM9gcMeTxpf+5yMFPrZROvCxG5EXAeBbrjJhESzR3PZCccUt5qHJsdSTIxB5qQMwuhJBp1s70+9VZHQKTpi46thJJcfD2y
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n6lYf50P59ALdV4g3jMNjUfSz/6yMVgcnCdQK0Joaj6o1EVTZGAKmdSbfz0uQdOv/DymfwYMHUa0qv1LrTl1ATBgPaltW79Nrz8lyv6k5i9vGEasSIdb0L1eDB+qFSMnIDBuqGPo8s+Etbv8cH5YeuKentt6PyUZTdjGF7b0CQoVcCHS1GEWemX7LIbsIQS2skY9oTJJzDXUT2uST+/iURQdo3s1b4JWAgbEuLaF/LwHeqeTLwHIbBxUTu2YhIshpZ3byytbj8tXjsj/n4LvVDzvbekmxrsZuE45nUpu5dgNhmxfre064/jgaGZ0huWkEVhQ2VbwUGGGhntXScEd55G92HR5JhXlYXxqC6x3IaKdY9wdUO0fPNXJxku0SgwGDsvwQDJydaNW9atKWYLa1ZZgpci4e8oyh8aeMrL07xgMwahNYH1IW7HSFJtsUX0Z
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:22:01.6075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 300dd731-bc0e-47b6-1f3c-08de8a60bc88
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_042209_233984_E584462F 
X-CRM114-Status: UNSURE (   8.97  )
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

Describe the DMA-350 channel interrupt sources in DT using 8
interrupt entries, while all entries map to the same GIC SPI
as wired on this platform.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 210739beac6d..ca3403df6e8b 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -480,6 +480,20 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
+		fch_dmac: dma-controller@4190000 {
+			compatible = "arm,dma-350";
+			reg = <0x0 0x4190000 0x0 0x10000>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+		};
+
 		mbox_ap2se: mailbox@5060000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x05060000 0x0 0x10000>;
-- 
2.34.1


