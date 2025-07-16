Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3B7C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CGRHMbakmgtVzUhbhesoGMHoeYFQSQCOILI1FjneuZk=; b=ZzTMXHR9n+uzd6v6+WUhESfmTF
	XKU3ji/h1/UNqvMP03q28RUQ/QWpIlkYAzQ8IPxuz+rqDBg/a3TX4jw+QRnBSEYc0pg8YzRE51mrc
	wghf1bU4l+FUTf3lD5xFYRFmqIiRI8uKFMWuo/D3L/2GAxTrU7exSX1UV8hH/x9FRH+6V4Hhk6MKs
	+TJy4NAdkRneeiLX8O2Dv9ax0QdRRDZVN6WB7k72XmnxwvQ4ry3Cw2kHJYsl9rAnyPdTbqRepr7q2
	NPnxEDffh40fd/NTHwFKoo/bvHbDTWVDvAGbcp9opkLW3/+rad1XuX6AzMenTfzr5plgLOg5jVOSs
	yPxl1E/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9B3-00000008eGF-0v2j;
	Wed, 16 Jul 2025 20:56:33 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc86O-00000008Xoj-09Kg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:47:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-73e586fcc28so750637a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752695259; x=1753300059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGRHMbakmgtVzUhbhesoGMHoeYFQSQCOILI1FjneuZk=;
        b=AYT5SMKH3MPQVnLwQRbcG6lM+/rw9dLzyikW43xjHXzL3F80SZod7a4mZI4xOf80BC
         8UKBlAe9nDNdQK/6vKH5RczyMl97Pa763vl0H3zvw6ObuD8hg+PA7DFitYPlITHzC0+L
         kBWNWpjuLByQWEE3nva+PldtLV7uQ04dYF8DTv9pkackHltPrSc2dNqSKtXC5RgF7pBk
         Ax6Q/07G9NB8bgZsIVawKahNk4dVN+WE/ySQBQ04r1FDwHgodouqEkU54tpSB1DhFgy9
         BRZGq5QBph5EVsKxCD4MR1t+SctRzCzkyr8x1Z3TSPRZk5Pg9zoIaB6Rznx/OM7pfDnE
         pKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752695259; x=1753300059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGRHMbakmgtVzUhbhesoGMHoeYFQSQCOILI1FjneuZk=;
        b=azb/YE2JvILXF+IG0p07NzQhFW1Txdsexg+eGMr4z2fcQKaNqMfKEpPoTM3z1mLmMT
         4SUgdmGqGcpWZDlWXMUhAwZK/cVPIhMVg1zawguAiv/0G+NYfnFLoV9dEWzO8g/XUw/z
         PTVYpMO7bqLPuMej2ZVXg0bzNgDLUObfdKkJSYVUp1cN3HnZG+g2n16AmoSHgKqJ2e/E
         k9na5sZLC9LNsUk3vVvfJcZl+PX+T6VxXL7z3txumjaByY9cDScQiJRfpFbTQJ8wQPao
         BdQ8LgpLCF5DiGIk1eujg4pvd7NZLGLzAasc+VK79nxAWVJ6AOUCwzFsBjwwc4iOvs9i
         Ghcw==
X-Forwarded-Encrypted: i=1; AJvYcCUNJGL4FKgHZ56ILTRvjYOQ118L7rgXVjmQLXivfB+itaieeMyYOcCX9tgsfOnZ0BS3d9mqtTZ46F4rXCmVVPpt@lists.infradead.org
X-Gm-Message-State: AOJu0YwsUEzw0LxP8po/08ghXT89NBEM0opQZR/ZL1kWEDqGaRL0+Lrg
	/AxTPCAWSY6DE0FNsTz8VmuZIXTnPF15qwt3aPaJBmdECpII1d3os4lJ
