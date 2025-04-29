Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5036C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=letqg7Oeb4l1lilcJno2auTh50NkR5TVzJeAGqq4C58=; b=nT2pJLwnsZnCrOrcBZAbX0NbYY
	cBTkQ6zJhI8HZrc8iudH72s2LopbQB6WOVdpemyJ/DEEALYfq5uyfULfQZxBTullfd8mVNDtk59MV
	NalSGnwBbxN6aRvw5NK0qbywUzUqISI02OIwmzMlAaSgFJ7uNi0zc4zMS0J3mRHY/6yaFrPj5IFXg
	Eqt5U+vVEAdgJQJGt3wAVZL5QCwW8DVDmPQla85Ry3iDCVTxh0dlyuaaiN+uRRSRqHnDF9NoWfEcf
	45ZPl4PdtADTnCqAQU7lK5miv82aI8UMKiESNB+5LQ2c/GfBDIpxzEj5himJ6KYEy6kudKJ2fUWwX
	b1jkWJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9n2X-0000000A9XH-48uC;
	Tue, 29 Apr 2025 15:38:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mfp-0000000A4hT-1IWH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=letqg7Oeb4l1lilcJno2auTh50NkR5TVzJeAGqq4C58=; b=owPg7cJ7QWi61mOQJEScpq11qO
	4tF0EXvJoc4asBjBkDWPV+ZJmQO5W0biV8EJfOQnO7/Uu5dPYUHr35H953XWY/NL/HmNQf6GCRC6N
	bJu8ZtUhZqByjflsA0kgXwqFzmcg93fRQeA+UoGopJ5YZokTFmFnt6mPzw57JKc1CNUZQ6wzLmk8M
	MI/iOBOGG/j+EIu6yyFoINOhmJfnzPrw13J/UNea8SiaMKqNp4Wh7fVYY4AT1u34n/+L2WKcqp9AX
	OOOQLM1ONUd21VwtaDMUTOQM0VyKeqSIUVnins3XQOVTmX1eb5SWZrQ7eVF6WQiX0YoOsr2h1B/Uv
	DxVpADWA==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9mfm-0000000DQsG-04G4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:15:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtAL3706314
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745939695;
	bh=letqg7Oeb4l1lilcJno2auTh50NkR5TVzJeAGqq4C58=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EfN2GP4AWZE6gtQAMSJIutkGCmNEJ+KHDmviUbfb9MnUqNfF79St1lGJXoR6+t/NX
	 uy3A7Fh2neEVKf72F1gdGZwNUDJiWlKksoMVy1UjFIp+/La3DTS7dO+q53Ct+G8xkh
	 lbft5jK/Np5efApP66+HCTn5YU2UX469kXuuSdtc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtQ6095413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:14:55 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:14:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:14:54 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFEslw129369;
	Tue, 29 Apr 2025 10:14:54 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>
Subject: [PATCH v3 2/3] arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
Date: Tue, 29 Apr 2025 10:14:53 -0500
Message-ID: <20250429151454.4160506-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429151454.4160506-1-jm@ti.com>
References: <20250429151454.4160506-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_161502_402801_2064948B 
X-CRM114-Status: UNSURE (   9.88  )
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

EMMC device is non-removable so add 'non-removable' DT
property to avoid having to redetect the eMMC after
suspend/resume.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 1 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index a5469f2712f0..1c8b4d13fb49 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -832,6 +832,7 @@ &main_spi2 {
 
 &sdhci0 {
 	bootph-all;
+	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&emmc_pins_default>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index c2f55cc5a8eb..ab06cc42b4f2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -480,6 +480,7 @@ &main_i2c2 {
 
 &sdhci0 {
 	status = "okay";
+	non-removable;
 	ti,driver-strength-ohm = <50>;
 	disable-wp;
 	bootph-all;
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 20d1437f253d..7d249fd04561 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -453,6 +453,7 @@ &main_i2c2 {
 &sdhci0 {
 	bootph-all;
 	status = "okay";
+	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
 	disable-wp;
-- 
2.49.0


