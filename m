Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBABC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSlhhsNZnMSdNZ9/zrr7APJGkIMzya3OzGGURYO/UKQ=; b=VulSt43P6WW826tj6vr/M/w6R8
	j93I/GHh4Gig0vAncqybOuZ09bCbjq8zlduNWpWwPmGxCsG63WOQbJp+abDkthqKpA2Kdgrq+WaJ8
	vrOCVMVRyhILXtkfVANbeSCm3W5HbGDhZRyV0ltxmJqlDZuiRCbfvY2N9+cHEuqyWJRTH01On2u6N
	v5s2b2HNZNPPFrd5JxZR+sVP8DDQ7hcNcnZtQ+szNg2U/sQkxtzhfL2P9eRMUGfaXSq0uk5ehINXh
	0YJAALE7/dUAgxzd0j1/a1kvF6XLo5KMHVos6Wju9Wwha5PhS3cSkULg3e64q/M+1Gs+DPY/BDpyU
	mBfTAYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaD4-00000005LCm-0wxP;
	Tue, 01 Jul 2025 12:35:38 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT8-00000004upo-3002
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:11 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553d52cb80dso5849948e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370489; x=1751975289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSlhhsNZnMSdNZ9/zrr7APJGkIMzya3OzGGURYO/UKQ=;
        b=qXigQ79Csa58ipGOnGtVQxmeZ7vXEAcbTjIioRMzTKnBqygEY8CUEeiArVWqfbhtno
         mQMBmBrkutqMTU9A7HkLtklxSHJBniGhetT+PKgZnpFZxqk9PGkKgXSi6rt/y/Fu4srh
         nQDdp67q219mHVAjqoA4ZzicnC9kSuEq1KQvHrOSM3abSkBEf6X6sY7zd1P0+v63RLOI
         HGURhe4T1rby3UZWn5HYirO/HfT+HRgLbZAibVpVC4RYwbqZ/9n2nI/549ZJlVNY2frR
         ocZd9lpfHHwiYLZ0YKLg4jexfxj2BfsyIql3MiRfhx25Vz/mL7+YFq4H4SAnVH6mUm3q
         cCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370489; x=1751975289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSlhhsNZnMSdNZ9/zrr7APJGkIMzya3OzGGURYO/UKQ=;
        b=qkm1EYdb5nZOy130/yx4AY6+BcsRZvyxn6n2PiCq91Vp3ToPTuHCmm/4FMM3bkEIZt
         YVlWR6q397iALKnw4tCpYaqxSbME8hm6DO0kDS04zofq3+ivMi0uR5MVVNzj/sYau9W9
         xTVI7KbuhG8wzBOU1f6uPuvqn7j5An3kYjqhSW2bSb6xmth8Im2yRsRSHRqIObbUEo1p
         uhYKRSv1091hKzQ+k8oFFFdZ5jxJYr1ScWU/M+m3EumgtRae1QroLJSNPKATV1yakPjO
         bChIuW/ixH0xlGcbF/yy8WC2JxBnFFgEA4wewEvTaHufMPovAwm02oxS+diJ+DqECfyp
         jCag==
X-Forwarded-Encrypted: i=1; AJvYcCWmE+Ch9xe8c/2IJ5A0w0hZY25x+pOuAgefDsR7G1r154KOLWGTRvqAZ/u69et1eYBssDvoECBQ6Cg2tA0Mnz/3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd+Nfck3+r0Dt6eWbbBzAc0lk1agJdzp/RilzqG7DxIOcXD/yi
	BwMSNdbwgW/QMNGiorN/hZp1IUOiELq2ql3i1KbE1np4Ii8qKCO6S91FSp2E6KIDg+8=
X-Gm-Gg: ASbGnct53WHzq3Kj2NrEGwgNIQgej1omH5YOxkr0mvm7psNpL4JLTdXqJWMPnriVyBm
	Z2pNdjXEMvEZMG8uik0SYznhLsfh9jwP+FV92sdQbeGJyoeaQIUEMNfRTabEcGPT0QcMcb0J8yl
	NalH3rzu6dlAGlFWW77n5PK1oeZcs1vDxms/ESGepeqe+eNVWK9y3vglGKZwKJ7QxgSxw0G7Ols
	dDA009mEVdDujy3RdWZ6qi6u0Hu9Cq1afXXP0lKmBGL2diSG2qRKfZqPZ2ZPsM835Lzxg78PIft
	weRBbkbFgmci7nC2GRZcy3rKh7Uw/8G17jpv/L2ezkCRvb4OlyGr850N2+KIBB1D+eZEUyvBBvS
	S7rHI/txc+nQEVPnlo4C20ScWo0GrQmxju89P
