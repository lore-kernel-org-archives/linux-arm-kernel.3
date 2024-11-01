Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056FBE6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3idRexV6BiHXZ5h21OJlIktjbdShqDapELZrhtrPoA=; b=3f8htrBXLlSb5UBH+p6pkNiZyH
	K8+4IIW3Ewh9YJNPzzkF6yxzgRkqHDcUBDfGKiFgffbqo10iZQgf7GupqO2dBCbiU/G/DTu2LLGK/
	h5dVkbOop5ojYjYeZUdS2B2pzdo0bU5xHetZggeMVbVqtg1h+mR2uV3FtofAYHv8Y5uUtiurPWU85
	0Q2CmBsTpA4Ks8+A9tNuQ0qV+YZZwVsqUQYtFTnSBCCvqw/GHXokws3+veWX+GaPZKeYLRC82Pht2
	jYTmXBhIzS5en3ryAT8K4dbdviiRCz6rBpEpLUvm0mi41SjqyjjwA9X9Aw6hD0jWCt8aJndx8bvIg
	2AljZ3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tpl-00000007YJN-0lTh;
	Fri, 01 Nov 2024 15:45:09 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thg-00000007Wys-0AX8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:36:49 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-207115e3056so20884345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730475406; x=1731080206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3idRexV6BiHXZ5h21OJlIktjbdShqDapELZrhtrPoA=;
        b=QJbtpKmQY6pQM61/tdk4c8iwVBaUMZB31lGX3CpCUMP88Wd55XqAslOcNncZmdg6kN
         xFTueduByz9c7APbYNXVweRL+9LECwlGvICUZELoA5d5QJaS7bAfW5ihSZS1U6Q+xsbB
         txmumpfu0gTLx27x0w2Az776soSPT0snzubUfLJX9S2dEFhPKiSnA0aIbG0KZgFWEMTy
         HwvGEEKlrcy/rJ5UzJON+chyK9buUev7f1X+xYedbtIZPBeJufqXLBBM8ESa7OqbP84U
         QlB4lTgqWrKrJbPjG4Wt7Bf0B+FalQW63DiZt/tLX8IkGhQl0zU02aBHOuhfYGDF4oJp
         +NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730475406; x=1731080206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3idRexV6BiHXZ5h21OJlIktjbdShqDapELZrhtrPoA=;
        b=DIaWQs7hUcoGmaos0AeEzsC5AlS17RVq5BKFzTBwRGCJv+hxJtOEWdrjkLw97gJy4m
         LTbpOd3vWfMM66fwUslAKwY4XwFB14Sct4rbvuBVxk9y0GtrqzoJfxS6hWaIBSsRsUbn
         2dCZd1WNHhuIksjRZcRpqR+n2gvLQ3PiFEuvMOFHoCyhmSJUBzNnIl006n4L9jGmpaBd
         AHLUU4xR2r39TyRBpfYTrs3+WP1WPVVgR+1uaUQKujpaZZdIb9h29pyqSMt/UZYkHlik
         x4joGv9Xmkx8XEaeRGNh7yGW+A6kBJu4WHjsO7f6DeJ4PllSo9WcTDoRKzsOzp3oWcqy
         CQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4x7S/PT0LzqbN+UN/iI17kr6qkw9a5pU6Noxpzj/he91pJs6+JWRGQxZl6TmBVN2zFYJibpuIz6iusVCU/Zzz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/uyXShfp0aXqdM23z+vaGQ1AuEfLjuY4pnDxHOd+rpnqoOmjZ
	Bfo+aPq1cFyzhTYyDg6270fURBerAXTAqXaQHrEqnYjt+fUGXT4vxP0MxB5WG5U=
X-Google-Smtp-Source: AGHT+IGY/08HilcbZmR1lKyyTr906chNTawpACDKuD2s3QhEtikW9I1wYr4l+lhIq37jX+2CszHKmg==
X-Received: by 2002:a17:903:11cd:b0:20c:f0dd:c408 with SMTP id d9443c01a7336-210c6897f24mr302882505ad.20.1730475406525;
        Fri, 01 Nov 2024 08:36:46 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c1189sm22803555ad.204.2024.11.01.08.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:36:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 01 Nov 2024 08:36:20 -0700
