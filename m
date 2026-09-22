Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19930C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=; b=SKzZ7e0NArGP7cDE05BP7CrY8Y
	kGEqsKtpt2mUZ+nNeYaJPmcdfocJdv5jM8QBOfkXuTVDCkPX1aHmhetJ34g7prT7pHGLElf5ZZdW6
	Szk8Yit1CFvz2v/ftAkqXE0wKXGtj51bBnQWuid4yV06GAJN2zHKw6kI76d3grn8IVTbKXs02AtRF
	mwBJOuwta52YEevNwKxgetvs+fJfJ+IeuwAVwpR35l/NkHX/3vVnAS1mdSPIG41omhSQvtw7v1N7S
	rOuOvBglI9eW8aarGTW+50MEiiS8I6BezCpk6FxUsunvqbDYEkwDEp11HvHvXAsZjOb9ZdmdQ+gA6
	1+5rX5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o29-00000003km2-14cf;
	Tue, 22 Sep 2026 00:06:53 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o22-00000003kk0-2iRB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:06:47 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b9cb8883ecso342560eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035603; x=1790640403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=dezDXw7uKX/aYNlCGEZiGl996gIsTrJiYWDxTKZTrK/FXAgePCg/x/7qfaUxhEo6z4
         gVrDkDlZM/8m6pVjpCjnXzpO++nWLq5f5MHOQFSvmWK91lZDhyuENJMwpNQApOnG7J/D
         dl6BnhtWXWa5l1U2zSGXH6dHgnv2mtlXjBXdF7fTnq+pThI7RYUKubph8uH15T9isqX0
         KFHjXHRmPbSvbRB9jHPCPKsvC+2Qa8vtaLN/GO5rlvcqAin9pVPKRsNJaotVbZa0787c
         WevE6MgsC+KO4Rpq0yRCTmPzZj9XcOmlTDN/tIP07LZYNwiuB2UNgRKi/jh1Vvn/2nN1
         rFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035603; x=1790640403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=F876e5xXfpYi7onUAQ2zpRn7lhxh9OF8NmJgcssL0r3in8qYmZn27H5s/W4AaFd7kt
         KnBluKEiUsQ7d8VI8R0I/TM24GZSj/FczdVk9nCC+Jea9Pt9LKDSMuQ7R4Hu3qZD8aC9
         9AGE4NuIXvn1Z/zM7nOw2EnGiP+SZzKTDa94zRS0LqiGy5O3GyZe4uEUALGT5GeduWhR
         uPjtS8k4YM0My6PSN+HaI0y5HkzYMVsidD2Vjc84P315jUNdEREmPTtduo26O8BKHOB2
         4nQ4RCd44+OcR8SvO4UDOtDCgQnau325CRhDTIW/qE6h3bsdQQ1qATGTil8l097TXYYh
         ofbg==
X-Forwarded-Encrypted: i=1; AKwUvByDsmC5IquJJdG2BYR9Nv/h3ZrBq6z9zPqqyZZCVfOumnjmXVRbDXDOKF932l/Q3rmGoX+06DuptHEY6XSTbuLC@lists.infradead.org
X-Gm-Message-State: AFuF++mWXW2RON8yCzYAE8G4XtQBbyM4+pMDJToJNV081zfi52hwRCiU
	HpPr/TdRHvIK/ON0NmwRqazk0MH5yHrthcIwcPZw46tyBHoB7IBTbOc6H6foahBo
X-Gm-Gg: AYBFou1RnqsncFVV0R65osv4sQxcHMoSs3cWHVU8Ss1sopyuPn1rJuqki7/TaxNi0l1
	jTVsbwT1M/gtezKfORaguqaSvrumWMisxCI3qoHktu8qHveU4XH517DThfjHT44XFxvldg0ZAky
	Pbg5Jy5OkX6D7NUeWcaC4HIGSuRi30S0rKiW1G4BW3UFhk4/7lhXv3gvx6d8HksagA8pgGVVBg4
	1cZMeqalB0FGlv1Rbv1b+/VD6GOPH+rbc1SqqDRuuj2UcCTvzbYLpIV/mob68tBatDFQG4JLF7+
	5x2THGp1cXhrp3fabeCCzqtwU2RTPStTyhqGABUDEVN4ix9iJFDvlVWOq8GcElUGOfrsj8xhOg3
	vTm0wzcR96l9feGbSG+aHcel1bhCf/94e3hV7xyHFc0EAYUj/9jRxAWZqaR9f6JKVcjubxnobGb
	vjrqK6Snqq/2QnYHV5xV42+cxOC7Rf5MWQk1wjbXzmS9eS7irRxYq6KcWmq+cLrueATPFVTs78J
	EFELQk1DjVP9g/XHH19KomD+Z4akZDr88b9vZ6Fl5zFtJJONWvHj1ioyPiTObPeRBpAvaEB8whj
	MIMT4qb2D7jJ/XeTarLTGVj5t239BAQ3UcVML1LV9eJvdTFzaIfyx18zqW6CvLDVjlAC3k5YQ9J
	dh2MQ2EVn160qWZD3as0/
X-Received: by 2002:a05:6820:179b:b0:6b1:a146:1297 with SMTP id 006d021491bc7-6d157d893ddmr1041226eaf.1.1790035603341;
        Mon, 21 Sep 2026 17:06:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:30 -0600
Subject: [PATCH v9 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-1-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_170646_723144_49C4DB89 
X-CRM114-Status: GOOD (  13.65  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0


