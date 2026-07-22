Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DD5C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IoeICiFY2vzSXM+Iy/1wkeuTFUAUTDrBzHwhQ/RHhYE=; b=ZqyGY1eDJEo5XQkjXAQdjbJef+
	NcUvGAzmeKVmz0idKhsOcuQjvqbKr2xWNHTX4xlGaeewAKoWk97S6Wf4C3/o3YiG8Ko5+HFTvdNEK
	YOhb+DJAh3TwVeACtX1GSgVDhvDOfggccV4m7XamUfjcf+4ggjes6yruO2q+qn5XSnc0Wn1MQSvVv
	45Afa0ogtfk8zeu0sgVJ7l19K4x5IVmH3aMNPfrGCidnF8DkBc3OygUd246OVQ2sfIvRsGJgQdXWe
	PUpsFx/8VLti++5QeG92D3yKNMZShqL4z/bHOFhXV6Gx1jJo8A1FmNq8UHoQSRojY1v2yd8PGzLGl
	dBes7WpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVVY-0000000Bgem-479x;
	Wed, 22 Jul 2026 11:53:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVVW-0000000Bgdh-1lUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:53:04 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cc73e322dbso147572545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784721181; x=1785325981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoeICiFY2vzSXM+Iy/1wkeuTFUAUTDrBzHwhQ/RHhYE=;
        b=UvDVExfETOlO+9o9LHV90p3YPm25ZtrVI2wX/z9SVIyOyLRN0Va5CTcJqe+q5R7E/N
         gaoETmRlvmCLLwHNfYvBm2sNnpC4xc33xnsej1wlJ1MoxTSXe9wU/F+i/+wQLRyJVg1d
         aJLaH2itYkdTpt5zZeYTrG5j29syXeM2oIfeYgls6tMXTQk+BURstW/4XFck3o3OHrTQ
         GtNnqXuenPrN+jF5G7+0OgSSHA+lDqmAwoYP3pVU7+Rws+le6yFBwf5yPJKiGYHrnn0i
         1HxDdfk9bS1sNRR1AeYb7U2EPZP8iP50cUo6PNu3bRh4BdO2k2b59YdyuLCVfyMfmt72
         kNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784721181; x=1785325981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoeICiFY2vzSXM+Iy/1wkeuTFUAUTDrBzHwhQ/RHhYE=;
        b=UYl4INcvqILYWnep0AWAv7Ptz+/OrJ0SlaBja3jStI/PyIsFAzirrvrAhScT1jpK4z
         dguPceGF4+P9ahqBsTQGypOLjuTbYQ1YTo9q1Qp6793KPQ4t138TEOMOMphzoCSWUKBI
         kzYY7Vp945PWFNgAVq4deSUxx7+5ssd+LXIJ0YyLgspTF47rKNxbeE3FRJVmhtd/jgG+
         8PWJDox1OgI1IoYc4jzU0YHEwRdvpxHHaBaGf2MhacTlnz21pg3M6F7h/xVMf2AuGwD6
         eJcAdWIC2emUWBXrzzA2ZQUdg032MPX6vNhb4JTTIrShxR9cwdZ6aeiW74nNYhrAPQkM
         nf9w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3FDEz9RHVEmQGyKJt54OwrxSsL55JJkWxFgT3ZS0LpIjvvrPkB4L9pDCQO2SlvhEDUWEeEsjGbyfG0AH8akw7@lists.infradead.org
X-Gm-Message-State: AOJu0YxIvb3r/T+DT/hC7n8k+dImrPz5A9qZrcmNY2ycD+v2vik9nrya
	4r00zj3JWGHBY8z4zlBzYOXz8ShXUoTB4Im63RsH3htJD9mT8OGodm2P
X-Gm-Gg: AR+sD12yM/rCR0Ehv6HofVtbwuPqAlCUtnUvFDZL09LXkArNKCMdm6Gp4RsjxUcW8ts
	cpMJ0ibRH98awI8oTcpEWvkjfO2n45IbNBhpZrtdlUAJbQkF4QBht0IXKx+nBGMrOmWqgT+tSNT
	Wvu4Tml7DUHgt4+jw2d0PrJYmIoPuPK5ZHONOFqtjBGtpo1b7Ljk7bCDMuQ0AMA8iu+WxvB15TJ
	GiRCa6wC2CYi7+0OAj+917ZZ98cpXXvnCqZS80jpiJvzoXDBzIJq4x9U4EAYCjUyHXyNflqN6E2
	csqoCWpdxCQ3hER2RLRg6SxHhZ4gt1yKJ5c68EPLlGyCoZq/UpthbH3vpEQPsENTnGbmIytVOjw
	3YUe3pz20hLmt3lsWc2LSLbXqe8YW3dflqSPgbRhOIrGQMgQzxojicldmK45NuFJ0W1ka8HJVJz
	3RIX+XS7o4VaDO7nUbFTZAP2NVu0ivLAUZAvQyjHV9YZ/bIlU=
X-Received: by 2002:a17:902:e54b:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cf348547d0mr253249555ad.12.1784721181533;
        Wed, 22 Jul 2026 04:53:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6247sm13376205ad.54.2026.07.22.04.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:53:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: rockchip: rockchip_sai: Fix unbalanced clock reference count when CONFIG_PM=n
Date: Wed, 22 Jul 2026 18:52:49 +0700
Message-ID: <20260722115250.62588-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_045302_465956_876D96A3 
X-CRM114-Status: GOOD (  13.92  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

When CONFIG_PM is disabled, Runtime PM callbacks are stubbed out. Using
devm_clk_get_enabled() causes an unbalanced clk_disable_unprepare() upon
driver unbind, as devm cleanup attempts to disable the clock a second
time after manual disabling, triggering clock framework warnings.
Replace devm_clk_get_enabled() with devm_clk_get() and manually manage
hclk enablement around probe register accesses to keep clock reference
counts balanced regardless of CONFIG_PM.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1: 
https://lore.kernel.org/all/20260622005613.21870-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the commit message.

 sound/soc/rockchip/rockchip_sai.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 585e89f61f0d..9a80e120dbda 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1443,20 +1443,30 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->mclk),
 				     "Failed to get mclk\n");
 
-	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
+	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
 	if (IS_ERR(sai->hclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
 				     "Failed to get hclk\n");
 
+	ret = clk_prepare_enable(sai->hclk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
+
 	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
 
 	ret = rockchip_sai_init_dai(sai, res, &dai);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+		goto err_disable_hclk;
+	}
 
 	ret = rockchip_sai_parse_paths(sai, node);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+		goto err_disable_hclk;
+	}
+
+	clk_disable_unprepare(sai->hclk);
 
 	/*
 	 * From here on, all register accesses need to be wrapped in
@@ -1487,8 +1497,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
 
-	clk_disable_unprepare(sai->hclk);
-
 	return 0;
 
 err_runtime_suspend:
@@ -1498,6 +1506,11 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		rockchip_sai_runtime_suspend(&pdev->dev);
 
 	return ret;
+
+err_disable_hclk:
+	clk_disable_unprepare(sai->hclk);
+
+	return ret;
 }
 
 static void rockchip_sai_remove(struct platform_device *pdev)
-- 
2.43.0


