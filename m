Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB29C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0TVCaE8Q+34m7ChzAdVqyf9wcVW6q1366258ZKAIuQ=; b=evkx7AR+OpFfeHrZ6Ceovj5v2F
	UtPtpapraNRtMmIzP0tc0ZxbPt3dcJKpLg/po24dA/klwuMpWwh0NtpuQyUbeIttFC/z1HQ15XsH5
	T2t31fUAonAHdK39Rh8qbS1Ye4Gw6GHGOSSnyVIy17jip84zWRtfeJxGj0SrL/S+7qTrZsRgpV3Tw
	L72nHqpmOubrx7Z5tUCWH0/vviwWzfZn4155uavaIhlT9rmY8z9hsmi2+rzbRECYDVVxKqI0J9ZHy
	7w1O5ZHQh58uQKLejegwHTSUqzDto2jB8Ao2Vhj8l18viOA4jp9HMWaJKOj8qQqRoiCztb/SZpJvL
	QM7T3wAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDXd-0000000GmKZ-2HIe;
	Wed, 12 Aug 2026 18:19:05 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDXa-0000000GmIm-050j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 18:19:04 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7eb787dec99so812810a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786558741; x=1787163541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0TVCaE8Q+34m7ChzAdVqyf9wcVW6q1366258ZKAIuQ=;
        b=OHZ5FabsCffAuXuDZYg4BYW1TTrAZptZVFEb9xzQwLJQ1yaLQg2VA/9QQbp3swPgeX
         stPpp4CWJPGJKsKc2N6sEhP0U6xQoSIVioBG79LJ5+LVa2IRL0WOb5e+22VeP0e91urX
         0Z+2yT6IggAfiPtz9Msptrhs7iPvkrxQk8LDFiCwnGhpfVVUY4ezDSu+y7psgru7kDWE
         Ns4YLNeGggwr1sM2IM3tHSe4CwBM0q7DsjzjLFssUmfJ+8Ch2ZZ/pr9vED+pVHNzMT6f
         Pbe5lD68033ejJ/GRm/iM4i0QK+o+2oNAxF7+3HWLj4HUGBiMfAnzETak4BlVd6sZNGz
         +rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558741; x=1787163541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0TVCaE8Q+34m7ChzAdVqyf9wcVW6q1366258ZKAIuQ=;
        b=bAdxdFKFJo73D32Hx2sA3vIHh8/hELKIaiJs4T3g/z37yDf2gjWQCt3J0vHlx2GHUW
         ROyNH1Bcstk/Q44XGkZxpC4nEpT8WBfEvUbrDs/IYnx6M3M1eY/LHVPhIeKcfgTg6EF+
         m/ZxAP0wGLXRd6AbsncoeIJdtgprQoy737/JG+wuu6a+Q8hq0GgDLpRZtX0YTp2vUAGO
         5Cu6/vGH9ybiPjLkMtEWwk3IF6cg5fumtFVFKDQ9ZsYeYE4eaLTB6rjL6jBB7GDsiASP
         WDBpONlaIsF/T2yfOkIj0P17nHDxhDMEDOB2nUknMBYcKhn/ZDZSxQmqgoFDGaYUa/X4
         J2pw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/KOZwYq+sN5PfBrMMrJ3ScWw1cYZ8+/Pb5dVaF3iHYNSIqcjVZCKn3fObIhdj0v8JckKQI/n5p79Io5AbQmEO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4yfVEV7oiGoeg7M1DfHy9cmoNfob4sAxaaKdN/S/gHBXJoBxh
	EYSk88pWl3B4SDGJIEHwqHbv1RDUz3YJ7rrzFb+jhEFVtxEfbfmUHTHV
X-Gm-Gg: AR+sD10ghol1otq1Dry3SS71Tf3LlzLC9/be3KtwCCA6ZayYCuEW+E0pShg2QNKcdFE
	hRple4RbwvXhCBSuLZcjDC995MZBDB48rOSz7/j7rkQOFc/NKpMQVor3Ka7t0QGKRnobfFh0kfY
	jGV1/IwOEsVtJMsQNK5sdxPDZ6h6KXqJpvI+WWGjrMoH9Gg/GZZ63FpDOIXfq1eRfUpixO+z5kX
	ifkzyg96FkIgrs2QxUNUD2+U2oLgeCnzNX0EaJv6n/c6+958zXq3+fsDYgKgvD0vt9si3Wo/WE8
	/97lj3Ak86DndDpGC6RwvgM5bdWrvaV7b0ipHi3AGx39co7afHewkS7zHUgBx/VdD7rpuODOZ8m
	MO5h6nsheMOcadWjKsDDYnLx4rInPnQ83iCCQPVs/rFCAaeKW2mAeRZ4zzC7n3KA3pg2c1fS5+l
	9ZckqJfdP3zVczaVPZ+gNj16za9dptSu4eSPfFqjmxpQHt1Ll1+UJl8TtqfaLsynSJbtfig2R+u
	IkziIC8K+34SugmdWpxC5wjfj/A06H2RGwjkm1a2Wtv9XlPhIWJ7Bka9Bm0f7XGWrt294Ct8HLe
	f6EFljTi7dPmyODNhTpz+whFuY1vf6HxcnW3yg==
X-Received: by 2002:a05:6830:828d:b0:7e6:f582:955e with SMTP id 46e09a7af769-7f3b79a016dmr6963465a34.10.1786558740714;
        Wed, 12 Aug 2026 11:19:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b3420373sm3589768a34.19.2026.08.12.11.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:19:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] phy: mediatek: tphy: simplify main allocation
Date: Wed, 12 Aug 2026 11:18:57 -0700
Message-ID: <20260812181857.64544-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_111902_088196_19FD608B 
X-CRM114-Status: GOOD (  13.84  )
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

Use a flexible array member to replace kzalloc + kcalloc with a single
kzalloc.

Shuffled some code around as __counted_by requires the counting variable
to be assigned first.

Removed NULL check from of_get_match_data as it's never NULL per the
device table.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add back NULL check
 drivers/phy/mediatek/phy-mtk-tphy.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index acf506529507..e9b9e667b319 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -340,10 +340,10 @@ struct mtk_tphy {
 	struct device *dev;
 	void __iomem *sif_base;	/* only shared sif */
 	const struct mtk_phy_pdata *pdata;
-	struct mtk_phy_instance **phys;
-	int nphys;
 	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
 	int src_coef; /* coefficient for slew rate calibrate */
+	int nphys;
+	struct mtk_phy_instance *phys[] __counted_by(nphys);
 };
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -1572,22 +1572,19 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	struct mtk_tphy *tphy;
 	struct resource res;
 	int port, ret;
+	size_t nphys;
 
-	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
+	nphys = of_get_child_count(np);
+	tphy = devm_kzalloc(dev, struct_size(tphy, phys, nphys), GFP_KERNEL);
 	if (!tphy)
 		return -ENOMEM;
 
+	tphy->nphys = nphys;
+	tphy->dev = dev;
 	tphy->pdata = of_device_get_match_data(dev);
 	if (!tphy->pdata)
 		return -EINVAL;
 
-	tphy->nphys = of_get_child_count(np);
-	tphy->phys = devm_kcalloc(dev, tphy->nphys,
-				       sizeof(*tphy->phys), GFP_KERNEL);
-	if (!tphy->phys)
-		return -ENOMEM;
-
-	tphy->dev = dev;
 	platform_set_drvdata(pdev, tphy);
 
 	sif_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.55.0


