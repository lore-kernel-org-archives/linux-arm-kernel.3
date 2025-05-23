Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BCBC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KC7YC2/v/hospjziwcUkovuFHlTjTAcy5Zz+vdo8lIo=; b=pwHidvdNhq7Yzfg+XKaeq5nLPX
	WDxV9hePMLPi1CKpSN1vK3Y/mcyAa/ofz3EW3xMiZxjNLuxrUlSiUEAIjiYTebb1v5KZDepG01awN
	sW/W6Q7/Odf4DWPiZY3sL+lj06MMFYmJe5KzqTtMAxDe+vawBXPU592YInvtAWFB1rQX2k6pjUpBo
	irHHxB8dH9BSk1XOW8MEvdK1hrSNWhnco4jaC2hbQ1c2jiuvPfExnr5xe1cyGMDpWTXjuWLTMvFkH
	RLw4qL7A5/x7SoKSBGItUWzcqXQw3bJvJf73+3GFqRCSb1+tFpfhVsZl6fcoJ3+mPwxjKAt/U+94S
	0FBJKSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbP-000000045vF-1W9P;
	Fri, 23 May 2025 14:42:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe5-00000003zOm-1aQK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 13:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KC7YC2/v/hospjziwcUkovuFHlTjTAcy5Zz+vdo8lIo=; b=CrGi9U4mC8cuHJUvHN4jQwbWPn
	T3+5USL/Rsi6HWvSZK+IuGvONcxPSmq5QACT1SJ1oYF+QkJ0QJfGtiTxnlI/l3PUR/ePSreFFoQ2Y
	OxiNbGjjT0KPUT88asZOAyw0LEupFsoJvEJFSX8w7OImMfrivt1/hje1fNB4Xswu9cb7xdl2Y3Qjl
	0lznLb9h4Ys+lcAlFVeosnn8HWazIxZCLAtPjuulYyf+nN176aK/8tZaiSK6eqwg9SjgGQsMSQvMb
	yqUhTe/lumy/BExXVC+cOJ/2o5I/No4F4KjBBk9qrHa8cxEZj7KOfEg7VMDAncXFzYQ0h12aV+cUX
	wFmGDYZA==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uISe2-00000001KmB-2VPd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:08 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so5353424e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007664; x=1748612464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC7YC2/v/hospjziwcUkovuFHlTjTAcy5Zz+vdo8lIo=;
        b=ByKWG4eHd1nC225WzUqprR6vExRgoIoo8jvbcieLgPtDfqtFpwEwfiXIewSYPsmb3l
         eGy62n2EARJNvrT7OhMUmDlW9tl2Z3cu9GLltjbJ0l+Kf/Esp1GpOcbY2W2oGTS1QqKM
         Z+XcQqsEAI/SbZpBlPe/xsC5FNaubLB+Qx8Ouw1P5N0vU9etkuUhDzdLYC6SqzpN1BFx
         R0kiSYhzLpBQjvXeUgpuWwsBm1YL6ezfCAkjqYH81Xe373hPr0sR4u4bXdWIGxzdVYZb
         jUiV+ThXNi7CRXaDzPEz6RoEm5V6OHEY5sHiB/+JNp2KixJNkElacZV6gALOKBNYreFX
         8JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007664; x=1748612464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC7YC2/v/hospjziwcUkovuFHlTjTAcy5Zz+vdo8lIo=;
        b=QcceFIoQKhwYLq8TxGx1+QB9bEL4kVDpeVWywtWP2rTy273hWwPBuDiq1XiYwrYRK9
         Zyz2Ykbd2nEykTzuM7HNAfW1hnAe73yO7nQrIb69+yd2GUWsNPEQWckhye26OUqwvtd3
         nKdbnkW9rUuPzJv0GlFkS4aplp8GT9ReIKUp0y6jAL50S8JlJg5I94lzGU/U1MqawjuL
         MczOLa5f+ykAN7vIKJYy6VdGXp28uq1LVtc/FM0lTIDjZx+9gBaUj6iMPof6nafS2kZd
         8zLA9V3dRLyzG6EXV0eLqCLxgNsTqG44/P8V0OYQd45iGXR4bbonEgAP0zud/mzTEIUn
         43Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXNOpmbRw2A1epSoDczEyTV+M16SCeP9WjmSm7z1+243UrZKT66uoCM68BdT2hcyuXxFWrcJEO9GWYWL5hcPCo8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9C3dkP84hfAvaBnsA/2XempIzHleQYEsEsUBP9OVN2EnNkD2T
	e/Zu1OWVF33BV+FxaK1KBJhXzTWfUQuqIXzPODQik8bNkhIab4OpvJKFhffDm2j1PpE=
