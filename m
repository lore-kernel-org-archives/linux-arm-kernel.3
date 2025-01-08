Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB50DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2PH+YeR0bEBhGOmEQodK+uTa/B+QOdEM0hw2aypokE=; b=wGacejzxnSxmUTLZpcnT04Y/h/
	p3I4WHUhd94hQGHdWYFBU9zXb9dS7K7+TTo3vAk0qb10Vl/78h6eS1Gc4dCb7JyXapW5nyfBLqpKL
	gE70TKSSf6gzgNgJgHq5nj75voHM4qzNHg1v2gLoTmJYR5Zs9pqmUu1qxlYKTSAIK0Yvd5JEp8iJw
	xFqLFRUL0XA6YrjuPzltwiB4Awm7jpEWHMmCJ1SZcN2Qijafd2bQSa4GsiGLWDeM931NMUs761Rd3
	xE3jVRN9l/5zGqGL5XpIAfZbmT7zPOgU6WEhy6K+i6R24buTfXWHA4F74NTLLbYWbiN0j00fuC/6P
	UZICX39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKzU-00000006lld-2PUT;
	Wed, 08 Jan 2025 01:36:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKsT-00000006k1N-1feH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:28:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21661be2c2dso219142125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299736; x=1736904536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2PH+YeR0bEBhGOmEQodK+uTa/B+QOdEM0hw2aypokE=;
        b=AXH0+HL/OBa7F1jLtE/lJ4HkwHPn+0TY53EHqE7CaZtXrqiZgoJJ9JenAB6WjGGWdm
         ZKRYljUFrhQ67AyWL2lQeNCaZzkNAKsrAFNQuzRouq28XjJGcdHfiX9Wkfa2ImH77l+B
         Vh5+USWMDOgMKFB7B5CDG3C7ihEm5EbgmBdyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299736; x=1736904536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2PH+YeR0bEBhGOmEQodK+uTa/B+QOdEM0hw2aypokE=;
        b=cI54NNlAQMQc9GpYi4secaD162OAVHhvRHx9x3oPG1H5EANaUvKgoyEDDZZ+enyzXa
         FtQd23MUKl9MhvNM1vsAK1RF+DIhR7OqMlRsyZOSiJjg0k9WKA89sWBfTskacGbq41Rp
         KhXmXCMRxDId0Gfu+iuF7io8NbiOwIT4P4qYiGVszSIJknufw2AJrUojDvaYOJ4NPPE+
         9rYBTgzdnuvKiQRmc9SLjyrHLKpE1kCzuSMGRRwfxNEyq+gbURrQoZVc8/JjhMJVs8Cb
         Q/vYjvaN/8KUuzuEoiuqEp+/2RA6ZAlpUK//+1ZjsJzIO+nX4se5bGpDB4Nk0OB5y1jy
         FDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIdMD0/rXzroT8Ky8ta+Sr3/MCqFj3LXpHMOjTdr60uNm6VGakfrfXEuq4HtqaEbTON3c479KXb/xo5rlmocNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzpX4iTawqy7M1CG93w6h8mJ+97oabEvgSK95mZRvDbJIvFw/I
	1eNEUx46kjQRteWDdmNdga/UCC9CA3IIGiep2K7KkZo2VLqY7adEVAdmV+nFBg==
X-Gm-Gg: ASbGncvi5xzIglXg70jCviX801YpVnA4VjLBJc9ywBkMc8n8wrnPY/EBnY3AzJ0U4q4
	NqPC/cDyBOdBZ1QYdtUlcL2ZvGY/Nrm1KCncgU/B05RaVhI+9/2arZW949BP1bph/twJaDgpi91
	qYktHV7eJgdhcqo8f4L324vaB72pcH4zZsiMqKOghay66L8dfgSGbky2rcVbkXZrsOCf5aqbR6D
	XrsrJFHFUbq5ysSkoWkKtzsp++tWTV6J49O/SLSuSPZTyywcsbWajHVP/dBCrSAX/v3hYQlcjAC
	k4+nyM7pAo9B7WfpFwWA
X-Google-Smtp-Source: AGHT+IEPnKUCG2gblLZlLZNHyLGaKfpBR0RoXfdx9u2gcf5pTAWqsgbyihyLPhCZcWcNvOkJsoUDRw==
X-Received: by 2002:a17:903:2311:b0:215:a2e2:53ff with SMTP id d9443c01a7336-21a83f36e1dmr16501155ad.11.1736299736529;
        Tue, 07 Jan 2025 17:28:56 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc962cf4sm316325925ad.25.2025.01.07.17.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:56 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 5/6] bus: qcom-sc7180: Attach pm domain to watchdog device
Date: Tue,  7 Jan 2025 17:28:42 -0800
Message-ID: <20250108012846.3275443-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108012846.3275443-1-swboyd@chromium.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_172857_435739_5E24A522 
X-CRM114-Status: GOOD (  17.58  )
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

