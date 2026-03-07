Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B42FC9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ycKvNZw221jxVdyVNWLOsWUbPtsOR7YJ3JJodsI6vE=; b=wLe5i5ro+LhAsBHe0rnUFJeDlg
	55/jkhR8se/DP43CL7jkiT+QE4iSGZus2lAZhBKGwcuDclTJaxmfHGmZAipyj0Zt9abW6pHL41iTv
	Wj/NbStZerPsjFyP/uFy5rr2EOGarb0CJtIJFMDl6xvrcSpkzkRnrbtKmXdeTl48UeDiHHeUE0o63
	5psvHknSRcSDdxrJ6isVfZImHI0p5Kalx5vBd0C1ul2scvWPFAabnrQaexK7dO5gPyIOs4tknR+Wj
	+6SsddaC8NLTOwisQRQh4V+dnlgYDffVy3xv/SaVh2rq47JV2lHH2rLjDfNanW1Uq/XkQiNZy8cwt
	KXaT8Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynlz-000000052Fd-1NZJ;
	Sat, 07 Mar 2026 09:16:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynlu-000000052EL-436O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 09:16:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ad21f437eeso72158585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772874990; x=1773479790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ycKvNZw221jxVdyVNWLOsWUbPtsOR7YJ3JJodsI6vE=;
        b=CG8IRjGROf9TN0gYvpTUKCzev2oWfhtNCqGt/o6HCAZm1T6VNoYbroG+N8KIr2/BPX
         iWT/4hzy64ETaoFe9A5ilkNTUG1kWrChtum8jWaN6JGHqihk3V68JCCAlIFc9RJdoOVY
         4HrO4Ktk0v7hbFUeCZ08wGyBb0zkWTwJOOOhZS1ljuZsZStdV37C9wSE/gTXF9wgKG2A
         JEt9ofMPSrL3bhgRUbGA2yeyOArvGyn9cZcL5bdxUel1yAmaIzeEBHYIif5PiddhXlHm
         XCzSIuoLTEO3srrbHeZhur3NywTHxeNV6aslRTefU8mQdoO9UvycYQh91ecEL/rqhE+V
         OLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772874990; x=1773479790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ycKvNZw221jxVdyVNWLOsWUbPtsOR7YJ3JJodsI6vE=;
        b=G6sfTZ9WoKL1ZS1PLogo5mq1QG+vBNLGLOd+2iF2GHaeaJUFyEkEjRSx5vKxVeTdXh
         Z4zUPjTWccdcDEWG63WGP1y2b4teoVnfPwvhfZR1r9JuIZXkmsIZZTmWA37zbBljp2uK
         2C6ZkuHx0E+u5eDRnzV8uXrYNhI4HbieoDKShMhZtSplXlk/kmV+7ajt3amXkvkUA4uV
         fyKDW13h+NxBjjyeMQ91hQgvRt0bv5kdX6dZGL9C5CqoGfgI/t7R3v2XM2dsMBpXFzDH
         sopDfs70Aoey12vJqj2Fn37WxAA1YhS5zp4h/j5A3zFjKEseUteA1/XaFt32f8unrJQF
         4Npw==
X-Forwarded-Encrypted: i=1; AJvYcCWZXiFurw0g58SEhcbEXImJxlpDFv+pOTG6eVhk3rxp5POR6KXRz9l6i3b246ouwmRXwPrIQ7BfAz2iYovXLMnt@lists.infradead.org
X-Gm-Message-State: AOJu0YxqsQaHUuHG7ZhTTcjwYYGifnitIOlsId8Ps7M2Y71MiujWZQHM
	5v2a90It+WLHyHaCSHZX2rzzQEzutIl+iEAgIguFtgWBjLpPkVPAtzYk
X-Gm-Gg: ATEYQzyyXWqbhOmhtI6N1DqAEU8xtP2dEa6t9HPuipSJHKV6QsYOphlRiWC5gjZ+e4O
	lW7rNH7+9yZ0WqLdhK3e/r03mMOR/7qHSBRfYyvJR6HX+pR0y2stOe1IjijtIxcd4J/a3sq5QR9
	Y77Kdon6MQiacJsyheHsPKhCGRFT6xkyhpa8tw7+IyATgjqIEUtBHr0gA+FdyPf1p7iTOZT9PRs
	GCHufbw0U6cA1W4fnlZcBhP1TXEzE726vPiK7dqV6jauJMPjUfHfL1pHpoqm8X8fJhGnSvfu85C
	X8qBEgtD3E/IngymVTlUUg0anavCz1hj4KcDCFcgsi9tCjmzJ973guBwNrDorKLYg7xcZUCz2Dm
	uInMAGq4vul3jPIDZLHKfOqdLiHAnJQoIxRTmLmxd8fHdvOrGqj9oZ0y3uhA2Z4yIcCbh/Py3uK
	NLCd029FV40oLRyYfuiGnbFBUNgPbk7YuVaqVtfbcz+Io=
X-Received: by 2002:a17:903:3c23:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2ae75b7e02emr98819375ad.13.1772874990333;
        Sat, 07 Mar 2026 01:16:30 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:29 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:18 +0000
Subject: [PATCH v3 1/5] arm: dts: at91: remove unused
 #address-cells/#size-cells from sam9x60 udc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-1-3dc48fe772be@gmail.com>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
In-Reply-To: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_011631_008012_186274E5 
X-CRM114-Status: GOOD (  10.71  )
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

The UDC node does not define any child nodes, so the "#address-cells" and
"#size-cells" properties are unnecessary. Remove these unused properties
to simplify the devicetree node and keep it consistent with DT conventions.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index b075865e6a76..e708b3df4ccd 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -75,8 +75,6 @@ ahb {
 		ranges;
 
 		usb0: gadget@500000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "microchip,sam9x60-udc";
 			reg = <0x00500000 0x100000
 				0xf803c000 0x400>;

-- 
2.53.0


