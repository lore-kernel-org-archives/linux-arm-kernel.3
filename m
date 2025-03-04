Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1A3C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE/c2Fa90XnbMz9AMwkVjT2yzgC+rVUkbGd6dOZFdWA=; b=0Xge+Le5vcNdXVNmk4jzd4J3NR
	TM/JE/Sjks8/VGe/tIqfdbVn+quEGLtAXa9G3LlXlsS1BqYGtZ5muP5SH2lRgAMQB/EaN7U/sNH/x
	PyJ0Nyd4PmwHl8miE9VskV3pSyGNb/0N42gCXlsNqBl4sB6xkd5xcXr6NbqdevnKb9hNjGeQsLv/s
	DOPPeeoym49wOrASL60W4jFNHRIL3bbYMAmnzjHB3o/il3XRRYfJy5TfUQV2byCdwSyEIimaCJWtq
	GoEj/yQllBhSZwAe6EJZsPDLqMY3PuS53qjaoEyGsB7ylRAmwGUedVFaIX2Q8w64NfIej2LV7sPmL
	K5cksQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVnZ-00000005ZR6-1Eka;
	Tue, 04 Mar 2025 17:11:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUWr-00000005HyD-0F2a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741103397; x=1772639397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wE/c2Fa90XnbMz9AMwkVjT2yzgC+rVUkbGd6dOZFdWA=;
  b=AUbGjBHyjed/EKJu4xIGwKli0Z6S0Yl5fAX1E218F1PYNv7NWYunMmhe
   d5Ll2nUu2LGzNyYlSd4qFsB2HvrY94XR0mFrzYopoqXBdLSHKKTWyT2Ww
   cXAbwIphkqq1q4PpCQDa/5y5hHr83ec6sfW248zAsoFrRjBhKaS8Dzw2A
   oZGiEGWHnMIkyVH3MvdQ0oWN9ZyY0uvCBaoM4MQ9f7W6kNABWxf3C6Y2+
   SWKiLH4Pz4BzNctKpcTuNLmLS3mKOz6+R4I4v7gmWDtnXjZYMCCHQ6zUz
   qWGgNCCwMkwpoOpidIYiuqJxAueZIPEf1kZeWQj/smk4AaRFL8Mw9lRto
   g==;
X-CSE-ConnectionGUID: eiMfnn0RQral6d6IjLP81A==
X-CSE-MsgGUID: f3mKrzHHQBqOu18yxaTVGQ==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; 
   d="scan'208";a="42272741"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:49:56 +0100
X-CheckPoint: {67C72124-3-2417938-F0170C2B}
X-MAIL-CPID: 9BB829BBFCA8BCE751FB4D144BA7619A_2
X-Control-Analysis: str=0001.0A006366.67C72126.00E9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD7161632FF;
	Tue,  4 Mar 2025 16:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741103391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wE/c2Fa90XnbMz9AMwkVjT2yzgC+rVUkbGd6dOZFdWA=;
	b=EfIgBlsMg1UVRuBSSkt1gslSFVNMtBmC6X0tFrcjg4DTePGEZ4T54mj/FR/VBkrhgxzUL5
	G9sspy2+dIkmAiGsEhXFiUdsDQG4etKjlqqx6G66sut7cBpGuPqjEwe+f/VIfUSdhB+Mvv
	qWAJ2xifDdXb0hlE1IbZuQF0vw8PlPNK10BBKFaD5/7rVPLC332sbYOAat88iExv42XiGQ
	+nUnGiyneJ6et1RMLU7HvanGgOnJI1gytfvbPJyYTqUqt6tCRn8zcyKsOHge7Qs1/50B7L
	lkRCihdhQGmUkBl7jNAk/ATNwUHEC9pMLEtBrfTOf6GKEVUq0hpnsOlixfBfvQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 3/6] pmdomain: imx93-blk-ctrl: Scan subnodes and bind drivers to them
Date: Tue,  4 Mar 2025 16:49:22 +0100
Message-ID: <20250304154929.1785200-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074957_391754_71CAFF3F 
X-CRM114-Status: GOOD (  11.79  )
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

This particular block can have DT subnodes describing the LVDS LDB
bridge. Instead of misusing simple-bus to scan for those nodes, do
the scan within the driver.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 0e2ba8ec55d75..fe2ff7a457502 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -297,8 +298,14 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, bc);
 
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		goto cleanup_provider;
+
 	return 0;
 
+cleanup_provider:
+	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--)
 		pm_genpd_remove(&bc->domains[i].genpd);
-- 
2.43.0


