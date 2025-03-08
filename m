Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295E6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQJEYnQvhExzx8TDjhGPNTh+RNL1iu0t7DvSRmmSgXI=; b=Fe4JdYIYMaJmBr5XmiWep4Ai/t
	c2M0gh67ASw7hdeF3oPYu0m2l6WpOeUdSMLiHwKXP4nlQ1p0W0t4Dwtc/NMZMlXZqn/KGgEsOlzW1
	3t3LlVW8doTeasWZTHQfMtD/gf3SHp8py0YthBmHld6GdKTxIur6OYIhie9xnS9a7ut3SdyO9QstW
	rCJh4f6ARzAqEPRnsWiFlAZgcNk1ALjpw74khkGKCPXDbnfVHiaQr1YfPxJOAEkTKVo+Qr/qku1JP
	2ObLHGLjKw+QaZnBDcO4VJs0f0A+Ny7pkXwT+GnW0nLN3MGbVcqHll1TtsftwEIcG1zyBawS5Cswd
	U4e2PJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz6m-0000000H1fW-1M1a;
	Sat, 08 Mar 2025 18:41:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0T-0000000H08M-45AG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abf6f3b836aso455487966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458880; x=1742063680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQJEYnQvhExzx8TDjhGPNTh+RNL1iu0t7DvSRmmSgXI=;
        b=k9MtXtHNWk0T9cvvmbsyfJHZMmQg4VDSlS0HGQ3nXAgHtnpv35mjbPUAh3t8gIBVsr
         ccxB4i0Wk9acHn3Lut390TRvZ5sfhoxYeMXPyKAWy7pX4QCgdORHQx8fsVSJSlafrH1j
         fqb8uy4E8PNGfzcmvAROja+DLxG1zZD+keN9czOuCtxNWbG0E6964jqlX1FgNu+ONZ8R
         RiKCjutZ7JFu72TukuV3PgbiaN7xkSXpc6qP/AsLcBvrfISCSv59ZgNfFRNcRYlRQV1d
         nhkSFvCC86qQ8rNmM0c60gtmqke4RTIc4cYjxeAk/hizxr9X5tUiCK/8sVIcpWlzVq2s
         JzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458880; x=1742063680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQJEYnQvhExzx8TDjhGPNTh+RNL1iu0t7DvSRmmSgXI=;
        b=M7o7fVlJScoJlTghX/Yw2hNKgo53LpVYjouRN2JTgtXY1nsJJuDX1BPKxNg5Dvc8+G
         2wUhwqGSOP2myt5eIDfU1WVT5Azeh8XcRmbtT9Vq6jT3a5/p1uzaGLgYGpfepsZevfZj
         ocPt/45asDllFDo/zPzrne4GR5wIIz45Mmysb7W+X5luz6Bng+4DQELCpR+gvIyR42XW
         mJ3N7vKdxltBJPACxw8Z330wJIgKGo+7eHTF/2YOnacLlJA45ZRTHGz8CwK+oEay8LBh
         jYQiTTO3NYdRjFDPhkdF6ACp91C2n/Y6bC1LDM0py24xgpnW38EWLejliS71GQY3ijAZ
         +bTg==
X-Forwarded-Encrypted: i=1; AJvYcCUd2lAvzmwUwmzfD08fFG3NnczCgR80hxaV33QKj2e+glDChHYK+0kb5Ply3teu9oLslz/mTYHx+9mVlMCoBz2O@lists.infradead.org
X-Gm-Message-State: AOJu0YzbOgkovhZqd0OhN4KI6JjmjVEvOBAnAlDURDVWrb6TtorNTKh7
	vd5hiH7ZgYbPugWmLUG36xfT7dO/++HfFn4MojX7IwiFJzbKYyOG
X-Gm-Gg: ASbGnctwzlkkNCo4iQk4BeT7NLYQ+Hypcl6RB3+aBpCvsyAW0exd5klwKXg3zyhV+AF
	T7DoziBOQfqW8ewzuhGid2iE1VRWvET9XA9zRiGS0rST2jOIkEOa8LqS+lGryG4kZZDuWDU1CQW
	qVLxApdfAI0a46Wr8wFnwwxkACN7sglsk1vOOG9J/xnOmQwCouvYA1TPP7tDP4cdHLN9sp1RvY+
	U/9d1LGVX3dB1ctTb+gqGi0Sqhwmagmvv0uFvVjFzWRHpKmfoqj2TZ+MO2tp0ElbdjUapaVz3QX
	ZUPUtVVii5iBeMv6edoDbViLtffQt5gvBKKQRd/MVJwo0b3qd22qM4NhJg==
X-Google-Smtp-Source: AGHT+IHutThyGnIQqvbIW7Z/8kxkfEm3URL5upQB6kksolklRRYFKs6NUWaDZnidc7rD2PSGBBS0mw==
X-Received: by 2002:a17:907:5c1:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-ac252aadb09mr788726766b.21.1741458880189;
        Sat, 08 Mar 2025 10:34:40 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:39 -0800 (PST)
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
Subject: [RFC PATCH 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Sat,  8 Mar 2025 20:33:32 +0200
Message-ID: <20250308183410.3013996-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103442_010113_D01E0EFB 
X-CRM114-Status: GOOD (  13.17  )
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1026678a17a7..7d77cc9dcd96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -83,14 +83,6 @@ properties:
     required:
       - port@1
 
-  i2c-gate:
-    $ref: /schemas/i2c/i2c-gate.yaml
-    unevaluatedProperties: false
-    description:
-      The MAX96717 will forward the I2C requests from the
-      incoming GMSL2 link. Therefore, it supports an i2c-gate
-      subnode to configure a sensor.
-
 required:
   - compatible
   - reg
@@ -98,6 +90,32 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - oneOf:
+      - properties:
+          i2c-gate:
+            $ref: /schemas/i2c/i2c-gate.yaml
+            unevaluatedProperties: false
+            description:
+              The MAX96717 will forward the I2C requests from the
+              incoming GMSL2 link. Therefore, it supports an i2c-gate
+              subnode to configure a sensor.
+
+      - properties:
+          i2c-alias-pool:
+            maxItems: 2
+
+          i2c-atr:
+            patternProperties:
+              '^i2c@0':
+                $ref: /schemas/i2c/i2c-controller.yaml#
+                properties:
+                  reg:
+                    items:
+                      max: 0
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


