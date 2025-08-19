Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB49CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xi518gsMPwf+xO6KMftj9HzM9h9TUyQOOtDZl1JTxQw=; b=KXYy5mq4dnNyRsSWCp2oTZN3HJ
	Hf9aimS6GqPu9RJVv5bafhOU8ZuT2RuizokGNZZFSFfHoLETQQ2LT3ErzK3LD3Hv5ZFjt7WSzfsGz
	1vdDaxVNcYXRnZeOv002Jo4j7h7dPJnC2JFQrbC7A01wMmTbYQUcH/drH48vwq7Gae0ktSaBMXfPR
	wG3JboABkTz8JdmH9wAiXQ7FcYmFEhFMPhROtAICGk5Wrizc4O71/Dum+X1osKpWc+IKGqGfMgENx
	I0X+3EyjDfVTAlePIFAn/T0Z20ss6jvKdvmNXJF1IA+jaVLtKSvmS++odirPgk6egF/t1aK8x2e08
	2iofIPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpa-0000000BC2l-1Q4J;
	Tue, 19 Aug 2025 18:13:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMCF-0000000AYzA-3OAY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:16:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb731ca55so71891066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609374; x=1756214174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi518gsMPwf+xO6KMftj9HzM9h9TUyQOOtDZl1JTxQw=;
        b=VwZhVT+x2kcBuzqZrSUfZ08fz1pT1WPi96TqWwY2XC7+HPzqdTJGtbYWx72LJYBfse
         cJhPyFFoxD+NoZH9COwhFyPBo/TtN95aMptPZqqhKBaJx+fxBo9AeYCwVNZDE6rDIzp7
         8pyGaUq57ThA81F8J2EIthv3KQoXUYVCij6n9svew2GGxB2pyJpNWOEOBBnAFzl3VXVe
         3ZJEtJ1zPYI/Vyl3ci4q8/hhsmWn6UieCDlniIMkGECy06pJXyA+i2wi25egucHqJVVN
         D/km7+hu7gDoCHlb/kexCPL9qkHrMrXaj50iTyBSrLp8JRE1QWzrncrWSBhRzmpaanx2
         +8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609374; x=1756214174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xi518gsMPwf+xO6KMftj9HzM9h9TUyQOOtDZl1JTxQw=;
        b=GGYFbzstoNl9duzOnUVZtzgYYlU+RsSmFMN8QCapmIzjCBiwNGVzoU1sWcs6wY/jVF
         VyOn6IQYZ3avsaoeEoPpEIwL8sZuQfzNHAgPRjQa/77wj7LXaI9ddQAaEb+9RzbJyYxp
         wtI9JtYka4OMQrX50D5dbCDilDRZzvgsgPG9FMjiyzxfLE+mbipKmMjQ2RXg6+55muLW
         nxohX58IOS9XryQF99C4y6W1di50WOxCzc4X9kAXrzzPA9oonkoo1YSGZZxAlE4TbHc9
         He55RBw0gMdGw0KyZBegj4Q7BDY+gRGjw3dJZW17lFtg3vxCuCMHJsy/MC1OxjhqIC7d
         C7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUTPVGfdTQO2fCmFUUtPeEWrDEM1IQMTPaU0PEUf+u4ibzeW0VPYxcAaDNh+kmztKu2HXec/xba9r1KBWiypKxk@lists.infradead.org
X-Gm-Message-State: AOJu0YyOtFDmpLGSMPaWRhFdiFlP9b9XLZzVIyVNGybft8kx1k00mN1N
	LXEne4vYubgaqbQou0x+m1HQ+upx9kwMARO80dXP29LXvGJCtGJlBYWegweAYtJwR9I=
X-Gm-Gg: ASbGncvoWQk+/fRNrlgXqxgqWfq2A8cw3x6pQ0BD98jIbiOB5x6CNSnZa6stZkuYorR
	Emp4HoCkGmhm2Ips8hh3yy6yFE78G1A1j/L09CY1NyTjlV6D0xXB0TBqJ5RP3W9kJSL4/JEUJHt
	mJ42MjV/FZhohR+QD2zydKFJEhzbTor0L8UpUTj28MgDdm1QLMT6vPwvcDGPBsbso+WWX2y2cWx
	m3eM8CO8agEhvqKi50jyYHQ5phkf12zyb0Ejo1IgjI6roMT0sugMyGS0hMJUS/+/XsMIrcV6cdE
	Ejed3lg3xYzMQfhar892H4YxzoFJ0sdUi6N6A8CIuL46W9BsSP9K7CmM6A354RtU/CBapq1c3p6
	Lpb+rXTRCL/8xZCFdbBdL8NkKI4ZFsvIexIb0V/V1unO1
