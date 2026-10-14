Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB6BCC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=; b=l9OuVLIp8MQlkMxii++wtfkJAK
	zCHiQAof7Luaq6FleKNpHI+ICK4pHgIeP3MlcqeGF2/bdmthz3nT4XvNCqJ3A/KY1/oYZYTd4qfCb
	t7VvW/tFpFj1Jv9Z8tLbor7QUjfbY18P3/rErSDaKsmR6D/4GgIKsvKmgHYex5fcgfSrdugGsrS3T
	NrW7BCe5uKsOIzRM55gfIP5Au+FRLqIGqhW7Ka3Xx5z76+KWF4TAl2j7b5+HMyBe4ifDvAUh+5ktS
	IPNllk/t4/x7xr4jNm7CiHD1rxjW0U858TMD67FEBz4pOVIn6VshStfUNo0zAZkXMSYpvOkC/34+Z
	TTEWbJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFv-0000000EiG2-2ffU;
	Wed, 14 Oct 2026 07:18:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFf-0000000Ei7I-28Ks
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 07:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=; b=CoLDAchgvAJNF5SkXoD17WgeMG
	eLvn3Ci+q4o02ab9ioEQNy90Q3U2+EngUa9UXXRyMpXM5c3k/jYDPMQwqvxIB2nZa7gklBpeWKhKu
	pPWgQ9eu0zxCeymaeSrZTcER44OFR6ropZLwVieDFJELbFwA9aEFpew74bhTcMaxAWDHkEll4iAci
	IJkD7PrNejqAuwl+A3g2ts2N0Ltc2wWXosi5Et9p+8jlwJZD+Vx8qYLE8+ArdDb6H4W6mDZAQ85bQ
	w9IAoAjQ/1wjfkclb6F2T7C+2bH8t7QrEfrwM5rvGmEAB/ubVyV8yknd/Ojgv9XIejSTZx+mIjAVs
	CgFZJ1Kg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGtFb-0000000GRHd-06hB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:18:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so30820335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962289; x=1792567089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=oTIsIEDCVvTFQ4H23lovoZhIM7hRSxx3EPI671Gydaaztju07u3e646PF79dicz+yX
         LPFFFUl5MkS2g7a75YvWPl702ak5pqJXOBMxopoxyF80NlyHPXWDySlEZdH4AzIVgVQ6
         VaMl8as+Jz3Tzvtp5sk/hZ2QpfCewNqXkklCJDm+jASwhcBsZb9e5f7Xkj2fQC/zHNXB
         D2tdC9UM6uh3pf9afuJs3HjqV6HCgYZpuTzTLqGRbsKbjuD3nrmLYwVo2Nh+4Dyljk1g
         DYnDBXfpzhMF0gQLUWTikQypXbi9u2yzHvWYInAmTUsF9rDIVavWPo2qmYt/aiBEEfVw
         s0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962289; x=1792567089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=TcJOh/UBPZsyUpLfWpZVzsruCSnhEhLy6HqKVzboGTzsDy5RS+8D6jETCVKnGgzSUG
         VgRi5zSnE2Jh+Z8W3JixAwSG1kQGcw7RKcB4LUfw4bkETcNnSVbGdBEM4+y97l9BGBvR
         RCNxz8DoiHhGFLFTdKOl1/1W8faRq2DNVi0ZkxS6I9EfbmaVk3HYy+Q4OAMDsChSV5kM
         Q2hAryL1Kly4mLEZ5H9n7by+XfL+u19HRKaeRqL4hKqNECEl8B7Z+8yonMqZt/mcCjLv
         gDqAb9W+Yn9fAW21BVwdjQeOw17hqq8rExX8FwX/iHNBZck0YwFjzyAL5K48tzcfXhhi
         EIfg==
X-Forwarded-Encrypted: i=1; AKwUvBze+f81BeHU51JzRWYN3t/7dgrxq0SbSqZrxL7FZJtMyMSaHMxAEjPsuEa9OuQ0OrdFNIiSb5Xyj2GyU3Ml6OyC@lists.infradead.org
X-Gm-Message-State: AFq9FYLjAGfqJr3dk56/R5jdy4sMpr1nhg+TKNNTRxmBvk55deUpkq3D
	QtPkmUDVEHZciQ8QrC2qbyXcxYP7UztPiIMtxgd9JfkraHIdlVhM0Y2/
