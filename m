Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1CAC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPr6vbLu8PqQb1lWRy/QmQ4lRtcpmb3vtoKOeXxnr9U=; b=mZgHpwVeaadt0FGA50yGD39fUN
	9TYP5yosS4ib4SwQ9S5JeKdptH8kImTh8Tw80SjjJGOn0H9iFFs1N+Jrnsngkl9rG/jTAiUts7A5H
	rRaYLPfUUOTp/gULEf73WWfLldiMPtz3TPWo1UHs//AYj5z/ofHGFC+Ntxmm9WrARR1/2Vjuzlj7e
	UZbSpRSLNrCAA2Rk031FCW+HSa2eGk56r5QCDcpwbwezVXc/KNmQ6+iKZewGVWrrx6ylyk9BLekZy
	Vnp3oHJKtmlR8EqDLB73wciFz4qwKnjclVxhdq719DcX8GVrkLgoCVrrFQ8b7hinohj3cWz/KqNK3
	xq21IK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAoV-00000001nlw-1JPt;
	Mon, 27 Jul 2026 02:11:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAoQ-00000001nhk-31di
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:11:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-381b831d535so2711730a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118286; x=1785723086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPr6vbLu8PqQb1lWRy/QmQ4lRtcpmb3vtoKOeXxnr9U=;
        b=ECRFSdhreVWPzyxDKEpSct0B257HrTAroMpJDCW4r6gO2moXvsToeqsMJaWEEc/sTY
         fNgdYxlUfaKUm87+ndjHzMG7a9/mBht8K/a2bS11Qe9yUnPeiBki/eA3gqsXjcJa4TJZ
         4zsC/vW+Oz6S+KnxxCuV5gvb2uXu/P2pYOu0hQsOAOD9GFfh5EdOSD/2Bs1QrJLKUBuh
         oRe4Ew8cct790WvQ6k+zUeOcs58Gifoq/Rf2ebhHLCx8aHbF7vIqUqs404y5iR9yENFx
         klh9uPnXpp3vCcxTjSPZRfRWImXSgRe1WOkiTrwrRQYljVAU8erL3IP2c2eRVkst0Oj1
         aW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118286; x=1785723086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPr6vbLu8PqQb1lWRy/QmQ4lRtcpmb3vtoKOeXxnr9U=;
        b=fuLSuRD9q0bSsOluBbMeVXQmeP9NPZw6eUqfSJlAdKmw/GXmdxMNHpllxXpufPS+Mh
         C3N5Xhsc6zfI5hzpWpFSVpSwiNoq67OIfI0++QmGv3tsY3C5+95ngNC9obEhmdBU/0W1
         sejQBgfNyv8qwUK12L4vnAYaN8n+zvkuNERTCqzGySk+a0Cg4oP335gy2vd+YxxNLCkk
         C97SRvUt6NIN4HXy87t9qYglovAH/8PWutmP86hsBQPCoiZZTbFY4SRYERfzLkJUEkr5
         /65l11Bhywr/j4Y/rTqXSLOJViNBCVWlnF7mn1qHdUcSAfnUSi98BTcz1ZdzOxcWSEHb
         yWXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rre0LJLoJkjOSt46CZw6sGrDgZHjTIeAfsJNXDyG5yPdvQtE75kSDhrsK43n2z+lacaj6ZXHZZ/42vPm9Hf8gJl@lists.infradead.org
X-Gm-Message-State: AOJu0YzjrTHRhnffT09bcs007G5C9xGXGNRJ/w9V8hFbI3fM3OeLTc/p
	wIlhAOo6kK0nbExAkm7iaMmLTvAqhKE384A5Slk+Rl9i1p5G7DJ8wDnL
X-Gm-Gg: AR+sD11NCH2bbJ7F27d0X4BSfrKlYkBf+1CBqqrT/WL+U8lzLiuZ4xzLRqnc1gNmqGa
	Bw9pvqa+ookxw5DSORoL8MQcZ/9OIfsEwdjWRCCpb2re9qhHJFOKysVxjr+g72VgWsvopuNbM22
	hdJrLrDwYk/lFjGdQoQuwcf3SgprQbIycN7nd/bxyHJNIL+IBxmO2hCJMt2hj3ohFdOviTOEFGl
	GkHfv62mDyIBq1Kclp77XQYSvcacBmZEXBJhw55ljsfqFSsyXZtYnN8+DReMAqYTsT74OmJngTM
	J/9MwET80gxN+kZ5bF8SmOB1A0nsghUOuWaqC9m6RBiQGQFXXVMshMg23txEl+GzJWaZlzOkA1Z
	1q0t8sHxWnmf5TFgLnnFT7J0+sGVSigG1/0Q8kZ4Ahd2MPK4+154HtsbT+mQWgbcDpee2Oydr01
	WwoD2/MtAQS2ayfGWHRKasutE=
