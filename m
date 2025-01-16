Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96933C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UZ/rmGzncsFVOVpELvTtqMQDv8MILpBfFA/LpGTbzeo=; b=tAN7Nghe3ePBJ3EXxQWOTdF77w
	9zn0AjmmqTcjNsFx9/pQq4P8bk4ooYkLrcQaPPYukdD5s8uimoeGbNOgDRFytaZbrKrZEZyGNcQhY
	OUAfIUfvNas4NmJxAIx0T1PktOJFPQmapLIZREu33KM/2GQI5DUAzyOmw+NmSwXxHQDg+ehtuVYXX
	2PrE/4KZDVs5TIjIHRSJXvfEqfNArVMa240AY0UsgV7SsglAKVXsqLg3SLb7GfqSnbTJZyKjSetL+
	/DUWyFip5PXiWgVgeihoABSt42/TdEoMo8uXztIrv7ZI4xdyjT/z6/HFpEk8VtFbudJE8Lzwbol8z
	JmjFpKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLkW-0000000EIRj-2swN;
	Thu, 16 Jan 2025 09:01:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLjF-0000000EI8y-1K77
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 08:59:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso970205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 00:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737017991; x=1737622791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ/rmGzncsFVOVpELvTtqMQDv8MILpBfFA/LpGTbzeo=;
        b=MR4kVX75iUpNVUX6VzSPz4LXPhQbkkuSzvUei6Ql4O1bwfqnnuvSQOjHACqDkBzHjH
         226ATPsosMkSj/kI13IT/ZZJrQxKtq7gEqVMbhJqOk2LxluCxJ0q0Je7c0alfpwjvqDT
         4b5KrsWPxDIotdzHwYEL5b0E68dLpD9PhStdxd2VjWQ2i2ZfRNc1x7bwWxatFbfd8I93
         5vvNbbqWIpK7Kxdki616FhYsHUZL7XO7tRGU+WESP+gS2b1hjy59Nzg0smzasi/CoxNE
         xREayx9ttqsBSdPS5DwgB83QvzfWLsgZuoUoMi39SuPQc5rF2sy/QAldctkdUAuNyUXM
         PZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737017991; x=1737622791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ/rmGzncsFVOVpELvTtqMQDv8MILpBfFA/LpGTbzeo=;
        b=YnyyaQ3R1z33SerlZRcmZqG/Ru2qI9iEBI8eN/A99597lR5WWIcjO0N5rAaQnfvqiM
         e2ZRB0CiFsmw1XA4ysmNWFVBn67FWksnbkWC6Wc3z6EgtnTZw8iWqHed3fRotdyAnUoD
         rI3CuUHMOT/kysWTi9mKH3nA/cDYGJNSG4sEq73gvv/8E/FN2GQxkNdjWeNta89GsuXb
         XAyN85o6Q9m+Xz6S53N+hYiFgGgK1QWJtBF0cg2o43gF3LkaQ4wLShvmK24GjNMLv8ID
         doFq4Ih34liD7dkbYif/DOsen9igrAz13qw1bbQdTFj2VbaRGHAIzj6Ufn2KgaqGx1dN
         DKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+QZB8723gWXTx9EQ4o844H50YaiUbD69hmpDSU2GoW0Xz6RiEiE5yPw0sM02cT1UC7KeE+65AL0NJTS0uhnJ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwU5vhiqIpcArEpETgcLWyvLlUUyWlDQroNtJdqAcTNvn8HbvbR
	ioxyH6EfgajBPjmv/5pHksjPjtYOJ+v0cRlxLuLSi/QELabfWFhZi4BFQRNSHAc=
X-Gm-Gg: ASbGnct3zULZ62nqpztzGskLI9kwMVQ6Kt1FohixLOs+kAnD/+jbbOOy66acQVLabS8
	u6Jp/bhV/rnbtr59kGot5UG5aQzsDnTgmg9uCwd/IucImJvCWPnKIj8zGR2pzwXqCNmB9Bt3DxW
	jebM4KGJRLv8fVvIGjmyU7kds3mz6gUBkE5+yy4dP5mfl3oRtRR+pUgOkz+48/T2mHTB80GcMLB
	iN29sEJKY9lz1X3SmfD496el1NkIRW2yMAX8u26ITkyeJdOT0uvUt5uG30hIppjRthxgXc=
X-Google-Smtp-Source: AGHT+IFvKV9ktUcjUU8r4rO66150f+sIDyBQzz/zVuwn9bnjqAFlGMUF/fApYPt/cqqbettN3ylbwA==
X-Received: by 2002:a05:600c:1c1a:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-436e26867ebmr123456115e9.1.1737017991550;
        Thu, 16 Jan 2025 00:59:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm51144085e9.33.2025.01.16.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:59:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: marvell: armada: Align GPIO hog name with bindings
Date: Thu, 16 Jan 2025 09:59:47 +0100
Message-ID: <20250116085947.87241-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_005953_358044_427B617E 
X-CRM114-Status: GOOD (  12.15  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warnings like:

  armada-385-clearfog-gtr-s4.dtb: wifi-disable: $nodename:0: 'wifi-disable' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 8 ++++----
 arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index 8208c6a9627a..7aa71a9aa1bb 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -453,7 +453,7 @@ &gpio0 {
 	pinctrl-0 = <&cf_gtr_fan_pwm &cf_gtr_wifi_disable_pins>;
 	pinctrl-names = "default";
 
-	wifi-disable {
+	wifi-disable-hog {
 		gpio-hog;
 		gpios = <30 GPIO_ACTIVE_LOW>, <31 GPIO_ACTIVE_LOW>;
 		output-low;
@@ -465,7 +465,7 @@ &gpio1 {
 	pinctrl-0 = <&cf_gtr_isolation_pins &cf_gtr_poe_reset_pins &cf_gtr_lte_disable_pins>;
 	pinctrl-names = "default";
 
-	lte-disable {
+	lte-disable-hog {
 		gpio-hog;
 		gpios = <2 GPIO_ACTIVE_LOW>;
 		output-low;
@@ -476,14 +476,14 @@ lte-disable {
 	 * This signal, when asserted, isolates Armada 38x sample at reset pins
 	 * from control of external devices. Should be de-asserted after reset.
 	 */
-	sar-isolation {
+	sar-isolation-hog {
 		gpio-hog;
 		gpios = <15 GPIO_ACTIVE_LOW>;
 		output-low;
 		line-name = "sar-isolation";
 	};
 
-	poe-reset {
+	poe-reset-hog {
 		gpio-hog;
 		gpios = <16 GPIO_ACTIVE_LOW>;
 		output-low;
diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts b/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
index f7daa3bc707e..cf32ba9b4e8e 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
@@ -34,7 +34,7 @@ &eth1 {
 };
 
 &gpio0 {
-	phy1_reset {
+	phy1-reset-hog {
 		gpio-hog;
 		gpios = <19 GPIO_ACTIVE_LOW>;
 		output-low;
-- 
2.43.0


