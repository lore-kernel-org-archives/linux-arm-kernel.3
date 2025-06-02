Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA0C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhKP5iYORRYNLEnbf33EP9epGoMRKymXdxcO+qLp2CY=; b=D0Bz6xjYq5b7w6d9xrKR+9JlM2
	pMwlQNpGTmBpFBTAyD07/a772y48z6IDhGbdC3AwYPsXfd5Yxx8pOTgmoz8ykRlUVH2DX/Da1VItP
	4F8YK/xtLP+IbQj+RPGpB/j68mF3182oaOw2As+3YirP3XNAGxANscxK51NQJH0MnA3HSZZhdNRE4
	3CX1XaTHufWgNEGO45JoeVA7o7Dio6pcYSXEwdnZz3LIdbqnHYjHR1nGJck+g4lmv0Mju82LQ3bXM
	Lho+YLdwAeYcWRFaTMKOYWLnmLJZNjIfaNgjfhKRVY9mJ+AmceoclANKDABRflntDROGVKjYfUumE
	oROY3f3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5Da-00000007StP-0EDd;
	Mon, 02 Jun 2025 13:28:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM559-00000007RwC-0r8f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:20:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23035b3edf1so38733655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870402; x=1749475202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhKP5iYORRYNLEnbf33EP9epGoMRKymXdxcO+qLp2CY=;
        b=K9QnCNrkioEZzxwytNP1TuryprpEi85Wgy6Pu0mhoG9BuGTuqGQuSYUxmUSdiwfLks
         ZxBghlO2oF2m+5KjWRoTdfeMkZq5SPNCBFEmft0pXoAkSbTjzLpi9iVDG8p6tdCm6jVH
         /RNzlyx+onK4mEkhOG3xOYEy2pAOEZ3/+qm4tIRHDrkV1CLp6FTVUIslfjQEpeaLiClz
         5JoosvpZQSclvrjTtw+gsb9VwHuidYvtLvYmkdbXMFyvSt+3J220A3A3NQJ+BnLHaOzq
         AetW7mTzp/PGCfTu1DxDq4hvxwe8RVcHTk54NkiUQ7jGFsZlCmhMmHSCEvUKZR0OIF2Q
         H7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870402; x=1749475202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhKP5iYORRYNLEnbf33EP9epGoMRKymXdxcO+qLp2CY=;
        b=IiBhgXllQP/J9gTmQI02kV3VV0+DOKEGT0VpvXC2vwerOZo8InJh8n1s4IBhxse8Cy
         arbcJQqATQaMsE5f8c7tgeSyrUIYGaF64NNuGMLh4zZa8zRsoyvYMdvut7MYOKBn7TS7
         SxzNhXzHzyJMvVOQpe5ouimid7ig8dujeTCIugyfGi0HpucYlYt65MY2Aj7mgJGJxZif
         aGOLHrpTM0nuWsxoBvJ48UZ966mhcwoyhjKmGnyA62SiSWeqt+GYY4JOhF4QIbn19vu2
         4xhrHg9936eYg4TtzZX25R5hnDwEBLTKWXzZShbENfRanMkyVnAoU9SlEYTTBpaxecbR
         lCFg==
X-Forwarded-Encrypted: i=1; AJvYcCXzbQValqBVjJvA8U0x9ttZol3RpqvxAi9OrIRUUAm3y6BYzNL5ljLqt8rIilf5teBqaIRiLiQnOoRtDlKxy4R+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfy1HpmOdC3aARDQMQRif5scXriM0RYD0VxZ3LyJ5CRRAfubWt
	+mP11viB1Xpij/OkcUUWJWnuLd4Rk2X52AVrvRa7gtUYv6mr9umXPpoD
X-Gm-Gg: ASbGncv7zv+DklRqMLPg2c6mXFXQSy7OtMxl6Ph+Vb9EJFh8MZeEv/BeqaIAzL0QadV
	PPZvS3VwgsJRDwMkfG4fGwFH12Bkm00jEkMb8u1v6At0o/kT6mlCUcRYgFu06nublX2WjKbIZiD
	mjWLZ5A9udFDKy+59LzGyycggLy2yil1Kj1LDJg0/TEeJocv+Lcjh/CebJoWcpqdKQ+b6FLB4Lt
	RHe9fXcu7w0M1TPRR1q/TwIHLGH9TzIXsnJYBW82e8lIVchpVQt7TjyEyGJua5VEzFsnW4sZ/7t
	oZeJoRhRx3YZLSNaGzTsIAxeGJJrQf60FLqSeOtDj+4dow/aKwWUNqFTVmr4RTzUiY7DyfqQDQ=
	=
X-Google-Smtp-Source: AGHT+IGpk0MW40KUnLGhZi6aTcs7hziCgisIwOKdVotPNVMy0bYaTAXay/v52EDp38MmY2gyBOvaiQ==
X-Received: by 2002:a17:90b:5344:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-31241e9846dmr20882041a91.33.1748870402169;
        Mon, 02 Jun 2025 06:20:02 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:20:00 -0700 (PDT)
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
Subject: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Mon,  2 Jun 2025 10:19:05 -0300
Message-Id: <20250602131906.25751-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_062003_246584_2F3B772A 
X-CRM114-Status: GOOD (  25.91  )
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
v4: Changed to use the new dev_pm_genpd_is_on() function instead, as
suggested by Ulf. This will now get the power status of the two remote
cores power domains to decided if imx_rpoc needs to attach or not. In
order to do that, pm_runtime_enable() and pm_runtime_get_sync() were
introduced and pd_data was removed.
v3: Unchanged.
v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
suggested.
v1: https://lore.kernel.org/lkml/20250505154849.64889-4-hiagofranco@gmail.com/
---
 drivers/remoteproc/imx_rproc.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..6f9680142704 100644
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
 
@@ -1146,6 +1160,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_enable(dev);
+		pm_runtime_get_sync(dev);
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.39.5


