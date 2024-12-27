Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8910E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqUbS4QFbQjY9acz5KfEUvUnduu2cjIu1TltoLZFYZg=; b=ZnO8w8tAnkx8o7R6RSFzRF8Ff7
	/0lAobTB6cgE6t8hcVxiqYP4H3n40lm5ko+ljYiCKcC/gxOiGKf6g9UPlpV0lHz7HvY7R76gmwBAw
	akxx1YtWeb0s+kuDBjjExiBBOqhVb8YPiTQQesFijZ/akjqPDls8veUOabhdpSdPxX9y7IXCIwhtU
	yYOA6X+h/Fe2oZTYdyYeV3SCkfnoY9foDCy10Ph06X+UrViFMoDTdTOboF3SqZ8xPJurk100aFaAu
	8UlAfFLBEU4gvISu0aBp0IE9Ph4oZpxcm0OprwAXAg4d/cjXbWVDcq8cQE1N1BExiuKWRtOdfE0Mt
	ltpeJB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE3R-00000000iCn-2rau;
	Fri, 27 Dec 2024 17:23:17 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDex-00000000ecv-0kw9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:58:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso14137522a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318677; x=1735923477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqUbS4QFbQjY9acz5KfEUvUnduu2cjIu1TltoLZFYZg=;
        b=puolqOKKCC3AHO4ZAxCDyJgmiYW4pwtdgOuyD8N/RJq6enoxHKi0e7pa5jVBBvhcv9
         fYplEIGNntRsCzlu7s1EI204qyc+6i0VUjAYiPmnuSDh4McBG1mFIsP2rcxFNsdyE36E
         MLrK9juLPECXWfDAJudwkpYI6h+NI/2mEiDFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318677; x=1735923477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqUbS4QFbQjY9acz5KfEUvUnduu2cjIu1TltoLZFYZg=;
        b=g1zLxQWLboH4LGDS+TEvu7RmqOl13RUQtATXRNXOtrXhIf7EhnGkvLWosqpQzPewJd
         DOXSAoDhuncMlsqS/HqfP7pqf3BjY45i/jfUDjqAO7EQbww9stVkrtl3j/yShzMhYU+s
         yW+Ei2i30edyB9s6pFegTUAsHrIgmUV/+X61HX4xrBGyKp7F5P/YTS1Di6B+q1YliPib
         8DFsfHpDw7d3F9z3gq157o2v8yBh/xdgtLEqgJQciHVP1jB6NMa4hgbRYz7MfqlKZiCj
         2rdq53zzGTGCDcg0m4X3E3CJEVnIjtSlp/z4x+EicDf3SKR4B3ppSHgFESxNEE0H25eR
         85MA==
X-Forwarded-Encrypted: i=1; AJvYcCV+xR3D77hDtMrcBCxZLUplNLTwo4wkvqd1R1L11kON92b/JITaDoQp3w+DJ0YEqGTZ+XW8zCHTH7CYbktJ1oEd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/1X5QOWEY3GcWIBRzCrzafc7/2j/EHDCiTSAU7/Hualkg3fmJ
	pqmedzPdlXqyOqqFh6s4Sew0ca4jve8pA5pSbgg+m+1T3RTk7jE0O2VjNSbLo70=
X-Gm-Gg: ASbGncvHx8Y1a7brJPVooH9b4HELE3iz1EC/XmFac2I4LT7Pc0oXgVVz/hUN0c4+zqF
	jYK9u/eDAzp/7xoDG0yj7ox+nPgg+49z8ggqPzH//oEfvnrcm0dwNbDqpnx82KehZwA01BOfmPQ
	mSR4/6ipe/+Yf1Gxml92HXpNAcc9pkclbxp/lUWUmJV7Xa3Js4eyymHOeeijVROq03LofZdmktP
	3khMHMeaspZ8r9l1sHSMF7WN2X1AsbuQFmNdqGGE1QxUiH4EK/s5EYgN/mdonBkGW3gaB1NxaUp
	43dwV2RtGAcA40QYLLPs2w==
X-Google-Smtp-Source: AGHT+IHElfZi3i1uNBnK2xJqGFXo7qQDmANxsj6O+9wLFu70VpPDFGks7oNgpbJku7AT+TTCB0jLHA==
X-Received: by 2002:a05:6402:2346:b0:5d8:17da:dcf0 with SMTP id 4fb4d7f45d1cf-5d81e523027mr20469463a12.4.1735318677486;
        Fri, 27 Dec 2024 08:57:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v7 21/23] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Fri, 27 Dec 2024 17:56:24 +0100
Message-ID: <20241227165719.3902388-22-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085759_224531_81FE428C 
X-CRM114-Status: GOOD (  16.02  )
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation can be applied specifically to the PLLs.

The "" value for the fsl,ssc-method property is specifically intended to
specify a "no SSC" case, as in the example, when you don't want to
configure spread spectrum for one of the PLLs, thus avoiding the use of
a method that would only make sense if SSC were being set.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v7:
- List the PLLs to strictly define the setup order for each of the
  added properties
- Drop maxItems from "fsl,ssc-modfreq-hz" and "fsl,ssc-modrate-percent"
  properties
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- Improve the commit message
- change minItems from 7 to 1 for all the ssc properties added
- change maxItems from 10 to 4 for alle the ssc properties added
- update the DTS example

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

 .../bindings/clock/imx8m-clock.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index eb2e6e702de9..76040ee9cd5c 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -50,6 +50,46 @@ properties:
       along with the oscillators, are used to generate the clocks for
       the on-chip peripherals.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      The modulation techniques for each clock supporting spread
+      spectrum in this order::
+      - audio_pll1
+      - audio_pll2
+      - dram_pll
+      - video_pll
+    minItems: 1
+    maxItems: 4
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
@@ -84,6 +124,10 @@ allOf:
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
@@ -133,6 +177,9 @@ examples:
                       "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
                       "dram_pll", "video_pll";
         fsl,anatop = <&anatop>;
+        fsl,ssc-modfreq-hz = <6818>, <0>, <0>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <0>, <0>, <7>;
+        fsl,ssc-modmethod = "down-spread", "", "", "center-spread";
     };
 
   - |
-- 
2.43.0


