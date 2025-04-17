Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsxBU0bGS5KqHJ803b5B2Fj0PSRviE9NZjBErJhiWF0=; b=YQDhMopktKP7nxa+Mapo3WHwbC
	oKp2iAFV7jEACqU3/hELhoJlxQIRq0VtfMbQ9gbYNxSXPUqPDVfzhxbNF6rCrAwlUJa2lG9NusG0r
	FdUgJmGPQBwd3A+KpVGZN0+32+oJ4D6Enq9fvjvZre46WkT38f8nRuWQf4zOJvjwOv2wUJaBwXmuu
	dHV0MTPq1Pr3ytk1strh+iV1xDLDvQqr4E7UsSIqHWA9/Tpl1cE4GV4ApdbnLW2+a7w7i5dvZDzH3
	VlNKqkyHNTKdBrT9FJKYT6YiSZEQ1scNJS4squPN2v7x1DAOZZtEfVG/ibf6I2x/22fZuIk7BrriS
	NIE2jiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QOz-0000000DLyv-3TRr;
	Thu, 17 Apr 2025 14:39:41 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBS-0000000DIgp-0OME
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:43 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30bfed67e08so8823361fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899940; x=1745504740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsxBU0bGS5KqHJ803b5B2Fj0PSRviE9NZjBErJhiWF0=;
        b=HUfImGXvkjl+x3up6yFo5ZE3UPKCsFXICY/POdpA3hOxJ5YvpsQWR10QFqovlvGhd/
         UhHLvDnqf4qnJEFL8sg+mHVgJSI/jzVDHmzUuazv/s3Uhdy6CX/DwLPOVZ/Vs/Ehu0Dh
         +n06o4zapaUUziEWu8O0ggiALAPhoqQo3TnUpV20ykvgx26YD3beK1rQTb+KJsNKgLeP
         S4DYns8q8lIM3bcQJ/kze5FQNXUvdvIk/OXlOv7323e8xi5itBiaYpwHhb8olk9F2WCT
         fy/F9WdzWIZ+gT4EdXlb061olQa5EqZv1TMvaAytbS3oX0dlCJ2BTW4IRFl6KKazD+Gj
         BDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899940; x=1745504740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsxBU0bGS5KqHJ803b5B2Fj0PSRviE9NZjBErJhiWF0=;
        b=YwLBBRqJZ+kZ0jXtpkx5iU7xWqP18zqxtovESAgCNFnXSYnX6jjUOvVjMnfL2zpmzZ
         Y6hN5kxvWNHZ6R4AiFPG+YOwtiHuDDXpnoiw66g4xTjLqJ3EhSQVuPrya44jhkYltpJs
         CdKt57u8amrcRsuCwu22pCbOQSIqIUQ0dhxAN6CfDcoqBmin5Wffq+ou2By8fZw5AFeS
         AeYfzZjr2otjBbspGtVtM7m8Zq41nWQsukmyHgRVyWcdteD6nJq+nKh7yUJqAQBcfbEh
         k6ugYMgU/qf3rf0utH1zXbUwvwLyjlmKIu9QWqq/fxeAtrKnIS+RvjAkqPEaeRkYSnL0
         j9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOTZUw/01sPHf/MInSc7gYruWBx7fMftR2bjaPCBGYN0hOgX4N2A75UnnnJh3/QRX8u96kWAzxN7cYc999nYXU@lists.infradead.org
X-Gm-Message-State: AOJu0YycEbD9xxZsco8gO3+BRbwB3z+K+QUDS4VsupGzyE2P9VmpWLkM
	wlNmaVynrQuq5kSGGYrvEOGr23tT38ht0HvpetYg9SI5hEl5FvwIeqcULjBwkNFPlcBxe6n60ys
	Y
X-Gm-Gg: ASbGncv1pLzGHBErqS4PSFpukMyG28vVtSrF+SXWWeZ459/XMfkSX6/pmL4U9hkRrsn
	EZnTKnduTpKNZAjwi7IMlCrRWiGcCVsGZqGkCAiJFQPw+197d/bjWtqFVLmQjS5DGHbZsrKMfm/
	1tSE3b7m0eRSfA6h0dvubsSMMGEArMldYKSBqFVK3eAqk/LTfH20M7ZGrHOOK2WiK8G4rUAyhdS
	SMrpQUad5Kr+L/QycdFZ8wiLPpOrWHOtv4L7OEugy8e7xLOpCkxaRyZwJSEpa5HhGV8ZJeL7srH
	LMhTKq2QIsIyq4hF/z5yQs6nxDpUod4j7Hv3BYQK9vVE8korwdY892y473jHsNA7M2ANIzRho23
	ODr+802uiAIsVJ1w=
X-Google-Smtp-Source: AGHT+IEWl4UhmNQk6NGrzL0Iqf0HFQV64z24gz6YKYgW7OTjKrIcQquUG8drUV+xQ2lv6sucMcxvpQ==
X-Received: by 2002:a05:6512:304a:b0:549:8c86:9bf6 with SMTP id 2adb3069b0e04-54d64ae80e7mr2023094e87.39.1744899940189;
        Thu, 17 Apr 2025 07:25:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:38 -0700 (PDT)
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
Subject: [PATCH 05/11] pmdomain: core: Use device_set_node() to assign the fwnode too
Date: Thu, 17 Apr 2025 16:25:03 +0200
Message-ID: <20250417142513.312939-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072542_130699_41DA2039 
X-CRM114-Status: GOOD (  14.38  )
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

Rather than just assigning the dev->of_node for the genpd's device, let's
use device_set_node() to make sure the fwnode gets assigned too. This is
needed to allow fw_devlink to work correctly, for example.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index da51a61a974c..3911d3e96626 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2627,6 +2627,7 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
+	struct fwnode_handle *fwnode;
 	int ret;
 
 	if (!np || !genpd)
@@ -2635,7 +2636,9 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (!genpd_present(genpd))
 		return -EINVAL;
 
-	genpd->dev.of_node = np;
+	fwnode = &np->fwnode;
+
+	device_set_node(&genpd->dev, fwnode);
 
 	/* Parse genpd OPP table */
 	if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
@@ -2661,7 +2664,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 		return ret;
 	}
 
-	genpd->provider = &np->fwnode;
+	genpd->provider = fwnode;
 	genpd->has_provider = true;
 
 	return 0;
@@ -2677,6 +2680,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 				  struct genpd_onecell_data *data)
 {
 	struct generic_pm_domain *genpd;
+	struct fwnode_handle *fwnode;
 	unsigned int i;
 	int ret = -EINVAL;
 
@@ -2686,6 +2690,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (!data->xlate)
 		data->xlate = genpd_xlate_onecell;
 
+	fwnode = &np->fwnode;
+
 	for (i = 0; i < data->num_domains; i++) {
 		genpd = data->domains[i];
 
@@ -2694,7 +2700,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		if (!genpd_present(genpd))
 			goto error;
 
-		genpd->dev.of_node = np;
+		device_set_node(&genpd->dev, fwnode);
 
 		/* Parse genpd OPP table */
 		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
@@ -2713,7 +2719,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			WARN_ON(IS_ERR(genpd->opp_table));
 		}
 
-		genpd->provider = &np->fwnode;
+		genpd->provider = fwnode;
 		genpd->has_provider = true;
 	}
 
-- 
2.43.0


