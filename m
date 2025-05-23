Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82347C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMZdXJF8HQ4HBbVGnSNAyGkt9IprenNJaiH/9V7ofuE=; b=BC+86WAg1iopoNKPHzjDmSNMH1
	+OhusKxAZIAnQe8N4NQnRdgg8XmAYoFi9kAsbkKh5cwVxH7dqOAcbCIv36rnNjbG4as3ra6PbwBvR
	tp8hGGwsdo3Mv+7jiL3g90ZJmJ4lotG5zH8gX2mOwiltaSlgxKw0rvHRTNOlaFtAzmU/yKORZXy0Q
	NydZ+FEcXevwPPPtahbaQV6QfykeoLhDMdLRDx6mpkjEJpU6tD5tp5nZd0Ul6mScqgM+ximLWdU8Z
	ZCq9+m63WfRGqjUa53nal3RIL8Qv3SijJqmFwJzxwZOaksfoQVlTAi6NE9s4NOhxH90hmjdUW1zsy
	HhilMDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbF-000000045gW-2Jg7;
	Fri, 23 May 2025 14:42:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdm-00000003zIx-1cPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:51 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54b0d638e86so13766870e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007649; x=1748612449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMZdXJF8HQ4HBbVGnSNAyGkt9IprenNJaiH/9V7ofuE=;
        b=fLHjdnOiFyxpLwpDkMBxPOPc8AKdkxw5LG9ljNpqHlgGtNxUs9fbnSbxF6K4KU0OeG
         P+Y3SfEwYBQOyisSk/4jkPswDhhHo9f019xWT1KdjiJFnGZxabnT/wXk2pnOLylIb3eT
         KVoHIJjfjdcb5yQmsQJXhn9TmzyOehLdZrQGpupi2aVRnkRraaVcWa+ANk3JovemtUB7
         vxoP+eQFiVvnxGYOiVb+upj5IL3ECj3fS/vBTosMrxofL16Z4fHNJB8FaU+NUYzdSLKI
         jV8hIcrshCm5V6If8VG+MoagbGqt9+/bb2iB/o8hog4rhMAdJCEh8BTBatrcF/9XHLUU
         yiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007649; x=1748612449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMZdXJF8HQ4HBbVGnSNAyGkt9IprenNJaiH/9V7ofuE=;
        b=LlTYPT49YwMY9utUVgLmK8RykfSDlJsHddBC57QZOxH57A/FEjgECPyOU8To4tZ12/
         nJ2tzFKEryGQ5iAXgthcPuE0TkaVAT73iaq5sADD/1XQgXqAfA2oGcvPyZST75ZgsNVE
         Mpn6Vs/66w5xOUDww/nL0R6Vv/41C8qJEj5cWbYc5UL1XAoh1TUtBH3Y4DVAC/P7V7td
         uJCK/rFyvnrvKJ7y15wYVzoUQP8CRCUFpaIQiMKrUJOcQzPgHw8PgK9EXQnPunIMK2xq
         FnHlRhglj1YcMq3mAvDodBK3GvjDllSjlmU5d3dBfAtSDce0GD2rrjudC8P48CPpGSef
         u85g==
X-Forwarded-Encrypted: i=1; AJvYcCXYGCUc/6Gs6vOEG92dnxeijC1imwW4jLvNcCBs2D6sgn1XbhXpKKnu2SmNEUM5AVFFNBphZSITAIKsIUYsME6x@lists.infradead.org
X-Gm-Message-State: AOJu0YwkBO0czNVqslxvlRXESQE499FXb8yYdOdKkgXW7SdFo1Z0rvYQ
	BR7WRPgH9nJdrzkxD2LVHAsuOsxgDrwUdSbjuClZbucpctl9oIll2fD05O5wsxdKUeI=
