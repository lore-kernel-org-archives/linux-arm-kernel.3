Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ADACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HrtE3Q82QK6+GBZEOdbY1kXklQMDVX/x3b7hwZm2YeA=; b=nAHtkr0JrtU8T8X6K3BxzGMu9a
	qvC6HGPZVSaStdx/ctr6vDntmEM5WekT2Voml6+ogZuBZAClLwVZztUNFkNCRzVF5oTX3+FbCASPr
	Ntkw+/OyaieO030v6CdK5fB9zrs9/h7XxfmwNph36jfI58c8P9M/4kAZ9uVL4nWId7f/8lZG0wHnB
	7B8vgdjK8GGjGV4VpFBmY8y/1sa1PF674/hf/j9Z5h5pR8SoKG/3xUP+MUVP09lLV88rG10wn9p7X
	F3CFfPV7Colp3Fj0+xyYYoM3t9kMkRnaSTbhiRqhvyZroEJ1hXcKMVRBA4OHJvPCTzR/4wKhZvzo2
	Irl1pp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJnP-00000007oaj-1RPL;
	Sat, 30 Aug 2025 11:30:59 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJZw-00000007nVG-3KFf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:17:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afe86ff3e83so41007266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552623; x=1757157423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrtE3Q82QK6+GBZEOdbY1kXklQMDVX/x3b7hwZm2YeA=;
        b=lpQpdzuJjB5QF2BYNW/MK5PCoEfk7gsFLhYqIN3hcYxHhrb6XZoQU/w20/VTvtZv5j
         sMkNFeGS6ilRqaad92jdUikZEoGw0mttQsLbUvmoOIlnovDEb9+yjFwCJc5GcmD2cOOt
         EgzzDKlV7B0p76/OFqIFIW6cGZzjan4+M+IDbq9jYgkvwz0r0OhH0aRi7ZxvmpgW5HxG
         WRKTqnwzOv0OMpP668oMr2agbPCigAlEqKXzej3sWiBIfcgdVa7FaMrr2BqDP797Ct+s
         BWX3kOVTol9mL10UV+pYLArENcZdRmRIt+Ma9mhAJ3t88ZPD+K/UCDor714YUHR+g6jX
         cDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552623; x=1757157423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrtE3Q82QK6+GBZEOdbY1kXklQMDVX/x3b7hwZm2YeA=;
        b=m36jLOGsUfJWTYdiuzxCVENSw7BrXH//pC7lKswGDaq9f4tn4EAiu0SOOhSJqMfjt7
         ieNLOaMl72ERKDwPbsgfhawrSrc3x9jtiSTKr0WPb6S3mPjLglzUH8IlQ4dr8gAYncib
         JMobwxkyn+7uXX7XVFzaeHTUpllm+k+6dixl8u2hF4BvksS4ihSosUj1syTJeIplLDwr
         dC0R3e3F1N1eHXAlXOpL8SL8uS85PklM/ZPPnWNf/RTogamztEJPw0GF4APzTBEGA6sc
         CYg5x89WOAhypjwJQ76BwyLtSsMsx0ghQTXa/ttLkg2SUJRyLnZ8XuRa7mt4m4zKGqF7
         Nz1g==
X-Forwarded-Encrypted: i=1; AJvYcCVDf+FF8+0JHwHOGYAJ3B/ZhkQeowQvGhcDffw274BR+jQwt5bk5qEb8Vced3ns5HN7Uv8KI7DWzvkLoWWua/o2@lists.infradead.org
X-Gm-Message-State: AOJu0YyYcwZ0IOtqWzsnM285FlAOijaMotINksoLE8PgoxSgHrkCthy4
	ZNa6IHnf6XoeJjnca/4q3+dEs6gBcNbJirpLWN6WcJT/bRvn+t4JOb01i5BdaU/Dimg=
