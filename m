Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414DCC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=CObNft1LMZ/VU2u1HUZ/uYICIo
	kU3i6DeRPFfxsoS/7Okj4exyTYpu4hz9qeEq3J/77FuSrR/O5U13ieHYmXj6/dQeoj6hXC8kldi+K
	S2byseB7toWjbcM9/GcE9bZ8nXxysOogFDeVuOiKvIX/Eqad4mDdNHbsCSJ97UHr70R7YmTgThWq9
	pkKANtFqyw2Zt1QMCmRowPz8qI5pHaaH+wRSOpMRfjJEHkrkyZv9ZOAlwaBMey9DXT7jTtm/7B7z/
	qc6gI2r/7gkdjZm+KB/7sCi+e2J2PaCuVZuSX5BSVCjq1GJnCWHpJt6k3BFWBjwcQyj+Vexo4UK83
	AgHeR60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUf-00000006Lns-0M6e;
	Mon, 20 Jul 2026 09:41:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUS-00000006Lgl-2BTv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:40:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-474560436c3so4867724f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784540447; x=1785145247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=CSJi7HjOWC8pjZgJA27zpqB1KCt0/UAiFXbHqoD7MwoXTInSE7asqnp/UXWu9Eem6Y
         Ec5ruo9DSEYieeUl1/DRLNIckmvpzQtZfMHATwV3zv+3pBpxQ3fXsO+qjUOonwFGz/E+
         KYQktoX++N0VMZnLZpPmfuvUimxFHdQR/GSVaItl8HNuBs5tfbSxfqJ+PKHmR++a2Mrt
         aBxcdqvJGzciijuDeZQZMDaD7HTvkjnhn3OqLcrmFM4ZemLD6vOchVjPq94vvZuB5zgp
         p+aKKwR359Kvtjxq4Yjn2lQSXGPNH9n7drkQSaIzlT6hWVy3c59BDy5trd6t0KFxmsyh
         XA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540447; x=1785145247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=JEfzJASQG0MpWgt+CqN1Xcg9gofpbbREJ1/nQn7wPVtElB8qhKfD6wc+tPF/YOb1Jq
         3vZ9ftWX1Ip3bsl179fgxb5Om14dYy535fRYVIrS+qe/9kXxcU5UGi4Gbphy4WSQNuKd
         +ea+RFU7nseE3ATs+2wE8Lbq3FD/22MjdebWq/0vq8s7X8hFIJHSSkB5jPxRNSpQj67b
         f8gSWXhyhVhLJdVBj0nEfaqjKjCNHwcaniFSmVcCsmDhclv5pydEbmCXSVj/6qRTb0Th
         E7MTE0mpdsRI+Bweuk3YoltklrZ8rroXlMDm0ftyMHO37pAEvX7YugnETG/fvwwLq3xM
         gkjA==
X-Forwarded-Encrypted: i=1; AHgh+RrT45jOWL1b6EtfNydypPzujsPnUaBEsFvjAOSq2K+kjGcjK9ak1UiC5/+1yysHWmedtmThF9fv2H3B3FnWL3pb@lists.infradead.org
X-Gm-Message-State: AOJu0YxbTGXhotK/QZOVzm2kAWkia2h621MHaMeVpN2UP+C+07OpwcUV
	efLdaqZiDLruGeT0CdrEYm68HFBwr1r0VBOPo4M8wJSnpi1pOhfaq4fo+NaiYj7Y7xk=
X-Gm-Gg: AR+sD13glr7j7pvO4iSAcMdcia9gtu2ray2+n5GMnKUhUvqTR+hc9IKZKN094dsvzcL
	gLY5cDN91xkSm64gZ6PRKnHmWti+nSCmOW7WCC+pa6yEJEr/t3xbbpqGHMQITo25n7A1UQmyxxD
	KFw0j1xwfY3Hom96FanZaF5g/MpEAuvUGEf+0WQdA8F6vg27PBlpWw3bDLpv9hC4Wkv3rEOyUXY
	zkAenxo6HHGKOb0cPoaEqII/GmYdYWEqD+YF7iz8+E+vUsOdBQNeGvGKdcvZlrIZPXxnO08GOan
	5MT8exX8vIvrd1Mu0mbKI9Q2ume8Zaayzi7O3i6wje6kZubTBpWBZ8q9f5PpKM4U+MdmGgKhV1u
	hV/GWNRJwjczje4GQsukKOGfaj7AUiTpLjWI/KhaIrBClEnNmNLygoeF/bxPwI71fHRj1AhekuJ
	MPbjL5GZGFMys=
X-Received: by 2002:a5d:64c6:0:b0:47f:7a15:dc4 with SMTP id ffacd0b85a97d-47f7a150fb1mr2150322f8f.23.1784540446582;
        Mon, 20 Jul 2026 02:40:46 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eea8afsm29707819f8f.33.2026.07.20.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:40:46 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v7 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Mon, 20 Jul 2026 11:44:07 +0200
Message-ID: <895152a8a7b541279519392b5e7983a861a7bd13.1784539788.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_024048_605367_609791D4 
X-CRM114-Status: GOOD (  12.24  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..748be8f1ee9e2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
@@ -94,6 +100,12 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_pwm1 {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..df4c2d09c8d34 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
 		clocks = <&rp1_clocks RP1_CLK_SYS>;
 		i2c-scl-rising-time-ns = <65>;
 		i2c-scl-falling-time-ns = <100>;
+		status = "disabled";
+	};
 
+	rp1_pwm1: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
2.35.3


