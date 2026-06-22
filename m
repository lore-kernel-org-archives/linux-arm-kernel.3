Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961D9CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 02:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTm2XL8a1/DmY7Zsk0M53nZ2+aOtYHrrqgUwUPGcdgo=; b=Bvl3NPpAylfZ0p6XhgKLd6C/0F
	A25KUC6cQWQb+rwlztQYrVzws8b+pqMyDiIEdABg1UQco3A/oimyFY6CoITEJ6htZQf69pFsvxero
	TTs3QS6G5y5hbBy4/JJkbic9wJSvRF/IzESoGK+Ss+GxT2qLi+tmoOmfGca5dzSfB00DMBro0lmKa
	VMPfNB8nk70a82peW1A7mu7u0yu5kU/WO6pA+VAKVXPC/mDGLkmTqHel11Q13uCuHZvDiQ8v/hHbI
	uWjkboVsBDRAAuNmZ+hikVq5HPmbGPXzpsF/4LvKlIRsY+jz1Yc769Jb5AkBtwEtffeDHmchnnlNt
	5FkmQ42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUMB-00000004IqU-0v2h;
	Mon, 22 Jun 2026 02:25:51 +0000
Received: from mail-japanwestazon11022139.outbound.protection.outlook.com ([40.107.75.139] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUM8-00000004Io1-2jjj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 02:25:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMbaoLQjAyOueyxNV4gr2T+6XqcPr3YWn/JOJVGjNmvTbNet195b+KIAAzxyAkQp49+z6kzMpzHw0gNpf4eJ+UxlaoTXK3qd/OR60NkT7Db9jXAHVM/5bxC0eWVd7kmOnh62sFcc8cTQN4jNwYZ1dje0cgL917BCYGNlA2qLn2b/dGgBQgl1XB6un+f170BOjK91F99VDRMN2zBOKGPMzQFcWBMN81yfvp4g9y+KQyD8u/T3TbeWRpDL0Zwv7GzPxeWFiOnXNxOa+XcFbKXCUKBzvBAeG0ytMwaw13UnY+N+iPuWNTP1OQqWpD9olUT66eW/ocO3MtJ9rPiMBvwcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTm2XL8a1/DmY7Zsk0M53nZ2+aOtYHrrqgUwUPGcdgo=;
 b=ApYaiNbJTisJsh7XAmaIXgTo4XTTj2hIAsPiVOOpoY/9ps9p2KqkBIat5aP0QVcNJ6sRx5bZqzLrshKDEIfbFG1pBi+whNwRmJYMhM2MU02tHgaxkGSV7zUQJR4JAP2PmANWYpuj63/7K6/rNGgkcmJOcioDZliHIQcYMWCorU5TB/Fk9QyRsMXNlyFmAIt8Lwdhyf70Lli8vVsFv55k++/stmUAAhDsh043PwDH/KL4QZ1EF5EwkfhSdRJMArHmDM3nZ6XzmDCGB2ReCmdYn5sNt96luDNh0lUHweiqvuTLfr9FeuldiPXDsVqsLoQ2wyn/HDhyuQJ/cyDcog4Vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:4:186::6) by
 SE3PR06MB9219.apcprd06.prod.outlook.com (2603:1096:101:332::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Mon, 22 Jun
 2026 02:25:30 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::46) by SI2PR06CA0010.outlook.office365.com
 (2603:1096:4:186::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Mon,
 22 Jun 2026 02:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 02:25:29 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D2B9540E7F98;
	Mon, 22 Jun 2026 10:25:27 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v5 4/4] arm64: dts: cix: sky1: add audss cru
Date: Mon, 22 Jun 2026 10:25:20 +0800
Message-ID: <20260622022520.3127103-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SE3PR06MB9219:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 321c13f2-03cf-461a-cc4d-08ded005873b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|23010399003|36860700016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Lblxy9gWLSnqf1kBGyIcgWjxzoyKud4H8SS4IGoLw2tHZhJbre6Hco1lxLr4DjPQjaZQf/7D3uWsifWvGLWzbeFw1GTw8HsJUFb6jZDxqhQtgmezSnNbzRdrPjHVcIwiPd18NCr6cAKZqYi2AYiwTXjDvcubTeiutoSqSKwUgJULj6lNiFKQ8IS4zEwlqaYpWULJXoZYXs3t9eB05cTP4mP01QWcmeeY+Z9HMQtAcvfkqwhtFvPQKCdvO/PROhkm6CaDdf76c0dACR8ZSZmgIr4B7ZcvZQAT3KsNdgohmcIuTiFVkDdwWAx3SJc9EmQoZwgyyCyyiYtM9Mf/vs6QWHiw1iqh6nmvUiRmYwEB/nJNWnMSHrUWBmOcQZu3m73aNVAoVOYGHkJae9CgFi5jxSqCb3IQvWGnctqvKojGZsgVlojim24r3zFft7zDh4nBDJb/+1tiPJhU5CglXb+w0QiRwMRkskNT7JzTsZFgYp6trSiTBnQJz2OKm7Ig/HJDfDfQdH9DO5II1bvxK7xzajciTcyxxBZDloRvvwsH5n6F1aGJOsK9kXoBz2pSPL7Bxs6VJprmw/uUy+ezzfbymcBgP2CqqLoLIWGE4lrtf7NMfxHtbwggnF7eGxtfDLxk0HfU6v+eQka3TrmvJ3Nw6Ju1nwdWpzgi+r383wIAZQQSK/6NjcBf9MA87l3PayUK+iTEv1KOe2OmGGrQfjc+FQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Q4H3vk3RgC1bHQeHo8NTMmPR9prt+2C3iRIc0zZOeUrMuK7Mx9dp2Fjbx02bvGG3a5jLF6etOtWk5t3lH7wRjqZdk8N+mFis+KXoQmdgMUlDs30eD8xPcEejlndDOVmG0id7vstw4Et9G63VzMn0kjJfk1xPd1sejAwzqbAlQolJ7C3R6jCGHGvzTMO7J9u6NDbltNfGcJu5adl94GdIs90Kf0dT9efnY7VEywi3/lL/OEf6qmdtsqeooQIZiRZnlj/IhI0K9eRrAZfAZDcZhV9sPtN2OB7IBfhCYePB+8WV7YUmgtbbITy6IcggEr8sr86V1aPNqTvaNlkZ2VhMwC61w4WH6yLE5oOOA5u6UCwGUp+4a8EZ4YQSt4EBrkkbMXmQ3G3LlO3Qrgu+rD/gE6guNeur4nfhMtE2Mna4fe76T1R4mNK3XqDTVjDZxPQv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 02:25:29.3030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321c13f2-03cf-461a-cc4d-08ded005873b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_192548_705322_757024EC 
X-CRM114-Status: UNSURE (   7.89  )
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

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the AUDSS CRU device node providing clocks and software resets
for audio subsystem peripherals.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..f125f92d64aa 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss-clock.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-reset.h>
 #include "sky1-power.h"
 
 / {
@@ -488,6 +492,21 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: clock-controller@7110000 {
+			compatible = "cix,sky1-audss-cru";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+			clock-names = "x8k", "x11k", "sys", "48m";
+			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+			status = "okay";
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1


