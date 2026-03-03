Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F806EC1442
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SAiIzSfTMRShdXJxCInhMGpqoMCKhmfdktkL1GCb0E=; b=zxJhCResTlibv2o7/vx74WLr3S
	HslNfLr2e8Pt4kJYjhJkhfKzl9WvOacXU2WRFNBa+aekvn5kUxHSfAus01NC1//EQZW4Vj7m0DdhH
	NxEiByp8i0WaB790YSfzKzFOaAXFcigFh8Lmu9+tAEiRaV40WMhaENvuyHJEb9xTYx4/9WACUZGiB
	RpIKL85qwUcewLnKPPwlsjih+FCFjcUZx6ZWJBR7qJUzRar+uF8MksI+ZDrJkm+nffoeioDEsRr/i
	ruPPVEEcDRoSYRiNnfvflc9rgyzhHpSo/xYI54pwK44a1pIcxwJt91fj2BiFcMPCgGXSEFE8Q38vL
	lAGiBwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPip-0000000FDCq-1Cx8;
	Tue, 03 Mar 2026 13:23:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPim-0000000FD9C-0W0q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:33 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-389f173b91fso97353811fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544210; x=1773149010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SAiIzSfTMRShdXJxCInhMGpqoMCKhmfdktkL1GCb0E=;
        b=bLyeDcS4SAw7KYdV31VzrQKEqYi0+UlkZbzJxJdy4OSzUmpY7Pr0SBE1DF6ewiwvXX
         HoJUyQKInI++y+AXqt+DzfAUG7MRJNr4HpKU2jxZz3JNbKOkEy6PhjwwTcjoVEVO9zfy
         gb6UdX6kt7aH5uknpyL/yRnU/BKFNsBo3Hu0/SB/QJhjOBVkUY4o1RczSn1kaMeSdM59
         N1UFMDIMhgDFcHOO2qpTRklFCQZ0b0+svUNE71LRBOb9M9qbSfpElYZETEmwkLZeRRGH
         Lz+HTZnAs83pH6B+l3O8UHSiLtez9ouqTpj3AqQzoGmsAfSLZgLCZ3+d8u1bPM567gfx
         FDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544210; x=1773149010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4SAiIzSfTMRShdXJxCInhMGpqoMCKhmfdktkL1GCb0E=;
        b=oGZWEc/Nw9z5BhPcTThhD5fCE0uUve7KVaGhhOJ6+KyvyVXyqu70+FgBdYjywN4qDM
         J/juVdH7TDwGKac4P9OC/jxgp19UY4KQUQjW6G4XwrpwN3M5ii8GfSnMs2AxKniRgJBx
         q9IMkFj0VzVvZnt6CKIX6+a5xuDX7odP3HeAUyo5ZBukXDqmGMxzDAgVy0a0TbN2nJqo
         EwfH1tGljF+LEC6fjYsZVKyTzP8KOpDvSgz9M/ZnSlFQSx6NHUtwp8iJ03kWJHtNd7RS
         E4X1XQNfLogj4g07PYII9jTT9SE3Rg7fhMjbZsaBabzntiEy+tdwuXec7Mf+2mtv2Pcn
         a6/w==
X-Forwarded-Encrypted: i=1; AJvYcCWgimpQ4HJpFAnYG5T/wWnQNjmJaAIjecEvqptZnh0iDivrvhuuEHbICUIa9nISA5iM3QFibde+r52MEjunohu+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmsdxgh+lzIKQSwGnHAUH4a+qgMXAjuihTOYlThvwzTycP+bd/
	UCUTkQML0Q1OLg76fZKHyihOiMW7JnIKVgKqTT5W3kNcMmKcwKJS3czBFRuD+txB9tE=
X-Gm-Gg: ATEYQzx/HUuqeZ3Wmroy6IOnljUoGGBuzMPdkzJibbX9Xa81LGWlgo++9b9y0nzStmJ
	J7DTdIkK8tLEVBiFv5J7evIGOWtLQzDGh/6DBFKyGnWVz58mKHAH+qMohW/tN8yUZqEmAf+n27p
	Y3QndVfUrHQ12fnPwPjcN+oneODO7H6qN3A87y/+iqxTxAClI8SHPzJ7Pq4iPBWh3LIxxlNqPma
	wTrqcyMmUugxd70dgOova8FwvmzYiG1/HiUFY6YE3lchl3M/bubQtZ9shX0ItWOdrNNcnvymxdY
	CVt1NLieoII4ql44R4YOxvFDxiMF+5oqGVXyBQ0H2WTM5RWLLqkH44WI/EAD2aY3mEDFfRfKrfo
	DzgCm1nSl7sh0DHMSqUaAZdIlQ0jFgOlaBR8sBYOoXjKTghHujb57ObrOgE6lqziLjUL3bwa54L
	Ej7TkVld5N4AjN+Ipb72eV/ZgiNt/aCdgH0hUDfifKeTwCYdZ5OwIiYjhQDZdtH4JvOePKNOIW
X-Received: by 2002:a05:651c:1c7:b0:387:17e6:1dd9 with SMTP id 38308e7fff4ca-389ff34cc65mr108309141fa.23.1772544209839;
        Tue, 03 Mar 2026 05:23:29 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:29 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] pmdomain: core: Add initial fine grained sync_state support
Date: Tue,  3 Mar 2026 14:22:50 +0100
Message-ID: <20260303132305.438657-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052332_202926_2687D309 
X-CRM114-Status: GOOD (  24.72  )
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

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 128 ++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |   1 +
 2 files changed, 129 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ad57846f02a3..53401db2a386 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2699,6 +2699,123 @@ static struct generic_pm_domain *genpd_get_from_provider(
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
+		pr_info("%s:%s con=%s\n", __func__, dev_name(dev),
+			dev_name(consumer));
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
@@ -3531,6 +3648,16 @@ static int genpd_provider_probe(struct device *dev)
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
@@ -3559,6 +3686,7 @@ static struct device_driver genpd_provider_drv = {
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


