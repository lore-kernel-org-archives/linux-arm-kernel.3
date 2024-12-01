Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60552D4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8Mnl1funP026bpupc6kClrugt4oD6R0yljLualdHeA=; b=mpoPi6EpvdQmG2t/SARQqKA8si
	TZtNgq0exZ8hyRyXRPBz+ZwPiF8moZ87RR2RtUEnH00OKweZhEx3pYJNPy1i04peZBooZKNbmwCj1
	agIk3BmM5Mw467vySsdJNjH0Jvx4T4r88QMhW3Qdb35aHSiXhJgxS5UNyAzeU3W/RqlBlOoHZ+cHW
	AcAZdIEML/OHv/WWypNLE7SGjx8BPpPfXoquxNuOzi3rqkbztbqQLZZmMGdDzJElAE8b+bY/2kFSA
	MN1KmQCjJm/OjLiIsMCvMl0klDS7s/HSDUGe+KU4evsV7eJ+riAxq8hYaGaQvNRXszSyDPTTGWoiB
	MdGMwd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoFt-00000004Apt-18AZ;
	Sun, 01 Dec 2024 18:01:13 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2n-000000048Yc-3o0i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9e8522445dso499959766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075260; x=1733680060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8Mnl1funP026bpupc6kClrugt4oD6R0yljLualdHeA=;
        b=SIdpUvEg9WbV/NUUeM6itmlWUrYVtpGdgvYb4t6b+25zHyj0lziq1QC4tMbuGU8DA+
         4gFTq+ww45j5YE3sly4sktsCW61/R/oB7kGeP6GELIynsuZGXcEHAH9ze+MYfws+s8WD
         L3qL9AdgZbqBnLNNi+S30baBm+vD00AEr45yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075260; x=1733680060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8Mnl1funP026bpupc6kClrugt4oD6R0yljLualdHeA=;
        b=KW0F5Kv812yzq1GlM/0MLBfpqrhDpLwYgBELrhMWFe6t3S4Yjlcx1ICGQwFsJ0W/Al
         Xbi8Cx01RZ0AM5y8vJ1y7DrZQg2qluleM2dClo+c8Rq/qN/nvKslWIo7eQOEX+++8lXU
         7y8gPyLM7sQTvKxQz63LQ1D7LS2dsFQcdWzW/5/Sx2WAWCjbSdzF2vo4rd6DGPWqfVS7
         M8F4i8KR/lpKJuD5S0l9X/qOcocbyr4Xlmn6W35OycJPctbAwLwx1ddfZwhxXhGHTftk
         U47fOeeLZfloAWj9jK3BvmMLMauKUIzLfY1Df4jhwwD/ugkcpPdMTa9FNbL6GoC4EElH
         FqLA==
X-Forwarded-Encrypted: i=1; AJvYcCWfpTJ7x4K3wVkIH5FjR1md1fSnxl5+BVlzdVqOW9tI7BLxG5IzJFlEhj6UUVN/7IbvdcfuZ+j2YKtuOcTeOJSq@lists.infradead.org
X-Gm-Message-State: AOJu0YxIM5/G9wC2KAKVSYsbmOWRbFja5psvCuqx934sJQZErfqiXNs6
	Lg0KPGk+5AuvrpHe7ITqr1mGwZ6+Pn5VdUXhxIsnFN5dDrvDiRT/2lHZD/aJ0y4=
X-Gm-Gg: ASbGnctzRUcWmqP/x+SKnRSVmKdmbEDF2+qVKTPBQkGZewrwpNHUv72lnkwCPcz42Kh
	IKQC66puL3a71wC5KCGDbiZKCiKz9xxPXuwBB/eQMXG8vnD62msntERWYLBWdN6FQsemgDj+5wJ
	8bJc7pscPuYE+rl5qErDUg1rdFH/xqfPGMciHSUos46BzOmWdLmUxf3OcIITN8N+hlOExGCKg3I
	8tEQLdMkCFIBNbWKjb9nX3bRfC846zi/YFCoPG3VPw0HFcoICIYVjsEykpTpEAySQyWfc4VgQ+D
	mk+Bn8r/JhQ7IktxxqMlY8976kHoT4cOG1Kp/YlHfKoqub3OdDGEo6d7+/y3YFtim4/U4IvBDby
	dvvA55cUX9KQwjG8i
X-Google-Smtp-Source: AGHT+IFV72Xrog96l7fs/EfUFu2CelIfYRaRPp9iwFgjtNC+Uq3ekIXkP8zlYtkGxH0RM/aN9S5fHg==
X-Received: by 2002:a17:906:2921:b0:aa5:2232:c8d2 with SMTP id a640c23a62f3a-aa580ef31c1mr1541928666b.10.1733075260573;
        Sun, 01 Dec 2024 09:47:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:40 -0800 (PST)
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
Subject: [PATCH v4 13/18] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Sun,  1 Dec 2024 18:46:13 +0100
Message-ID: <20241201174639.742000-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094741_949712_4FF861B3 
X-CRM114-Status: GOOD (  13.28  )
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

 - Drop "fsl,ssc-clocks" property. The other added properties now refer
   to the clock list.
 - Updated minItems and maxItems of
   - clocks
   - clock-names
   - fsl,ssc-modfreq-hz
   - fsl,ssc-modrate-percent
   - fsl,ssc-modmethod
 - Updated the dts examples

 - Added in v3
 - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
   indeed more or less a syscon, so it represents a memory area
   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

 - Add "allOf:" and place it after "required:" block, like in the
   example schema.
 - Move the properties definition to the top-level.
 - Drop unit types as requested by the "make dt_binding_check" command.

---

(no changes since v1)

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


