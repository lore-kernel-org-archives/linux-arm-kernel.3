Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EE2E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZRl/jIT8uB/r9kmnVgG5TBst8UCINOdajarq/Q+Phg=; b=rlVHCYdz6wWcT8uDBSQwynhquq
	kXSJAK+gO2DCy3r+99XUDnOm93sSmALuM1i3tCdWvgBOXVhCYM+IwKy9plNTDZkphBcMNQfjuZNMs
	ZjxwqcnS4s2mNRORFrA1LFY0XkGS6piobl9XcdPxzn44pI76W5jM9FuhPtcOrOrQvGQHs1dlplkUP
	Tw4vt8eAncxJdRQlOFgLsB4BgR9KA3wI5JqA7M/izqmyExHotGIVEYcLJkuC7FTTvqKnhrdZxRKvp
	jOpAvHJN4pDJX+dbkOqR1mt3f7YWR0OROAnjBcbzHnI6hMz2l6XENCF/Bd6QHa3UUT9K5uWQjb1qu
	SIgDz6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYq2-00000009AWA-1iSN;
	Wed, 08 Jan 2025 16:23:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYio-000000098Jw-2xxL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:15:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso7096295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352953; x=1736957753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZRl/jIT8uB/r9kmnVgG5TBst8UCINOdajarq/Q+Phg=;
        b=kXpYaZFvl5BAh2SWWJs9ojon7Qp2j1qQ52kYdL9XEX3Bo1Y2c6jerzeM4K1pOGWEHU
         t7RujRiIt5Hmdc93HXcw6T9T0+24nP/eUpMRu+920EeZ79XGMUEaXmEuUE0Gb7VQsKBe
         E2rlVpYAcs7shymijEBMz70l2XVxbiQj83ZoAX0C0G0ix1+J+pS11e6fhuK5Bvqi5WIQ
         PVU0fw6od4KQBDZ5Lcp3S2aaV97lhxmiX7YAc6GTY6s6eykt8bVHKqfalhsi208MpbIZ
         mAe7XmqgKe4pGRyRE/uzhFtFZXWobuKNIR5NSdqX9ljVa9qsa1NQng6S0VDJW4WmkPrY
         uNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352953; x=1736957753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZRl/jIT8uB/r9kmnVgG5TBst8UCINOdajarq/Q+Phg=;
        b=gSWJHptNmmSUUY1fR4dulToMNhyuW1kiuokkB4q27TYZgRMtfUCO62ThN3tV6IzC3j
         M5j/6ZDaOOn1KsaXneH4fkTFFQgvG0LbHRO1cRnz2Rc6jRx+fdHpyf3H4f0Y9HA/e/dW
         0InhedJyiG5cg+WlLqr718FUuVOZK3AicZRajDcgB5jg/4N4wNfdvpLZaDfvzjBCBySS
         23QvFgL910c69dBminQd7UK2lhI7CGn0V2R6V6CPQBPlAJunE/nMzM4glVHvMw3duc1D
         0J6H491niu8jz6k67GWqkSConylrGoHh4oxa8fCBI//oAtHvFFyNQyjkWuJ+zF+Kn+ir
         US1w==
X-Forwarded-Encrypted: i=1; AJvYcCW3NDDoiiaTqqe+PHdwMyG/MD2YHrFTUR8bU7f5UHpx624FBdym6u1mYg4j/3orTsZbRoBi6phad6dWEuZHf8bI@lists.infradead.org
X-Gm-Message-State: AOJu0YzV2aOHX8nZj9aXAJDfgzT725kqRI1af3VDbNdIwy8tJU845BvG
	TLXmQ78OQJ5TZLGfgebiovbLNts3NpJAdysfyu9E2c0xzqutaPHE3Ji9Z/gURa4=
X-Gm-Gg: ASbGncvftjT4gLFK9cbBYLq53XbTrmKFTC1UksTfagSBD+i37LgHQlt1z6tT3pX3Fsb
	/FuPPzbx4HL7HT527Tj61i3PJ7stcHfXg9XkA+VyQZhg4/A/eeepJ1Ml/3iWAmzcS3t6EI2ux8I
	16svLr9J6K0Be0VHN7VEU/MdGyYlvLD1VnfiRlovrUJW0RKt197XiC8nl7EsRDE9glywV2Up4AU
	Hg+ha3n3IRFYCRz79SzBaAVoPwijlwrUn+/AUwduJF/uOZA3N1gkeMRKdJO
X-Google-Smtp-Source: AGHT+IGT2W9yiRNnHWhCQFwEtFEOBt+fTSjqZ7msqjn6YQpc4lBgX0/mDPLImROOnOo9J0j7h9H6Gw==
X-Received: by 2002:a05:600c:1c28:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-436e1de8c6bmr31114125e9.8.1736352953222;
        Wed, 08 Jan 2025 08:15:53 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:52 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:47 +0100
Subject: [PATCH v5 5/7] arm64: defconfig: enable STARTEK KD070FHFID015
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-5-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/H4ZYocEqi4RE1sb0guDfUix0kyAfFw8e32hk6SxuDc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSyZUqWDoRMqRxRWHdPZ1OmxpMWlPUStE40NTbR
 Qh5ok4mJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksgAKCRArRkmdfjHURcKfD/
 4j0lpGO03jOuFcKFmvdaUaWEoZgiGAxt8XbpFYnaIbzTWK37FaYHEIf0bmWVzjb36+j7dMvjk3G0vE
 tDu1yKnGhJNNZvpXYAotSbPYGfrG0wFGa53PDQ25CFHWfjw6AuBoMmQx89hkTD7WXlECivSkpMG9Ex
 /dM+uCbl7m7BimpucKnVF8YrFNrw3vGeLald1Otgt9AWwjDSsCeU2Oy57L+BnP+/eBI+jmv9r0Dap2
 M4p1qYPfkMm3ebiLkEUvu2THntvG+8inAV+RvNAoRWfLaGejPYVB5zrPi2DJoECyhMvYKLIu6m23Kj
 gGa1P8jpok/dMlR58qCfw7xoFeSqTItsSI/W4p6Xymz2Htq+CQJjI0sQW6r52jj0GTGK1mE86Zkyh5
 V43A6rJeF+D2c9KFPX/DU0TOts8T7yrae/3G4Kx9mIae1bYWIRqROUP027GtOiWt0Oid5EENR+fxWW
 hrZONNg7KZIhiRHx2lgcdSCRSSawj8U5v/OFOVgl7n8aDGMm4L20ldq0upuGTEH0/58PvzDPNm1lxM
 5DnnNPlY2E3sd6V8WfmAMkOdZC4b6Z0cPzIq/yUilH6307scGsEPpoehZoNfiLRnAep0Mj4wsSrsM5
 GWG7aY9McdcqYrM94dwZQtfzr98WvGjRc61h8Py9+LTeTBkcxSX/bKsb8KOg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081554_752913_8A935136 
X-CRM114-Status: GOOD (  10.43  )
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

Build Startek KD070FHFID015 panel driver. This MIPI-DSI display
can be used for the mt8365-evk board for example.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b2db31e010ff..1e2963a13500 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,6 +897,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m

-- 
2.25.1


