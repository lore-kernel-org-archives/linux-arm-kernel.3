Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB58E6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPAiWzbcwfO/oeR5F4JHaOzCtAZr+PBDQTIr9NKTt98=; b=z2ONf9f3rMHcUGkfVgVpxolGhd
	Nqpdq9bLP73k8oU1BqID2PSKEzcxEIaDnTEza/+ueC5gRGdx9uAeFXPxYxQ3pcQCx3TR4kkWyd+Ap
	P9uO2cFuUXosSw76FG8Y772SWsCjTnSiu/y8YuhAwx7ZfRKT4CPL7RrfboPqDz8aeRmPMOBbmiLWl
	tmkzw21lrI/2T5TOAPMYsoCiL1iwR45BwJ3Lg6DI9CrLec6haDZc5gKjhTRLKWKBmvNGPQxW67aFD
	FFfS71jsGLBcIjkQvmLE1glFBChVv5cUhFGIWYrCjnCWnxoukE+lr/6MMxMwkbVyFoDJQzhmGGs86
	ew4jVNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ocu-00000006WLs-3EIl;
	Fri, 01 Nov 2024 10:11:32 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPj-00000006TPj-04R2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:57:56 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5c94861ee25so1119414a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455074; x=1731059874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPAiWzbcwfO/oeR5F4JHaOzCtAZr+PBDQTIr9NKTt98=;
        b=ov0MluGMgZUmm4YfdioEx/9xTH4Rof9obSmGlqjzw4FjANSaeW4llftJEGqUFFfrOh
         tfFLVHpIZ+aOjMPeBdvcKBC1Ly63YTWVrD6zYk00IwvnvuCkxtFtWLmyrDLmOcGEHb68
         SMB2T0nqGpfVQdWUkXXTxkROPpscYtT1Q4vxkh5dDykvokztbHArj8Hlb/pxmmdTQoOE
         tsecP4iL9Wxo4WtCgFkN1MmdfSRuibkxAGatUGwNkdU+3yQ19eDoPIjzQ2P4y1ptI9aq
         kNIOlozuFa495eznMS6yu8Km1Twcyat+NOn6+iEWN+AqjZPnkbmfw75mffjMrGHZfu6d
         5X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455074; x=1731059874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPAiWzbcwfO/oeR5F4JHaOzCtAZr+PBDQTIr9NKTt98=;
        b=V1nLQFBDEeU8LW2Y2H3G4MYrqe6e1ER8mWAol+lsHJ/k2+wxTNyiik1gwRzHUYpp7Z
         dtBIWAhH496xIVx0KiXWFqwuVYM4VKh0iElvGeAkd3i1+e+767VqpsWQHn1xDPYKhqhl
         HO57WFF4mbbgg7U/E+qBAwVWh0l1cfYqnlk4eXgt7lLgBP+iud9FAYwlnBxJYWnQrjJT
         xl6MoHAfWA1KQUXzvkCEluMUOPeV2PUVy5iv9D7CO5JvukjqhaSbQalabpmyQ5DqJYF7
         Wy/MLdSba5fnR5T3ENlUOt8x4MupzDZGA4hQevXWDCX8P4FILpJKMwk7GJ9EPN+y7E2H
         /gtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEmnIEYwlPgJpMkXnpo4g8K7H8rhLTKT/SYZn5TLHa3XS0DHmu6KluEsgi767uRmV7fILvG3kmBDeNVBGf/hct@lists.infradead.org
X-Gm-Message-State: AOJu0YxbwnXUf4PYkoUGqaPGNV5MuTJ3Kr9krwhee2AdjgnfU3ZS5lr2
	q/2dMT/yRHhXv5dy/+iCj68ogFhKudggL8vew5SOwzA9xTb9nZ/YO8yr+SfrTEc=
X-Google-Smtp-Source: AGHT+IHrP9FP8fHD/OSWluh8tapezeAqFQ+YzxBMlbpTwIN/za5gGLBDUt6ZXq57lFavCwyaNAz2qw==
X-Received: by 2002:a05:6402:51ca:b0:5cb:728e:926b with SMTP id 4fb4d7f45d1cf-5ceb92a38f5mr2691588a12.17.1730455073635;
        Fri, 01 Nov 2024 02:57:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 7/9] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Fri,  1 Nov 2024 11:57:18 +0200
Message-Id: <20241101095720.2247815-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025755_119993_6BC032BA 
X-CRM114-Status: GOOD (  10.80  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB controller. It provides the clock for RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- dropped the status = "okay"; from vbattb_xtal node

Changes in v4:
- added assigned-clocks, assigned-clock-parents properties
- set vbattb_xtal status = "okay"
- collected tags

Changes in v3:
- updated patch description
- dropped vbattclk
- added renesas,vbattb-load-nanofarads on vbattb
- moved vbattb before vbattb_xtal

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 71424e69939e..30bb4f5a7dfd 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
@@ -344,6 +345,17 @@ mux {
 	};
 };
 
+&vbattb {
+	assigned-clocks = <&vbattb VBATTB_MUX>;
+	assigned-clock-parents = <&vbattb VBATTB_XC>;
+	quartz-load-femtofarads = <12500>;
+	status = "okay";
+};
+
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2


