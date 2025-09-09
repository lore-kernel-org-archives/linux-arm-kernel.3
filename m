Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7B5CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRRJzAp5T/AY0upYHHrWwdi9zh66HciwKxd1T/ME7rY=; b=0IkPKkcQNYK1QbL5X8Du9yD6Ht
	lCg53J3PmQJ9scMuoRbwZnFR09pt7FhSv7gUBfzrol9+cXr7gkcgro1zOsYVT1ex4fr0YjhFbs/8p
	QTUXyokEvGpWLdLTm1+9v+6SJdj1Zgr8SSXScGMrGHy/ieHatN3I2gZwujDmV21U1cQfdS3z7Fp8V
	b5RSF6eADUFO4WxM35ApmwF9b0aWxckqnr9FLMSjGdPha5lI51Jj4uo7zqUyQf6A7E59dvWN2Pdsh
	L3fEnyd/RE6C5EX8WpFHuKkK36AdkRpqylYQayi/IJ5IGblzcBR6nwcD5Hi5OHwj4a8Wt7CNmsxyB
	i29nPbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vw-00000008noy-2unV;
	Tue, 09 Sep 2025 17:15:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGA-00000006d6l-1sNS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:11:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f6017004dso5742727e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416296; x=1758021096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRRJzAp5T/AY0upYHHrWwdi9zh66HciwKxd1T/ME7rY=;
        b=sLNLuIGcr/f8WI5Htl3C+fza0a9Hw/6aA1AKWPQGYmZgXRuZ/NEW5p10vU1SVopPzO
         TT/gsyEjw+fzLrPaCXAhnO3jGnXDwKJO4y8aTcHThlS2UwE1k+Hj1hrzfnLaAAv5mFhp
         qYQYBgkABUK1ItMXvXNJPFHqR6uZYTq+zipcR7GgJT/+tNBfKvpiEWs96/bz8KuEqd9Q
         +c5IcAF93PRdpRudT/rSeGQ0doczPoZrp3bzCI1EltFF6MYAFpuJUazsGsQqeBf/E4vV
         +paCUefELTKWtsRMabMV4775nVXb8IP7Wnxs8dCB0dyzpFF8T6PthW/zdkS5L7FqcExu
         mjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416296; x=1758021096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRRJzAp5T/AY0upYHHrWwdi9zh66HciwKxd1T/ME7rY=;
        b=RQYRtg6a1dhwSAbnszJ95kEgqSd23Bt908oA4BY2OyB33tqRMjUSyyAc6kx/WuSQ9u
         Zj1A3Fdlbv2K167iaaVj2+Oc4C6I/A9sMGG7JujFlACCIidVQrBk3EB2KzxF/cxQnUU0
         g9cDtcT1Enn9doVmTWDJxKQq9UFC6FphlL880wndHn1TSX/V98JjWUujlp4xZtHOmt4f
         JSD0KpeAuyWYuV23ACrG/nBiRvzy4cVUM+E+ZnwJkWRgdEhh4QQITlmyiWgCjG/DdVs2
         OonfxuzfenRUvLHgpWA8e1hTd2f3F7olEMaVPj5gFHI09WnFkDAxkgscb1+HQ3N0IsYP
         Tl7g==
X-Forwarded-Encrypted: i=1; AJvYcCWYQ5Nek/pyiTcMPUu3Egq70NsdvxtK1ynwOrMbUCxKzzhANU1KSyoVnFmLevRZIuvjc0B2ToyoU/iqpw72RClL@lists.infradead.org
X-Gm-Message-State: AOJu0YyzqIwMwz40TKqy7YCy1y6LxU7pWE7+W3iwTcYE/AZ4pOzUHGPL
	6R6TfmeIVa0gQOHmHSuISXpFhm4yvtHbr5ja+7JL9oJdV2z/71IXjGV7xjsfyx+Rp7U=
X-Gm-Gg: ASbGncsNMaOo6rtUYm1ivj260uUIveoOyNu9/bnAZh5hIjX0NRjbuQgJzeCCP4Sq5ul
	iibN9A2CmJ1dNF5h9Fj5LN+VF68NIbuScI0Jkr0sZxDqaItarATHzwEsBiuw7/QatiovmpeORnF
	Y4mk1/G82C6kkhZ51KXgHFnphOWmNdwfgMdnb6qP0ALVcxGofG5DuFnZ/cgNCRqfqbycrX/UQB6
	jlWwe+eEZ0CgnAtU2qXdFo0EJlW8nQLhkBRam7/KierMoUsjCHThwDSeJBON20NVghfgAlgdOls
	R+hrN8RVvq0Ni029qyiAG1+pK0HhojB6quQzneRMJAzIvX2j6mGkqfvc32nA/xL1lOdyMuwqKpH
	oQ1G41Wn6jpPVPy11v9oqOpJQrs0wDtUYwCoJ09hdArvUIfNiIop1h59LOMIRF0DdbTGYl81gIt
	VXqmUwaO8=
X-Google-Smtp-Source: AGHT+IE+Q6v2KTcckCRiOxW67dRfnlJxOytiBrBROHCosdo74CbcYnNRw9OtyMUXGt/Lx7pml2UICg==
X-Received: by 2002:a05:6512:b12:b0:560:8b56:5dc5 with SMTP id 2adb3069b0e04-56261cbe1f7mr4363060e87.18.1757416296383;
        Tue, 09 Sep 2025 04:11:36 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568190f8040sm445440e87.148.2025.09.09.04.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:11:35 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-pm@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] pmdomain: rockchip: Fix regulator dependency with GENPD_FLAG_NO_STAY_ON
Date: Tue,  9 Sep 2025 13:11:21 +0200
Message-ID: <20250909111130.132976-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909111130.132976-1-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_041138_508227_17805EBD 
X-CRM114-Status: GOOD (  15.48  )
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

The deferred regulator retrieval for Rockchip PM domains are causing some
weird dependencies. More precisely, if the power-domain is powered-on from
the HW perspective, its corresponding regulator must not be powered-off via
regulator_init_complete(), which is a late_initcall_sync.

Even on platforms that don't have the domain-supply regulator specified for
the power-domain provider, may suffer from these problems.

More precisely, things just happen to work before, because
genpd_power_off_unused() (also a late_initcall_sync) managed to power-off
the PM domain before regulator_init_complete() powered-off the regulator.

Ideally this fragile dependency must be fixed properly for the Rockchip PM
domains, but until then, let's fallback to the previous behaviour by using
the GENPD_FLAG_NO_STAY_ON flag.

Link: https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0c9daeb00@collabora.com/
Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 242570c505fb..1955c6d453e4 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -865,7 +865,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	pd->genpd.power_on = rockchip_pd_power_on;
 	pd->genpd.attach_dev = rockchip_pd_attach_dev;
 	pd->genpd.detach_dev = rockchip_pd_detach_dev;
-	pd->genpd.flags = GENPD_FLAG_PM_CLK;
+	pd->genpd.flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_NO_STAY_ON;
 	if (pd_info->active_wakeup)
 		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
 	pm_genpd_init(&pd->genpd, NULL,
-- 
2.43.0


