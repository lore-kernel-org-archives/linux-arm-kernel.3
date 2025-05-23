Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA516C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTfJ/GeY/lTwR1D9VlQQIY/dt3W579Yxd9kJ3BXM+Hk=; b=VBevIBBMHAdsNhE3aE1EU1l6p3
	NvsGvWoTmYFw3j77v8i2mB4ANOJqtDsBC+r6HJDokTHhSowZVusJ/gFozXQgycPSfEsI235Uw1cae
	MK7fDnKyA36uVyr4mkI7OZ64OS8jqP1SXxrQ8vbJqkaxKW+H/2gw/24/9FSHrdxsfEUEE5ruvwmHe
	+r8D63Fx7EcNZV9WY/7igbcu4POb4e8F9nl2QdeNDUC83C45mlt5eSOZgfzyacdPEIMwQKLWXMHyI
	D40bHDCnkBxThhYRlD2PNDPL/OK1bmd4LIWaSJKO6Amsji0ScBDT64Dm/lPr+HpWUEJIjfqbRcwtk
	MvEWSxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbQ-000000045xv-37rX;
	Fri, 23 May 2025 14:42:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe6-00000003zOs-2nwX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-551fb4d153dso5527958e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007669; x=1748612469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTfJ/GeY/lTwR1D9VlQQIY/dt3W579Yxd9kJ3BXM+Hk=;
        b=FdOzSgENFidIXbXNDaz5WcvxIfmPqCdeW2M+5IynH2AdAiuTg1/RtJUcHKsSfrvYY7
         JloNt4SAx3OMa4WokagS+t6EbCzdfClDfYF/60motCX2UlKEb9ghcOTwwnfBOnB7C9f4
         h8OKmsm5uRmBAGQgN/k7FqYPWR1aPfoFxxen0EdItKhnl5RCeIhejxWYYmKqoF2uhNUy
         3i8sBmJqfSJXHDFL1FpzeVBB3ulKi4MV+uUo19Ibb3TlmhTbnEmOfJ65xzJHZ8N+xgy4
         cepXNn3l4kxGzMRKlJwixQldOTC/sifO6Frs4SgPZOBy3/vfClUYiB/cgT7zx2CO0gze
         k/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007669; x=1748612469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTfJ/GeY/lTwR1D9VlQQIY/dt3W579Yxd9kJ3BXM+Hk=;
        b=PGqpi0KCRzqFvkHHJzmffZlBydixwLprQh99gca2zNRYfY0gcCpnXy3IMPKZ/DYzUP
         t3MsSbwpNEY2DT9mxwSlULze7Ehteus2jJ7If7id5CgERmp8SEBHzWZZgXYdenet/K0Y
         tcVODIB1xhKeAyEIBN2D+NU5XPrqsQuRZXUwjZR7GfL3u31M/hMehtNK7rNFqiW2WHR4
         /ETxWrf/+NikemFMq4uRocfODjCT8e7HTG8cZ1tZ1/6JCQV5orWJnV3LtQ3wrZi5WS0L
         15kGeI2SoDRQY3sOGxE5lPI5nLOH+kOgpSvoWZxB//xtkei2a/XFUjr7c0mvTkuI960I
         hiSg==
X-Forwarded-Encrypted: i=1; AJvYcCULYQ96xUVSJzCW+sat03M9RbUYS1L+CpvWE7Q9KUIHslFW8NyD0/SLedjbv4sX9UXW5+ANSHEN0hXb1UOKlTJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YyZYMCfbpF6ZLGxki/UhuBbCCiI4aKvHlR0xHMwqzR2prbNhgx2
	pkwPgTCJPEIL8PC2LqfHAVJJ7tMED3RdXeGTBFsvAKCy1FqUr0NWzggpHtgGwKrCof8=
X-Gm-Gg: ASbGncuEMzKzj+nE2OhAJdQWqKSZFsjZHHOaIktMHrMSOAs7qH/aN67N3QCnIbhe98H
	byTJEdRSHYc8aAWTpwiltmdNLWQrhUZX+vwM5l/xAH9fVZUEMoQLX7fUbqqswO2ZRLFBsHwX7X7
	Bzib3JZ3FVYqX64zQVW8Bfw5bKnxPefaspYGtdHTNbt4aJAVNRETJWwYB2FWuVzlc9N0R81DGJh
	uJfLZdxaB75ndYStaUlskR/9ycMNEnti6HU6BfwhLVcHX3I8jOR2W/uiVk8FlQ6fPhzNu56Hbzb
	DxWZucjAbAoCWH4OaGC423TNEwdq2gRoQfc4sqqeLu9X70Aq7qNNLJ9Ttqi445DO476nphApG82
	DkzigP4f/CforxGz3y1W2531O2YnNjXKKYQ41
X-Google-Smtp-Source: AGHT+IFDLfxM01YaBSflhZJhg763sDEi77sCbELPLz/NKFACM48uG4bkUP+LayfK8+cXACHnwwnbIg==
X-Received: by 2002:a05:6512:4508:b0:54f:c049:4a54 with SMTP id 2adb3069b0e04-550e971afa4mr8711955e87.12.1748007668631;
        Fri, 23 May 2025 06:41:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:08 -0700 (PDT)
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
Subject: [PATCH v2 18/21] pmdomain: core: Leave powered-on genpds on until late_initcall_sync
Date: Fri, 23 May 2025 15:40:15 +0200
Message-ID: <20250523134025.75130-19-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064110_710043_B05DC2FA 
X-CRM114-Status: GOOD (  18.69  )
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

As a step to improve this situation, let's prevent these genpds from being
powered-off until genpd_power_off_unused() gets called, which is a
late_initcall_sync().

Note that, this still doesn't guarantee that all the consumer devices has
been probed before we allow to power-off the genpds. Yet, this should be a
step in the right direction.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 10 ++++++++--
 include/linux/pm_domain.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b39d06d3ad26..5d2ed4edffd7 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -934,11 +934,12 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
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
@@ -1349,8 +1350,12 @@ static int __init genpd_power_off_unused(void)
 	pr_info("genpd: Disabling unused power domains\n");
 	mutex_lock(&gpd_list_lock);
 
-	list_for_each_entry(genpd, &gpd_list, gpd_list_node)
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		genpd_lock(genpd);
+		genpd->stay_on = false;
+		genpd_unlock(genpd);
 		genpd_queue_power_off_work(genpd);
+	}
 
 	mutex_unlock(&gpd_list_lock);
 
@@ -2375,6 +2380,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	genpd->stay_on = !is_off;
 	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;
 	genpd->provider = NULL;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index d68e07dadc99..99556589f45e 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -199,6 +199,7 @@ struct generic_pm_domain {
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
 	bool synced_poweroff;		/* A consumer needs a synced poweroff */
+	bool stay_on;			/* Stay powered-on during boot. */
 	enum genpd_sync_state sync_state; /* How sync_state is managed. */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
-- 
2.43.0


