Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DA4C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXOt2DStfgxzjFuE8T9ZB+qgm2XwGSAXjcE/H4FasAs=; b=dqYowUIWFhPdtA31NiY/zIqIOP
	J88H1EAc1RFAcNdQzTg4+nlWQPR+HAhswjkVoN+WFNccjz3XTMKdOl++Qe9wjkkmFRRvIMfkQtBhm
	t/ktHSE98Mj/aDQkhqtTm/nWUZh8SsqcNzSc/SEEh2NfozYI1eqFwkMzbhPWWdtiseZvaFfPs5FQH
	4KopBCLT/T/FpltBQk0ML9MgdsfbQaEevR21swHTN3SZqZj0sYgMEJV5MGEUdUPu3VAtwxb8vaZHA
	aPlTteA5hJMaRXHaKYZ5veEdBF0gx7ADMhaRVTegZNQpXyEgltc8GgBI/o/g63x+R0kWTNw4YRV26
	d8/fGmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8TN-00000002Qa2-46X6;
	Sat, 18 Jan 2025 13:02:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88e-00000002NGH-1amZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so4562995a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204079; x=1737808879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXOt2DStfgxzjFuE8T9ZB+qgm2XwGSAXjcE/H4FasAs=;
        b=jBTCvXHdY3k1IibVwOZASbSlYDiJbkFWKrSVPFOdAkqoT6wPziyzzmrGr3/oL44Ub+
         IsWWe6OrQQ4SUpCRHaVMOCWnuoIrgHwwiYU79y0PfWefSs6rsUHD22Db5it2yo+l6yFi
         JHyJCo0WwZX1SKiLVsmmWYVLqiwjcoUNmkb7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204079; x=1737808879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXOt2DStfgxzjFuE8T9ZB+qgm2XwGSAXjcE/H4FasAs=;
        b=oRZPO2ciLzzQkTI8WzCjALnUk6fHFTXNkUQT5xNk+mvXTIMj4T6EzIttP3IQLGDRVe
         ZSM5RfplWJrevUbPrMrL/tFvDdgs07bjP2Kbt6VK9pyhUKUNo2OrEbxM7jc3A9+Zqt1H
         JnazjgmZN+KOXRdf6g6riJfZT6Ll9UvCpoU5qDQGO4gAzl/Dp7pVheL1f6zNdy1WOxOp
         zNZ9mTe86ASRE5MlusTyX3QADfRbT3GMT8w7ZcD/CyH4J1U5nkHDdDuTdo8wsJoMIl28
         S01CEDJlZysb+aaxfOWVah6NXRz1nO6dc5nPIKvU66RWNaDPeJ0O9BdbZZAGhz74p6kN
         5luQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfpTP8J5zgZew4HAvkJSCT//VoOwwL9QalDm3LYk7eEcBUfro6cflFIEE/zkPu1teT3+xad1R4LDZVkWNTFzdH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh6j5bBcxBWHDD+1eiJY0VHPEO3JLErwnYDBV8uA/7B/BWf9bS
	P7h3S+6i2mt7aLBTocIv0vWA0tkhV9cu6yq2Kd6aLZHD4TuZ29d9SGN+UpTGjNE=
X-Gm-Gg: ASbGncv5J4y8Vo5csWskBIcpg4MTmpqGbbIUlzKK+8OZLDTHqTqri8u2d0XnZERgqvS
	iAUCpWHjUcVehpUvjgrNks3/Z2DjtzRdwoflTQ16zwzltE7ydshCHq39TwtSdpn12poXpqd5+zW
	kOTNBovWDmIwyH3nETXQB2Jkyermzk9ODdKMQAg8KGgMrB6kAzoIJpkhlw9QCP9RJLnm0J9AM0G
	d4t8rnW0qxwVdLRyWZ6HVgDUPK0dseSVtOQQBAEO944JJbpainNhIPlcjzPNvCcs82qKF4HbJgv
	0raFYYP1EVTeAXGXkHE9C8tUu0xGlvL9YZWo75Ptmls/Ge0qotassnL39PSjLwAVA9jIT8tUzRe
	6SPWltb2xDYi9vFTz+Y/XzgKsUKdI376dSFCR
X-Google-Smtp-Source: AGHT+IEGWBFQCcPRpsGYAMeB7nEf4t2kqxNBUWYNEEALNt45EQbT5cmxoYvaE5QDjvNCrevmdUBs3Q==
X-Received: by 2002:a17:907:7fa8:b0:ab3:875f:a246 with SMTP id a640c23a62f3a-ab38b0b68c7mr643475766b.7.1737204078976;
        Sat, 18 Jan 2025 04:41:18 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:18 -0800 (PST)
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
Subject: [PATCH v9 16/23] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Sat, 18 Jan 2025 13:39:59 +0100
Message-ID: <20250118124044.157308-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044120_416147_C2DD0342 
X-CRM114-Status: GOOD (  15.94  )
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

(no changes since v7)

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
index d96570bf60dc..d347d630764a 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,46 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
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
@@ -76,6 +116,10 @@ allOf:
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
@@ -124,6 +168,9 @@ examples:
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
                       "dram_pll", "video_pll";
+        fsl,ssc-modfreq-hz = <6818>, <0>, <0>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <0>, <0>, <7>;
+        fsl,ssc-modmethod = "down-spread", "", "", "center-spread";
     };
 
   - |
-- 
2.43.0


