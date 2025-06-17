Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3111DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 19:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r2c8EaAsxVPli8mnl+dP2Lkz2s+hxXrFoO6K6wz64E=; b=epBMMP6Gikkl5LN5geegl4RQ7D
	F7OB+EVR8Ljc9X6uiW/4TfvMilo0RfNSwC+PXu7g3AJB8PMlUwbd9LF8VitezZZ7tif4LOuM93dsJ
	lwTGFkXGC8Of8nuqwV7KiIkM45XJNDgNmZQpnocV/rF/9esaNTv+OBCPAm83K41q5IAlTOnZCEiwd
	t+N/drg9akxeiPYoFIbDkrDVGo1pLqbCwni+vb6/OWOYfFgDZ3CJbhBc2q29cNOoPh0Ffrgcxf57o
	poYuwrH51mpOBptPE06olphxTX/LVTUrN8ePcaD8TYUFnqaWtlufbLS2PswHDZngFkAA+9Tn+EmTW
	YFOAK1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcEw-00000008H5G-3mam;
	Tue, 17 Jun 2025 19:45:02 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRc6P-00000008GCV-1dlB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 19:36:14 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742c73f82dfso4794393b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750188973; x=1750793773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r2c8EaAsxVPli8mnl+dP2Lkz2s+hxXrFoO6K6wz64E=;
        b=kxfXguG8knDip8/yFoV72RUnNOShldcEZlhSDOG4davWd5643isobc/0Yqa1u1FvXD
         CU+GpvJ3biRF/dbX5GmWevqlYYw4Feia+BgliyoHHnk11dnAFmyw7zMwwAMsIz0ARNOJ
         hL/fKQBQtHGW+5oxVHd6rI2X/L8s3UUptTOBH/2JqbKqqCm8QiBrQimLwCSg5pjP8Sln
         ite1VYfyZreONFb0SmqaaFRniLtLTS+wSfOLrnNWNW7DHmFmXon2WDt0W+SLvVkX9jyX
         8X2/65HRL9YkiwgW8eEdjPR4qeq/F7yJ+BFw4K8Mx//zOduLf3/ON6B65TKGS8IGvis/
         DGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188973; x=1750793773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r2c8EaAsxVPli8mnl+dP2Lkz2s+hxXrFoO6K6wz64E=;
        b=T2feLWRMv2dOFOy9NgNeIgOUFCtZ5pa8cFSqJ428TmvE0idJZELA1IGTrAM8Si8vvu
         5RDJvLTNThMpUZfv91evYylwHJ2XmHOBtGpHNYggqWfft8tUP3uQRyJEdD5uZfYQTJma
         7z1EoUensKs7UsR8pfwX5wNnYYDB7UEZuNbUDtX/ly4NTUCfWV52iSDwTjXc/y5U+R35
         3xOiKmqqmsbkFNgpUVPUOuOznwHXZgxXUX1X4mP7jGN8d3QB1ZHomFMBd72cPLjhD8Rh
         xzs/zJ5erunVZwuR7hIi29g0jMhyyYHEMf0pYSVcVv4P3qgnvAqS26Ex68nXHxuaG/95
         /CLA==
X-Forwarded-Encrypted: i=1; AJvYcCXUX5iUG9raY3jpKfjIjkd0JfNhgKXMeJSnIOnSD0H7AtTdTAaJcIl1JVRvEmfapqefZDsNp0cBvbI242Lxp1PZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy54DbyPFTEr/Fc2eanYAoWTyic2RMKZQUy5P0wbvzskUAtnoNX
	ru+Qp3qPGwFqx3HVruKO/IsaTcqDh+sdi1MjJrKYJ3wVrhM70UFfS7sk
