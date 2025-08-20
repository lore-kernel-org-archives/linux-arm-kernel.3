Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC11CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URpbi4pDupU0ar37Ye27L+XUpBCcJFcEEzJPkVZbTwU=; b=i5EgMUeSxFsei0hqoWYYNCOP8m
	OvSD761oRsiN0Z+0cPToD77MxL3XSOYa/MrAsn4z2wSXJ7zTFYbAo8dxkNkBl+npVXga1Xq3+1C9u
	OcQ4AKqvY3HjMdYSkX8quzqcyGIKxStnTryVV8d7HXkrIK7kLb4V5PKLv+1MSR5Bng+R+QW2ucRBB
	kYBMaQhUyHCt7nY4su9Lrup+DgU9r6rt5Vcy2eD7YobcrflfSrQ7ASG1A2UBTZagpggs/unNmQBEz
	3fraBNFwjg3zEePfqKtwS63Cjf6iwEbKmOaSoBHiDweUBpnXuR+G/bByzSRu4mmrbETvNKab3sWOf
	t80Dye4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolHb-0000000EKw3-2P6e;
	Wed, 20 Aug 2025 16:03:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojdS-0000000Dzvz-0W1p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:17:56 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6188b657548so884368a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755699472; x=1756304272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URpbi4pDupU0ar37Ye27L+XUpBCcJFcEEzJPkVZbTwU=;
        b=qJGNsdFawwtsdmnhPOmO6Eki97+hT77mWBOyrIEapqUEtYF0uJ/PhD+gr3Zvruxbpv
         5XHuViglzumrsg6/qaCoenXTvdKZi2uBGLBqfjo4WCy/FWVAl0ZTLNuaOwmHzYLu9vtu
         kRGuS69O1HHNPagb0gYQoDi43qycYI07/fDKs8cF85LNnECokBpdkAp1WHdrEgLisRax
         Bu+cl/SA2hATIMMkiDSeMl9cJTpTMDeq5VBujmLAgm0deavstCyIola5J/4ie0/DMD2J
         gtjiIbSgKSChgn4pb7wiBcUdB6fGXGbNixC4/PZ+AqiPb5viluz1aC6fM5M5i/CuT7Lt
         fLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755699472; x=1756304272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URpbi4pDupU0ar37Ye27L+XUpBCcJFcEEzJPkVZbTwU=;
        b=XPIjZTbrUZV6IFuDhyoj0sEzRIbcaZaHG2nx3YSKgmyFCUrI+a87DLis/e4hhlAgZH
         pYVbktFwq0hILHbHMoPROASUzrrON+0oYXdt0WCBR4bbWFhqga0ICAkFuTAwppkC3ZLX
         KV+ONwJasadN2hAFy6y86F5Et/hD1VHtz/ROiZXZRgG+UAV9psHFJa+zRiKfVU9ZOw8r
         +oBsxIsvtKyhE2uARod1WE9ZEG8n204DpNyX65gcxVDTeSEVn5qWt+FPe3V4QGFRYWfd
         6eLuFKeO7YKxXKvFU6RL7GSIWdqNuKBIJZ5Qx3FklCMSGjpvw03T4l/0tJ4PYoos+tnZ
         SWiA==
X-Forwarded-Encrypted: i=1; AJvYcCWdwKzp2IwHgofeOfOZvZLEgW/JLNkxSFRdv3PYEzsdLkzc24WkayhPqxJ2zWGYxrgBAJmf5Jn6W5bPBkCiLyOs@lists.infradead.org
X-Gm-Message-State: AOJu0YzepB9XVUPt2Cp57UdzvYUOChxyMCtpM47Zu3Oe9Y5jSeBT73Za
	4Huiif3uomssJe9+b9puipeq7wesPMw+lZyhIO/VvC3ZDc0k51g3TTevSz3R5HB9PWc=
