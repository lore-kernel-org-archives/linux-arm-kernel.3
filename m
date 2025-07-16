Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96324C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=; b=Em4AFUkCNFatLyKMLixwD7bPSo
	SRo2yYATSyLQi2AVlYhaNziYF83963Ka4BKhlVI9Ym1diyolefpEzxyA6kiaKg5T9JaZkdUt+58mu
	4/aw/dP90XJYAhkeEfcKGBLkF0mOnoMpo7j3vB1ELkCqFmiOTEZLV93+NrmVj+MaITkNNcfQ3LtA+
	171W6XHF3BODtIzwiyH2KZLS0TpIAZIW9b3DuLR2ycYFKzVemNailfwFAGcO9sdBDNHIHQW9pQXjO
	E9qtGLQH43vkl5P9y8bxxj4SnmNC9v0Pb6f1wF6Pvudy2UKVIfIIeqyx7F5ZENkqwmebGiIt5EnDY
	oNWPZv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc87n-00000008Xuy-3y5A;
	Wed, 16 Jul 2025 19:49:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qp-00000008Uny-3mMC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:36 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so317910a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694294; x=1753299094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=ID+xJXcnJwKLqk14VuWAhfNbj+NAIGCopc+OYGmmiqiyTyl9059c4Kdcp2Soc1ukYe
         nXhbUE1PotVwM5bjOs862FOyTkfej8b3k0fOMAG2ujH+TLRd4164g1go9JKwsemwUX0v
         8BaM4k2CwjqDy+4+fY4Ha7dIX3Axpz+iGXLZdAZjnkDmJrZRSID2oZNttYOZZFHTRmvX
         gpBCsNwSYL8/iDLGm1tuGHG88B1oMoi0V2FUFHqsbkTPm20pvQ76sAjLq71n2Qr+ZMFC
         hhqvQ+o2uFbgvOHPTg+7DzWQopCj6PE9gTODNYBvEZ2PWA6qpK1QUyHORGqEFVlpWiL2
         9gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694294; x=1753299094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=cOjodfQP24kL7227a2YS6IeoaJxTh9mGcuguwfDd3UC/q8vOKaccxWhD1S65TyBUY8
         FP1/ebMDYykFreDunVjM4VkJabA23zP1dtRyof47Otr1uaKh/O/y0Tu5ehMK6DjyICiW
         Z+Nt6Kvvbf2FkFowaE8b1qEa7snJMTPwKTZGBQTzKAOHD7VNm+DAWPdGU4Y+uqaX5yLY
         UQDmq/gpV4ZqmnXdh7WCvMilsQfz+UO+4TnOEi/XTA9DZmKBxGb6H0IHCqbEOBkJ8hT2
         uXV3E60d8zR8mC1RD/Fsq4wgZiEYtN4t0n6tS7Blicr6zf/zlwvotqODN6Qg+RyRYYSY
         XWQw==
X-Forwarded-Encrypted: i=1; AJvYcCUmHp/Qh8Y3Lu+4KAbVRE+Mfu0yx3cSyLZaMQQYOyd6fNhjKHMAIsf8Lg3A511HYPFbkZIcVzIXwzJQ5Pktdyko@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2nhJP6jbCNgijDGdIcmaulGu5WTEmnHtIht9JMfgfb1b/pDm
	JP6QY7QORY7aLCszuzlvXiJqorGZJZiKPzv/IpIaWyYjPhbtJOzPnJQI
X-Gm-Gg: ASbGncuN6Sns0YRDqQ+2uVrDHbE2zvds7VelZfkHXagsyFNsXVKiXFKyUqiSnbQWJLz
	FK/lltNjEzGuPoa2IU6dwfw1sTEzD2qETazcFgspt3OO1dv2Pu3cLmvZQLX5ajgyY+SiJFTAvdl
	0Z8EP3+i9jWqxZZojv/CbeVxvZa+YFmc2Nz6ajafsjW14twwY1Z3K9b4ew6j+Pa6ckA42edIZfQ
	XMVrRNj/dmMRWYKkgZvLEPR7Jq2FhuKonTTq+5yajHiDpI7GBv6dG38Hbpys7cD+9YDZC7J6zJQ
	3rb2IIBWsC3eqpwe+uSqNVDv08gW/L1gVLYdWmvnvCB9eRIz8rizV17E5BgV4t0RVYSfezgnTzP
	ZbqvOEBXqWNMg4m7Jy0BVEMA0WfyPWQU4a7k=
X-Google-Smtp-Source: AGHT+IGnJYrIFL/keKJceZG4RSgfZq1LbZ/S54PA0u92gPmYWNBKcE22dBkVtcHoD3MVexHsQ2rApw==
X-Received: by 2002:a17:907:d2e7:b0:ae3:67c7:54a6 with SMTP id a640c23a62f3a-ae9ce07df63mr338641966b.34.1752694294157;
        Wed, 16 Jul 2025 12:31:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:33 -0700 (PDT)
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
Subject: [PATCH v6 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed, 16 Jul 2025 22:30:51 +0300
Message-ID: <20250716193111.942217-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123135_936820_AB941BF5 
X-CRM114-Status: GOOD (  10.72  )
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 78ecbab8205a5..02a44db982852 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.50.1


