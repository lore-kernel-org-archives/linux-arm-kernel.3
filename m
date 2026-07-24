Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFACC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4Ic8NabspzFl1YQzO0CBvVxP+4q7RfeLVihZdCAEtA=; b=3djUlwVWvbklZTfTao3Zvo4oVL
	3MshGReF5LfnsYnzgoDHvv9Gz7Rmr9Is45WiEN0G5wsao6GLREah3Gy/5TtHDX/tjJbROWgsBTqg/
	wP/PRLAX1LHnG0K1yYuAlyfc52SyyUY3uvEAJW1gXouCuKzitZ/JBeGQkzzAKcftKazoHlKlU7rMv
	zPXH33C8tMfjR1W5gzA2iPwSRZEmOuPBk7RVNdksGPxgbcxSFW4mgylIQcUSLgTFsTzTadQzK/IAs
	RJoUAKb/K4AT6EnsXGDH5ufCf28DvkaPCRqpt3k9e9ztZsIs1ekQ3fziV1Agw3TgMiDJAkV6YHMFZ
	70XCQGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLGK-0000000H7rd-3xBj;
	Fri, 24 Jul 2026 19:08:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLG2-0000000H7cA-1pj4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:08:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4954d383e64so5259565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784920108; x=1785524908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j4Ic8NabspzFl1YQzO0CBvVxP+4q7RfeLVihZdCAEtA=;
        b=qbRrxhrka1ZPe9Y85DDlOjmCBPfBadknlN4GRvuIWiu8cyf50YKsLbdilgZ3GqSIdn
         0cuWqTxfTfvyMojEgZnsxRUgs7+XraW8YhU/txNKgjYiRPO1CsWLakFspHBAgWXWxfDY
         2C3/b1GsuCnfsocewpkou9Ry6oA16UcJgw7oTfA4qJLaxsnmC5dZyYX0wCPjOuqmEIin
         14ZPIbfPZNjziqoDcBFqnxHK7L2a3xlUN1NN46kPvPfYCcGvNWJzNecYyU5M5G+eVkTS
         IhlxwKF5INqb09KZoEwxzUrw0i9x5aDY9g8pxtU9FUy8qYpdf36ZmtLjQc0Nsa9W21o5
         7cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784920108; x=1785524908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j4Ic8NabspzFl1YQzO0CBvVxP+4q7RfeLVihZdCAEtA=;
        b=nKZLNruQs4O5a/KM5acUWomi2xdwjhhjJlTOB5DjshCuA84/BapdwM+mjUalqB3spj
         fJFLWdOGD6TJOAbc/xF+A3zJBJSO1Gc5sKVmgp9I9Nz71DYjeR9HGGf1I+MAxQ/Pb4PF
         vFKjPWT0waNgYslINssSC3JQt3DpVMG1h87NibCCm6rnJxEqPOkn/g/ROysFEZyrTnPt
         j7Z5EB2dTuj08TXFHpwxPmFn6VScvLqXphhW77MOwUcbJxe0kRyuCYIyJMKu2WdMy893
         sGUBWvmAGkYapoZk87AWbVlFoPaHLcELeWAEbvC/9yoovG9O72i2QBTFDkHMVf9zo6C4
         J2pg==
X-Forwarded-Encrypted: i=1; AHgh+RrdRbxxwzyser0vq2SHcsFDAtj6klaDWN/vZY0H2ogq6Of00/VzbfxPbXQbFfRPShr5gFTRoPQe7vrbVQ39z82n@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXTwd1SB5P0yEcA/ETcSrv1556iLHNaVRIjkD3RPSkn3vIUTm
	gjvNNvc/uUqFqFvy2ZMnHteQt/ZJQF6cSu1DE2xjGmQv7J0IK0H1SEuN
X-Gm-Gg: AR+sD106GOWmeAcpkiNH4HedrJNzWddrdKLpZcFr3xVfnM1mHe1MKHHmBUGo5043YaA
	cKMwOvzS4DRdpktW5Bi5Kteta2r0n99d3Y+NIyyVQgKWJu6sk4KZcOsDsM+jXib0aLpSaVQBrgu
	C4PB7jkzabV3I+0NKrHmmZhP9KD2NMnKktx7yQ8H1lG01RIBxC9/KI2eDBIX3gwTDMhB7apI5Ub
	ODkcwMahAp0iB3KaGzOLpGEoApYAwzyG9aRzxdz6RVt79BLRmrT7EeAAEnvHD2zt4z26qh+zpmF
	DkYfUaiIBzjiOT1WkH1NGtF70Y6DVorA0b5a8avh+D8fHy3PR3tH04ptkarW1VoTtL0ohrH/IGJ
	nDUcvaP7L4Q6kLMc4PWaEMP1873J2eXtgxaqQzwnb7EO3n+DIOBnpMrxH3Celpey971hjbGMRJt
	nb7DVCOARE67lnQff6YxmwazODNe5R7UIxQtWzqT4SPQYXzRHWQd/9cBpSF1uAaW+8
X-Received: by 2002:a05:600c:1d23:b0:495:77e3:88ba with SMTP id 5b1f17b1804b1-49577e388c0mr81039295e9.27.1784920108360;
        Fri, 24 Jul 2026 12:08:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4c8d6b5sm5893755e9.2.2026.07.24.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:08:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 3/6] net: phy: mediatek: generalize cal_cycle function for GE SoC
Date: Fri, 24 Jul 2026 21:08:06 +0200
Message-ID: <20260724190811.198339-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724190811.198339-1-ansuelsmth@gmail.com>
References: <20260724190811.198339-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_120830_527243_F5630F76 
X-CRM114-Status: GOOD (  15.98  )
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
index c25292f7178a..b4d73954072e 100644
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
index 349dfbdff1fa..9aaa7e3caa41 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -345,4 +345,7 @@ enum CAL_MODE {
 	SW_M
 };
 
+/* MTK GE SoC common functions */
+int mtk_cal_cycle_wait(struct phy_device *phydev);
+
 #endif /* _MTK_GE_SOC_H_ */
-- 
2.53.0