X-Gm-Gg: ASbGnctzC3nElaEm5liVygiPla8+n92lLJF/O2aQncNiaa8NkF1Y7PRNdFSL+scO3fd
	o11mFDYRJsI72XJRm52uJcCpOCMTMJwwZwN7lZnRn3ESZjkazcBrOpTSb09bZhUiNHJspNr9QUu
	N7DpDu1c1/gWbZ2jk8/b4WaXxQFfkH6mUNBT9CqdUhV97v12x5hy9zkTM42mwZsdOIHpvU0pEZi
	vM6oW/VSdCiNXEjp9UzcZ3W4P96UurW7i4KhBZGqTGFqlYCs5X4v1levI1TYSoUhaB6vo0G0yov
	npUE/U3Lkc7+0tbirZlBlBKorZSul+iJfAgJSJu8RHuWlysPK7Lne8LByhGvfLnbYCjDef5JpZ0
	gUgxmQhB6c2alndJgpEMweF4+Rg==
X-Google-Smtp-Source: AGHT+IEZ0JF0eQFf2usDsMtCl0D2zCseCjmw2y7+b0hDzAnm98HasW9P5zPUEvp49AX37vCRxzZGZQ==
X-Received: by 2002:a05:6512:630e:b0:54f:c1ae:f1b6 with SMTP id 2adb3069b0e04-550e99648bemr7875417e87.56.1748007664022;
        Fri, 23 May 2025 06:41:04 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:03 -0700 (PDT)
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
Subject: [PATCH v2 15/21] pmdomain: core: Add common ->sync_state() support for genpd providers
Date: Fri, 23 May 2025 15:40:12 +0200
Message-ID: <20250523134025.75130-16-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_144106_746683_0364E023 
X-CRM114-Status: GOOD (  22.21  )
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
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 52 +++++++++++++++++++++++++++++++++++++--
 include/linux/pm_domain.h |  7 ++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 4047af5a275d..c094ccbba151 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_rpm_always_on(genpd)	(genpd->flags & GENPD_FLAG_RPM_ALWAYS_ON)
 #define genpd_is_opp_table_fw(genpd)	(genpd->flags & GENPD_FLAG_OPP_TABLE_FW)
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
+#define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2374,6 +2375,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
@@ -2627,6 +2629,8 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret;
 
 	if (!np || !genpd)
@@ -2637,6 +2641,15 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
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
@@ -2661,7 +2674,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (ret)
 		goto err_opp;
 
-	genpd->provider = &np->fwnode;
+	genpd->provider = fwnode;
 	genpd->has_provider = true;
 
 	return 0;
@@ -2686,8 +2699,11 @@ int of_genpd_add_provider_onecell(struct device_node *np,
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
@@ -2695,6 +2711,13 @@ int of_genpd_add_provider_onecell(struct device_node *np,
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
 
@@ -2705,6 +2728,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
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
@@ -2727,7 +2756,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			WARN_ON(IS_ERR(genpd->opp_table));
 		}
 
-		genpd->provider = &np->fwnode;
+		genpd->provider = fwnode;
 		genpd->has_provider = true;
 	}
 
@@ -3446,6 +3475,25 @@ static void genpd_provider_remove(struct device *dev)
 
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
 
 static struct genpd_provider_drv genpd_provider_drv = {
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


