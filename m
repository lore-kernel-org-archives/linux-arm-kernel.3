Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E8E103E2F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=; b=DMZiZqLw0GDYSEUCEQUhiU5VxS
	4qSCEeGyDmsBI5MfFpyRLV0ohaNEQf8cKI39xK8fOwRxqpNh860JWr3s6pyaZPn4ZHIHKars+cWw3
	8eRKjWqOljZ8A8T8Q0QiZWefkydWxYEWrYHfatOor6Q9HqoIkk8XwjvdN1QFcLHBv5+E0U+RGQbjG
	cZ7o5CZ5MdtP77HYkIXUQqt0z3ydACPRE6o1slz25boervQqGQXZ8XdpzMeNWf0V/Z9VSP0h6x+gk
	e1Hzq8Y5IfX2yfK8BBekPh6LnATK2aBiYYNgQsfvlUIoHawmUXtPelEnngDnrfEGlf/GBY3KqlcVC
	GW7kyGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TIj-0000000Crj1-0aJT;
	Wed, 11 Mar 2026 23:49:17 +0000
Received: from mail-westeuropeazon11020137.outbound.protection.outlook.com ([52.101.69.137] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TIg-0000000CrhN-1lOb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9HBiyzaXwEpuvm04ZQMUzxSgOB0sJX2UiXcCbL1hmDY9hiJ6DDh/sqWCZrmRYIAUQgq5z8qlJHgIKAg6XatKNZvkqRO5I+yjX1yhI4sMphd5mAiotyJYPT+DCYebRcBR2t2335ZmsE6r7YIFONnyIjFoHYA05yV33f/g8XGu+bEFHaXrv2cHUZD4wt95w9wqH5Y4iMzoT1dBySgM6v0OhERsyIRqTA6DUf0SGY3I+k8h9m2UOAONMHcKC89GVQ+/h07m5zBJaukYCzFEEeyTPJc1OROVnbgKRHIeYe7Vgptlutu/PuWjePzSQsQ57fIN2dwFEa4ckypzrtBtycqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=;
 b=bLfl4DeDzxJ1JLFJU96F/8h9Ta3FzkWYNx7asQ+ovcawyTZ12XW1061UxGfNQQCWmaxliB+FLEXggl0pH7ZD0H1J+3aB9Ko6JCuxJkS0ykwXLiQXk3Vo2jTpYbMuEVGTkq4caVbeBp47FgqIyzEdLkOLx6qzcLflYkXqQVoPZCL5pNqS3jUCAOZM6oe4JAWgctaq+Ge69TL2RmMV5rQa1U8PeLP4kxgDjtr/o95QSsvXZxgzgcxD9HjHYWA774Mdy/Wen53lpP1XtoyqJLh3mPJiZiVgireux2EDdF/KPigmP/o9sIaE8Zhst/NeEhmaNVWj8iWw49Wx0kjIhnI4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=;
 b=ao9WbKvKNTwsTif7YCBRG7SHckk6Ml6OXL+EFXU1giLvy5j5wwXeti3WYRdHB4sDm5rSNeN9YfiSjcNJFMGre2X+sn5BrZxLsoQ2Fhsl+TytPz2RU3WaQGxuJl5iqjDyqm+RcRvF9WAeMzqhfncqdBZ5kkyz0J87i9YI68eVRFHsGBzD8xd+kX0plRc58R0tnEQJhU+M+PqHmM5rNx/Ez3U+tUF1JavFWycwEeKzI1eXDS2hjrODqe66WseUH4OX5vPzVxhVuVWZFL8uOTwQZBlUuHh1OsXNwKrFvj0BXaxYOaxs+yhL3QFz3Lx1acMoPrrrhdEJlMsFMuHpVZfsTQ==
Received: from PR3P193CA0031.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::6) by
 AS8P195MB2342.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:638::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.6; Wed, 11 Mar 2026 23:49:06 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:102:51:cafe::7e) by PR3P193CA0031.outlook.office365.com
 (2603:10a6:102:51::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 23:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Wed, 11 Mar 2026 23:49:06 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 12 Mar
 2026 00:49:03 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v3 1/5] arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
