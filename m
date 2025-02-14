Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204EEC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SN17xyUHz5n1nI2jntlMqElymOw1Oz4qivFLENPhRDs=; b=DKASj/F6c1/p8StQ/JyATHpE07
	CUEmVV1c2qkAoPeX4hQf7FmzN4Qo1PVEVoejHUdrmEPtI6P85w0J0J9Mvt0uWC40caO6kWTk1rg87
	m4fFL61ZEDJPf46d9VOUCOq/A4m6C6mCVPP6KJewOcZkbt8d8ILlRwdo9sexKkWNlMDUmxY33QP57
	cr3ljMyLMIs24TCwaHz/Ad5lRFZAEA5kC7lpNu73470db1om8ZKlgHdfLD8o4dxsYLpDnxVZ8nxMP
	l41KRTde6TjmhAPq0GqryOF7WFrxyN2xMn9XkowDYA3LKaRcVLAkOBo1Mqwot3ML2WeFOmnim5Zel
	69xEfJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tillC-0000000DOur-0F1x;
	Fri, 14 Feb 2025 02:48:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tilD6-0000000DJWo-394c;
	Fri, 14 Feb 2025 02:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69EA75C5D48;
	Fri, 14 Feb 2025 02:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55A06C4CEE5;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739499223;
	bh=J1c0zfW3w2qqbwBk6grELOoOJWOzilKRY8yWea8SsbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DtcUWs2DuPlCTCSNl34WF6fUcKJD1Ami9nRaNqnHRHCDcVASDEBZcr2pWt4DfV4ev
	 uxXcaBcqxmJPG2QoL8xUOlyhtvxtgdhzwUCqD6Dztdt0CH4+mN5MVLbeMcCR7kuEqs
	 bHTdHV3Xqn6tPr/cZZHIW9yc3tyiKODMK60f5DhN/3EVz+xPQomZmRJn5jGOo6aK/X
	 bdU99JrIqt3M3XS7QVxaDmjPzsBMBWKnHiA2entsdniAJRY6nDYIf9gofvKxwiVR9v
	 0ga0RAvLuPHZtChs/oYrzWEXuagd0P0RCxsidAz652fBacoARP0wwSJaufFMU3wIoL
	 PbV83ERgCcV0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BDEC021A4;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 14 Feb 2025 10:13:40 +0800
Subject: [PATCH v2 1/5] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad for s4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-audio_drvier-v2-1-37881fa37c9e@amlogic.com>
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
In-Reply-To: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739499221; l=2710;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=TXC0nl0bF7ijEJ/f38+2QuSrF8LeB5NHcRgGAcnuK24=;
 b=hAMjhlWqZaRMxN531Yg+WGONAd/WY5kKkSD06NC7KGnMbzlciO0K80ublViD+xrTkfXqM8JwG
 p75Eq0MFLDoDJKe4Vm/Wx/FTn0L6cGgslDabJaKnkzKXY/41ZfN7WYd
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_181344_916344_4123CBD1 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: jiebing chen <jiebing.chen@amlogic.com>

add the s4 audio power domain, add the mclk pad, sclk pad
and lrclk pad clock id for s4

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++++
 include/dt-bindings/clock/axg-audio-clkc.h             | 11 +++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4ceab82389167079c2258a9acff51a76..364783c6f7572b09d57de2b35d33adb7bcf7db18 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -21,6 +21,7 @@ properties:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
       - amlogic,sm1-audio-clkc
+      - amlogic,s4-audio-clkc
 
   '#clock-cells':
     const: 1
@@ -100,6 +101,9 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    description: audio controller power
+
 required:
   - compatible
   - '#clock-cells'
@@ -116,12 +120,26 @@ allOf:
             enum:
               - amlogic,g12a-audio-clkc
               - amlogic,sm1-audio-clkc
+              - amlogic,s4-audio-clkc
     then:
       required:
         - '#reset-cells'
     else:
       properties:
         '#reset-cells': false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+
+    else:
+      properties:
+        power-domains: false
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index 607f23b83fa7287fe0403682ebf827e2df26a1ce..75dde05343d1fa74304ee21c9ec0541a8f51b15e 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -162,5 +162,16 @@
 #define AUD_CLKID_EARCRX_DMAC_SEL	182
 #define AUD_CLKID_EARCRX_DMAC_DIV	183
 #define AUD_CLKID_EARCRX_DMAC		184
+#define AUD_CLKID_TDM_MCLK_PAD0_SEL     185
+#define AUD_CLKID_TDM_MCLK_PAD1_SEL     186
+#define AUD_CLKID_TDM_MCLK_PAD0_DIV     187
+#define AUD_CLKID_TDM_MCLK_PAD1_DIV     188
+#define AUD_CLKID_TDM_MCLK_PAD2         189
+#define AUD_CLKID_TDM_MCLK_PAD2_SEL     190
+#define AUD_CLKID_TDM_MCLK_PAD2_DIV     191
+#define AUD_CLKID_TDM_SCLK_PAD3		192
+#define AUD_CLKID_TDM_SCLK_PAD4		193
+#define AUD_CLKID_TDM_LRCLK_PAD3	194
+#define AUD_CLKID_TDM_LRCLK_PAD4	195
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */

-- 
2.43.0



