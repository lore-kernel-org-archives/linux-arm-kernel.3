Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22734D5CC96
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfEYLhjMDeZH0WbYlTTTFbhTtromhzFBfjXyLFGdvks=; b=rXjve3j/fkvikMazAAK7PJutEk
	C4xXSzk9cT6sL+M0EGCdmfjJ+DkbVPkBTzbJBo9ho3lN62AEfCBvphMLAkBnQ2SU15AVehgEZEcSb
	ituLZ4bAnxfC3s2JxU+UKQewf3My3dIPuituEBsbnr/j3tJ+WfARsAcJa5TWqjGL9hOPlRjcoCPLy
	XOmsADRQKfOg9dH2Ug5QT6XVEb1t7SA9l+ZrI/XQPSgUpG5bs7eCIXRK/zZSrShjxQvmG/K6LwNSN
	t7fiaoUxyDmCabkIp0oIP3ZyqbuYchYnMx6U/efUGaz+aPUVnfg/zGFqApgw6M7ALUTQ+DLiiva9j
	KCIL2lig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66tT-000000008YA-0zZC;
	Wed, 30 Oct 2024 11:29:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SV-000000003iK-3h3Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4314b316495so58078915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286110; x=1730890910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfEYLhjMDeZH0WbYlTTTFbhTtromhzFBfjXyLFGdvks=;
        b=pUwqoSHDlGiwmvlCjTVNsn/1n7OPRSu7/2jKOKjjjqzWWdqJ/fIfVkM0ho4mV7BelN
         y9RJ39mL8ZY1Cg3G+y+C1UBfI6h+4c9/nOtuARKzAWRr3ggqkTdVkCfdNxvbQIWc9Q7U
         gm8DvU/SgdoppCIfTi8ELZg6fjytMOlHRRMPEuC5k7nK6eHZX4hJBtl+lP5o0tAqBHRL
         sNDBVct5y2o1Q42ID0mvdpPooF45r/HN/lcoGgqWuDXFjZYU7cojLrv5/dGxb78MVs6k
         3xUp1KIr3IWMNGYSUW26Hj/65JpZE8nz5kFClzIXPNlQYL8yeXHUvf4TBuq6MEhgMbsr
         gCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286110; x=1730890910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfEYLhjMDeZH0WbYlTTTFbhTtromhzFBfjXyLFGdvks=;
        b=v7xBG1Nrsxqdvze3pJ33gpAMi1/7brbGVs7rqzmLDWPmG3cIEQzDL0QDj4C4xPY7Na
         3VAPjkKicvlgxeVkPEkSxA854i0d0QYnM3Qcooe3braq3Bx0jazx454TDhPD4L57fCWX
         vggz9Dqts7914AC+/yHC4wXteWwNfLeIl01abu0u+5NqSGtNM9A29OrKTMyhbyDTOXqj
         eTx/GWJbtWnD5/pHt6shOHcXQfRtsIOdvjj/0jLX391N0v0XJyG+Fur6Asn3RJ8Yh7pm
         xdsyXKAj6s4nATSDw9gvMrS/saqKtuP1gnl0ImvWS0XrXwXo/SzzUnPFRubum5D5aR03
         /7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwN56Mbfu3+oN+gVRxaIoB0DJ0wAjTUnlAHbXSEVFtlaB0Yv7XaJ8hmTm0iULPnFJJHaOrQKvOCYhZ2ldPwU+b@lists.infradead.org
X-Gm-Message-State: AOJu0YyXEEfGnMJtYRQuuxA6k4M7ySu8lXANxHrLrxy/JBQUxAV25YAM
	nFSERMFcpsh/z3XZrxB1Po2FqgC1ay8c/7P8YK5BUG2fyrA0JJFgMra2q+KiWWA=
X-Google-Smtp-Source: AGHT+IFSBbnTsjzeDFuXW2ohx80Zl9EjjF5HTT3F6o10bua6BUx513xSS7WM3daoN9qpwdEzGQrg/Q==
X-Received: by 2002:a05:600c:3ca3:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-4319ad317e5mr121837365e9.31.1730286110454;
        Wed, 30 Oct 2024 04:01:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:49 -0700 (PDT)
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
Subject: [PATCH v5 08/10] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Wed, 30 Oct 2024 13:01:18 +0200
Message-Id: <20241030110120.332802-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040151_947599_05A73544 
X-CRM114-Status: GOOD (  10.49  )
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