Date: Wed, 11 Mar 2026 16:48:37 -0700
Message-ID: <20260311234844.56443-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311234844.56443-1-d.haller@phytec.de>
References: <20260311234844.56443-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|AS8P195MB2342:EE_
X-MS-Office365-Filtering-Correlation-Id: cb005991-eb11-473f-96d8-08de7fc8c81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: T0cisb7M3jFZoQU+sQcxFVo5OqduxR7dTXSHE6nRv7UXrpYd/Don+v0QrzYkW71YmRO15BhVoHWAs5Fb6djJgbMISMdwfskQ6H7dLuO84wqg1Lwq27/s2i14Sj0I8QOpi1xzoWM2kUTzg+0uylqyvyMO0qxvmFQrhcin2ZVmxBVLSPY/er90osGfFy8yFlSpFa3yOeBTNC2HVyMh6tfG5RY1NfQvUdQw8PjbgERtRIEhfQTRQxcqO55+ZcIEXxtOBvDRVcs3JChxU6xnqxIIjL50g6aS59Iwppml1k5s2WBs8UQXKSGlqv7tfwqK5+cONsZ4mWkYGsT1ut5Tf7EZGawvE8UXgnWqPBBuoKoYWciY78EqRbK9f9yIzAnU+apI9CevFZKPFtjKUaPC45X3/bOpu3yN3Pb/HLQgCY2/40bl2Ej6Sh9uMD+7K9uAWPFBvtulEZeXUuaOTayqNCQPOSWQ+QqGL64CMpNLnW2RZEShmjlnaaOt94jszOgj1okR+cFY3oRrDEGNYTLLvioFeyyEHuZqM6nQCCvYBXUAGUHmtM0uBKIoBjJmM+9LMFFMnJzLUJrZg1X+nftCcb8lrfgUGUU4FobR/pWS/0v2ceQXhiM8HZ1miuq4La7f5e8JZZkDENBo5EGfj/+NLUuIHuZGmUdd5EnqqWt1WbkjSzse5w/Vn5RgEekxL2dBYarrQEMqC+nvgBrKKLNC9+9dv/RuHLvLNqHG95AYKe0nRAV4MkbUEoKzWKkG2ZdnVdds7B+zCG1D9rGhagYmRTUfrw==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /L8jP8h9ls1c6Me2XHs6Cj4MxjJnuV697qAzoGesQRKstRIavDrWofZdqS1U0rhXo3ap/rxu4gjMaQkfb6avpDG5BNesHG6FTvooT/oBWj4D2Z5wq8/P0q41xk7k48J9NgqV3VpIPn4iTFyF1r5VkRcQFLRB76VaSr9rCZKxpWXGB7W2ZH9W9cI6zP871sHCx0IyMVoD5eWl56l6zIFdvUP7rdlRiqoqsn8Tsybtm/DuVUqS1b+m1kHLdZ2Gvyeku95q4QWngqSA52LOohiGdG8KsafEYpv6XV8OuROUTAGJ+TKRuBLD/Gj/tpGGfk9aMYFDeyH/gHlW/AqaB38hWLgRUfTOsczH8WHlBbDvt/fqrvzAJYzRMR1cOIcBsVzfYOQmmZ3thV+Y/UqEUCvOti05MK04XTiUQCsNx3vpQCbiu8ZfQluEAW0In0ynXEMY
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 23:49:06.0177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb005991-eb11-473f-96d8-08de7fc8c81b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_164914_458250_02B39E3F 
X-CRM114-Status: UNSURE (   9.63  )
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

Assign the dss clocks in the base dts so that display overlays can be
used in any combination.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 .../boot/dts/ti/k3-am68-phyboard-izar.dts      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
index e221ccb30e95..b8d17bdb7685 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -298,6 +298,24 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&dss {
+	/*
+	 * VP0 - Displayport
+	 * VP1 - DPI0
+	 * VP2 - DSI0
+	 * VP3 - DPI1/DSI1
+	 */
+
+	assigned-clocks = <&k3_clks 158 2>,
+			  <&k3_clks 158 5>,
+			  <&k3_clks 158 14>,
+			  <&k3_clks 158 18>;
+	assigned-clock-parents = <&k3_clks 158 3>,
+				 <&k3_clks 158 7>,
+				 <&k3_clks 158 16>,
+				 <&k3_clks 158 22>;
+};
+
 &i2c_som_rtc {
 	trickle-resistor-ohms = <3000>;
 };
-- 
2.43.0


