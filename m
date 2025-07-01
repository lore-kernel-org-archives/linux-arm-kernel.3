Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BE8C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CajxEdIrhbFO4ax/v+i8H3+X7djNNFGL84d/W5pIrjo=; b=qpLlQwaLqk1UMbut56GOTUAxYm
	SvjM6GccRQOGR6s0rYBYY41DRBAVC4Ip0tMPsSx6BlkpyxObhTCFw7YizkUkVC+ucyOxgkFga7VBz
	0K4dCgW9OW+Upy/XjBlcaN92NGp+FkKMBzgwBrGKshiOi9j+MIwaitxmFWjhZuNVJ6xY7gmUxrAGm
	h+odIwmD8kLzp0p2V3GvSO7Gr8ZeHAZIk3x1SKj6w0zqB1EaFMXvkfmgtbFXO2SRn7rjnZl7vsLzn
	CZnFI0LsJ6yL0bOcSvPSp2VlQ20AsjTsNF4YgS5MOU23eizuI78DvfGDFKk13mHcgXuCTIn9bmY/W
	n9fmP16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZn3-000000053FR-3N7L;
	Tue, 01 Jul 2025 12:08:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSq-00000004udu-2tzw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:53 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553d771435fso4712269e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370471; x=1751975271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CajxEdIrhbFO4ax/v+i8H3+X7djNNFGL84d/W5pIrjo=;
        b=BU3UxQIREYShrcdaFwGdAvSF1ot2/X2MoNx9Gj3e1ytw0+0FGHELwcuxF2L0lwG0ds
         1ZjwYwGDpfVHbfq0ljc2eE9TjUtOCpe+4TxOuNGH+yvEz0fFqdrE7GKUveawxhT6n4yi
         IYH50HBxoYjc4sgePPYXssPQOFqSLk249RQwJsL7J1kPmzOXu4JiNkRUg0WPt4MclYcS
         VEa8LnZZ/r/w/R/LYlW6fat3PHfpWqJWA6GQWMoMAfLxf2pPaeKQ7D2SydwbCmnU/Snk
         YQqRXKfjWrIiiZkPywBL1aEq/77rj9vK3p7eY8JnA1Wx5imobk1z208o+XzPpXKu/miI
         LcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370471; x=1751975271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CajxEdIrhbFO4ax/v+i8H3+X7djNNFGL84d/W5pIrjo=;
        b=pnb/2iKNMo8/52WNbYn/tjoYxwe0aZxfyFCyI2WLCiZNb7a4TKWLan25XkRuCmXNGo
         9uDvvL+tlhmEdrC5PmOC1wIA40UuvYU48khRjFsI6tP0ym2KHjpIPbmxJssgu7T4A19g
         bNf0/soqQIzCfRB5H2+8oZudJ65uwZI0e8rOr9J98aRStBEszDq3yj4RDS+IJSTUN01E
         Z3xm51RrL/jTTV4ZFGdZZnkl63yeskMCjF7RC4OZP7YMUBIMybHv6JwTNzkfvSYXeb7m
         u49fUCR7oQfZs8vMUxrW3mI+3elkvYust3wb2tOK6E6Tsf5frX08AeFfVJ0yeKBtXDNw
         HKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRpi0s3qFJ2sidzFR+KsTysAKRhRu6rguW+YujWJjsDL0O18KCzBNGsjGouRuiX0gEQC+pKgsl8sqS8KE1NLJr@lists.infradead.org
X-Gm-Message-State: AOJu0YyH9ggZh9YXZfpDZp5SdEzQbV3X54Ei2ydRGDrw3Rhmx6JJ9fuy
	ErwQZA2AlFE8jgicrVc8KvmZaOK8ZzjCk8eBhQHrlf9PhvnkC9k6Vmyrj8CqDIe57CA=
