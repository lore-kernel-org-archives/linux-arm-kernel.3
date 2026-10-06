Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94EFCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=; b=Of16ZDZv6V0RtMJKHyPH+fbcOi
	vziZTXp35wW4i5/AcFK9MrDJ2X/yDoCgZ1JNkEi7IDmwD11r2Kf4hcvbz6Qi5VJt62dS5IB7W+0Sr
	fO2oClpmNMfdKE0+FLmyw8rvzRbUhvV7yALcQUImE/OJKPWQxDDLUBwyJ5TxjDmJzz0lVDh7MXn1O
	lDUTUnpMmk6EVWPOFR9+Y9L5mDBBT53St6rxrh5qbvFJoEJtZIOmlCK1y1DKKYS25aiTYq39yIGAK
	VVcAXqPxvsJHf6FavxANoHfuIBIHyrdFVw7BibZlMIfZxsIp2DhOf9808fAkQHJwos9T9ZDWJ9TFf
	rkDvYg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBja-00000001MSe-0zUe;
	Tue, 06 Oct 2026 20:25:58 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjS-00000001MNk-3bT5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:52 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6cf995766a3so824957eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 13:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318350; x=1791923150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=jTvu4fa8X5hSTr1CqEAyDwWuBQqbBaOeVK3bUlXQrkwfwtXhchx+BGL0v13WPK6jX2
         4Z92FEZM/iURFvorSl/B2KyXtBJ+4yvrwReb/2JCBpM0Hhh0ozThsEDKmkLhJCDXjMso
         VBqGNkB6QkanSIhAgdazyfA9w3zYWkyvcbSLjnqzq3en5SGQ6fdQnSPiNzuDOx4VgPCm
         zX0Bri4a9yR66pXLkb19IL1AQzkPEnxEGwBGkQ8Ufvr+rpMm2iVRqx/dWWKkpSV27iSQ
         JVyatLjAHc/6/T1kPImdBs8vVFyoTYRPLXrfOuC1JyBtn7q10KpV0OTP8qs/cgrIzEmD
         5QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318350; x=1791923150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=Ug1ir4L2OiFefIDdaHLbGXoEoeo4QxKv0qt1mcJdywDYtpU/o6z4YyahFxK27lqmYO
         vwAFIGEsRLB6KnbTnOG8OQOb0gjThWZmAAl6UB3815P+X8TY1yljSwIBrK/GRip0ls8f
         e9YIOPbqftbdeG55QgywFR6XtCaxTSHgyGeI/WBFM/0pgnQ5pSkFyXzPBfj9O6PQNXLG
         QZiAGr1/btK/DZTiKLshmsY10F834tgsdOnp5jchGQBzDb/xehhWGVrk7SqYI/ffk0sH
         3ghGsdQPz0uM9fc4v3Hxu7BUPaj65kYFMNhZEMpcrV+eQvyu8IxVftFdnIVh0eV8/0ov
         TfCg==
X-Forwarded-Encrypted: i=1; AKwUvBxoX93/tZBB4Jm1wnsa6LlrDbEDsNSKW5GN8RDVaQJZaT7lB3fgaMsmAOfIgjMGqGkgrEc5lStEOVWUGsRV0CeF@lists.infradead.org
X-Gm-Message-State: AFuF++mmmrUCl2HD2aZkltmcDuL90IE9ej5jCFtfqIfSlwWG2UHw1m8S
	rlYBJ2ahPYqaV/vYc7Cn4mx3lirrzkZY/9i72h0EfjKCPy4EDIoAM2zlai8HZFMhe1Q=
X-Gm-Gg: AYBFou2fV/CLmgwhgv8ZCs7sCQpJAbjKyuHavbd/+2U8mS5tBZ+0XCcyqWUVyMNnn4H
	SMbKv4oCR05JL1b8foT3MwGt4hfurCzapGZg4kJfkuNwFCZFwbYD6rd1mIu6ljMlTJ7M4XCeDGK
	NX5Q+zHfiU5rM5zdntGFHL51QuoZkkVZtEDyBv6oWcs9UsFWm4PX/XGgOHjCplzA44ZPRHoADID
	0211MvIhX/jG2qUod8w3CUgmYqw423dGS+rSy2E+pQQnOmmBlM9gFWW6kyGa+Es6o1kT7/i8rd4
	pOE9xcz1FzgtKN0mSHROb538suH280G9aTudRM/w267uo0pQi4l6Juh9vu7GBZYHuwby9ZcQSjW
	UNatZWeRu3NxaSBihNqlfCvLldJgJLztdLcVUOMpnoW/0TDWFgBNvH+s18wu2XHtN59jJ8IMS8X
	jsraTiW108MNIIHtEHxjAWjmBz5tACrh7/eTe4PVlPLbpj3N8GBYfSQMkx9yJBkH+cYeCKak30o
	w==
