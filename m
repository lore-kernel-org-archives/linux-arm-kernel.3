Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1021DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCsk/rfL/dXjGmxlvAv4Wmgs717Q0qsPD356Vdw2nxQ=; b=Qzf+Sz5ZoyS4IHGkOydN+99evS
	Ev1b7UWdgTeQN6Bod/NVG0Th554tNm/rGlqR4xKGMYjolAojeIsNqFautVyMf1R0mIAQ2eioJxNAr
	D+LXqtO+HoCW5F+p4wWkvoGnJUaa+36aImdFdMfkGf2S1bRGC1hbfAJXH3HH5vqCJG+BwaK+jKqet
	bhhBlfR4T/FQhbKV1dh2/Y4Qn8cETfDVh0hXvTRGMIqg/cXAsKrLvKgHnIoyXzSRDIuIeWPZxZTaK
	UM2JYcqDJspRfsIbOn9H/2YO0a04DCpTm/VAniF/PtoYLwvpZYdZhsY/LMu72hX8XaZbLimgLSm/j
	ckMh418g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzPv-0000000H4F1-1t4r;
	Sat, 08 Mar 2025 19:00:59 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1N-0000000H0QW-0tec
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:38 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac25520a289so299946666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458936; x=1742063736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCsk/rfL/dXjGmxlvAv4Wmgs717Q0qsPD356Vdw2nxQ=;
        b=frL+T7qZY3LDxfV2eHTe3W0d3yrOrGu9Ubdq+5bBKqOT2yQbxe6jRUgg3C1opl0yK2
         q7GQNdvjLB7P2NW+4wR0ja97v5DKFa0qHf1ygF5j4vp4m6IIxSh9vkvHuszNZlWTlOzI
         YE8KsO+CMAlnaR/7mKAy8oqyhnHV3pEGyDVQDS22yZlNzUTiI7EGtmIRthHrROgw3f3b
         +7IlYmn5jC2SUxXl3hxTQnOXTPHp4EZTDcNusKWOh6inVySxzaCIvTKIsWv61rNmNd5x
         hn94kzp2R7mxFrrT7lu+BppKechcqWL/SnP0W2XbtfFGC4bTduNIrKBwCm26Qkki5KuL
         nscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458936; x=1742063736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCsk/rfL/dXjGmxlvAv4Wmgs717Q0qsPD356Vdw2nxQ=;
        b=fNw09svd4h+dhyfRZrjUfTLxAUxuZPg3MIwg0ch68GmK3Dda1k72zOs1uCsRmT7V5U
         iYWX5iYLcLjkopIaiB2HcHJ1tioq6MTI9gWjHJ89seizW2dwRhf9aCLSnoAvezuPNEXa
         pDzAoy3s6jJ0G/wklGLa0iLYqlyfjEA/Auv5dIWNjC9hbrjbhzJND77KxsZi+BsXEHbR
         IWnpUUCC5jIJSLr4CyEBWg58iKnyUK3PRECT9PnHeo6mWwcUNMF/LxfJlrFSWoZG7Kdw
         cgfNFW8kWdhhNpltx8bKM31+IosTnLo6dRMzRMjXDgBbZHzRoqfx0s54br7nsY3NTCrX
         k+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCURVi8G9mJ7npfKcrxn9kR92fAPj5jL9VlQRArhtw9qc3SSaRCOOR6qFxWqBxwl6BHcyl9Az3mzDFOprCq3BCDv@lists.infradead.org
X-Gm-Message-State: AOJu0YymgspFZsTcOoZ3ECul1ieFWgB7gY76l36OoZtYKy3GnxcKbTcI
	Ect20UKvBIoTKWeV8yF3gIoytWRd44hXLsiZrkiqZ4fJhyZzmd7h
X-Gm-Gg: ASbGncvPygWdWk3QpThRYmKgTAhkw6fu0fr+lkQIKhkQMtRe+D/JAtrCwOqOC9cfVG0
	xuhy/PrFKbZ9W9gP0pLX/bmzrwDT46IAm1IcSjMulCqNi4LczGaA6sF559jqSMWhpoV3Jh1/ZLX
	uqvO6YfX92Rh93ZwoCMDfSM+p4kYJh+pSz7HTpS4ApVZrifx1TPZDrfd4/K7qKmwq6JIUnF5V4d
	UmVC7D2pqVhHXDvNKyiEPGtuqBmgO71w+oX2g404bgu/JoLKEeLFIFdU161wE7EKzuCF0NTKd6h
	5y4L+ZOwpnkkjzlelHic9xfw8vXQ0Phr85EdffeBUeNdI6dhbBb49mSEsw==
X-Google-Smtp-Source: AGHT+IGuZkxoe/YU55gAOydwcd3lXHtaguNyV0TNC5ENcmXJiPj/O25J37irkr3OZx/XpOJhzTPfZQ==
X-Received: by 2002:a17:907:1c9c:b0:abf:69e6:438b with SMTP id a640c23a62f3a-ac2525e040bmr1055808066b.9.1741458935572;
        Sat, 08 Mar 2025 10:35:35 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:35 -0800 (PST)
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
Subject: [RFC PATCH 15/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:44 +0200
Message-ID: <20250308183410.3013996-16-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103537_250329_D2B1E527 
X-CRM114-Status: GOOD (  13.62  )
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
index 7fcdcc57c8ba..84078626ed5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14184,6 +14184,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.48.1


