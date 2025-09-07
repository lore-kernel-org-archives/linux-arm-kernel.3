Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7520CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 21:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=; b=U+4ukyDgbZHTaLruAuki/amMcu
	QpeSrCk4AclXzoOVTUpr4CEWssSV0uMl4Vu1s2gzvD/k9pAVXEu+UJ2VJB9u1OADqMh9eftlwkfcB
	YtIy2uINxyPWqTOG2aLTH7xLIlfikHYetkpTvaT9b+Y2xkisqnJumCMb7eP30paRfoBlhQcH0Ujr7
	gIxfo9okMyZ3T1n2DSlLxci04CHn7jsaXs0+J2v9bNglrga7f6jx3o3/7Am2i8rElMhS7SD3ECIcB
	jzwvpEKgHue59pWiW4RAq6gTRk15Xd05oQTkbk5o25v1AZlOTNydUG43aUVOpZ3qXtZUsVXiuuAJA
	wwwqC/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNNr-0000000D1uB-0kU4;
	Sun, 07 Sep 2025 21:57:15 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN1d-0000000Cw2p-2kq9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:34:18 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-721c6ffab58so30000206d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280856; x=1757885656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=dgz/DYlOykyOH6MQ8Rj8GFF5myCywq/zKF8nNOl+qCDzmzXs1xNz/Qldk1m9qylkC/
         qn//QA41fxffHyghFgcwvzoe8JjhBjrce73yxDrRRvyT8NAdEn7jJ9yMlFy2oqDhXH2t
         mQuxlRNZFI708ymAQrOlI6jreQwdrLVQvutAyy3qhBJOpXBGFHkIhvGt96OgUefQOPSB
         MdZJe94B5Xl5cr8F5PBnoz69I4969s88+a44v5P8+FcULBbxYVrwwBIUj5U40Av16JH7
         zccNM+ItN3f4Z5J5h8tCs24WHb5ljZR4rNfj04qMNXThqOvwo6v0qIsl3sN9tyNU/yAx
         EAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280856; x=1757885656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=uh9zPu2olgCbeWlv9ewXRatdrFFVtTxEi5qAt/Mu83qL2aUo5aXhS8JqRFAvydxEY9
         7mToitWyvPOZeG1LuPAjjWkwbZNBbgjxyoDbgdh/ZfP2d9X8+xmpGRkI6dpcTOucIloR
         DUL6rQuzc3EMYYvi0k3BzZTdTidkW0m4OTugWM2nE20wP+XJjBKKk92a+fJ/1kq0j0NC
         NzjvcoUus5yWlrHd1Csh9A3L3iGgvZdkewcN8lMDvLcfrCn1LVfpYfF+TkH2XP8UqIjy
         pDvphgMbrxlK5IMogFQhsXbej4pKG4EV8BCRtRsXXarf/Q6qvN1rF19FleBDwCWD6Z2x
         pNDA==
X-Forwarded-Encrypted: i=1; AJvYcCUsVL2FoHs9uv3FGVX16S3p1K6waD7kQ5ZCFFnIKNe4Fke6t1fDc6r94y1/9qfMBpMQt0bsi6qTPTtzUToaTZ5j@lists.infradead.org
X-Gm-Message-State: AOJu0YzHX10itgUIOnDSX62CjQjitjwJx2WLZa2o6dyXDOiOWovVUYYN
	fOVZ9iTASCxmFxVjumG5o52yCJXSyd2+m6mxFGAVt+ncDI5Z0HtuZB4/
X-Gm-Gg: ASbGnctnEQ2nj/Bhv+sbHNjkCsSj4oMna5G6E6wy4K22qRmx9U4mh+wEX7ykN67UE0q
	2qAFHQG+LYC64khAHBy2JiHR6K+GxOr0EvN0f2ZbzVlS6aABaWx6/g+73rc9QWWJ67NkQgwT/MG
	S/WlkOOjEdZkPuCvw06eVzVLR9QD+8diZ9Gr0pGVB3XiTpWfC+HJVuV7ILbU/Iv/wY0bW2IzA2g
	2ZV9/txcVXk4k2du3d2gFzMlVKXRIbb1LWfjQgDP2L3j374A51jR7V6AGXv5nYRWHPdj2aUi00B
	p2MKrM7EZQRzvaXmjzqyb+0UFfpEWXvqS9h/o4z9tcG0t+0+MOSlzbtz0xmNAVw6GsfmaOpWJAy
	rUqnsNahTqY6pjjjLtcZVnIIGTb40qj0=
X-Google-Smtp-Source: AGHT+IG3tc4UqZLIbUYa3u+dAbhQ/QbeVf+fBuoOSlSOV1ihSac0zzoGAZh6p6WqsS9+p8G55Xq4zQ==
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id 6a1803df08f44-73941de3724mr65632216d6.49.1757280856560;
        Sun, 07 Sep 2025 14:34:16 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:34:03 +0000
Subject: [PATCH 7/8] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-7-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1022;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
 b=lOkob6UkHu75G4OJw7lY4gfQQdi1+T2mj57bPrVeHI/W2Kin6I+t/lTg8KuAD+XDVDOrTx/9l
 nwsgyXEjPP7AmO3jtshytlqEjkzHrz+oxO6KHJhvSJj58jYNEhcvha8
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_143417_700370_08742217 
X-CRM114-Status: UNSURE (   9.52  )
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

Add samsung,exynos990-hsi2c dedicated compatible for
representing I2C of Exynos990 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d0067e7e7a73a58e8bcb4aac71e87dd8..6fc03281a8f8440ba64df569f6c83ba2d9f6915e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true

-- 
2.50.1


