Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22439C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20Yw1oK3y3ksu38jNw5LwKcm1H8AlDyDGvzedy2bX0w=; b=vtGYacniz4OLxLtb4auLDwIh+2
	Cc5/qLzv6bxCPHSASCy/uWaCt9z7RCDF/8QGxkdYddUoQpXTjnALkwP7V04sbWDRP+j5cMfLzJTMQ
	IfdUGQ2iBCdOBDk7yAcdSeJP0rBPOwGfQAM2ko5f/vEiEsBbRZE54ZF/a4DowbJnJXHqqcGCj1gx3
	qVFQwcPNIqaKLK724EmlfJs5gH1+h9nQrGgZn+YgaGTd/iQxAWiIz/pVcnb+I75K6Kbt+GfyL6rg3
	WSFQnIjBPD9Kivzq+VmngYnUt7gCe0ZzCCK8a09qA+lunl/G9f5p4b3oEk4AUd/dCX2iVBQBxs79G
	iCKpvRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ijD-000000037A5-2oW8;
	Mon, 21 Sep 2026 18:26:59 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ij0-0000000374j-0BZs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:26:51 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so24784355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015204; x=1790620004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20Yw1oK3y3ksu38jNw5LwKcm1H8AlDyDGvzedy2bX0w=;
        b=gk8W1EDMaUx21cssKS/5WaE7ctTRK/IGJV4VHCxQS4LqkOG7cPx6hjVkmAV7znNQkn
         SY/tlylg3nonEAfRd6q7rUFa8bZKFXaBPdH3GLfUzuVCuWvRfZRI+nrM+gpvcO5tl7wa
         lKLcsNnjerWgCEZSsaEcVd9/Oc3vBO+cq8njN0Th6L+Ps0hXwRe3kjierEbEWjRd0mkG
         CLvpcyXmzZ28M5m035jk0ucx3sdzFU4JDoKbyNqCYYOA3BNY/MOouxI0UbcLyc93fnJA
         2hEe9nSNW1GM3duPz+AzXyndpJ+tUxNzKGJvbbxPs/+22Js4spkK4pxPKwbjKQgox/Y4
         08pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015204; x=1790620004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=20Yw1oK3y3ksu38jNw5LwKcm1H8AlDyDGvzedy2bX0w=;
        b=KFbCvFSoC4XvVwNlb+oiCIhcKMoy5gJBpfhRQCqOsNi4mW+WCZsaLUYD2GNWkoplCA
         Zo5rKefPpX0JbJDCLVnmllwqPEE8ccQwy6kDoOOTWHGdJP1r3H4VH1o2UQglbsPFaX83
         AxroI9v980ZtezwF5RP8z2dYF74SorMaM7iMXnCDF5plOf4rwBTSHD8mUp693ysyl6gj
         3RkaF2BDGeHqsksViQ/uobnRvPuZ+RQg3n2gWKG0zaJp+yjrbbkLZRhuhALiyLnzES99
         DmPYe8AHw27eaM5tIVdGC67XGL3Xk9lajiuNMR9rA/RD3BmiLILZvgcXtpX4jWsk1eRf
         Sm7Q==
X-Gm-Message-State: AFuF++lqmXjWYzn2e1/yWNV/CX+XXOvMVdcTypNzV/PO/VIjTXiwnLxY
	cUJgdTKuMkhL4jRwT7EifFUJUDNH9OMQf78LrFLfp1arC/n3ivodnxA8ozSmaASpQYl/o+vVjJX
	MqsxCGOk=
X-Gm-Gg: AYBFou1ZGtQ2ShAhgYW31BYMzpCzTn9DNV2CZNLhvKTYhWXvYhQWGWtf5vNntYBBF9t
	pA0/LU+2tQVd0ZGbCOon47/XDduyh7cMkhm2mm1Asw1cOqBDpzWBPlxMzRYXUe+pmZProDdngrM
	oPJ8NTDnJqyOVm5ZiDXEn0Vsb0vrXfKXT6sTuRZkcuCKSreXlvfTFKWQof0iLHNattVt87TysfR
	cFhi4MlAZSpSjI1ofMb46iWad9+8AS6f920yr03QKersmRSSUIej9MIj8Q+wp2kCd60ECq7xyhQ
	Mki+NvcqqMHvTbvddkPs3hbPZRsbE3OV9kQn8GVz0QDSk+9vy1+2qD4f5JEjVv+zOgAGICxVU04
	B8AbfXzC2EJe0Bfy8CoO2IJqzkxxuNvLmUUlSte6yyDCWiaINQ9qTikB87cMwx9QzfWV9b5KJda
	bK4HqNtMPDrRgz5Xykx6od3X6fSeUH1T1CXviZj9b5KuguGVg6W/Np/bXBQNzEiaNxuU5BV0U+r
	ZOimZFeDAgEYn/US9Q9TH/1Op67EcyB7Tc+
X-Received: by 2002:a05:600c:3ba0:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fc55adc12mr204998805e9.0.1790015204081;
        Mon, 21 Sep 2026 11:26:44 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:43 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Mon, 21 Sep 2026 20:26:17 +0200
Message-ID: <20260921182620.17597-4-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112646_141664_134E0E23 
X-CRM114-Status: GOOD (  11.00  )
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

Add device nodes for the peripherals that have upstream drivers:
- PWM controller
- Watchdog controller
- eMMC controller

Also add a label to the gpio-leds node so board DTS files can override it.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..17185238e7ba 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -291,13 +291,48 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@630 {
+			compatible = "sunplus,sp7021-wdt";
+			reg = <0x630 0x08>, <0x274 0x04>;
+			clocks = <&clkc CLK_STC0>;
+			resets = <&rstc RST_STC0>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@3b00 {
+			compatible = "sunplus,sp7021-mmc";
+			reg = <0x3b00 0x180>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_CARD_CTL0>;
+			resets = <&rstc RST_CARD_CTL0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&emmc_pins>;
+			bus-width = <8>;
+			max-frequency = <52000000>;
+			non-removable;
+			disable-wp;
+			cap-mmc-highspeed;
+			mmc-ddr-3_3v;
+			no-sdio;
+			no-sd;
+			status = "disabled";
+		};
 	};
 
-	leds {
+	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&leds_pins>;
-		system-led {
+		led-0 {
 			label = "system-led";
 			gpios = <&pctl 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.53.0


