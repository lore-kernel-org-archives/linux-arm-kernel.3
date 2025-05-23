Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC00C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YYTvqY48w7pyG/wWiP6f2TlpLJxz1KgObIIkEZbJpM=; b=opGKCl55MXI3Pl3PoUbmhiUfPl
	oUNlM6x7NZbq/BcFrsDDLIM+4WvDucgNwuqth3NCaFeRHciwIH+pUD9uDzCX3EwNCV3DpbrkYa3iQ
	Q9T80BvbUEh5oRsSwfy80rLEr/WWnHks9Zzl2YkHR/jjGIcgKntwiOlWkmM53va9YOgRHBqESRV1m
	Y+l76BB8EHpVqFKZU6zA59tkGhO51DLD74X4dlF6qeFLAXzv3E68qcfujGtUHTD5TWnfkX6ZJfQNV
	nFR8hJPQBWfhGD6xrapctG/+AoAMs08TJTDU38ODx/NK14XqcjtZ0x1NeA5NF0OqoC3ID/PuA26WW
	OYA9qDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbE-000000045eW-1a3I;
	Fri, 23 May 2025 14:42:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdl-00000003zIV-0AJS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 13:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3YYTvqY48w7pyG/wWiP6f2TlpLJxz1KgObIIkEZbJpM=; b=YdmLt+BQCI7AsbYL3EdiZFJOB4
	NM+XLRfLCdoYQ/O3BZ6b9rGGMbSdnzIqIWNlR6VW89Cwuj/akNKRgzEF7E0mJS6pn1zO2a0c3MycD
	OiMpXoIFLK3+wxTHBMgiaO/gKj25DwmQGwcEXWOFhkRx45Vkgapc5QblWO91sUJ3I6VgjXGt6OEOh
	tVhk5MgiFyosyRO51VeCVrENhlofatdtXlXLx1tCwHHm296qQoMBJBt9X/w9w9yD70ehuBq3ZmLd9
	QaXGuK2en4jxAMK7rRrJ5EZ3Cf+5uf+wnfUk/ANOwke5f3wcWFuirlecDzjnmfTJ3LYrZ03nrs4Fg
	JfLb/KoA==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uISdi-00000001Kjk-0Jzo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:47 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so11504959e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007642; x=1748612442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YYTvqY48w7pyG/wWiP6f2TlpLJxz1KgObIIkEZbJpM=;
        b=rTxAEcgRyBjgqlc+Zekc2rgqX0U+s8Jj935YjgcadxhytIigwwQCiWfz3c2jCWvyE8
         sqS8rOST+7MHaOYg7BMiEaQ4O4Jt0EY7bP8LyOUyhFcNLFah5icli7sbqYt+Vy3NLumj
         B+nQJPAXjshzfxP7zn6pBSqnkwi1tulW1HEJt6WRmt02kCo/SOL18dURN31+0au0lbIN
         jL3KEy4PzxuvqAAIOWLvlYbyeBSjNUym+wx0yzi7gfjZwk6xujO64QCuV8eNvRU9DGxA
         Floow5ytM5oIdJcE9fPydN5BDlE9cXqcw1cTZLyZSYrpFg8oFYMxJrW5F1SWdAxpx/0p
         jUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007642; x=1748612442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YYTvqY48w7pyG/wWiP6f2TlpLJxz1KgObIIkEZbJpM=;
        b=EDUsliWM47IKvCXQqUFs9QZHYZmA46rFV+ciTMMk4KretAT3y5bZbHVC2AksLXRmpF
         F7OLH3M2ndgAHyUh3xbCBkGqEknVOmXy+3l304Fb3r+2xyCNAYu+7yNtgMWaOQLzJuTk
         6x9o2MJK0VHUswtVaKBi7/FCQEJ8aNpqKJOkOM9E4emrSqbQtdCFI3cw+AT5QCYPcrr/
         KTK74BCYdSGeyKYMAUU19R9AghpA3bflUJbMlgbKPCGru7YMJfMJzaBz8NbkAvUaKk9b
         a+wfjk+df0HfXr/DxXUP03/uMDjUPVomxLNDcWPS6RNzFs4k966jr/RJ1vdLxK7k85aB
         CsTg==
X-Forwarded-Encrypted: i=1; AJvYcCVjm1NOBqypmRZ9E0jpXQuKM4I6J8cwAIAK5PdWGcgFuOXkcwYTkrRVU1GmqmROPHX24ZxctQ6itRJCnszhygei@lists.infradead.org
X-Gm-Message-State: AOJu0YwlY25GOtGZ/24LivW6NGpqjQlsJ+vyYcEACUHsfmsosUFmPC/u
	j2UrXQnFsoGbRcbMftm6/X+HqUObF/Z4CdAbK1EKJSCr9k1iDZuLQZYDh4GQKeMiRpw=
X-Gm-Gg: ASbGncv2ddDA6UvsIZzMG3G7V4WZfhEgACtl6Fulp159uod41xXYERRYX/mQYVBvz1T
	o98udVY0qHi9aCxcKoTLC4P/ZDUTe28Z2iuZfobPDkm9POJdAXYFR0JV3gp07FgQMVL1wIqOrCd
	U8zxKmUp0WhqyBsPvZm8wN3woos79mL1AjttRnGZHuVxV6DXmlDzAHUWawNl1OYmMW4bcoIm1dH
	9lvb6+fqUXS7Og++gv8Xjeub+bXG+O99GyWhQJtTKL57N5LDrya3zjxJZmlCUCggpYo/w9KM0nk
	W0YPs64xRKc4w9NlfhZPlQe9lC7R7KB5p34xICo6Dv2lzW4YaMZrhKWgAXJVfutOcYFflFTKsvl
	P0zcwCKdk7KrfA6239Q/dwHnzKTLGPeh+FknC
X-Google-Smtp-Source: AGHT+IHOApUdbwQh8Jq2dmZDBk7bs8EbJneQ4drv7VpUV5nFeQnNH0S/KjC5HScjLN7hcK+M6+cnuQ==
X-Received: by 2002:a05:6512:31d2:b0:54f:c3c3:beb8 with SMTP id 2adb3069b0e04-550e7246413mr10436047e87.46.1748007642410;
        Fri, 23 May 2025 06:40:42 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:41 -0700 (PDT)
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
Subject: [PATCH v2 02/21] pmdomain: core: Add a bus and a driver for genpd providers
Date: Fri, 23 May 2025 15:39:59 +0200
Message-ID: <20250523134025.75130-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_144046_243667_32F4328D 
X-CRM114-Status: GOOD (  20.31  )
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

Suggested-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9a66b728fbbf..da515350c65b 100644
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


