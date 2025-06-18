Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F558C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX2+2gdHzfIqMHzK0HUE6rBPOILvK+9cIYaOod1fnc8=; b=r4DR9oh0Bp1qZzm+18j5srcpix
	oGgu0mlYBIgpUmsSM1DxVcApZou1aq70zM6Ra/zP9MUvOkKlReL6YLxALKSpbkwMNmBofWf3llW0f
	S8cwnD3V5jZFF7KRVQJac7NCJSRsSDr0bYprVYqjqRQuCMdAojAuSLJR8jq7nXCURcaoM+0rDX8y6
	tuLD0qK5SEeGPujOc5fIRzg0LeCNKoGvs6nxqKVDq2b0IX/XQyD9QvJbM3a/uqxFeVez+pEYPQ/4B
	RskoQsYXcXvvj1JF7xR9vzfD4A3fMljrV9qiD7xL/Pfm1GQ6YW8z5i995a2h46M8ivgwHydr2akQf
	ICqfZkXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq8z-00000009oBL-3img;
	Wed, 18 Jun 2025 10:35:49 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpaB-00000009gb2-18bX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:52 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so14134096a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240790; x=1750845590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX2+2gdHzfIqMHzK0HUE6rBPOILvK+9cIYaOod1fnc8=;
        b=CxHivt/ARjY5OD4zJNC6yYvVjBz0+luOpt5KCDHlC1jOAlGGFmu/PfUZJe8ouRFYQ7
         BLLbkzG7M8SqUoWjCnH50g5b6yZtOhBKm6119O6kqs6+ew2DIWck8gF2cHKDZTCRER6Y
         2CMbkyQ9+D/+x8DQ4hOLB1JGoGte+kEjzgLeLrQ5ZmlwVKwAYnbu+Jw0xonB9+wEbf9r
         kh2V8Y2ybUX/7blwl4LRc71e2m2Yo1rQ4Bt5voozgwKsrxBW5oygvQvSRLEZJ3+ynVp6
         QY8vYb9H0bMNH4AnsvnqXRKnDWXxXLs6DieE+SOGLWJCE0sWZyD70tazFo2EOArZu6g7
         ai9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240790; x=1750845590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX2+2gdHzfIqMHzK0HUE6rBPOILvK+9cIYaOod1fnc8=;
        b=Ix/pYzfa4zZr4BPilOEfMYFjsWH9YNsU0qFR90EiBR2Dlp+pb5c+vL2Iu8ZFCZRlf2
         PbgJNdu4lfiV7cj1ecu2jwvyowTzWgugeO0gQOo/aO64q0ljLGF4PkX4B9mQ+ExR384/
         +R36qq6nzTzu8z1F6wpG+g4GvXKJ/VcKSYsmrb/G307jiBWLuPvrK5GYJQj2HG1caWuy
         GJ0VC0xGcfJbSMDTMQ+gyYdj/SKygkY8jS38cMl+e1VCPUopzGHmJ74ikVHnbB20gavk
         GJU+K0YKFc10IOyq5ioFdDPtlVFHQrmqRRueEUgfQ/ACHmA9eFFNlCC/r2D5FybP2wAl
         fEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU234UdgoGRiXonCUj/apZmj+j09MlEolESN3Y4gLP+MhEk2XlSr0XTYxVXb15C8zk8OcrS+MaibTmziWqd+CJL@lists.infradead.org
X-Gm-Message-State: AOJu0YzUeEuqUcD2/UA9mx7R03XD+kaYrHbRG1ObSJAW7VETmMaRDpie
	OlH3OzlWp3uzga/kWdclq2QbSIe/42gQTQNI36dyYhNgY0pjF5+FwAoy
X-Gm-Gg: ASbGncuw6wrhs9ggwug0l78dR9SZ4u3PdAN/n1HPcErvdw30elLkRnXv+SZxEjXj6fT
	CLp+vj5eGc3mkpPHic+9070hDT+BRRKeWALrvU1fMIcw4IT6ZQnbptDN30/ODqt+Jbibq0Oolco
	UvfyZwYmQ++f75Z4MSw7pz2a0wZOTODkdutK0lA4aOI/WwL0MITBOU3JJ4zhN6wjzQ3LQRQYrD+
	kxEKjIp13VJrSDfaok1UaDbsS9R25QWnhS/pkrjAD5rw0L5UIFe5f+qFtCKgvGP+gvQV89O91bp
	4ivY50eeo88UMyZqcmKwDn3cX2iJpuwfZWYgo5Qa7wQ3L/PT0FrXpmlmUaTJIxt19iX0e+FH2J4
	=
X-Google-Smtp-Source: AGHT+IG9Ltz8OOKzg18kmieWDJZRnteyY4BMf39tj5nKgAg4iI35WEGx6FggKsNK/B/tndtnp7aXlA==
X-Received: by 2002:a05:6402:3552:b0:608:4945:ca47 with SMTP id 4fb4d7f45d1cf-608d09486c4mr16001513a12.17.1750240789542;
        Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
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
Subject: [PATCH v4 12/19] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:48 +0300
Message-ID: <20250618095858.2145209-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025951_318758_3A508DE3 
X-CRM114-Status: GOOD (  11.78  )
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
index 77adb1f7ac9c..423ef18ca693 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14736,6 +14736,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.49.0


