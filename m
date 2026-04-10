Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E78E99076
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIFBMvwRZVJlZTyPyEFR27wpVQvdUbmru6DwxmPBoMI=; b=uNb2uSJi7QyylAyEGykkGCPXHF
	Jopgsxz6pqWIV2+E9yF24JZ43sFFkWlCI3uKzurBvb33L0hmH7zzNpUdzid+5AR7DlIVKnG9YgrWc
	/ggXh++GJnE8l3vaxYKNe3D/iq5n8Z4HuKbaYt7VhwiTCQUdckALUBX1paYy1RPKrL6cOYj+2BePg
	dnoI1m8A5FriaAktkpBoNKR7dOKViV84jQe7OIKEaJJ+QL1RWuhxhhfQhrztygR6iDit3jsTksLSy
	I/QodX9rWmoCpDkEOVQ/DRH/yTLYe/qXgzqnF195RZfOom3/b7KiE0dbmyb2ccjQOD6Mo895yrpei
	l1s60f8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ih-0000000C1PX-3UZu;
	Fri, 10 Apr 2026 10:41:23 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ie-0000000C1L3-0pGD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:21 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-38e09b14102so16197041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817678; x=1776422478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIFBMvwRZVJlZTyPyEFR27wpVQvdUbmru6DwxmPBoMI=;
        b=fEXHmLH8PK48kB6iYnMOwOnWqSZ6jrqETgIHuhl8YUnW7T9rURmIT7O7GT8+190S0s
         ffH1QjLFCOpfYw2N45ugYPizeaicXM2SLk0MMRQDfk7GVaxmmJy3VU0XLFYSrRFshEan
         Cyu3Jt4XtP+dbqRL687dmnPCSOjrotAU86HEVtVQVbypXi8Nnfy8ImS4GaGvtFH5OHza
         D61LQ4nWvKKzArtUenXsU5k16FmA4Vd0id/rZkx1ad6N5weVWRoFj9bZErM5srNcnKMT
         JovkBdiGmAb1p2gubZrcnp7CY0FP8udSauQm3vs04qqFxgOTilQvyn+oLxFhB9S/GdeF
         jkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817678; x=1776422478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIFBMvwRZVJlZTyPyEFR27wpVQvdUbmru6DwxmPBoMI=;
        b=hR/7dwHe/mIA6Rij9op4EywUjBfM94vsjbVpJexWgRtj822s0nnc6HECZ8Cw94MDZl
         GPLfhEpEDrC60XChh/FSyQG/D8V0aQQxnsA2+KZ8Tv3io6VO5u32lHl1VQaTEk0KIsFz
         dhW9UjURm+A2FRWvsYy/agkgnjutB30PmPHMNV2WfHKMdwoSbZ1NrlSposINLwiYJVxz
         G/sXZrBNFwo/P0sb7Y/N5agw7iZQy8XhHAUELnbvJk8e+2KezWs2hjQ5a4YgGe/PI+jt
         +JZUUzalaK8Q4E/29+ddDkQQyZzWc+yTlzLMkZ+JWPsWcZErNfoiDkWnenZrsQ2rpKHF
         JERg==
X-Forwarded-Encrypted: i=1; AJvYcCUduBEo3NfQFtaW0oXPLTK3YisGlJ2C06eqrg9jZ8u+yyb4/n5lSY5+Ixj2KsIOJW5m2/DaPSYzkHe4EAvU+hLE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk50ona22X2YhQzSwY/mzBdNVxxevM8PIIAQQAD4F/yWXYETYg
	jyIfFZoBPTjDEc6WXBP/thw7qaanQlNY3kaiYdKddcVxyvRKyqjbPC+REWQlAKKj/5Q=
X-Gm-Gg: AeBDieue6VPPmQElOZcMhFyDBjdBk0akWWU2z3+aPsDsbEfczRWDGRNOsb6NO53tole
	bl5Byzf1cnFn0H9+QSMR7J6ChECdbKUfMs194wtkS4ZXr8Gl9FleSESWRe1wWu/qX8E4okKviAg
	9mGeBJF44l/oIaGEInYP06H0c4g32H88yg1T4NVsAeqjIsll4fxJVpjV13aVmGPE4HtcjVg6DIs
	K4tw9EoHrrOzGgDKDsnUAplqBk7z0qbVY1YCcdl8qaBY/41f57hqzcioVpUZcuuC18D7TMqQfID
	6H9knjvYmBV2sBf1mySkGI4j6LZ+pzpeXIUC1WsTKM0ho2dxj983vYxKvqEMq6v6AZcefKYd5rI
	/6YyvIOKAyPNrXwjguZsLSKgLb6U6Awhn6nMLjr71eZjhaH00vlKs4RqCTYFPyzk0o62+VGGoeb
	8pnyWrX1I8tguEzZp7pkcq32+LyM4UnBC3wRIiwvl2NDFgb+IpDZaO2ikHBK4r1nBM3NCA1LCp0
	ahfzZNgmek=
X-Received: by 2002:a2e:bc10:0:b0:38a:44d4:4901 with SMTP id 38308e7fff4ca-38e4bee9c30mr8863961fa.17.1775817678163;
        Fri, 10 Apr 2026 03:41:18 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:17 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 9/9] pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri, 10 Apr 2026 12:40:52 +0200
Message-ID: <20260410104058.83748-10-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034120_260417_8FE0796D 
X-CRM114-Status: GOOD (  11.58  )
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

Rmobile-sysc is not a onecell provider and didn't really needed
the GENPD_FLAG_NO_STAY_ON flag in the first place. Let's drop it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/renesas/rmobile-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 93103ff33d6e..e36f5d763c91 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -100,8 +100,7 @@ static void rmobile_init_pm_domain(struct rmobile_pm_domain *rmobile_pd)
 	struct generic_pm_domain *genpd = &rmobile_pd->genpd;
 	struct dev_power_governor *gov = rmobile_pd->gov;
 
-	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP |
-		GENPD_FLAG_NO_STAY_ON;
+	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	genpd->attach_dev = cpg_mstp_attach_dev;
 	genpd->detach_dev = cpg_mstp_detach_dev;
 
-- 
2.43.0


