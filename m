Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77649C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aj0AjGJjQ6DzFsBm21JwuZJt1umVaV7A/rQDK4jKmt8=; b=ZQ9CjiN3tE9CL890Vur7CSHnTX
	WvnAbKGaMCSTXuVTPhIg9xPtWUFqfPK4qjaI46Y0BIFyA7fHd66M29XNO+9qNmkaUnstDWi7qIAxa
	o8k5rmg4gHCtg0G6QQ62WQT9rDcOCXNwRND5zMTzfQDykxxZJXhQE84bw/rjxUOaDjuTN0QfXAq++
	3lTrhVIfxC/ValbvpjKM2oDF/FqW7bjst/7jJUeRvSVKtr4k8YDzkzY4m4czIsYY99RKm+gaqCc08
	5TjexAUxemENU1eWUnp8wm9zQUfVCPs7XNs+heT1F/KdcgxLqWbwmPG6kR2atemv+ND+GssgyTrT5
	zwDrSVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbHa-0000000AoJn-2DFI;
	Mon, 12 May 2025 22:05:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaiO-0000000AiuS-0fQH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad2216ef31cso554410166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085374; x=1747690174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj0AjGJjQ6DzFsBm21JwuZJt1umVaV7A/rQDK4jKmt8=;
        b=APCfkqZV48n9FWDp9V89tcGN0f341vuOe5qDBwQxvwTQjmtI2yAZk0rC7GGluKROZ1
         Cp/17ysQ8iGkjU6vvN2JBMN8fvmsqa/+/sBN0KDQU6xFvdEhkBTaMTydPbj55IO1nFJt
         TwwdvIJ7fY7gZpI6xeOsLsWpwqMUcQ+Wmx/OUZenSvS8/1gLYmeCHOqZDkXW9N32ISkG
         mfRETJ5eV8l1MQTPDWv0kNoZ8pAcQoFizf6bVVFXmkVsnbjxAiT+pYFc5nmmb6nYlSss
         /5npK97+MAupvfNMKtlLr+W7iKzf+RalfCrfYts8UPMFKDFW+exp/NbJe+rggMfQXMNy
         5NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085374; x=1747690174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj0AjGJjQ6DzFsBm21JwuZJt1umVaV7A/rQDK4jKmt8=;
        b=DwO1yc4nx1WG7iWrnsEDvZMxOMAWMnqqjS5y0HAQgDl82ltBuZY+FWobSwPgh01t9s
         y1dYPAJmNmoF9wKwnLWXCjRTKDoD8r/MJUBRcEmqPPiOGPFcnzqUpkQSs2WzAnNYWDK+
         ORJKSvWh9+kCcyx7nPlFvpVXztoppNgMesGERUdPt5ahFc3gwBB/LZrN68T+qh10yqC8
         q8y14qgTZwN0zQExE+S583cfAhn7xQ1U6VIhbVlt9jjwsZD64Qdi3iHnfaVGQtpqeru+
         dfOiJ75pBuCZE83ySfGeK02oIyZatXVtmgtXRtb7r+YTEcj5gRxPt22rMoAjyqv0IOeH
         /oHg==
X-Forwarded-Encrypted: i=1; AJvYcCWCBICsik8UG2gqhv2uaYcVEj9sgvg7r9KKykNANV1WeH51SikxGqoIXMnAmFXzRvpQjQRjN1+5WQ+bAM4KUqIg@lists.infradead.org
X-Gm-Message-State: AOJu0YwVH+5SBlv1gIOFDoIc+e/vo4Ka/KcUEq57mxu79Vng5Zd9LI6r
	9hYnk6g03R1NwGu47Z2btFK/X23jVw0tOMjSJRdW+wV+PsDqZJxz
X-Gm-Gg: ASbGncsdxXTEXr1/9gO7ugZr/3IoGs/nw9CnC+MNB+B7gcO0CG8NcPnhUY4Qxo83Do0
	3SlC4sFh1Do5y/QXOO47IpQmL7ADmaBae0DAHbQ1x0cAaoQswDih5K4ka8//IZJXTjR4WtNF92e
	qoR5f8o2/zcTZ2FWusCFPLDE3tdiZzNKzzlFgVHRA+Mok3yZ5gBRgr+Q8LxJq1yzqdy7xvgXhOq
	4fXLiKlomGihS47PxzGC9cdaef4+btsK4IjaLxBNWSC65dVo7IZBmJ7ZlOP6J9DDrLeIC2Vi0kQ
	s2Bq7uKOX7RA6mUtOlawb9VoNYWooT6mBlDh7KxZKYatP5l1PCIdR3ns2yLE8zw=
X-Google-Smtp-Source: AGHT+IF60+t2YYCvPtwjwNRfGqKY0KHkmhKRyLDewu+gGn5Xa385417TgpoSalLWHueRIccWcIUMMg==
X-Received: by 2002:a17:907:a0ca:b0:ac2:cdcb:6a85 with SMTP id a640c23a62f3a-ad218fef297mr1289068366b.22.1747085374466;
        Mon, 12 May 2025 14:29:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:34 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 16/19] arm64: defconfig: disable deprecated MAX96712 driver
Date: Tue, 13 May 2025 00:28:25 +0300
Message-ID: <20250512212832.3674722-17-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142936_196290_C8734A9A 
X-CRM114-Status: GOOD (  12.56  )
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.49.0


