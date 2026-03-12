Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6992CFED2CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=; b=RNkIMAQ37P7b67/vJRIQ8fPYeP
	VSrosewMtZa+3ApLJj7p1IAc81/HrCZICRAZRW49ZGSpIvjg0W+yBy5QiTRe6Cg2xMi9vCez9kLYm
	ppHf0zJ1NMp1F+dTyOGBMFzSUG0AonCty8akQTukce2SM3rAcZ8G70Biuka5qbdKZnm9e+acw/eo6
	ycTvxvxW7P2ZqvUuY6g7ddY5uhh3ZHKpXGSyVC+5wurDJzviI5iMOfLVEHAyvPcvGD85n3idF3Th9
	YmmmGEiWqj4V2jt+1gd5e7G5r1EulXF5LEx77acQLUIlkFgmUV29h264xLQ5o/UgqIrkI/xO+7YIo
	o4Lcc2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTG-0000000DEPj-1y34;
	Thu, 12 Mar 2026 04:16:26 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTB-0000000DEKk-1N5o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:22 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so255450a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288980; x=1773893780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=;
        b=FdsyjU4+np2LcwliqkNlxXWMUUr/wAn7WdvyaUvxBOhYe/+6PT94z2NqqJzp1W8EL9
         L3G7cAoYQhWktyEjBaGCUiekN8fUf/DGCpPhLbh57cq/e6z/GJSvEfcyUPUtOqstci1j
         NuPP54X3j45Df9ySWXtI0viKf1L6KwNUAU9MbRqa4tFNrsY2Xl28LePF+r8jzWZrdcyB
         zq5y9XCLMmeipCStEd86ZXEUcn4dsZVw4XVjw0RrUAe2Vi3unDlmsECVUl63LyIgSmjE
         i0FjsefgmY4yKWWeK83af4OIuC3tdYdjaOCRtFb7jGDE96pYMB7X8I4iGzyGNTBvts/y
         oeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288980; x=1773893780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=;
        b=VE0nFMBAK5a0uCIeKxpAf1RmcKHHl/14FIVyquXDaxN/5Z6Ly85p9+yw1NwuaThpXP
         b3zc2SSwNyHcrMjdd90cIpKaDES08RUBAQ8cNgRmiPOnPzEftZQSeaRHHpCgfOj3VlhX
         4aDdwBBnnaVZFM2W38Rh8GEgC9JoFamOtZzx/+a0z1HErT4xbEe2GZrbxqsYLEZLQ5fF
         QbSVrLqeTTA1HDo0XeMWR2JokO4nNOqnhwQuf3dSbtpRsFkNdNAlUZb4c3LFIzsuyAzj
         f6p1TvztHBDjs4oohOW/Qj/DTJJ0VbA0sG+JxyuXxZkWYjSd9WnnuQ1VC4F83Y8E6Ffj
         pAGA==
X-Forwarded-Encrypted: i=1; AJvYcCXjCzIhMGsWZpW8yV8TTXXkhzYrkUqf2cAQf9uxLdffzu0LxmseScFScI48HaLoz+qlYSPnhPsAc+HbAHlQs0ZS@lists.infradead.org
X-Gm-Message-State: AOJu0YxnYuEQvwbbnBXkwRsWyNDdQiBFNTBNOYmDP/GhAvstbRH+MTzA
	ZSloCkjRJTmyJxYS0rz0aiV28B/pKhqhuS4kxOTFCtafqnqx2xc6Tihq
X-Gm-Gg: ATEYQzysLb/HK10U5ZORa0zWr4HyIj+9PRbiozrvNnXlrrQMwPkn+Bf8PUVNuTSOlww
	NBKa3fpF4v7IGJmoSoxbQt+iXUS667+P/XUJRQK1M0KJ5uPvT9UX1+EYmZDzf/m9+JWA3dk1C/c
	P2uVLvi3lbtQ+cKfkNdPBey7PkvLRUdFW0dRVjBGohWglu38vSVFQS1WUERG8WIWTgnsBL9gpRD
	Vda2qgEEj25dc4F2jsGOr69n2v5pNKcOHJAJWVXqRs0uaVcRZBGsLW+GUpm+xgAdKV2O/LoYzpF
	YbkK+nCkIQZmzrmIAl9PTK1STKT73nk2+Cq+pq0pc21A9WkjgWXSVIf+O9X1smesXqM7twqHUh3
	pVYHsQoHrbAe2K8y87apBZzk27Updp04EzRYcExECas5bFffJStWKeGSBOw0BsgBgwc+actEZW/
	u7UjJ0Y3NCsubp3DqVELU/AEgZ6Y1qTer4jEWnh5mRXACaRHDRsiFrwx8B2Woa7rg3Y0tlDeDIl
	ClYR5M=
X-Received: by 2002:a17:90a:d60e:b0:359:f4de:8084 with SMTP id 98e67ed59e1d1-35a01323af3mr4560816a91.23.1773288980433;
        Wed, 11 Mar 2026 21:16:20 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:20 -0700 (PDT)
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
Subject: [PATCH 4/6] pinctrl: mediatek: mt6779: Fix include guard comment in the header
Date: Thu, 12 Mar 2026 13:15:31 +0900
Message-ID: <20260312041533.187553-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211621_679606_2C6313DB 
X-CRM114-Status: GOOD (  13.24  )
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

Fixes: 920e469e15c8 ("pinctrl: mediatek: add pinctrl support for MT6779 SoC")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
index 0a48d6686ebb..d9404c9f6479 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
@@ -2082,4 +2082,4 @@ static const struct mtk_pin_desc mtk_pins_mt6779[] = {
 	),
 };
 
-#endif /* __PINCTRL-MTK-MT6779_H */
+#endif /* __PINCTRL_MTK_MT6779_H */
-- 
2.53.0


