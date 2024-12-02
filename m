Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA685D10DA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 06:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=; b=KTa0GAk4Ovbul6uN1hoSqWBaF0
	qYtzyrf5pP5TRUbv4U66b8wByO1ba00QJcsWt33abbybjv+ExTw10ndOLbFYI4Pv5/IyMesj+YTkv
	wc7aPn2AQchVyJ92mWfJPuJaD2kz2eNCei/xe1At6kL8t1+TEwhWTGt5SdyY/zQgSkyRlk5rzZ160
	ZSvvVT4d3pawwblvv1aawtRsWxbFFcLqlwfMg8+Dt57w2WRtAJaPE4UHMvcuTOSt9LDjovdVZFK31
	GR4vIiikzfugNUmCiPdh9EY5jIswks0EM7DNYvi09AV/hSQtxv77u69NzPQHEa3zpoDFfC9mziNag
	iGzax+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHzw6-00000005C0C-0vhA;
	Mon, 02 Dec 2024 06:29:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHzv6-00000005BsL-1qwC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 06:28:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2154e3af730so16228705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 22:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733120911; x=1733725711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=;
        b=e0dGD0Bv1DgAE77AdS/D9E6F+0UeqX2HITjtLO8R9enjs+OSnGOlkvRRmBI26Z5Wzf
         nci9AjjgCFF6nZ7DyAC9O0iDqQeJuQdKMVUn7PUXfKLPj96NCFuBP6k1FKEHD/FkHonw
         dBjwbjIfRJtSeGkzOUJx07U0BuLU2485WVAi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733120911; x=1733725711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=;
        b=ouoBMGMSnT/gY1Nk0OqEuXWCljwrxbWzrzQGPGeuZrADufb+mDqWMjuAuEdH6kAxXB
         cMquVO46dlu7gPvU6gHnHRCeT53Jt4RwyA/Q8rxTtnYU/Uj+E2wQRbWOplAOnyvsfbVk
         EfitMx2I20odTttdmbsARsw70qheZmVSc2DhZgNkG+OxiIsCwS9Vx97k8XY2jNpn2kfM
         XW2PgkCzt+K0O3PYBMRB+rraGj4N9OdYW678/o62vEX/jpDtpYuRP8McVZ1y1LEuW12X
         VL03A77ngfWX6/5+dRDVAX5Zn3wfZiOYvNv+l7OUuGrtQMEyNz8JUPZ94sT935gPWY7m
         sHqw==
X-Forwarded-Encrypted: i=1; AJvYcCWIWwYdDKWZ0tX84ZLV0abN2D9+JZFx7+rUFob0QuTNX8YNvSLXAkhbl+Aue5sG5v7ewgDsQ0MVWhKvNLW1PKSf@lists.infradead.org
X-Gm-Message-State: AOJu0YwO8HIA9zY/F/G6HsD2g8FxotgjWAWZ7zRUE1uXdyJY0t7M2Au2
	FVGyjJwaKsDu1uMayP6EmR0tCDCzVtzDYDHaSKFUBmnIVtHkmkhQlSfG4AIKAg==
X-Gm-Gg: ASbGncu4Z91I/XSdA+6VxxfUM6nWmvjCk8seVrvzIGH9nuqPnPSsoXz5w5RB9fRtrmT
	UsKLDSQ6NG6MeMfe1kHURyJQEnXy+WyjvMcz3V3kciuUpk6M2gx+5ntVv7vElx5SIm1yynD4rzG
	mc8OTRss+xcdw8/azdtpvcDrWXmWFbXiPajLwh8UTLHsxvdrZksPQkaXCfmcVflUNcMXx2UuZhI
	QHd+dluSu4K5roRsFsK5ItLB5xoVz68L/0gD5N3YlpD5CBACS2I9oKTsrHa86TSWP6U
X-Google-Smtp-Source: AGHT+IHrImvV+P3fnp6O9oKMYzWe60hrfjJ4izSDkEkKWNLOabp7zSbgf2dW9C8Dph+qT+k/E/6L3A==
X-Received: by 2002:a17:902:cccb:b0:215:89a0:416f with SMTP id d9443c01a7336-21589a04ec8mr55693695ad.30.1733120911505;
        Sun, 01 Dec 2024 22:28:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215361fd5a6sm58878555ad.94.2024.12.01.22.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 22:28:31 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
Date: Mon,  2 Dec 2024 14:28:25 +0800
Message-ID: <20241202062826.66619-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_222832_477026_41BEA1D7 
X-CRM114-Status: GOOD (  14.06  )
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

When multi-core SCP support was added, the driver was made to populate
platform devices for all the sub-nodes. This ended up adding platform
devices for the rpmsg sub-nodes as well, which never actually get used,
since rpmsg devices are registered through the rpmsg interface.

Limit of_platform_populate() to just populating the SCP cores with a
compatible string match list.

Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Cc: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 0f4a7065d0bd..8206a1766481 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_clus
 	return ret;
 }
 
+static const struct of_device_id scp_core_match[] = {
+	{ .compatible = "mediatek,scp-core" },
+	{}
+};
+
 static int scp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
 	mutex_init(&scp_cluster->cluster_lock);
 
-	ret = devm_of_platform_populate(dev);
+	ret = of_platform_populate(dev_of_node(dev), scp_core_match, NULL, dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
 
 	ret = scp_cluster_init(pdev, scp_cluster);
-	if (ret)
+	if (ret) {
+		of_platform_depopulate(dev);
 		return ret;
+	}
 
 	return 0;
 }
@@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev)
 		rproc_del(scp->rproc);
 		scp_free(scp);
 	}
+	of_platform_depopulate(&pdev->dev);
 	mutex_destroy(&scp_cluster->cluster_lock);
 }
 
-- 
2.47.0.338.g60cca15819-goog


