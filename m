Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D63CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxpBQHMVVAeu7IpQ4o3HFNNtsYdEjzOkw3t6mRR8+ds=; b=4YgxOomNpAxKjPLKqL9u/TTVwT
	EoSPAACED5gwMIfUDldWEfw9q3gVwyYEd0poAoaorzepJLlkzhk8PtgjmE/g+SsT8UYFoc4lhDgbk
	xOsUQSsQaVLazU6rDRof3A3KjZMEESJ5NVJqe/5JQy7SkoTE4qgXixI2hi8srMaXlLypJjljSKA1M
	4KeIwGTQkQGBz5PgSBJqs2h1/UfbyZLcqYEe7g/XWHHD38Je1q7fHBzmfjjyNNJs8WUEVzTg/Z4CO
	dluy4H9lrIc+EFh4mGCzA0EoVZhkhScuDnAyZr/ZUcsjjfNJM8kuRebpr7NR3XqOhvOs84ClkYvNZ
	5kjaYT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT8q-0000000H2fY-1NWJ;
	Sun, 05 Jan 2025 16:06:16 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT6W-0000000H2Go-1cxJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:03:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so7489787f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093031; x=1736697831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxpBQHMVVAeu7IpQ4o3HFNNtsYdEjzOkw3t6mRR8+ds=;
        b=SY2/zTRMefnqJ38MQW6yoF/Rj8HwGexztETgcl9MLlj2JTBd31YMFBuDSreBCC4HlX
         yWa37o9IC9eybRfozOXO/0grTWAo8zNr+ULhSOVAvrMgT57X1iVyiMe4eIVb1rKP4neX
         9PM9eXqTq79drg/SMpnWVrBv8S2QcbxJXCcMHrsBYaIOVcusruTSsZNaA7IoadVI0k6w
         ZaTlRNl90nblCWRRtmTmM+o9GQ5S5y8D/MEfe9WB/JYGbw4nf0L1vgn+VvwHkcdgORX1
         r+wYMwFh+Dkp11TKZexGRKyX9wNTp2zuuPFIR0tZ7gygaoOTcF/zc8eaA2z+EURPv2xs
         ivzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093031; x=1736697831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxpBQHMVVAeu7IpQ4o3HFNNtsYdEjzOkw3t6mRR8+ds=;
        b=IZUjuR8AHBNyIRFx2YedG7CSeRxXPX4jfCRQL6JL5HxWaSLHIyuVq/QcZdseCie8Rc
         psVKn9dUoOyFsYiH5eSyt2EYHSLqbKd8D9VJ7VsuaJ2lSSJFFdMiyo+elM82rlzgUic6
         cywyVGIUYd3GNgpSrjO4kR+UNjBLMuMhvRV2PrQ2Hg5uBtAvr11ebHNjOa3e0OlFifvT
         sTqGku0h4TC7MJZVDPRitJR1D0BKp3r75+wMhs19UhJhs/gxOiPm5c362VBefi+MA0Lx
         pyPOel/J6duGj6GlACgNLnvhnJoMbBml/uIq6D2BWTnSqBxjyvCitMRqhaFc5ywAkXYr
         /u2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEE5dhkcmimYn+e3/OvohaYiF8qyIbSWgwKYGjKvGyPvsk+bWbncw+jQrzJcHG2DBcU8JOCcSEJ1zPFAwdz8Pn@lists.infradead.org
X-Gm-Message-State: AOJu0YzgltWCAkE1HeiZQe8m2sR5fQrT2GM/ppjGikZx4aF1SO0I90fo
	m8yje6YR3pG/T5FYkdbuFB828lGsYZwJscco9NhYbdx0M63byidpjh083A==
X-Gm-Gg: ASbGnctQqgiYd+T8MP+OjihDFCElIA0JFNZZUUK++GHdxCRqY5R9mLx5WAjIEgRBkKA
	kIX5y09KKDrebjHrydI65PJ1C4/pnd0wKx62ULc9w46Zv7I6VbowjBa8mGMoVUyrkGNW4vBQCzJ
	MK4kyuHUL/NM4xeYir8c5P4wVCeeJI+FtEmvI67oMQREBYBz5rf5UVmLcEJrpL7cOu8Gk1X3AYC
	3xOsT8b3nYQvU7PZt4jfhzTgEgbgJB+7XYCRx+QnCZpyV1V2IYkPbOpl6L2ZK3Tkkc35q4=
X-Google-Smtp-Source: AGHT+IGJBflGdaxt0JBE4erJyFzFCgFvWRqc6oNwoyTzVkgdyLbBhurZLdzmYjBfDWndtHNBB3/GQw==
X-Received: by 2002:a05:6000:1542:b0:385:e43a:4dd8 with SMTP id ffacd0b85a97d-38a221e1832mr40868935f8f.4.1736093030684;
        Sun, 05 Jan 2025 08:03:50 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in constants with USI_MODE
Date: Sun,  5 Jan 2025 18:03:43 +0200
Message-ID: <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_080352_434801_4C57A2D8 
X-CRM114-Status: GOOD (  23.56  )
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

In the original bindings commit, protocol mode definitions were named
with the version of the supported USI (in this case, V2) with the idea of
leaving enough room in the future for other versions of this block. This,
however, is not how the modes should be modelled. The modes are not
version specific and you should not be able to tell USI which version of
a mode to use - that has to be handled in the driver - thus encoding this
information in the binding is meaningless. Only one constant per mode is
needed, so replace USI_V2_ with USI_MODE_ in all constants in the
bindings.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
I wasn't sure if it was appropriate to add a Suggested-by tag for
Krzysztof because I haven't asked for his permission, so I didn't, but
if he wants to add it before merging, please do so!

These changes are a bit tricky to approach. My guess was that this would
be the best way to put it out - one patch for fixing it in the bindings
and trees, then add exynos8895 to the bindings, fiddle with the driver
and finally rename the constants in device trees. This breaks
compilation if the whole series is not applied, because the driver, the
binding and the device trees use the dt-bindings header.

If anyone thinks of a better solution to organising the
patches, let me know.
---
 .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 2 +-
 include/dt-bindings/soc/samsung,exynos-usi.h              | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..cc92a06a3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -144,7 +144,7 @@ examples:
         compatible = "samsung,exynos850-usi";
         reg = <0x138200c0 0x20>;
         samsung,sysreg = <&sysreg_peri 0x1010>;
-        samsung,mode = <USI_V2_UART>;
+        samsung,mode = <USI_MODE_UART>;
         samsung,clkreq-on; /* needed for UART mode */
         #address-cells = <1>;
         #size-cells = <1>;
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..b7c1406f3 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -9,9 +9,9 @@
 #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 
-#define USI_V2_NONE		0
-#define USI_V2_UART		1
-#define USI_V2_SPI		2
-#define USI_V2_I2C		3
+#define USI_MODE_NONE		0
+#define USI_MODE_UART		1
+#define USI_MODE_SPI		2
+#define USI_MODE_I2C		3
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0


