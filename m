Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463F4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ltav9ZVsQNw/ay9m7Rz0/zHo6gLRzWiku8aYgk9owM=; b=NGdbBXH22FDVqFpRrZooz0DJgl
	54eZ31GojuHhQ7yAc1bIPzM0XVCZlLkNqbh2H9FPL/7iciA9AIkRVAjL+XbWiDE1yOakGtdA6EpOo
	S2pjIdIKOjxmSULVf9PkBFPa9YvLEtUG2uuVg3ikotZq93x0GO/CYL4TxMxYTo93VP7VjC84Nc+4i
	Xrc0sHwTHTMXLlJ71VszGThlpEodG/57BmeXswC/eoGe8OLw3v1mliJqYruEzSUD8awJHmL/hxWHg
	BJIRuQhNpzq8ZW9FlvB36YA7JXJaInNVxqgeRJa3Sy+B0FhRL3McTYK5zC5levd6PsDWzmbK6/fpy
	aWWYTWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRUpF-00000001mHJ-0giM;
	Sat, 28 Dec 2024 11:17:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRUmu-00000001m08-07Aj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 11:15:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso78533815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 03:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735384518; x=1735989318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ltav9ZVsQNw/ay9m7Rz0/zHo6gLRzWiku8aYgk9owM=;
        b=HzCVgF8I00yRJasRi6DIedmfm4TvTIXmjIvLvAeDK1cQELTfiLhsa+srvJr22BJvdD
         i+Dx403ffpoJxQcRpStotD2xwbL0o1a2fyDCRRpgzgXlLdTuPZFU895ItJfsJw0bgUYY
         D6i/F1j1SM0ZT5PWJLnPC8jNBxFWl59u5r9xRm5+kDXZxeVctTdhASyqcEH5/jX+CWd3
         o6GhS7JXETZEwTMiJu0ugVVQ2iYKAkXiZN0kJhKjtHLoEqAywEH2h1if5SczxwXyyLvD
         IbZF4tEbnFv2l7K+PmCHEczOon7sRzudyW+8XSdC9MgQpGrv4JRhRlV6JvvhgghHjnFg
         Kahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735384518; x=1735989318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ltav9ZVsQNw/ay9m7Rz0/zHo6gLRzWiku8aYgk9owM=;
        b=tPgifcSIsueq/YWyspamjqf8V9zLzo8BsJO6wLz0ZfP/L/aFT2FoFYe4egQ8VKcDsA
         ISNjBn1U9DMg+/VjILBIJzcMVNEIXHFDTcdPi79QAk7ZWBflfBfIIALYvyroY5JbevcQ
         Oyowbre4+G3FL/W68ufYoyqC1mcnchyrT5/uJCHtgT1PLHygmYedB5dieHk1jcqfUZzp
         x9F8sUQYHJIK5xmlZ4Pgpoxc4OQpwLbZkLympnbPCNNmAxeWQzKsBZASSiC28OFCcAWK
         Zm8AtklTS9HnEwIAdXtrTT52Pm1Asxqc4wFxk7MXlvlpffxTyLnJvGL9j40mC6EG321k
         EYEw==
X-Forwarded-Encrypted: i=1; AJvYcCX9TkBmYgPo2iddd4AaF1LD+iXjiZahIT9va9La9pKtpTC5U9mAU6EOpN9+8I7V9SNxw04Rd6te0myfht+YvkKe@lists.infradead.org
X-Gm-Message-State: AOJu0YySZRoa6EoqRrko4UBDc3Byvoj/xk9jGZ6J/kFYRzf0I0HenSI0
	R98yPnS0YWF2kxn33mkhjVxgdt5ysLzloWJOcBBo3vZoQUDH8eYs
X-Gm-Gg: ASbGncumVx27mK+DWH7JKrChVY6hByZgTEzUWIGDksQOMRkjjj//roJbbeGG5RdCuw+
	Nx8SvlOMlQTmovpOukkY2pYUhmp/qvtlxXRY04PNgkTpFSJTsHH/RfkqGORqYFy5+CCNg0ZLek7
	g3mjPyygipIaqKSqWH2f1rPlu5ubDZIvtOv0fptT8kE/FNcqbimaWRVIZxweckcMAKIC5Rmj701
	zgQ3SYYNEZSG0+PSHN+B1wxz6TzJV5V3S5R+i/IuDHUVxXWLeh9IbGpDDcJGtfjAgOyJjUeJWj8
	G77tujpkYK9YpxQYT0MpGhPCnYlUT+1B
X-Google-Smtp-Source: AGHT+IEgv+cKrUOJW8hwylWHpkHUGKX29Xg9SVZ08QhDJLZCSBrarfNiSgBAG5RqSBU1af3vUxuGnQ==
X-Received: by 2002:a05:6000:70a:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38a221e2c89mr26519555f8f.10.1735384518226;
        Sat, 28 Dec 2024 03:15:18 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm326226075e9.8.2024.12.28.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:15:17 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
Date: Sat, 28 Dec 2024 13:15:08 +0200
Message-ID: <20241228111509.896502-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_031520_068447_9351644B 
X-CRM114-Status: UNSURE (   8.63  )
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
I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
as a part of USIv1 blocks, they only require a single clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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


