Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1ABCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/0xrgYWwbL6uDm6bWRd8Dfjm9NXSGd8s9gIV76gFCo=; b=fk53Olhm86wZSJ7wmjhkIOvEN7
	KX2DhUYSHkNP2kKKCPwM8dVLNOd2hOTszx/yQEERYyGPZ+ysFYdyl35gSkDKCL/mcywyqfs4HPKcm
	7Mt2e21jbU5Lk7gtmUox+fuPZXcmxQJgDUSjkxnaetVW8+KZ7Il94/gbiex6AyWmRc+2JOiCeaZav
	vaNir38jvPFS7b74Wef1ud07yV/iKaJuphC99AcmNSRUHBiH8lcoYYALI4jwWqVHq13EO/jxUZMXV
	EnYCj5mlUJLEweKJvTZibHy34IKNoL+WL7ZX+fEFzedo1l8F0mbkmpO7UohRShrP0t8YvTPHRnH3A
	vLA2ZlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n5y-00000008OOH-2UP3;
	Fri, 17 Oct 2025 16:14:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n5w-00000008ON7-0Yuy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:14:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b54f55a290cso310039266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717658; x=1761322458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/0xrgYWwbL6uDm6bWRd8Dfjm9NXSGd8s9gIV76gFCo=;
        b=YFnPOzw9W3bxchXfnm1ndRMAoIlJScezcltEbx2mw34Js3sRLtraqM8aKnSKo4wOgO
         WyV8C6bblopJJW3XuxX1+/eHHSdi/fyEwtnHnvyEXVFS8JVL1xI/aL5uwkiw92pk4H30
         4L2A48gsFEKlZWKSphKpo8brfZTrMFcdZ9kaf5I4YQrAwtcDph0A88kX/977OpS+832d
         ADd+Lt0j3psDGF3c0YAoBUccJae5uZe4LZ7XjfdHRmeBvGqpWgX0HLlFxlTTOXvqiEPr
         mRrbmg8QKnL6BgFrqh9MWGcSKx0JwnrrPycy2/Oy4gs2VoJ0XscL8mO5GgsogxKKunsP
         uGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717658; x=1761322458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/0xrgYWwbL6uDm6bWRd8Dfjm9NXSGd8s9gIV76gFCo=;
        b=M3wTRBjilvM+pyWh3NqJo2W7azWWenKYLmKH6Or8w2dvOw+CytClyYkCwHAAKU1He4
         bLA5AL7taBRkp03vTo+Qo7Uwc6CLWu7XfvpkoyNdWVYYsxyW51BbKWAMDMTyBGc5dwlW
         41QRhVl0dDeF2xw+9E/EgNu3DbH85ByDfcOXIa2GpB7wX/D+hh4k7wdJgRIxWFX0anvL
         GKRKxWSqQkcNuKzLvgdTaHI+bIFhDKeo13DwcCTweWqeK5LSTbDsTuhvFKiLHXYSOPwn
         AX2VgtP07ImmhOKAO3t8sqCmlbf8zYkt0qeUVtvH+89ErqjbZXg6FS6yH49d6BYMY022
         lI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8yPVwUz+hdBQpMeIDRqxg0Sn8bRxbOXOZb8vWTS8jyo3E2iLcNnkizMYWT49BwjQSLauHBPeqljOAg/B1uljp@lists.infradead.org
X-Gm-Message-State: AOJu0YxR9rfMXeXRm2AXv7r2GeE0QZsXcBl1VrapOtU2I1xNkQY6lZVL
	qOMcdYFMh8Vu1OZjaut/+10MVlk0T3jEOvDo2KwZxFyJF3fgawC8qbZq
X-Gm-Gg: ASbGnctjYBiAfbIYzYrGWkmbcctxZPk6fQBqH9TFhOgkIEfov1G1UFnHzX2BWCQur52
	G1rjEFGacOz+4Xiae9ft5ArxyENsX0nL8s7BNWq9qQg/HJ744aALZqiMbPpTR+AKo6swWqux4iA
	/Zd3Vf96NQfimMx2Uca+nLYE6HLQYLwVqYR1ixzyJO48IL3oIwO2GDX4DrP7qO39USrTt8HGOWz
	YZ3ioT7n0j/WNv3yLQ6C6Nz/Cw1eojzjx79drZVIaIj/m2yMOvY+ER6gy1DTZrU8mE/OD3xLMEW
	1KMjitFjDVC04tdFbr2cQGcOmMLQ9YOPH/dN2NOrAMYzTWqORGccF4zeYWO4VmoTNdN/KuQlqAv
	mLQ++MPagcRe20UxpXD2BJAfmE9GGnUSiN4Rox+p22iWWOVcg4Rwm5R9QLnNONE+6eP0PhnBy2o
	XOUUOx6VdXRX64lP7YDPZx70Jnzgc9yG68/ZrRgzUi
X-Google-Smtp-Source: AGHT+IEvX2NLEl2JEWd8maw6vu+Cz/hVCzCLPJGWsXutTdMkKS8cKelXvHyzoaBlWYedD/QgQ0uDEA==
X-Received: by 2002:a17:907:a46:b0:b46:6718:3f30 with SMTP id a640c23a62f3a-b6475128af5mr477286966b.51.1760717657887;
        Fri, 17 Oct 2025 09:14:17 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] clk: samsung: clk-pll: Add support for pll_141xx
Date: Fri, 17 Oct 2025 19:13:30 +0300
Message-ID: <20251017161334.1295955-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_091420_185736_6C83F32E 
X-CRM114-Status: GOOD (  15.61  )
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

The PLL is similar to pll_35xx, with the exception of a different
Locktime - 150 instead of 270, as with pll_142xx.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_141xx, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
Changes since V2:
- rebase on next and drop the unnecessary new line
---
 drivers/clk/samsung/clk-pll.c | 4 +++-
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d..4700eadad 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -278,7 +278,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx || pll->type == pll_1017x)
+	if (pll->type == pll_142xx || pll->type == pll_1017x ||
+	    pll->type == pll_141xx)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -1497,6 +1498,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1451x:
 	case pll_1452x:
 	case pll_142xx:
+	case pll_141xx:
 	case pll_1017x:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c8bb7f26..3c7575cde 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -51,6 +51,7 @@ enum samsung_pll_type {
 	pll_4311,
 	pll_1017x,
 	pll_1031x,
+	pll_141xx,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0


