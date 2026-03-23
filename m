Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C00EC01D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN7h4RZni1BbiVdkXKt8OJJmCqr8fkwBfZrXXPMVjUo=; b=hDm/ozeEHe5Ql77tjHRblZiuiF
	7Ip6mdRLIZj6YIBdWjkAJBK3XNtt9dbz0kZmUV/zAtuoFZyOHEdvlisqFUXu5a2XkARyzL34NFD1E
	WE+X4kcYNO6dHacp39PVlcyswvccbgN+SLnd6+Ci4zq29KFth042PujxUcMB4oUhYaBJZu0mBJ2eG
	xyONzCs2MHIhIR520bC6j+HzEvM62ElNd6kTMrsyMs1d/moMIbOiZWVg8R3qZ4QrSEI1SEL9WCAzv
	i0IX4YUP0gaVhHvWEe2hN84VTR93DHGIV/T8lxtHGT7SP7Lu5yDloAhEa3SUtqvEmD2fMaMxXrKwL
	YikrPCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dm3-0000000GeDm-3jJq;
	Mon, 23 Mar 2026 11:48:47 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dlr-0000000Ge9B-2TgW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:48:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+1JPBpSQVyqqK9x5iRm7pBRMhz6aPT+h/xmsa3X93+iJsAdnAOFnXVo8EwRnqjZWQ2xS4kJZ5y1e5lZJuDAwCFv33Hac4YdDH6MzIWoNmq9adulZkIY8o21oCBzxSs1F8RpgEU/efscGQ/5weVlqDXNF1DBu4VIXZo6bHGkmQN4rxhBNmOUi3i+pJGxDspetTT098lT9Eq2kdSSFsLvVEQL3MjcSdGJ5vu0SWsr7W+j1w2UnC5Ns+rZqkTV3VMm0pdsq/IYD2ZyvdwuDaE1HDRMVJ0a22HGye64sCdtMQivkxd0lhXkcxOYTPoUkU6sDL8Y2tYma1dSmygQ4ificg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN7h4RZni1BbiVdkXKt8OJJmCqr8fkwBfZrXXPMVjUo=;
 b=CTsvPguNWV+RIRZyOzAbr3QQbdfi1eqQ6/cu6jYZ77fd0sACLQFkR6PScwhPspQctNP5p1ujuj5MEcwPkp5lPfa+DONUBtPjCWmYMG0AOe8gzLh9XMYD7Ori2JRfYKv0D8BRWPOAbaaI4qtp0/jOLpf0n54wgsM/UEPlkmXtFevVv66i/2YRxggTfzl4UTsK92XQAX0fahDBoVU90vnBOgNCQSkRb/p5hCyyigCAko1YKMiysL9UFqQeJ+bTF3H7jPMYJ6WWsQIvG6AvLQHpLK1HgzVFbBHgsUwj812sKRV6Veg/0bxiihrqN+Wxx9ZMpY+mEl/ojzoVnN7mnlXQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR03CA0095.apcprd03.prod.outlook.com (2603:1096:4:7c::23) by
 PS1PPF77E02AF72.apcprd06.prod.outlook.com (2603:1096:308::256) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.25; Mon, 23 Mar 2026 11:48:27 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:7c:cafe::c3) by SG2PR03CA0095.outlook.office365.com
 (2603:1096:4:7c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:48:26 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3DDC34126F96;
	Mon, 23 Mar 2026 19:48:24 +0800 (CST)
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
Subject: [PATCH v4 3/3] arm64: dts: cix: add DT nodes for DMA
Date: Mon, 23 Mar 2026 19:48:22 +0800
Message-Id: <20260323114822.1925869-4-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114822.1925869-1-jun.guo@cixtech.com>
References: <20260323114822.1925869-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|PS1PPF77E02AF72:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d939c5c7-7c54-4496-c8d8-08de88d21846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: tfhsB0zPyWZXb/xsulKcB443iEVVMGr6pIat4QvXH0XBAfylIRLS2QZjv2ro5ol7Sez5SVSUAwRsczg5oDhLQTQWndzbARXHScRO53q5T8UFEwstB8tOFQP8bFDJpy15exMIqxG4AyENBkDu4DpAuw32IaMK/pfXiVfiSaWuV2ePVU6y5ZMo+PZI/IBREdvUJXRy3HfG5AddHg/uocKSmfRSQa9c1xqOg9GMpxYbnhwrgA8gdURys19V6ggX/kRdWeSLNo+LJQPwYT0MW/TiNom+EuXBD4FFS0Vjdcx778/c2GpsUAaHjNXO2BhmCGhmQpe1UkdBBDTXCZcFVP0/f+ISwzZr74dJcgUOBUPQm7NfICaX0Ul7RTHIfzPbprr25AuELXloGZ27bSd3OboHsALUAfZLiiKoBUFwG4X1VMrGmlDP92yOaDw962aeHS57nDvxiDnVPcto4gjMh2vyghq3HAF2UMoQ9gt+oXhXGq7qf+T03Fczco+e/iwhYgc3bQRejbRpdBbycFy+dnCBKSIPmKRtVevS9KWF6X1/hPoHpn6ZVUVXmOd6AS9yYYMnHzGZPPdUzaoOqMhL2jWdb+n347Heum8IuK0LvdW6MouPxa5DmWqw/HZbfOm71IkEVnlZtuE0c77Rq0WlRc7UmuKhkowdgr9+4X/MJsJAJ+H85ZHw7igm40XM99zV8RA150fs9ESWdaSWYm5AaGw1XEXBMnW3s0x7qAedBpjcDIluSJ76+SYiVl2J00fjehkTlfZlcTu4rHo2RPjUek/aSgzHILEztv1HLgHJZUkg7KzE8kDw4jpoMuAWr3Tz3Jjr
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tQn6pb33BV+ONzL1M4q+RrKc86iCZTnKb3PPiF7pZhe16wi7V9tikxybNQqzYH3/djKST+pSKGQYihhn2F5o2luUtLvVt38QIIYsTbWdYuh52zRn20wNCbHIedgZ7jJaQnfWpgqomEbDOPkxLsp/Ehn5mfy6QIVXMhFQb24tPf4KvAk2MS1UAHSVTwl7A/UQLX9LkXP2KvfXvc75GXxpKXcy5p4uYVNySMG/DdoyvJ4K+LKQ7yS/a9ZBlQuyXZ1UlfbQj4n2vXLWZQJ1UThR2MYwd4tNjOwWKqLiKpLOG5IVfxHj0u7CK8dB/RQrevSwyBFoVUjYv5eTVJWupbFQEwLyJEgbGkPc/EC00XxLT/pAm/M0ROtJ8jXsBeGDMVJM52ve5wG7Ecjnw+PCd0ZI7AP8rWxHYCnmMF3Wt7XoE376cBLELBHf0KcTCt54TJ2u
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:48:26.2477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d939c5c7-7c54-4496-c8d8-08de88d21846
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF77E02AF72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_044835_626853_92CF3B6A 
X-CRM114-Status: UNSURE (   8.64  )
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

Add the device tree node for the dma controller of the CIX SKY1 SoC.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 210739beac6d..1185c99d8d9d 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -480,6 +480,13 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
+		fch_dmac: dma-controller@4190000 {
+			compatible = "cix,sky1-dma-350", "arm,dma-350";
+			reg = <0x0 0x4190000 0x0 0x10000>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+		};
+
 		mbox_ap2se: mailbox@5060000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x05060000 0x0 0x10000>;
-- 
2.34.1


