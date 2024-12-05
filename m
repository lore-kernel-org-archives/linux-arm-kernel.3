Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FFFE77172
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qxAaFLk5+E1lAMIL+qkYRoUyf16X1PKrF8INezZ3F8=; b=lRyyfXyO2xtDKJpiC1MmnGvJI3
	BHUkf25p5zbKTLISP5LOjbGIekRRsUNSci7GF/D0Sd7XAwxwrdF4cdFqab8960FaqqddtIS3pQxPl
	mInyUXG03sepj1gxd37k1Io2cUVUCcPWygFVBG00Xrs1u6rqihfMkclDA30ewm6QyK0XMqI47a1th
	TL6eiu3ggmDSrT8nZ98wk76KEdSVGJFxEVFDsOYpiM4g0YOkfdsDOcYr5EmISLAb3uizW9qyayjXQ
	9kHNH3Lq6S7eKurc6sJPdxXT4yVDp0ACJ+51p7dprKLx+BSITgHYIO/iAbZC0ddLLgodUIlhQlf/M
	s7Qq196g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBDI-0000000G0E6-25kI;
	Thu, 05 Dec 2024 12:44:12 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tt-0000000FgjI-3Boj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa5302a0901so87839466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397604; x=1734002404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qxAaFLk5+E1lAMIL+qkYRoUyf16X1PKrF8INezZ3F8=;
        b=KAjIG5IE4c8ClPjT9Cbgk6a/DVcaESxYb6AsV+M/QQJ75QESE8D6oOxCGEE37l93hb
         9zoO0Bzo4BN1CT2OjWojBSIr9brCML+QEi/rMH0XZnIZ5rJMoBCgnGHLg05PChrsmLOj
         5k1hZt6Y0KUh9Oc84brvQktZa2SoIYxrLHucs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397604; x=1734002404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qxAaFLk5+E1lAMIL+qkYRoUyf16X1PKrF8INezZ3F8=;
        b=gWlYH2W3jFQsi+zT8H+dbO45uPeoiDqCCCkKfoN/vGBrsEV3/UNjQ7x4DdIpRKifcP
         cnG7G00UD7EbJvJ21mLxvBkShMDAGiSZLPDSjwHe5Huuw9iWJqVZ76MMb5MDy3we1hlt
         Z6SndnL4I/KqgV/os6pZF0y4DhGkHGmrkhkfuqQIkI1Uob/IGBawN6MNEUBjsr0hESiG
         /Y8ScdikjarlhbcI3/J/mL6/CtkTM+zU0R+VzpLhlRrm//zb5uLQ/EoT/UCYvdCLvz5l
         HfZ6S+jbMNLTrFm+D74jnXjnhHcEb+z2WpDtkb+1L0OJP8UvWZSXbR4HQ2SGxZB2LKB2
         B7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCDbqjGpoPyT/7DLx3QOVr3zEyqTV1r8g9Mgb6aOD31BEnYZYvSmqiZvlNu7mfGzBC3Af0PItLG8j+DNYn/drM@lists.infradead.org
X-Gm-Message-State: AOJu0YwWblPAvvRjI7TSswOclbdCuzIgJpV82VWC+YgTxzDk6U0Of5dM
	T0t76atHcn/QxLEBgtuv49t8s5Ob0uAkpOnfw2uYT4NYxtdZXdlKWMyiR17FXoc=
X-Gm-Gg: ASbGncs0QQsBoUfEfkDaDHRPijvUi0eRN5shhftlgf3iHDd0eiNVtLicq09g33uCdix
	wG+mD5fAB1i1mmlv6y6GIpBi9i5kboQvADgeCyDGso02WGHvu7I3RWCqr6WI4TjQaYgGkmkhSv4
	+uH8FASJOYLNVoPIautCZ8gjfMZYUVZDBucMk9g6z4/B5NOYbtJW+Phuluz3a7QfK2+ZNGt/a85
	eSIc7nGZA9UGV7Qhh/wrRV9VdwiiapBRJNbIthSOk1eeeqQOcvuJEudHkAAeLN1OI1GYZsFKhwV
	FQWIeyNlDYFsvuDQB8DgoZwB7qstZjRUwRLB08pc4jgyTw==
X-Google-Smtp-Source: AGHT+IEgFpXLsMoTzNiUj81+8z1QLJMCQqPzFfWukhsHBlq5eIb4F02MTbl2wSjJnR15AvECCxPBJw==
X-Received: by 2002:a17:906:32c3:b0:aa5:43ee:2ff6 with SMTP id a640c23a62f3a-aa5f7d011c6mr812629366b.1.1733397604406;
        Thu, 05 Dec 2024 03:20:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 15/20] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Thu,  5 Dec 2024 12:17:50 +0100
Message-ID: <20241205111939.1796244-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_032005_806791_2EF47B41 
X-CRM114-Status: GOOD (  13.12  )
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

The patch adds the DT bindings for enabling and tuning spread spectrum
clocking generation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- Drop "fsl,ssc-clocks" property. The other added properties now refer
  to the clock list.
- Updated minItems and maxItems of
  - clocks
  - clock-names
  - fsl,ssc-modfreq-hz
  - fsl,ssc-modrate-percent
  - fsl,ssc-modmethod
- Updated the dts examples

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 .../bindings/clock/imx8m-clock.yaml           | 77 +++++++++++++++++--
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..83036f6d2274 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -43,6 +43,34 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum.
+    minItems: 7
+    maxItems: 10
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum.
+    minItems: 7
+    maxItems: 10
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      The modulation techniques for each clock supporting spread
+      spectrum.
+    minItems: 7
+    maxItems: 10
+    items:
+      enum:
+        - ""
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -76,6 +104,10 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -86,6 +118,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -95,20 +131,49 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
+        fsl,ssc-modfreq-hz = <0>, <0>, <0>, <0>,
+                             <0>, <0>,
+                             <6818>,
+                             <0>,
+                             <0>,
+                             <2419>;
+        fsl,ssc-modrate-percent = <0>, <0>, <0>, <0>,
+                             <0>, <0>,
+                             <3>,
+                             <0>,
+                             <0>,
+                             <7>;
+        fsl,ssc-modmethod = "", "", "", "",
+                            "", "",
+                            "down-spread",
+                            "",
+                            "",
+                            "center-spread";
     };
 
   - |
-- 
2.43.0


