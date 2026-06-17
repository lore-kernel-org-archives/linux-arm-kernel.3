Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655E9CD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2acalGdjXOFuxzk/aAGrwUTAkAlinpXJgrCw5xAZqA8=; b=TtaAtV0nTbvy0qBpnYSj4KEH8J
	2j0zNEAcD08cSwa4x/3QHzeUSY1xJTAADTFxsejcHrgh7Os7sKeL9M4TkAdHwrP2t480fRdsR/RgJ
	Wluw78n7+fpEnVTyI8Az7oL2+2UyLwExsTtA6g5cY2vcTBltcNyDcPyc9f/CuTcfMWwcH215UFQmz
	m1weRSqPZCroAGXSKqc8+TZdzZKKIGejYyNvKCLhveRGTglGeAIK1ceFP/s5tCBVy5pYZeSDTCWnV
	d2FgMx+7pTtGXAMaaHotz0S2GWqAw9n1swStDA0fR1dHT1J2hSLhv2PuxXyRpn9W6o6lbJURDUYnh
	z/cp22HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjOc-0000000GgUL-3yl0;
	Wed, 17 Jun 2026 06:05:06 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjOW-0000000GgQX-0EN5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8xuOfXoTAnGiGV11cNT5HdR/Qo9WLUoLz/WGzHa0s+vGGjMS6dGWlsTU7MebwCVwKsyAAf6HSeUHQdT8vOD7NZVz6fCxRa8FN/AEEDJdvPRpHKNH+q833E+t0xCj1FrjdTU34sqsDcLhTGhLfQn5QYoJXkqsIWMDMyfUUohLm0446Cz+EDuCBWRY9rLxiAT7tA7ELln6/euuA39mXkkv4h/Ke55WRMQFSGrSb101C7yWP8MHECFHo6yUI9/LQAed51dEawFuCq7429JBhBSgH2Fk5ceOhYVSItfTJF8gB0Ns1uqKYQJvjeqckpo3uU/1nu+z3sIwhdAKU18zxy5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2acalGdjXOFuxzk/aAGrwUTAkAlinpXJgrCw5xAZqA8=;
 b=klZ7gAOjC/A8bRhW59u4m9Y5MrqbRdCKWjLfxcpyW6GgOdXesVBQ9zWu2bvUwzkW03Vh+S0Zz0ijpGbgrCEJ1BX3AVcg89x/6X1mxZSJ7usQuO6XPR1gejCOdzlBccpXjarObClTij6FJeX1WJGhnVEFUdeuIucQUNamk/RImZvRuDsdzQrChA2hxI+nvTTCw3To67Fwy5S3YFmppVChdOEiBbJHKVkjAAo9XqpmCqcWjvk1iBU7foDggD3ncCuXv7vJpZUnWhZeg/SzBH5Mg5LACxtoyxVX4mkYjXrNj4rpiiAWNdAY2vTvxgnyllChUvdwEm/mkOWdOMOdsQz0Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0050.apcprd02.prod.outlook.com (2603:1096:4:196::11)
 by PS1PPF6469DE8C6.apcprd06.prod.outlook.com (2603:1096:308::253) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Wed, 17 Jun
 2026 06:04:50 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::a) by SI2PR02CA0050.outlook.office365.com
 (2603:1096:4:196::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:04:49 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AE91D41D4011;
	Wed, 17 Jun 2026 14:04:48 +0800 (CST)
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
Subject: [PATCH v4 5/5] arm64: dts: cix: sky1: add audss system control
Date: Wed, 17 Jun 2026 14:04:37 +0800
Message-ID: <20260617060437.1474816-6-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|PS1PPF6469DE8C6:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d941dbb-9f29-467b-301c-08decc365758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|82310400026|376014|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: W1M8FTtpVvduu8p1024NIMSglIc+BMJe+Fa6OkmlmtMNDf4Va3IbOdKSpa7JcnrANkIofrGMmaYWjG5yjmvZefTXN16AB+R1WK51B6aEI+Nv+trZUW/Tt2WdBSTMU8BhtJHRW8PcGiwSMsg/1sxjNJFfVpC/8o042MT8aIg8KTFGEhcV4uVg2qSfO/OGyV8kKK2tXXQ6f5/oNijyLTjftf4e9y0EMNWc+CvxHx4iGvw53sDgo9Z2xFyd+vK6l9M3oLewwH8+xBt9hx+iBw4SH2wqBmknXVlQyp/r/DguWScAqFKnur/jsgHZSxy4AUsTRoKGePjvvnAzdHivcz3dE4eN/0DpaOfUAQcF5Zve3NmoQw0nM/BuXph52OIXdARxmDer3+4PTzTFq78TwT5vI7MMt6qpHo6SaMbRHKtOYI/Vy2kipg0cGxmH2RjBk36dd/UK8hZh3e6Tk7pgS3RU4Yg0V95TFnkq7V9k6ywO9M9IH+7fLEBFA8nu8JZbk/N+HF64yzQvxBHxLhQ8k7+GL+h5dTwdAiNnWIdEQNBV/ecLh2A3Ti/HguFFh5i4zu0Adx9rlRrC+45ICKiSUMxpxg7ElTUH7Sz7s7N8kA2CunTEVXZMwxyOvuI5/SiSCVmjHFiRfppcaarHzRCOqj08R9WXBBZp8MMzt9yi1yOHFQp7DRKf2x0X9qW3FY26OPuDCe19RzSFEKj7ZuKqjvOXpwxxybQCtjkG0ULP9OLqulI=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cBP88uG9Jnq78eh7qWefYh09QWsDn1LTlpFMgZCRMvY4NYn7YLACnUUz0tPFjh96Z8fNUyh44z13PQLxTqh4ig22B8uBmisYY61Dkhpmeb7VZ7j2221VW4iAK24NoopJFJRuM1WdT4012nwJIzZuZlZD3wFMg3r6k9YuJUAmGiWb6tyHCvce37GVPSmpi2jY56cIuK62G5fleZOdHzpzU+Deg+aqX89uesbHYBV2aqNGphJrar8khbfDihgAfiaUvNRvUc3ZM40LgYeXwNwSghaBFHuwowEL/9J2kuy92VOx3zHGeH74pX+vG3Pk5s9DbOk4gbE7t4ic2VYuNRNk2O0RGZ0aOaMEQ1KAxJyZFB03PkiXwyoiM49UzzpX1v2FmJiJv49Oe9v61F/T0yED202Ajoyl9q/kn3VbOG2Xu/nQU9Q4/0JpK4mGHA6y7WrQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:04:49.6788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d941dbb-9f29-467b-301c-08decc365758
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF6469DE8C6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_230500_093529_939A6547 
X-CRM114-Status: UNSURE (   8.67  )
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

Add audss system control device node, which would provides
clocks and resets for devices in audss domain.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..3091789fc176 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss-clock.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -488,6 +492,26 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: system-controller@7110000 {
+			compatible = "cix,sky1-audss-system-control", "syscon";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+			#reset-cells = <1>;
+			status = "okay";
+
+			audss_clk: clock-controller {
+				compatible = "cix,sky1-audss-clock";
+				clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+					 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+				clock-names = "x8k", "x11k", "sys", "48m";
+				#clock-cells = <1>;
+				status = "okay";
+			};
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1


