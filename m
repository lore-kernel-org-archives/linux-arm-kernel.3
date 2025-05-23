Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32ADC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaodTG452ygjUfeAqfzX0hcEID7mM0/biHJ7FoGpgVo=; b=XKk5hnWQMAgvS7xPSbQASSdHxr
	kM2lHI89yVaKeiDcx6yKRj62NQ6VOQnA8hWYsnirBqgBReqT4FiWLGLHO1TYpygupeuLkzmcXCKZw
	rcUVTQU6vJgCcuzvk6WOpxhrWdlHCp1Mx1Q+TwDQNY2nA5bi8JKz0eF+8dHoxuRkZQmPiULZ01EU0
	w4BG/W75zv1Hj0t1ovDY7ltGTkRRlDYAGvC6pidzedXygYsEsko9+FifXTGVYYVp/8n9jQNz2yRC0
	FkZ6qSlMSmMp3AC8p0nTK1Y1bDqbjJQOcR4KZZvwaUkvsatp2i8yoxD5Oeh5BDjgV3gEX21z+u0Pv
	O28o1FCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbH-000000045ic-2DhE;
	Fri, 23 May 2025 14:42:19 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdv-00000003zKi-172I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54998f865b8so10032066e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007657; x=1748612457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaodTG452ygjUfeAqfzX0hcEID7mM0/biHJ7FoGpgVo=;
        b=c9EIif8h/DJIUS3bFp/I6DyXys/Em0G87TWy2dMY564aVSbos9JOfXqNY7UCh0rDys
         NuOfRIYYt5NoF5lV/7h3MNnsYzqOwwNe0hbhCUSvTMyY+6HZWeVdOFgBUTr9tvgIT+to
         0qMzUdkjk9EexEsq3MgJGzRpvgeETWPLiEpbHRSC0TkEWEzTV7PlXdKJMhE26N9BVgo1
         F9VArwh8dGmLxjUeUCWmb1vXelIeC3QGtSe95CQuX6XElD8xjn+R47wM385OyFkPa/Pf
         3QJ3Gj1HurgN7dulRlVIhejEQMuABIauOWoTxCswUctjvTdfmCkZ9xSQ6YBWK/RMEZoY
         dD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007657; x=1748612457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaodTG452ygjUfeAqfzX0hcEID7mM0/biHJ7FoGpgVo=;
        b=KQ56RCs/ZLbJ2jrutcyRGXouy23QqKDO75vR6pVbikJO+dRIwL3CG+KBv++OljoOA8
         q90aKyVM1evFYOsYULkTDxoAonOeFSC/+UEvvUyTOrFh152rmjgv3unaylQRdkGNrUEm
         cGB/08Jlugcdj/+25KNRM2SYPOztHPGjq34l5XhXTv6YDYuX2QjXf2D7tzgQoz0Hfq1m
         rATEu/z3SoyGXxGePgIoHc5uYq6T2I5Sl1Hsaj4sTv0WVGUeIYFOEt/myV6UPopkgoUc
         my9ubUlN4lI3nYlmSfv08xaXdoMUWsA1t3Y02/ZFSQqlE3/lyDTIYwizAj2UbN7NmB5L
         2UDA==
X-Forwarded-Encrypted: i=1; AJvYcCU//8M2cdRuSv19gVXVp0S73oe8Q0etvlnlom7vLUMNbEOajBp/N9lR7i34pMT09mdVNlbalVON3dg0G5nDkrfT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2T1ljNGXdprCc2ABL6toGxLysQ3ZTsQo0Lsfw45W1fnmwA/rB
	fs+wBJfMoFfa+vA7RhjpnH1NygAdc97sRhXf0Bjt5raI/b5yEuXstnAj2mh9rn9au7o=
