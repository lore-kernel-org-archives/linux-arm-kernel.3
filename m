Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397B9F513F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 04:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qG3UCHbICIKoqorE0OwQsqzoYP9iJFn4dnjoO73bdjs=; b=fbG+KJbtDZm1ZgbRQETw4peimi
	i/fn5QBSZaXgOz+vv2ma9TltqO1ej1Ryko3FAspAKIULeOfXtW46IN6VbMJtBmvBAmA0qpu6zl9J8
	VLfQ3dA2oqerChjtjowMojbRdSDD6RA92eRhKrL7JV80g5M74bsA2yP2U0Fu5BL363XYP3akeAYIg
	OHbXlys+iujFVSWX1M6rSNwD8V+DfhBr9WCQCj1mW7wV9tKLNg9oXOkI9EOhtdPT3sLCQXbLz3nQj
	xlhykWvB0XML/PtQK90EDajMQOvZrrkmNvhGbhpA08hJPUUDrcTXv9eLsznuFVD0WcUGKYBLzOGVJ
	OsSRkkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyN4b-0000000317N-0kz6;
	Fri, 06 Mar 2026 04:46:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyN4X-0000000316n-2Drf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 04:45:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ae527552acso19188455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 20:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772772356; x=1773377156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qG3UCHbICIKoqorE0OwQsqzoYP9iJFn4dnjoO73bdjs=;
        b=F8GIA7GiYSyo95ecRWG0l2S05LC4Kfm+hwNPvlqvfa8I/9rXKMdvNjxIVBOXEi0lzr
         3yfjp0Ir2wkZZF0Nw95KPbdd+TgsTWQ4p8ZRI3LGhifqlMJwv6K1G48PkgLm6xMpAM0E
         7uTC+ta5F78Y7pm/JLr9P3CnW2PdBzFP3sywSLb2JGGnOk3xLsmyBn0mGZ1Q0H4Gh6Sl
         hncLd3QE3u3O+P4yZG+xwFb+P9tDmfGn9haN2nIXR9RypSZf6ObBbQ0s/R1D5oxbiHqE
         Y84fvzv/46QGw+qvlsu8KVeey60nFSHIjjmqGIUC4VIefgsZFRH2uPmAslHXO5LfbRN4
         wqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772772356; x=1773377156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG3UCHbICIKoqorE0OwQsqzoYP9iJFn4dnjoO73bdjs=;
        b=fq7l86L06yryUuRHQD0Pq6txUpXk4MqDnMjlxGx2V7prbH3RRDyOTYdiCzX6llZ8qd
         7yg5yQyS+wOh5D/NQZEvndDyVgMT5/wZluQzaGyxk97gW7uZBak+RUICKj0++Z1jzq1Q
         MS7mZX1m8Y/XxGX3JJa8K8bxaci1AhF/e7XVD/KaNT2G/Tvg1cPEQThr6bc1c/HCZuq3
         7g2uAnB6Nkp5K5Iw/fQACXSrrP1bL9m+2acQ1cU1yGyOluIbXyzvic0Tx8JndiALR1DQ
         Gg7YggO2a81Yvf1tmKG56NJp21oJT9S4uHDBSlqOkGH5o/pivJaWVfdHacz6F914TmJJ
         W55w==
X-Forwarded-Encrypted: i=1; AJvYcCUslq/77USCfzKpst3Q3kZWPfbY4nedpS/IqyGbyzJeDL+lEggdqTF5Kh6V67PEzpi9joQqCkIRtdSCmarggcRN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3TgVONbyBTTJkJ7j5539Ja4j2cFrkszHxREdAT92tnHGHPFiv
	1keSqx7Dg+Ns/sB+/UtXUokmHu5ZKlFVX8TS5VWjbwApKPiVhlaBgkaa
X-Gm-Gg: ATEYQzwFJhHNQN81Qak+b8ibPPL7lTnzHBoAfgYEGjYZDEueK7fyET4yjyUGq4NLChy
	xQGMYuBWCnRy8/WFWxxp9cbFAiPoog+drt9fd7G5tY7jkkStPOm+qTULeWI5srzj4Ii1D0/QXnU
	SiYg45m1tCTln68tYKwEaJ8kux/P+De82i2N5Zf1zG2uSwjLQxlEaD+EDFtV1fMH4Y/P7ihG/ux
	j32HSG2Qmn5UX3lNjXuGABM8+2fk6YVzWaR45xUwKYxuIjHHu+AOBEAUFKaT5Q00jqEbKMuOvqu
	jRnUphD5jS0kxxA2UViNaMMNd3jySI/wD2QILHLPYIShuU7L190NuewW9wEUypXPQLISwO44S21
	ilpHMDpdu2yAlCziqPi8tXOv2JUAIsgUi3iRhCzMyKuacIdAUon2FqRJ5UO2UpszVn7aHvRVDYW
	kWxUSPscovAV3idht6cv8PI9w/BG6QdGVXoKEXEgKLcOgnWb06R8bFYmc=
X-Received: by 2002:a17:903:2986:b0:2ae:8092:e212 with SMTP id d9443c01a7336-2ae823ffc26mr10568555ad.8.1772772356318;
        Thu, 05 Mar 2026 20:45:56 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57cb1sm3927375ad.9.2026.03.05.20.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 20:45:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Date: Thu,  5 Mar 2026 20:45:36 -0800
Message-ID: <20260306044536.149204-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_204557_568891_85D29648 
X-CRM114-Status: GOOD (  14.50  )
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

Use a flexible arraay member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 16392420903a..657ffecc4d7e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
 
 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;
 
-	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_channels), GFP_KERNEL);
 	if (!isi)
 		return -ENOMEM;
 
 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);
 
-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
-
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
@@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(isi->regs),
 				     "Failed to get ISI register map\n");
 
+	isi->pdata = pdata;
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0..99532efa4e41 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -286,7 +286,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;
 
 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;
 
 	struct media_device		media_dev;
@@ -294,6 +293,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;
 
 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
-- 
2.53.0