X-Received: by 2002:a17:90b:584f:b0:38e:79f:76c6 with SMTP id 98e67ed59e1d1-38f29641ae1mr5689783a91.24.1785118285724;
        Sun, 26 Jul 2026 19:11:25 -0700 (PDT)
Received: from attina.synaptics-inc.local ([199.33.119.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm19162200c88.13.2026.07.26.19.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:11:25 -0700 (PDT)
From: Gavin Gao <attinagaoxu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	nicolas.frattaroli@collabora.com,
	sebastian.reichel@collabora.com,
	sashal@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	attinagaoxu@gmail.com,
	amadeus@jmu.edu.cn,
	rmk+kernel@armlinux.org.uk,
	horms@kernel.org,
	alok.a.tiwari@oracle.com,
	david.wu@rock-chips.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 3/3] net: stmmac: dwmac-rk: Enable RGMII 25M refout clock
Date: Mon, 27 Jul 2026 10:10:47 +0800
Message-ID: <20260727021048.3375444-4-attinagaoxu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_191127_253688_A92711EB 
X-CRM114-Status: GOOD (  15.61  )
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

Boards can set clock_in_out = "output" to request a MAC-provided clock,
but dwmac-rk currently does not enable the optional 25 MHz RGMII
reference output clock. The common clock framework may therefore disable
the clock as unused.

Request the optional clk_mac_25m_refout clock in RGMII output mode, set
it to 25 MHz, and keep it enabled while the MAC clocks are enabled.

Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 643578266dfc..5e7e5e8f8d62 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -81,6 +81,7 @@ struct rk_priv_data {
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct clk *clk_phy;
+	struct clk *clk_mac_25m_refout;
 
 	struct reset_control *phy_reset;
 
@@ -1419,6 +1420,24 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(bsp_priv->clk_phy, 50000000);
 	}
 
+	if (!bsp_priv->clock_input && phy_interface_mode_is_rgmii(phy_iface)) {
+		bsp_priv->clk_mac_25m_refout =
+			devm_clk_get_optional(dev, "clk_mac_25m_refout");
+		if (IS_ERR(bsp_priv->clk_mac_25m_refout)) {
+			ret = PTR_ERR(bsp_priv->clk_mac_25m_refout);
+			return dev_err_probe(dev, ret,
+					     "Cannot get 25M refout clock\n");
+		}
+
+		if (bsp_priv->clk_mac_25m_refout) {
+			ret = clk_set_rate(bsp_priv->clk_mac_25m_refout,
+					   25000000);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Cannot set 25M refout clock rate\n");
+		}
+	}
+
 	return 0;
 }
 
@@ -1433,9 +1452,13 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 			if (ret)
 				return ret;
 
+			ret = clk_prepare_enable(bsp_priv->clk_mac_25m_refout);
+			if (ret)
+				goto err_disable_clks;
+
 			ret = clk_prepare_enable(bsp_priv->clk_phy);
 			if (ret)
-				return ret;
+				goto err_disable_25m_refout;
 
 			if (bsp_priv->ops && bsp_priv->ops->set_clock_selection)
 				bsp_priv->ops->set_clock_selection(bsp_priv,
@@ -1454,12 +1477,20 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 			clk_bulk_disable_unprepare(bsp_priv->num_clks,
 						   bsp_priv->clks);
 			clk_disable_unprepare(bsp_priv->clk_phy);
+			clk_disable_unprepare(bsp_priv->clk_mac_25m_refout);
 
 			bsp_priv->clk_enabled = false;
 		}
 	}
 
 	return 0;
+
+err_disable_25m_refout:
+	clk_disable_unprepare(bsp_priv->clk_mac_25m_refout);
+err_disable_clks:
+	clk_bulk_disable_unprepare(bsp_priv->num_clks, bsp_priv->clks);
+
+	return ret;
 }
 
 static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
-- 
2.55.0