X-Gm-Gg: ASbGncs9Nos6wLKzZX/ufb+39dI5IATmIs+VsD8oMxCsk5sYW/OPvnQzRvQldigPJdH
	He5RoykiX6YvgUgIfAsAAUYkpyFING6luBApXHrYtwmNhALs0S/T7yAu+iyMhtIRYJK5GB9ct6A
	GYajJzB8PF0TTR6Ra+cLIK0r1AcQgPrapIVpfTzVabzC6IWoEzVJDWXeivcHnZ/V6UalAgb8j4K
	Td768gX3RKKs9+TCj2I48fqQVlmdYn51q+51xFjKfV36e7H3I47YlJUrDgsBb0cNZbuvRRbEDsj
	roI9yVKvVlDJLoU+NuCu+kup1aWreTW/TuHp0xUCxgIg3/gWg63hLhRxDRnx6l+NeqLu8GlYyeI
	Yp5CaRgde
X-Google-Smtp-Source: AGHT+IEcTxTFfNUX47ya/EUrbwJwh97FMbsvWdj3uruF5I0lImwMUF7tir/4Fz62IdKM4n1FplyKAQ==
X-Received: by 2002:a05:6a00:14c2:b0:742:a77b:8bc with SMTP id d2e1a72fcca58-7489ce0cd46mr19370746b3a.2.1750188972450;
        Tue, 17 Jun 2025 12:36:12 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7340sm9648582b3a.179.2025.06.17.12.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:36:11 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 3/3] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Tue, 17 Jun 2025 16:34:50 -0300
Message-Id: <20250617193450.183889-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_123613_431361_82FC8280 
X-CRM114-Status: GOOD (  27.10  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

When the remote core is started before Linux boots (e.g., by the
bootloader), the driver currently is not able to attach because it only
checks for cores running in different partitions. If the core was kicked
by the bootloader, it is in the same partition as Linux and it is
already up and running.

This adds power mode verification through dev_pm_genpd_is_on(), enabling
the driver to detect when the remote core is already running and
properly attach to it if all the power domain devices are on.

To accomplish this, we need to avoid passing any attach_data or flags to
dev_pm_domain_attach_list(), letting the platform device become a
consumer of the power domain provider. With that the current power state
of the genpds will not change, allowing the detection of the remote core
power state.

We enable and sync the device runtime PM during probe to make sure the
power domains are correctly managed when the core is controlled by the
kernel.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v4 -> v5:
 - pm_runtime_get_sync() removed in favor of
   pm_runtime_resume_and_get(). Now it also checks the return value of
   this function.
 - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
   function.
v3 -> v4:
 - Changed to use the new dev_pm_genpd_is_on() function instead, as
   suggested by Ulf. This will now get the power status of the two
   remote cores power domains to decided if imx_rpoc needs to attach or
   not. In order to do that, pm_runtime_enable() and
   pm_runtime_get_sync() were introduced and pd_data was removed.
v2 -> v3:
 - Unchanged.
v1 -> v2:
 - Dropped unecessary include. Removed the imx_rproc_is_on function, as
   suggested.
---
 drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..b53083f2553e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
@@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
 static int imx_rproc_attach_pd(struct imx_rproc *priv)
 {
 	struct device *dev = priv->dev;
-	int ret;
-	struct dev_pm_domain_attach_data pd_data = {
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
-	};
+	int ret, i;
+	bool detached = true;
 
 	/*
 	 * If there is only one power-domain entry, the platform driver framework
@@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
+	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
+	/*
+	 * If all the power domain devices are already turned on, the remote
+	 * core is already up when the kernel booted (e.g. kicked by the
+	 * bootloader). In this case attach to it.
+	 */
+	for (i = 0; i < ret; i++) {
+		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
+			detached = false;
+			break;
+		}
+	}
+
+	if (detached)
+		priv->rproc->state = RPROC_DETACHED;
+
 	return ret < 0 ? ret : 0;
 }
 
@@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_enable(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret) {
+			dev_err(dev, "pm_runtime get failed: %d\n", ret);
+			goto err_put_clk;
+		}
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
@@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
+	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_disable(priv->dev);
+		pm_runtime_put(priv->dev);
+	}
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
-- 
2.39.5


