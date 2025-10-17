Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC40DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 01:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WufNMZZ/3kF+kxCtpxLWUmoQMaWHtLSOKhsUHckblc=; b=zM/T3jaV+uV2pY37jx3ztj7x70
	/d55O7G1cPkTwwECf5SWntERvdBbe8sNQ1kx3ilKEm5I/fn4r2qW/Pi43Y4q0fmAuSbfZ3NF+Fs04
	FcVC75kHA69rLgvEQylNqnLnD17625x48Nm3uBw+5AK3QAkMPRJ7d96DN3Q7KOjXaAqvwT62H472o
	FZuDlLLhrFYCm6fAuv5sgYDE006zASiBwFCpMB5zaqkLrUJAFKybgomTwyYkNfpInopAjkCl7tVaR
	rng6WSqBPBS9BgHluIWEVhjO3ixKuaAjoWXsaNMc04JSJCEEO0m/vC/xnUmzkFtvcsTpe5qgLk6la
	+p00ceEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Z7P-00000006Kqc-1996;
	Fri, 17 Oct 2025 01:18:55 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Z7N-00000006Kq5-01TR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 01:18:54 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b632a6b9effso876187a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 18:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760663932; x=1761268732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WufNMZZ/3kF+kxCtpxLWUmoQMaWHtLSOKhsUHckblc=;
        b=bj4LrpITfznBeZD+NG6GPcLXjIvfyYjBE9s0WlRP6AovAAQE6gW+XW2wtumJhnPBNm
         XicGwsJkvn5jrzMePwgE19hAhx25/YXo5DtgGENHZPWCdXJb1vPdtQqM7EBIqGjCWXrl
         XXiMvAvI7Jj3QlZaNFCQAtaW1V5cSBDAhEuJdtlOtCaomINn0dm7uDQ0Wxgc/aVTNCpo
         scx1XnRdvYlMGHU1fRjC3bNdjdIpJ+Nfk63Lo2h64jxjwJb9CcQBYaUgLT/EI7Ijx/G4
         Vuc0OXT+YGfL4qdPioo1ZUwGahIPyMPSBlkYtXWJJzmqtwE+fRARqQmPB5l3mVte5lVi
         WEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760663932; x=1761268732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WufNMZZ/3kF+kxCtpxLWUmoQMaWHtLSOKhsUHckblc=;
        b=BKYpRjQ54IjrbWl3Gs0PadBe0pXZo7huakZM7cOzq0w6UEYzIJvxR2NOu9R4yqU/GP
         pOogh6gH8ffmAk7GZc+CEmLtmftqQoD8sfDrICZgaTSQw2dT8UKF91an1ddd9qZMFL+D
         Uaq8CdfT0tB2YD32bH2K/pYhnLywfBCseh5H2nPS5cJs9LhxVbDj9zH+TgXBX6uWbvc8
         MkcFiyjelBfOqMCEvM5nER8aQpN0t7QjTVJbC8GlDw94iDOIJG4sPqQNUuCeNswrZNw4
         cYh8yxlOyGx0Fo685oexOg3OYISwpu6u5jMVPgkOwmP8v/2+AymtggccbQLp3GJIHL2A
         pOvw==
X-Forwarded-Encrypted: i=1; AJvYcCVuY3IQnGYDNk7lWhST6a+gFmmynJ2sB9ogpwt844Lf+lgVwlBbZ50dbqP/HzEsZXNEn5X8C4jG7yPg5hOELj7Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40WBi5aGSVHradA4UQutvirFqSGAkRJorpnYiH5fsBOFaiGlq
	FaXxrp/BCz/iAkrZYhsnQ6OnfGpg6nSZHOrpSrQU0ZqsYFCnqYnDG3Vy
X-Gm-Gg: ASbGncvNX5sk6YkuJb2BYDPMlh6p331K/DAfcwuc3UN/cJxftYZDp4pfspoQ9ZNGxod
	EGqqcY2oO+0mpkb/rE1y9yjZHL9QBxYzj6vwSrxYq1eIoXbgU8coNsqSQr39Gvx2JL0rx+04fLV
	2jIoZkfDt8nd0SbVM1KA9tx7HuloJeIrcXN9ykGLuh4LHpqnAGw248u7uVXEKLAIJzKG9lSYtfe
	diG6ddTkT1ZFd/m82PbXUleIzrkmyHiyns5TtHv2VodYFBigO3qFVU1UFD6Z+Sn/ZX+CkCAX+Ya
	dXZcAxOdurY4mnJyu5nIzkeM97yz2m0aVOe6QUEZq4+e127rx2A0gM11J5/9MeQLPQbG2ZnDrsD
	tyEnUPbjatT6WWUw0fHAhfE6jdasdclPHJMCBI8OBzMO+RnNMZnRi9czsi6Ta8j6tijM/6fnrQY
	U=
X-Google-Smtp-Source: AGHT+IGCscuN23O1/GUCRY7mt5g8A0uy7Km3DMtv6zREsA54udw0SWdK9cRyXK5d1lQXl3K9mp81rA==
X-Received: by 2002:a17:902:ce0f:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-290c9cf344bmr22801155ad.12.1760663931864;
        Thu, 16 Oct 2025 18:18:51 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7b032sm44355765ad.63.2025.10.16.18.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 18:18:51 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 17 Oct 2025 09:18:01 +0800
Message-ID: <20251017011802.523140-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_181853_045589_A0C77993 
X-CRM114-Status: GOOD (  16.15  )
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..b2dee1399eb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,6 +7,7 @@

 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>

@@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 	return 0;
 }

+static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
+{
+	switch (plat_dat->phy_interface) {
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
+		return 0;
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
+	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

+	plat_set_mode = device_get_match_data(&pdev->dev);
+	if (plat_set_mode) {
+		ret = plat_set_mode(plat_dat);
+		if (ret)
+			return ret;
+	}
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }

 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
--
2.51.0


