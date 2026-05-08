Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC6FCD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rXkI/5pJxJgQUkPnjmS1Ch3OvikdB3cgLvtk24pgs8=; b=d+CIHL/nSIepGCQyuYU6tTb9jd
	wv9Pwf9puhslc2hYxQncT7kQOHIckS1qVLseP2BMocK9SENAfRNLZKB5LvCiNgTKxUVDj/D0Ldj4g
	9HrlBuCKEhJAFnOI4n1un9tw1ppy/PjDZIjGKhWnu2LgvkjFPqcwhxQ5yhfKq9TfZ51NoHuOwTMJF
	wb9mrD/1Kk6ElNMDYZuVvA2Q0AP4MtfvQLpZxS8HjSLjnkm6CcJXf3b9LCbOFuzL9A3UQdZRcbNgw
	holvBiBUgQXzohwX6iIJj9czOmOAqLFstNlC4SJQL82jzvmDEtGzGvvk6L0ABrFDKSJUjR+SGD5WL
	dlbwjG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUN-00000006T5J-4C4m;
	Fri, 08 May 2026 12:39:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUJ-00000006Sz4-152N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a877510541so1955470e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243965; x=1778848765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rXkI/5pJxJgQUkPnjmS1Ch3OvikdB3cgLvtk24pgs8=;
        b=bSP3opNnXiL7K9RryNdL82kWzTketffd//C+mPJ4LsxAgLVcuKGEAV9WTwjzlZbQip
         0Mek8Pqhl3VHbm4lVyN370EqskCfYd3F6UcZWQKwDbaVS7GKDdUCH6oBVohCTsyjP8Qf
         pqBw1PNVHXz2Qw0eR+b7GmrsConjQKiG+ON2BSq6dT8NphaTWOsXwrn8uyi9sDErJ+ix
         5Ez/2nkAbawg5cJYXxxhdNSlilCVcLgfH/9ttYvCNIfBkreVP2r9gNb3nbUD5xDFxDEN
         TvSVVOiRhkcPs9RdcLNDowoexlA+QDq2NGlE/xt/U+SyXhpymlSXUIMhNQKH+blSZycM
         fi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243965; x=1778848765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rXkI/5pJxJgQUkPnjmS1Ch3OvikdB3cgLvtk24pgs8=;
        b=c2HtkXGzy55gSUNnVxgRHAN1VPbivhOQhIEkg31kGvXFMfToZggDVq+Vm90XGlM+gy
         7TbkfQ7a+SFpqIVkOrsJpcY34ZSdjSXZ8IDYfZ0jGiye0h8H6Eb0ghjhxzwXfD98+fW/
         HEeI9IaMLoAKtHh363xIUQdByJZwbCXIuioTQMOa5yMHnP+1513bY3nFvjODMKfWeKeB
         U6ed5yGRaxI7wSzZvuPS0d4oxdIL3TOgiz11HHR724C02p9yLTd68t1qia6ogg8RXUq5
         fh+Q1c/dLodLgu9G5K9QmUL/MdNen8hCO+0xwZsst3nar1iBlxNfuT8A888F5wDk9DCK
         JVnw==
X-Forwarded-Encrypted: i=1; AFNElJ9yZs3KYNtwL/xza6IA3vl+Ca5JAhB3xpOIS8sU2SQMmEf3W/xEWTGAbh/rWjbrIbrgaQD8HfaKF2PsaR3NRiIX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywivxbo2ETFyrxKy26b65o+jH7sctHlF6kqjJ711TMRwOScf8WP
	tUmCaXJC7qB0vW3ViE9K3cmy6gQF+ASP5ZF4kpGWx1sjMUzog77pnAo5jheKoyEEhLw=
X-Gm-Gg: Acq92OFyy/sZft1DS6UlpsJvytY0gmMcvp9X5Ie3mdrSvT4bEZdaa7Pstw+XIuaG4e0
	Gso4l+44lKfWAEhOKVBPuxzKD9nS7m0fqKO6N3s806h1Gbzhs/X8IW6t7ALkRIPcHE4v6A4212b
	UBy/yqvPbvRaqzVZP2glSSUcGjzw+J7tjlDd63xuI4jHScxiSeChE6BT1JG6fTp4zK6lhBz+QJL
	4ZMCGW4wABcP88hOMlKlxU+L/9x/HFASS+2VWwkOFPQWwElShGfCVtuEAN08RKOP4AJyhh5E3Nl
	7slY+55BPMcXWXI2K9Yf/pH0xR36O2o0feESeYqTiznZVX1aPB2mTM5KFo/J0pNMNWmO1PMLTWc
	k41pD7YcdrLpUTq/yO+PUJpdJ4ulI+9mJdM5RXFyqsu1hzPBWp2LewNuBwTvjB4QdkNAC7qIaJE
	QXkgeF69dXRq8sE10Tmb1uUbbJqf3lnGpVSDWHrDJD9FNj+DVRWjzo5md/AwSbj9COzr5Q0H0j
X-Received: by 2002:a05:6512:3f1a:b0:5a3:cc81:eff3 with SMTP id 2adb3069b0e04-5a887cdff2emr4839959e87.26.1778243964852;
        Fri, 08 May 2026 05:39:24 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:24 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/13] pmdomain: core: Add initial fine grained sync_state support
Date: Fri,  8 May 2026 14:38:55 +0200
Message-ID: <20260508123910.114273-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053927_363877_93C07DC0 
X-CRM114-Status: GOOD (  24.58  )
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

Changes in v3:
	- Addressed some cosmetic comments from Geert.

---
 drivers/pmdomain/core.c   | 124 ++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |   1 +
 2 files changed, 125 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ad57846f02a3..c01a9a96e5c2 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2699,6 +2699,119 @@ static struct generic_pm_domain *genpd_get_from_provider(
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
+
+	for (unsigned int i = 0; ; i++) {
+		struct of_phandle_args pd_args;
+
+		if (of_parse_phandle_with_args(con, "power-domains",
+					       "#power-domain-cells",
+					       i, &pd_args))
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
@@ -3531,6 +3644,16 @@ static int genpd_provider_probe(struct device *dev)
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
@@ -3559,6 +3682,7 @@ static struct device_driver genpd_provider_drv = {
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


