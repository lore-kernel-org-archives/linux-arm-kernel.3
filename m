Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4E9E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7rXiwNlneTt0S3Im0z7iFr8r3P4BVASAMn47K57uCI=; b=HlACz88VNSgaOVpWs1wHIK6Amb
	5NcvuUGUMW2GGEo//egqsBfG/87Cpb0MW4J9U1bBEfq/GWdXNTamBqxhxyrTpKZu1G6hWqSQRsy7J
	G4c++h/Lh9GN05y8Zyagpn+yGq3iv9/+o0BQvkWRppgSHHQD8yBjXKGOmc5HnNNVbx82z5toWzEP3
	+7ZHjZSnj1PAB1Jm1z9MuROJ9RGO5cPBEgHzDfIx259nHXEcdVO5xk+ROCQa1jshcTfyTIOm/7d+K
	2/Cs73oRZ4M9w4T+l4x3aAYlPWOmjlBF6MqroGqzb1wNUZZOQ0X/ZdOTVoJnNMU00UqOVQOZ3OeZ3
	kQbVe1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgbK-00000002sPo-1eFT;
	Fri, 06 Dec 2024 22:15:06 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgZL-00000002rwi-2GP3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:13:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7242f559a9fso2759425b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733523182; x=1734127982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7rXiwNlneTt0S3Im0z7iFr8r3P4BVASAMn47K57uCI=;
        b=SRHNrsUllpC6fHpKJzHfMa2ar0ApXSAWaV6NlW+MkiF8c1QC20oGwxOJyYexqYMcGA
         pTOg3e6YUSejiR60PlNkBQkxIgvw8nWwmLBqhKmAftqkQEB4TzUBbBpYg/DK/e0AIv5D
         NT0v8FG6aKWXGYNAfm0ddi2+dVILpJxOHKrddrZ1NTWBxQ3WO5vqLJqtrPydpFZA2MpO
         3enZEklrl54SBQgWHZ7qvnaIil2fS5gNTMYamfucapxu0Coq4+BJhxGj+Y5nA8uE/rAC
         NWiY4p+eQKqJIBp1AdMnLktTli2/bEMEySO9Habvuq0D24jJx8w6+1bjjWBIkGQnjXa4
         M+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523182; x=1734127982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7rXiwNlneTt0S3Im0z7iFr8r3P4BVASAMn47K57uCI=;
        b=ITCd6OYzhqdUP4shYlAwObgWCuj78GFM4sxzIjc4KjCHezdgX3QffnSBcBYZUd4KXj
         AUsRftuTaS+xfxIIhgoqGenDKGNyVeWtMEpxMWZi+sDU6D64cqKUfcbIpRATGLylUkqS
         MecEA42wobHeA1pwrDzt9AC4C0hOxwseR6SjKyDnnNStOXJjmtTkVCEoIsMx/6sjAtVX
         UX3cb6LQEJ+3KnevZgYxKN+Kv7/90A6OXK2iBnzvUCh40w/eNUHAamVbWOEtO3SbKFWf
         mLGc40yiVwcMlkqmT+i7qruX0UMb7DdffvT2r+qWG3sq7Wxj1V9YpG7Qt9bFy2NbQKWP
         cCcA==
X-Forwarded-Encrypted: i=1; AJvYcCXW+mZYp2X753gNLOchM4FRW0N0skueBG5J+i2hDK1es105YbDST4+uc7HzZiRLAB7H9xyfvb4jrM3k0tQZbmHF@lists.infradead.org
X-Gm-Message-State: AOJu0YxOGnx9uBrqJotQDAcwVgyFS8JhKYxwlCkeNXsgkGHvp6NNfQ5G
	kavVnJ/mQHjb9KPNgyICjAMHOKDb+L86iwHNEhA5a1XnvPgBpkkwCBJOe9mmxfg=
X-Gm-Gg: ASbGncv4z885fdMUIy+JfWbDW7le5xZBjm8h9KlHrKc2FJZ6uZ6aMA3A0r/PPYMIzuR
	Dkd0FrKOMR5y1gWobz782FYaq5C8MEunwVVFDMePnOVv53kM5o7eS6nIE91LnyGEo+5tIUZpDrq
	k/F3BorGot5OyUCnkBZc38PuDC/Y8VuZ5ONH1FKxbFSafWcovTNOLL/s1xOnzKTf1Enmbps7KTG
	f8LUEMqPQT/y0PJ/b8LZD3MkSSsVtGIBWVw6TYSP6kdjv0c
