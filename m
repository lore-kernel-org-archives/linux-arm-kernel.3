Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF13E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mYnhokjNt0uDzSYYfMK2GDmQyVt4apt3y0nj5Xm9bw=; b=qiKRXpI1jtmzP1+IgSgA81/xX4
	bLwcFiiRssov2VPH/yaAhww0RSq+yPYKlhMRL5tSZAUdknQQiIWdzU1G+xrw+qlfpc7uWWiQFBb46
	WHC2t+DdcmimbsZB8zLQ1LBw3USw/VWviaEhOXytwDMg76YFsD1dQBigwdalwoJ43GQ1Cy4WN3JKk
	DQdJ54IfK/7ySd9mKcjbScJqgHci+yijjAgY4iyFoPzFld0rVh/Ec/RdRXMzDPMzOeMEwTUETXoXY
	WoN2vEoPif1e4PdtAVsg059jXbB1u3AUUjnPalsREE8Wzu+MZYvzKNnZfaxskNrhskZ2YQHU5G3VS
	cJNWtHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe7D-00000005A3v-3ATh;
	Fri, 20 Dec 2024 14:36:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe3q-000000059S6-0i9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:33:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso13693445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705180; x=1735309980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mYnhokjNt0uDzSYYfMK2GDmQyVt4apt3y0nj5Xm9bw=;
        b=SEVgAYS3AarNSK5d/okA80jdVniC8gWkWdFsnlNIKwVZDaP0xkNwjG/EKJLgoT89AV
         Mrh5ZkXBUxeQiGifbF9W6unoYM5Dkm7OumgbMxLgI6utvC9N4vLOSlZnd0kfWc9E+VNm
         Hb8ceV5ugHe4URIATkb8o8NvaBaEk6vvp8+9XjrZNgp4xtgZN5OIgaJmgph5n9ze3iEc
         UxDJ7mfbBpVw4yRbkoagnNX8kpOExdLP73pbWKDfiqbaKBNuPlLkqrJ06r0bPwkiqG9E
         QTIlIM/zK7YGO2xMPS9Y7rbkBztEcge7zsQvmZVdR2VER60VPlUoajHq8ri+Cx2g/eEr
         b1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705180; x=1735309980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mYnhokjNt0uDzSYYfMK2GDmQyVt4apt3y0nj5Xm9bw=;
        b=p0u7ZUS+Sy5m8NjFNVyr1HFL0nPLMY+QUcVdSiFx354mfbcv7ZlfVVJNaiipbS0Wrx
         Tn3HXnZgMFRro43B/T6oadwEE4ALaoMFzYLzeSGa/Ab7zJyR7mLD5xU9q4QCsCMVsxQD
         ORr9z0vSPv8ZQ8CZhtM95jJx1LG1Rm9PreGbEjPV5mS2nyhxkwye6zi0riXB8YjSqV4s
         VfIheRU13IOOBzhWuI2UpszaswjPGvFfs75Bas8q2BoXO5+248RFmX0zYk0RL+u7aVLK
         85lVc45g8kOm7LoiV8wz+p9UoAzPX2k5as7W36VYC2xMwZ4Zhf5hVmLRjmYT0YlvpBDZ
         hNqg==
X-Forwarded-Encrypted: i=1; AJvYcCWGvsCF4ym3D9122LA0UXs6oVUjk7Q937kJaUugYEB3renyFmp3HFqCFzRnOLtdsWUe5n4Yg1q2yQNWFdpn+9Kk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzb/MzSVEMTOZnyk7TyzeQp8H2jj9+kTBrUezP8KxhGcm/no8u
	3hQ6CMb4xaW+WRZ75dRVhGZsZkz8mp7tEXBgSm9NZxIUdgqOJVtiPYTgKmhANDk=
X-Gm-Gg: ASbGncs9Ksj+807zQ1JZs4/yblKnGJNlvgoPrflb7q/2/jUOqeLYI+Z/y1JpUOZ+wsM
	EtUQtBUUfMym6Wyo2deePWF30IgF7F5nLOI71CoCcuKGDP78uekaPe8njblNphXaULJu/qTPUlA
	ZNodpTiuOkYxUS7uLNJUTbMMvyWzeQ4gyPyyK3DQt/vjvjP1ZdZaRDb74AW8Bb6TW2RnYzRGyJR
	mWF7LWEOpFouIMsp3L/esXZFkwA+nUi/ZjxoGrtKjCxkRk7YFae/HljvLAHqo1iQEEO/CJHt5pK
	XArDvRjnaORdBRntjumgoW+NKKqoPr+cxinh
X-Google-Smtp-Source: AGHT+IEySYUHs5Msg3dUau73lIpORU8/P7Ekp5SpHvtYJlD2/+BIvX/q40CI3mk0cfTV9g2X9nmu9Q==
X-Received: by 2002:a05:6000:1fae:b0:385:dea3:6059 with SMTP id ffacd0b85a97d-38a223fd3e5mr2354097f8f.49.1734705180210;
        Fri, 20 Dec 2024 06:33:00 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm4140321f8f.15.2024.12.20.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:32:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 14:32:53 +0000
Subject: [PATCH v5 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-gs101-acpm-v5-3-4f26b7fb3f5f@linaro.org>
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
In-Reply-To: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705176; l=1244;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=eSZdwYGKTRLMLKjhMwehJVR3CZn1udCQMKHYP9Vi+QM=;
 b=7GpgLiWRUZQf2xjdHsJ+TT73a5wVceNgNw3meXcEv0/TbaflXZPWfg6NcpISW+QoinH5dAbYr
 zPhMUOl56SyBjUEhDYjCcNqbdOqEE21RAuDAUJ4U3f+gkEjNZnJmEJ1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_063302_217274_A9D0EAF8 
X-CRM114-Status: UNSURE (   9.01  )
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

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baf0eeb9a355..5cfec7cac9eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20717,6 +20718,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.47.1.613.gc27f4b7a9f-goog


