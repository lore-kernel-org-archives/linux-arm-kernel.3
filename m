Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF5FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=; b=QE3s6N8y9zTyfWj3GQz0B0trv+
	cR0SDXZSWWqjtbF0q1zRL7g7EZ17iJaZKI+C2tJ/Yrb35yaCi4dM+OQPdIaHl1X/yvChWENzYZ5bE
	vkH/qoLfSXMDvur4mcRaYKWxbZdXAJ/NajEvute9EWpI06vT13I5bTAWFFYqsDGRUnVhjQkHj8iNZ
	qotdH1mNx1vAvA+6dxg8bWYT4yO+xd9Lyc9ENbeYvXE9KZr5YfG8ol6j4SEN9f9ZmjFhhhBD+yZIV
	DrxFYoiZ249juXsW8e7ymISPuZbEUvd/m2X+ppt2mcvc2udkGIdQq7Q57iCqGGYT30666zRbEAU6m
	dH49oVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnTz-0000000D1W4-3SDq;
	Fri, 18 Jul 2025 15:58:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxs-0000000Cvtm-3Mod
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1779726f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852335; x=1753457135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=VExs6x3+lDBR02HxTJJ/q3rNSck/gDUhyZtZgWq8oZME4dS4rRMLm4HdUSC0xP+NCG
         AFhGj8HmkImJHcLwVdOAK01HATBUDIfi9zwqbzPf+Kzr6C34xgBCTMYhQqBmTk2A35JC
         kddcPA/naMsBOzVgVaiURnwBlon4Bsinuh7IMp6/qq8/044nxpFWsqJAWI9Lh9PeqH6/
         RH94ljArSsJKiErPGvTzY2Tg0g+ZzYjfHnlWq7sRTgbJFs2HHO2Mq3dqzmin6CwyVVRH
         hxw7wnbXO1i0bcN/ZcKz+S6GmyZU4S0hTfzu2z6S3fkL00s/16jPnnspwVukzWkXLqwl
         Vs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852335; x=1753457135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=Mm5ybSpo1YVOqL9b27jCxq6NQwgh3vZsaxZR2XuIRE+RmIPoDpO2q6+PF9LFV16xXr
         eveR3XUBGoC8gwqRtDL0pjzLdP7Qq/U9KEh13V0tSBEs+zD10owRat0oWZsd/b4rzrRb
         OjqHuOJALltcpNfnI9lDCHp9A8szqXpVx1N6fwlNAQ77YMzDIaNs4M3xXxu+z8qqh8SJ
         9KDxIK24PlT9kNxhAO+roWSVQl/69vIQQJu/TJOAHVQgIq94uHs3YDmahbdhhXtGMVLe
         jVg5IPF2qjg2d8xCTb2gEDEm58ufNUsMeNtVJivf3tY3izVzTuQzNEG1lkVqvIcDE/wp
         ggpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFdWD0+XP4c+qCv2nKGQ8ciM/pusoWlHiTEGq7frpicbGTdQNaS84eYfn3RXaxfcZGQ794BwY8fg+AiKWmOGAx@lists.infradead.org
X-Gm-Message-State: AOJu0YzwSHTKFfkbCXsWcfMsvOmYTDtHj/XVV1eT8pNrGaIsnAjXooS5
	Y/1kKVqgY6p1Rv6w3fcL2oyZPGJdYqyT+k/Y+FMn880U4xdTU4ckkFH+
X-Gm-Gg: ASbGncsB3pEyWO8QnXnQJeUGhjQD7Brl01QXSIpTF7XdkM2/aZ5PTIWgoEJEiwGm0Do
	7nITOPXW3vo5LUxL4veiKKD2AdwlqiMts8/MyQg+2+js1xHBm/hDZHFj2Ubo28eJlqOFfvgxfqr
	bPC1Qb5dz3EERMbu9PE0gnKTCHLsPbjX7JhEhaqrcXSbr13wAzllGm3dx/mhFGP+s0rPJEaeowm
	LRG3n6xTAM2SfS15lTgSpf0jba1pVua2yk+Xs0fk5rWY2sI8snWI3Op644oKWN0xpvBllI9JV9X
	OXkU7QHueY56YTAQCZ5rLqkJzVamdnAVgC0HFfAP5/RNx+ms7AmsDsGDF7e65nqtyYnj2s1MLgp
	PZRNrKtCFyFXDlJh/FGj7AAzElftt6vIcUNA=
X-Google-Smtp-Source: AGHT+IHM9QE6OZP4eSrOZOx7KZfil3FjClDdGdknIIjf7C8wzDU4qPEPgS8586sPDWWAfqGicyvjew==
X-Received: by 2002:a05:6000:4b04:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3b613abf34emr7129638f8f.14.1752852334929;
        Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
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
Subject: [PATCH v7 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Fri, 18 Jul 2025 18:24:46 +0300
Message-ID: <20250718152500.2656391-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082536_837639_21ED77B2 
X-CRM114-Status: GOOD (  11.08  )
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d4..b345305acc4c3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.50.1


