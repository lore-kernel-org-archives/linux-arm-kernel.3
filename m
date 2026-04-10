Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942E3E9907F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaKCEd2gzVah/bMq++NzZ+nKKJRbKGoWqEto9LQKP04=; b=dwtLNlQb+oGYgXyd++YtZAorA0
	ZIrynwyJhleDraVsEQh45bpZR53K1cwxc7jsdhDDLTjYSJZu/yPN+ZUekLgZZ6sqBmZVksBWC4p+C
	YdW/khoXgC5NalBTiJsBiv5DnGPm2622hbCLOmB0WPXxtabOCuABuDrJnUGnrUWgr9KuYGHqxOVPz
	7S/3b35C3UHEnTbZ/9sDkQsWqqU6yp3dQxNG25cNd+2PhJmq8gswceK4pl5SQGWBO0oZZnLj543Le
	8bgxEUEsZqXA7PtB0DYKRm3Q8loR3vWVrnHbDSalKts9NQik5npxKz5CpWOotGeRPjhVbM9DNgJRR
	nFqspKog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ib-0000000C1Ja-3FjC;
	Fri, 10 Apr 2026 10:41:17 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IY-0000000C1Fp-0E8g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:15 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-38e387f3838so14647341fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817672; x=1776422472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaKCEd2gzVah/bMq++NzZ+nKKJRbKGoWqEto9LQKP04=;
        b=qo8ZBA95WwZFSIRTZbPtiFIe42y7B95DYCoJHFyMiNc+zrzA+dTRbKUR3rDdf7bbDm
         MY0NH6mM+hKT1hwgLi1x4vGMYt9Ypx/caqBZR81nQLycUyJqxVph8iWap1A3F9mNFQOR
         k5oSRUVcIXVSm7IUIfsj4GSAX5PmmgU06rnUemMrHciKM5HYdxHrKSmUiLaWMZU1G9SU
         ImqatX2u5jHRMGauPiBGPTMh/1+51KbkTrxly1icThFhmY1rhdLmUoAYL3LKCOurBS1s
         bD+X/foqxEvQnIDynGbBINZO5OqaF2ESaBZhkcEOLCg/zufPtnATr7oh0YoX4scJvtRL
         Qu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817672; x=1776422472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xaKCEd2gzVah/bMq++NzZ+nKKJRbKGoWqEto9LQKP04=;
        b=seFCDzo7g5GULo/0JaeaLhcAiPIX1r4io1qBmOFCPzpBki6uUGtkjpMK8+p36IOduh
         DyNsHU5aVQEzJUovvNzQzi5pfsdgOV5InF/8jRwpUReC/bV8YKUoCMlqLYXOTcCPkN4e
         bpgZxNCbCVS+m15rKLj5MadvWCmlSZJX60CIpdX+tOrBbHAHfUw8jDdFZORerT4ayIYz
         1uHeknYf5yKfV/tXArgoAatA6wGMqYttOQbhLcADlzX+jUnsXJUuE9Mus0LHdFUk7TuT
         4512ZaIvQ7SytvzSBzBygKU3lKlWsQek0e4aPuQbvyQG9V+L/Iw4NOJDgDPNm1DMfCPV
         06/A==
X-Forwarded-Encrypted: i=1; AJvYcCWhSfOIOPwAdlNZ3bT966tEojGdmJDnHeJfVAcPb2ql2MObMyfdqarEJGZ4GxC7xRot0za19LuCOEQ8VhfwZbUJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwMAmmlTG/3wW5GuUpQOZ+I8c20FdhSR2tVkZQ8jZJDAbHczryR
	4vAF3XZCEZfqNClMLSEB+3kgIsVETx1TC3gYYk0yc3PvYhvON1TUf39dWY5oPbEPye8=
X-Gm-Gg: AeBDiesuwA1dM8ejbysHrd1Rk3jdhYbOBxuqpl27SBQ04eCh9z/2JnzuUYZWFLDLGqh
	9DAtDaEZCYVKaVoO5xpm1H30lZcekpdWJAXy07r9o4rcCcTVP53sHPeczQpAlypL4240xLM1mTR
	oD7DTTilaHwdr5h4geoox02xqtIXL6wyUWJtCaPtOhi8HQNDKdixRlDAdq10eC7Uenl1e8weHlY
	S/9NQ2YzZQe9A2CZrpOnTW1sJq8banIoE8cAWvx1STwZsIsfmwfBlDp41bL8456K+3WTaYAT8DX
	+jXYnQJRj83RNMQpMt7bcryvPSQ7l62lU6kYuHLw/5c+uZXHpEsosNAuXqUdUUEMn3wBsUkyN3g
	ogIc504UH+BuuReBob6olu6U/0oG64i4fh2htccJMdXWUWszSmjrSf6GuLwDU9kmHDjmnKQn5BD
	3baRxxtZLZ6uX/MV0FZkZd96DHx4QRSfDKM+53AiqU8LEGwr2rT32bw03pI6DQllQjTzgwvsMIc
	t9CfrsG5Nc=
X-Received: by 2002:a05:651c:553:b0:38d:d686:e4c7 with SMTP id 38308e7fff4ca-38e4bece01fmr8081161fa.14.1775817671707;
        Fri, 10 Apr 2026 03:41:11 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:11 -0700 (PDT)
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
Subject: [PATCH v2 4/9] pmdomain: core: Add initial fine grained sync_state support
Date: Fri, 10 Apr 2026 12:40:47 +0200
Message-ID: <20260410104058.83748-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034114_141378_4DD41544 
X-CRM114-Status: GOOD (  24.44  )
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

