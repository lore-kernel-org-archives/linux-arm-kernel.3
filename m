Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB8EC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AuC+j/+IsbYylelRyqiT00La77hywMse6Qq0j4Ebms=; b=hqHcgcbSkq2REYJJY4bSF6JRZL
	uYkoUFLURd7wAEFe3ur1x5fRh5JPBIuxfy7oJrDhYsBfLS7cd352WmAHoWzJBkQN21KA2lf1Mokfz
	7exI/e8eSR/b/MUpXu6c/M3RViz8qvubHzQU8tdnYTexYUX6wYmklZNw6rTOvOLM+wwzt1KOXyX7y
	aeUyTHeLcms+AEaL476iBrwWES2yxkvZzrGwrhxOsLCGqpMhwTmWADN/6SWWSMnqfqANfa2VdPF21
	ZJveDlLalRN6GW66OCcAmYkRHmIHMSoGVM7IKAy2dDm3LfSVGqWgqB609Za0v39LssUIXYQcAE/zZ
	3n1RSXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwSk-0000000D7bX-2C0z;
	Thu, 26 Jun 2025 23:57:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUudH-0000000CtO5-0w6s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 21:59:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23508d30142so23646905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975186; x=1751579986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AuC+j/+IsbYylelRyqiT00La77hywMse6Qq0j4Ebms=;
        b=VyTfFDrDJApADJxDFiwAkmPkNg3tgt8S4GNx40/d0/hsPrND/76+Uil44whwJ2VirX
         XPGyGD19WJScn3dJmMZXBsl/6I2H0Cl8HN+kSWGp69kgMVuJZ9m75iPMZux8bnnJPc2F
         lWug3mmfy+f20t0FWsyjKAgT0vmoIw/hbuEHsHu3bn7hvVBf7s3Vwbq1ZFiAdwrNcd3f
         aLulr8hmrDNMGSmVCRp1k9wRswJAid1UPu+Dp+NJkyK282nBLRLoB8eEeV2wZTdFHAD9
         EjmI0qBCRm/vibx5nZytq86PU2wcA2Pfu0/BLvKm3oNEgpM8RHbdWKZ6UBq3XKJruffo
         ru/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975186; x=1751579986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AuC+j/+IsbYylelRyqiT00La77hywMse6Qq0j4Ebms=;
        b=SC31EnyVd4qFJIsgejQS6xqp9M9XMDNb32ijo2BqfxujgrsmqRrbUaVcHce7hKVqKi
         xxcsBj3N185TwpOqO98iF0dd2wi+vOj6TlOxLdQEP1hq5vMOQQ+DWiBDU4JSpKVsVlIp
         H9XLl0FtSkqwNh1dVZAgiFdqs7rUIP04qYvCeDFGIjk22txx49JMuZlRLCRMkNtf0z/h
         EhRdOFQXVrSvYclyQ8vhmTF0YvHSuWVfZic2e0yrHXf48bs1xc0caPIqwMzysV6nmk0K
         al71hAFMbEK9mJQutHP1CVcEwBMcDnyREw02TrISX//sYzVA0C+pqJNwH1cFXnpRSasS
         piLA==
X-Forwarded-Encrypted: i=1; AJvYcCVmK8gRCVwz6UNo3lYulOIddwbrMdPyDKUJ5nosqmESEXQvoFFAOi686rSiHrYJC1G1lDfQzbyztcFlUwuRNAns@lists.infradead.org
X-Gm-Message-State: AOJu0YyNfB6h26a+JpTsW0uIV+XCWXr+z5xlAJMSE18zeLLL3EtIjgbw
	8w3Qinu15CeRx2tSOKkMqVD1k/tp40hYc5LuLuERIQRbt/asumSPq35K
X-Gm-Gg: ASbGncuB73OKoI/uiTYh0nfiIAPzWjoIyPXqf3hu2todiYfcDDxjurwThhxLUveU1Ag
	WQbR8wuEanCPhAieN4YmqVbH7lPmlbjuk5buiOL5OGW3AVF8iyL+2nkb3IOxeUTATrHqtwPLrtC
	n50otripAQ6ScX2dbeIB96S32Za2LU3buMAXT5HptZ9clH04R85dG9iYQiiad3MB8Qn+Uke0JIX
	P4mC4MsE28TwhApBjH91uYvKPtL+iqx49cjAvPnie0ZpkWda9c3EiR9YXxOHQ/liaPBRQGX9wPi
	W4OIvg3NZhBKPj3kqx1Y/iDu0iuxXSAoQ7H8ezL6GPbfVbMNWSpNFxHOUsBkYoXrNV3dRUiksmQ
	6v+M=
X-Google-Smtp-Source: AGHT+IHYm6yWXmePXx+iACWxwFDVihZU8YA/nUsAgOctnIRwFpQL3m8bnSqHAPDOWVIimwF958Hqrw==
X-Received: by 2002:a17:903:19ce:b0:236:6f5f:caa9 with SMTP id d9443c01a7336-23ac4605d7cmr12135545ad.32.1750975186333;
        Thu, 26 Jun 2025 14:59:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8b9sm585275ad.118.2025.06.26.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:59:45 -0700 (PDT)
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
Subject: [PATCH v6 3/3] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Thu, 26 Jun 2025 18:59:11 -0300
Message-Id: <20250626215911.5992-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_145947_264380_57701671 
X-CRM114-Status: GOOD (  28.81  )
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
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
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