X-Gm-Gg: ASbGncuiVeO6CiSm9fj7kdzqbK1K5rYcIDAyjjQoq/fzKDzw4jCcV4p/2m6Re5iRgVb
	iSBRpc6lfhMt9PdtLMDxrqH7CvbWWUJeC0lcst8n3wKlNmUvuSx5WO+2Rzx6EGpvC8dPBPE0VRd
	U3NeAaAj6ECapL8mQ065iQgSfYJolQd8Gd9SO57POOHR4aOhhpJLnrKmudC7NGXKG8IXb2qwcTm
	3h9EtI11Ou9rmKZa+kSHLoV8cU9Bjg35lCi/i4aHTUfRN9iukLF2IC2B7+z70a5oAdVEIQOzZ0I
	HrwLr6NF4H+Gfv6pCE5lk/vUrc2pAyRSXE2+uMdze2j+RNCiUJips+lwZzbdgoR/tda3OeYY3fm
	6n/ztdv5WzaMcKsxq6cm2nyFN7w==
X-Google-Smtp-Source: AGHT+IHrYinBpOd90/7cqZZUAtcZLCgKCB9acewmFqtCkeLzwOOJRxqmBPoVSqry9v+2LJB1zYOmGA==
X-Received: by 2002:a05:6512:6081:b0:550:d534:2b23 with SMTP id 2adb3069b0e04-550e71d2719mr8188649e87.27.1748007657233;
        Fri, 23 May 2025 06:40:57 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:56 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 11/21] firmware/pmdomain: xilinx: Move ->sync_state() support to firmware driver
Date: Fri, 23 May 2025 15:40:08 +0200
Message-ID: <20250523134025.75130-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064059_304464_3BDEC667 
X-CRM114-Status: GOOD (  18.88  )
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

Rather than having the genpd provider to add device_links for each device
that gets attached, to implement the ->sync_state() support, let's rely on
fw_devlink to do this for us.

In this way, we can simplify the code by moving the ->sync_state() callback
into the firmware driver, so let's do that.

Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c            | 10 ++++++++++
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c | 16 ----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7356e860e65c..a91a0191c689 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2100,6 +2100,15 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 	platform_device_unregister(em_dev);
 }
 
+static void zynqmp_firmware_sync_state(struct device *dev)
+{
+	if (!of_device_is_compatible(dev->of_node, "xlnx,zynqmp-firmware"))
+		return;
+
+	if (zynqmp_pm_init_finalize())
+		dev_warn(dev, "failed to release power management to firmware\n");
+}
+
 static const struct of_device_id zynqmp_firmware_of_match[] = {
 	{.compatible = "xlnx,zynqmp-firmware"},
 	{.compatible = "xlnx,versal-firmware"},
@@ -2112,6 +2121,7 @@ static struct platform_driver zynqmp_firmware_driver = {
 		.name = "zynqmp_firmware",
 		.of_match_table = zynqmp_firmware_of_match,
 		.dev_groups = zynqmp_firmware_groups,
+		.sync_state = zynqmp_firmware_sync_state,
 	},
 	.probe = zynqmp_firmware_probe,
 	.remove = zynqmp_firmware_remove,
diff --git a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
index d579220a4500..b5aedd6e33ad 100644
--- a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
+++ b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
@@ -153,14 +153,8 @@ static int zynqmp_gpd_attach_dev(struct generic_pm_domain *domain,
 				 struct device *dev)
 {
 	struct zynqmp_pm_domain *pd = to_zynqmp_pm_domain(domain);
-	struct device_link *link;
 	int ret;
 
-	link = device_link_add(dev, &domain->dev, DL_FLAG_SYNC_STATE_ONLY);
-	if (!link)
-		dev_dbg(&domain->dev, "failed to create device link for %s\n",
-			dev_name(dev));
-
 	/* If this is not the first device to attach there is nothing to do */
 	if (domain->device_count)
 		return 0;
@@ -298,19 +292,9 @@ static void zynqmp_gpd_remove(struct platform_device *pdev)
 	of_genpd_del_provider(pdev->dev.parent->of_node);
 }
 
-static void zynqmp_gpd_sync_state(struct device *dev)
-{
-	int ret;
-
-	ret = zynqmp_pm_init_finalize();
-	if (ret)
-		dev_warn(dev, "failed to release power management to firmware\n");
-}
-
 static struct platform_driver zynqmp_power_domain_driver = {
 	.driver	= {
 		.name = "zynqmp_power_controller",
-		.sync_state = zynqmp_gpd_sync_state,
 	},
 	.probe = zynqmp_gpd_probe,
 	.remove = zynqmp_gpd_remove,
-- 
2.43.0


