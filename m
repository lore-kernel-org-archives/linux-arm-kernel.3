Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5399C56202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; b=Anp8mWVG428fZRdIrSBNe03Kxa
	c09nkahEwWSRA7HYfFBjGPnkYkZYfk6V4F/lSzJa3rZM1aYZ48gEmQy1aC0YMyMEi45Y4lTWzVi5F
	AhGchVjgCtVIexKT19Z2RyXWk6YX0HxGSHhuR5haNfFxXTkrj/jp4YUzH1WXAEweLQDvJ27HEnVQi
	ZTKvPzb9umcMzeiSKDDxJ/WWlZS28DnIGJRlinPSLTCL+D9GK9o6p53e49vpDA6HBh5YxaQW8eQ29
	LcuSXuCGrWzhhmmhfqLvBF91miTeer+Ew8TdUQly0f/YyoiZ+iNL8MSmPP1UE04rVdOPNvfJ33bSS
	TZEfvIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX4-0000000Eoh9-068K;
	Fri, 20 Feb 2026 14:31:02 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRWz-0000000EoeB-1r8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:01 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597845;
 b=OTUo4PwA2u5PB47xpM48CxInv06ahBrzQGjM7LaPmmjgwtvDa0SSfrh4UH5xLYKuAQWilumv
 w+L63+CwNGlY/YME8Ku9CADV3jioOWncqT+4CFTgF0WphfcjldE8SNVDnUUNgBlB0xT5jluWL2i
 JHU5MJlY/CQlxUeJPiDdBOXAAAKP0nVf6oW+Xx+IYVy2B5McbMuT72JeVBZIK6szNHmoaVSs/Hh
 v/eevh7E8ldHMfFybaTkIyl7hQhpszVQQ7tGvh82kZo6/l92c7pqgEAuOe/n+NDipe6dGfr96Eh
 mRcykY5MIt8Lx33nL2V9uODJu5BT6EBz0PGUANuYD3ZSg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597845;
 b=GWC8x0V1cvpZGCllOlzQU1wYDSJGG7DbFALZhVCbk7Inoq0y93wAtnvg8Xav1hSRfd7xijtt
 CVvyJC5mZBW1tmjvQurYoK+kMDq7bNRWJijjug9smHteSS6TT/Tj5xBXt5v+RDRskZUhzpwq+qF
 brhx7Ao/fPHUxBjZ3Uf1Tn+T9t7IjpEuTog1DH+VOIwdcRuHRWmkqnlNSTtE6C4Fk/RwQuwb7py
 f1GpA21HQuWfSNN4A6K2eJwnfakIJnAxrRI15uorowkKk2It7OQ2YpugMYdf5+Nim4OMUz7SDdh
 J92VHrWpT0g8AKzWCum/swotLGOkVeX5WMiYuaK0OjRvg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:30:45 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 93006A40A81;
	Fri, 20 Feb 2026 15:30:28 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] ARM: dts: imx6qdl-tqma6: add missing labels
Date: Fri, 20 Feb 2026 15:30:02 +0100
Message-ID: <20260220143008.186851-2-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fHXj124D7z2nHWY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 484e01de3cf01adfbe0654439734e80c
X-cloud-security: scantime:2.102
DKIM-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597844; v=1;
 b=KSnX9P19C798iREvtS5L+PE/CLDSgmgsWLTMx0Ga+y33yj5NYkBnfrzEbM35cyEylyqNu+ZQ
 rDpmFuuo94aqMpXcMGGcAKVycKK9ie6fyfppqxN9s41+wmdPUWAyqmI52jIh5qmbuOCKC7laOtt
 rjJOYcG8h/44EzUlX050yg/u1RXLx58TvEDwNISr33wvl2TaN7zN1/gto7LivyHXSwUifVNgbrL
 aF/Lit7WzqziSjiEZ5pg2kOYgQgOmLT7e65d8Fb3TmUZDx9JK/+uyqu0Pe1HYRVW/rd0yW4oLiq
 PQQwopDaiVkUiriL7ypPZ24mclredNf2eh8sOBtp1KhmQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063057_755455_B1B3F072 
X-CRM114-Status: GOOD (  12.68  )
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

Add the missing labels for the temperature sensor and the EEPROM.
In SoM variants A and B, the components are connected to different
I2C buses. These labels are needed to reference them in subsequent
device trees.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index e8fd37dd8835..1251749a8dd0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -27,13 +27,13 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	temperature-sensor@48 {
+	lm75_48: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&sw4_reg>;
 	};
 
-	eeprom@50 {
+	m24c64_50: eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 0e404c1f62f2..7f526f39e0f2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -20,13 +20,13 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	temperature-sensor@48 {
+	lm75_48: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&sw4_reg>;
 	};
 
-	eeprom@50 {
+	m24c64_50: eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-- 
2.43.0


