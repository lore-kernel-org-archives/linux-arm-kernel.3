Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B13D44C7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+jXMyMhXs04yFOKhEush+PUVMJWmYgOyDXql4Fgxvw=; b=ROr1CoMKujLbaF/+O8lL2VS6f6
	QEfGz041HlbqGw4kr1WLekfOH24PGW1ykI0xOKuNYgMaM3T5yepzK0hnTZO8pNW9I6wmP3WIxUDwD
	OX4++kRvsnPIVTanC9gD+J4O8TUmYA/aAZuWqpwXwvmA7JZUT+GxxpmSTnfH3u84CXihFuIjIFbRo
	eXLKRwTiy377dMNYBml8h7zPewLrMjXSOGCpj8WciRs9u3Bl67qJrn5X1ijumtQDgdIUHrUB0X8VM
	QCR3eokUAYp9yfiHpQioJOOx488c/jdMicHswfwqrJkHwqizHu4WKnGQoyY9VfKdr4jyvSpigp1QF
	A1jrcLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9n-0000000CgTs-28gM;
	Thu, 15 Jan 2026 16:25:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9j-0000000CgS8-0s8P;
	Thu, 15 Jan 2026 16:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768494304;
	bh=sZkcmxgPloiZOgcyn0CucYEXzZq6QpSQQfwD2zQtYb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JWBfxwqX5FBqNKey+KoyFDp9aSS9Uvly3g/ZY5dIiWJUO85ZF91M2sxIxPRbVEDxJ
	 cAjj+AvfWSKd7GAxs/ebD0maPRPOrL2jS7++4wjjnCcbDShSBTubLgPXTLheIvDfCN
	 eqvhjM8PkUqNkdgGz+AMBDyUvlobK88l7FUNOCHFfXa/DsLprBmPDGr7vACdg1bPEj
	 LisAP8WUJe+qTXSA6+Uuf70fbLDXjpmmqEmYu6m480+L65kX56fQp3useqlHs7aIfF
	 iGJ3b30LVtR+u8tYf8BKMrPeP9CD3rp8pBhBkej9DN5zo/dxdd7tOzIjBLl8XHjqdY
	 c1tt6E0eCPWEw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B9C317E07FA;
	Thu, 15 Jan 2026 17:25:04 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 15 Jan 2026 18:24:43 +0200
Subject: [PATCH 1/2] drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dw-hdmi-qp-hpd-v1-1-e59c166eaa65@collabora.com>
References: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
In-Reply-To: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_082507_403105_E51324D2 
X-CRM114-Status: GOOD (  11.10  )
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

The threaded interrupt handler on RK3576 checks HPD IRQ status before
deciding to continue with interrupt clearing and unmasking.

This is not only redundant, since a similar verification has been
already performed by the hard IRQ handler before masking the interrupt,
but is also error prone, because it might happen that hardware clears
the status register right after the masking operation completes, and
before the threaded handler reads its value.

The consequence is that HPD IRQ gets never unmasked, which breaks
hotplug detection until reloading the driver or rebooting the system.

Drop the unnecessary verification of the HPD interrupt status from the
threaded interrupt handler.

Fixes: 36439120efbd ("drm/rockchip: dw_hdmi_qp: Add basic RK3576 HDMI output support")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c4365909c3e7..33b0f032258a 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -280,12 +280,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
 static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
-	u32 intr_stat, val;
-
-	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
-
-	if (!intr_stat)
-		return IRQ_NONE;
+	u32 val;
 
 	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_CLR, 1);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);

-- 
2.52.0


