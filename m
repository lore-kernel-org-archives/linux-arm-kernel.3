Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A09C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hcW6qgiAPvU9a2XpLnaGi3h4k0DnWRZ/LjtvgA0+3fI=; b=eRmKl0f/DpcPFJ2eK5NFpweiRA
	zHgZrYPP/7GYYxXdDiyNW0iOJab/cyQacaDn0jfw7QywcJfss9alRs+w9i2Z1qqYh9P/ce2ZrF6ki
	KuJtgodTxsadJJeYRXadpFh1QbaSRwpSbT3hdSe5yq2EiB2+R7U4/DC7UeVJzJVr/zGeja0YMVeUs
	J3WQpKkhl2n5e7qt2WTuMAoHp4onnPYXjUlXSIMKTnhQzni+LCZl4YMvkchaTmv2uro/iHbkSkglk
	veZehpSyHMnwSfCouVWIiNyvkNGYK+IfenOLf+5wOH49d6GLZxeiTOjodtfreZg6g/zjHSm2jPSi2
	sPcXL2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcI-00000009Xn0-41Bh;
	Tue, 21 Jul 2026 13:34:39 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbz-00000009XUS-3pQT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:22 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-737de525d2eso9544200137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640858; x=1785245658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcW6qgiAPvU9a2XpLnaGi3h4k0DnWRZ/LjtvgA0+3fI=;
        b=F+zIEhtGJ4+9z17Oy7rUYFJ/aEJmg64v2U3oUow268vimuf+pLKtDAkGnDNe707T3W
         uMpZei3da8WFDKJ5gNCO8tSpBiABSldyHpM+D1mjljBuPQwGzqM5/YOMqcMRELvpYS+Y
         XotXIZl07bYJPNcMYgq96b0113tZY54SenTRfGfNS9ZklvouenEkgjEl5oG3NEtH59jh
         pGE3oBUZQM8u0GR5jXUUGFUZ8c0dRYEe489zac0PoMiToqJRIw0TaW9MMjcSqehVLfck
         ZGCJWQkM62mTrBh4aqTN60l/4KNERCioEpYekQMnUNvXieS+49HvUqx3tmYeAT9IVOCr
         ZGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640858; x=1785245658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcW6qgiAPvU9a2XpLnaGi3h4k0DnWRZ/LjtvgA0+3fI=;
        b=fyLf1bIc0OdxY9hl+gcvsXgcRFSagoeCtI5xw5X56OxfBu0PfkTI5jrGX9fJ8d3yhL
         WyNPwV/t6+whe9FD+DB8xkbKaxdWlpCqymR5IQIKg0cIeEn5lx9WTE/8KmlnkICnlekn
         3bp9M+ILFSPwXWKX25ITNAbMnfPbhjejo4DmW4sByAkswK9wMgl+nNDkfo84bB+QJEl1
         zJ73Tixq8NNjKETrYiVK5r0EtMwZxyw4hnZYZ1g2qaXJK2gEF/a9WHFJEF+4ctnw74st
         x3EBVovztwy14lL3Q6fCDm+3VQPf+XbEqBFISp2rgY+0nek41+5VavlW+kMbxZlrb8E6
         51dw==
X-Forwarded-Encrypted: i=1; AHgh+RpXSSOBsIlhxLlebexvIh+0A7LA21IC8VeaJYJ6sycU49GM4nThRBcyUq7jlIStYY9Hp0SXyKrDpJlfZhlkdWbU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2YJ8gYtNPxxh0v1Ug7B4QSPYF+eee9QVKNazGJRJ/Zu8Dlacr
	VJxlmq8SCPlGQxQK9/ZZBZMO5RhHjYzFvo90i5u32SCfIm2mhE0MuqC2
X-Gm-Gg: AR+sD12IRASWDLYwZ9v0Os0A7UgZXxEKTk/wVUcJmHOcykJLYoiFSILtNxMNsBfBMNH
	1H0rcAnD4HZvcZSyrulyxAjxuh2qriEF0hmpFtPwjIbLxrIDo00MvY3eRjDMKAUbeY1myV4r9qx
	PzBfHNpXF9bOjTP3hf7k+/RJvbLVJEbhImNZ7RttdrpJLSWwLiej5eE93yReA1Dp+n2+E850t6t
	X43k/5vP/P5fYr7ZB9eipYs+/5pZR+FNCQskj3amdLftOu2AzgpTk2aU3Sg4IHolLw+UQ5XxizK
	NWZoWdAEcZidcKApFI/zkmbY/HlHcO/2ycBTwSi638F51h/AFglpZTdmw+SjFFQ3NrPX55aJHR8
	kpZv5E4njRAXpcPoFs/ga5OaLXQzxM6DKkQwawXrIwQmvjbO2nbGiy8qqX/eR73I9PyyuuY5dAJ
	7M+j9LdHdv1h1au5WtaWPVUz0CgLLVP2GswmGNvsoEOTFXZfiOtg==
X-Received: by 2002:a05:6102:4422:b0:726:cd42:d039 with SMTP id ada2fe7eead31-7475374f766mr6094327137.24.1784640858518;
        Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757c8048csm11903908137.0.2026.07.21.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Remove invalid rk3566-bigtreetech-cb2 property
Date: Tue, 21 Jul 2026 10:34:08 -0300
Message-ID: <20260721133408.44240-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063419_975802_B3B55820 
X-CRM114-Status: GOOD (  10.73  )
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

Remove the 'ti,rt-thr' property because it is not used nor documented
anywhere.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index b6cf03a7ba66..542269c338da 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -569,7 +569,6 @@ tft_tp: touchscreen@48 {
 		reg = <0x48>;
 		status = "okay";
 		ti,x-plate-ohms = <660>;
-		ti,rt-thr = <3000>;
 		ti,fuzzx = <32>;
 		ti,fuzzy = <16>;
 	};
-- 
2.43.0


