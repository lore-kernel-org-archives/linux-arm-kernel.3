Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87006E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=; b=2F/3FgOOHFqH/MkWxsGFU4ht3k
	3BQkMeXXTdv4HcOUwO2Ay8Y5C21Fp5kQFFy3dSIzeL6Hkjda6cqqdCVU/dt1Ye9bvhkhhs8dMqWXa
	GcLIkVHT3dl19Tmr5Yg2Z7MCn3cGIJo+1K9WChroedHM0BLJdR45cFJZpiEIFf/jrtvQf/MhDfiey
	M2uCSf+gg8eJsV5pgTLyQb3k1ZsBCYYXx70OlY3+lXWz7wL2MN9fEsf4OOOYay+1QuwCPk/D7bLl7
	AXYcq2cq1OADeE9XRGBR5fNK4sMtw45HBMdh9cLWXhCUuDLkJa0lgDtP/O66U5AcuDtTl2iRo/uIe
	BtqK1NEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLH27-0000000E2Pc-45s8;
	Wed, 11 Dec 2024 07:21:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLH14-0000000E2DF-2urO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 07:20:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21631789fcdso2602215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 23:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733901613; x=1734506413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=;
        b=KCQ/KyMEKQbqQ442Y7Q+CdEjixXbcXgqBzRNiFp89aNVPC6iFBsxtQ+uKjmGLY5+oN
         d0JsyiUkJW2r+sc/Lh16ItcHvnNDiKR01uQG/01JumxX3aQv9y9OyXR0O5VzP4s6pOVd
         FSrm1yzwvW8YA8zBBnAeZ2CkHIt5js/83Lh78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733901613; x=1734506413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=;
        b=ZPRTwZMiFNgSt7douLzap8WBV7UvS2+F6YWAVh4LECNyCCHtqCIn5tvMtT7Y8JQqDe
         l2R2YY4YFLrgq+x4zf6oS3Cka4Z4u4lM/i2EgogxJa4AuGynPL+U6A70cBfgqjOmeDJV
         c+2Y5Mxn42DjU79SBW9cVsZuTCS5xJkgXPL6bmUq1M/ATlvepmTSMbuarT28Pd4kvwwK
         C7zSWFBeqIxXuGVa1GeIOXtvsHEJL2FB/D21MpbPglHq9HZLVfb8i+rFk+iFmGVSzjRH
         Y/Idx7cJLLXuN/o1jMbvQHVtIoZMAyoYPIotFJM4Xp27ZwxjQ8c8tIydYsHKOg5Z7mog
         Qjiw==
X-Forwarded-Encrypted: i=1; AJvYcCVpR2UC+j9P1W6dhq0QSzgdjHMVzGmwdW4d7QG7ONpwI/NcQ3Vcb9kDbqwsxswmHAJ52UQrk0ugLH/Rk1Quf5P4@lists.infradead.org
X-Gm-Message-State: AOJu0YzLus0Bn9Z3PPArRWE7D3E2zQXg1sO0hTkhEKQvmNNnH4WeWvqm
	M9t40Uk3tAB9N+6qPY7fGiL6TepbUvC4e4+Ey4z+34WKQh4wwyk3skZmpDKI8Q==
X-Gm-Gg: ASbGncsLY8FyNUBpwsdNgJPGx1vvVgC0xH86jVXy1gdGN2Yf/COluCP+gNLMCWx1mdG
	amAUXkq+NAlyMmT0NWKljZVpgr/je4t8WpEsety9dSIwo4iysxnGquHL0cvCy6gXIayGXeJu0d3
	3cLpeEranFhYn5zAIzWYVwDZCNtVPJBuh3ZeFz0IYwrtce82ICJAUcU/QOAzYRfJPurIrQE7Kt1
	bUAxZs4rJ0wTMa6cocPKXP/TG9929dtFmOlZa02g678hro1TcOWVP+wWO+p8X3SHM1z+WWn
X-Google-Smtp-Source: AGHT+IFb/j40l8RyXKKBP91IUhP6PaUxTTbrpQWP3pPlzKpxqE854bcUMGQOoZq9SqoelV4WQPakhQ==
X-Received: by 2002:a17:903:230f:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21779e450e3mr25924325ad.11.1733901613656;
        Tue, 10 Dec 2024 23:20:13 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e41e52sm100214925ad.3.2024.12.10.23.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 23:20:13 -0800 (PST)
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
Subject: [PATCH v2] remoteproc: mtk_scp: Only populate devices for SCP cores
Date: Wed, 11 Dec 2024 15:20:07 +0800
Message-ID: <20241211072009.120511-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_232014_760743_3385E322 
X-CRM114-Status: GOOD (  14.36  )
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
Changes since v1:
- Fix commit subject: populate devices *for* SCP cores
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