X-Gm-Gg: ASbGnctr8lTO9NJ7u3Pt9anF/9dRPmVwpI4a0FCKI+9E7WMfThtTsWDEpNLWL9fadhV
	j3S26QAg0qJydhG8hrvjCd22A7AlPD1qM3wGT7Ttat7of21GgTBdeRU12/31HeXg1iCHxrJ5WXS
	N6B0xke2OpNa9MeICfOYtnOi2EO+fzsAEk1UfZVvw8EEtKf1FbShQTVAj/RVlTFHCaVqJ77HssE
	qomeyEoAOy0qtHEEfGGi46orPiwybSmPpTC9P36JXOltlz7FdihBiOeFgsLNaqOly1qwX1IeI3/
	vC2at1BZE9ufKVXhXtNj8kYhczu1H5b9l624rOJzZPkcYw5fR1Zx/vnmffbIkio045EEfA7MqZ8
	gpTF3g6eHlrPQWxxywIqt+eW5Lp4g0JAyYikp8H8=
X-Google-Smtp-Source: AGHT+IES/Jpr2bblhYPYlVvqT4FUQdP5A1r73/aT+walwE4It2pGENTB8ZRS/pZIeQZcjJUqlIBmrw==
X-Received: by 2002:a05:6402:3553:b0:618:227b:8848 with SMTP id 4fb4d7f45d1cf-61a978521f9mr1217721a12.7.1755699472423;
        Wed, 20 Aug 2025 07:17:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:17:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 16:17:38 +0200
Subject: [PATCH v2 3/3] dt-bindings: display: rockchip,dw-mipi-dsi: Narrow
 clocks for rockchip,rk3288-mipi-dsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v2-3-91e2ccba3d4e@linaro.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/izB6gBIA3K/m3qcFUJBSak3FLjzHZUWp+/J02pD0ac=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkHcAbOwcQtqQgqj7ZYeVzJwPpe0IzMwnRAd
 uYCfwZnO0CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBwAKCRDBN2bmhouD
 1wg0D/9GLhAD7MQiXQ7UofV+rdMNcDfh8bSRGHzYgh0CW1ZfMD8B+RvKKD4E95jNLL9hAuECz0v
 ovPUq9BoXz/WW6WfgIobTk3angg8dY30rG59XdQGmsdxouZ8s7Hbn94Or3nan3LLC0CChJqBAPA
 5fSzIQMsm1rZ6cfIP/ZF22ZEHF11eMcK/bRE3Jg6+6aZbFhVQ94X0AWHhY3OezSwClM148lwnLW
 oiPop0xxBGVJqNegBJFeL3HbnVHj47geT53xq5Cg5FW7wD18sjwX1r4RutWrR2rs1E+W2W93L8P
 6zlsOQBGAG2dH4kd2NkeVGbnembzaE9TAe9eb5p3QhEafEJVo8N3E29cGqQMtr1+cu2NWckPgVq
 HuLtBwuUaYsrSKbbPc8yrLiJPcvuSKycZtoI8EoH45A/slz+8NYm+K14kDejdLFt7vRC6Y4z8yG
 Ef59nXFgGEj1IssG80ofef1C2dm8c7i6WfQvH7pMj6oiBuqGfsu7yoPTw8TIStF6jGTJMYfVc8r
 6bzMS5NlISJSmvIbMphzbZ6Rs3n6ZqyMKZzOglCbIxEYm1h1DlGO10auQm10ib6/zVrfA/pfSIa
 w1yzKXXO8Syn+jtNF1y5a44WKVMe+xSKydRTpiFZP+1+J+nToDDVLKFJwR9J8Qzh+s5FQhs9Nwl
 veFTqiQi3OAnk7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_071754_170026_F4362C4C 
X-CRM114-Status: UNSURE (   9.86  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The binding allows in top-level from one to four clocks and each variant
narrows the choice, but rockchip,rk3288-mipi-dsi missed the minItems.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix subject typo
2. Rb tag
---
 .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index 0881e82deb1105e4f92843380c0183569f688f08..c59df3c1a3f78ae0d345dc725f4dfb3eedb3de22 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -97,9 +97,11 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 2
           maxItems: 2
 
         clock-names:
+          minItems: 2
           maxItems: 2
 
   - if:

-- 
2.48.1


