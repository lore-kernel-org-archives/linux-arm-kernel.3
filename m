Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67244E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRfd2J8GP5C8knwZHf/66JpMVkPptrjLbcLPhoT3Dxw=; b=JqQuYP1nJsSrKG7wfBie2Ybu8c
	bG+Cv3hRGIHGph/z+zQP1lLG0q/nyHyJpn8VlSH08EYHi2GV3nBG2K2rt69M3QAFDznhn35mt65wr
	qJTHZ+3jJO1eng2Xflhbx3dggJMlPNsYk7+TWpqFHAvy0N7hA7Xk/zWYRLOR8lLh8TNk1SYeMTQZF
	DyT9Y3O24YSk7xjbHYz5XEEwDj8DyjViDJBoRaZ4r3cIzNZd7JqMWiIF2DTJxaHKcCSmyWLl55mXW
	njBH/hXQ0D/wnUlcEeWGtoq3T0X0qlU8pPUxvQI/rZFL+70orJgWtFdmTNU3aO2WfI/eiCEvPFR3H
	3C8H2pJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkjK-0000000DSPm-16w6;
	Fri, 03 Jan 2025 16:40:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkgy-0000000DRrd-0gJ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:38:33 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa6a92f863cso2137821266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922310; x=1736527110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRfd2J8GP5C8knwZHf/66JpMVkPptrjLbcLPhoT3Dxw=;
        b=ClPdiGAZXIjA238oGOB3omPwKNOM/oGw90kKOiUpDQb+KQmFdPHqVxEhLjbQu45EgQ
         3wqcqZ0EypnGzGWk4IQSc+bDvYrePueHQRRbicEMe/KlTyZwxmZMYR6Ejwo/Shum3ICJ
         7K6b5/BHBBWoL65DaiCcjnmWDCwmMRvhyAdxtWmqMWfJPKwM620Pd9COvR1FlQs+JELP
         y1vhGxuR7JuHqf2PgUyXG1IheXv2Vq/q2BBO0J2ogpa2oah6L3HaAy+Ebh5AHQ+LpdaY
         ULn2dnqXokrXPiSxSetfwrtnHPEAXACafZ0eLLEgFV260xZIJO6Ixh4ob9Xg29iUAGXq
         0eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922310; x=1736527110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRfd2J8GP5C8knwZHf/66JpMVkPptrjLbcLPhoT3Dxw=;
        b=TYxFXjqHe64CU7LxmO2VXBUbsETyUQvx0TL5PVQCtQDSOd+IukecZu3eFhw50ZC+18
         XFpK2JXbEr1Y+EKEy5Db2pObPPsh6lJkzwPiEdpJWK5P85CQ3mizPYMiHnkObNfeJ4Se
         5yo8pf/6JrUOdrc8BiLE0RAO5ryAnGcsazyDw1jIgDvyi4CGFWZvLHFwQZ7RsVGBHJsC
         AKku6eWgUq6igZveXtgJZ/nIbTM+IF9cGdzIGaXEHQaDiU0zRplThfPHNlbh2G9s7KfN
         9v9/gcZ0r5VS+5ODlPURB2RyvxmCXDJ9HQ+gVT/YlrF2OmWdt/xJl5xZGNSMOSOaMdkl
         hJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnp4u6jZhrey8p8SPHw0DLbGo3CzO6D6XM2wgF49gNbK6TVA4xN6NMaYPKKI/wmOLjuSSGWgYiiFdXCwL3WQ+h@lists.infradead.org
X-Gm-Message-State: AOJu0YyzJsV5krk0YYrlCWrLqUCJ8blxnM900uFytaHZoOr0jLu8ELxX
	rFZcOI2UY/tJkykEpXml4co4K/WNBp9LWWyfvzv5jipV74VB4gQvORzg9GW/Uyo=
X-Gm-Gg: ASbGnctyxsauKYH1vjc+OBuHRLM/Q2P7XXxu9787ha2BQ8G8FgP6qx1qLLe9eqMxe4c
	nb/vGtPBYjTKSzQOOsA4hz0VX7i1WexlziHFSxOVLRbmH12tt2jAsCnvc7aH8RfhmPdXjmHeXe5
	wE8LhWbEMErq/KU1VnmWZIbM2E8Ehts9lSmS1EySRYsA1BSPjRAbcpZvca/n/h35E9iufFdEIt9
	YLswn9zXH6LR9UKmCkgvQ58vD9jWhkcacuaLbjdTkk1L1LBSCMfQLpZjHGlpZJcAITG1oiiaqI/
	PuENi5vCNhU=
X-Google-Smtp-Source: AGHT+IEDncREyuqiaeFdEZrch8doNfoioGsr8GniNw17HEMgfl8Mb5jP1IALi9TIgf4Be+b+F0vcRQ==
X-Received: by 2002:a17:907:944f:b0:aac:439:10ce with SMTP id a640c23a62f3a-aac2ba3c11amr5503329166b.27.1735922310189;
        Fri, 03 Jan 2025 08:38:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/6] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the TSU IP
Date: Fri,  3 Jan 2025 18:38:00 +0200
Message-ID: <20250103163805.1775705-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083832_200684_5089527D 
X-CRM114-Status: UNSURE (   9.68  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks, resets and power domains for the TSU IP available on the
Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 0e7e3bf05b52..bc44e08e7eb9 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -241,6 +241,7 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
+	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -279,6 +280,7 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GPIO_SPARE_RESETN, 0x898, 2),
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
+	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -353,6 +355,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(4)), 0),
 	DEF_PD("adc",		R9A08G045_PD_ADC,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
+	DEF_PD("tsu",		R9A08G045_PD_TSU,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
-- 
2.43.0


