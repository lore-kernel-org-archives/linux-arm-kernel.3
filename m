Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046ACEDEC08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h4+RxyEzVVfMeQjameS7WuxM58R+fJWfpg/21/ewVWI=; b=hfP7saAbpM/y2VynGLVdVyhCED
	UXwKPx6EA0jNLCn1Y9M4mMdoeoeICLYFYSqb99kMSeV2tN8jNKuL92hVDAf8ygrbAAiZTHYEQjIEw
	q4DTFNaCOnXctKkIFGOwY7W+MpUSj7fbiUEscHNaewr9OrjmhR2F3h7x1NGiq4KAvvSrPp7Vf7lhg
	wkQ2h7wE6/Ehdz82tSX9XINQx+JYzQfWdkS7cPooDVfWijn1qmBRYr0Lj0KEwDmB/+3l94foJxZTv
	RnqRKSugsSzwAgCm20aqqCSu/EEf5UkTegNQoyDbgGPJoZTcZDl0rvb9kWpfn+1Aks4i30UcDUTIw
	JucqXmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdwX-0000000GRXc-3oZq;
	Wed, 04 Mar 2026 04:34:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdwW-0000000GRWj-0lM0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:34:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ae56f8776dso18834785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 20:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772598879; x=1773203679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4+RxyEzVVfMeQjameS7WuxM58R+fJWfpg/21/ewVWI=;
        b=PBr+3alqtjI9o4M2o0t2FQyibJ6N627RvN2osXpue2FgvRsiJe+AjDc1isgodNIVp0
         m+Y6+GLyOqrSzbftc7usUeIKfjI3I+XD25b/7AAx+ef5sLDK8qIx5yg+ivy2lrhUnAEr
         IG+vS0m4awtsnBs+bEpRWk6FKe6savkNaZd9fWO1Nr6LleeNPlpPj1AKt9Fql5nxUvSm
         XPGToCXUgdWyhFBXcDwetkfNYBvqu1Cp5cDwCmKqsRtWm4O6QvxbaHQc4WdYHUNZE2rE
         JVsk9FyPTwgZwp3NFauFQ3SSfYmw8j33RuZqy90V+7nCz5JWvsr2WYFsbeCYdNHNc6PA
         zLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772598879; x=1773203679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4+RxyEzVVfMeQjameS7WuxM58R+fJWfpg/21/ewVWI=;
        b=hyUYNQEn7IukoypSXX3xgz+lpj7m9UwzKnoYxB/68r9bTjp1AUk42yI5QH5NFAhi1L
         UZR0P1TqBFVsCYWpS2aR1PweXUVQe0fTku5CIXmVIn/sxFTSkcjFJqmHWA404z32oZSv
         0bCAqjRwa3y5ZSbBLmL9qyEc8mTfku8dMdlYpPtNHmo+pHyDcMMEoKtolKESD0iI0z1X
         XYR9qu+wqV64c3lumCS9PeHe7XWi0mCYkgCBNQR7ivAOkkUEww/HK2VFW5K6erkjMjin
         alLlBXhEOoxknNKwFz0JvBklxNgUko3hUByt/iiNlt5q+x7CYsyCzClR31vsUVTfnUP9
         AR8w==
X-Forwarded-Encrypted: i=1; AJvYcCVBU8gqS1213+BLXsTayimEsyeYL1wb5yqxOlwmfiqklYHDFpS528HCda2DAqz88jbJAzWLCGnQzS4RIF0r/fYM@lists.infradead.org
X-Gm-Message-State: AOJu0YzW4TcwMN3WbbsIjhTD26LI159XaXbqqzXaYvVye0ScVTPKp95M
	sxpjIijCcwPj8C6UXgXOLWIT+lrMQcI6zFpvAqBNQNAu5CGzsdD/KRu9
X-Gm-Gg: ATEYQzzRLiuE2pdHGaY36BVPlEkQGLN++1w8UL2vN68VMZ9nqEDMliwixfZByIj857Y
	HNWyUTqlYD35xqiJI+fQIifoRVTRIy1qCxm50rnSsa8Ne8vi0pmZMbFAL8oeWyqmqwQnQ5XOYDO
	RCmFE77i3WoRmoVAjbYMonV7KD4Fvhc+QAlcK3GsuLK+S7JEov5Kd/VWUpy6luMLFjGajOFIySZ
	8T4WPLMejg77gTZQSuMvejnucdKG4rcvXzeuTpTMNvexTP4yuZXF44cqDSR1UIb49BAV0GNxBfa
	3cAstooTIheOysUioi0CKxtEMY57rjuN5lpX2nfnaNvUhdkLTK+R7n0qwUCf7G/ukBW9wcVzqO7
	b0Flx9AoxbKXy5hS+fxVKYQqz6m2K8jwmmYPUp0cjans27E/AHgrWizaJ5nDUjKsl4YbfTCLum7
	wp0IRZ0CLSHZZsNE74dvZ5ixakoJVpguih0q+bMQSmgGtQQ5/5D/+a+o8GUm79TGKs
X-Received: by 2002:a17:903:1a67:b0:2ae:57cc:63d7 with SMTP id d9443c01a7336-2ae6a9de1a3mr7732125ad.7.1772598878948;
        Tue, 03 Mar 2026 20:34:38 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4651e409sm115173435ad.44.2026.03.03.20.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:34:38 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] phy: mediatek: xsphy: reduce main allocation
Date: Tue,  3 Mar 2026 20:34:20 -0800
Message-ID: <20260304043420.14151-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_203440_228929_8E48E6F8 
X-CRM114-Status: GOOD (  13.93  )
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

Instead of kzalloc and kcalloc, we can use a flex array to reduce to a
single allocation.

Also added __counted_by() for extra possible analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index c0ddb9273cc3..cc1d66954212 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -112,10 +112,10 @@ struct xsphy_instance {
 struct mtk_xsphy {
 	struct device *dev;
 	void __iomem *glb_base;	/* only shared u3 sif */
-	struct xsphy_instance **phys;
-	int nphys;
 	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
 	int src_coef;    /* coefficient for slew rate calibrate */
+	int nphys;
+	struct xsphy_instance *phys[] __counted_by(nphys);
 };
 
 static void u2_phy_slew_rate_calibrate(struct mtk_xsphy *xsphy,
@@ -515,18 +515,15 @@ static int mtk_xsphy_probe(struct platform_device *pdev)
 	struct resource *glb_res;
 	struct mtk_xsphy *xsphy;
 	struct resource res;
+	size_t nphys;
 	int port;
 
-	xsphy = devm_kzalloc(dev, sizeof(*xsphy), GFP_KERNEL);
+	nphys = of_get_child_count(np);
+	xsphy = devm_kzalloc(dev, struct_size(xsphy, phys, nphys), GFP_KERNEL);
 	if (!xsphy)
 		return -ENOMEM;
 
-	xsphy->nphys = of_get_child_count(np);
-	xsphy->phys = devm_kcalloc(dev, xsphy->nphys,
-				       sizeof(*xsphy->phys), GFP_KERNEL);
-	if (!xsphy->phys)
-		return -ENOMEM;
-
+	xsphy->nphys = nphys;
 	xsphy->dev = dev;
 	platform_set_drvdata(pdev, xsphy);
 
-- 
2.53.0


