Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D91CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0PM6BQoMCaPEbPybv2NDcfnzLwH94k+onqfWHsmaCk=; b=0mQHBO+IWt+sn+Jng/3gabJ8JA
	q1lT0rkBQcJCq+mj6+O/pfLFRib8zXT+oTj8/By0E/kx911h/FJ8S+chtljOH2KecEqfuYJhuQgWO
	Qjoq01sI8TxXaluh56Yzz1PURHNs4rW3tB0VOn7nKqn6pdOnPwXs3NaZ+W+bx3ylNAl2y28SoDtew
	wf9Mck4gWPslaA3kn7t0asePxi9sEOuqeMzY1RSacVGeVwsdQClJKlcDKTbXN5ok80UItHUenvOPC
	ZRQ+cQI4KZnaNi9/DGtoOtfhHqmULY9y7GGAJbtlQhQ2wwMQ+R+t1n9h4QflAK7Ia28K5OboOPzeU
	TjpeSDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPi-000000016b1-3YHp;
	Mon, 08 Sep 2025 17:12:22 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvctA-000000007LA-19VK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:30:37 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588EUXmI120446;
	Mon, 8 Sep 2025 09:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341833;
	bh=d0PM6BQoMCaPEbPybv2NDcfnzLwH94k+onqfWHsmaCk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c6oalWVYr/tfl+8DFPE+K+sDjPjnUZNbi9oUN/QzrDcRZZn3SPsUzy2DgWKlsW4WV
	 DH1ZK2riNk7KIj+K+p2FxlhSCPKlN2ztluvE8YVYDMgXhPpCu8Ihs5ZQCm1+KFyXPe
	 PUiaBXZwTdxdvSbSN+/fL+Z7Nng6fPBF5r8A/Fr4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588EUX4b3835446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:30:33 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:30:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:30:33 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESecv1037553;
	Mon, 8 Sep 2025 09:30:27 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Wadim
 Egorov <w.egorov@phytec.de>, Matt McKee <mmckee@phytec.com>,
        Garrett Giordano
	<ggiordano@phytec.com>,
        Nathan Morrisson <nmorrisson@phytec.com>, John Ma
	<jma@phytec.com>,
        Logan Bristol <logan.bristol@utexas.edu>
Subject: [PATCH v4 19/34] arm64: dts: ti: k3-am64-phycore-som: Add missing cfg for TI IPC Firmware
Date: Mon, 8 Sep 2025 19:58:11 +0530
Message-ID: <20250908142826.1828676-20-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073036_400744_421423CD 
X-CRM114-Status: UNSURE (   9.91  )
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
Tested-by: Wadim Egorov <w.egorov@phytec.de>
---
Cc: Wadim Egorov <w.egorov@phytec.de>
Cc: Matt McKee <mmckee@phytec.com>
Cc: Garrett Giordano <ggiordano@phytec.com>
Cc: Nathan Morrisson <nmorrisson@phytec.com>
Cc: John Ma <jma@phytec.com>
Cc: Logan Bristol <logan.bristol@utexas.edu>
Requesting for review/test of this patch.

v4: Changelog:
1. None

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-19-b-padhi@ti.com/

v3: Changelog:
1. Carried T/B tag.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-19-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 28/33] to [PATCH v2 18/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-29-b-padhi@ti.com/
 .../boot/dts/ti/k3-am64-phycore-som.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
index ba425b125d63..5e0c82960a6c 100644
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