X-Google-Smtp-Source: AGHT+IGj4keXnnMXOTK8BsmFb9l85E6FUYCQFw927ADYbaXkZQ7jNAqNFb7K6hJHHY0y+lNMS4BVmA==
X-Received: by 2002:a05:6512:e96:b0:555:130:1fa8 with SMTP id 2adb3069b0e04-5561f8d30dbmr1028685e87.22.1751370488982;
        Tue, 01 Jul 2025 04:48:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:08 -0700 (PDT)
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
Subject: [PATCH v3 18/24] pmdomain: core: Add common ->sync_state() support for genpd providers
Date: Tue,  1 Jul 2025 13:47:20 +0200
Message-ID: <20250701114733.636510-19-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044810_760876_3FBDDB52 
X-CRM114-Status: GOOD (  22.89  )
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

If the genpd provider's fwnode doesn't have an associated struct device
with it, we can make use of the generic genpd->dev and it corresponding
driver internally in genpd to manage ->sync_state().

More precisely, while adding a genpd OF provider let's check if the fwnode
has a device and if not, make the preparation to handle ->sync_state()
internally through the genpd_provider_driver and the genpd_provider_bus.

Note that, genpd providers may opt out from this behaviour by setting the
GENPD_FLAG_NO_SYNC_STATE config options for the genpds in question.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 52 +++++++++++++++++++++++++++++++++++++--
 include/linux/pm_domain.h |  7 ++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 0a6593a1b1c8..ca47f91b9e91 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -186,6 +186,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_rpm_always_on(genpd)	(genpd->flags & GENPD_FLAG_RPM_ALWAYS_ON)
 #define genpd_is_opp_table_fw(genpd)	(genpd->flags & GENPD_FLAG_OPP_TABLE_FW)
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
+#define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2351,6 +2352,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
@@ -2606,6 +2608,8 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret;
 
 	if (!np || !genpd)
@@ -2619,6 +2623,15 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	genpd->dev.of_node = np;
 
+	fwnode = of_fwnode_handle(np);
+	dev = get_dev_from_fwnode(fwnode);
+	if (!dev && !genpd_is_no_sync_state(genpd)) {
+		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
+		device_set_node(&genpd->dev, fwnode);
+	}
+
+	put_device(dev);
+
 	ret = device_add(&genpd->dev);
 	if (ret)
 		return ret;
@@ -2643,7 +2656,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (ret)
 		goto err_opp;
 
-	genpd->provider = &np->fwnode;
+	genpd->provider = fwnode;
 	genpd->has_provider = true;
 
 	return 0;
@@ -2668,8 +2681,11 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 				  struct genpd_onecell_data *data)
 {
 	struct generic_pm_domain *genpd;
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	unsigned int i;
 	int ret = -EINVAL;
+	bool sync_state = false;
 
 	if (!np || !data)
 		return -EINVAL;
@@ -2680,6 +2696,13 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (!data->xlate)
 		data->xlate = genpd_xlate_onecell;
 
+	fwnode = of_fwnode_handle(np);
+	dev = get_dev_from_fwnode(fwnode);
+	if (!dev)
+		sync_state = true;
+
+	put_device(dev);
+
 	for (i = 0; i < data->num_domains; i++) {
 		genpd = data->domains[i];
 
@@ -2690,6 +2713,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 		genpd->dev.of_node = np;
 
+		if (sync_state && !genpd_is_no_sync_state(genpd)) {
+			genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
+			device_set_node(&genpd->dev, fwnode);
+			sync_state = false;
+		}
+
 		ret = device_add(&genpd->dev);
 		if (ret)
 			goto error;
@@ -2712,7 +2741,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			WARN_ON(IS_ERR(genpd->opp_table));
 		}
 
-		genpd->provider = &np->fwnode;
+		genpd->provider = fwnode;
 		genpd->has_provider = true;
 	}
 
@@ -3430,6 +3459,25 @@ static int genpd_provider_probe(struct device *dev)
 
 static void genpd_provider_sync_state(struct device *dev)
 {
+	struct generic_pm_domain *genpd = container_of(dev, struct generic_pm_domain, dev);
+
+	switch (genpd->sync_state) {
+	case GENPD_SYNC_STATE_OFF:
+		break;
+
+	case GENPD_SYNC_STATE_ONECELL:
+		of_genpd_sync_state(dev->of_node);
+		break;
+
+	case GENPD_SYNC_STATE_SIMPLE:
+		genpd_lock(genpd);
+		genpd_power_off(genpd, false, 0);
+		genpd_unlock(genpd);
+		break;
+
+	default:
+		break;
+	}
 }
 
 static struct device_driver genpd_provider_drv = {
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 9329554b9c4a..d68e07dadc99 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -133,6 +133,12 @@ enum genpd_notication {
 	GENPD_NOTIFY_ON,
 };
 
+enum genpd_sync_state {
+	GENPD_SYNC_STATE_OFF = 0,
+	GENPD_SYNC_STATE_SIMPLE,
+	GENPD_SYNC_STATE_ONECELL,
+};
+
 struct dev_power_governor {
 	bool (*power_down_ok)(struct dev_pm_domain *domain);
 	bool (*suspend_ok)(struct device *dev);
@@ -193,6 +199,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
 	struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
-- 
2.43.0


