Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE86C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cOgPHAoL12m9EBozXzMPJw28vDXvvK81+CTquR3Aqw=; b=OzQNOhC9jHtilj/PCh6BSWQhZl
	cjjjYPBGo82y+SmEOYnldhiAslLfBfta4py57u5+16TAQXlM5Eli4GWWA4prxHCbe5EtkwPhu3tKi
	GUWsRBSpIDKAmQcDi8X90kKy2yoYdNL0aK+v6DjFI5lgZjTKgW+Ap4W2FtRbqtZOQXUh/kA7W3z/6
	9Q6qAkIVG34+wC90QZDrKXrzdY4hiW40b6gZU0kCaMRQZ3MNL5xtetnlo8FCPzIHDfCfzoroUFCKt
	MvefrlT0Uds8kJrWBKRdMvgsbZP8STGD4C6Bx29EoM0oLJ2129zMy809MrZhkzULhZFCz4Zbq5jVp
	hfPE8K3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzRW-0000000H4Ld-0pKK;
	Sat, 08 Mar 2025 19:02:38 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1Q-0000000H0Re-32g9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abbb12bea54so553858466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458939; x=1742063739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cOgPHAoL12m9EBozXzMPJw28vDXvvK81+CTquR3Aqw=;
        b=d13YdlY73yguvJQgJQ6aSoZmmBuyYAo/DiBCjVWS1obTHZ6wdcFJ+6A/e+l6Ijz/gU
         5CLaOO/M5IXWG+cv2jUwdTCRAs4EUiXKGV13aG0PPMdqlmqE+ZAW0Qp7K5FHMlA83LMs
         uPR74SsPNDIUdMeVYkxRgBrfUOhQW0iljQ3KG65k2BXhXG9wkffMw6C2TFlEoQ/qZiiG
         RtCDDQb4FSCtrocqED3QE5aIKtT5mX1NprXbHJdfOkGb4kBXgfPRGevlAaUvVRDNfWJc
         J1P/kWD28btQlI/bNaTZK8uoPFGxwfmbP6WXThaZdMyV4MSaA+/LbJca51fSP2a+3l4I
         jymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458939; x=1742063739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cOgPHAoL12m9EBozXzMPJw28vDXvvK81+CTquR3Aqw=;
        b=JqCBVkdk8VfEFLyeJd1RzbhtUSHEGvGk4XHIoMHnJGAVDePab81k/khxTCYNqtc+1X
         BPJAs9tb3i6BvHGNsjH8HLp1jjhg0EMLjnc+isvX4Oo2GpHI5bXMjBfL1Cgr/KZtBNzf
         1o/Iap9PxrSivtUa6tvFfSzifEvnek+T7jB0A4yeu58SIbxQrElOr8kU2TAflskG0+E2
         npBt1Lwse1oQHUUZZcWlleyyjOkIesKKyYT1t4YqJLfAATa+kq2QRv0h984+1UzYWbMB
         OSibtFP+X9EdcMcb1SBP46AQJuYfIBSjo2LZirw+OTV4hl4GC4MEoCEbG4cdO9gDddXb
         HjgA==
X-Forwarded-Encrypted: i=1; AJvYcCXsQy/SHJpIuVxLTDM5HOvjFUfIouI74tegyAvavA+e7pnr5J9d7jqEEAfd/4OI8DF2GHtbk4oMAcTBYW4ay0aR@lists.infradead.org
X-Gm-Message-State: AOJu0YzDXRkwNEqWJqO8bPKWLnWFM26+98ClmR7/sQUOMZxAxTWRG1NS
	miMxVG9Qvom31KZDOZl98WHqJHgrB3OLykB/b0oGBl3Oy8DaI2vk
X-Gm-Gg: ASbGncvI2+Jzdheg0YA1bjXH9+IsFaz6hmEY2v+Wk1ndyLFmvjzEnNjFFuU2MZM1Xtd
	2Nhw111tZ086CSJnMdhsqVz+CZPw+LBXDOMsAu3a+++JNvhmQIhKsIa0J+ISdNTrelFDMVlVPP7
	R/UDf2dheKN+XIt0F8frfeWJBBB1irj3oCSH0kV3jSofKaqyDx5zUbfqV+LZkJSvawbtXK+3i6U
	0U/GMaRc8GtPcxZXRqGzYvNLf7h5hjF6iA76J53/+dxTCqFXxDZ0hhkofaf+JYhOYlhN96xIcRC
	g0w3ZBz7F+Ne6M0TZerWc104DYtkL8cbjCT3UXdowa4EtZu6pcmVsNRFMQ==
X-Google-Smtp-Source: AGHT+IHcPwKF5eB7VgOS8H61Ng0ywU+slTryB/Bsve8lxLP4Zc7Uc+Ntz4kGcsZJIup2zLzGgH7gHw==
X-Received: by 2002:a17:906:5ac8:b0:ac2:7a6d:c918 with SMTP id a640c23a62f3a-ac27a6dd696mr229761566b.57.1741458939203;
        Sat, 08 Mar 2025 10:35:39 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:38 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 16/24] dt-bindings: media: i2c: max96712: use pattern properties for input ports
Date: Sat,  8 Mar 2025 20:33:45 +0200
Message-ID: <20250308183410.3013996-17-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103540_776532_6D63FFBD 
X-CRM114-Status: GOOD (  11.33  )
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

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml     | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..148d196b9acc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,22 +40,10 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      port@[0-3]:
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
+        description: GMSL Input port
 
       port@4:
         $ref: /schemas/graph.yaml#/$defs/port-base
-- 
2.48.1


