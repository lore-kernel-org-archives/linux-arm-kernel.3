Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25A6CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09lg+c/R4s/y8iNO4IclaAxHsHOS/zunqEudLnO820k=; b=xlbPSDEwaDtdK3hVbM9fkYp2mK
	VCgI5vXHL2VRmLAMFT6R92Ide1dgTdD6EsBeMFJ8phSnjOJfXFo/04DujpeDQHQNKZ5NZiPsR/VXA
	r2riZW1YrN8HAvyIlw3BGOwfoq7/NTlMixKIfYrzm9Falo7JdLcRXNQt8ntd2ytdPq2A8L5DxdA4N
	pwraX2zQxwgExRTwOaM2cHiCYIl+i2V8vkYhZzKfKH5nUzVT7X98ngHGYVedGE9qiO609V29J9P6Z
	mAE05x5amifW/Jf+60OepN3cdcps+cdGBmnPgCnaLBQJ+2zqnRrq9sKDusCNYous5sO8o5WqJiR1N
	oEydNAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKE-0000000EjBj-0PmL;
	Wed, 14 Oct 2026 07:22:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtK7-0000000Ej8c-4BAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:22:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48afe75f055so88845f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962570; x=1792567370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09lg+c/R4s/y8iNO4IclaAxHsHOS/zunqEudLnO820k=;
        b=NiE84iuJItrm4c7Dw5mHDv7WrJUEziaOqEANZZMbQDsfew9GjJMX0XKhYsBK8qvEcF
         p8HQ8/0JsNis03oEabvAMo53PTb/hBVW67cqbHeSXWCRIQkPdA5C/aJKLAtzdkk2uZSm
         mxSGSaA3CzbOsoXFZS5KVQmj7793Rk1drV5DVXm3J2VsDfLZo4MaY0MFtJbM6fA3EvJ3
         JnLFQoAIFiB5wdMjIqFg9O7wVY3ygkBmwH3DvW0IMYA8umoc+tlRU9/Lnj1C5Tcjo4ob
         l3z+Vw90DJFPoCW0zqpoZ6r8u0TttY2beqgynmaKwgWHgFUT/Egt9l9m1z+A5XsxIZz4
         1PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962570; x=1792567370;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09lg+c/R4s/y8iNO4IclaAxHsHOS/zunqEudLnO820k=;
        b=NpK7Kr13A6i0h53ibTgK/pKcHROAG+2rXSb1woCez5Ir1OGByUEXXWF4xAWeGVj/BI
         GCacbB0PvvPEhbYBGWAcP2QWW9Q4gbGUZ7QqWTP6oEVb1gkn54Kov9xZVGgUNJ1PEdJL
         cFoqg4RE2B/OcP8rlSGb80xvoErOsaqM19gTortV6vhQXkJCiSPH6huIveg8fYYXEmPF
         kHCHUVP5Wo2eOuDACdXW2zmjzxsVrsLmuulWv65E5YAHfAfatpBvIP5J6I7Sa3fqLv0k
         6dfosZ/AiH25qZZtYQgyqefhw2PbmcYAoPmAziD4KNm3NwJbYey9BzjrbRiabTSSh2sJ
         yfYw==
X-Gm-Message-State: AFq9FYJDQvWUy7wAkdAiNMJKDxXkr1h1rOiAA5AvzObX6Mfn9jKctUhf
	5UsiTlyqdESM5BWrpcwm03IJYxyTdNEuhldTmnTMuq6K7Wr6EehVR6YY0OY4P18D3YLBvg==
X-Gm-Gg: AYBFou0i7Xvn50aBmwCfIbVfkmrtkSbv6Gb8UzPlGzg1bPUEvP6llpLLxMFAisxtAiZ
	lnvvFDvutqOaSv/dvdZ8kRax8ZeSNqaVEko0Zvx2hiL4Z2BAWQUUUrwiV2ZtlEBaFMQW+dhO1gO
	iz7NMc7fIOfCL8dKdtpReNf+u4AVeLn57H1GoUYCWQWcXqDb/WjvL0wgu9zkohY8fpORgxlvDeR
	4wd5g7TdnG18GQeVxeAXYcK17N7wPxT8qtAxT/do2N7gA2TC5pDDtMmJTB6763tfIIJzPhHzYa7
	dj65xwglCApDKKKNt3t+TkQPUhXBzrNW17T197V+ezPLrpZGySIDrnWIlyBiViQ8+b/MOHGr3rY
	25c2rssFE5tvjxFcI2NfhTw0oyqROsrguzEAsq00Jd8jWZFnQOI5eXNFls9lnXcflm3NNNc9/xb
	010a5s1Vxw2kitcbaJhp7LKwMgmioHEjRx9Ujbw6RqqkaX6Zxp62sfzS5LKk5wzq8zbpTU1SUF4
	47o6VFUrdIrN9I8/2PmVIZzdgoKsYKuhECNkZqAHQ10vrqBGkgu3tEHKkP+YQFTWSi5fFW4UhZQ
	no3cZG+o6APH4zQul2JPkaOJz+C13+Hb6ZLcHv7xBzNtGPXRXQF7KOA6sGe9UTM=
X-Received: by 2002:a05:6000:290a:b0:48b:910:35c3 with SMTP id ffacd0b85a97d-48dbaaefeddmr28879154f8f.35.1791962570140;
        Wed, 14 Oct 2026 00:22:50 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:49 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/24] MAINTAINERS: Consolidate ARM/ZTE ZX SOC SUPPORT with Stefan Doesinger
Date: Wed, 14 Oct 2026 08:20:41 +0100
Message-ID: <20261014072109.1759502-2-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002252_047564_96E8E12F 
X-CRM114-Status: GOOD (  10.35  )
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

Unify the ARM/ZTE ZX SoC entries under ARM/ZTE ZX SOC SUPPORT with
Stefan Doesinger and Navid Ghahremani as co-maintainers, covering
both ZX29 and ZX279128S platforms.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 MAINTAINERS | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f72b4ac27..b806d1fc1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3894,14 +3894,37 @@ F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
 
-ARM/ZTE ZX29 SOC SUPPORT
+ARM/ZTE ZX SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+M:	Navid Ghahremani <ghahramani.navid@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Odd fixes
+S:	Maintained
 F:	Documentation/arch/arm/zte/
+F:	Documentation/devicetree/bindings/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx*
+F:	Documentation/devicetree/bindings/gpio/zte,zx*
+F:	Documentation/devicetree/bindings/net/zte,zx*
+F:	Documentation/devicetree/bindings/pci/zte,zx*
+F:	Documentation/devicetree/bindings/phy/zte,zx*
+F:	Documentation/devicetree/bindings/reset/zte,zx*
+F:	Documentation/devicetree/bindings/spi/zte,zx*
+F:	Documentation/devicetree/bindings/usb/zte,zx*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
+F:	drivers/gpio/gpio-zx*
+F:	drivers/net/ethernet/zte/
+F:	drivers/net/mdio/mdio-zx*
+F:	drivers/net/phy/sanechips.c
+F:	drivers/pci/controller/dwc/pcie-zx*
+F:	drivers/phy/phy-zx*
+F:	drivers/reset/reset-zx*
+F:	drivers/spi/spi-zx*
+F:	include/dt-bindings/clock/zte,zx*
+F:	include/dt-bindings/reset/zte,zx*
+
+
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
-- 
2.55.0