X-Received: by 2002:a05:6820:4c07:b0:6d7:c2d2:3bb6 with SMTP id 006d021491bc7-6e7a825d4a2mr306044eaf.74.1791318349916;
        Tue, 06 Oct 2026 13:25:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:04 -0500
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8395-genio-common: fix the
 panel supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-4-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=EOMVP3YQwkcIyqlWrQGFAqi7cRnWf4pYZmNhfVKctYk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVk6xsdsb38h2XMoZmyUXwDh+TV2jSd63sKWb
 LEAsaeGN0yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZOgAKCRDCzCAB/wGP
 wOTwB/9qpjbVdEYGrVDi0toIg94lEZMC2rKuCDdP4g4DkG41TRMX0aSRt+zR3KkDxJ79JtVyIeK
 S+MIMyG8ojRbQ0JtT2MpPwX99fFJ44xH9o102h6vWagCYrVTTW/foDhJcKWL1r/LSZ3R2e+hdZF
 GWoHtZXRpEuqx1H8Du8FXvgPvATmIBKjVn1zNuKGT8xczC5l7VctkvrZ1m+TgdrzpvIVbWkCYV0
 i7jqtJ1kRXwdmsfY8j22vgm4OSBFZnW7fTwIpWgyiFu3ZpRg6n4ROXFI6k7A36VAL/MH9B7txNx
 pmagYP8bpZRWIwZGRsYixjEAafiGDg+mkOSiHsMiIg9lXTLf
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132551_309077_D418E00E 
X-CRM114-Status: GOOD (  13.61  )
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

Point each supply of the Startek KD070FHFID078 panel at the rail that
feeds it on the Genio 1200 EVK, and add the vddp-supply that the
himax,hx8279 binding now requires.

The Genio 1200 EVK is wired as follows:
- VDD (backlight LED power) comes from VSYS through a switch enabled by
  GPIO47. That is the regulator previously described as lcm0_iovcc, so
  rename it to lcm0_vdd and feed it from VSYS.
- IOVCC comes directly from MT6360 LDO2.
- VDDP comes directly from MT6360 LDO1. The lcm0_vddp regulator only
  passed LDO1 through, so drop it.

The previous description pointed vdd-supply at the VDDP rail and used
the VDD switch as the IOVCC regulator. It worked only because the driver
enables all the supplies together.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index aef908df530e..f415b6f71653 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -175,22 +175,16 @@ button-volume-up {
 		};
 	};
 
-	lcm0_iovcc: regulator-vio18-lcm0 {
+	lcm0_vdd: regulator-vsys-lcm0 {
 		compatible = "regulator-fixed";
-		regulator-name = "vio18_lcm0";
+		regulator-name = "vsys_lcm0";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
 		enable-active-high;
 		gpio = <&pio 47 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dsi0_vreg_en_pins>;
-		vin-supply = <&mt6360_ldo2>;
-	};
-
-	lcm0_vddp: regulator-vsys-lcm0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vsys_lcm0";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&mt6360_ldo1>;
+		vin-supply = <&reg_vsys>;
 	};
 
 	wifi_fixed_3v3: regulator-2 {
@@ -303,8 +297,9 @@ panel@0 {
 		backlight = <&backlight_lcm0>;
 		enable-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 108 GPIO_ACTIVE_HIGH>;
-		iovcc-supply = <&lcm0_iovcc>;
-		vdd-supply = <&lcm0_vddp>;
+		iovcc-supply = <&mt6360_ldo2>;
+		vdd-supply = <&lcm0_vdd>;
+		vddp-supply = <&mt6360_ldo1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default_pins>;
 

-- 
2.53.0


