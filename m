Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D1ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9uSfr6ojlMufEEW06DLD5dJuKT5Cow3HA+9ylipXx8=; b=zkvwEkUxAh9PijQFJ5coK8q1ay
	Q1bntaeIyXIONbou0YWzCvgxbhguY5UwcYMZyB8pmpYgcMjWrjIAJP1YigCCFy0KL19NnhkTvzzAW
	zsd0yV0BfqJjZZwze6aMRhlqhsNMH3Z/ysY1fniorZrny1evjwXlSBqaBGR9dQsOBIXMwX/O1QFcE
	RDVlJd17PpGvEJ/rsEjGYrJ8JV/iI6Ax+9x+sGulSVPi0/vXUU+dDhV17+jlV6Ty30QpUxkFZDr8F
	UCp6HlrChC201H9oQ8e+7DV22RAaY/BKOOt+U4wCDtkGtCjyoIpvgSNRrDUMoOz4AMPD3iDErBktW
	41IiRzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upsYp-000000059fO-1n6J;
	Sat, 23 Aug 2025 18:01:51 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqpN-00000004zUt-2esb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:10:50 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGAjnu465165;
	Sat, 23 Aug 2025 11:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755965445;
	bh=b9uSfr6ojlMufEEW06DLD5dJuKT5Cow3HA+9ylipXx8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZVu9S/PHOnDl36o+mBsGEvA6sXYlQATcf1YsbWz+Y7KKOOwCP0DnrmurPEVJWG0iH
	 IcJ7uHmY8XbpFKJLvZTgehvbhdwAge3Q44JqtIwibrcJ3WcaWIrkfa9g5y4QEHE5d2
	 bYkTed4acL8RY97BumpvHkH/a9eGkf3Uf3NX95Ys=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGAji6239731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:10:45 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:10:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:10:44 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NG9ExY1274978;
	Sat, 23 Aug 2025 11:10:39 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Wadim
 Egorov <w.egorov@phytec.de>, Matt McKee <mmckee@phytec.com>,
        Garrett Giordano
	<ggiordano@phytec.com>,
        Nathan Morrisson <nmorrisson@phytec.com>, John Ma
	<jma@phytec.com>,
        Logan Bristol <logan.bristol@utexas.edu>
Subject: [PATCH v2 18/33] arm64: dts: ti: k3-am64-phycore-som: Add missing cfg for TI IPC Firmware
Date: Sat, 23 Aug 2025 21:38:46 +0530
Message-ID: <20250823160901.2177841-19-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091049_791340_BA050161 
X-CRM114-Status: UNSURE (   9.59  )
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

The k3-am64-phycore SoM enables all R5F and M4F remote processors.
Reserve the MAIN domain timers that are used by R5F remote
processors for ticks to avoid rproc crashes. This config aligns with
other AM64 boards and can be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Wadim Egorov <w.egorov@phytec.de>
Cc: Matt McKee <mmckee@phytec.com>
Cc: Garrett Giordano <ggiordano@phytec.com>
Cc: Nathan Morrisson <nmorrisson@phytec.com>
Cc: John Ma <jma@phytec.com>
Cc: Logan Bristol <logan.bristol@utexas.edu>
Requesting for review/test of this patch.

v2: Changelog:
1. Re-ordered patch from [PATCH 28/33] to [PATCH v2 18/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-29-b-padhi@ti.com/

 .../boot/dts/ti/k3-am64-phycore-som.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
index 03c46d74ebb5..1efd547b2ba6 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
@@ -275,6 +275,30 @@ mbox_m4_0: mbox-m4-0 {
 	};
 };
 
+/* main_timer8 is used by r5f0-0 */
+&main_timer8 {
+	status = "reserved";
+};
+
+/* main_timer9 is used by r5f0-1 */
+&main_timer9 {
+	status = "reserved";
+};
+
+/* main_timer10 is used by r5f1-0 */
+&main_timer10 {
+	status = "reserved";
+};
+
+/* main_timer11 is used by r5f1-1 */
+&main_timer11 {
+	status = "reserved";
+};
+
+&main_r5fss0 {
+	status = "okay";
+};
+
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
-- 
2.34.1


