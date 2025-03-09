Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFDAC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 08:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj7QL9uAss+Ow9zk6InOH2HUb1Xra8s/78xy7RSYR54=; b=nuzq19gVzLcIXDycu8adsdVxSa
	xQDXF801/d12JrrOZXP9YSpUuAedKkZCwIrqXQ00o96R20EyDb21tbp0Q+mixm7EdgDgffWkVPmRk
	qcO7YNT+ICCm5hmDt++eX/uMj8iuTJtXDwHeaK8NGp3Y9avwlb4xc7sW9s/9RYfqr8Nf8Z6qTDJVN
	KZJNRc6CbIBUqtOZflB/GebEzDHcw0OX+2i6aevywpQMPLFeoztqHY7kHO28tsR9QBf9kWavifUqu
	0ga6SX9ADJ6idxZnTgH89E59Qoj4VbR/yHIgKB97HMwBE5qAA770A9wIB9BbgLiH8BWBxuOy201Uo
	jACK1b0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCR7-00000000Djq-3OQZ;
	Sun, 09 Mar 2025 08:55:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCKp-00000000CNL-1j6U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso2608923a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510114; x=1742114914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj7QL9uAss+Ow9zk6InOH2HUb1Xra8s/78xy7RSYR54=;
        b=SqS4CzlN7AWO1kCbD1RZuMnYZv9CZITYKUJISl+Wz8AV7x/nFfcTW6wazRNWe6IENn
         zbr5Z2wvwmTsQDrlvso4Fe55MNQ6j4WDezfB8fuYJ3yKu9Elym4iny5nKfGL0FRFNiX4
         qtft2cmnZps9RHZdlc4lAipikFkOE8cD6elntIujvFA8ZUov8itTTJHNlhJfi4wfSDLI
         l3noXAJm9CTWwhvh182JDBAZx5nwfTU0lD1TvLEd6wk/rDBz+eg7hB5ZEshsm7PTA3yf
         stj3kPPZSKdCAX8rXzC5nWm5LB+PO33jg8S37FhAiUDORUjiVVEbEFf8azZ3Pungmez/
         juDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510114; x=1742114914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj7QL9uAss+Ow9zk6InOH2HUb1Xra8s/78xy7RSYR54=;
        b=Nbd6lxP7azP4EVIIiY6NjFymHcNvF5u9CQd1Vc1cT7B411+3ghoKw4PuwwavUlbf0h
         xG3hQNMVSeNmnuiEcPsiCYefiawbmyOnq8yzq53H78B/Cx2QKUKPnS68WGNuWZmEiOzq
         4Q5/1fs7Yl7qyDDkKUWGuWt4tK4nE3nQpk2jNVNvTk2N7HPr50WshlOJ1bPGn2fxTMLp
         zMWR+EOpE+11lZJWe8+sRT6uUfBe4ZqBETXGrQBzzXoj2F5gU2/NZlD+Y5HEZfwiueqk
         TRZTS7OiaZJBlYVX9YUCHpDYy8eSYeQop9PF4Bg5mCVe47GvzhzMH5u/3x8LVzgqQjlL
         UBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWexqLk3Mmyk202p58SQdzhRopBTvlx1nHuosc/y3T7YLrfBCm3lBPKSLy7IOAeD78P20jSJaRq5S8zSyqGBvfu@lists.infradead.org
X-Gm-Message-State: AOJu0Yznz4WfyWau3hsYUqkoDBU7PbFjUANxrI1mroYXH92bJ+o6tUv7
	oc4MEhppZzhMGtjySY/4xlSwcoNf93GgEUlf0feFqPWnAv/pKfOE
X-Gm-Gg: ASbGncv+kalGPXcu7A2nIyyOSkvNKd2JhlOfOsdniX30UBA3z6Jc99DlWZr1jERp+gx
	UzSfilbKRFNtRIi7tZBsm6vJdeK/1UY01Zu5HS1yFusPJehVSL+EZ1x2Tcs10pYC/gF+7Rwt6Kh
	YQazI5zB3LjIXFoZTUR2h1XqjHvuJ9TGHnSAG91ke8iS1GZuScSY+I1xCcIebdBFSVxGvOOzF/O
	8jRN8TTT+Oqj/30Fc6m7Lxc0hXmosAfbvJijn9Axn91QXXI2VjGKPrdB3ekTQ8X0nagve1Tv4aB
	5g9Fmvjnxx3bzgZ2rdRz3gb97krQZ6UvMIi2oKJ6iq6gb7HXbGKpqbErUg==
X-Google-Smtp-Source: AGHT+IFm2koHNN7A12mxTDrUb8gVHG703Y2Y9Icivhx2dsCJHeZ/vLMfvZOA/IpeXYW5hItMXuZP+w==
X-Received: by 2002:a05:6402:268a:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5e5e24688d1mr25168696a12.25.1741510113522;
        Sun, 09 Mar 2025 00:48:33 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:32 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 03/16] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Sun,  9 Mar 2025 10:47:55 +0200
Message-ID: <20250309084814.3114794-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004835_447604_590D9954 
X-CRM114-Status: GOOD (  12.43  )
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
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1026678a17a7..dd28cc397674 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -91,6 +91,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@0':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -98,6 +122,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


