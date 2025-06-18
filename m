Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A552C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZM7v4p+xV5gPJJpmqTWsdUNvs9q2qx35L0HvHBeAlV4=; b=SNmOA08LvFgjSxoPT+1/u00mhR
	2M8TIUkzB3WF6c/4hGzQeGt+tGfgvAObTDZOlg2IKAtHUtw4p3RClEtvSk4oi//XCuKq6oAzN0K7P
	1lxgv+FSic8sgt7+OGGry+J37H70knWZJQh3DNbiQmokGWoOsoky2IFsZ3DTZKjFmNWSO+NCcmK9t
	ZvLJoj66AsfA+dLZRD3S2+hZasfylN8bBCN5tBRn1zbYNd2YOMHiaMt0S3LgVk02JRVrnBYyDXpwe
	vL9VNspnfik37hNFe6m43+pGortJNzsKK5AnXwI2CxR0OWOdelTgUs6efl5nQ8UdpidSM6G5dWeA2
	bCwqhKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpn6-00000009jZZ-3J5E;
	Wed, 18 Jun 2025 10:13:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpZu-00000009gIn-2C7h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad88d77314bso1467427866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240773; x=1750845573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM7v4p+xV5gPJJpmqTWsdUNvs9q2qx35L0HvHBeAlV4=;
        b=dARWUw4OjO+7hP6pQk3IKuNalJw2zHZPJGnXZA9PgjXMhLM4dUXZbOobvOnG6OZbbv
         nviyuD4QVRltMt5Q4XlPNLP1KkbLM33lKrBRAw063i7yyklrlylIiJS/aihnibAslIUr
         E/GMIJg/fSMPnAUACwOxQQ9rtzE+u8bTdB1BCoxUssZ1hRI9aJtwnUaAhTXae0dBEWwN
         UA16wMbHQl3dwoTQ27YyxiYgpfkwcvBsXtmU7ceCSgcMOUHyvg3qspwLqJGDDuTSwZ/k
         Xx3z2AQ3OMuvuqXbElerQBuw4npOcM9B+zNTtBjETf7/DWu6CZrUCwm7UmBW2GndD55L
         bVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240773; x=1750845573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM7v4p+xV5gPJJpmqTWsdUNvs9q2qx35L0HvHBeAlV4=;
        b=Z7pSvDDixbHVBaR4RK1bPlR1CgtnanbrFowqdVODd46l02lg5NY4OKXkWiBMM5zD/b
         MWnreGPRhSnFGG7hKvXwA0MhNcLWi1r99PdMgtPEhjeV4wKAJW0v9Tb64dvx+GpG/e/6
         iSOBzJBSJzyrU5DE1cLJQTXWWeYn0L+arwCYGmxmUUnHAB5ttUwFlFW696n/V6fRlY6x
         j6kPGY7fjjK7qH8yPopji9LJAF80cgiKVKCOWGpkgM2mHX/gTvtd8VkC2rH59dRFBYy8
         H7qsANcoIyoiUvKxg8Uar/fNk2400MLts2Y+ZOrpbgSJiSugljypOKFp5GGY4yZ2GXkJ
         YH4A==
X-Forwarded-Encrypted: i=1; AJvYcCVaIVAW1sMmJ4v6eWiyVxh6RvF0gp0BjwllvqVau/UostpUaTfuG9N21k/FLHz3b+pjLFDul2tTCAg/+9+dzSrE@lists.infradead.org
X-Gm-Message-State: AOJu0YwLCYi2/oaVRhTFGXBmlI08ByrWhKwVuMKPcyYYliD3DAqEB2ge
	GT2EiVN8FCAWoCYj31sMV4YUUT5wBI7hVKh3e2IMIQ0gqh+eIkq2tkMZ
X-Gm-Gg: ASbGncsWt5oabBMWJi8VqjIClEkw/R1oUgA2F4/PKYf7GSwfooCv5mc8hbKawS+B3nc
	TF/R4tzXsbeYPFMt0p/+ZRaziGQ/8PojNSr1I7ojhjnG3Z/YmTyuY7xbxmZyG0ZyzG0DBZgeuOJ
	FNbZ+UOlUqmOcpusfKiPhxfsM3hiN8Pk0bVvtx1nHKZuxttmOR9J+ZyGCOasBLI1nhvH6p0ob4M
	DII9bFDlI2T9Y3a9BLqtOHEFYUrHk2AkAsh79OS4w1Pj3EgXEAH/c6CjiBWZGRuPQln21CeGWf8
	Y67QQldfH61TSB8NF1Py5F0Hj2v4DyJXWvZ7c2kRY9RpXswSXpzUqlHaijM2l3wiKIyyCSjmBpw
	=
X-Google-Smtp-Source: AGHT+IF1vGugdRmxmc+EGSuEOAkqel6fu0udIatnhRPXHDXTkY8odVb+a9IZeK6Zi6Cg/i8OjJgchg==
X-Received: by 2002:a17:906:ee87:b0:ade:9fb:b07d with SMTP id a640c23a62f3a-adfad367b40mr1540072866b.4.1750240772740;
        Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 02/19] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:38 +0300
Message-ID: <20250618095858.2145209-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025934_562831_080C0A68 
X-CRM114-Status: GOOD (  11.86  )
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
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index e8f3dc93a569..01363fbcb9b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14742,6 +14742,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.49.0


