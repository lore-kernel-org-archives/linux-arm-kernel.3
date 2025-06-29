Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4AEC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CC9iUQpNk2KWt1DZhVabqrPCsFfxqA98Z3a6X4JvyBM=; b=4ZTT84FTFjbpFZg/Ux+/06NfuY
	gP6tg9VmtSGbtkCydTqJkbtn1BFa5PSMnqtI+luty5ZbMASvflh+aUsZCJW2dOskEygBlk7uvRxOH
	IUtTVid086Vykbv5jnK6VUsw6lJYadKOYGtZthq7gW9oDcekh+zbQU9U+vOAP+6zS6DSjpy9SYaM0
	a/uBFYDRIiiGSxzxcu34c3UDoIEGOEX59FePoxn2F87dzhGb28J8wT9Hh57BOpxvFYl4XvmV4igIN
	yWzC/9OwFryQkwbcjJjXVP0DNeykZsyrxbcpQrrtlMaapgKJlyqRZdKqudqiIAIjiMxLEsYotsIE4
	boGYJQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvxL-00000000Wm6-0AeI;
	Sun, 29 Jun 2025 17:36:43 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvmn-00000000VdR-2Cty
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 17:25:50 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4a44b9b2af8so7339641cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217948; x=1751822748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC9iUQpNk2KWt1DZhVabqrPCsFfxqA98Z3a6X4JvyBM=;
        b=SSgQb/y2JXIq6c1yTcnyOAXlrF2mUjZeVMOtlIofGITFDconNMezVSz2PPbydvLqXH
         nCb5oBcYGD/LxFZVhgDAabmBHfDSDVwL0M9ccK9q/GL2llU3yW5yJPA9g2YyG+jrKlKj
         hUEzCPZhJq8W4RjHhlWxHqBxwhMXcXgu20YM7Y0pSvnb/14DPtAuGUuNy529EpclBGA1
         SoecwCgl/9oTZ5T+M3UblrC7p2TA/tSxU9unvjn982WlJ9HoinYPYsb1sqcAWcNnvZMI
         KgbQoZ9ykLMYSi+5zzHHs1duJAXmaPduHZntQjZVKl2USqqLFANTM2KQYYAyNLsnvC7E
         Vnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217948; x=1751822748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CC9iUQpNk2KWt1DZhVabqrPCsFfxqA98Z3a6X4JvyBM=;
        b=VijP2TDHxKXAMXHjq2UZU1YreTTGlAZqhC8QyIubvFwT0ERjRjTjHEn+hK+eJJiVOZ
         b+gFX6FqWg9towEX/JKJ0zj+eFO/+GctGQUDniRGlUZJBkvPh9YKa2UZatRT7qODmLjO
         fGA5jzNpylKAWSJ9agDEqcQlFiE3ugLghFMYe0PLch/GQSy8B+htNVr5VmRXLbUfJivV
         QY/fX+NAeUUzhBCZGWKIpR+JI33h4ptoN0MEkYCjwTlKb1njw4dUmUbuu0udDOkNasO2
         HpS9ReNegpCqP5pMT3AJGigF692/V5FRav8Nj0zZtrgCrgeBQbW7zrMmfY/AEUvIEhwt
         fK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeLmgWPmJD3Y02g1ijklqY25VmOGV1ZeI+IQ3dx/NZ+Gl9r/hq5blLiyLhlyJEPUvIDhLK3pPPDE3bWrviy4OL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+vpEuDL5kV0I6ymnGYIgnRPbmu7uGn+ni/yCH5Wsa4nAZGthp
	+W/NCGNRN+KqVE+vUqO6XTuehHN9UU8zKJLRh0CPFQ4cgZHtOYTV+wHc
X-Gm-Gg: ASbGncsqm6gRSWsh8Oe1zcLvVFVRmiQlA3UPKe2OeI1HzF1l4RRJDPEfxBz07Cg2IGM
	VVsuKfUbRVRwAnbD9Dti87eQBuFv5EpvxvtMyu1AvRk9cQzvgs3o3nJZAY2TPUPExkMAShirTeb
	Y0cSCVquw2O/roAcapf0MbATKduUXTVshhdHoQy0YAAezl7JKZ0Fh6KzS1otW+IknNpn6Su/sdI
	v3U3M5zRtdYbe887cZLVWpwhfNDpDVoOkUs9yzcoULWvzQhakMQjjCjoBWWuGtVUm/oJ2p/egP/
	8HCMisRoniaO4r1au41wB+Sr49Ix+1z8SrCxeKRLAyH9KO5dIGAZS3QSa08Ml7IC/bnbFzGxRGx
	A5j8=
X-Google-Smtp-Source: AGHT+IHL+yIWTipjXDrBIV1HOTDHYJtyQk3xOUCkDv6eXNSuiH8iXZMcrL3wqtORw+/eQhaCGyQTew==
X-Received: by 2002:a05:622a:5b03:b0:4a7:6e64:a52b with SMTP id d75a77b69052e-4a804b3926dmr128171311cf.35.1751217948303;
        Sun, 29 Jun 2025 10:25:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:47 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Sun, 29 Jun 2025 14:25:12 -0300
Message-Id: <20250629172512.14857-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_102549_569850_80A57F45 
X-CRM114-Status: GOOD (  28.86  )
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
the driver only checks for remote cores running in different SCFW
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
 drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..24597b60c5b0 100644
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


