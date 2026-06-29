Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AA2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=; b=fJThr+At7SsYJs/aSkkjhwBQ73
	LCPfB0L9wFIkwUfWZYI0kIMcPIWibxmsp8lpu/8MGONBYd2RCxnzGdxRlC1iUNEEw+f6O80akT930
	MwxDxbysi3lWOW8ecUrWz0dtzTR+Roc6SxcqeFv+gAEBOYseDUAD1GzQjLYm11UkOeqhZ47yhi0K8
	oA1w7SqeCOtARn/SQDjJ/97CtCtrCZgOONPt6sY8B8Aimq1ZH/Jkia3myZ74CvclREXJPDdPA0ExT
	yOw2HR0MLHHTWP4S22T9oDlGxhyCXJrPOrdBXwKbCJluMEdLPwOgvUOmfvdS+/21p7sciFrI4h5Ix
	VIxmUmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCuH-0000000Es0C-2D11;
	Mon, 29 Jun 2026 14:24:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCuE-0000000EryM-17IP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:24:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37fb17e1435so979836a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743053; x=1783347853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=;
        b=svnKla/jiz/Fto50MswQye/+x0EAOS5ObWs39QicS8oVzdFNu1MYwOuis6sPFVpXwc
         JvO0Wov8teD7y2bMBrIWn+ivqSu999PJl8rZKcW2RJDEJbC4WLOMDNCetbe8SV+WIlWs
         YzZTFBBaEW1u3un6NcXpRF+2WqL+qCnVn6VaUb8n9lFqnmCHZbY0KJlloIF2S2UEL9Yu
         vT9bVD0UqdL3OsrIGqtzPUwpBkAnFMXNWtjD64PsBae2Gs83zoy8h9UsXVX4nfAN0pw1
         DAXy0kE9+RRW3Oiqws3JpCPresS+yCCrrihC8tSAjcLnvG2ahYpiBZASwEToj6YmBTQ8
         592g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743053; x=1783347853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=;
        b=HmKj9cDn9tIbxKnBlC8ycuUq5CLPeuMX7aQ0F7WR2aZ/AkkKAJ6ELHdmM79CmDeNY/
         GCykLOn5oUB1a3iyJoX8yoYXdwjRmWDCnFBd4EaXFfV6nDuoiqaqqZy8pYzw2cHd+h2J
         sLh82W9ff3zsvuo7ZrMblPVbo47ebMerIVb0VpXwjaLG1AMjzzixhYzw7D57P0FegDdl
         URKi5CtWgOBK3wI0kMgsxgDDmm1iJS7ha0UnxbJcRC4gWcj7JO+CyO0J8jw4LREuHEtD
         A3K9hm/0YxpN0eVC0AGh+mgxrnn88GtworjeklUlU6BYR7PInhmex4le0vzg6Tc8e0o9
         mO0w==
X-Forwarded-Encrypted: i=1; AHgh+RqzcIE8EKIUdfDCrEuvVGaKQD2MPSmWb6pJeYxRIxmGMAepWTXGQnXrUMTsADVWmlYZsVvNmJxjS0KNR4tBcxSw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9X/z9X+IE3+JOiCr4mTN+F63mN/AV3f+y28EK4XLkCLUscjYC
	XhL2bptsN5o4xlJdHUsF+4mgMb2hcmQ1cx8qV0VU/i6MKA1blvyO0cCP
X-Gm-Gg: AfdE7cmKFMEmcs7HU5O0UkE3BcxeOOOw0BxGl/iILr/L6TakLZNNyL4//eFjEbpk5hV
	bcbnSOu5t7OgYaq2DKPeOCxdRnNu75GSZ0DIIxMfVYkL0KEhtKjTSP2ks2eXG3ajFwaLkIE0y+a
	YGaUzzH5Iv+qXdSje6zAjvd4ACcil8NQGo90zmC9gXNBz0nDXmGWq0RolbYdLNPZig5eVuJ9QEf
	wrGvWBwnVWxRpN8dXu2R7+YnKCGWft8Xafq+jDdx2WtkdMjMxE5k/ELYy5l3/TM7KvdqgCz9Vsz
	r2nUd5fSbptCLwUo7pzvRQ+Lz4wEAQg0ARFUs42QJ9JKR2rJPRwlKkMlej5IWyvnHuzBauQICBk
	Sxvc+GpTWAktmNro9ohhd+Exn0Oip4H9kq6by8iy9Zhcsl91sv0szZOKeMOMMHGemySU/tO9Lxw
	lIDr+JA0ApIH6N1awSPxwCw210LQ7zIOiFR/YI7FeDyocw
X-Received: by 2002:a17:90b:510f:b0:380:540:d49a with SMTP id 98e67ed59e1d1-3800540eb15mr3073658a91.7.1782743053280;
        Mon, 29 Jun 2026 07:24:13 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm3919763a91.0.2026.06.29.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:24:12 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] clk: mediatek: fix memory leak on module removal
Date: Mon, 29 Jun 2026 23:23:40 +0900
Message-ID: <20260629142348.273766-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_072414_311309_5E496E18 
X-CRM114-Status: GOOD (  11.88  )
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

Some MediaTek clock drivers do not call platform_set_drvdata() during
probe(), but their remove() callback calls platform_get_drvdata(). This
results in platform_get_drvdata() returning NULL, which leads to calling
mtk_free_clk_data(NULL) -> kfree(NULL).
Therefore, the actual clk_data is never released, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 1 +
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 1 +
 10 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..24522fc24019 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_plls:
diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..b607592a7c37 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..12146bb3b726 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,7 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..28faeb2e657a 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,7 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_composites:
diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..a9fc2e5536b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,7 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..b44baf521d2f 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,7 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..41e5cfbcbb76 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,7 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_plls:
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..fe36d2eac3da 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..b923b73c64f6 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,7 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_clk_hw:
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..446c55b77777 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
 	return r;
 
 unregister_gates:
-- 
2.54.0