X-Gm-Gg: ASbGnctics0XPWJnRX5kkVUIaze1DfznNNRkaELzJxWnjYUV9iJWicpORg0Wo7/VobT
	7Dk3qrZvrIncMmHEQyQ8c15Sd76Xz52NwG3EEJ+IH0/gTPb6YvPjn6D/MZXuGZAEajjwJTvoiY3
	VAGLTCR+4THQng8QS+YGSF8HzLqbNUcKmOHJPjn9eJLHiX3HDWW57hjLjuzVR5LgenQQd9cM4mv
	vwT/AfHCfVhFw1LvCQ/czCrqNsUynCu554Ev5pIY/6FRDpw32M0YdBhj2MgmDUycag/Ek9dX+ss
	khCyRzKp+HChTDl2H+gO33k7CbBNc4K3013KMlb+Qjec74bM1UhJC+vsNs5LPfbBD5aLDF98PWb
	ITqzxlTTz1Mn2pxoV4Kr/Ih4cDJ8K1FURLWXxEw==
X-Google-Smtp-Source: AGHT+IFtuXI2LHUt381msMlgUjQyWjsjC4freVrIjMdBLr8CPfK8bhqR6K4a0vFEIy+s/Zb2bC8y8Q==
X-Received: by 2002:a05:6808:4fd1:b0:408:fb4c:85ad with SMTP id 5614622812f47-41e2dcc2e05mr602994b6e.4.1752695259074;
        Wed, 16 Jul 2025 12:47:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141bcd27b6sm2954810b6e.29.2025.07.16.12.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:47:37 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v8] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Wed, 16 Jul 2025 16:46:38 -0300
Message-Id: <20250716194638.113115-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_124740_077877_F9BA5D8A 
X-CRM114-Status: GOOD (  33.78  )
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

When the Cortex-M remote core is started and already running before
Linux boots (typically by the Cortex-A bootloader using a command like
bootaux), the current driver is unable to attach to it. This is because
the driver only checks for remote cores running in different SCU
partitions. However in this case, the M-core is in the same partition as
Linux and is already powered up and running by the bootloader.

This patch adds a check using dev_pm_genpd_is_on() to verify whether the
M-core's power domains are already on. If all power domain devices are
on, the driver assumes the M-core is running and proceed to attach to
it.

To accomplish this, we need to avoid passing any attach_data or flags to
dev_pm_domain_attach_list(), allowing the platform device become a
consumer of the power domain provider without changing its current
state.

During probe, also enable and sync the device runtime PM to make sure
the power domains are correctly managed when the core is controlled by
the kernel.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
Hi Mathieu, Ulf,

This is the v8 of patch3 from the patch series:
https://lore.kernel.org/all/20250629172512.14857-1-hiagofranco@gmail.com/

As patches 1 and 2 are already applied on Ulf's next branch, as
requested I am sending now only the v8 of patch 3.

I made a small correction into the commit description, s/SCFW
partitions/SCU partitions/g and updated with the check for the return
value.

I hope this is ok.

Thanks!

Hiago.

v7 -> v8:
    - Added return error check for dev_pm_domain_attach_list().
    - Commit description: changed to use "SCU partitions" instead of
      "SCFW partitions". This is more accurate since these are hardware
      enforced partitions.
v6 -> v7:
 - Added Peng reviewed-by.
v5 -> v6:
 - Commit description improved, as suggested. Added Ulf Hansson reviewed
   by. Comment on imx-rproc.c improved.
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
---
 drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..a6eef0080ca9 100644
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
@@ -902,8 +901,25 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
-	return ret < 0 ? ret : 0;
+	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
+	if (ret < 0)
+		return ret;
+	/*
+	 * If all the power domain devices are already turned on, the remote
+	 * core is already powered up and running when the kernel booted (e.g.,
+	 * started by U-Boot's bootaux command). In this case attach to it.
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
+	return 0;
 }
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
@@ -1146,6 +1162,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -1171,6 +1196,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
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


