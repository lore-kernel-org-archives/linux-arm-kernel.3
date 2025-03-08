Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9523FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y89WUthQ/3B6Hb93v7ouG7i3zLLNuCyrqTpYLd836k8=; b=feey1K67MA7Cbyfr4ZpExNmBzs
	T8z7Ad8VzuY1wByCIGUrEJsk1Yc7aBWQNHg75OXbt5lItQqYc8GCGQPLq7RspHMwo/OICQPn5dHjW
	/lSDp1jVajevB8fp2LmDktqtl7SZZ0jK8F18plUHUD3cHwp0dmPY3KEbGaTxKmukO/5ysRnk28Exd
	3sMaageykQMohEDropuQWlMf8jhZ7MuRdb24crNEsACtpo/v9FTJuh/hLx53bnIyz4NgrO3mjuutl
	qdJ9qazpXqdR66F140MDrEYOEO8Igr2YUNebh0BVShBfUYEOx51iBdiksyVfWqqjCwRvZ8vSrChMc
	YG5rXgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtWO-0000000GcZy-1Hu3;
	Sat, 08 Mar 2025 12:43:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtBW-0000000GZeo-0iJc;
	Sat, 08 Mar 2025 12:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741436500;
	bh=0FuXuMBDjykjoq5VV54ZEwRLpazRtku0RrRekgTkR+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YsAF97MABdtkSsi63QVC4BRWfWMDB4Ra8ztxKhfWN9T6fbVZ0DttqDUVVgby/EEEi
	 TzTRrOrgqQJ/tDnTQNMV/3JCaojWrRNSa1V0x1JgBjHx01DGjC1SJGnSOqRqT4DI+6
	 GtpG+tv85SJ3m5wXbA3/4+LEbFc4QKq0og75N8iHcBZ2v70BK13jYXYh/dVmhhD027
	 udUKjRGxK6wBjqeyJg/jpCU6+i5Cir2W4cJLXdOSglXkhp8GO63rrwOIvPD49FbleY
	 mY5iQid1KSYEVe4fT9iua1VFdS6/QJ8CW/jR0a3UzXsGU9JKjHVJ7SDffRL1vpGdkf
	 q/tuz9kL7C1/w==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id B776417E0B12;
	Sat,  8 Mar 2025 13:21:40 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 08 Mar 2025 14:21:18 +0200
Subject: [PATCH v5 09/12] phy: rockchip: samsung-hdptx: Provide config
 params validation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-phy-sam-hdptx-bpc-v5-9-35087287f9d1@collabora.com>
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_042142_356609_DFF558A1 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

Implement the phy_ops.validate() callback to allow checking the PHY
configuration parameters without actually applying them.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 04c344394cbea89150bc4432cf26530fa9d71678..0e1391b4c8bdb9cd0facfc80999929700579d667 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1797,10 +1797,22 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 	return 0;
 }
 
+static int rk_hdptx_phy_validate(struct phy *phy, enum phy_mode mode,
+				 int submode, union phy_configure_opts *opts)
+{
+	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_DP)
+		return rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi);
+
+	return rk_hdptx_phy_verify_dp_config(hdptx, &opts->dp);
+}
+
 static const struct phy_ops rk_hdptx_phy_ops = {
 	.power_on  = rk_hdptx_phy_power_on,
 	.power_off = rk_hdptx_phy_power_off,
 	.configure = rk_hdptx_phy_configure,
+	.validate  = rk_hdptx_phy_validate,
 	.owner	   = THIS_MODULE,
 };
 

-- 
2.48.1