X-Google-Smtp-Source: AGHT+IHNAQts7Tkq0in4K3BOL40AEJDywoXmLp4e38sGlmKMwBIojenupdYVLaUyK7UVgv2eYoj8jg==
X-Received: by 2002:a17:906:c112:b0:af9:5903:3696 with SMTP id a640c23a62f3a-afddcb4df7cmr81510466b.2.1755609374036;
        Tue, 19 Aug 2025 06:16:14 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53d60sm998744666b.20.2025.08.19.06.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: rockchip: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:08 +0200
Message-ID: <20250819131607.86338-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zzJHbwP59FIAJRbh/laHlAqr7S4UlzgO8wkJUgyct7M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHkX1WKSqJhvQcELKxO426h67ZTlpdrZBKf1M
 5oH0eMggemJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5FwAKCRDBN2bmhouD
 1/bFD/4pTRoaumxN4qomkIs6yFeXrcTZBRmPV7OywqqKgE0NJ3WJviWn/dX3kiNForLEobrQSMA
 7i1yOWVOmKASx/uWgJIMy/Dfo6UbTYSCDfOlIHpIdW6TF7TyEIGbQRF88NP0ZHx6P3EqGh056/V
 x4m3PTjiseJ1hWbmgE4fdcHlFyrRxo6QTnnOzhx82sdoQhpeRCM+zYe0iK7pkpo+Rn/+V2m8Y1V
 bjV3p+u4+VT+lVfJhQZFpMvlZuyBD5ealdsJoFj9JE3/iB3DG+4eDqpywmkPWecdtsQcxC27K+O
 x9T/J//KGtMnTguaOKQtB+rMAVPiq5H2lOGizXIhbikXopn+Woo5x+qW0Y59Q4PdzZW/IG5mDX9
 Ej4CCCPSSbEsM0W6ch4fTN6ofGGWIkx3bw3SMI0WBEEHehrtPFRMCdR/o07DivyguWeJKcmkIws
 0NJcIH3Jn1JxBpHArx5tyAJ+nvB6c8Za5BX+IWOf1o/MQ7PzWgKRbtVUHouBAjwxfBABnNOvQxG
 BeRbFi5dJSpKuph/cnHwj/9MxK9y+H4uK4/waTuAH8NkDRlZ37Zd/tA3sQlEcw7cKhMMDxgGwyV
 f+VYKL+GDd5XIH2ft52QowEGKHBOhV/v+aBL+a0wWbuxlkoYAGyMcGi7E1lhu71rAHGAswuBucU BNVRX5amtmp0mqA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061615_845382_DB59F96B 
X-CRM114-Status: GOOD (  12.17  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts    | 2 +-
 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
index 21f824b09191..decbf2726ec4 100644
--- a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
+++ b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
@@ -272,7 +272,7 @@ &gmac {
 	phy-mode = "rmii";
 	phy-handle = <&phy0>;
 	assigned-clocks = <&cru SCLK_MAC_SRC>;
-	assigned-clock-rates= <50000000>;
+	assigned-clock-rates = <50000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&rmii_pins>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts b/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
index c13829d32c32..8a92700349b4 100644
--- a/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
+++ b/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
@@ -250,9 +250,9 @@ rtc0: rtc@52 {
 &i2s0 {
 	/delete-property/ pinctrl-0;
 	rockchip,trcm-sync-rx-only;
-	pinctrl-0 =  <&i2s0m0_sclk_rx>,
-		     <&i2s0m0_lrck_rx>,
-		     <&i2s0m0_sdi0>;
+	pinctrl-0 = <&i2s0m0_sclk_rx>,
+		    <&i2s0m0_lrck_rx>,
+		    <&i2s0m0_sdi0>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.48.1


