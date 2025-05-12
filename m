Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9E4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szzST2rS84bZDMOoZWhP4HXje/44DCg2dZeaKbDsRF8=; b=0saTnyNH38A8hjG693+XjQ4SzJ
	BPHExcR7potbNSm+shhy0q5joyGlp8NAqLemytNBnVaThes69P4RzDU2zr6WDKwrA5nfYzEKNkwIz
	3wAqS2ThfsC1RaByvGB3gofFJCFD1WJGDVa0lAf8tBRS0Gb+DdXF9A2FVe6OuthkJelrrzDJQrNHu
	lGjqEgLqSFqicVcZc8FlBfUumD/VMSwDwLW9b8QKbL8RrnKacL9Xs4bDuF9KvoXIrhISBmOu39Yj1
	t9DyYICHj7+9d2JnWOiY8Clsh6quUlxAauqGY1UDF2idQYuRgqt6yrHBjqfo8C7acDtAZK0Ah8Ega
	+RVED4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbBZ-0000000AnPp-1XsQ;
	Mon, 12 May 2025 21:59:45 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaiB-0000000AiqD-1qHm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad4d03700e6so88162266b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085362; x=1747690162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szzST2rS84bZDMOoZWhP4HXje/44DCg2dZeaKbDsRF8=;
        b=Fq+fKZR9H92+bxd84EF846xW53X9qFJXakz2o9aFbNdloMAY/NVvkn8xDyioj4w15V
         HR+h8fff3VZiRwmQEW6oU8McGsBTLUrtZbUlLNMIQB6DYY7Xq5Wq+S1A4/CgBxAr29lx
         zzPS4k2gxFtQO9U6bMFvYlhIDiwh9ggZrND3Z2tbJk0OnFJalYZKVTBWvi7HTcwus6Cq
         knZdDoPpJjMSOPBOLocNOn6XueO4YzmYV5bggPULXzSKYXjiStg3laIaZfZ8Ic58h8va
         ju/r4fHFPxZahSElSAiUgsPYfHRT+oKl5x5d8E83TdSLcDq/chVGm8JDJDbC6rkFWw7S
         9Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085362; x=1747690162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szzST2rS84bZDMOoZWhP4HXje/44DCg2dZeaKbDsRF8=;
        b=KU46zGp0cALPOmaJdOVdqAiBvGVFiFy8en/+XCaIdQcxFKL7lXqi1qncGO0oT3Uajv
         JA/6wpsl3Vgc1j7nGC56bqHP6VkPR4GflFP77PTOkQyU3SbhM4NoqkkHVMrNAg4+vf7N
         YCclQ/NwSMW9qYkSliFVnzrYo9nkIMbGxyQhhqclaksZG2ZjahG/8mioSmkTVzcDetkF
         xh4OlvqJsIO5IrxZAsJYRhnP2hyGpnDjiWxFY4eIYDMZXW0bh+j5F6C/rrEP4lYhCQGl
         +pZBezAM0LkGfnu7wT4IaQpOJyA8WG6Lafbj3StmOXjN7y6eS6haqLq5VFnRkx5HqfsH
         KRSw==
X-Forwarded-Encrypted: i=1; AJvYcCWt4De97tGD9HQJPkmmIdG3JhF9uUS/Kzsf89e5Mt3pg8JGnQ92i1L5DMwk7fFADYt+/9TBmmsx49GESHhHIwr5@lists.infradead.org
X-Gm-Message-State: AOJu0YzOfqDSLc9QRw0r2Izx4RgTgYHewYit8+jtYQA1imuJ9QzcSt7H
	clLmwr38VFWoeAGo+S8Gf6J0iHuNSZhtMxJVOLB5BOmFrBcRIswy
X-Gm-Gg: ASbGnctjeVLVm3WEicA3M1pnK6XVumeIl5Y69EL7D7nSDB1KpCSOl9xFs/+brJrEkID
	uN+A1wOlJgXcfszA6LCE7ee3Z3GbzmYB/DX/Nh3FL3732GmoKdTfS/iZQVMdv+GFFJjQ97ll2K6
	3BY9tcAY4YWDi5qcro5BNzVX8+1Xyvvfi1AEZgMXN5fEkHntbUnQEnHUeC8byqQUNwekJthDZyA
	oeHTU5c5k5RYT+ApSn5GYl3jG6oE3yHb/WuZ89cjduE3dtadB7KYOuha0K15op3ZrgK7943pifA
	PvvvORJpYQ4HqaKckC5mtHJBALnZDhCzUxx4AG1M0ojGOLL81eng8aiEuNmhhfM=
X-Google-Smtp-Source: AGHT+IE7dmBvMO5cOOE3urg5qMwIbc7AnYZ1lfFEOfBXmNO7HW+iI3VfDlJjIZrjIU5AhUfuiiplGw==
X-Received: by 2002:a17:907:1b05:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ad218e48fe4mr1549312566b.3.1747085361713;
        Mon, 12 May 2025 14:29:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:21 -0700 (PDT)
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
Subject: [PATCH v3 12/19] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Tue, 13 May 2025 00:28:21 +0300
Message-ID: <20250512212832.3674722-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142923_474279_8DC1076D 
X-CRM114-Status: GOOD (  13.06  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index abf3afc95fc9..84078626ed5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14192,6 +14192,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.49.0


