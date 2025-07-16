Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B43AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=; b=az+1A+7QOSC3g4NIgSRVdzC3K1
	efEyosxXeKQfrako5EN+6P89oHgYYR/o4vIHRfzGmLX+Rj0Ym7CPKIjbVP8fAfH0I0sY+OGzNYEtn
	3RsPwaUsx/fYTw15seKxPrE8X8cBQw9R5cU4yBIRBd5Wfu1HFxKt0PVHHEnhfLwkd+QDfb1pau3U1
	22W8+G/jCTuAUF7DLwG17lGazbSqT2kub1CTNzF689a79cPkGY3+cRd+CmRNPDHxmUyc63rbte0Pa
	NZ8M+XcKHH0yfZ/Sl8nxHSdIwZVX5IYftCW2LqY9TxpToz48sEGZS7s2D9hkPueDwKSTcpOMowaMg
	VGCF5V6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7y1-00000008WLC-2DWh;
	Wed, 16 Jul 2025 19:39:01 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qg-00000008UkV-3I8b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:27 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0dad3a179so30497566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694285; x=1753299085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=bZkj8RVUtuipMh94c82QcihYrBcisgsgdNVyWoSN0bTpbFl1EWP/YQiLPu2GgtBaI1
         u28545FBgY5P2wL5qb+7XeDodmBuJKG09+enT09x8emU4KcPJxtZ8uMQ7NWTbdF4n92K
         +CM4mwPtKMROqQKU+Q7Oq02Wkh1oDm0U2GN2ozcKL4DBMZc/xPc6WG+sE1fmmyCm2xiX
         xIMBd6fDC9S/oJqwdSUIjKPN+sk/+ByaVz5NNb2/3wQ2U8cALLy4PMJsGbogOTmcwcDE
         DjRjjrMsW9hm66scX+ozx83nvHa3f5LUcq6pmPNmWEhGpZaSiUTfAjvvVDbT8R57SR6J
         e9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694285; x=1753299085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=JzDzDK9rQuwS/cepiwsbO3x07rYEn6osLCl/RbeiWClfU2shHjKyqmu7DtKI/LvQUp
         PZl1eaevwFlnBuwbyxR38yxRrczlg8tzoB94DmELEJ3x1AYIcMz5w0Jz0aHNwvD3rFdk
         SU+gnViUItwQ9l7jPj/HbhvWCoFhEhpaWsbp/emQkMET9m5JcFJMiJ4P7JXEnKfE+pDL
         HnA4kTnUxACr2vUEMBmqLD0uiZ7nkQmOTaJzua76mFuFAGL9dBgqZFa3bjE0CiZPo4h9
         YoYEsQr923lwaa88ZOen9qHVrj5TBUPtyTNK4/1XGEmOIbNk7h/IUGekkA7K/2iYAotc
         jZIg==
X-Forwarded-Encrypted: i=1; AJvYcCVdqxhBAAyukZQ0f+EGXxohitdSmuRbeU0Uf1iar1DIcD+osQH9AUz/iCbOn2LlE/+LzMI4vd0L/UmzTS/hR/r4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Zq06CdPWuYQJTczvi1oNQiKdgakT7JHEdD7qyTmEE5+sVt3t
	Bd5WK9h/tTFSIVrpk5v7LcS9/YQO0bq4hOZtGzqJulu0m4d5LyFa533V
X-Gm-Gg: ASbGncvhaX5TdSHt1B7EmDk9nD/ewbJbLklPZIWRv5V6uplPr0WMVDONx3jfN494TF1
	IrCbOBRHIWkrZfzjGtl9HOr6dmyVE1YM1CgS3gbhjnpNVAXHS2T5usYHFmpKMCVb1GybYNaanuS
	tmAKhWL5jjE9rQQZAwH0uZPmeCWyWFuB3OzQcMRQeNQuAW6DgUkmCs9Me/kLPwlTHCYamwyfHdM
	d+jWb6sGOWMpPwvhTaYfbTnacjs5QRH3348AqYf6RbcwI4ZfnSIAjMNHkC3Q1py6o9+IXleQDvY
	ZCdt5lW/DposBggc6XyszLAUKIUTeCesu4jmzQZbAX4B/k6A/daslOlCie/gCq+vRkbQ7yjKfUe
	iWHIZYwMaUWH+8wHbygzIJSh2Q6eyM0dOUhs=
X-Google-Smtp-Source: AGHT+IFSA4AiC68Qy08vTumwlbKm1tuQWQ2gsGG9cujoxGVmA40XsWkJjJbkAdrdu2z+pb2qG6iypQ==
X-Received: by 2002:a17:906:9f8b:b0:add:f2c8:7d3f with SMTP id a640c23a62f3a-aec4fbea90bmr19353366b.33.1752694285308;
        Wed, 16 Jul 2025 12:31:25 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:24 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:47 +0300
Message-ID: <20250716193111.942217-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123126_824425_31210576 
X-CRM114-Status: GOOD (  12.11  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368ec..15ab37702a927 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee091d7..e973b0a985815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14761,6 +14761,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.50.1


