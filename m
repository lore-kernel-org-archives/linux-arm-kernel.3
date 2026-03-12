Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F50FED2C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=; b=b8ymTRBUH+S8bjgPVZgjecLagu
	L4DqF+8OgfiGeQ0HnoSoHJ0s2HkNLMmY3gHphKGGugQH2XMAGuhmh9mMwnx8ZnLN39EXXFTl8k2HY
	uLo3S1dDAv2ImS8+ejPLs/KlSHN6zp2w3dOp0s8qCx31Vf0vjGBRGc2z+eE8K2JO/C8WkizjZqVE3
	ltz80K5LtrpzaT+yjhbm0HLqb4IWMJ/47YeY8+qiLf3XeR10E9DJM3hMFQxqMcKpCKF0pBVSRU2YM
	/RoPbihwlyyYDTzGvd7KjYJOfkYLb+suUfiv2zvSlTob+GO2cZDLl3donaaYuPiYTA9N8J56YAA/Q
	pXqyICnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTK-0000000DETW-0aqW;
	Thu, 12 Mar 2026 04:16:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTE-0000000DEOM-444r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso285958a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288984; x=1773893784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=;
        b=aY4uywCtDnJwGgR8ThIu+X5RQGDkuMbCRYT5HKoc6WaFp+mweatSqkAjky5xza6tWN
         FB+PQn6OR8kbTE0zxnFxkgb+slIT0Y+ATUIkTavPz5bv6HU4gzQHL/bky1UBYwRU9PCW
         wT3ISvkbcFZawCjZP44QUvfOXA91mtOTleWCB4buz4xwiyf3WeXo0dnFZZn15HX91Ll+
         UJllFZv5uBfiApRhsvcsJ78BKNj2AbxZ30K3kQjF4uHQP4C3AhpF/GrhngH7sasmaITD
         +w5o8mtUSXqlaVzFXQ9yG0DKKe9DV9ch6XyJPecnp2kQqBhZeJp6xx8fLIrGLgGC285E
         IY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288984; x=1773893784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=;
        b=WRjcORM+qQ/4301pfxnkCR2If1vxUbWWSLcjwvsVLIQosBW3wVf9PrmNW5/LtqKg0b
         SQUF1iepCUnoZL8l9bg6z0d+egfYiULfAZQVweTMqrke32kGBahVhiIGNd7+Y1aU+MAJ
         7Ezxz9hbfiJY/GINOJFIF6uabJ78BjdbUg5jn3aqsy+asDASbORxs36NxIk4KVCJ3Zr3
         UdRX/p9nrfQuG6eeUhZUKJZFAxHKkDY5Yvx1CynKW73I2asv0iTFpStfXCG7UMPO09ar
         F5+NrCedAX4gjlmI7GlrUCFJB9NOeM3tnncwcopwSTEmUx8eE4+NfQCyuKAi1WXqfo6B
         7MWA==
X-Forwarded-Encrypted: i=1; AJvYcCWbMWp27qY/Qt4fNbVXnh5zlzH0zt8H/JJPnvWlSvGO7gJ4QE5E+R9MxGLfhe9hWa5U9Qc6Gz6A4q3xuhDXLGGh@lists.infradead.org
X-Gm-Message-State: AOJu0YwXdPZKgyoNfSgKGhtUTyR6NmBiWRGCU6vkcF98Zy/XwMoaTnn/
	/AVAKcZE3HbjeceFinmWiCctsy/ZbHPE0+gswACyiPy0zJGQgPs+CeO4
X-Gm-Gg: ATEYQzxndTZpPbHFhY50gtJ/JAnCar3DeHNN5yfhqLvQxf5lHc1h/h3uzZBGo4gYuVN
	fzJWFfc9r32M0rVq4kTo5kN38pQOdVpEzRvftJPUaCPr2Fr5/U7otyN0CuHzEJihJTl1wYA0WYW
	hc2j7xnJgzVeS6xBNMweEVoztDtAATMHz6OkWEsB1nozydJaIHTUHtryMYJMdn/rdPLVcszS2zr
	b1bm/i41Yi9wDk8UyFNoqeDR0NTtqx25+ltGRcqEQGgKOl9AMCyHtJAoFi386VyE6AanEyVZyqQ
	fNYLFZs3THaOFKcox78AY5vyYlySLmq2Qse9R5f/BKW/2XSe9cT1euhvqPbCwWhTJ3daudmkoFB
	DZ+edbXxqNhYFqu03r/rPqkvYAlqoai7Mwh2sEytPW7MiKsmKTsv8Em8dbvdghoMABP5iGla/rj
	wcx2CrRZ8oThacoUty6mWN13JqSZCAKav5Z/FE+3wAaWBzIU10UdzdGkL1ky1LcTZjVi2afG1kR
	MRXnZo=
X-Received: by 2002:a17:90a:e7d2:b0:359:f43d:4a78 with SMTP id 98e67ed59e1d1-35a01284a88mr4254615a91.20.1773288984290;
        Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
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
Subject: [PATCH 5/6] pinctrl: mediatek: mt8188: Fix include guard comment in the header
Date: Thu, 12 Mar 2026 13:15:32 +0900
Message-ID: <20260312041533.187553-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211625_665588_7C40CC88 
X-CRM114-Status: GOOD (  12.82  )
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

Correct the mismatched macro name in the #endif comment.

Fixes: 11b918d90aeb ("pinctrl: mediatek: add mt8188 driver")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
index a487323748e2..a688e919b32c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
@@ -2256,4 +2256,4 @@ static const struct mtk_pin_desc mtk_pins_mt8188[] = {
 	)
 };
 
-#endif /* __PINCTRL__MTK_MT8188_H */
+#endif /* __PINCTRL_MTK_MT8188_H */
-- 
2.53.0


