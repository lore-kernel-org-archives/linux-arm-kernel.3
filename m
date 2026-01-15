Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF71D44C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCD7zzui4mpyeNicZ6T9aEB+qCP2HGGltJvzm5FmzPY=; b=InC24NXai/gJwb+YB0iCl+JQp6
	CIHQYXvKAQuaMvSDnvSMZiSQpx8TCW1bP0Ut5kPupNvlSFAoxBd7LxbVSSc9zry0g+2YwX/Zzbmpd
	GQbBbUix8kpzpP7Lp8/YELDpNtXUgSJ19p8JG3uoe4uoSe9hZXWkbhGY+SO38pn8tWSDjMeG6Szj1
	tJKzixuFG3saxCe9y3Rl6SYIZNVnVq7AMf998421GUYGctcFl/kw3K7peSJIipqsUpGmA93oKjPfU
	S/OTeaMv4GLgXood1gRkMtRO1TlbWptRWX7xBNFRRj9U/AUAGi/xPd3eEZ3v+vqI4xux/tfOSYw0h
	wKOzpmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9u-0000000CgYU-2m6x;
	Thu, 15 Jan 2026 16:25:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9j-0000000CgS9-37nG;
	Thu, 15 Jan 2026 16:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768494305;
	bh=/CCrYh7W0suAYtv3OX70FqKaBFbQbCECSAbjQPVaNzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lPB2L/bnwttiLDcMPaDdYqjIwP+58KHPNjI1HKQSw23LRmbm3+sdU9mUdJCyYMvvu
	 8Uz8Who5NCISaIEIJREP1cuV4hLZ9gHkDAle58yEc4whGF7ZRwW8FMzEnWgXMvZDXG
	 wAb0XOetcMxGFh5WKNwnoXFdJQP5gDtuq4BDji50ujakd7BGvIdEaqqcl3TnW0ztGZ
	 z2HoX47znIOcu90MWsVk0bHpwFTYR2ej92wZZ6CREzx6vJJO3wy99vWNq45b+rUNF1
	 DyTAgh+OypfCB2k3fMFyEeR2DKOH4Ls+Pq79SH7ZP9uj9yjHfsmGFR0LkVXMnqPcMU
	 tKmUahKaZGqnw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1441917E0CF3;
	Thu, 15 Jan 2026 17:25:05 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 15 Jan 2026 18:24:44 +0200
Subject: [PATCH 2/2] drm/rockchip: dw_hdmi_qp: Optimize RK3588 HPD
 interrupt handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dw-hdmi-qp-hpd-v1-2-e59c166eaa65@collabora.com>
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
X-CRM114-CacheID: sfid-20260115_082507_943970_F81CB0C9 
X-CRM114-Status: GOOD (  11.47  )
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

The threaded interrupt handler on RK3588 checks HPD IRQ status before
deciding to continue with interrupt clearing and unmasking.  However,
this is not really necessary, since the hard interrupt handler already
performs the very same verification before waking the handler thread.

Get rid of the redundant verification of the HPD interrupt status in the
threaded interrupt handler.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 33b0f032258a..1a09bcc96c3e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -315,11 +315,7 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
-	u32 intr_stat, val;
-
-	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
-	if (!intr_stat)
-		return IRQ_NONE;
+	u32 val;
 
 	if (hdmi->port_id)
 		val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_CLR, 1);

-- 
2.52.0


