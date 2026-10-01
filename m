Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003FFCA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojl2W7T3yKD9ARXzuM1thSb0JncbAdcUVHPn+qvV/1M=; b=m4vHfcGuXCKp5hL29UpcxTcOEp
	YF2FWR5ICip3NFbm+2uQgL/U4agq5nkafDIChApPik/MCTFNyMWXh+/UYvJgrdOytasaeLDpMO10I
	V/gL3Yk2auuyUHv08X4x+oJLrM5B/Zyhu1lVExd/VJEgfjpWOAaLtoN/ut2T0qgjJqld4njF9bMhF
	hRAxVj7S1slBp5kCr6y4KmBbEKPlR3JNWqldmMBd/Pely8cXRUppEvPjB9t4gGCc3YdpDOT+INjuX
	v5+ree/zdBoZ8NUASeAzTLmwCcEXeUUPdGe8ph2iSs1P4ZO8s0WnMjEn3LGeJ2Zv3rCV0ppELBrcD
	BK3leNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIz-00000009dpm-2pXg;
	Thu, 01 Oct 2026 16:06:45 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIt-00000009dkO-2HPM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:43 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso26083585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870798; x=1791475598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojl2W7T3yKD9ARXzuM1thSb0JncbAdcUVHPn+qvV/1M=;
        b=bfxe8gtZVVvVyegZj9M6Z9iDR8jnyJtAG65z+emouvYPCEHVl72qCy2lesDkS8TUqH
         YyyeyMYul3vW6sHUqhoZW9jWRnMfUn8dueGnhle7GbWSo4vlALGxW7029CGN8C4ygvLY
         QCtGiUFnXBdK5PPQ/sLKTCU5BCeHcyeSaZh5AP2U7VIhupEgxXIHO5/25TOIyLljYm1a
         H7iiEaJRoNEV67rrIkH2St9BWpyJuHqlAtgUr+3ab7yEQEv0tJ5QJgokQlQL7TLNGDqN
         nVaTCd2n28n8Z5BmpzDwCOM7sE3VP4hLe/5Fvwt/T/NMqxFfwf7JHtARNNC7KinwY2Sg
         ZQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870798; x=1791475598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojl2W7T3yKD9ARXzuM1thSb0JncbAdcUVHPn+qvV/1M=;
        b=tZTAXti2Sev5ZGYXyQPi14UKqz0wsx9hpxZw3gy6WL2CiXQ1mTAPMuq0lHDq/K3Ttr
         OgbV2JrPCp179kRllXqtdWAYx+4Fwlcz3ZxLYYJF5Uq2g1ZNXtdNt3JeG903FB0R9PP4
         7w9/wtrVkn+SvQubo2TNA1YTlBLnXKyMPrX5usmxJ8D+VDlMAE7ZMPW+I2QXumthycp9
         cuB/Yumh3enfZHhUyZz+Wm3ERRrDLEJsOp7eNZqFs7wItiI2mMjJzB3faLZ/qfP/YgJC
         CseKDOzKP8p2e0zt2qNzD+p784Tyd4HRDo2+KtQ0d6ByTtM689To9Jtq98XqAZdjo7+E
         wqTA==
X-Forwarded-Encrypted: i=1; AKwUvBwJuIoaK6t8FWo90kKxxVtZhx5oolFqk84gfPdP8YSta+eb5vv1s4gLkaPo/fhHRVxzsh/3IE7PjW//q27Gt9i8@lists.infradead.org
X-Gm-Message-State: AFuF++lgVvcgjhVKDnSU67M8puUXBsHHgQOzKiUQXcUfzBnZubpg21hj
	nvL9QUt0YTiGwCMM4+l4+lCEhPvgVAqo8CJzP+tNEtMJfyo4XksldtM38HbF+xx7JmNwx+OPZlm
	EOTZue/k=
X-Gm-Gg: AYBFou2V/sIVGrWpUMFTGZGSAV101wYBRogY/Y6a6WILi+SivyLS5u47+NwwmFbaHWK
	9HfcXLkKof/32fyCfd3J1wzegHbx+WijXTzhnzVtESJMQ+XezGTrbG4CWLfYy8mUtovB9ekBHz6
	jgD0QTDO150Xzejp2Ru6GF9GxSeO6qgqYY6MejGejOBUOlH5Ql8Tn3rSKJ/BYbWrhq0Pi08TgB3
	IKEF4To9R3AghcTicThAdfNVVkGChpDFmGI2aUcnPItj6FiNBpuuDfOLhpT2GsLGc/vAOWecla3
	JrMXbqsPFv50RZwez3KPZ0SjSKwvbCkZJShErCpfqvJbUJ9VBvmyWX7B/2v0mVZbc6lnCpGTzIR
	wQHgiRuMQspId40bMkbqJLlPPRiL6JPWK7vWSPmGpEL9xbUQfRtJ0dKhd21LUUmIbXi9Th7en66
	QT81QwmA9z5RRMNxkIOOvd3Odo5kN1eMcEWnWI215ZA1tXmvLYd75u1lV6cHXXP7vg
X-Received: by 2002:a05:600c:4e0a:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a0276bfaaamr1412195e9.17.1790870797933;
        Thu, 01 Oct 2026 09:06:37 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:26 +0200
Subject: [PATCH v4 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-1-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=WgAh06pTErBsg1r/NbbofMqPA2B5H76POkIEZ1f1w4w=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrlm/60069aWmXbZJP+L/Ppv5RfXibQmLRd+ZLU1b
 hFzieypjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzE8wXDT8Z3+u5l4hHrfMrm
 n9V7bVQTHXlLfMIzD+ZU4Z0FWqkeHIwMF1u9YyzD1kxtfiE1aW1j4EFljTmfXx9REo2tNxN6cbC
 IEQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090639_640492_27AF95A8 
X-CRM114-Status: GOOD (  13.93  )
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

AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.

The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
added so that differences can be handled later if any are found.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
new file mode 100644
index 000000000000..4df4796623ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXBB AUDIN audio input controller
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,gxbb-audin
+      - items:
+          - const: amlogic,gxl-audin
+          - const: amlogic,gxbb-audin
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,gxbb-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3


