Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B519ACDE000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VmlgmQI7H4S8qo2yEQ+YQUSbvnieo421LNuRZ/c1mQ=; b=Q4eBsgrF+SiHMSTBBdy7TwaA6A
	WCdJy2Y+TZGV4apEjNfrsqrCNmAfBTaaZMLRORwY9Jypjyv81+KZWH7MrthVRbdgXeHczGVnVc/GU
	4G4u53er1HTJRVj+hbjjoRxXVKJSVGs3M79ac0TF0Nb4ZlvMmYNKXmj3zSCbuBEozCj71yWkfiDq8
	E4S0ERiSV5uxcueha/ytVrqSOiovcT1t2ofHRckbIqMbzUqmNL26RRTkKYmejLcTMu8LHuk7IEd71
	SLESOJrYrhPeB4Rmwh3AIKnHCZgD9nFx8lNUKsxt/gon3tX8zBtz6D2sjH8slEo4Kxcib/R0VmgxW
	b/xv2Y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc839-00000006sL5-1KxX;
	Tue, 23 Jun 2026 20:48:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc833-00000006sHg-07XW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:48:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso341346f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247723; x=1782852523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VmlgmQI7H4S8qo2yEQ+YQUSbvnieo421LNuRZ/c1mQ=;
        b=q4R9dq/g8nWasCIGp3s/XH4zR+wOUakrySwNVpF6WMTPBqbGlmj8U69UKb6MqAi0/y
         f9qwML3C0TqSQNr74OjO4Di9gQ+pSruwx5I0IHPBTk/QUWmtjZMnas0wBuX+SGbwolIU
         KXiUsDRWVj0dKv9oEbBbBq0hvOCLL1JV0bYiiB2x3MDi9NisMd40JbsnTQ+Ytd2TBab+
         9ahsUFo6/8QTwHg9JCrpoM9MCWyZ8cE3vfHPY9mZkBcHYo8Q6ikgKFEEvWEojrVAzIqn
         grHgEdIjjE1Sb6vYwauIofJZuotmzhDj/Q0T8ADVb9fd3tVZrdD9iD6803qB5KYuopLL
         8oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247723; x=1782852523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VmlgmQI7H4S8qo2yEQ+YQUSbvnieo421LNuRZ/c1mQ=;
        b=nxYbCOCPBc9037heY6C0NQ12iBmn3eRl5nDwP+Akfk3H0dBSPf3TTpc8YR8VdWZDbz
         giCttaHk7Bn3MNUOp4HtkqEv7Ay82rr3RrktKq4Cn/+wx27sQHpy8DXjCAI6U04Mh0hT
         ZNzsFkB9YA3V+8q2qdeh3dvDDDAU/W0kdX/PKZWUF31yL1Uv1xu1K2NaW74PaGCWKxY8
         99FTatMQWA4yd034ZR6tFEAu6KWrpGw9uMYDmRweSa5Lm/CZ/w8RsPJ/ZSVGlnNQMaUB
         ZftXPa/BUJqN5ypfelw2a/lk8lUtOKWRCze0KKw/zH7j08wcAM2oqYAMK+N6S2ajQxJK
         xceQ==
X-Gm-Message-State: AOJu0YwgETRf69JXCGiM7w/wDixkiBzuqTFExw7pREh94aOCNvbcFwZC
	+8oOTCeb90D0tYkXsr9VAwoadLTcFu7Sc7XBa1gOo4aGMEo18PT4mokXR0l5nej5a3Q=
X-Gm-Gg: AfdE7ckC1GaJpuqEefvaVf4/HjCszC019tqQKHTGCYT+YQm/fUHMUeY4UflHMNjiwOF
	Pkrozl4nOZaZ86sy/zGJphMNpa/6dj/1rynZc2MVRRddz0uKbTeRZseND54phAP67fodWMlt6Lr
	RRLIGJHGNQ6RAE8U8yXaex0a0rFcDBQfgn3MJYyZN8IgH/s+cNl4qVw6G0HMO7Y+wn3g7W0hnl6
	6PDZOb3wqw2XifOUy3Weivr4mDh5lo397Ig9rPlYkYmsnYKbRuPSClR8AWEILDCfeEWLsRBKOWc
	Vmhn7/or0OsIWRU3VFiY0MNW670C56pHGWl0q6DM0slu2zgO55lS60lh6q59XVMEnQvcC1Mdj3J
	WF1HbzWeHcEXTdBGT7hUzNEGH8rhHqfgGiDoBrLMrcftWM3OrQf+Jm943+crrw7TuqUNxwPlHMw
	myohBUBNmikevZOC7TwOp/mwNujdcd8A1R1f8Aiu4XHw==
X-Received: by 2002:a05:6000:298f:20b0:45e:ea46:ce13 with SMTP id ffacd0b85a97d-46c0990089bmr554253f8f.10.1782247722883;
        Tue, 23 Jun 2026 13:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:42 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: dts: allwinner: a100: Add LRADC node
Date: Tue, 23 Jun 2026 22:48:17 +0200
Message-ID: <20260623204824.691832-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134845_648470_F086E2D6 
X-CRM114-Status: GOOD (  11.76  )
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

A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.

Specs:
- Power supply voltage: 1.8 V
- Reference voltage: 1.35 V
- Interrupt support
- Support Hold Key and General Key
- Support normal, continue and single work mode
- 6-bits resolution, sample rate up to 2 kHz
- Voltage input range between 0 and 1.35 V

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- reflowed "compatible" property of lradc node
v4:
- added allwinner,sun50i-a100-lradc compatible
v3:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..ba6020989ce9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,16 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-a100-lradc",
+				     "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LRADC>;
+			resets = <&ccu RST_BUS_LRADC>;
+			status = "disabled";
+		};
+
 		usb_otg: usb@5100000 {
 			compatible = "allwinner,sun50i-a100-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.54.0