X-Gm-Gg: ASbGncte6MlV9c7/hwpyDbgBg04NvnDEkDiKiksDzi80usZ/axRXZigL7SEOhhWaeUG
	GJcHJ1LyuaR0Cl/mhnu0qo9V1UIg5AZdZxGXT7KfyyoaLChcfBn3MQRWu0Wpc0dhsrBemImkLAp
	XoA3rD9pejUX1Mio6mo7L4AHtsHalONntRSSottNqi1CZRosB49mQxE34pC0BYOOK+EZ7j1/oeW
	DXDjJQLRhFiE5l/k12bEsnnJ2kcIIGblkqmEXu+GYZ5/poOSd4JdzlVdtArr9xW6w688Msn0YO9
	N5T+Ln11yolqbDf5VOk+mzt86ocY/trxFj2UCLIxdj3myjGcYLG3/Da2684/OxAuK8iIxzLD8Bv
	v961pKHViteLZSKwVDJXkOTzxFDuUY08N4FVCPPYn+c0y8O8p5Br9tAQ=
X-Google-Smtp-Source: AGHT+IFmornV4ZdIWfTm9SgoE8/HBXaeK1TDUM0EwCR7nq5XRu9/CMvRo+RGrgPCIIEx2ABNZ1/nTQ==
X-Received: by 2002:a17:907:60d4:b0:ae4:1093:d41d with SMTP id a640c23a62f3a-aff0377c96emr287174666b.0.1756552623239;
        Sat, 30 Aug 2025 04:17:03 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0236d310casm117780166b.44.2025.08.30.04.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:17:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: samsung: Drop unused S3C24xx driver data
Date: Sat, 30 Aug 2025 13:16:58 +0200
Message-ID: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=E0gq6DxSh3Mfd2fh/IwMmACtaozlVHjrWxf6F/SWbtI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBost2pee9d1wG5IpSYQufkayn0uDTUfoHK4Aojm
 OXjHWzf67CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLdqQAKCRDBN2bmhouD
 17DuD/sHmEpQOmJ+f3J11DHtrw0RH+Din6o+TGdXSZkDpyWNmfyR3Xbulz29+2OQ9GyJ5fnIEGH
 OLRyAgwoUVLWTc07Fjl+bEhfalWAR2p8AhxQF0SRmS3m2ufITSQ5KdAwimM/8W6Bw5PGfLvrhL2
 KC4E83y8qrf7Krj6osG0+HAEW8S1TqGswumOelaNzFH/sWoBWgovhA3ypaBGd867OQy9UnrCtkG
 8pTI4zK8UteCTyGOw7Gfgdtr4jGfMQEMoaXg8GDKHwvtJNgRd4EyLrW6vTtHi5gbTY5/5fsOH2A
 wUUAFzC5Ao8fwf62Rkk2NDtC/DObwKKj0hWv0LIfjNx6dgoJ2hvW4Y9puHX20m4FMHiLI8tU/AT
 6V5/uEJ6ZNJKoU0IG2kh0AU+rjLyxKGrJZr0YQEFdr61FXzNau5KyvXFyrfjPn3Z9YxEg1hrpq4
 9nHiBgQknrqncCa9akOgrJtcvM74QO5ypeMcZY2vw5YFmbsBjHPTk1TLEk1cnsM1UHziIBaH9O8
 scmcmclkkmZGx9YwJqpsq7HDUGXYxBXnyiDrRQUh/oa6QMOkCSdjOYyRUQHKWg23Zwtxzyww0Oo
 KOnEucRZFZvUrDPek+tDpT5WPFVH6xlgcf4RC6f2XkkGTQK9v7N7OsY/IyEBYjtGbt+utUqtSnO owzZc9hxRnRPe3A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_041704_832385_E9300216 
X-CRM114-Status: GOOD (  11.21  )
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

Drop unused declarations after S3C24xx SoC family removal in the commit
61b7f8920b17 ("ARM: s3c: remove all s3c24xx support").

Fixes: 1ea35b355722 ("ARM: s3c: remove s3c24xx specific hacks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1cabcbe1401a..a51aee8c5f89 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -402,10 +402,6 @@ extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
 extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2440_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2450_of_data;
 extern const struct samsung_pinctrl_of_match_data s5pv210_of_data;
 
 #endif /* __PINCTRL_SAMSUNG_H */
-- 
2.48.1


