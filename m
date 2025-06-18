Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA32C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ea8FKYQ5V9ExQA/zTt267Zd86SEpISgQvnKJKRVI550=; b=Bd2SdiKyhMR/3MXnRjRU31Osj2
	noXF8Fmg67wPfWKPH4MaBUUqRvnTgwFn7h7Iv2KrQ1mN9/5dwpNTxBP0CYysghz6DpLClIEL/IdmA
	8pBOp8rLI2upzOLWfdqKGNH6WoZS3ktHvcg2GgxesiPlVUg/LSVcgiLhBEa0x2G19aWWvsjQXlrPM
	ZGkX+/K73yNAr6pIuAt55NBG+R1ovexrzy6sab1i0vyDGVmcm3yZ8QVGut6Uk7YKBxCRv/y3vvXcK
	h9h0SPAv5emu7TP02XTY7zY/ZQ4X6NxrmScHZ5k+VzAuLkGwYiw9W/sXvw2deYKLhGlVnn5gPyqx3
	lFr6qAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnos-00000009Mgl-1YPs;
	Wed, 18 Jun 2025 08:06:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRncI-00000009LDp-0sTs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 07:53:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750233232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ea8FKYQ5V9ExQA/zTt267Zd86SEpISgQvnKJKRVI550=;
	b=ihC9xD2YnV/u3tQk3G9UxLCeNQZZI9UEWueLGrqzdz4a+Fo+ibeY0I6tXh8ISteNqGuTnp
	d5f6rk9g3WLLeB0ZLU6/jm0CFVPFYmkIvkNZ8vm9aV9fp3iCCCRDIftIeI4t+03iLAJmrp
	JzWUziFhICj6JWcxKgnpccxPeFhJNjLgQm34E1Abh+LN45pMjaRcZ3txY9az2S90ideB72
	dYf3OgidbX4I06BPmCnZtE1Ra3Q2YzIs8wX6rL3aHP4+bc4yofrpt2KjXihDeWqbAFsjn2
	R33eRfu+NgjKjJbeCENctYbhbSHh+vuRwwXTj7xxv8p6T9iAMir3+IKWDAWbuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750233232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ea8FKYQ5V9ExQA/zTt267Zd86SEpISgQvnKJKRVI550=;
	b=xnUmmzXVhHriwZoRSoBFDkHECYYOaT9HlTRjdtzDIh7/w7nYBZZqGX6gxdbZc6NkrndBzU
	Bx48dXmlRpD2s1CA==
Date: Wed, 18 Jun 2025 09:52:20 +0200
Subject: [PATCH 1/3] drm/bridge: samsung-dsim: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=1738;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sxPniixtv78HeENSdQLWPrFdDqTbAf0XLGgHM3Oyj5Y=;
 b=RmDVzVHrOK1/SRUIDkyh36blgd1I1AzXaNihza4YNvCLRnV1ypxUVsnr+7ZnFeqfJyKQjBlaR
 swO4I8KwM5eAqqFfdOZbGNwyvmlyZBFYBpQxTDAHDI02JzdhKDJuzIY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_005354_384032_1554C1D3 
X-CRM114-Status: GOOD (  10.98  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..bccc88d2594840647d7107c13d69104912087384 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1095,7 +1095,7 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 	bool first = !xfer->tx_done;
 	u32 reg;
 
-	dev_dbg(dev, "< xfer %pK: tx len %u, done %u, rx len %u, done %u\n",
+	dev_dbg(dev, "< xfer %p: tx len %u, done %u, rx len %u, done %u\n",
 		xfer, length, xfer->tx_done, xfer->rx_len, xfer->rx_done);
 
 	if (length > DSI_TX_FIFO_SIZE)
@@ -1293,7 +1293,7 @@ static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 
 	dev_dbg(dsi->dev,
-		"> xfer %pK, tx_len %zu, tx_done %u, rx_len %u, rx_done %u\n",
+		"> xfer %p, tx_len %zu, tx_done %u, rx_len %u, rx_done %u\n",
 		xfer, xfer->packet.payload_length, xfer->tx_done, xfer->rx_len,
 		xfer->rx_done);
 

-- 
2.49.0


