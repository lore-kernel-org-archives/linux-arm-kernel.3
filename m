Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39615C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6SAnvaM6rsmXSQtxKF9YCZXgUbcimNgfSMUY53dG5A=; b=BMsYnx881DUZyahu33s9oU2Z57
	kJlqwLQImPs5k0EYbhO5SGcz5+opHusAsBYaKxmwHNRvNew9IW41AkBdOZxRAw7hifSdKKKoIFIbU
	wv226EqGErnHz2BuW3N05NUjiWX54/62svUV2ZEXTMlznH6NYmx9ChOR5x0xKlw3iZ06Y4mrbTbDu
	4XVzMeggTpeMtbEn3yE0fXVkmCFYCkchTbtw2rHljxPHt2Q/hL4Pbvl9PkbiBoTVG1ZTAa60Df19s
	yjx367f1LNGlffoK1+ZVZj5n/X0GyhptUlxZwHZ/Q1BiiQ4mOmQgVpGNYguKmH/GQGxRqE7PdZCxm
	wG2CsW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHt-0000000CytF-2KA6;
	Thu, 10 Jul 2025 20:54:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvOD-0000000Cd4Y-2ZvE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 17:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C6SAnvaM6rsmXSQtxKF9YCZXgUbcimNgfSMUY53dG5A=; b=c3Em+UEHtxC1ZBthI4mhnY6Zjn
	M6EwEwOt3s/Z+iL5LAhmd3FPm9yZO+Lpaab6Wvgn2jACpljxjYpsZovS0fqEtjUFHN78kseIWH3ZY
	KcE64Jh8GFSLceNscoS4cLRZAtKf3IadOZmru1gr2B/hi2WgSeG0aUOqNzbRfmKgtVRIOPpI5vlLC
	4hWaZ9wk65qCkQmJYH+h+eZyBqimvNLvUdEuJ1mDwJGUahHz6KjMVfJJRTGuPQEacJW95DBqDIJEq
	qgREYziezYGOuuxwKQjlwBFoeD930Twmffo9Q4zO8zelEa8mrmGGVhx2XARqSUEiBjWLIDP/xBdbL
	lv2icIuw==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvOA-000000096Eu-2Owh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:48:56 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C935E111D;
	Thu, 10 Jul 2025 19:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169703;
	bh=zr5GZ/MN6PTpBSf9TbzEXkMF8gxaA33xyL3h2Cyqb7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A4c8LDzl1lUAJyYDVN6rsGxjO6xwLWhf9qc3p8RCQBDMhiijeG6yFpN+uiHEAXHOo
	 Mn+8lWbw1T/BmTBnMp1CRkclhaBdVcXONwwEHLcdJr91cruzLhw4RZzlnFrCkZW89X
	 GAzSSE6AoJA8R5HfmTPwuSP4ZBgfPYPcwp/M/FKo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 08/72] ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:04 +0300
Message-ID: <20250710174808.5361-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_184854_817352_41ED99FA 
X-CRM114-Status: UNSURE (   9.98  )
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

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..06eaf351fa3a 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -638,10 +638,13 @@ image-sensor@10 {
 		svdda-supply = <&cam_io_reg>;
 		svddio-supply = <&ldo19_reg>;
 		afvdd-supply = <&ldo19_reg>;
-		clock-frequency = <24000000>;
+
 		/* CAM_B_CLKOUT */
 		clocks = <&camera 1>;
 		clock-names = "extclk";
+		assigned-clocks = <&camera 1>;
+		assigned-clock-rates = <24000000>;
+
 		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
-- 
Regards,

Laurent Pinchart


