Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDC2D5CC96
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rgH4N0XoiBaBn2DnREg2ur7KL1nWjEyXhZb98mz/Ng=; b=rbwtiKikzQstGhQp2ck9E4xhn7
	rQHV71jCoMvqwPQwdtUI238ekWWk9L4mA9Nqtkn+/fOeXVpmQIFuEWPoM/LdI6dfyQ51W6ens00bU
	wPBDCZ/YI6UGsJ/OSekOGNwlPp/UVgCi4h1L6rfBLDU2dsS0wGkaSEmsnpb3yN1TPpxstJBhL318U
	4+cFO4mmPOblcpYtflmf6f0FoFKBsWsRLXjTyaPg21muS58zHemMhvcTyTzbHc1naHKbavQ6Kcx/2
	iX8Jg12+CkZMKivy2aAymMmBr+i9kzh+KD56ajVC0yb7DxG8fQ7W4gs2Tr62NzEeP1aye2LnOeVj2
	YHrlKwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66wi-000000009WV-2TSu;
	Wed, 30 Oct 2024 11:33:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SZ-000000003k1-3eol
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4314c452180so4708825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286114; x=1730890914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rgH4N0XoiBaBn2DnREg2ur7KL1nWjEyXhZb98mz/Ng=;
        b=QMjj6+rjKDvskWptW5RtCrH++pZelEWfHFUBDoSR0fiIqAU2xSQfiKyZavE1kgEgjJ
         8du/VIc1FCAmU+r9lReIoRR6/MOstdXO2m4sDt69ehnPRODsI6xm1JC85izddczEjq5s
         zzh+6LdDfMyUXtoogrqnKt2geqH1bGNjTvKGNVs9hvTdzmiu8EfkTc4IqaSiSEWl9kTx
         selSauJG0/MxWD5GrIwIWfTUYHuLyhIB9bPtbuBlpJMWMgRVGtKHRxQNvyl3TKDh8Xux
         u+V24kwzBzmORUVClnHY4Asn4j0z45n1AigjRig2eraET+m8QuBsaHT5HhYP9tqcqLvM
         LtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286114; x=1730890914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rgH4N0XoiBaBn2DnREg2ur7KL1nWjEyXhZb98mz/Ng=;
        b=HzIGJKCDym09rEIPk4Poq8++X/eVg5HV4mbPQ2yHG/mQgwZfCF82NYlj/7K2xLfinC
         1a++OYQyUfTi5IQq8XKAPb7KGyyRt1JfUM4JiXYVU0atVbzhFfwccuT3fAKfhKgJPSqM
         DaJvntnVWRpUfpDtmvCh+ou2K5CcJTjzF5bKR2SflhGDCdkfKpKFh0dR8HgxxlENCciZ
         w12QJcR3NhJv31b5lH6pjDhzqGHj51y4hFqwx60PTVKvJwcry7f8xLnvNMpa7OAgr03c
         tCa7d0gTp1Zz4yI8qxHlW9JCATaT0LpUlFIQHZAZEXjmYZo8hIOKp63kiw95YczuJL/m
         VuEA==
X-Forwarded-Encrypted: i=1; AJvYcCWj9Db6lAyS6yIcj9MRl5vidCPTId1fOWSdjmNHuQZsl5Si2XUB7261jwxVo8UO8NQlGCYn39qG3bgCm2mDp3K7@lists.infradead.org
X-Gm-Message-State: AOJu0YxBmoexoypg+TEUysXm7y6k4RHharOTFlioFhsjU/sBzuVZGdqn
	acnf9fGG9Kbe6YqoWzC/OP/jDodq0RVp134SEcvyqp3hiTZ0Shsv1JSCd8ZvowA=
X-Google-Smtp-Source: AGHT+IGfKyeSaef4KGaUGWI/IsN7D3+8OWnPlyJSqw8C74dZyJJbZrKCWAh3Eh0KnB9ZpF56LKeAYw==
X-Received: by 2002:a05:600c:1c96:b0:431:55af:a220 with SMTP id 5b1f17b1804b1-431b5729f16mr45142475e9.12.1730286113827;
        Wed, 30 Oct 2024 04:01:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:53 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 10/10] arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags
Date: Wed, 30 Oct 2024 13:01:20 +0200
Message-Id: <20241030110120.332802-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040155_936249_5C33E9D7 
X-CRM114-Status: GOOD (  10.17  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the Renesas VBATTB clock and RTCA-3 RTC drivers. These are
available on the Renesas RZ/G3S SoC. VBATTB is the clock provider for
the RTC counter.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- squashed w/ patch "arm64: defconfig: Enable Renesas RTCA-3 flag" from v3
- updated patch description
- collected tags

Changes in v3:
- update patch title and description
- dropped CONFIG_MFD_RENESAS_VBATTB

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0fad83642034..4f4fe8d9125c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1222,6 +1222,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
@@ -1371,6 +1372,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2


