Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E9CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVP/cX8K+IizM7MHHIWGgxoxHAqmXb0N3FutYFrisSU=; b=ZpRKeo0kjRHSBwNF40/FWoSbbY
	NSZkkeVpLLnyjdb2hONmYXSiglkES6QY3XssV4bcXsqUTWmGFFnpINAdrMqfMczIVO7eEQkMYbYgo
	EsNVWzYEu6GXrjTGEPyp4d1Pnc0nFZjM2QzY9HWb4lXvQyif8JfkCyJgM5nZFNWvqvWRj9Bcrpy6F
	VxTNgiTJ/hC9LaJHuit++NApttAhEEPC/qX5uaqpAwhclNG4OAPP9QOFZYwgTtyesp5Ed/6p7OdVg
	h+bOgp1XZ3l3DFan1c/Pow4CkRfmBVxEXjCxBjTTN7zi8amqmB1C/n8C/gHaDRwa+ebvSUbYMU3RD
	7tEusBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvF5-00000005nr3-2rdr;
	Tue, 23 Jun 2026 07:08:19 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvF3-00000005npP-1iYb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI4pcBQ4kRz5rW6eGEDQlPTLxh/36sr9hK+2dTKQV/zcB/wxUAmMlzy5fNfu+Oc+ALhpIA/rC8FYE04FAemP4UKFMwyYt3Lr5I7oR4q2LYKKs/rlwMvlb5EWJLVfI7BBTq1pvxWrq9TomIBnl+4LcXsVVNFOGv3YVrOCQgffiUI82FtcBtXUrFlJimVZ0bY2VtZJi4JK2J+NrS+AJeAQfhNyFBeU13gUhyj6IasFxj1BQCGekVrLgO2pXiFdxNi6RZyr+Ytu8hKoXpOjBPFC1/0cLuhEWNO2E15qy7oAD+ClxCeWaIRIx3TYXvWeOQ5CuFNZFeSe9JvROzwt48gztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVP/cX8K+IizM7MHHIWGgxoxHAqmXb0N3FutYFrisSU=;
 b=F5g9itcJkwY2ygpRKHWLYPlq6tqpvLMYJorQK70LBE+W7nVUtr6W+HkNxNEuj2XcSGoSFF1uXzdUM494kCGAd+NCAnutEZs73L0Ndmp4WSE6wznfT6IOY0t/ol8WHC2xxVwGsFtssMVjEqLYjLB1PNB7olUjQgSA1gdp1kPPF9CANy9CO9HNlns8XH3F+Qj/npeZqcLJ5cADTdmGROk36Gc0hEsqqtiUVXs66qeyz9DDEATW1FcLKYrNlKHM9hU9YMXFuV8zAsY/jiTI8jXPQe0JvjOYPK0gJO8zaJvSpIkjsIimR2XSkUdcWZqfLoVZFeN7tn1OOF5T9kwgMSQx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) by TYUPR06MB6052.apcprd06.prod.outlook.com
 (2603:1096:400:354::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 07:08:11 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:192:cafe::8a) by SI2PR01CA0029.outlook.office365.com
 (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 07:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 07:08:10 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 95F9540E7F9C;
	Tue, 23 Jun 2026 15:08:08 +0800 (CST)
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
Subject: [PATCH v6 4/4] arm64: dts: cix: sky1: add audss cru
Date: Tue, 23 Jun 2026 15:08:05 +0800
Message-ID: <20260623070805.211019-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260623070805.211019-1-joakim.zhang@cixtech.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYUPR06MB6052:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 007b7fec-eabd-43bf-a341-08ded0f62f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: tjOKooxsYctyzmGcg8ClkOboALl0ywWqIOblc9Fmylxpz0jWoFrlLAMk89MlyRzSsSFwh38sj3dTEHvJEAiA3IN19+yLuXEA07nS77ltP5Mwszy5wIzdOfTo3NBxhmYoWSZVVZbb9CuL537i47es+92rk563bZ/a8gft2jlET8o0u3BgTHieusjKmfAC0uqa+G+lOjJjKyaOwQlWUqv2YiAF4zYu5wSQTDmXkNJ+4jPo7rtnwi2RI6sFaLga9VsTL/Y7Doh1Kid5re8V41HDwCiAEXuMUtlonYaCw8vojGjZg9P8kTrkA1oYdP6yY9i+oFXYT17qX6eqNzV/6S9IBqG+rWIde2CmQnJ4VVxO3xyh6ZV8X5ZzZxuiFD6weVJ1OD6dPAovi3ifCRHKAkJUfu0mXcpNSdzUhhzj9tMANSLRg7el+gChk2FJIV8KbhTrdrZ5NUOGZjjot4YJKhmDgpu3/6rj610FNZRZsd5eb+PAlEjNPAR+PoF3ygiR22AubtSGLqa7qnsHu5BjbursxFjEt6cjIIMz+6TLCMSSeMCu7RBv1MDuxwN8RtAshEeJCq5GHMbfV2cSEAWMs6S50zEx98/a1qJHlmqzDjWx7KOPwxCxzVeVOAunAyScBBHV8zX30gPVjxvfaak4tjm9RHEFvKARu8yrXI6IKxG+T27V4Ntj7bTMIoKzBWhsyZIl+V28VczB04DdD+I/hw0n3Q==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RGCwTk7urezJpf+VefzV0fPsWwAHRTlVoRLI5dAe8ED5ymQgP1CBdgOX8vcPYI1D18VBd7BGihhBIbF1vhOkc1kajj+y1SgGV7Pj1hyZpjHKb9hX3JoQB6tq1kcHb1wF02IZeFhAYiayKmajWvgr25Ne7I/dBsnJXlzoaIWOzq9Q0FI4P8sjDZFPDWW78RRCQcWR20nllFNPD1HklFdZN4OK+kDaja/kqlV/3tlYHj3D7FqRxdvhSQCjcx4BheaRd3ZTPFuOoDmLgozmeIJxa4zbB0T4079i6JmYhvq1uwTx4pvZ+SF5iMenX8nQaFqIVzj3NnFXx6d3coA1Y7R2zUKN7yeyqzhiSUmJfwmle8HVpuhLxnS/ABLgFGL+XgCAwhhAl+XVi9XRHo2SHo4hgJmS/iWeTS2ILMn1z5oW5Hr0hG8IJnPgpVucOrzGBwCR
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:08:10.0374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 007b7fec-eabd-43bf-a341-08ded0f62f22
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_000817_448619_F5A5E73D 
X-CRM114-Status: UNSURE (   7.79  )
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
 arch/arm64/boot/dts/cix/sky1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..6d045d7216e6 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss-cru.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-cru.h>
 #include "sky1-power.h"
 
 / {
@@ -488,6 +492,20 @@ mbox_pm2ap: mailbox@65a0080 {
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
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1


