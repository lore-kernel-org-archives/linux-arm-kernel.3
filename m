Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670ADC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=EA+STRCGfFnf68xyOnY8+zzISO
	tY6rk306UIHdveH0eYSJ4ETDKG3Y97JfVJVSNqeUKCi+Ri3z56AWfM8VJkDxJEHc+nvZquoIiBD1C
	kfeaXx6lStPuhDshhpGh7eIiN5nQ9nzx6TgETk953flAux3LuJAZEJa+DPsFp3j8gYHOG0IPWdwEF
	TEzYZU/1fm7CcduG3aw9qv94YIJ6pB2Pe9dnd6zw589a4uzGvSIMnjQroAYhAYItugw7xjQKPCRV0
	lk+LF+tQ0/wShZyjuTBbpRilJzDAjmVb4krzVpYtWqV+Nu9IZxbQP3IXerbBe0ERWWRhKhNMogSmF
	KyJcdZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VJt-0000000E0jm-1LHN;
	Fri, 18 Sep 2026 09:55:49 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VJb-0000000E0Yv-1vKl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:55:33 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f635552aso414412f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789725329; x=1790330129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=gwCaLhpnsFiz6OdD3pSNbkuyKFjhnms0pZr3d70IINZ0+SHj3AFzgzLPgUK68fMTSx
         zKhPE3nsluqMmO9F1wSxICxeWgY9Yw24nj7Uxdf3k1dtFEJgYGee/wPSqWNtAWvPG8Pc
         FZrrRMBsEsVtOT59PLHpW4b3e8cQjVFU54fF3Y7FjuaD0ocPt8Mx8L9MUdWJnsu7XUDJ
         8c4IWJTjJ6k/DUqVrLMPsZMIKdM8PapA8ws/Dol/JlDbExvlrt/6ubtC970xrnzSi4tm
         1wU4MjiViNl0uz/EkXm6DK3hz+6/Ihv1A8XBC5CRgAv8VeH1HoSmHPg838Hs3gBAwRvG
         K8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725329; x=1790330129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=EJmuKxDQq2CKTvypKBI0+WIGe4zAEPha5wDKYYcB60SlYkC4yx6Jv9GalAIqyjpRAF
         FK8fJ93FX1hWLDyF8LVs4waXWhS4WjnFkxdFs5Lnw3n2mTIVm1pyHvodn68ml5ffeiR9
         Bv3uxBS/cu+FN4MbwQyVmlDO6ePXoEPCpD9FVejaLBWgWFyx4WWnEJOBTYq5fSXSVzGj
         0i9xoaPZz78KLLYnuoaaRC8t6icKlN1Ia8JBLW8dEyBdqyvdaUYGwGJBYitEss2KOxBh
         mSXhM00PWgVpZ6o11I4sFuPqjv+B5Nl3voyJkHQw23t6dYTi42caM9dQtj5ALnaIa7/n
         eKeA==
X-Forwarded-Encrypted: i=1; AKwUvByL3FBlEpzMyINHLsV14cnd7kau5qbQoM+UCA/Llt0Yd+kkXswKKcIW8Srse5dqjHXGq3lWXMc8dnWyUgd2tf2H@lists.infradead.org
X-Gm-Message-State: AFuF++n8KYSf9xxfqza40Lbjdxm09zBm6UXtUVT2jMBDxlBKifr9fP17
	35pFlyDAdzEIwVSTdW5OMiqEAkRWn0g6QElF3GGyWVQj61rgjg3GNEw7/XgMdevhPEM=
X-Gm-Gg: AYBFou1r52g+UxCN6lWmGL/jADocVt3tfMXm4cr66xKB/MGAs5fQ9rfMbeoI8dC0Q7h
	sb5v0Xzj9VxOeizk1yD3IbvIwJ7sUlShTDL6DGZf5fKOS10NRAEUNmIJb5YZ63r9IUz0/kyNIuy
	TgKyJGgePyaQCjgIz8ZyFdKlSFHg3wujZT+oe6CKQEY/cXjaXYNzvTwsoD2g2KZhiMrVhmKUNzb
	yqsHmnRTphAwCpFu19Biws4K8Z5fiK5zj36zr+k1TVX+QUseAWlO1oPatQsSwW9Aa0vPaDaV9Zk
	wXvOi4LVqmj8PvWF+NZZv5SueMrnmXMoZQRPvB14QAHm6yDkgSuW/0nOInXTuFsZtIsblhGwDqd
	8ez8XcPBC0qz1bNGlJgj0LkfnHb5V8xV3OQH5Ksx6goowiRTN/QHvOm5v3uOq8h6J5/Y/duoOO9
	JnBtjMxScyjORMQDfKV+yrY/xhVRbuFyt5+SvfcPbDEehHlHlp+uhaHw9qNzt3cg05H4zaDA8=
X-Received: by 2002:a05:6000:186b:b0:487:81c:b5e2 with SMTP id ffacd0b85a97d-4871e244c0cmr2606562f8f.5.1789725329175;
        Fri, 18 Sep 2026 02:55:29 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a928sm3077528f8f.13.2026.09.18.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:55:28 -0700 (PDT)
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
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v9 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Fri, 18 Sep 2026 11:59:02 +0200
Message-ID: <504b6c3403b0cdc1731d3dca735d5a07450e80e2.1789724999.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1789724999.git.andrea.porta@suse.com>
References: <cover.1789724999.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025531_518667_8763E711 
X-CRM114-Status: GOOD (  12.28  )
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


