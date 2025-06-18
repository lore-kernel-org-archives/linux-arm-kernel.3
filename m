Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4F0C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6baFX1dgbZUxvw76cQruvAgLUvKTOPaVCHPv3Fym7bg=; b=E4ToVNAk19tNZ4MXd4w/gVeREW
	+lZr8g4RvL+glM50PdUjI+nMrmBTlEPwAUusMLqffa7QKZ32iCsfpkth0mDbFTCmFDcN/wFQIJX3C
	DQm5ifXxA2lMr/DDmw4gefxGfl/xTHwZngv+PNHpbokBD5isn/nked8/cGrM5ZMzIAbWdqLx5yL8V
	rP7EdCO28iAsZH8qVBU8pdv4FFE3Q10Zco4iA7PEgdjpuVcd2OGrbJqUvuwp6nQ3h0VRu7e1PqQHG
	0eJ/7lSZTb/CXksY18IFK2VrDjuB39X2M/YikHBebjvAzHAHoneyTFghGmFOgqeZuItM4wNJoGIon
	lbMV57Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpy2-00000009lyi-3I8C;
	Wed, 18 Jun 2025 10:24:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpa2-00000009gPz-2k4r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo12981978a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240781; x=1750845581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6baFX1dgbZUxvw76cQruvAgLUvKTOPaVCHPv3Fym7bg=;
        b=P9ae5iXgABpOWuQOGDMEtazMbhMJTqS6vJ5OOJCFDPPD0pK+ThpKKmFL3QCrjTDWSJ
         w7yBIAuCTGzYeWDWJm5R2p1f+5pVxpbGJxvNtS7VDGXJAtTQIsndt4sh+kD7lbEAcY43
         CyC3XzcJmCwM7KXKna68+waclJo7W76p735+PiCF/GZTHIXcKSvoMZU4MiQPGFYzRPmE
         8Ak26HuTotahC/igvsqgPPTzt9+dEfJ62zkulC6X5gq2XLgC+SyNy0dmM+U0Ir7NzPci
         Mb84TLce5AGaq6dSUk+L0qfmv86J5gbwgROOFGc6NjoZ7BZoCO7/TvmGZcPyb64LPy5j
         ZVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240781; x=1750845581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6baFX1dgbZUxvw76cQruvAgLUvKTOPaVCHPv3Fym7bg=;
        b=A4vfJ8QjzQUgpWr81cAPoPc791NusCtV2JCfoixYmU5hyEyqF29WdwuY3AAUB8MAL9
         ZRSPQus5ehkcpXmuEbM5USXPw7m4Dq0Cc2Q/UDLWQ/4cG0IrpYoFI0tU2q1i8zfYHJNn
         qNzxqsy3UKa8BEJMCR7AycP5dxnEVtLaliJp+EAPXj+2jpyRb1T36v30DtE+SML1H6t9
         zuqFDWa1KoIRtHRELx+sU5K2TSGSEamGJkGShE76nWd68tS0CgOzY91JgiKWX7INLfGs
         MAm17NGkFuB+2kWmxbPhrsmPY6FfyfvynCP8NLBNnMApQB6uDmP8toXi/npzW4gmaCeu
         r8rA==
X-Forwarded-Encrypted: i=1; AJvYcCUm71Dw2bi2h1bfbNNiE8oWYwCZrUgAdq7WxHbUuRLtRYikwfkF44imXllSr9/IfRpZOfSfK43I+gzRrACS8h7T@lists.infradead.org
X-Gm-Message-State: AOJu0YwUG+lVGVvx2/plnn1yBuqaRC9i2JvEjLjAsLACsZkBOeysZj2H
	ZbfvDDOLTaxpGIrrS1kC4PR2hbhZY1SxEH/fpBrZyBUplX4DuXlmN31H
X-Gm-Gg: ASbGncvZeYUGxFwf4fHLVlrF6WBFI5JifVg3qkqLJOc1YyYwsdXIUDK3Xz2Eh01VBEa
	X/8zhG6rSXoXWnh5eDbbP3Wi9x4AtorYx7Wn1T4pW1CGY3hzNb6h9gYqZSyfspI4uWPNYtt+kQN
	imXfNqE+iSPFb16lGvBCpEcsWQ31DQbk/t226iuQkX+vtlk9oDPMC3IPRDbxaH9pGgsHm8/6Cb2
	9bmMXUwPWTIWhz2QGBR94ojdXh3jJ3KuNZO4yvSg7ILkfUiISYVUklg74mJ5uTwf2v3h7+5hvJJ
	fal3DBviRgBfTkwZvRCMvf06SOpyg+0AyG3ltAWOD9zH1A/061bkKlYXp1ho4DI4IiSgSTpQyiU
	=
X-Google-Smtp-Source: AGHT+IEOqE2l3xi6qMOQbYwERKlj908Tdc4WnQFs627svU5I3y3cZFIHL0K+7zXzTUOHmPs+LVxQuA==
X-Received: by 2002:a50:d519:0:b0:609:a91:87e with SMTP id 4fb4d7f45d1cf-6090a91097amr8113971a12.1.1750240780979;
        Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
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
Subject: [PATCH v4 07/19] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:43 +0300
Message-ID: <20250618095858.2145209-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025942_707035_68299023 
X-CRM114-Status: GOOD (  12.36  )
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
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index 01363fbcb9b3..77adb1f7ac9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14728,6 +14728,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.49.0