X-Gm-Gg: AYBFou1vJ/T8uM4cRvXEUPr52/QRm2czThFoS11385SJhMy7hIX38WnYqW86yEBkyhy
	2IO5cOmzZLmjjnMUMp4FusKr9+0vRw5btsMlCnDtoDic7D6+uSYijKRtBdyT8KloPP1y7xeUHbU
	N9pcxWYJCC1yZhWKLCIzr3A7EiFqvrleFauR6gEnuHXDev5/pSqANQF2kFvZK6YLSG9d63NIEIP
	HF5kqQya3qgHfIt3cvo3K1IL46Bp1L9+qwdRpgKiwEMXH5MUPj1v+6uIYSypzse8tQj2kZyXWPQ
	b3DCyIP1VbuVki0Kkg63ZLoPvTvsEEjzS6HOr0yzBhsaG1P6p0ciwBSAhsOnxXB08Xx89DMWLgs
	MyQtNjRvs5DxEZ9Q6JjSzlk5RPYvLGiH6hcNOTLNtT/EMyQjGTyT8jENCZ1cQZnAKZlPJb/JKPB
	gX7Y9i56gOJQwXiMGx4KJ+nJbRjtovUhZpShyz/X3Gj6L8kMjJqbIHyeGE7+VmBbCAT4QSlEuac
	/7/smrBqxo1peYJZpgZLYP9E6wg8M7/PncSiuBO3K6tYdJTn8Ar8Br/KIGo48FEanTXcFK2P52N
	SYuThZholNK32geuAmEZMw==
X-Received: by 2002:a05:600c:1c07:b0:4a1:b044:9ccd with SMTP id 5b1f17b1804b1-4a1b0449d00mr79174665e9.28.1791962288754;
        Wed, 14 Oct 2026 00:18:08 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:18:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 3/6] net: phy: mediatek: generalize cal_cycle function for GE SoC
Date: Wed, 14 Oct 2026 09:17:34 +0200
Message-ID: <20261014071739.216345-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014071739.216345-1-ansuelsmth@gmail.com>
References: <20261014071739.216345-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_081811_196397_668BD080 
X-CRM114-Status: GOOD (  17.13  )
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

In preparation for support of special Software Calibration for Airoha PHY,
it's needed to generalize the cal_cycle function as Airoha needs only
part of its logic (the wait logic) to complete a calibration cycle.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 32 ++++++++++++++++++---------
 drivers/net/phy/mediatek/mtk-ge-soc.h |  3 +++
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 2b1e9923db98..f3ce6e67eb38 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -39,20 +39,11 @@ struct mtk_socphy_shared {
 	struct mtk_socphy_priv	priv[4];
 };
 
-/* One calibration cycle consists of:
- * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
- *   until AD_CAL_COMP is ready to output calibration result.
- * 2.Wait until DA_CAL_CLK is available.
- * 3.Fetch AD_CAL_COMP_OUT.
- */
-static int cal_cycle(struct phy_device *phydev, int devad,
-		     u32 regnum, u16 mask, u16 cal_val)
+int mtk_cal_cycle_wait(struct phy_device *phydev)
 {
 	int reg_val;
 	int ret;
 
-	phy_modify_mmd(phydev, devad, regnum,
-		       mask, cal_val);
 	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
 			 MTK_PHY_DA_CALIN_FLAG);
 
@@ -71,7 +62,26 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
 	if (ret < 0)
 		return ret;
-	ret = FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
+
+	return FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
+}
+EXPORT_SYMBOL_GPL(mtk_cal_cycle_wait);
+
+/* One calibration cycle consists of:
+ * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
+ *   until AD_CAL_COMP is ready to output calibration result.
+ * 2.Wait until DA_CAL_CLK is available.
+ * 3.Fetch AD_CAL_COMP_OUT.
+ */
+static int cal_cycle(struct phy_device *phydev, int devad,
+		     u32 regnum, u16 mask, u16 cal_val)
+{
+	int ret;
+
+	phy_modify_mmd(phydev, devad, regnum,
+		       mask, cal_val);
+
+	ret = mtk_cal_cycle_wait(phydev);
 	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
 
 	return ret;
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
index 008efd148a2c..14370b5ce482 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -354,4 +354,7 @@ enum CAL_MODE {
 	SW_M
 };
 
+/* MTK GE SoC common functions */
+int mtk_cal_cycle_wait(struct phy_device *phydev);
+
 #endif /* _MTK_GE_SOC_H_ */
-- 
2.55.0


