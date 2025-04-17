Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67691C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J79qRcZGJZJmCItGNs9XR09SxwFcm6gRBRDcexcVIfk=; b=Tnibfu8ESVefISNXPv8tJoVoEa
	gKhTLE6GCn4LDWBfjLop2KcpZKGUP+eHlmwOI2ge8REgGHhy4E8OuDgH1Ws+uBcgOXTR5uU8quYtA
	BrG6ViuxeCLEj2kAjce33GPbwaxz5V40IAzn38hQPomNQ0fkxw0H1oq/1MIc+g5a6fXiwEIchwtCX
	9gJDZF0v6M7uddiN2f9pXW9UJPbrU36gARwiYZP6WPTn43kIQobp8k8+PIUViBP9TQNuEM3D7jhwI
	r7DPqfOI+XovqVnzQgxmmv4CXMA1t59DbnOHRTx1s2MavAf0nnSAn/DsTLdbq2nPMhNjxAx6oergM
	pfIlP63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QNA-0000000DLbp-04al;
	Thu, 17 Apr 2025 14:37:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBP-0000000DIfB-0knF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:40 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5499d2134e8so1015078e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899937; x=1745504737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J79qRcZGJZJmCItGNs9XR09SxwFcm6gRBRDcexcVIfk=;
        b=Wn+L8VNOmzLeJKfa8nWyDTg19uQi7gHAcsmof73aQxRqW+2IuEkf6Slsc1lVqonCyE
         CyXb2PLHztnkkJLqyrXgzlKwg+wWhXk2et+sWuUFWcY1u1VVuBtuGn5Q4m6HJaI8fYvu
         HyDWEH9RleoEkVLDofOE+r6ABEZBU2IL5zORH2/Ls4W9ft0YoZIc5IavRE/b1oQUlos5
         F3gnYe7zmaajzO21vTnHL6/OFIxgBIc+O7uq0C7iwHYy+d8jNzWiHzRadU0IWjQF7IGW
         e2Bs3c1Z6ccb/lmiL+vpdsj9Kn2N7UeKC0jcjnjgvBzNaM8ZzRAwQNgzdDZtryVQG6XN
         coqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899937; x=1745504737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J79qRcZGJZJmCItGNs9XR09SxwFcm6gRBRDcexcVIfk=;
        b=qDpJOkF5+jOSp/7DYMaO34c2Xutlj0Bh8+8akSK2Z3D4uOuE8ePCqgO3/5P1Ywvb4U
         uh36UfNCL6BkKq4N0tBV9SMpX71SmKlBgI+FGePuX1eKjAK2SErt6i2p4rjNvlRQCyW6
         +pjkr48nIZ6T5zlY+eCAnC9JkBMgi+qEPQeXhnibaktqjqdqV1RNVxmxIN/TwS6k8PJF
         L+EbnhyESzmDF82zt6PMF9cbsoNWKD/2/e3HkgCCmRI8miqL8YJoYrh0lUvRZWtWIvI0
         Pj3ZYETCgkBICFtZxDTS7N5FbdExW4sUcyZYYvlXAQXhV8F7sjOZj74MyOHcc23d5SHA
         dMXA==
X-Forwarded-Encrypted: i=1; AJvYcCVnl8OHRyxroBJf9o+Q+FJxUfe6leC1DcElfu3N+6uj0qs/JIXszhBwU7HNtxl9vdx1Euf8RIjDVf/CDZv64MPN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz18P02Spqan5lOCaLSHhwHi9SA3DHzM6wMR5gvdiGWAozcLOHs
	chmFLF+Z+pXkS9/z4JVGQk6ReStxMqVuTTAkbDD7HonfLLQI5RO49Fy+E/qEZbo=
X-Gm-Gg: ASbGncuxcwL7yfXq/cQE0XUhSg4JjxV0hIIL27dx3epZaCALL0h0TxXu6bkh8XhSA0c
	/vZBCyHOekJTJjqxeaWIiLV9j4bOUV/+/4I+EL5mEeKyNVzPUsa6Hw4VUKSrN9poKw3wfo7ACkK
	KsSfHiR98yVUqgEDEpFQ8p3B8VMswYvOzNh+Da22sjQxsRr/A2Dj2G77/TxwFWsoFGrZNe9dtA5
	NlPk40cHXmVchYndXmGdYlBzaZdJA9lv8Zm48Y/JjHHJsQpZzc6V17cPyvq6XoXNKsmtwQ+JTxZ
	50Gir12Y2iJX2jniFbdk+tZFQp7hc8u6QekabPURAKsHt9RCgB66pb4IVRp0jerpK595Nz/Nw4H
	+1TFFwywoDMJpMTaVKNMfQUWZuQ==
