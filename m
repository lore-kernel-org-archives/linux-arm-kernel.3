Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44850CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftElaWDs76SxbU5UXNsnZBygKAXPkr+qMloZ0Jeef7M=; b=ieVuT86DpfYkW1B0LRdzLFqaIf
	yq9MgVJvW8wnXUki4QOHneP6/P/k2ulHhB2UxLfR9btpHatVtL2R4Hcy1veF+c4v/NbamEHvziO8S
	df0t/vHY4iGAzoJAKeidtdn3gXsmyi+x+rhlaEERJgq2ctTxuVduPq7RcBwD9jLVorByPVKrieaDU
	XqUeNvtUEbEkM+qd3AjhV1czHFmJdKY9pPiWAhuOoBSDRu81U3lUchDMKs7JnjspjbVjF7/V0WX+n
	Vsruo4p7O2v4Ba1dWCHc1O1SNOuHsfYbeSGKNmIlIL+v3MEthgqVD3qV3xNF7M7RXgqLgpTpiR8cM
	l6t5dNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod0u-0000000CZxZ-27CG;
	Wed, 20 Aug 2025 07:13:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocqY-0000000CYZz-00z3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:02:59 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afdefc9b005so10671766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755673377; x=1756278177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftElaWDs76SxbU5UXNsnZBygKAXPkr+qMloZ0Jeef7M=;
        b=i4PHMyDXcXJhB+Iv3EsWiIntSCsvDqA5KV7Xd0UgEV52+YR56eKaz041ulgwUyUTW4
         aBVy+MQOFD+wv0Gd8/UNEMm3Ue7qLhhYdOB19OqV6AljRopR/1MB1Mbov7oQU85UUm/Y
         eye4Mq5NsD4x7UD0zO7qVo7Y7lSmLdYbNuFe6NQgVs63OmVkTFUWfN9grJkBh1PWEdvu
         /QRQG1ZkHHZvKTYW8acoocigVGjrRhZ5TOMJR+mkZz4YJ38KhQEGm6v76UM3qioscE9s
         4GdUMCvOLIVQRvhGJ1w+2l7Rr/6dkfCVyQgADdNshF5qfnIJkfm1Y7TZQUycn2k1k+vx
         qTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673377; x=1756278177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftElaWDs76SxbU5UXNsnZBygKAXPkr+qMloZ0Jeef7M=;
        b=JCBMztBP1C3jA+ZPOYeZIB5npWZK6kRDnMUcU9W+x10zqmglKEBCO2bnRZGXwZCy0W
         VMoJm0uJifiH9nK8ZK5PUBoeqj1GQodAQe8qep0nCtKYw0Ug0S7U83zEOoWIh2f8quvS
         nb025YT+hmF/WuBaHp7KzT+pVr4DoKsoWwulznoGaVvengR1zS+uIzkCgNtKp1eRB4qG
         ayIDbFx5mhHX4pkuLtiH0zCy2Vy09WF81aeXWdeS6qeRwpzmkIJ+7RcfZKEWOhuQ2UI0
         mYQBWR6KL6yk0GDBL7SAguEfvSHAKElw+sF4RBmtXHgcuZy62BeGKraflrqq08cBLukx
         YLUg==
X-Forwarded-Encrypted: i=1; AJvYcCVZzVVvTCZXgqa5PQVb6R6Th0VBzCTH/e4xjDBNZNh/sp5i8ZnSALj6CiZoXgMjjk4hiQ1FPHAL06D0+CAs6+3l@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4IgmPtCHL9DXsdKQoG+i0PyvoZixdzgFyPKR9K1nMl14t8VwP
	elDBT2IyMPbrAidO8xIGR3RW4ZvGJgEalEyAZjU/J3GYq5QaocuU2YgLcpk1/VUBGPg=
X-Gm-Gg: ASbGncuBPz0PqDDKwOBV2uxgn2txVN9pOni1R0hq0z8hCfACrs0ALawIst1Xzdlu/HG
	Skl1dNBJJ13lezNqm69xMr1fAgmQf9WAATdj4YiomSpwB3oVDszZ0ZY62FLBExY3s/mPxkwxrQi
	jSSSQcF8KP46L/ZU+RHy2W1I+//PfTxMmi4IakhIj0/8ID6oNxhlANbxxPMKugMo4u5ox3NrGQt
	RsFJlM6DJZ2LZZMJ3lhVXSMZdBJXiqBzOhJRrzWiLNuMocqrDk6eKvDk2S8YSdpAvZ7eVrc4hHP
	9hrESzecoayW4O7nA69S7irmprCwzR0SHFF3bmwwtBVuRyQGRRgJYA9H0glLoM2dWiIzopaL51C
	+mQTp/8I3KTaiqLFeOqk/FCBXfnEYBAGWaMgH4ws=
X-Google-Smtp-Source: AGHT+IGzfjQq1LjJ7ggzhlchsb+Gf7jF7ybHUUX6hqr66XtQog29EL3V/Chhryj5RJeGuJiIjRa24Q==
X-Received: by 2002:a17:907:7e8b:b0:af9:3397:ee9d with SMTP id a640c23a62f3a-afdf00a8954mr69459366b.3.1755673376560;
        Wed, 20 Aug 2025 00:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf6ff14f8sm37756466b.67.2025.08.20.00.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 00:02:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 09:02:42 +0200
Subject: [PATCH 3/3] dt-bindings: display: rockchip,dw-mipi-ds: Narrow
 clocks for rockchip,rk3288-mipi-dsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v1-3-d5b2555df51f@linaro.org>
References: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HbkuPHQO9jhKV8ffqBrLXqJ13Z1bPzLyMUmFXKOeato=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopXMWpPbr64E/k0zg+O3azP2p8KtOcS4cXs8UK
 kxOJqi0BAeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKVzFgAKCRDBN2bmhouD
 13LSD/9IQvUF5G4t0gW3smruaTu9Lu+S7YS+HVDySWD1gSsXPgb4rnghh3t0QVcd9X4pv8u+5Pe
 0Z1bb/YZTTRhdte/mruSY+AWm04RLEAmMuANTR2OLJE1q3pM0NasI1i/nDME+KRbTcbY5acZCHa
 oNbxYAQ2RGTT1mzq0FrvUDbAJNP4qt1bJHr9mHceexS0ZikYyOwiJI5iMrxc3P2nhUvn/ANW2w2
 exCEVwjKr48QJUqEcAyi5obb3i+S+pjzkPHsejmoLZiXiHPbzZKboO1U7cONJO3xihpeCXHUvO+
 2feirvTp4or1YS5/oGfbNKbk4jqn3pPdRv23ELlPfNYzzzGCNm4WMk7j6/3qPzxRk1ZSFPmnmrg
 Oj7Qyc4QM0VXyWJog6Z7kCLPjLyA3/t1fisq9WlB6JHimLpAa7qAwicFwRuwDhXPg0BjPN8KP9Y
 EBy/BDqiHCvBW2C4IKBbjlBmTC4tzWnB/+YMMNG/aazNWx92d7rb6ESMtm6+Sf2dlEx9O3WXmgY
 zB3PNZvuCqDtJp/FZL+D5fdGNTXJxgT228graq/ykbqNZh2ASKYiASXdGNPUJ3cicneVwuH5mjj
 qGyOBsivQS7Q97vJ9OXlDM5nv6DOtOleVnlRnlKv3/G3W1XCAEzbYLiMqDrOHGA2yr+tUBCyDWe
 b8FF+yr43g/UALA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_000258_068520_20A37EDE 
X-CRM114-Status: UNSURE (   9.35  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


