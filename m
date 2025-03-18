Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A75C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jsVoQFAAMRArGfm2q8MDuI3bUOmibgzyESAoA/pH3o=; b=huRWhfN1+ELOsthZoRVCvIUl+u
	zlRRDZ1mozkeWnJWoGFpBGhQzD73hdFgbl8qdvgLx4c8SigF1Wq+ozw6lmd/4WBvt94qekgyil30U
	HkSiRGDziSv9HYiXMNWHeqlzyt40yr1jEbrAjYQ2Ggm4zJ5d750d/z9HhIWkpSTtymk7SPFpTqI0z
	P0SVB0yoaBtNo6qbApRyp8Xr234R2ephbVpYsQQS8MvPVpoAMU7exb8uDUfm5KyzFoKwakOTToiIk
	Ev8ZoPds8RCedBtBWyDA5UgPJKpcAHSZYODU/jo4Iaw4hsi/U3fopKJPIbSMqCvYWotZ98UJ5sxV1
	1rHB+MKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWUm-00000005wsk-1ROI;
	Tue, 18 Mar 2025 12:56:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWBy-00000005tiA-0mcC;
	Tue, 18 Mar 2025 12:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742301428;
	bh=aG30KK1p/B+lR2jUKCsSMX/hbHCZwxoH+wE77U6sY6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JKqxzmtr+KaFPraPJuuYgWRxUxBDiLm/yteDvsCuZikFaslQBeqT5/udfP0uSAKWY
	 N4+r6hdLLKsNEkzO+o0t++UFwrFU4/p6dcroZBVkNGkKh2UKqcmE5PC5JGKuOLcAyR
	 HEVlmDLQsCOH5M4SNYrlLR9LpiTgJj28CuMi6yepNqJzJQx+rLrAH944MSMVA/Ba2N
	 gRo0+dgIkWivwwBzk+X2zL3gk/GEC58IVsH61OcmTZO7CZnmmhoGUBjgOeDAtkfBzA
	 xIGdIFau/63Wq26fmPvxrTagqo/43MF52BZiCVs37qvakr6JMKJoqe+t9YEJGDvXuo
	 nOHZhU9HKk1dw==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A145217E1555;
	Tue, 18 Mar 2025 13:37:08 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Mar 2025 14:35:44 +0200
Subject: [PATCH v6 10/14] phy: rockchip: samsung-hdptx: Provide config
 params validation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-phy-sam-hdptx-bpc-v6-10-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053710_379826_D009CA15 
X-CRM114-Status: UNSURE (   8.36  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 62de40515338730a56a83972ad57a7e71c3ca5cb..80dd896861bcac6ef9dbde410327b893f8039627 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1799,10 +1799,22 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
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


