Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96E2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=; b=QGONNLt0pzpM87FZx1tD7baumf
	Mur9fiMotu0zw1cx/+orrajIACiBf62xpJXCOD499vWeecpL5Dqk5Zj76NynnsgmH6Cd9or/LLtvN
	WSmWrYnpqBdxw/9FlWz1cVK+qtdGUSbvd9QXyd3exiO16PnLg57H5xUkH7/SwO0QSryvKirCGQ2nP
	9dmMr5IbbJ1IHNJIu4D5MDwgCE3sjM42pCCOVYZauvScB5uwf70DIXL5HeUCxPcAl87jOhO46jvSK
	18kcZkbRUTJhm7Nt78q5jXWxw0c53Ts87xIEwSJ9i5cgDsPxMfNOD1DZCJiL0syzz2Ga59AoEDGtM
	uGNiBzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz3a-0000000H0xb-03bX;
	Sat, 08 Mar 2025 18:37:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0M-0000000H05d-2iLu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abec8b750ebso483182766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458873; x=1742063673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=ZsAJbh0XoVnB8/zZneTLabccTQcYtvDiPyUc/0IkCZW9QhRxNxaQRyQP0aKAdIKZ08
         fygkGe+TX3fy1OjuNVTZNKh7Z+27Fvm3coX5T6hU6bW/ivQYlSO60dSo5VEi0OHcGsXv
         d0tgIj1i8OQHewVE8GLVEmc+P8ObCx9D08sjd6a5WiD5fqNNCJl+LUddbhyLwQtpttxH
         k/FAZXhaHC4DMTmVF6yPCb0p/ZhQJ+JaXbOWR59rC5sHgVaMR26WCXHRDk+qJWF12P4F
         Dh065+a2sO5M3qPx4T977oxQ3+wDzyVnPmXv8a3PvQYXDbf9auyseHAzk37lXen2WSbS
         hneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458873; x=1742063673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=oSNNJF5nAnJ5YiFydyxC24++6LpKsF4OmrY2aRVEoMhH2O8Kp0iQNFWPb1HBNNypfA
         B+yki9nG58Fr1Vty5EMcPYNCo9TtGxp6yKunlJwnvtZPxlIyjL3HYEa8VOf7LmbvsgfZ
         d0sRYTxx7ztE0jNJu9SGlGQnjOENoRj3B1Y3Edh4j+CYzdXtvbVuOdskQVJLiBmVdw4R
         QtK1n9avKGxzXLQB/DNVMSGokKdJUDSKLkh4c7IMg22cgmXJHf6QGPD63pZl49K9ypHO
         ZhkoI2stbVzzogF9l6BDaxmtxgIkiYRBmDlw0QxM7vIBLeEp35kyOMbCRIMizXjtAGZ6
         QX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9xKTQweAPQ4xtl7AVQiwKJz15SPNJ/VqSfvoabnfZnsfyhsCX5Iw8YrRioRdXeRUCs+DMc6zOC+YpAffKEzn/@lists.infradead.org
X-Gm-Message-State: AOJu0YyC80HKq3jvXKhxD7FKibTlBtiKFXaiuKDO9N8pwQ02MQa9Ruf3
	5hAbX76VNsYoOBwSXPfFzlmTwabVNS2/07eiTXvTg1TvH6Lq4Z7E
X-Gm-Gg: ASbGncvzDnvRQTi6so2Kel3VtoDwdL/+bcCl2MXnoPQC+OBkPOK+sEQPTokOYTDCWIX
	ppeqmttDa930heRJy8usyaR8dcJBww74dfKLp6H6/15Kmp4TTv8q0NuyRFWXtm8qd3MMqJUnchc
	NL7QcvXNIaQ1CsueviF1Mxuonb56rh/ZzFSMZAc0XOonq6WOiLYkGEtstXT+mNCj8qptMZBJI/4
	ME2WZVntZTL/CBrxn4Yjy5LmuGH84Lu8DDaccn5ZMvcJVTta48Mwgmbr6jciBEQWm2H6HfiFeKX
	muovG1FkoZFObj9HVkpgc5ITz0GoTm/yAWuMyj3yYAGTTc/PZaQWK/tLVA==
X-Google-Smtp-Source: AGHT+IHHxecPfjzvfdbEyvTYOJEPLEU7vh7wD68UjIC6rm0+kpYMQ2ocUKFfty06j22eXjZ3vEkUfQ==
X-Received: by 2002:a17:906:6a29:b0:abf:40ac:4395 with SMTP id a640c23a62f3a-ac252bb26b7mr1043960266b.31.1741458872544;
        Sat, 08 Mar 2025 10:34:32 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:32 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 01/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:30 +0200
Message-ID: <20250308183410.3013996-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103434_684436_D367FA71 
X-CRM114-Status: GOOD (  13.01  )
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
index 1916d0636408..8f463ebca056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14198,6 +14198,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.48.1