X-Gm-Gg: ASbGncv6WY3bDyV8RJSnAbikL0mzPjjeXr6bH5Mw6s9dviZz2v+C75uRK/VZAvSkkiN
	OyrXaK8HN8CNHjAglk14ocys5PDTmK1sp8dRXVs63Zz1VGmgfMTLA9FQ7lLQJspMo0zlx/6kqB6
	3tUXXLRcTHe3vjG7SOmClPRITFbW7LCKT9EGeEiweNbPmeWd9acGQ4DxKbuj24avEYASC0qdQWp
	psFlEGF9WXI95j8ZSoaB7RjOIB0W53kZh8PK2BjIfbXVg82+rDlqqAKIhZbbSiN29rBTlK0salg
	GM310EnrST5/QXDpOcmnOH/DFc1N+Rh/m+kKbTFPFG4HNeU8baaTT8mN+rkXSaQyQo7ocsbhBEY
	6EO0j9weAkCEwW1SdH/rsPdd9ag==
X-Google-Smtp-Source: AGHT+IGvEYgNGoCkD4rXMPLf1i5EyasJT4rgUzgZY4MikEpEuIPRUFRo0vKJ3KsJupVkoZwFT+4GMg==
X-Received: by 2002:a05:6512:10cc:b0:54e:86f3:5e65 with SMTP id 2adb3069b0e04-550e9966d43mr9793624e87.56.1748007648818;
        Fri, 23 May 2025 06:40:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:48 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
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
Subject: [PATCH v2 06/21] soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
Date: Fri, 23 May 2025 15:40:03 +0200
Message-ID: <20250523134025.75130-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064050_426111_E312AF5A 
X-CRM114-Status: GOOD (  17.62  )
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

Tegra implements its own specific ->sync_state() callback for the genpd
providers. Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/soc/tegra/pmc.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..ef486387ccd9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -418,7 +418,6 @@ struct tegra_pmc_soc {
  * @irq: chip implementation for the IRQ domain
  * @clk_nb: pclk clock changes handler
  * @core_domain_state_synced: flag marking the core domain's state as synced
- * @core_domain_registered: flag marking the core domain as registered
  * @wake_type_level_map: Bitmap indicating level type for non-dual edge wakes
  * @wake_type_dual_edge_map: Bitmap indicating if a wake is dual-edge or not
  * @wake_sw_status_map: Bitmap to hold raw status of wakes without mask
@@ -462,7 +461,6 @@ struct tegra_pmc {
 	struct notifier_block clk_nb;
 
 	bool core_domain_state_synced;
-	bool core_domain_registered;
 
 	unsigned long *wake_type_level_map;
 	unsigned long *wake_type_dual_edge_map;
@@ -1297,6 +1295,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 
 	pg->id = id;
 	pg->genpd.name = np->name;
+	pg->genpd.flags = GENPD_FLAG_NO_SYNC_STATE;
 	pg->genpd.power_off = tegra_genpd_power_off;
 	pg->genpd.power_on = tegra_genpd_power_on;
 	pg->pmc = pmc;
@@ -1406,6 +1405,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 		return -ENOMEM;
 
 	genpd->name = "core";
+	genpd->flags = GENPD_FLAG_NO_SYNC_STATE;
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 
 	err = devm_pm_opp_set_regulators(pmc->dev, rname);
@@ -1425,8 +1425,6 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 		goto remove_genpd;
 	}
 
-	pmc->core_domain_registered = true;
-
 	return 0;
 
 remove_genpd:
@@ -4262,8 +4260,25 @@ static const struct of_device_id tegra_pmc_match[] = {
 
 static void tegra_pmc_sync_state(struct device *dev)
 {
+	struct device_node *np, *child;
 	int err;
 
+	np = of_get_child_by_name(dev->of_node, "powergates");
+	if (!np)
+		return;
+
+	for_each_child_of_node(np, child)
+		of_genpd_sync_state(child);
+
+	of_node_put(np);
+
+	np = of_get_child_by_name(dev->of_node, "core-domain");
+	if (!np)
+		return;
+
+	of_genpd_sync_state(np);
+	of_node_put(np);
+
 	/*
 	 * Newer device-trees have power domains, but we need to prepare all
 	 * device drivers with runtime PM and OPP support first, otherwise
@@ -4277,9 +4292,6 @@ static void tegra_pmc_sync_state(struct device *dev)
 	 * no dependencies that will block the state syncing. We shouldn't
 	 * mark the domain as synced in this case.
 	 */
-	if (!pmc->core_domain_registered)
-		return;
-
 	pmc->core_domain_state_synced = true;
 
 	/* this is a no-op if core regulator isn't used */
-- 
2.43.0


