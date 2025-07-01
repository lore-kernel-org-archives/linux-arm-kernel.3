Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCF3C8303A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYtOzZmGnMBH7yNv+nKiRPqWoWqO5OBErjnboqxVlX8=; b=KY7nvsGWkyIqCa71qEc0+FDzGp
	6pphrbpKYvJecnYQhH0UltDUQ0H0ucPqoYpVaNTQbpsLqilqKaxdEOtrpCKMEVb3xq71KncrUkXGd
	91uO7pnqT2AWQFGUkbFb4uZldxT5swvHG1vb+tzJFWb+XMBZmSdH435GIgNI+frgOOQLJw9neE+B2
	7KrHFTusunNGUhhHPkW05KcSzVTLcUAp3g+rXsLEJnKEUlSNbuCwBqIl/LxopngQTktWV0Pr+pmZl
	+Psg0q9WJT8WuxM/JDe9qY5bZd8yz1fV0eSCsTKM8F/+RWghoDZZj08TTTozSWRdOG1nrubZK+0Ab
	Kc0J+Ecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa99-00000005JyP-1D2R;
	Tue, 01 Jul 2025 12:31:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSw-00000004ugP-0Ikh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:59 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553b5165cf5so7449408e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370476; x=1751975276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYtOzZmGnMBH7yNv+nKiRPqWoWqO5OBErjnboqxVlX8=;
        b=bE03jq96arqPlzwVroM2fU0/TZIOcztO9SPQseVrbwS9B/kj3oq3Lcx3U1HRFJ+uSD
         +GYMtGwncOVR5tNOz5lp05rglxTNYU1tPFjqR7edq2kVD/MfyFD4a2wdmBdT3TvD7kUj
         +jkst+ENTiepGEm0mibFdVzzMWxYxALibk80VuMj0R760al7qBQ/tpnUmx+qvXbQsjGI
         M1ifChixCXnYF5LtFbtMItGKu7JKNXo9MhhAcRU5ZUo9WFF6skAcr1ixHEA2Zac2LqsQ
         ILhsEKdweNXTuKSMtlxfcEGHlmpx6EEe8Vtqqom9ifUPqKHJQ5W9vvcrk907ODl56F/x
         BpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370476; x=1751975276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYtOzZmGnMBH7yNv+nKiRPqWoWqO5OBErjnboqxVlX8=;
        b=LsiwhaFxp7Exc9z4VagzNFSSfbr8ZB1JhWmC2atk47bzPrV78OYjyOv8cMA4gJSgNi
         gu5YS9mXEVjSHY/Dg7ogkw5nrh+ciVTWYvXsnFh/iFzZqIL6SlNiu7V1PbPGLlC7IGa7
         04BtGvFYeqCJ8A80/RvZ8s8SFuR3o8yDTGxpKjirq+l66TVhfYSHMH+02nSITw13/lr5
         Qd9KQwnHHaKEhByCc7hlV9UjS5vijRGT24ISKg5uVz9SKAEyU/Wh1svh037yYX2K73Rs
         cGrEpZAUG6OSAM/cU+MkVwmuOjKJtNAdnL1g2B18tosDQkgB6s9X8+NqSbAxNyWnscHh
         yWrw==
X-Forwarded-Encrypted: i=1; AJvYcCXHCnHqsEyWBjCRx9F1Uz8av8at2GR5szpGkAepOo7PIw0sYT1mufo9VocF/agDnEi50DjqUzO7urIcqjo4DWl+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt07jvkvXTtBoMKgxhmTXfksQfJS+OKdTFD34yYj+4mW1ylhT+
	tX1ZY2c8pp0EUbj0eZUsZ1cssC/tH8xzRkK5x3gwZbqJNHYvzcHCORmP2gSC8oUdURg=
X-Gm-Gg: ASbGnctirUXq2Lbmz3M6Fim0dgbctWorYuOGardIIgvwQfIqAof9dsFtRa2r/eRzIp7
	BivgbyULhH1AC3XyJ4QoAfe2smUGJ0tHdKXZfqWMuKJKVJnerG8N2qZSH6ob9KplXMcHbbJecda
	0qWIasmMz/DtF9Mq7hSlD5wX4RoIPVMVv6691uf4eL6wkpBzYtt7rEf7s3k/eJKkMR2xhM9fxDH
	m0cBDOBgUEllEx8mJxV56LIYeqJ3dmIpE/htzQpfkOLrHr32S0r2ggEkb6Rg/td38N0xvYoS8m6
	HKR8nx9T/PWJuPoVMvQEJTrX/SRzoU/ZGGXxKg3sVyQK7e3tzogvMK1CS3zHfVhreK+yam7tuJM
	nGmOISKo0b4JlBibJTBR8EF++f4U1BtMA0kho
X-Google-Smtp-Source: AGHT+IFSPaZorQ+Qh+OkD3aotM2d9NhdvbOFk3i1QZMiUSjQgU+7klRfn1pjmSzZTdcbR7VQIAkesw==
X-Received: by 2002:a05:6512:b1e:b0:553:d910:9344 with SMTP id 2adb3069b0e04-5550ba2b25dmr5366069e87.45.1751370476453;
        Tue, 01 Jul 2025 04:47:56 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:55 -0700 (PDT)
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/24] soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
Date: Tue,  1 Jul 2025 13:47:11 +0200
Message-ID: <20250701114733.636510-10-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044758_134246_7646A10D 
X-CRM114-Status: GOOD (  18.26  )
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
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/soc/tegra/pmc.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e0d67bfe955c..d209e3435878 100644
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
@@ -4263,8 +4261,25 @@ static const struct of_device_id tegra_pmc_match[] = {
 
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
@@ -4278,9 +4293,6 @@ static void tegra_pmc_sync_state(struct device *dev)
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