A onecell (#power-domain-cells = <1 or 2>; in DT) power domain provider
typically provides multiple independent power domains, each with their own
corresponding consumers. In these cases we have to wait for all consumers
for all the provided power domains before the ->sync_state() callback gets
called for the supplier.

In a first step to improve this, let's implement support for fine grained
sync_state support a per genpd basis by using the ->queue_sync_state()
callback. To take step by step, let's initially limit the improvement to
the internal genpd provider driver and to its corresponding genpd devices
for onecell providers.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 125 ++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |   1 +
 2 files changed, 126 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ad57846f02a3..783d6f981708 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2699,6 +2699,120 @@ static struct generic_pm_domain *genpd_get_from_provider(
 	return genpd;
 }
 
+static bool genpd_should_wait_for_consumer(struct device_node *np)
+{
+	struct generic_pm_domain *genpd;
+	bool should_wait = false;
+
+	mutex_lock(&gpd_list_lock);
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		if (genpd->provider == of_fwnode_handle(np)) {
+			genpd_lock(genpd);
+
+			/* Clear the previous state before reevaluating. */
+			genpd->wait_for_consumer = false;
+
+			/*
+			 * Unless there is at least one genpd for the provider
+			 * that is being kept powered-on, we don't have to care
+			 * about waiting for consumers.
+			 */
+			if (genpd->stay_on)
+				should_wait = true;
+
+			genpd_unlock(genpd);
+		}
+	}
+	mutex_unlock(&gpd_list_lock);
+
+	return should_wait;
+}
+
+static void genpd_parse_for_consumer(struct device_node *sup,
+				     struct device_node *con)
+{
+	struct generic_pm_domain *genpd;
+	int i;
+
+	for (i = 0; ; i++) {
+		struct of_phandle_args pd_args;
+
+		if (of_parse_phandle_with_args(con, "power-domains",
+					       "#power-domain-cells",
+					        i, &pd_args))
+			break;
+
+		/*
+		 * The phandle must correspond to the supplier's genpd provider
+		 * to be relevant else let's move to the next index.
+		 */
+		if (sup != pd_args.np) {
+			of_node_put(pd_args.np);
+			continue;
+		}
+
+		mutex_lock(&gpd_list_lock);
+		genpd = genpd_get_from_provider(&pd_args);
+		if (!IS_ERR(genpd)) {
+			genpd_lock(genpd);
+			genpd->wait_for_consumer = true;
+			genpd_unlock(genpd);
+		}
+		mutex_unlock(&gpd_list_lock);
+
+		of_node_put(pd_args.np);
+	}
+}
+
+static void _genpd_queue_sync_state(struct device_node *np)
+{
+	struct generic_pm_domain *genpd;
+
+	mutex_lock(&gpd_list_lock);
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		if (genpd->provider == of_fwnode_handle(np)) {
+			genpd_lock(genpd);
+			if (genpd->stay_on && !genpd->wait_for_consumer) {
+				genpd->stay_on = false;
+				genpd_queue_power_off_work(genpd);
+			}
+			genpd_unlock(genpd);
+		}
+	}
+	mutex_unlock(&gpd_list_lock);
+}
+
+static void genpd_queue_sync_state(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct device_link *link;
+
+	if (!genpd_should_wait_for_consumer(np))
+		return;
+
+	list_for_each_entry(link, &dev->links.consumers, s_node) {
+		struct device *consumer = link->consumer;
+
+		if (!device_link_test(link, DL_FLAG_MANAGED))
+			continue;
+
+		if (link->status == DL_STATE_ACTIVE)
+			continue;
+
+		if (!consumer->of_node)
+			continue;
+
+		/*
+		 * A consumer device has not been probed yet. Let's parse its
+		 * device node for the power-domains property, to find out the
+		 * genpds it may belong to and then prevent sync state for them.
+		 */
+		genpd_parse_for_consumer(np, consumer->of_node);
+	}
+
+	_genpd_queue_sync_state(np);
+}
+
 static void genpd_sync_state(struct device *dev)
 {
 	return of_genpd_sync_state(dev->of_node);
@@ -3531,6 +3645,16 @@ static int genpd_provider_probe(struct device *dev)
 	return 0;
 }
 
+static void genpd_provider_queue_sync_state(struct device *dev)
+{
+	struct generic_pm_domain *genpd = container_of(dev, struct generic_pm_domain, dev);
+
+	if (genpd->sync_state != GENPD_SYNC_STATE_ONECELL)
+		return;
+
+	genpd_queue_sync_state(dev);
+}
+
 static void genpd_provider_sync_state(struct device *dev)
 {
 	struct generic_pm_domain *genpd = container_of(dev, struct generic_pm_domain, dev);
@@ -3559,6 +3683,7 @@ static struct device_driver genpd_provider_drv = {
 	.name = "genpd_provider",
 	.bus = &genpd_provider_bus_type,
 	.probe = genpd_provider_probe,
+	.queue_sync_state = genpd_provider_queue_sync_state,
 	.sync_state = genpd_provider_sync_state,
 	.suppress_bind_attrs = true,
 };
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index b299dc0128d6..7aa49721cde5 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -215,6 +215,7 @@ struct generic_pm_domain {
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
 	bool stay_on;			/* Stay powered-on during boot. */
+	bool wait_for_consumer;		/* Consumers awaits to be probed. */
 	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
-- 
2.43.0


