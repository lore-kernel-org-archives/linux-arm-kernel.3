Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDBECA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=; b=aGiUTsGQPv58H3GyUeyP5z6wja
	GZvbaiCxyXluW+qFwZfWXlcpbLcaeDuNint+7hs0jhawTXrUbu2IrEpUbM+D19tw0PbXgorAO65+2
	r+Go5dV4L2Ke0KQ222CO+C2Fbu93BOdIv7oczQhHT2Tg6ZfOBBZ6RfGorPadgFtR1MGBTX8U/YADL
	T9WrU/rxPrbqm+49GenE1HGdYjqfMsDjhVvgmkx2ovnhn7M9QytTxFXIQG+6JQ5EVxRTVJpRzxGf5
	PCGDf+B6aDzmK8udMLcxE5vyce9BBhDZ3isyjvArz9HOOmCVbytzzPupbkoGpJXeOicGfmvLJoJ+b
	mnCN1tJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN79-0000000CxS1-0WM2;
	Sun, 07 Sep 2025 21:39:59 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN1Z-0000000Cw15-09Xn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:34:14 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-70df92872ceso33840426d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280852; x=1757885652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=FhF96aYm+Ukkv9WmqMJJ1znKCbkxy3E+bxkZQnuMgtB/WkhwGFbsswpYPdFG0QvsRW
         5rAIygvd8rqyJ9fYxaP34zTYEH8tULTsGeXRHjWUFOBsQYRWo0k02qY8fpjNjRSjQZXs
         cSKLrhYb07JbF2JgKFNfdvoEOATYzTAf+97PXoI51yo+jTRBAkxm4sTviIq/7qp3+yGE
         f0BR2FSwi5ouhwjSgwmn4DM6ttVHSeECGvmX6JjxIEhBMBGWR9OXnWNc7bPMfAzgtD3k
         Ep0F1P9ZJHktlw93anU1AtKpbStSeTjYimZZkgETVaKlW9U2TXtsp5XHldTHkPAhik4u
         aavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280852; x=1757885652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=L7PF/BcySkPvAFQ91AQr0zkzuOHCno8Ge19rnBWf+WWONGxTklYBzHX+An4/KECCRW
         TCth28tM4CBiUzFt6IBw17VPK3Xh+8pG97eP7IlKj6+0SMKfg7kWeNo05IUQyo52/Ck2
         LWPqCaJMwy6wad8EZRu8vgzbbtoY0dbBqIVgPn7UuXlN4cjLeG5IAivUyVo3k7GiaChd
         B9t35Cw8dffI+n2z67hp2w/pDSWG9a9sdvLQtBVJihj5qPJ2ZEys0s4y2q46VTD7N/AC
         rQrDlT7xI/6vogoyzY1TTk3Bimqvxt+QbPhNwHmPYA3/XnwZlz9opmjgfpI6V+u9cxnN
         gW7A==
X-Forwarded-Encrypted: i=1; AJvYcCWA9Lvr8EU/h6Oc6Sw8j9H4hsarL6WbO+IyjgsG4QEpYxKMuAN5ISKso0QotNn2+/xxtqM9NuhsBB/HtNRGJD9U@lists.infradead.org
X-Gm-Message-State: AOJu0YzfOJAni9esVimrk/zPwxnYBaYCzBUMkX++JptSDBgKrG607Z0h
	o7wB687YM6Ysk+3JlzDePeC+yeGlWDCLyESPEUcOzs5ofNeKg0Ejara0
X-Gm-Gg: ASbGncvRen0elfVYEoLFr9bKaODeFkyy4T+mosM1w/7ERHrwugFDrox+OTh4ZYMLJQI
	ShP0ysfwCcCiMvp7EVl5GIQic7yHFDj/Z/lnjV9Oy0Th2CRn0zd8ikSINNT1K+YBRHi2yNerVot
	OkZfvohZNra4+a3XgthNcnm99L8x+b7qxdh3hIVFa1q+T2FksD2QMeoecb3YxdxvU9CXoVhR/UG
	G+J+ZED7EI+5RN86QllSP4ZCqYsP5HAqz/wMy1twGsYwdd0V7D3Mbl/yr3RxFgfqSlhaenq5E2U
	SKeuzc9P095te7ub6cXug+W4EF0hos89M+e2P+sy7W9MZ/JWJtTiXn6fLVsiGqHOVCaoLMZUK1J
	Hd1PqhbHcMtGWM8GCYjHU906J4+Ar1qrr//n1B8LYCg==
X-Google-Smtp-Source: AGHT+IGJCBXxD1HdhEmGookFJjyKI9GVEoos7/N1pVfmlWDpOtSFYVjLf6U70YbdyDJdC63cvg86rg==
X-Received: by 2002:a05:6214:2025:b0:70f:a558:2955 with SMTP id 6a1803df08f44-72bc355d107mr127401886d6.22.1757280851940;
        Sun, 07 Sep 2025 14:34:11 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:11 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:33:57 +0000
Subject: [PATCH 1/8] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-1-ae7600491a7f@gmail.com>
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
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1475;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
 b=aYAN9dC13xRHVHd4UCSMofHM2Z2DK4PUqZAbeRIOmYa+wd5pFaMDUeBybDKdjH25UoFZkbKGf
 WT4DjP/7ZiUA46lqEX/742gxxEVwwZ/Ckuk9IyanEdloEJaUZGxulBc
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_143413_080365_F14988C2 
X-CRM114-Status: UNSURE (   9.58  )
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

Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..173c51b17d9684113bb8254ee0c83e8e74de2fca 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
@@ -93,6 +95,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks

-- 
2.50.1


