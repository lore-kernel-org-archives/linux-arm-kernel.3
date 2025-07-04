Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60814C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZaOhFf4xFqn/MuLqb47tUCmytNik21097vodGYyRwU=; b=3tW3hsRzardNSROcyUWNlbzLfR
	4vbMmOsI1nCRdf4ZHTI+uG0pSrPkFg9ky1x4URviGwKQMhjczL7M4iQRJjfZRAT0RKaEo1aphAtGI
	DnEJxiJs3c7yUjHn6FpkwJkSayTxKywhLNMldduSx72TBc6yhSkcEt2SrDyjerwMqOvVlR7gSDgjj
	llqTY7cuiVtKQK6wZi6U+TE+sZaE689tFUi7vpiYqV3+weF4uHBzljq7WoaZBy099lqW2Vm+PSG2d
	iMQE77cw20jDEtd+da5RrhhiljtBzAavoIOaRGtW+5aMiAzUXO4hojcnaPhqqdAxBp6TMVz7aaCM3
	GGGcJWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhVs-0000000EgML-1poo;
	Fri, 04 Jul 2025 14:35:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhKA-0000000Eeyv-0eDA;
	Fri, 04 Jul 2025 14:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751639012;
	bh=ldghlCA/gMRJSmgWfHfOpqHHla57kEBIADI+qzIkLJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j0OSfDCFH8OfiJOhvUn9D6WUpQJvvU4qXHErh4TQF0dt4QlncVUY7xgM7zYF32CGe
	 mfHoZ8eiivxE2b/t3EDAaHeJUjaLpCVjCSUCExJypkk19O5QSBfY9d91nqPjsQ8gvE
	 jyih9f9bX3SHlnoIZkl+KLy0qTotzF4ZOI9uswffr2YhjkWxIZEpNRIpjfarVGz/lW
	 x8EkNZeZR4fGWPJ2kAM/RuxGhh1pHKxsIJwRYKRg6ZJ/76kYx8m8chW0ChJc5UzTJa
	 ZJjolJHfLo9uVPSYX5kfwLG51cJ85x6EioqsO6eLm63jQfz8818VaJEUGwQdXtaVI1
	 B6uTSDgXViuUQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2C9D917E090E;
	Fri,  4 Jul 2025 16:23:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:22 +0300
Subject: [PATCH 1/5] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in
 dw_hdmi_qp_plat_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-1-2bd8de8700cd@collabora.com>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_072334_368236_B70D782B 
X-CRM114-Status: GOOD (  11.39  )
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

In preparation to support the CEC interface of the DesignWare HDMI QP IP
block, extend the platform data to provide the required IRQ number.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
 include/drm/bridge/dw_hdmi_qp.h                | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7d531b6f4c098c6c548788dad487ce4613a2f32b..126e556025961e8645f3567b4d7a1c73cc2f2e7f 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -539,6 +539,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (plat_data.main_irq < 0)
 		return plat_data.main_irq;
 
+	plat_data.cec_irq = platform_get_irq_byname(pdev, "cec");
+	if (plat_data.cec_irq < 0)
+		return plat_data.cec_irq;
+
 	irq = platform_get_irq_byname(pdev, "hpd");
 	if (irq < 0)
 		return irq;
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index e9be6d507ad9cdc55f5c7d6d3ef37eba41f1ce74..b4a9b739734ec7b67013b683fe6017551aa19172 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -23,6 +23,7 @@ struct dw_hdmi_qp_plat_data {
 	const struct dw_hdmi_qp_phy_ops *phy_ops;
 	void *phy_data;
 	int main_irq;
+	int cec_irq;
 };
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,

-- 
2.50.0


