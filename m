Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379A3FED2C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=; b=rfQ10+jvrIUQmJc3JdYT0jdDu9
	7NQOS5kBpIS6qNcuvOk7SAd5f4mV68SWC91LkLtzGv7mu0Dq8ZXn5Dc2J79TkS75JRv9siluqjpQr
	rUJWyScV61hjiz36Lytsg8pWWqcPqbiwcO0e39TrQLmK05A8mErvl/rA3c99EWOKnigwrpPmT8vRJ
	MFPiX2ZRjYZAeKAXR6tqTKusQry7YjZpzSPB2WeQ6Siwok6D31xACDAGue1j1c8ZUGl621oVEawAs
	oLKl3dHJB/wouyFk1jMdbcEk0lFuILdO4NdlGBDSX+NMq47sdZW/wOpqF/V4D+3Z8wWD8ou1e86aa
	qWsmvB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTC-0000000DEMj-2qdp;
	Thu, 12 Mar 2026 04:16:22 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT7-0000000DEHc-1o3U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:18 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35a18b65515so85806a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288976; x=1773893776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=;
        b=ba5xk7lQDN8HB7kYVpF9XmIN99La02rGhGghpQITvFdgfxyhLOeb8RufsP3iX44aQN
         O7K50SWiBpu04saZnCog5Z+Pz2LUrUgcZkjH5RYBcJCYHdvOsrBDoE4x14sljjP/Thea
         NMAm+zFRP3RofcGvYE7NQ4beMYyJ3p075UaXayGG0i8tos/qfbTV7IuEfwbajkstB9sb
         fnt8nfR06b/rqpS72Q2D7wGd+ojD1TW9pkXiRkaMuUuqAuZJc1aSsLXWu9RGu0RC6WTP
         PucQIhUZt8drNUz+/aKxn5gT/cLSX9vCKdP2m+e/5LpYojDqWVtXvpyNfDardFHEczHf
         UioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288976; x=1773893776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=;
        b=ePJtlbdAs8Hovo8ulCyqMyIwaHzpgLB9YenRJehk/NRVfNtbA/MfViP/k5tuiLvCXD
         8F0d+S5UzyJEzs3F+ksrcQIOx2sR/zGR+dPeVB1BwH+mHXH4SAmNN0D5iIuGd26D9glm
         Fd0xWLq2oewFz+l65cqqhQxj9UoDpqF+bNQTkFHN0EsFTmd0/DQkTA8zYVn/vLghw0o0
         YIR83DR/ryggGoivs0g/k0a7ROqqyD/FqTuGhMXFZehSGTjHXdb4ZOTox5P9Gj2jYEg9
         QYgwmZgr2d25hLcc3JEIP2mh0V7uPXPbevPTj3kotjerzOIWsnHXJDHQAxEsuxU7/oeW
         yBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCULKTN+xIFUGntpa+Df5QjETlN0+RzM1JeT9Y8YYu6HAW7pS0PMLjN9ga8XNGAVVqWhthVyWjumSWg3WdfhndOB@lists.infradead.org
X-Gm-Message-State: AOJu0YwlMiLyhkI3JEh4owGujxYPAytD/z5UCNhsj38q9XZzQvjdxlFx
	BBNb4Zahaov+l6H1rBmNB34pcX9pp82cifpB5l14FGG0xYYfifUdumlC
X-Gm-Gg: ATEYQzzJ4UUCbkmMGB1R3cgHJsV2ZVtw/z9fGy4MtxO4SDllx5O4r4j7uM3NrhrNnf1
	5ifEA6F1KvgKeiQp7rZQONjFMHGHzltiQGqJujQWkSXwkQFjPvegHm5jN79rsiF1vlc2dCRd1v2
	uxzuCEj9vKMQ4c/3n834n7V5KNSl5+0iPoB5alK7ean/LgkCcCtn48MSFhgLsHoik3eYBdVrISs
	6FQBF+WO6CjTivSxU5R9KDLxK87cx5di8bASyDhvmp9uhWIzeS9ozddmrPesHFJhjq3Usvmcqsw
	ZIRsdFknTko2PxYdO9TVtPe0iyIEDm9Ge92GCYCIo6g8qHRi9WUXOoULwFypHf2lzkMTVMNpWoi
	QN+TwqU3syOvVHr+0ewdtBLNJxAnF1Ppiy2BJ/qlv7lAPc4FqW8uGJlJl9mWU7/XflfSRkLq1Nu
	2DK6lxS+92nP4nZ7mrKkDvkRGSRXnB1rBQgHsF0DwGJ609VGd/b2q6aIeZcYD1setvcg57e/zgc
	kXcPxM=
X-Received: by 2002:a17:90b:3c06:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35a01201d6fmr4340930a91.15.1773288976536;
        Wed, 11 Mar 2026 21:16:16 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:16 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 3/6] arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:30 +0900
Message-ID: <20260312041533.187553-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211617_476788_60294C53 
X-CRM114-Status: GOOD (  12.78  )
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

The gpio-ranges in the MT7986A pinctrl node were incorrectly defined,
therefore, pin 100 cannot be used.
Correct the range count to match the driver.

Fixes: c3a064a32ed9 ("arm64: dts: mediatek: add pinctrl support for mt7986a")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9693f62fd013..9ebc196107e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -187,7 +187,7 @@ pio: pinctrl@1001f000 {
 				    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pio 0 0 100>;
+			gpio-ranges = <&pio 0 0 101>;
 			interrupt-controller;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-- 
2.53.0


