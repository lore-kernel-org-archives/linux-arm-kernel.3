Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D221DC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWwLIPtTzxYEWEZZw852hEtxpMYtFzOXN6IU6m8GQeI=; b=B22V+PBDktxZF3JV7ND/AyIijY
	K36m/0vHYj7JckbmNXwSIGA6BCw8q6k2OT04X9PN9jiz14qGbOChCxPTRg0JdsNYRCFlQ1uXa+Dcv
	Nh5vuxb+m2TT1XdbrJRa0t+Y67DXOKorKRZ7XN/N5jxjqXEBm+CJyltQhYPv85pX6Hh/wSllsvOrR
	CLWYrSrPWCZ3eCTUFO8AmhyLglmdeNFWKCj4U2wjZSGlPJz8B6xTZASWcTMZ3emcSvlHnjvqGPw7C
	ONdC8RS2Lo8VDnEHL1Ew5qFNexg5a26fdtUl89rk0uPGtPrz1NmO1qSJ1e0jDFg5EKY/1hVBR+1AO
	n5EDdDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbD-000000045eL-3XWQ;
	Fri, 23 May 2025 14:42:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdj-00000003zI2-28qQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:48 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-550e2ac6bc9so10061903e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007645; x=1748612445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWwLIPtTzxYEWEZZw852hEtxpMYtFzOXN6IU6m8GQeI=;
        b=bnjDgS3LTUUdUSLazDgQjbjDYcQzOmtlEyw4ofVpwDRnKvJ9DFhPRwEreeyeTER3F9
         yJ3AddSVrClOdI/u5fLM8WUgHSDYfbhNGuHaBSVNsE5Vb/AwsTQt+izbTooa1MBnPuRr
         q60l4y1/gBT8aB88Dj+y4Ocg3eCxI4YiT6LRsyFES6rqmVBiPjEIpTHOMVbXG7DLfL/0
         T6o9rPAr43Hlp3pHkl7RA/f7A4to7qBMM8x5YY2AdLgMm/+NWhh93yIcFrzWZmfIn9eP
         DY+lwtN5b2SZouxazIfQO+rYABYlCWh5nzj7ExRoHXgaf6SiJPdtTJTNP+ROY4iCGDvW
         tP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007645; x=1748612445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWwLIPtTzxYEWEZZw852hEtxpMYtFzOXN6IU6m8GQeI=;
        b=D6WcDM7+I8Q2Uz+2DdgfVA9/fQAWqbkhPfyqOaqOlKLOOO9jjv+BDLmMjWxxT9eD30
         VlezsQkE2SRTjGWo+FMxXaN5yVfoYAqK4bCDCEgBERf6ohH6/wFjVIh/8gKVWlhsLPbR
         cGiJYDL3uwNjEu+Jf0CjCJHj++BbQCI+unzHBe2I/TY/E/H4KblBQQLpBu/3y/dmHbKr
         N6Ue8KRFDIIcvg6BS5o+haOR5MzrCDCdAOqzk7wfBxuEBKfq+43Zx/fxDdrUHXQMsvEY
         knLaihUdhXXerDkEG09sl+m8iJ2pnk9K/y1QJfO7zX+V8Pv1tFubVPFe+ymzMXBOzjf6
         rN+w==
X-Forwarded-Encrypted: i=1; AJvYcCU/iZP+x3UClXLB/nEKnt2dsAyomMRBUqAcJieUHMsijOEvhzD3NwTOS3JNL+ET/n4a2pzJ9lnacV2W1J9y7q8B@lists.infradead.org
X-Gm-Message-State: AOJu0YwRP8zsyKEcBEFeph+JIWgMs08e3ytjfuYl+GksJPWi1o0V9YT4
	vbMEo/VKgLgn3j5caTpg44ABWBExSjoKeU6J3krkvzh2FF0I0I3gYWeqPm2bXa8iUL8=