X-Gm-Gg: ASbGnctlAkTmB0gVM24QCQfSwtSm4Ec8iR3ZLL9MlU/icQhGBcbS1JuLW2JS1zvdCyG
	IWpO9Adg5CMQmFXEO2Y3KgFSiUkBsNJShtUVERmADDb8WjKZl6SC4xB/bzPQqyFdeFZfs1qiUCA
	mces0jk+IutX0+nMDCklZKmvBC+kSSommueGF7Gf5qwMOo4wiT1x+UWt9kjkKt8CskyOyhqgQEH
	fAuBtmxpM+f2+EEdcUaJpAMmHW2mVm1PNjN/wNuPK3wpPMQGHmgYWhgo8x3BfKZl9tTzMay/zsk
	TJbB47vrKipRPDCPBLuHxXw2taMPj9sx/lPbsBSVcy7bxgYs4EIB8bDL8xlcS0sP1srDsLSfKVj
	JVRhWVfrLuDprwWEzOxeth8KBgccCU7kABR5S0loJhQkXjfc=
X-Google-Smtp-Source: AGHT+IGMamMYGx3FPuo7ZJUyd1tcu3muckiZRnDf4isS1MMvNhp9nd+F41aF57MMOFDi0e6yJafIcA==
X-Received: by 2002:a05:6512:1112:b0:553:543d:d96b with SMTP id 2adb3069b0e04-5550b869e02mr5271751e87.11.1751370470821;
        Tue, 01 Jul 2025 04:47:50 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:50 -0700 (PDT)
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
Subject: [PATCH v3 05/24] pmdomain: core: Add a bus and a driver for genpd providers
Date: Tue,  1 Jul 2025 13:47:07 +0200
Message-ID: <20250701114733.636510-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044752_731038_64659740 
X-CRM114-Status: GOOD (  19.82  )
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

When we create a genpd via pm_genpd_init() we are initializing a
corresponding struct device for it, but we don't add the device to any
bus_type. It has not really been needed as the device is used as cookie to
help us manage OPP tables.

However, to prepare to make better use of the device, let's add a new genpd
provider bus_type and a corresponding genpd provider driver. Subsequent
changes will make use of this.

Suggested-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Dropped unnecessary callbacks and convert to use struct device_driver.

---
 drivers/pmdomain/core.c | 53 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 93d71164fc56..a41f5f91e87f 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -27,6 +27,16 @@
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
+/* The bus for genpd_providers. */
+static const struct bus_type genpd_provider_bus_type = {
+	.name		= "genpd_provider",
+};
+
+/* The parent for genpd_provider devices. */
+static struct device genpd_provider_bus = {
+	.init_name = "genpd_provider",
+};
+
 #define GENPD_RETRY_MAX_MS	250		/* Approximate */
 
 #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
@@ -2262,6 +2272,8 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 	genpd->gd = gd;
 	device_initialize(&genpd->dev);
 	genpd->dev.release = genpd_provider_release;
+	genpd->dev.bus = &genpd_provider_bus_type;
+	genpd->dev.parent = &genpd_provider_bus;
 
 	if (!genpd_is_dev_name_fw(genpd)) {
 		dev_set_name(&genpd->dev, "%s", genpd->name);
@@ -3360,16 +3372,55 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+static int genpd_provider_probe(struct device *dev)
+{
+	return 0;
+}
+
+static void genpd_provider_sync_state(struct device *dev)
+{
+}
+
+static struct device_driver genpd_provider_drv = {
+	.name = "genpd_provider",
+	.bus = &genpd_provider_bus_type,
+	.probe = genpd_provider_probe,
+	.sync_state = genpd_provider_sync_state,
+	.suppress_bind_attrs = true,
+};
+
 static int __init genpd_bus_init(void)
 {
 	int ret;
 
+	ret = device_register(&genpd_provider_bus);
+	if (ret) {
+		put_device(&genpd_provider_bus);
+		return ret;
+	}
+
+	ret = bus_register(&genpd_provider_bus_type);
+	if (ret)
+		goto err_dev;
+
 	ret = bus_register(&genpd_bus_type);
 	if (ret)
-		return ret;
+		goto err_prov_bus;
+
+	ret = driver_register(&genpd_provider_drv);
+	if (ret)
+		goto err_bus;
 
 	genpd_bus_registered = true;
 	return 0;
+
+err_bus:
+	bus_unregister(&genpd_bus_type);
+err_prov_bus:
+	bus_unregister(&genpd_provider_bus_type);
+err_dev:
+	device_unregister(&genpd_provider_bus);
+	return ret;
 }
 core_initcall(genpd_bus_init);
 
-- 
2.43.0


