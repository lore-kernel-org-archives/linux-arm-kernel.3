Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB7DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVG9LdcOg4MNlFMmC9SiPz2Bmjkcx5yV7a0a17ttjNs=; b=dkCOZGHGxmoI63z+ZGPKIrDXNb
	oMsE40O6HxMFXP4jLFJImKnERs3pMtafbA2mKoPt1vpLGEGPqbQzRlOhlsP1LKnuc0n/PuqPagrE1
	1sKf1lHIM4jn7N0bN1B2lfUaKEOTLhrZfS2a1pO+yawRePi/xZaYlq4FeDfaXoE2keSwFarRMP1+n
	i2eYIARMS0Gd4ah+r2SwnOqgjpyDyyCaQ6Ho3RwpPH9Mqx153vwxFytun/fGljVfxsVAS8ndpWWyR
	t0GVaOBucFAhR8dhI/teNZA0K28yNPHGjSTltngmSIWbtbI2WUtXSM+C/HwHjQTXLYWUTSKAbzQ0l
	FpsGdYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTfA-00000007WiV-1Teu;
	Mon, 25 Aug 2025 09:38:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT0r-00000007PtI-1Yqr;
	Mon, 25 Aug 2025 08:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756112231;
	bh=Dn79h63zUtROM5GLEyGgxHXxWqkWpVUrrxCb6cn+d5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QsQPQlTWB1XrFKi2B3Oc7vbdrYQHWJ9UwkUTgDSdXi58n/Ne29T7Yk6j+/Kz9IwyT
	 kwVwgxueYk4AM2fHXB9DRVDx/ho1bw6KoDZaLTZHSXqUB+0Wi4Or6mqDQZLcC9+N8q
	 J9JLqQM4CltrPjemu1h/V292ihohJxiWexFFFCuJRbe2sNZXjD8S2u1fXsQpfGYupf
	 jjMVPLzewH9kAQSrhiEDBHGWH4F+OWD7P6zCqAK6RnDWjJ6x4WuA1r6L0TNRcEVSkm
	 qtZcXmDYngKjbgOGo3qcz/lcexSqZoTTgRbg5P/Pi626Q5E7TxKlwHJ5BVNh04CM1J
	 UM3hM8SV+g0VQ==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A8DEC17E0578;
	Mon, 25 Aug 2025 10:57:11 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 25 Aug 2025 11:56:44 +0300
Subject: [PATCH v3 4/6] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in
 dw_hdmi_qp_plat_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rk3588-hdmi-cec-v3-4-95324fb22592@collabora.com>
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
X-CRM114-CacheID: sfid-20250825_015713_588744_75C79ACE 
X-CRM114-Status: GOOD (  10.26  )
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

In order to support the CEC interface of the DesignWare HDMI QP IP
block, setup platform data to include the required IRQ number.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 4e7794aa2dded4c124963eaa7f5158bde9bbbdb6..39b46327afd8e4753d96962fad66792d22b33402 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -527,6 +527,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (plat_data.main_irq < 0)
 		return plat_data.main_irq;
 
+	plat_data.cec_irq = platform_get_irq_byname(pdev, "cec");
+	if (plat_data.cec_irq < 0)
+		return plat_data.cec_irq;
+
 	irq = platform_get_irq_byname(pdev, "hpd");
 	if (irq < 0)
 		return irq;

-- 
2.50.1