Subject: [PATCH v5 1/3] pmdomain: ti_sci: add per-device latency constraint
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-lpm-v6-10-constraints-pmdomain-v5-1-3011aa04622f@baylibre.com>
References: <20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com>
In-Reply-To: <20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-cb14d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=Ewuo8tkZRIPnXmWm+AAeqen1P+AccwVWLIprM0pWxB8=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnJPWMo1qK7rflgRga9T/TyTsA7X95SDxo2qEx3
 XJ5U8aE5veJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZyT1jAAKCRBZNxia0/vG
 ZfTJD/97EoOKKx2D/jgBRXrjpmjWbT2pCWYpAORn4EPRLgpHjzYeqnJbXXTDyPv5LwBDVQ0svyY
 /1R8Me7OjWOmjdHWyfAwOJZLVGQq22/B7pSfLJbjfaLQ7HvkxtB0qbcWFS/hjbI9osjSS1sTK7o
 2h8Enq+TNtzgqAX+7Q/zp57hCn2KwXNNDpgFQBSk7K3KpupCgNwUlM2faqLGPwlqEyTMUErWBCv
 DETk1E/RGFQEOX04q1mt6Etjuh/dxDzNzZYShU0X2Icn3isEtAnaYgE9c1l4Qr/qfGXRZjAI+FV
 AUQKl2BXfW3ylqH2ycOub+jmie1yf5OxygCWbKwt9B0s6in0moZgaBLnbVwWxUbvgYeDTanCSqx
 dHriZzlHlFVtIYee8KblIl/0fh4qCpzjfNT7L+Igm6U4TjWuSZZRfclIa/YNM3ejzXjaasVMj4B
 gVC+UNOXUDqO1REpYRN2hFjm4clV+wogBxM4awCvXbXjUBz6IK+OipP7DP9i1JOWiCUQWZSuMRP
 Jqarclr/xN1uUXq1l1ilzgQkEoPBP93K4xgjXyXvisyEG4Ql3N2LFKE1w6CaQHvsXxCndK6B4ra
 NENxt2+KIm9MxpPT+fgTjqZwNNihsyCd6aCUX2fb4c1/q0Od3gw+YZPtbbY2Y3rteNa+RYLHPGd
 wEsoQj61WEHQpGA==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083648_119646_B8D25FF0 
X-CRM114-Status: GOOD (  17.22  )
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

For each device in a TI SCI PM domain, check whether the device has
any resume latency constraints set via per-device PM QoS.  If
constraints are set, send them to DM via the new SCI constraints API.

Checking for constraints happen for each device before system-wide
suspend (via ->suspend() hook.)

An important detail here is that the PM domain driver inserts itself
into the path of both the ->suspend() and ->resume() hook path
of *all* devices in the PM domain.  This allows generic PM domain code
to handle the constraint management and communication with TI SCI.

Further, this allows device drivers to use existing PM QoS APIs to
add/update constraints.

DM firmware clears constraints during its resume, so Linux has
to check/update/send constraints each time system suspends.

Co-developed-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Tested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 1510d5ddae3decd5b70f835338ed4e0b2a3c9373..c976a382d64c807daea72fa1ea9d6c11c8773762 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -13,6 +13,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
+#include <linux/pm_qos.h>
+#include <linux/pm_runtime.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
@@ -51,6 +53,27 @@ struct ti_sci_pm_domain {
 
 #define genpd_to_ti_sci_pd(gpd) container_of(gpd, struct ti_sci_pm_domain, pd)
 
+static inline bool ti_sci_pd_is_valid_constraint(s32 val)
+{
+	return val != PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
+}
+
+static void ti_sci_pd_set_lat_constraint(struct device *dev, s32 val)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
+	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
+	int ret;
+
+	ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val, TISCI_MSG_CONSTRAINT_SET);
+	if (ret)
+		dev_err(dev, "ti_sci_pd: set latency constraint failed: ret=%d\n",
+			ret);
+	else
+		dev_dbg(dev, "ti_sci_pd: ID:%d set latency constraint %d\n",
+			pd->idx, val);
+}
+
 /*
  * ti_sci_pd_power_off(): genpd power down hook
  * @domain: pointer to the powerdomain to power off
@@ -79,6 +102,26 @@ static int ti_sci_pd_power_on(struct generic_pm_domain *domain)
 		return ti_sci->ops.dev_ops.get_device(ti_sci, pd->idx);
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int ti_sci_pd_suspend(struct device *dev)
+{
+	int ret;
+	s32 val;
+
+	ret = pm_generic_suspend(dev);
+	if (ret)
+		return ret;
+
+	val = dev_pm_qos_read_value(dev, DEV_PM_QOS_RESUME_LATENCY);
+	if (ti_sci_pd_is_valid_constraint(val))
+		ti_sci_pd_set_lat_constraint(dev, val);
+
+	return 0;
+}
+#else
+#define ti_sci_pd_suspend		NULL
+#endif
+
 /*
  * ti_sci_pd_xlate(): translation service for TI SCI genpds
  * @genpdspec: DT identification data for the genpd
@@ -188,6 +231,13 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
 				pd->pd.power_on = ti_sci_pd_power_on;
 				pd->idx = args.args[0];
 				pd->parent = pd_provider;
+				/*
+				 * If SCI constraint functions are present, then firmware
+				 * supports the constraints API.
+				 */
+				if (pd_provider->ti_sci->ops.pm_ops.set_device_constraint &&
+				    pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
+					pd->pd.domain.ops.suspend = ti_sci_pd_suspend;
 
 				pm_genpd_init(&pd->pd, NULL, true);
 

-- 
2.46.2


