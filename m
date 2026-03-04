Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4C5EDEC09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YNQEOfz/uaj72zFc2OfYhyedqZgPJsuVowB3OOH5Yjk=; b=jgscsGU00Xh7DXkDMIHoPFdPwt
	Z6ye3tY+7aw52p1A5wMiXr+9CHu/rrTh43SnjwdzS9w9ONrG6RyfEDGsviL0iY1ojfybbI15S9VjF
	qGrjxuVLKGM9Kt5+9ROWdbV3Vw2qOtg9SRGZNrTU+Ou5HsnohdtMcIG0SJ/KhSsgtWptgdTNegV+b
	emLu3CvsWED3kMoF7OtBuvL89L0j9nzgX7oo0bl3GUT1GqGhTQxSEVDHwEKdEfrWxBniXYQY30En7
	6vnVsNEjxKJorXg8Tv/d0zlcsJntAdBRrYlWquMSJ67GemJnAjrMs1kVlbnWLL0yXKrUonnwHCe/3
	NYCOIWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdcr-0000000GQQg-1Mtm;
	Wed, 04 Mar 2026 04:14:21 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdcp-0000000GQPl-2ciD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:14:20 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c70378ddaafso4228108a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 20:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772597658; x=1773202458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YNQEOfz/uaj72zFc2OfYhyedqZgPJsuVowB3OOH5Yjk=;
        b=AQqf7dOmBBfPUXmpeHJsT2O26DuOGwUmCIKXK/DzS+/etgaDbkb1tiop1b9/01ATcB
         GEaEmOEu7x0Ouu6srA73MPPmZMgEQI3siHsTQntJ+e/y/JTfMRtfgQZ1J2QDAakO6Rr0
         oqIr5BnAs5fAa90as/5FkzMMY9AoAbWEACnt3j4a8KcGYbxwDDOZDghgUGVoeXFrdMmQ
         aBCoEIDv+fE0rgrNDHpF1x3MYVetdm2wFr5Udu9g/awTcyskkxSWaoDsCx1KAnnQXZma
         CQyXBaCz6ryJz9/dzAL3FkZ/VAs+vP0k9jeYliuSirRC9fexhSt94ktWEle+CSYfm6Nr
         IgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772597658; x=1773202458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNQEOfz/uaj72zFc2OfYhyedqZgPJsuVowB3OOH5Yjk=;
        b=tAKGp+YoTcNPrryR5P04f9Gdg1fRM1yLYuo7ByBx6tDWtz3iFOq9OIJXgizoMP1bAk
         ym1v3Z2RMPKXYNMwj46hgtqZxmd3RgMNBqaruX7L04tpLTq1EuNe2Iloqlnppckvrsmi
         PgZn8q388hivo+RM30HIIEKnKB+V4KVMbyTIr4FBVFmqlwOLLG+eiXwFQnYayAVFLgGL
         k2yIHhDV52o1xjPd4NDLo/BRkceoq8WfSdz2PYxYkUmG1w43rd3o4y2ebikk6sgYb8ED
         qleWSI33xljsWW6uiGo+Lot/q6hXy9fC0yw6w8IGbtvuX4FwYRPefv6C0GxRJaRmuMO8
         1zbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRZMv51O4XT0ZU6YUDN1ll4WEFJhxG8p3z9drgyW5/cU3KEJj4EGtVHPvr8moP4/8+vebSUxVB9ir0my3aeHZ3@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgDN+C3kFhUY8tlKBerhCUapIE7fxPpRWTlQwscxzrOF8/9qg
	3+VPV2fMBlZBK2v4sLGDtiLhUi/SPkjDKZMiKzbbb8jvz60KUyrx6IOYcJtzdvfhHjo=
X-Gm-Gg: ATEYQzyIAUeRPsdeV6rh7PSjHPOcieV+JRl9F4kHa/tfhy4SsmKbDKtbtUQbrOL2efs
	H25WGicRszsz42fsIRJappYPKOpowmJOLns1aHMV3DtBkRrXtsWpiz/JmHAgX9qVXt8Gw7S6Gq/
	T5rRQVbTDrRqaxKbJqCMp5Qhw0c5xiQGukF6KIMPs3FmG2qy6yBRbkOO3LnZsI7bLgUMXZcIvo9
	JYkqc7lv40dtVuwZB8ARyFovhcWWeGd5rNDEndunGFw05KvyfP3VmbRAlcbkFlTxdkc1PDabA/J
	TJLQYE0ifZA+cHeO8xnd+1pGw4zgqhhgc21pQGx4mMDQlqXLlvawmMl+bcV4L7nM7agYoc+ksBe
	BEwgfKnAvzCPFgHYaOMIhMQurszG1DC/f0+sNvOI1JKVVjNrzsYzNbw0UXgxp3XYdp66Ftpknwb
	s5g4SxxbXhae9C1qvP7RVA7lOwvrnqaZ4rt2Vy5Kg2XoqTdcecoWvLzg==
X-Received: by 2002:a17:902:d50e:b0:2ae:673b:6a3 with SMTP id d9443c01a7336-2ae6ab8e78emr8091365ad.49.1772597658095;
        Tue, 03 Mar 2026 20:14:18 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c183bsm188270585ad.24.2026.03.03.20.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:14:17 -0800 (PST)
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
Subject: [PATCH] phy: mediatek: tphy: simplify main allocation
Date: Tue,  3 Mar 2026 20:14:00 -0800
Message-ID: <20260304041400.7236-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_201419_668922_DB40D3D1 
X-CRM114-Status: GOOD (  13.51  )
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
 drivers/phy/mediatek/phy-mtk-tphy.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index acf506529507..3a6d61cf1cd0 100644
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
+	struct mtk_phy_instance *phys[]  __counted_by(nphys);
 };
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -1572,22 +1572,17 @@ static int mtk_tphy_probe(struct platform_device *pdev)
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
-	if (!tphy->pdata)
-		return -EINVAL;
 
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
2.53.0