X-Google-Smtp-Source: AGHT+IFiUhuBtQQApad2nNH4tL0zFojb+VPiB8t6cSOcnI01Uz7KMV7xXLgUmCgNPnGefcFd0iptEA==
X-Received: by 2002:ac2:4e0b:0:b0:54a:cc11:b558 with SMTP id 2adb3069b0e04-54d64ab204amr1985603e87.33.1744899937335;
        Thu, 17 Apr 2025 07:25:37 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:36 -0700 (PDT)
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
Subject: [PATCH 04/11] pmdomain: core: Add a bus and a driver for genpd providers
Date: Thu, 17 Apr 2025 16:25:02 +0200
Message-ID: <20250417142513.312939-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072539_216631_12403C9C 
X-CRM114-Status: GOOD (  19.40  )
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

However, to prepare to make better use of the device let's add a new genpd
provider bus_type and a corresponding genpd provider driver. Subsequent
changes will make use of this.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 035b65563947..da51a61a974c 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -27,6 +27,11 @@
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
+/* The parent for genpd_provider devices. */
+static struct device genpd_provider_bus = {
+	.init_name = "genpd_provider",
+};
+
 #define GENPD_RETRY_MAX_MS	250		/* Approximate */
 
 #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
@@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
 static LIST_HEAD(gpd_list);
 static DEFINE_MUTEX(gpd_list_lock);
 
+#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider_drv, drv)
+
+struct genpd_provider_drv {
+	struct device_driver drv;
+	int (*probe)(struct device *dev);
+	void (*remove)(struct device *dev);
+};
+
 struct genpd_lock_ops {
 	void (*lock)(struct generic_pm_domain *genpd);
 	void (*lock_nested)(struct generic_pm_domain *genpd, int depth);
@@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static int genpd_provider_bus_probe(struct device *dev)
+{
+	struct genpd_provider_drv *drv = to_genpd_provider_drv(dev->driver);
+
+	return drv->probe(dev);
+}
+
+static void genpd_provider_bus_remove(struct device *dev)
+{
+	struct genpd_provider_drv *drv = to_genpd_provider_drv(dev->driver);
+
+	drv->remove(dev);
+}
+
+static const struct bus_type genpd_provider_bus_type = {
+	.name		= "genpd_provider",
+	.probe		= genpd_provider_bus_probe,
+	.remove		= genpd_provider_bus_remove,
+};
+
 static void genpd_provider_release(struct device *dev)
 {
 	/* nothing to be done here */
@@ -2262,6 +2295,8 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 	genpd->gd = gd;
 	device_initialize(&genpd->dev);
 	genpd->dev.release = genpd_provider_release;
+	genpd->dev.bus = &genpd_provider_bus_type;
+	genpd->dev.parent = &genpd_provider_bus;
 
 	if (!genpd_is_dev_name_fw(genpd)) {
 		dev_set_name(&genpd->dev, "%s", genpd->name);
@@ -3355,9 +3390,61 @@ int of_genpd_parse_idle_states(struct device_node *dn,
 }
 EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
+static int genpd_provider_probe(struct device *dev)
+{
+	return 0;
+}
+
+static void genpd_provider_remove(struct device *dev)
+{
+}
+
+static void genpd_provider_sync_state(struct device *dev)
+{
+}
+
+static struct genpd_provider_drv genpd_provider_drv = {
+	.drv = {
+		.name = "genpd_provider",
+		.bus = &genpd_provider_bus_type,
+		.sync_state = genpd_provider_sync_state,
+		.suppress_bind_attrs = true,
+	},
+	.probe = genpd_provider_probe,
+	.remove = genpd_provider_remove,
+};
+
 static int __init genpd_bus_init(void)
 {
-	return bus_register(&genpd_bus_type);
+	int ret;
+
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
+	ret = bus_register(&genpd_bus_type);
+	if (ret)
+		goto err_prov_bus;
+
+	ret = driver_register(&genpd_provider_drv.drv);
+	if (ret)
+		goto err_bus;
+
+	return 0;
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


