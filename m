Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505D2CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=K+nqDKAGO0fMwbQnss9SubfTpA
	sl2kC8YrEmr6darWiswE01xZ95WwqSJKksdMysmFQ/57nCQoK6+yu+6vfhWF/8ljLSrdr2mGXIogz
	/2ewnrrfjGOW+XJZT3mUkwGdc0daW6xMpUopuZI+Yw3V6k0JCd+QXiWVCpitvQhKvFPmLJu9G3qwM
	vUt9XfHEi6Xw5LZEucVTMqLc3Sy34OIwvlZEaS9gU+gTWxrk7V66QshAu2Q/ygtQsYfkRfT3ndeWR
	l50lKQm4WKpoLtMnv8+voUq9vlw2nnLUtqsDFwCCckEsUdmkgM4FOWgvzVuiutBYlZWmRFgS+D4F+
	Y7FWa77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSb-0000000FPVW-43mi;
	Wed, 03 Jun 2026 15:24:49 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSa-0000000FPTh-2XN4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=XHhj8hYIhgqOKr9+GhRONy7Wk3
	n24THfAwfpUohYPq/GFXlLfQ/ql6BgaycS4OV/vYib9QA0tjNYWS0lkjm0+PLtPhHnDCUpO0Eysrm
	a9nOjRy7GL5m3W+XzAi2xcLqR44E5EjEJkk8iaxktpsLzYElj3D/o+BfotooKgi+0S7Jg6f9d/yft
	kv7ST6lNGbyLDl1TB8m1YK1UrJV9CsWcEIHUBGjG5+OQquGeIYLGnLuKCkSKJrvNiEiu2rmJgoKub
	GaDvQyACgONaktz+pG4d2Nyax1mwLInyxAjKDV4oUL5UDJhwLDK3l+ljHEpna49wLOrE0eXS4jYi8
	GIzNODgQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnSW-0000000CYy9-2iV3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:24:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso11687055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780500283; x=1781105083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=a0lbDRty40lT7GxPgTT7D/D83q/J3hRewq56U14mZbJ2juCoBQ9mEpObj8Ivk7TPF6
         2QVYsTcjQhdRym5ykZzxzfrGFuOvKu9gWbXqQDK8nIxORPxg1hQnVVYQVvV3hTio1fqd
         TymK5WrU7Nl0fR9ka0DE0PeVZ5Ozu6bu9Xb9rt94nD4Vv5r3X16+Ki4SAQCH+RFlhlWr
         ZEMBEEJ7iQ1Ch0UXe/e1ty3vKyaujtPA0FuZzEbBoBuMIKBaZDQ78zHs+Y5UKOt376G4
         /58EoR1VQ65JEdyAFFJhT8L90sLnPhj/invg6pxYw0iWPgKo8e+dNMBTjZhPj2lvPoVF
         oU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500283; x=1781105083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=K1q5rWRTOuE7mHZ6WMOpteaiJEZ64+o/rJXX5W80Xrxsk7XOxtrvDmcZWGu2an5+pP
         9AI0279HfgptEJmZyi/UBQCiWdY5D/VHOZkusD7HoG47iVtA5xueBt0UZSPGebIQV9Nn
         YsBaxPdJk9Xzzz+0E/IT+VWz/CfOxks9VzA8IzVCfbmurMHv3h/KoN40kepOCpxsXl1H
         ocslQw067IE+KHJA00Pds2B2j0Z792+aXmb+6eSLeMjyiWNRByneav7/DSm8UGngvdPf
         Cp2945rucNyun7BW4UTh4Hh2+dHqWva2/WQk5jHkn5cHBpW0LzyWOzMdhTMya2u0pmgz
         j6Jw==
X-Forwarded-Encrypted: i=1; AFNElJ+67ufEK9ArPwCtQg98poyxwQsofTCo+KUcm+BKlKMR8thxqpp/crYjaC4U6CTGQetK3PQ6/BozTrk8bQ1qEKyx@lists.infradead.org
X-Gm-Message-State: AOJu0YyOHhynqPpKeY1FXDe+kYcvykJqlmaM+JYiGOiig2yHTHEofx97
	2MlxEKEawHCKiw2ZgdVsTofhRJAkuEbLP+ICkd/WnuC7O/cpGMhwhvGgF6QOWbAJFrPC9unBgqh
	WOinMN8o=
X-Gm-Gg: Acq92OEZKOuSgKoU755ntq8UwKYYIx50oUdfT4at6ZBcYVE0eGbeq6vmKpoYTkWqUFw
	LC9NK22/f57N0tEGz4jxUbbp9/FzDBYAgvT55m9B4pJ0rG2b8/kbuWpHCrDyPa5heeSHMERa0vv
	EHWu25Rv4tQGFU0BskYZc8G2vWg6DqD1JsbHQS8OFb7pa6iNQ6D4GYNtLaei5GsAi5OrK/HZm6B
	1tPS0tHGgxWkX+7Wd1Rai0BhT8ajqFLkL2qudpbSSYawgZPuHJ5FopvONTv5shn6rPg56diRteq
	IlEQ6yw8YgUKm3cXboQ/6if47JQ/SyGbkqGAe/UR8hCl8ADGzB1fMaI8Mvw9GogvLCM1QMfqSQz
	Tg/BHS7wotNl+FFxj/xEeRGGUToyVtrzHiMALwxvYJ9E4tQv2HGwDJtNRhioNNMd6ntj1zu8TZb
	fuONaRjs03biZ6CTr+uFwYS25g+F4nPVQoUV44T8xylMQ=
X-Received: by 2002:a05:600c:8b01:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490b5d36863mr63918565e9.10.1780500283560;
        Wed, 03 Jun 2026 08:24:43 -0700 (PDT)
Received: from localhost ([82.192.120.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b725fb1bsm63329125e9.8.2026.06.03.08.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:24:43 -0700 (PDT)
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
	mbrugger@suse.com
Subject: [PATCH v4 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Wed,  3 Jun 2026 17:27:46 +0200
Message-ID: <3328baef11e5cf57391c2679d810922807f26a7a.1780498640.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1780498640.git.andrea.porta@suse.com>
References: <cover.1780498640.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_162444_789631_C68ABFC6 
X-CRM114-Status: GOOD (  12.01  )
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


