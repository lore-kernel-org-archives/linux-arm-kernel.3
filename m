Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D60CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=; b=LYuBeqvb70eH+z4qv7r7xS+66k
	tcxLjdku+HNg8mLvVthO87I4uczl9+v+OKWHBWnRql/+iVTpj+MfW2b2NEtcvzOfL7SHy9k+fEt0m
	PJhM8/IC0MWvweS/52bCcuA8BwaH+9OLOObY+iaw7kgsbdGCJMKw/StvG8FGuIQxJksPmt8OVTUtC
	v5d3Izn4rG09i8uRicfdU44jEof1dHbLo4ZvbDXKcrTM3ukr4I6PzYgxWqyaDTN1JPyTpid45ejpy
	Y7XdXUzyZ4lLHbBRNY2XDRlyB5GBV1Rag6FOVBqiYmB5c7zuzn7abWrGaJ2pGK7jg/gKha6cHReqm
	OjWbcI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTmR-0000000EY64-1sT6;
	Mon, 08 Sep 2025 04:47:03 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTjd-0000000EXdO-33HH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:44:11 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso2612637a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 21:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757306649; x=1757911449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=;
        b=H9EtgS+8gv+1hEn5rrBxtaLtc7/3R12yXNg2mvK186EteibYjyuaB3HoomDxewAnlf
         Qwy+bvmCcxLxt3P76BLlduXzlMZg5/AmhXC8fxS6UQ+jRLyH8F3eKnr4NPxSWU+Sm89u
         eZZLMburFYkbNUfIXS7+BOAGtrK3QOBoB3ZJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757306649; x=1757911449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=;
        b=pthP6PpKn2WpiUZP396QNzesEY1HLkHEfbZiGNf/KEE9m28jKMcnxfDRA+eqPemD49
         CkVPnnpNMu81Mcnk/zRJGncZMaZMTe43qfrbYq1mNyJhN9DD2yumx+/XJhdFB1TIxzBn
         +76qdXbWi+l9JYq2MJ+//gICXCJ5dnj0gtHMxhXDF6zr6NYIVWmvkIIzx3LfXrqR28wq
         vIgajGx+0uOeqA0XM9JPJ5+i0N3//aA+Sb0xKDS0o0u+84i+gOa4wK+ufFueNIhJ+Q2a
         Idb0fIslbnAiIE8AQYT1BeUhDnGKMDDEDRGCBjTUdqkY//vkXlzBan13x/2qvefVeD/k
         Za9A==
X-Forwarded-Encrypted: i=1; AJvYcCXdLkXGgBPPYA9GqMp6673xLMQ96RaIATRS8/14J+c2AXsdpqAMDnFDfa4FsLGFmRVxnAqIz+SNRPcIdCM1tQF3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8rF4NQaDsW1asNwAbjaN0Xhn90JzemgIrO963Qxbe/pRDd+fv
	t1rzkvEB32W8nL6Lc0/34++TtSnXyKh/xvP8JSs3z+cBOK9iAaYQvh8m8PiA64l8Fj5lvKGmwUd
	v/pb3Pg==
X-Gm-Gg: ASbGncuck+LNk2jDP3r+fGz+tF1eBaFCfTFdcyBsmdoCoKaRe18N00gitrcE3aS52Cj
	WLanAKWV2FEcRtJhInknC5NMxnGnd8JJbRzn3Jj9uPqkOauZlrdqsJKDtUMkWoElpZHnLmMKYX8
	+sPNAVK/8dyS+xRLVxE7xGpjFBCR4C6PEvMTuxU9OYGypwth4McasBEULOrPIOT3ZjCMBS6b6RI
	s9GtGlBUnjzgci/q/ZoYYBq31JcqSMzFplZ8jRp7abCUv+xOwZIlR+glJxrVkpycM2JSBppWApA
	xfKONTz3t3E2easX2eO3BNDkgD87omcOvZUt5Z3RACVyssWTtWX1oP2KHB5hIOkJTcYuzfkJ/iY
	HCWtYNS01uUr0C5ouE9TPv+YvMUWCTmTjhGApCweCCjJKBY2MIQpRkt+Sw99nRJhesmP90FKYj7
	A9BVCNhP/bY6RXo5hu09ZeYMpT
X-Google-Smtp-Source: AGHT+IF6EqSsNgeRlOG14nqU9rpBfRr7iTBMf+lspK57Oo06mCVbJuf9Ry2wvH4TilganydG5n2WLA==
X-Received: by 2002:a17:903:f8b:b0:24c:d342:7616 with SMTP id d9443c01a7336-25173118d31mr75029465ad.57.1757306648632;
        Sun, 07 Sep 2025 21:44:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:d9c6:a89:402f:11c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1ba1718bsm153320605ad.39.2025.09.07.21.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 21:44:08 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] remoteproc: mediatek: Use for_each_available_child_of_node_scoped()
Date: Mon,  8 Sep 2025 12:43:25 +0800
Message-ID: <20250908044348.2402981-1-fshao@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_214409_801141_F2F5266F 
X-CRM114-Status: GOOD (  12.16  )
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

Use scoped for_each_available_child_of_node_scoped() to remove manual
of_node_put() calls from early returns.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/remoteproc/mtk_scp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8206a1766481..b123698feb52 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1234,7 +1234,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct platform_device *cpdev;
-	struct device_node *child;
 	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
 	const struct mtk_scp_of_data **cluster_of_data;
 	struct mtk_scp *scp, *temp;
@@ -1243,11 +1242,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
 
 	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!cluster_of_data[core_id]) {
 			ret = -EINVAL;
 			dev_err(dev, "Not support core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1255,7 +1253,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (!cpdev) {
 			ret = -ENODEV;
 			dev_err(dev, "Not found platform device for core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1264,14 +1261,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (IS_ERR(scp)) {
 			ret = PTR_ERR(scp);
 			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
-			of_node_put(child);
 			scp_free(scp);
 			goto init_fail;
 		}
-- 
2.51.0.355.g5224444f11-goog


