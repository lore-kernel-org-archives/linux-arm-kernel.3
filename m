Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3C7C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4im7yFygqhVXMzroWKS4fxmjDhgHN2SFk+xIpto+K28=; b=bpq6a/M8f4lGAXe8ov+fvOwYKK
	0LpGIi5TYU3U4rwRooGNuEgQpCWFoUVHJ3ghLWtrDDbZlSRXqXYwm1DNpU7jwQMA1QQM5TXWx8LPU
	LuIwhDiIudFrm9cXqlLJPJ3ac53NTJIg0A+tSIehvlndNdJEY7x+aatmqPtDoxbmqg3dL28r8lxKT
	e8fGpSloKSiDxcM/uvhNRdooJmaWwdd1wToTYj3ZQzRO5XrZg6IPB7/RnomlwbytIu2K8jdgqZ1uW
	68h/8qsEG+mu9MHAII47Q4pxk8n3qe9dm3QCi7TvqcMcwEXwPEOuINd5mbHV3H9j9o5swjWsGOmd0
	iBdD4c1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2T-00000000IUq-0ky8;
	Mon, 03 Aug 2026 18:05:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2H-00000000HzD-0F9d;
	Mon, 03 Aug 2026 18:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=rOsKM/zjSq0X028wqv1+jYbJx233lxkUUgYLIiOgCtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EGqnI01kLRHl1KnkP7reR/J1k7h/jzjOIdY6PRubiwSijQMK0K+d8edMumKJyrLls
	 z9Go4yDZkLjfgjxYHa25yd47Sc7gm2rB4SBOnnNGb/04kg4gCtlQSxSlJvo8kb1Ujn
	 h27pPsLIfFp5c9ccoLOhCxNSQz1+IU2pfl5iRdd4GGbCNkOXNXnEQVJKudpu3MtsUr
	 fBX13dm7j0kdPWAib3UE+6DZ1jH6iq1PgjviNbC+S/30L1RMXhdqXFMabPqKR4BT7r
	 jE1XKibWing8eXdlw1vssD4PjLh6ulh/pxp+ln/WIINWGybiwFug3rsFXYZplAKKEb
	 Uq2WALngyR5ng==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D1BC17E10B0;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 675E7480031; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:06 +0200
Subject: [PATCH v9 05/22] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-5-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rOsKM/zjSq0X028wqv1+jYbJx233lxkUUgYLIiOgCtI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E73YZmyHNQTMHscrgEn/ryx/jJye3Bg7
 HTzeyY3H/mc1okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qaAk8P/3TIk0vgVsZRQBIjRRmBfUF1pM6Kk+dFvWBQzOlbzMmY0e4kV17jV+mq7cdRL5aILhO
 ObnATdYlBKkHFIZ/DNghyT+nVG1ZnchQFwE7RlwRbgIFeMYY9NmFG63gzXsBqsh7YTw2CtqGKrv
 QhwmgFYW4pDigs1sNXSWEkR8UjszrMJ0n8ppB6sNSuk3p9jQiN7SwMXABlH2CAFTbd5PsgZBeqv
 TwgZV/6DH+hJo0CmYysit+zbsV6fkuWwGRRrxF/L3LxfngSNM+NIK6uGVnhvBF+mGcIz5CZo3A8
 wyqXwdYAVVwXDeCgSMEsN+xNiSQDubh8BgMOemtEfqzDlsvjybyo+iPDs+ovxfOZqNfd/t8EHfD
 LwPw/Yc+T7l5LCGgjhCmhi2ZB6NjPc0ipg/c+aW+0Sm4U/L5pKQ60Lpco3B0MnIhCpthOViSX8v
 rV230PHH/x40d1xSOGbRQZBB4D2WtbAUD1cOxM9rpHpDOiqN7U8s1J/DD9GkAc3fF1GBkdttxPU
 z1yUuq64BZuzlAPEZ/kYMKOw8cxbNsipEOgTjwTkAwB3CVeBRrwaKDGenZnAbM0cNO09XRhx13M
 z/FGXIZ2gRWlheFrdJZj4h0vIJroIb2VSonBtZRrcJ6EJDZOK1hhIoAATmeW0zVhe2p+LwGctL0
 mswTBlhR1004PqdPA34kjng==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110513_602294_9AD5A88F 
X-CRM114-Status: GOOD (  14.57  )
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

If the driver uses devm_reset_control_get_exclusive_deasserted() instead
of devm_reset_control_get() and thus automatically deasserts during
probe, the SoC will hang when the device is unbound.

This does not happen, when runtime PM is being used (not yet supported
in mainline), which suggests the power-domain involved requires this reset
line to be deasserted.

Even with runtime PM there is no gurantee that the power-domain is
disabled as it is shared. Considering the power-domain does not have
the reset dependency described in DT, document the problem but leave
things in the current state until a better solution is found as the
reset line is deasserted by default on all supported platforms.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 278953a8549a..facd1c479992 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2088,6 +2088,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 		return ERR_CAST(dp->hdcp_clk);
 	}
 
+	/*
+	 * This reset line is deasserted by default; asserting it hangs the SoC if the
+	 * related power-domain is still active.
+	 */
 	dp->rstc = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(dp->rstc)) {
 		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");

-- 
2.53.0