X-Gm-Gg: ASbGncupXckPaUtIjICMRLkJLqvAppVaHTw5fIBeklxF4kEtl0GumzIGuKXqmR+tv97
	U8p5YM5SsQF3rC2XrlhrEJEl9IBvKXuWn7VIyo+N1LqtFgmoeHA+j3HM6ANYUNphcPRtGN61h3Q
	zTIDGEsAiqJYVLvM9MpoLX5PrRPfx00L9at5Hhe0HW+aGXE6aGaYvmcL3G7VNSk7AEb8mEF00q7
	Cbqncir6tMmsn8gXxwhYWKyelSjOo9gzamF4d0V6BmaFbgJkanKLVA1a3gRB87VulUckZOtpjtW
	rl3JNfrBJuf6L9rlnE9mZze1WHnJ6hBP/4O9L1Mx+8Rgq+K0sVl8ZIKpeR5w+tpdhMFEy2PLdtV
	vdgNpAyvoDzX9y53VK9MNyxvx/A==
X-Google-Smtp-Source: AGHT+IGNGyKHt6rNzkDqqmR2aYUSiJolKpNdYz92YDpW2HCUQjN23ubBERBvBislD/qe18fWhnbOWw==
X-Received: by 2002:a05:6512:2581:b0:54e:752a:ae5f with SMTP id 2adb3069b0e04-550e71938bfmr11180010e87.8.1748007645507;
        Fri, 23 May 2025 06:40:45 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:44 -0700 (PDT)
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
Subject: [PATCH v2 04/21] pmdomain: core: Export a common ->sync_state() helper for genpd providers
Date: Fri, 23 May 2025 15:40:01 +0200
Message-ID: <20250523134025.75130-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064047_547218_31E0C75E 
X-CRM114-Status: GOOD (  15.98  )
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

In some cases the typical platform driver that act as genpd provider, may
need its own ->sync_state() callback to manage various things. In this
regards, the provider most likely wants to allow its corresponding genpds
to be powered-off.

For this reason, let's introduce a new genpd helper function,
of_genpd_sync_state() that helps genpd provider drivers to achieve this.

Suggested-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- Changed the in-parameter from a struct device* to a stuct device_node*

---
 drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
 include/linux/pm_domain.h |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 8d5dca22e35e..4047af5a275d 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3408,6 +3408,33 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+/**
+ * of_genpd_sync_state() - A common sync_state function for genpd providers
+ * @np: The device node the genpd provider is associated with.
+ *
+ * The @np that corresponds to a genpd provider may provide one or multiple
+ * genpds. This function makes use @np to find the genpds that belongs to the
+ * provider. For each genpd we try a power-off.
+ */
+void of_genpd_sync_state(struct device_node *np)
+{
+	struct generic_pm_domain *genpd;
+
+	if (!np)
+		return;
+
+	mutex_lock(&gpd_list_lock);
+	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
+		if (genpd->provider == of_fwnode_handle(np)) {
+			genpd_lock(genpd);
+			genpd_power_off(genpd, false, 0);
+			genpd_unlock(genpd);
+		}
+	}
+	mutex_unlock(&gpd_list_lock);
+}
+EXPORT_SYMBOL_GPL(of_genpd_sync_state);
+
 static int genpd_provider_probe(struct device *dev)
 {
 	return 0;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..3578196e6626 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -431,6 +431,7 @@ int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
+void of_genpd_sync_state(struct device_node *np);
 
 int genpd_dev_pm_attach(struct device *dev);
 struct device *genpd_dev_pm_attach_by_id(struct device *dev,
@@ -476,6 +477,8 @@ static inline int of_genpd_parse_idle_states(struct device_node *dn,
 	return -ENODEV;
 }
 
+static inline void of_genpd_sync_state(struct device_node *np) {}
+
 static inline int genpd_dev_pm_attach(struct device *dev)
 {
 	return 0;
-- 
2.43.0


