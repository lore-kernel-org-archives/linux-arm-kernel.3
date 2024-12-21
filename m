Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDA3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYR35pN6B2ehQmZU1zbMbYa1s94KBf/W3qkLmq3E1Sk=; b=yntquaYBf5bUUdutKPiL3nrRps
	a0hetC+y2wlgIf3ZgbCeeMJLPVaieOEaBnvZqrwUclJFxbEwMH+oKcuHvYHan7oODI989ESOIU4V7
	/Ml9cNx4grev2QHrqEYBjkhoNjie2lObDZmufq5t876uHE4k2pOnmXeXBbgYVs3yoAkKmKJ46dyD0
	KXhWW7dovZY3R0q6ANGxHi81v1IZ0JaBv2K3DUlLtiqMR66d5BIioIcC4x9slhgViiOlDdL0J7QOw
	PHqx5T7hMRgT+0H1mIMHodIlzSuOXVeHLnI6UzXjtndDBDt+q3KIPO5xk2dxYQIx6sFv62Rn3Erbd
	r9WrboGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1JG-000000077sR-3Kh4;
	Sat, 21 Dec 2024 15:22:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1Gx-000000077YK-18rQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 15:20:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43618283d48so21002975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Dec 2024 07:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794405; x=1735399205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYR35pN6B2ehQmZU1zbMbYa1s94KBf/W3qkLmq3E1Sk=;
        b=UPG++HUZffP6jNbpAb+2j4a3QS+yqCklW7j6YxVfBsfF6DKwofaLcVTrrQkyTgOHIC
         SQ2qGlpsbVFdPnjlEl01JHT35i3dBlUORvwZ9/Eb/kbWHbtN2CQkWZcOMmm7x3vLjmV3
         j92IkGr6+7aJ7ttjd6lefLep4hB4qKTE6yT/r2ySFtqWQEdmzEb/MTVIEnnhp8sY+l/T
         xpZ0+c+nguPSx+NdgOWqymKFwphElhCBI3k0KGf7Jvkg6gpwsaalCSGPempY1VuGbep9
         rBJNmDrd5qVSb4hIOFgVByK+8ikq/AUOhqRYTIhWSRZYYjfoPWlJmSi1g4sr89S58iJN
         Gi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794405; x=1735399205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYR35pN6B2ehQmZU1zbMbYa1s94KBf/W3qkLmq3E1Sk=;
        b=GxwdhwiusVJ4C9qcs9+3KyEzaW2MbNibubBvhYBI4fKilqF3+33Tt+XjdeE7OLDsc7
         sL6w/NM5s6briNu6sPTHHg3sk8GX5LypCWZcknDY4nxXv2UThIakI8uMeyrnEEntJGFK
         6qqJu4o/zBydjYPMT5p2UDJr1zja75grCSjP7rMDSVVWmbZ5vLYR6g/jd9/jXQwwDrov
         BRDdurgt8bq0//AUxgc85D8bD6JA0gIjk/Fe0HgSQJpHgnxWP2ps7TKMhw9yXpcoxh/h
         dl7syBgfg96OHEO2YHYW4rd2jamM4f8QcDwrBkKki/FnTdSLoXVnyFRogNvX0apvnUsn
         1p1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr8WHPPxPVxXNvVbriuoRwKvzKRiKtEclfP5EhiOfYen3doFnnybkFVxSHRryWOnI86dnZjCvIDywH23x5xcxO@lists.infradead.org
X-Gm-Message-State: AOJu0YwtSP9WHtQf2rRQ74ggub32vtSaYUeUD3AtQQqrhkxUWEiisspQ
	6j5DXq0n+E8x1Gykyv+Zc8Ab7uxjm7Ju1K5cmjX8f5BJFFakM7oP
X-Gm-Gg: ASbGncsekvQDvLGY3IqAFmVVEh89FtNgwB7j49wVLcppp9rmQN0voDEqtYgBmx0GZT7
	PCBdEN+VV8q5SY4xdeu4c8CR+jGWF57UbhmMNyGiP1TvIAkNJlRyeDDqtA2GwUs0lbbPp6KHnI9
	f4pdFLEOmcsV8hA8F2A8QbODSZXmgSQI2bxDy3TpIFy3MqHd8Q+9EHImOINxlYB4v+a3D8b7HWK
	GdxSta00Fzh8WcYbq9oWNbH9th3zCRzzRPvYAF0linlyl0dbhZUVprzqQNrzBFbLvwOVimat2P8
	q/6R/ZpAO90SEgcSPqWIJYtBKqzE/gvW
X-Google-Smtp-Source: AGHT+IGQ1CK7WMo0t9Nu9b4sWeyce9VPk/h2HJZhnP+Bz9hfqh4ZvhyagojUZyJ5UUpegOnoi9OgsA==
X-Received: by 2002:a05:600c:510f:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-43668b7a284mr63092815e9.31.1734794405388;
        Sat, 21 Dec 2024 07:20:05 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e126sm6629046f8f.65.2024.12.21.07.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:20:04 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
Date: Sat, 21 Dec 2024 17:19:36 +0200
Message-ID: <20241221151937.1659139-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_072007_329954_1B0CD460 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

Add samsung,exynos8895-hsi2c dedicated compatible for representing
I2C of Exynos8895 SoC. I2C buses may be implemented both as a part
of USIv1 and separately.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index cc8bba553..70cc2ee9e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
           - samsung,exynos5260-hsi2c    # Exynos5260
           - samsung,exynos7-hsi2c       # Exynos7
+          - samsung,exynos8895-hsi2c
           - samsung,exynosautov9-hsi2c
       - items:
           - enum:
-- 
2.43.0


