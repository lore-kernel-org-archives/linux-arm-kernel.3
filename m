Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D19C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZKEM8MfJxMwRl+2egRYFg2Re3C6Ro+JszMJWDD/4Ys=; b=nHoEAfF//UM99JBbeaYK8+O3g9
	zp4ko8GCrYSUf3HktrzhjuoTODm404OVTgllPvFKwiWyklkjxv9qWosYOc6rjRC0/sUPu4meou/EI
	lMiuw+gg2oUF7e8ovnHtyPuonftEsRJzH1zRvuPRj9z2SDSgLSjcSfmDxLW7tkRfR5X1qW3vQbX37
	LYpqeCKBPz5FNCb9XusriLDjhT84m3VoaKnQ2rLoz68JaVcpr8JHduGi9X/IbLVx+5aqfJpxD7FFL
	qgyOa0yQQLWvB4t8mVRyCT/hAElTbpk92ARUVAm/SyiUy4YDSa3ZjHwpaRLoqd3DfROd0rVhn3PK/
	PzTe/08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTdW-0000000Ceho-0DG3;
	Mon, 24 Feb 2025 08:16:22 +0000
Received: from mail-m21473.qiye.163.com ([117.135.214.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTbL-0000000Ce50-1PWQ;
	Mon, 24 Feb 2025 08:14:08 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfd287b2;
	Mon, 24 Feb 2025 16:14:01 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dmitry.baryshkov@linaro.org,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 03/15] drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of calling disable_irq()
Date: Mon, 24 Feb 2025 16:13:13 +0800
Message-Id: <20250224081325.96724-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5DQlYaGEJJQx4ZSk5JHhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9537052e0603a3kunmbfd287b2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6Igw4OjIRKxMSTTxOETkr
	LTpPCjFVSlVKTE9LSENPQ09ISklKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKT0xDNwY+
DKIM-Signature: a=rsa-sha256;
	b=JCKF7x87b5U+/kB/X6enR9Kc25Bs/Ie/4myClqGOVri+e003WCe1eF5MD0sDPEUk60+VcF70oBdiy0aZa8nQbm+UKJORQ669BW44X3NHEHfhWZra1+r+d/TCD8BryAGzmdcikhogrxDhCcgQvx8bH9X6S8ZFeeHYNWrDGSiCruI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=RZKEM8MfJxMwRl+2egRYFg2Re3C6Ro+JszMJWDD/4Ys=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_001407_648287_DF2845F4 
X-CRM114-Status: GOOD (  10.07  )
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

The IRQF_NO_AUTOEN can be used for the drivers that don't want
interrupts to be enabled automatically via devm_request_threaded_irq().
Using this flag can provide be more robust compared to the way of
calling disable_irq() after devm_request_threaded_irq() without the
IRQF_NO_AUTOEN flag.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..e23af674d91c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1636,10 +1636,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		 * that we can get the current state of the GPIO.
 		 */
 		dp->irq = gpiod_to_irq(dp->hpd_gpiod);
-		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN;
 	} else {
 		dp->irq = platform_get_irq(pdev, 0);
-		irq_flags = 0;
+		irq_flags = IRQF_NO_AUTOEN;
 	}
 
 	if (dp->irq == -ENXIO) {
@@ -1656,7 +1656,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		dev_err(&pdev->dev, "failed to request irq\n");
 		goto err_disable_clk;
 	}
-	disable_irq(dp->irq);
 
 	return dp;
 
-- 
2.34.1


