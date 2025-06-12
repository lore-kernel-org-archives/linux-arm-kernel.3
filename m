Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB1AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=; b=ZnIietSy8nmN3uFSbV+2VMEKgb
	Vl91u2/ob+9cKeHbXWcLr6lAu4l/vGD3SpBSOoMbKa30kYpVNQvjALk75k29DfifgMk7HEJna8kI9
	sb0nfThCGP11HPyHVAEnSg4BS34ldON/KOe2Rmg912BF02n5W8vK++jJBIFFwijEuOli6MD7EuoE1
	Jen4pTaBIc5cXMszdEQ6vumBhOwKVdJ5mS9kTn6f2BlL+f0P9vWuq1Abb/vB85AoXL2eB0BmZ4lZD
	/Tcj8HRw4tl0EtX5aCtpFWSxOH+DxjQvzWgQ7eX9RdeFNUvnPQCBHeNDDc3yTClYYp1Xrtu0ZEWBu
	qg4i/5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd8d-0000000Camg-3qFL;
	Thu, 12 Jun 2025 08:18:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcga-0000000CVP2-4Bay
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2352400344aso6198405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714560; x=1750319360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=iFD398+4bC9CKLCv3cunN1nEwZEZRjt7VkyLWEoCj7qVAD/FdOiD9UABTWAfk3JaKh
         kO7ZFWTzYN+LbE0XTPZx04gIBvh63hOpEgPl9gXqKrl0urkheMheO0eDWanZlhxcJdOS
         EOAf6GtfOs0HsBb0bPUsEyuHXSzRkNzfeLB5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714560; x=1750319360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=vQhjL+b+nfdVj+CTy4eK+g9ZgBOPDAOmLrYgzuU/3cLazdwUT/PhYNfVY7MZOU2Uju
         Jitw0OY6PZFhEoMIzyqKI3fpY+p0oiNOSswS92j3cXwJL67Yn3trsQCr6n9leG+cvn/g
         xBF9InS0i98fTS1zpZpXCBsB/qUHcFFJ5CUTxQkpQogNDWkkRLMDLIVnZJJJc5MqnJSI
         PCDiMKS3ZT8hz+CNXGln2J6/i4nLQj8+x0EYCmm0//3WqMKUf2LIXYSDL5UkQ0nIMst9
         wirGXuOxJ1FP4t5SmpCEIM5HBXFqbtO5vnAiT9PL+AXCOttVbi4Til9kApeqZefzdmdB
         UwXg==
X-Forwarded-Encrypted: i=1; AJvYcCWO+ZVibVFiLo2PrlvZmDwB/Dln3f3SqDvzIy5ouCV7GfwZOzjjt7iRJgFO8SnDDtBtdQS8spXtX/j1H+iuIl+R@lists.infradead.org
X-Gm-Message-State: AOJu0YxsnpkglK1+Lu59Z9DQjC0Zejdpj/kEiqcm9vi8nbjL/MTMTJND
	J9IbsT6WX6SH00tWxxq8Lmi3EeXnNBJMY/RBaM35nDSwT6IghLXufGKpAyo/f2tz3w==
X-Gm-Gg: ASbGncvuWz+Uyv8zEUNwkLHMqRTE4tl1cqSg/iv0nslXPtpkbRJic26cW0/p4IhYAMm
	GWtLkqumDRnfXKbCTD0jCuXrzI7I8PJ7LgU3xcjKuHI8c1R/NiZY5H0KVDT1DYvtoDAmtRIsT7v
	YWmmdmBGunKsGooOvxGftR/1O+Vr9AIqkpNGGiAtgrMmf6PFndAKujCtedAKYTMr2WXeUr5XDhx
	dunpPyUPs0qe9K2bjUS3sWvt1YtI7SgqaEkdy7m2SO5Ijh+BhSDo4P5EBV3wvuIzNdaNxJAy6RK
	1LT5/wkM1Cxt8lmZ1D8SblSh3CLHI6xlRRSlp4cp8JAts73lkODMlKBXOEX4uXOR/V7LBaZ3tgv
	xb/E=
X-Google-Smtp-Source: AGHT+IFaK/aSeTPU1FVSUiJwy75RRBlflMYnV4oLKYPHyMqt0+SId2lcqzKkgBqwPYhNLtKoxyy+Ag==
X-Received: by 2002:a17:902:d60d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23641b28de4mr102187465ad.36.1749714560273;
        Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
Date: Thu, 12 Jun 2025 15:48:53 +0800
Message-ID: <20250612074901.4023253-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004921_034218_C68FDDDE 
X-CRM114-Status: GOOD (  10.64  )
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

The audio subsystem sits under a controllable power domain.

Add it to the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index a95215ba6361..666408d32f5c 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -45,12 +45,16 @@ properties:
       - const: i2s3_m
       - const: i2s3_b
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -59,11 +63,13 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     mt8173-afe-pcm@11220000 {
         compatible = "mediatek,mt8173-afe-pcm";
         reg = <0x11220000 0x1000>;
         interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_AUDIO>;
         clocks = <&infracfg CLK_INFRA_AUDIO>,
                  <&topckgen CLK_TOP_AUDIO_SEL>,
                  <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-- 
2.50.0.rc1.591.g9c95f17f64-goog


