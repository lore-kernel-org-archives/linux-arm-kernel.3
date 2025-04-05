Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8692FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kbMmR2tIQt85OejEztUOpNk2QJKMnsU0zN6RrSPaRc=; b=GZvKeqQFjlqaqo4K1grky8TV/E
	WXhr2zOcQKbZdkXXAbQT68uOTf53/hPZImpJFD6D3OfI2iuFwyLUagWldQLMIrUO8Fkp24HNWV9KY
	4GpbJVXNfQKUZaWHtCU9csv2/kIArAKTQ8e3y6euKkM+Y58lB+YxX2TtW2uIgHVwA5brVTRui7rJD
	1NkAtsQfvwO1qjOANGgS7G8kmYrxw/KoZu2o4YmE8EM8TBDiD3/gdzIW/WVEJSZcquz/DrM+wIRoY
	M7zd/PxgHzO2RNemdn4wtUKh2b+3OvCmcLwIMErNht4Yg/mmswNyS1oroL73LrH7fKQVTqgGJjCz+
	P2ioSuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rXK-0000000DDWT-0GBE;
	Sat, 05 Apr 2025 00:37:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rCG-0000000DAXf-0Wng
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 05 Apr 2025 00:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+kbMmR2tIQt85OejEztUOpNk2QJKMnsU0zN6RrSPaRc=; b=kmwQkXd0dHPT4zJZJz+pOZdMHI
	YlxKW6eEk/aszcATR5+zg5R+NI/EpRs0XD6bTWRdioRyomlRtOfjbjkN9cNa1H3uQ7P+haHd6iTAz
	p4DrNb6+DWj4LSzKaPQLq1++0ATxG75HTG/17bwfBlDkRIFKQrj7IwqZPA+YBbpl7sKnsBzfFbXV7
	AVBL6Od1ysDAi8xPSHd9f754TX3Nl4tm3u4o8mtzi29r4MIJ8G2ezshe/MY94t7+hRGIArFxZPeUF
	I1ZZIvJR1t2Gpa+JWqu9GU1MwqVaqXUDI6fCZA7GdiZc/Wb8akNy4KUCOjImDuk4cGG2cIfL7FBkz
	RGimaN/A==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rCB-00000007Tq0-05qN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:15:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FJS8464798
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 19:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743812119;
	bh=+kbMmR2tIQt85OejEztUOpNk2QJKMnsU0zN6RrSPaRc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xOAgztZekWbAPxN6egfSA7+BCXEasNCMnAP0BknLn3wKS36bdLZI2gAhi7mMsh0o0
	 el2VX+ZeIHnhuZUJn6dPtX2fBpjsKMcGJCkirKSKdDDcGuB/3yBf5RVbFmBT3tDlEw
	 9Nm4BVwtjru49xoCt9sjM0FxjuCAniT2Ql/rRpKI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FJsV092676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 19:15:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 19:15:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 19:15:19 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5350FI5k065952;
	Fri, 4 Apr 2025 19:15:19 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>
Subject: [PATCH v6 11/11] arm64: dts: ti: k3-am64: Reserve timers used by MCU FW
Date: Fri, 4 Apr 2025 19:15:18 -0500
Message-ID: <20250405001518.1315273-12-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405001518.1315273-1-jm@ti.com>
References: <20250405001518.1315273-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_011536_444359_02E95AE0 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Hari Nagalla <hnagalla@ti.com>

AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
main domain timers as tick timers in these firmwares. Hence keep them
as reserved in the Linux device tree.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index f8ec40523254b..68bd6b806f8f0 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -796,6 +796,23 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+/* main_timers 8-11 are used by TI MCU FW */
+&main_timer8 {
+	status = "reserved";
+};
+
+&main_timer9 {
+	status = "reserved";
+};
+
+&main_timer10 {
+	status = "reserved";
+};
+
+&main_timer11 {
+	status = "reserved";
+};
+
 &serdes_ln_ctrl {
 	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 33e421ec18abb..07fbdf2400d23 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -710,6 +710,23 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+/* main_timers 8-11 are used by TI MCU FW */
+&main_timer8 {
+	status = "reserved";
+};
+
+&main_timer9 {
+	status = "reserved";
+};
+
+&main_timer10 {
+	status = "reserved";
+};
+
+&main_timer11 {
+	status = "reserved";
+};
+
 &ecap0 {
 	status = "okay";
 	/* PWM is available on Pin 1 of header J3 */
-- 
2.49.0


