Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C35C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNmCPN3gRHp9kE1IhRlEIQDYzdEUXzUNt+AYwUzgX64=; b=iZGWUdG0dlZJzAdOLumaYzflTb
	310OZ+IlcLJCHLCbmyuQPoMayPx8B7WBTD3NaXfwCFk9dt9BdQUMoEjKNNdcDXIS7T5el47s6fewg
	UV830/CdViONMGI6bnAouwdbiUA4WfoPJEubssEfKGg+NkPwTxBvmftRHlClRSviHvZFcVPu6d3rb
	EJ/VBsfrbS2Grysd3XXf5AegX09vppe/8veRQ4XAz54TkExriArHDxhvzz7hd29X6mlJeuNB0a7oT
	6Hb76YZzmDR2HA4DHKQejBE+nXjW+1R5WgKoV1Gb3rxsXZdEKXaRY434TKgE29fD+CADppcjoq11I
	WGAad75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxpt-00000008WSm-2CYZ;
	Wed, 02 Jul 2025 13:49:17 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxOy-00000008QrR-1T70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso12132360a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462487; x=1752067287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNmCPN3gRHp9kE1IhRlEIQDYzdEUXzUNt+AYwUzgX64=;
        b=i2Q7+QvgeJJVxvMBWMgn318aW50MCZp4CXHZMFwt1uQqnKIk/GnGKUtN/3RSoaUvN5
         0DCgYP+Km/4kTfjI1B3C6vOWYDOwsKnWMZdy3Jjge1lOc5qdlp6oou0dsfAMjUyODLxd
         J4FOkTdbopzI5xVbT+6OVRGhSQC8/SnK7kuRo7D+cx2WReHAetkt+bxGOq/em2mT48hr
         iel+/xsuakqi5B8ZNJK8p1W8dJVlJ1GduhCbp+XdOX5oSd7wuUquT0hSiqLlYYXJUA8r
         nX9/vuQsy6kkz2GUn3ilJlO+LG9K89bMHRb7TGW4eEU37sfsDLjfxdPKDRUH5tq+Whd1
         BFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462487; x=1752067287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNmCPN3gRHp9kE1IhRlEIQDYzdEUXzUNt+AYwUzgX64=;
        b=BeqCfZFiHSQR/xNO4phrwWvmsA+skYKdRId5Kep5QXcl3Oqn9QRG0o/iiyosGtMp9T
         /66SI114nM3VWEQPbuJD81hG7WhKLlun1DzDeqHyBFMJhZaxmqNhzuWNBPdYswpc6Ze6
         p/RqUaawDqgwqQPCDj5L+2tNhQ6IykgA7+eMSiev59JwTke5H4LamcCrRyqIja1n/B0t
         U/1l7Yhw+xSVd0kxti4xN8Pf26WjY4gcMmWcFSjNzYyzmJNlXLQaMLGquN/QIl4iPMpL
         qadt9/G3inVncQ5eWPlOwA40Sde2qOZ/QLDPbd1NhmvgNYcbhXj6cDlQhtfa/pgdWazj
         5XBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeKCFpxJSjWBebBM+jA6kGSZti8u8nF03cO3V5Bz/K8VPYRoGe+N0MGWRp/0JSSuaCwXfVkM4eMi6Gpf9KZbvX@lists.infradead.org
X-Gm-Message-State: AOJu0YyNuDnxZkEX/Jvj1aeBpqAFqdn/ZOCtGNRFabuM+BFUP3SfgpDP
	68BCm6pjhrB0MgU+ecV7EhGZKHey+6yh4WMQuocE5Kpjv0X3mmJzelbh
X-Gm-Gg: ASbGncsB+1Cn0lLKVqZsEbw7trZIfyhjHCHptyqi7Kd5ppfbiY8KWkdca4thFOolfeC
	Zf1JyFa4E7v9nHBX7sIcyvBSkfRUchIOit0ukirP6IrALixvq9WDag+yeiLatd/BMvq5rLvtmbI
	VUMAP3KsTAaSGzH2BQdchRY8q5B1ePHYoeuWM8+Hlx/Q+d0HfXzKwt3NH75TtATF6bx6qblnMeb
	3VsDFtey4Q/3vcJCba+bJHLN6f9qZQuFKP8vG/wUPYKWR4TSyXhfoNpCnG9zZIN0F2Toi4ZXx9S
	B4V9Kd7iH8sDtKHH2Bxu7uavi9MF02pDrR9w4cWBTQ+nNnT04oS3r1otrpJ+HLTW5/D9sOe8b3o
	=
X-Google-Smtp-Source: AGHT+IEIR8lRO+Q+RXs2O/NtywQw6YqQSrcQ+z7H9VGv25vo3dLO4oH9KC9oZC3d1SPdav0VZxpsPQ==
X-Received: by 2002:a17:906:4fca:b0:ae0:c8b2:3fc0 with SMTP id a640c23a62f3a-ae3c2b0570dmr301043066b.10.1751462486408;
        Wed, 02 Jul 2025 06:21:26 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:25 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:33 +0300
Message-ID: <20250702132104.1537926-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062128_390441_DCC851C1 
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
index c4bf1503eae3..6a89cbb2d14a 100644
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
2.50.0


