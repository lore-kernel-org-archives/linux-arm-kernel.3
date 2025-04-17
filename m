Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 23:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do5gyYIYR+XxRDrHM0vtw2Vw4BTYQBOwQE1WrrVFmw8=; b=kxGNnLQVyKBEC4/T9xFhAAfTuA
	MHeGn3YrR3gmuQ9u8mtrJhwq06fSOybkbsQ9K00Oouw5hM0In6GSaPWH6JkxrYjMB+6ZsgZMkhtYQ
	/LO6GlY17SxpKnp7PIstlrZpD0sfrK+NtDoxdwZ1WX3NBjgh4wwAlXZp8LI4crcoARBZlSQaoH9rf
	vDF6nslTAayti51wos/FvAEMqosiWrJ3ErpHpgvTSyd7VoCgoqwGWVvjEKaq6gRJFXUS0EUHccfBU
	yIUOgmoCUHui1vjrjIT37U7Dpy962PpbELAcunpM0X2/ICpNRoWLe92ojE73ozUDHJ7wmjmY9+xwF
	mFBoXaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YoG-0000000EbzW-34na;
	Thu, 17 Apr 2025 23:38:20 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ygw-0000000EaYn-17I5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 23:30:47 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUePH149455
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744932641;
	bh=Do5gyYIYR+XxRDrHM0vtw2Vw4BTYQBOwQE1WrrVFmw8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EcedokKty3i0FgcfhI7dzzE4UoQ3KxMcUm1FT8kEvTXhBFqsUSglerCKepwLhR5yl
	 qQKOrUOjrsWxFmMZMgiia1+GMuTyKZGGTMOGR6k15zg8O7oC44WwPqnMEbLoqlvJFD
	 1hbPFnzfYGnsgL/LAS5jwoDh5efIHAID32gD6zlQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUeRe096098
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 18:30:40 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 18:30:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 18:30:40 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HNUePi023286;
	Thu, 17 Apr 2025 18:30:40 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
Date: Thu, 17 Apr 2025 18:30:39 -0500
Message-ID: <20250417233040.3658761-5-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417233040.3658761-1-jm@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_163046_391564_CA000D1F 
X-CRM114-Status: UNSURE (   9.36  )
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
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 1 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index a5469f2712f09..1c8b4d13fb491 100644
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
index d29f524600af0..43fcb57b34ebf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -454,6 +454,7 @@ &main_i2c2 {
 
 &sdhci0 {
 	status = "okay";
+	non-removable;
 	ti,driver-strength-ohm = <50>;
 	disable-wp;
 	bootph-all;
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index d52cb2a5a589a..561916c6e151c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -434,6 +434,7 @@ &main_i2c2 {
 &sdhci0 {
 	bootph-all;
 	status = "okay";
+	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
 	disable-wp;
-- 
2.49.0