Find the watchdog device described as a child node of the sc7180 SoC
node and attach a generic pm domain to the device before registering the
device with the platform bus. The domain simply gets the clk and turns
it on when the pm domain is powered on and turns it off when the pm
domain is powered off.

Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/bus/qcom/qcom-sc7180.c | 122 +++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/bus/qcom/qcom-sc7180.c b/drivers/bus/qcom/qcom-sc7180.c
index a615cf5a2129..7dfe6b32efef 100644
--- a/drivers/bus/qcom/qcom-sc7180.c
+++ b/drivers/bus/qcom/qcom-sc7180.c
@@ -3,18 +3,140 @@
  * SoC bus driver for Qualcomm SC7180 SoCs
  */
 
+#include <linux/cleanup.h>
+#include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_domain.h>
+
+struct qcom_soc_pm_domain {
+	struct clk *clk;
+	struct generic_pm_domain pd;
+};
+
+static struct qcom_soc_pm_domain *
+gpd_to_qcom_soc_pm_domain(struct generic_pm_domain *gpd)
+{
+	return container_of(gpd, struct qcom_soc_pm_domain, pd);
+}
+
+static struct qcom_soc_pm_domain *pd_to_qcom_soc_pm_domain(struct dev_pm_domain *pd)
+{
+	struct generic_pm_domain *gpd;
+
+	gpd = container_of(pd, struct generic_pm_domain, domain);
+
+	return gpd_to_qcom_soc_pm_domain(gpd);
+}
+
+static struct qcom_soc_pm_domain *dev_to_qcom_soc_pm_domain(struct device *dev)
+{
+	struct dev_pm_domain *pd;
+
+	pd = dev->pm_domain;
+	if (!pd)
+		return NULL;
+
+	return pd_to_qcom_soc_pm_domain(pd);
+}
+
+static struct platform_device *
+qcom_soc_alloc_device(struct platform_device *socdev, const char *compatible)
+{
+	struct device_node *np __free(device_node);
+
+	np = of_get_compatible_child(socdev->dev.of_node, compatible);
+
+	return of_platform_device_alloc(np, NULL, &socdev->dev);
+}
+
+static int qcom_soc_domain_activate(struct device *dev)
+{
+	struct qcom_soc_pm_domain *soc_domain;
+
+	dev_info(dev, "Activating device\n");
+	soc_domain = dev_to_qcom_soc_pm_domain(dev);
+
+	soc_domain->clk = devm_clk_get(dev, NULL);
+
+	return PTR_ERR_OR_ZERO(soc_domain->clk);
+}
+
+static int qcom_soc_domain_power_on(struct generic_pm_domain *domain)
+{
+	struct qcom_soc_pm_domain *soc_domain;
+
+	pr_info("Powering on device\n");
+	soc_domain = gpd_to_qcom_soc_pm_domain(domain);
+
+	return clk_prepare_enable(soc_domain->clk);
+}
+
+static int qcom_soc_domain_power_off(struct generic_pm_domain *domain)
+{
+	struct qcom_soc_pm_domain *soc_domain;
+
+	pr_info("Powering off device\n");
+	soc_domain = gpd_to_qcom_soc_pm_domain(domain);
+
+	clk_disable_unprepare(soc_domain->clk);
+
+	return 0;
+}
+
+static int qcom_soc_add_clk_domain(struct platform_device *socdev,
+				   struct platform_device *pdev)
+{
+	struct qcom_soc_pm_domain *domain;
+	struct generic_pm_domain *pd;
+	int ret;
+
+	domain = devm_kzalloc(&socdev->dev, sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return -ENOMEM;
+
+	pd = &domain->pd;
+	pd->name = "wdog";
+	ret = pm_genpd_init(pd, NULL, false);
+	if (ret)
+		return ret;
+
+	/* TODO: Wrap this in a generic_pm_domain function similar to power_on() */
+	pd->domain.activate = qcom_soc_domain_activate;
+	pd->power_on = qcom_soc_domain_power_on;
+	pd->power_off = qcom_soc_domain_power_off;
+
+	dev_info(&socdev->dev, "adding pm domain for %s\n", dev_name(&pdev->dev));
+	dev_pm_domain_set(&pdev->dev, &pd->domain);
+
+	return 0;
+}
 
 static int qcom_soc_sc7180_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	struct platform_device *sdev;
+	int ret;
+
+	sdev = qcom_soc_alloc_device(pdev, "qcom,apss-wdt-sc7180");
+	if (!sdev)
+		return dev_err_probe(dev, -ENODEV, "Failed to alloc sdev\n");
+
+	ret = qcom_soc_add_clk_domain(pdev, sdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add clk domain to sdev\n");
+
+	ret = of_platform_device_add(sdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add sdev to bus\n");
 
 	return of_platform_populate(np, NULL, NULL, dev);
 }
-- 
https://chromeos.dev


