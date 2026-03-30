Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE21061B24
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 22:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODB9rq7ZR84AAZrlqWvqsUqMjBVVuuN3nuQZwatjEL4=; b=L7usEjhiNruhV1aKEKkIOozdkw
	EtBHaVmMyhcie/a4bpXXtq5MokTOZVfw/0Q+o1B6ZiKG+s/+IHUdr8HpF9b0Bsf4MvN+D+PV9vPj4
	YcijLceS3pdfvf5Q2qTPiMCt0T27K+/GpxIkCfeHSK4ME3MM2XT60qgeKdSQFBC1h+ERSkcIcnOQD
	4ZktJYRFMkCAnYioSFNdllrH0OP4OGPXhGJY7+aY6KcKVnc7dd4OgDNLgn9TGFEQ0n1I1rfGeJ/R2
	tSVMe5X7oYtdvza6o1YfZ8RygE1OW1RSBDQuxSig5zWpPBoqgXlEwnAL2GNnX6931I0dkRWVYv5iR
	t62o3hgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LOj-0000000Bzb8-2Dsc;
	Mon, 30 Mar 2026 22:47:53 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LOh-0000000Bzag-1v7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 22:47:52 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 606E01F8004D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 22:47:49 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CE1C3B2EBCB; Mon, 30 Mar 2026 22:47:48 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 81F1CB2EBC3;
	Mon, 30 Mar 2026 22:46:31 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/3] drm: lcdif: Set undocumented bit to clear FIFO at vsync
Date: Tue, 31 Mar 2026 00:46:17 +0200
Message-ID: <20260330224619.2620782-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330224619.2620782-1-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_154751_658551_291D24F7 
X-CRM114-Status: GOOD (  14.62  )
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

There is an undocumented bit used in the NXP BSP to clear the FIFO
systematically at vsync. In normal operation, the FIFO should already
be empty but it doesn't hurt to add it as an extra safety measure.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 3 ++-
 drivers/gpu/drm/mxsfb/lcdif_regs.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index ef3250a5c54f..a00c4f6d63f4 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -338,7 +338,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 	 * Downstream set it to 256B burst size to improve the memory
 	 * efficiency so set it here too.
 	 */
-	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
+	ctrl = CTRLDESCL0_3_STATE_CLEAR_VSYNC |
+	       CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
 	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
 	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
 }
diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index c55dfb236c1d..17882c593d27 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -190,6 +190,7 @@
 #define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
 #define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
 
+#define CTRLDESCL0_3_STATE_CLEAR_VSYNC	BIT(23)
 #define CTRLDESCL0_3_P_SIZE(n)		(((n) << 20) & CTRLDESCL0_3_P_SIZE_MASK)
 #define CTRLDESCL0_3_P_SIZE_MASK	GENMASK(22, 20)
 #define CTRLDESCL0_3_T_SIZE(n)		(((n) << 16) & CTRLDESCL0_3_T_SIZE_MASK)
-- 
2.53.0


