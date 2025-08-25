Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1ABCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xItNKg1VDmNWcc0DtcHdaB+5vnIWXQTnd7bSQ7T2FOw=; b=3LWSSgXw9P9NQAglgXmTyDhZBn
	7aTFDE/KVMg4RKlIIUBauRFWHvfjrxBF1790vIB9chNEo33DwVX5STtkQN0YlvSRBC7LtRKY1o7H5
	Xatcl9fcfGhN2v1Ng6Em3Q+NoMfW0KZZdpwVHvP82j0t2ME1BI0MxCMHuolVK2jIl20PKm6Md5JED
	xFwRef+6Zt0WV/F3Xyaaafx6ww1+aGEsZLXftOW0Cc8Qhxbz1v7U4xhD0aj7o3hv9rvix2Jq6pNVv
	f5za6TFWaosuecR8Gpz4bSPgNY+ewFYG+nBZx74DZ0TBwSHImVxD24v8T1OkKLnbN+G+QTZfp2Tyx
	D0NRl9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTcg-00000007W2T-2sbp;
	Mon, 25 Aug 2025 09:36:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT0p-00000007Psa-2rpJ;
	Mon, 25 Aug 2025 08:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756112230;
	bh=qZJVzvB3RYpOJBlaQE6hqE/Fp8nZMiJrz+TTlwmiAgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mLv63d/+/8+H3yf17N8H6yqChGhHVHwgC7VK3Q4XO+ioqw01iGN8jef7nujur1mrn
	 JR08cMTTaVdOmADo+7ODNRXC2eNTvDG2iIFZYCDoCRgN5o6wnBGpT1Q1sNGgikXsCW
	 qEMewjB7NYR/J14XXCK8g8h8rU+APjkTRrdnolYjRpfhyk/drWHB1kpHucNTKaQZL0
	 PhxHiVNgR4cMPHVJUrdHi9RmNZITi77Q1hLz8m4LZ8fRQYnsBsIM5UPDiQpNrhvb+J
	 LRVi36dC252sKCbZkduMWbRtosWI66aO8w7+KLwu4Ik6bPJh8KFuJPd0Ruj3fRm0Qn
	 mujoaySQAtAqQ==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2A72D17E0523;
	Mon, 25 Aug 2025 10:57:10 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 25 Aug 2025 11:56:42 +0300
Subject: [PATCH v3 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rk3588-hdmi-cec-v3-2-95324fb22592@collabora.com>
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
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
X-CRM114-CacheID: sfid-20250825_015711_904795_4877E59C 
X-CRM114-Status: GOOD (  13.94  )
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

Currently the TIMER_BASE_CONFIG0 register gets initialized to a fixed
value as initially found in vendor driver code supporting the RK3588
SoC.  As a matter of fact the value matches the rate of the HDMI TX
reference clock, which is roughly 428.57 MHz.

However, on RK3576 SoC that rate is slightly lower, i.e. 396.00 MHz, and
the incorrect register configuration breaks CEC functionality.

Set the timer base according to the actual reference clock rate that
shall be provided by the platform driver.

While at it, also drop the unnecessary empty lines in
dw_hdmi_qp_init_hw().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 11 ++++++++---
 include/drm/bridge/dw_hdmi_qp.h              |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 96455b3bb7b6a3f6ad488d10bc9ba90a1b56e4c8..42a90e0383061dad6c8416af21b27db7a3ba6d7d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -162,6 +162,7 @@ struct dw_hdmi_qp {
 		void *data;
 	} phy;
 
+	unsigned long ref_clk_rate;
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
@@ -1223,13 +1224,11 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
 {
 	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_0_INT_MASK_N);
 	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_1_INT_MASK_N);
-	dw_hdmi_qp_write(hdmi, 428571429, TIMER_BASE_CONFIG0);
+	dw_hdmi_qp_write(hdmi, hdmi->ref_clk_rate, TIMER_BASE_CONFIG0);
 
 	/* Software reset */
 	dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
-
 	dw_hdmi_qp_write(hdmi, 0x085c085c, I2CM_FM_SCL_CONFIG0);
-
 	dw_hdmi_qp_mod(hdmi, 0, I2CM_FM_EN, I2CM_INTERFACE_CONTROL0);
 
 	/* Clear DONE and ERROR interrupts */
@@ -1255,6 +1254,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 		return ERR_PTR(-ENODEV);
 	}
 
+	if (!plat_data->ref_clk_rate) {
+		dev_err(dev, "Missing ref_clk rate\n");
+		return ERR_PTR(-ENODEV);
+	}
+
 	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
 				     &dw_hdmi_qp_bridge_funcs);
 	if (IS_ERR(hdmi))
@@ -1274,6 +1278,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 
 	hdmi->phy.ops = plat_data->phy_ops;
 	hdmi->phy.data = plat_data->phy_data;
+	hdmi->ref_clk_rate = plat_data->ref_clk_rate;
 
 	dw_hdmi_qp_init_hw(hdmi);
 
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b4a9b739734ec7b67013b683fe6017551aa19172..76ecf31301997718604a05f70ce9eab8695e26b5 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -24,6 +24,7 @@ struct dw_hdmi_qp_plat_data {
 	void *phy_data;
 	int main_irq;
 	int cec_irq;
+	unsigned long ref_clk_rate;
 };
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,

-- 
2.50.1