X-Google-Smtp-Source: AGHT+IEfJ6mTFHdobaZb1oZ2zV41f+MLXhV0wfwqztWK6BVWpG2aRCtQVIyY2AfpGqUSf7Ysz3ATBA==
X-Received: by 2002:a05:6a00:994:b0:724:ed8f:4d35 with SMTP id d2e1a72fcca58-725b81a9cebmr6601983b3a.26.1733523182698;
        Fri, 06 Dec 2024 14:13:02 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a27e9193sm3435675b3a.0.2024.12.06.14.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 14:13:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 06 Dec 2024 14:12:50 -0800
Subject: [PATCH v6 1/3] pmdomain: ti_sci: add per-device latency constraint
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-lpm-v6-10-constraints-pmdomain-v6-1-833980158c68@baylibre.com>
References: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
In-Reply-To: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4286; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=j0AdB2Ec/r7btTrtPaxqZvIVKLQ2BqKv+VHDX0Y86Yk=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnU3bs+JJtfkcVGHUhIAcSaWpLkYXr8u3NXouG5
 4fGc5caxX6JAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZ1N27AAKCRBZNxia0/vG
 ZfnwD/0StIlo35PDhUGEwnfZ+Rydqy8cNKGKRhQb5KzUsyiuOL4ELlJa5D33A8NB2a75+95dlsg
 gzK1uGvwIdqpVGPEq6kzS+6+66g7gKkGprQ3Mt1pFHFMBhA2cb+8NMzPHxNUxBjcq2CqTL4lMaM
 1aeQ5YlLV3GTpJg7ec0WmleQRWkSY5XouNK3GFSSqCwFSYy9s7dri1gBDuzPy/ZP9HfEK7FoBA/
 3P5NITclzhBf0OuMF3qmDhQFC7TYX+CSXxKQFQl950y9xpy2zOuKRPWYO0XEqJfHvzWA9Wz/xGi
 ujsnul6qP8wqGyjbkWZNGHQK6lq2ryliZRnDPhB686kUFKNf6iFdTRISMa7TLHBkMoC6AGL4f+o
 3NB5yrgWOjEItFozVTrPtZSt37pQgCRkww7gFaE7EFPt1EfLXkclTZAjWjodA2U7ndDG3DgMUmq
 1jcKS7HMQH0iJfAcwDQKpPOZLaakslLctyRlsaBG+duSUZY4moA49Ork4iUCUJObMSpi3zBDDDv
 wWNjirwjI6iGIrTw/R+v9Xkc9mJzZZQSGm/J+Py5lPrJqiDHI4EgSkBuCJoG2nfoHQg9qJ8vsX4
 ijrbm+t0IDGLqpMgS+qFX0ViTMvxFy6qMkuCiNCji7qFNIVQhop1ioKJ68eU6Po1/wD3XpUlu0a
 SKtqsstaZbro8JQ==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_141303_609368_CBAC26D4 
X-CRM114-Status: GOOD (  17.55  )
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

Also note that the PM QoS framework uses usecs as the units for
latency whereas the TI SCI firmware uses msecs, so a conversion is
needed before passing to TI SCI.

Co-developed-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Tested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 0e4bd749d067309654307484c5bb98711bf06daf..963fe1901c959197d5d8b5d34fd8420dfb180087 100644
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
 
@@ -51,6 +53,32 @@ struct ti_sci_pm_domain {
 
 #define genpd_to_ti_sci_pd(gpd) container_of(gpd, struct ti_sci_pm_domain, pd)
 
+static inline bool ti_sci_pd_is_valid_constraint(s32 val)
+{
+	return val != PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static void ti_sci_pd_set_lat_constraint(struct device *dev, s32 val)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
+	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
+	u16 val_ms;
+	int ret;
+
+	/* PM QoS latency unit is usecs, TI SCI uses msecs */
+	val_ms = val / USEC_PER_MSEC;
+	ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val_ms, TISCI_MSG_CONSTRAINT_SET);
+	if (ret)
+		dev_err(dev, "ti_sci_pd: set latency constraint failed: ret=%d\n",
+			ret);
+	else
+		dev_dbg(dev, "ti_sci_pd: ID:%d set latency constraint %d\n",
+			pd->idx, val);
+}
+#endif
+
 /*
  * ti_sci_pd_power_off(): genpd power down hook
  * @domain: pointer to the powerdomain to power off
@@ -79,6 +107,26 @@ static int ti_sci_pd_power_on(struct generic_pm_domain *domain)
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
@@ -182,6 +230,13 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
 				pd->pd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
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


