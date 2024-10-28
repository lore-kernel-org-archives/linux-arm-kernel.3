Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08482D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tF2Wj+vRMtC983z9w7XL42BV51oFEPPNHEhybEVd+Q=; b=EY9QEmUGUnIjgrkZ9Z6E74e33T
	5Pz+6jd+E7sa+DM/fmlGxrm3iy0AQYWZZXjTmp6V90hch0U79CHkz1ZIbWrCNOzOK2dloZRuocN4t
	fzufMSoLNSU8drJKNhE1fCY+rhGIrI0BNrPE1kAMst4VSNDfOJ8srYEOjtZ7bnu4pYIUfmYRKeyd2
	En8nWne2AhoPsbwIputsFnYJh4huztog9SqNXKa3YBNtgKcaMLMt1BWAasw1Fx+h/Ppb1wq/KDWWu
	0B/6hdfdl1A+tmbykGmNmByMeXA6Z9AB1EnOM0+8EU2ye51Iz+U+8ZxTPWlUlB5In0t0w5aX1cirY
	IXomwU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N4p-0000000APmw-1b8a;
	Mon, 28 Oct 2024 10:34:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Mwz-0000000AOOz-3mEj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:26:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9a68480164so569092266b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111176; x=1730715976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tF2Wj+vRMtC983z9w7XL42BV51oFEPPNHEhybEVd+Q=;
        b=fY9r6JxWdsQ0yMHrHmvKyYi+0yYTRvYO/3Z0PMdPLsOvkRhyw732zNOhi/DV8Q08Fz
         iy4rs2J/atnOUz8fhu6U0mA3y5rhJD9Pw4r91AZNIwKZ4VpvrOz4w2+tU3EfkrIdIAGC
         lkb0wpn71HsLDjaQm+KoIlKtxy2ehdPrx+FG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111176; x=1730715976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tF2Wj+vRMtC983z9w7XL42BV51oFEPPNHEhybEVd+Q=;
        b=HJniAeVC2IILdz/qSUa65ec4Xd2u/pjWM+ML+lMO/PoWfdf7SZR7in2FOU8Gyt/6tN
         a098EWQ2558YExoe0Us1j0+BqFjyZhHdHesz7Vc3w3TBAWtTpIrZLNC2CLdwzALw/P5B
         XculJEs+lTyMTPkbg12H3QRvTkjiSAmDhqazvTuCL4dwYcuIa2Q/k3ru/TRdP1wvVJoF
         574f8dtdIB/DmmuL59y9BIBOuJQtBZsycqkisJQ6XcdOm8+TVsL6vhgiu/LbEcrNzzmG
         kVPxiNxWyFL0E2IH9VlS3307MAxIC9NvJCQ+QjAhXCfD34kzArxwG7D3YooDOcT3JNHV
         JcUg==
X-Forwarded-Encrypted: i=1; AJvYcCVbaDGvHDqj7WEsygvEVWzpxwJpbCwTtkSo+l4wbeF4JfR/5o9mx/eFqs50+9Kf+GhCmyPo7ZKVrS10eTqly+oE@lists.infradead.org
X-Gm-Message-State: AOJu0YyHGP33dZPgrFFU3h6BtwDCRLQuprpgq3F4y5KdyQ4niiaS5eEZ
	wXezdrDpEGScIUbSfJpNN3mad5M8JOxtbuI3fNP7Jl6ylStWD2MxQ8hRf/KOZaWyUkacB3d1rCR
	Dsz8=
X-Google-Smtp-Source: AGHT+IFdXb6XtLDCZdRMrvkyA0aKsne7r7Yx41P1F2c1jET9YdgAPGWx1KeM7QlZRwkreW9voNIysQ==
X-Received: by 2002:a17:907:1c22:b0:a99:f1aa:a71f with SMTP id a640c23a62f3a-a9de5c90d49mr793546866b.11.1730111175841;
        Mon, 28 Oct 2024 03:26:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH 04/10] pmdomain: imx: gpcv2: don't turn on a power domain already on
Date: Mon, 28 Oct 2024 11:25:27 +0100
Message-ID: <20241028102559.1451383-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032617_973864_853D81D8 
X-CRM114-Status: GOOD (  16.09  )
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

The patch, by informing pm_genpd_init() with the "is_off" parameter that
the power domain is already on, prevents the power_on() callback from being
called, thus avoiding the unnecessary repetition of the hardware power-on
procedure. This feature is crucial when supporting the simple framebuffer,
as the power domains have already been initialized by the bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/pmdomain/imx/gpcv2.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 963d61c5af6d..bf9fe4af03c5 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1324,6 +1324,7 @@ static const struct imx_pgc_domain_data imx8mn_pgc_domain_data = {
 static int imx_pgc_domain_probe(struct platform_device *pdev)
 {
 	struct imx_pgc_domain *domain = pdev->dev.platform_data;
+	bool init_off;
 	int ret;
 
 	domain->dev = &pdev->dev;
@@ -1354,12 +1355,33 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 		regmap_update_bits(domain->regmap, domain->regs->map,
 				   domain->bits.map, domain->bits.map);
 
-	ret = pm_genpd_init(&domain->genpd, NULL, true);
+	init_off = !of_property_read_bool(domain->dev->of_node,
+					  "fsl,boot-on");
+	ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 	if (ret) {
 		dev_err(domain->dev, "Failed to init power domain\n");
 		goto out_domain_unmap;
 	}
 
+	if (!init_off) {
+		ret = pm_runtime_get_sync(domain->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(domain->dev);
+			dev_err_probe(domain->dev, ret, "failed to power up bus domain\n");
+			goto out_genpd_remove;
+		}
+
+		if (domain->keep_clocks) {
+			ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "failed to enable clocks for domain: %s\n",
+					      domain->genpd.name);
+				goto out_pm_put;
+			}
+		}
+	}
+
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
 	    of_property_read_bool(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
@@ -1368,11 +1390,17 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 					   &domain->genpd);
 	if (ret) {
 		dev_err(domain->dev, "Failed to add genpd provider\n");
-		goto out_genpd_remove;
+		goto out_clk_unprepare;
 	}
 
 	return 0;
 
+out_clk_unprepare:
+	if (!init_off && domain->keep_clocks)
+		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
+out_pm_put:
+	if (!init_off)
+		pm_runtime_put(domain->dev);
 out_genpd_remove:
 	pm_genpd_remove(&domain->genpd);
 out_domain_unmap:
-- 
2.43.0


