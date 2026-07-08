Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B775CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=; b=gEGTsJid08BoB52dcG9LMJ5RVF
	WIbmsrz3hMv1OMkBIkKrWAN7K8ZngpWt5h0szSjBt/sjnV9N2NF93/pfYY/ECczEb/Q9kjX77SzA1
	xPle5af8HUjploHpkDG8mpwsIEflAwIYD8kGdECwDvoibbLCJ1bUZ4N+QdN5nehRUkPgbmrrSD5t4
	t67tfy5RjXgWPy6hZYRPWmbgml+MmiwQXXAVyhEhvKy1cKlyChjXIoiYQVyhxSWvbqMg5bWT5zSZc
	H2UtWwqamZDRjET5Iy7QstTE6K/Wrh/KShbK5jvl5i9ZIOegr/an+CNHdqFuU1vFoUKjxMyva/aGu
	BE3Me9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRd-0000000Gt0p-2kyd;
	Wed, 08 Jul 2026 10:23:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRY-0000000GsvR-38jC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:23:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4798bea72f9so345129f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506231; x=1784111031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=;
        b=EGjO9p3s1QrIB2SINroUK5HDFcpv7KMB/pTQXWw9XQc5NMVqnQg0BpqDZ4KzAX0Ni8
         1qh2PrlarEM/H7N29kGhTfcgl2/0YaZhiuf7t+6jLOPmaPDI8iJT4+spnELZUAs4QSnv
         ga2834DRaVcI+95/DjUwXm1z4+E0Q22P28Bfufe/sJEdzXPCwexSzKovakQVuf6MCPEf
         vrE6+6txdXvZWMstOINp8qASkrUGs+OPNrCZCiQdKJjyzqebRr09JVfoasfOdlBf/1+U
         wpKo5uFnFzCK1iBrdd+DpPgT+L0+W02QpMYj9o+Z3rAQBBNysyc7OVcPQ9XzOrOSVfCc
         FdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506231; x=1784111031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=;
        b=rCFaCWmDi50YTic+ZHJKkJtjDaNekZlm6g26SHBIKJyT8fgxc9BNeCK5JbCdKl9hpV
         odlSVo7w6GHSMQcOJj4uuepfQJA66Uc80MgA0V6GzKuyZ7O9KUasaraoxMbqXJW9CKb0
         6VLZlkNLz4nfflrkzUiPi/uzsxcCUGzBMTDe1+yZIKFhizDsHUP+aYBqrezZy/6OYiO1
         3T66n88zEOCUFJaO3uu3fvWd5e0eAX2g5KkxkNjyNEOSJFSXEemoS+3SIAK43Fu+S11b
         gy3xFj7Hyu//oZbIp8C8zosLdxzOdyf1ioozSR5jsVSrhST7HpMgtrRrtRZIHjCLRhV7
         iGHw==
X-Forwarded-Encrypted: i=1; AHgh+RprBbpjsOyyjUZjTPB13ld2JflD/Op82IWJcpcVxAQOnjStM4xTPHfiBOmOp7ZPff/WEeWdSJk7xju4FVXU8wxb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe6bbotCRFbxAqRZ98TLEAQXZJhdSbXfzFvbVhH0kKqQWoAWac
	qPZChYudMdOmBjHGS8WFi2e3i8b9y6GXbT8M86mjdKwS2SBrtrVPq2eW
X-Gm-Gg: AfdE7clVmYt4xTCrqHKCerIlcWWTTwyc5vEilkwTUQv6FuKb+IwiE5F3Np18eYalC89
	hl9bva9Fk0oALICGfDzfnjqSR9e6UyJ/KtzI4IQyThkaS92LTMYN4gJ6jnxko9/LMRKvNml8ZMo
	i/Aau8zdSS8ERICXQMrPu/KjtxKYI4LT/NlUdr8JZyLj47bMyDwdWLNwqB4aWByI9H2Lj8s98VT
	OLA7+NeY6/SY4ViUM6/tEHq/YOzwAMK2S8ORsLApvJeaulvY1VhumAqE6xmvClJxKqijWWMmCVc
	2OLlDo38UexTl5zTFqIrfn+i6PTF/cTFVsj/VD58PFNweYSanvvkw1X1agkslJc+jP7yRzx9oNu
	P/5XngvACtW68QQIXXHhrDSZBoRE8SwE9u1SqX/ukNeuRti25GmMRzsgbjjsSueyzwdvQ7HsYXN
	l2uhfrFwSam+v0iB2j90FfpxaOtJvmMT/RcrlE1xkQBigY0wsXkd7DBzIat1AcRrdbHHdzJYWjl
	o5BCvhv
X-Received: by 2002:a05:6000:26ce:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-47df077caedmr1960726f8f.43.1783506230730;
        Wed, 08 Jul 2026 03:23:50 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm40660248f8f.36.2026.07.08.03.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:23:50 -0700 (PDT)
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
Subject: [PATCH net-next 1/5] net: phy: mediatek: export __mtk_tr_write
Date: Wed,  8 Jul 2026 12:23:27 +0200
Message-ID: <20260708102341.53919-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708102341.53919-1-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_032353_381418_08523D6D 
X-CRM114-Status: GOOD (  12.66  )
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
index dfd0f4e439a2..78b998af5238 100644
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
index 320f76ffa81f..f172f7d671c9 100644
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
2.53.0


