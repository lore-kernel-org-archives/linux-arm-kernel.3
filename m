Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2476C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4svnLFbJnv3zIx0N7VYQw66/h1rJWDrzgMSBi0aPAY=; b=ZKvaivMsYachEI4idYy4sVkDah
	UYgXSgJRvclnubfndwlnffNEugDMUpC2PjqX6jYUFOywz5DN0hpPKSmPvvY54WynFr5v/dvsh960I
	zGptkELt8thIAxwcWPfKcvkdKDcyl6rZmLNfgBuAaxS/1VLcFNF0INRzOmlsLEdd4u5nlau823Yhd
	WKaLTw05QVs+wkYrEaNfEHtXedLXR78zJWWNATYfyuqevKmvArCc8Mh1jfpw7owQBs4UQb2C/b2ew
	nCqS0h/SYeIgdJ1Kh0RNQi+oFl6AbX3FHttIqO2qwpg1Lp9qbzFavcRXTiTtgLiv3oFiouD2PPvuj
	nOnevBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Qa0-0000000DO6W-20Z4;
	Thu, 17 Apr 2025 14:51:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBb-0000000DIop-2wEz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:52 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549b159c84cso1056539e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899950; x=1745504750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4svnLFbJnv3zIx0N7VYQw66/h1rJWDrzgMSBi0aPAY=;
        b=SvgsC2GaxJd6sGH5090fMO3xgS9EC7WKjo/XjEIaRi9Y2OR3T14jfNrfxt8OPH9x5T
         t59U49aAJ1MrPkyZzb9X+19hHeTqczpJXFJ4MA9VCiBjZGBJ0Pr/yrbzRqJskyv7AKJ7
         QIVPAzt2rFF406RrI/TsRYYjqab0AicnL/u/5Bfw8uqqukYvP+mYTPE+G3q8GCYmEpyf
         SBHjR1xta6FOBINCn09qrx2RInbJqEasAbVuN85y+SR8O2VbHoOjsFx1TdpixBNPCqjv
         YO3RLZAHlbGk3kDnFiMHJb8uGNrTQ7EO43xPCztZUrPjwNl6xWxtGovaZjkYpHyMWg52
         uX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899950; x=1745504750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4svnLFbJnv3zIx0N7VYQw66/h1rJWDrzgMSBi0aPAY=;
        b=XDCj9CT9q3DeWkdy6ICt4wpbntw/Cz1/cuJNvxyCvjeX2dYnBJnePqvrtvCkJsGA40
         Y/py7Hf/4FrY+85KnsoSgL/IXvxPwy/R++ZB4RxNXFwVZoeiJv5VsHqea4X/5WY+Z2Iz
         EAVa53PHcq89a5a41GGrPDo1ifMSzduLJJSg2XzEnokQSlSoaAoEeoxsP5a/IpMSXDCc
         fxXLAX1kbR0lG/Rhr9EIuGCJ3ImeypkQ8O1cHjZBfasHwx8p5VQUj54CIlBk0sXP4rPe
         I2yZtnmbEqSpD6hV5NWKqCRvCFHFl8CzBXjCHX1JqacEBwJa5BVwKD3LFRP8zVUK1nh0
         EwrA==
X-Forwarded-Encrypted: i=1; AJvYcCXgvUZ2WQ6FMIIoXS2xoYr5CsgoWxQuoBMemqxF32pnz7odGfZ6sYc8HEzCeN5Tko0+cIwdGAZ178f8WVeqS8kt@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzqiczgJFs6AKFIWd5FM7ZZZFSdvDYqVkYMaZ5tqzTjNMVICB
	1gEl6c+QE1PpycfaVhu9z6JtXxszubV1pvDBFuzRrTPiZBpEUxs17ZtilRQpCPI=
X-Gm-Gg: ASbGncsQPNVJW6DmXg+64NpkmpXVn2YH7bxHWCABERQTH9wmjvL4ut2Ov+mSRJU0Gyk
	tObCHTYUQZbX32PY3n26iEVMzM5av0rXNQ9xibGui8xD3PiKWleXnmv1jg8aaw0mn3btHJ5Tyj+
	nILtfrHbXbbRDfzrEXxq2qkQ0/caz2QJnMYF6E113WTlbg3opIFCXpUwJmFviVCUV7IZfqF8zZm
	GlAy67jSHRvDIiHaxabN7FybGsq95JThgOHkkvQVLQzJbQ0Pvk+rpDV3cYM2V7fnKvgZg1+KHXw
	yigmsKDcrmLcaeZhU/zwEfdk7DYK/Juuk+RpYMPz9she2zUGW+zJLaktXYBBgW1vpOm+z80yxH7
	NEl4IFXDeeoZtkPs=
X-Google-Smtp-Source: AGHT+IFLZC+7o/XwKN7xuIyMZVwhsS5rHckZLNTwrcJeTbAwEvd5hmVT1e+JUJqkIv5jp8W5a7Ps7g==
X-Received: by 2002:a05:6512:2310:b0:54b:117c:1355 with SMTP id 2adb3069b0e04-54d64af41c9mr2069093e87.55.1744899949638;
        Thu, 17 Apr 2025 07:25:49 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:49 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] pmdomain: core: Leave powered-on genpds on until ->sync_state()
Date: Thu, 17 Apr 2025 16:25:09 +0200
Message-ID: <20250417142513.312939-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072551_739182_11E57B48 
X-CRM114-Status: GOOD (  16.41  )
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

Powering-off a genpd that was on during boot, before all of its consumer
devices have been probed, is certainly prone to problems.

Let's fix these problems by preventing these genpds from being powered-off
until ->sync_state(). Note that, this only works for OF based platform as
->sync_state() are relying on fw_devlink.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 12 +++++++++++-
 include/linux/pm_domain.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 695d7d9e5582..a8c56f7a7ba0 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -212,6 +212,12 @@ static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 	return ret;
 }
 
+#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
+static bool genpd_may_stay_on(bool on) { return on; }
+#else
+static bool genpd_may_stay_on(bool on) { return false; }
+#endif
+
 static int genpd_runtime_suspend(struct device *dev);
 
 /*
@@ -933,11 +939,12 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain is already in the "power off" state.
 	 * System suspend is in progress.
 	 * The domain is configured as always on.
+	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
 	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
-	    atomic_read(&genpd->sd_count) > 0)
+	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
 
 	/*
@@ -2374,6 +2381,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->stay_on = genpd_may_stay_on(!is_off);
 	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
@@ -2640,6 +2648,7 @@ void of_genpd_sync_state(struct device *dev)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == &np->fwnode) {
 			genpd_lock(genpd);
+			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 			genpd_unlock(genpd);
 		}
@@ -3486,6 +3495,7 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
+		genpd->stay_on = false;
 		genpd_power_off(genpd, false, 0);
 		genpd_unlock(genpd);
 		break;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 2185ee9e4f7c..c5358cccacad 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -193,6 +193,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	bool stay_on;			/* Stay powered-on during boot. */
 	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
-- 
2.43.0


