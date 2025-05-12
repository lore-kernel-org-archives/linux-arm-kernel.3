Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5430BC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Az28+HlcLM0sL1av0MSi/fM4ZT2oYYKjFc0IsJNfl4=; b=WCQIJE9YeDqVLP8D3W3+e/aO96
	BGnhr8Vuet+kwyUbQDj8lsB+tFwyTBlP8W1N7gt0vvrOgT+lZG0AqqBnybvjq0T9WRWCWHYEzzrvf
	YcylWvIiGWD+oBsTMlFvOWMZTzvjYavbh79LDZjI82yuxL+/TjPcalBO6paIJ9RwqVkOi/hXOJaDP
	lR5yJScTJYE+QqizuMhmi9g7Cz8/rC/SQEC4hfF+u76a2NiopTPEP7pmr2gjA9/APOzB9+bvB8cTS
	YJONljDwz0a/upIkMUpr8lc58X8gs1xO9pysrtqsJc2IgMU9ppQfy2R+6OyreZcO9r/k8fg5Mwf2l
	ePgTevSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEb5X-0000000AmQc-0BPw;
	Mon, 12 May 2025 21:53:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEai5-0000000AinA-2nnj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so1543499a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085356; x=1747690156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Az28+HlcLM0sL1av0MSi/fM4ZT2oYYKjFc0IsJNfl4=;
        b=ZU0AemqxsQ4lQ4tTm4Fhonc6q6vL9xijmqxIn8si09xvZi5QWLPH0u65jBdGIskHmS
         MVxpWnMlrF/9EwbrJOJXx5zGZL5TcodpqLFIt2xVMfzGsljhv/DslcVi5LO0NhOZ/gKf
         n7aGU6vq6LUOoFATwMt7ckASkeFlQxmSRjGRSoLw6LT/ENG56w/1DykiGEdHk4emXN4m
         AnDx3o4R4DlOuFXgE75J3F2qVcCrpjXtU4PpttiAvas9Yr62ZZnaJ7Kgy3lnBeZhbGTL
         ytqstti/0tRAiG/rFCiflL+suJBYR3LoVbG5KVOSHfmB8CKV/2hNnQ4Zn8I61sQZexzj
         7zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085356; x=1747690156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Az28+HlcLM0sL1av0MSi/fM4ZT2oYYKjFc0IsJNfl4=;
        b=TLlH5vDhqJwU2xRanoLWnOY34DSvb10lh4/zBBjh8FWNYuXW4Y2dZkZxBBLoVzKJy8
         +qlkYfBa4hJ/wFgWohTY6ndtNPM10TttCt46ayjg5+G67BH56IhaSgL+PlRo8n4Vnb+I
         pRUx2JVT6xynU/+EbEAoBriKkkBbzbCBzkedbe9hnhPtHbmdgFwwbusSdLhu8PUwT7tQ
         AKqxCxmHfVMxrysytcVWdcj2nakL+mfqNCv7iYIhzuNV8CdyrY14XgMv5MY/5bARdUTv
         uB4+QxNE9hdrRnyTnP1uAejylWJBBlVKgIZMhLqhoG+5sWZw5itMWj5LoCOMLNB3CaA5
         ngUg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6am+hxlXO5ts5H0evnmqBXEB9eZeomZ7fpIkexJqfc04c6V9Ldde5q2RsHLc2YQfHatAauF9ncis06Uc22na@lists.infradead.org
X-Gm-Message-State: AOJu0YyjSfJr2x/HebLAia2G1Wkcow9rJZottxbB76j+wsdj3UQHN8Gg
	yAPm42E7FwYtcbMo0qYBB8B0zYyDHaj0VmR6Q/5JqxaWbAWzQ+hH
X-Gm-Gg: ASbGncuNpOJa26ouqzSMJ57gZ0E8Po3h1BgSyFvmsEdTh52jikdVN4HgzSbxHnx13h/
	o0a59s5mecHdRwOHvqA0Q6jxVuer3zk73FRsICjknQPgbBK0tp3FKJA7OLqoYVDspMTtJK3IIRn
	UbWMgxMb5pU3NCU7fFqSouUYbjGOAlVLV+zMHL6tv7Rc+/4TZvfBqQvOl3mhbhWLiZeu1D6EtXS
	JMQAoLY15kb5zzvr1OLDqTEjJy1hFM0UwAycPWua8v2c0/htyavB/HPSBSD8KnZftkufTX6b6Nc
	nALngHbwe9FzYqDprF4p095sgLlCuJRnsURs+rWjEyByJLJ08KMHcYeAUgstxmI=
X-Google-Smtp-Source: AGHT+IHxZimkUK3H+FypaTOTN70zLrjfhJRz1zTX6CpTIj/ujzs/pJwUigs4Bc+mQ5Ey6V2j7ED66A==
X-Received: by 2002:a05:6402:40d6:b0:5fe:e999:e553 with SMTP id 4fb4d7f45d1cf-5fee999e5b8mr1117281a12.23.1747085355831;
        Mon, 12 May 2025 14:29:15 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:15 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 10/19] dt-bindings: media: i2c: max96712: deprecate enable-gpios
Date: Tue, 13 May 2025 00:28:19 +0300
Message-ID: <20250512212832.3674722-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142917_711968_FF82D17B 
X-CRM114-Status: GOOD (  14.79  )
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

The MAX96712 actually has a GPIO named PWDNB, which will put the chip
in reset state when held low. Esentially, it works as an enable GPIO,
but the naming is different.

Deprecate the enable-gpios property, and add powerdown-gpios as the
rest of the GMSL chips.

Change the example to use powerdown-gpios.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..e38213209973 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -35,7 +35,13 @@ properties:
     description: I2C device address
     maxItems: 1
 
-  enable-gpios: true
+  enable-gpios:
+    maxItems: 1
+    deprecated: true
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Specifier for the GPIO connected to the PWDNB pin.
 
   i2c-alias-pool:
     maxItems: 4
@@ -128,7 +134,7 @@ examples:
             gmsl0: gmsl-deserializer@49 {
                     compatible = "maxim,max96712";
                     reg = <0x49>;
-                    enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
+                    powerdown-gpios = <&pca9654_a 0 GPIO_ACTIVE_LOW>;
 
                     ports {
                             #address-cells = <1>;
-- 
2.49.0


