Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604E4CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=; b=LiN+IqcmSbEw3N73iRvv384X8J
	FgzU7kN4JWHqiuQ9NVtjkiuKLdzk1m3cxWC3zmAx+yX/M2A7D/oITpE8p0rxMc+wbYEe4NoE0Jq9T
	zv5HpJ2OViq99H+uRhH63bajqK8WrQD5xfKw5H5lQLkag+q2gNPbLKpUg6xzISHWEdy85kfOFcZve
	sxOtm5wUwtVwOOhFhfnuBepLNJsrB1+L4cdu0EwkhKYkr+w/7t/SQ3ECZg2FB55yaBvFAibxuT3Sl
	FtC/xx5eef6JpTaYk54ha7dADlZH1RF4thitjWXP+06AiMMB8kqmvwgoE2JJ/N05lQDNC1HNny66S
	fSJGoLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFV-0000000Ei1d-3mTK;
	Wed, 14 Oct 2026 07:18:05 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFR-0000000Ehx8-376N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:18:02 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso26810945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962279; x=1792567079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=CZU9KDGTqQtlwGxAGsywmh7mwBWI2Tc9IZK3wPa874A5FLrE87fqQu5Kc3RPD+jvDx
         ajwG/PBQ4pUTdGuCQxUexBiVFcm6GX+qvMD8mUy6/FBicoEKBC/HBtsiWYiQhRM6uqej
         QHAO4vBTRNdUQKpxBhCUzYlZZJHgT9LGgPWDW9UiSgcziT5XW89mIOT3Unlb9m/S5SHp
         e8c7RyOjGv3u3q0g8namu0Rxp0VZcEhjDTbbfhJw6fYf6LlRzMtduoMS0QkRt6dLtmnU
         zmfrU9bF6TLb17RChglCZExvacnoVH/kKWIOPrCNy5MnqZPQWzx96T22dRzVJsErRDk8
         y2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962279; x=1792567079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=R+w95cZXUq8dP8e++wB7YuMQ+2/ahdJm9XF2iKF25QqBmHiTdHr7qE41Z2ckJjIaHQ
         LdjweBYWCJ1l1mBlMbETPEAWEGlxqEULdky222HsEP18lZpUmbZ20Ogttr5GHbLDEUaI
         q+c4btZDcMA0MeUoJLVQBJvPVkztCVSbpLnxm7KR0col1h6xUAfUxu4PytxxPtd8JG+t
         qKQOx3xM/MZoHawhNiQbrYq520Lj8bxbc/lSTLDq74yyxGt3ovNTMfJtfKc3DjRAL/9r
         7ItehoEj3e/6qBxL+wAxThxX/JJKAsc92n/apCV/P3cwh1AHDaKS+G0K1SjFrJDuNrd4
         eF8A==
X-Forwarded-Encrypted: i=1; AKwUvByttIAHElJAIC4BbipWCRyTbuI/Ohzv4D9pKrfyo1CXtguJxBSOUbC2Ej5grJoN6z0IdQeeZIk7+EfJDUmhgk2W@lists.infradead.org
X-Gm-Message-State: AFq9FYJGTWm4kYg8HFC7O8n9XCq03lkOquMGeOZHc1L2/GYq83zCB4WQ
	2KN2Iiqatw0pdLCMua3pb6BOrAxXoTK38GIKdRaSi1zkVNE3qmhbPKfqsxGCpg==
X-Gm-Gg: AYBFou1Cs8OxHpP3xuOddrxiy27AA4g73lkzlcdtg1O0u/RANPczVswiJo4GZOCy4he
	Br/Lb/b4ye/+XTFK2c+ZK+/0Lxa2gpVSWPcCS0Wu1eeh+Yqmv7Ncbvx5TknCs/H00OAotXSc93U
	Y6HfQeGxwffBgP7hFB64O2qifrYt8VISXHMuKlGEYRIlHoJV2HrCFAeWZwFksLXFBdDLsb9GMZd
	poKHyR7o9Vskamn1onbf8mzZDUWetI5goP9S1ec6j7KSII1Y6+jgc1Dgx1+w1hpFgPvr28zfvhr
	Z9AT745pvtVV0+qHKHnUKZcutjuYPZyDZYVYgdSCuhcH5krdlDyu05Yn7Y921EVel1sS6UialwI
	dCEjmABatrWbNN5IXPO894uQQsbkU0rd4hfwlq9Xwpam20ukQofAsDyEjBHXSrU4d07wmOYwvXZ
	QVdEheIcVW9bFoQ+LVdRPlQb1REo1/fvyTSkCuNSIIZt6074B00Iqo+hJn3XWFbhOY2noc0jrfb
	1//X5EcTyzK4QA5m6HU45r7sSjP2q9DOL8cq0nUIB5J22l7TYJWEFoxmaPOUffSHjqiVyesDF1v
	sIo19VKbp9WDCqcCjqe/snfUtFmKQWH5
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr318247985e9.20.1791962279370;
        Wed, 14 Oct 2026 00:17:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:17:58 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Wed, 14 Oct 2026 09:17:32 +0200
Message-ID: <20261014071739.216345-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014071739.216345-1-ansuelsmth@gmail.com>
References: <20261014071739.216345-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_001801_799185_CA06B267 
X-CRM114-Status: GOOD (  12.12  )
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

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 4c4eca870bde..3e4fb899a85b 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -36,8 +36,8 @@ static void __mtk_tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		*tr_high, *tr_low);
 }
 
-static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-			   u8 data_addr, u32 tr_data)
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data)
 {
 	__phy_write(phydev, 0x11, tr_data & 0xffff);
 	__phy_write(phydev, 0x12, tr_data >> 16);
@@ -45,6 +45,7 @@ static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		tr_data >> 16, tr_data & 0xffff);
 	__mtk_tr_access(phydev, false, ch_addr, node_addr, data_addr);
 }
+EXPORT_SYMBOL_GPL(__mtk_tr_write);
 
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 79e09727b81b..3565e39b96a8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data);
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-- 
2.55.0


