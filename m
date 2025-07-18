Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2552C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=; b=Ubvw8BU85fJTD5JW3XoQOMJAG2
	IdHp8/Ho+lDcaWnQFOAYvSZ1o0e6RZ4EU+CmQ/7/+2vcr8LbwCpqaNj57sRQMiKzCdj09q9aaR5bD
	s1XNjVIczysjJ1e9tCjxDquJG9xwjVKi7bgAGo4VfRuH5GuB6cEhNpbxpUJ6h9DIGsMsXrLaFY2Dk
	PNI0nUhtWF2jETKUca9mk262jLjCgcX5dXydcZD6PIXUefGNKsVBrvAwt6J0pHjbpKtvoN0dvSADE
	rZoSCT7dJToBqqKfN7jJh2YTQcK4QO7k3YMG65dVToDcAnKFq2ohh2yTOLbkTA7ZW2etBqzIhEpLL
	SIylxHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnAY-0000000CyVW-1sSj;
	Fri, 18 Jul 2025 15:38:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxa-0000000Cvlw-3IOq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4555f89b236so20224555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852317; x=1753457117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=IMl6SKsvSXL2yaIDPncUB2nwz2sIRugjX9iXPffcIu14cYkCESV0rZqoe8Jq5rHILg
         M+MwNHPrp2T7bR70apo30mwfAmEf+WzxCO/BAZ1uMEr69QK3kVpLejkNwVhdZGktFhGS
         iB/ARbRQhPISRZf8EAvpsh4MHX7p5PkmU7FRZ0OznlgEWl9QWGlCdnkijMYNK3IbmM9c
         7x9JpDqxmLfPRk5Sue4bsmSEwN4cX4eLQFo8gG2zDmrR4dIGsaBrPd2NH3Tk5wNSr/3X
         nE8Wzw9mjOzCNDvgHjc13cvP8p6uQi8iXSoE00CMweCAo2nSkMdCPUtvFDtwXK5nOVNi
         Xi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852317; x=1753457117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=N4yFOz/JKdbIUbwAAgefbq0FK90r6BXM/cuP+SfFE6mx8yThBY6xSaPMkf0I9hhlrk
         SY9mFlQnseYjLmnIxdTLr2zvybyqy6WMWuKaG6JEn4sbanz8D2XpXSJ8jRG96JG0yWvr
         spKU0tzmcF2JOAe0krD7BKZm35XtMLJT75zLjvzj+Smllm40qC6e8g0CcU59WJ26VgKt
         UihTstdTmg+PcjrS4nYMwYZRsutgcCaOvPtc9ZOBz2enqhtJ0wWsBISBdAggwRTxs+fo
         ZJxOdu6e2+7mJZBXcLoMTTHawpOxRJW875HyMHaZFfa6vULHy/j4EcbgYISx72vsDs7p
         O+/w==
X-Forwarded-Encrypted: i=1; AJvYcCXVNybJXz9G0vr729ATunabgcvt0NjtWb9bxznB0HXTPkZCaFY8c28MzhtaW030bfc0rwSoB1aQ/BqwuFNvprI+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2SNAdUkA5kGawAnGCIqC5/hmYt20V1UkkMbcw8Pl9IJI2fV2S
	0L1uB05pLXQoix3SJkqd2BRGn0gsJbyHAy69PAnN2HYgSfboi6GEJKIv
X-Gm-Gg: ASbGncsZQmbZ4DP6Lj/ASEBeLQWqD+5/KsG438NHXMqU0U2pTErpzZ5SZxJ1+bzJ06D
	aofJoTOpDprj3v//ISTYJlVlNz0t9jro2IfeNUKMMSSwYBlKhhjqrJD6W46SeLz+ijU5fhenFWQ
	DgiCc/gRhIf2Nj5f/D3zNBE3N6XQTVzrHCSMX+oVtdoSYYrLJ0E0zesd+6T2XKYxr0I3iFGwlAK
	8HhuxUWw+roNh7A2JANEqZmVldIi8uZG7tvkEeCX7cZ7JH9Bb9rXY1M53uMQPXvkDD4de4sgpV+
	wyjv90hl6Czb+kDJj/9Ff6l4h2IQyZ0rM7TfcRBPrOQEo1UQUxMGMt1XVuAPytZpRZde6DDiRI4
	vZK9V52mOtLmEbpB7B+HpTOPDORDn5es+duY=
X-Google-Smtp-Source: AGHT+IFxyUdRfZgEPkM7R0qNHuzdLNKFoTZgeb0mz6125GBptl1i6RQm1WyjXllR1VirPJEl5oAsmQ==
X-Received: by 2002:a05:600c:3e09:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4562edaa0b3mr116293185e9.12.1752852316906;
        Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
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
Subject: [PATCH v7 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:38 +0300
Message-ID: <20250718152500.2656391-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082518_822581_1A6DFA2E 
X-CRM114-Status: GOOD (  12.28  )
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


