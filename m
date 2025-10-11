Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40D7CCD190
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGvU67Ll+AN2vD11o68DZRCZ7+qYUemEkQi2VibUdjc=; b=N9HUV25FsY1/lrv3zKtspXsCFd
	t29VbPrbh5TTaH8uvTd7HiZ0nWwDhDeQ/+DWprtnLTYWL7zLYtnRPGrIKgIqm58QWkQImBMfDKCmO
	r3Em+NO4ASanFU+Joo5xk1CJZ5dT43n642ZqDsYOFV0WYL4Fx0Nz2GIngQSx5KiTVU6vdg2GCg1+9
	YLbqlxSBrBFVDF6stXUE6meHoupRNDCliY/rW+DMQLA6CIqyrPIMTIOZZxtlz2Qi2YN6Z+b30HSH8
	JXMpDV6uZJMJqJnoeiZ6UvMksN38oiiDo8BatSBGB/28lvbsF97NeQveCKDHSfR5kR00T7cq33So3
	EAtE0TYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7czx-0000000AMrz-2c9P;
	Sat, 11 Oct 2025 17:03:13 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7czv-0000000AMnm-2sSt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:03:13 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVL53z2Gz9skV;
	Sat, 11 Oct 2025 19:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGvU67Ll+AN2vD11o68DZRCZ7+qYUemEkQi2VibUdjc=;
	b=aDaGSG2KR1Mkw0pPkqy0fVzhBYzcBBFSvnGYPXXtsF5uJVxbhJSOrAl52bWNQCyn7lUwav
	jwVxDZy9MH8/QNGQaRnrzNjz65dZsZcTej2T9BlJJUAqo8KKqkzTVbpLIQaONFmoGA09y9
	1gwHFPZw2i7FhXc2UX1S/eKDuHWUqIm9fVcvmRIrJHomN+HultzEn+voeiH1+sXSnZifZH
	VqCjNYb/PJrHU+DQ6Jy+pR8D0WOBfe19cvDfrswIbsAc7gHX5fE4nwirQ6mytyi1Vy1wKJ
	ohjfuL4O1lWMzDXfw9EXx17ay66ESL4HhbQUnnMyX26s4PAJYPE285ocYrF+aw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGvU67Ll+AN2vD11o68DZRCZ7+qYUemEkQi2VibUdjc=;
	b=ur7YpcrFHThhMFHM3VbpMXBWIiWhPWJk4+4UlI0gLrOGnCHyWeDX8c40FZVidPIa8nf9LC
	4VKUq+xNVRp16rHWGGEPRFZHxOrclnPgYNsPYzAompmK3IJlI3oaRsnGkDjL4CBMAeB9Ln
	cCMxVnUOTv60YKHiGRn/UyoqEhcdy4dLYxA9iKUFhUTh+a3vnEkonz19uYrT28792fg40B
	BUcUz+xJ06z68eW9a8pFlXOpWLiFSaX6z1SuHb7ICID0H3UQLpD0iryGYE+1DeQyht0EpN
	OcITyTw/zhU5Ld+M6vIJ/prEQoXNgeiU7a/VKnZ2TurGOXr1XNViNQQjtCalTQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 06/39] drm/imx: dc: Rename i.MX8QXP specific Link IDs
Date: Sat, 11 Oct 2025 18:51:21 +0200
Message-ID: <20251011170213.128907-7-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: c7k86a8hngo4pgurui9ibo7yd3r8x4r8
X-MBO-RS-ID: 6efeeb6dac92bdf874d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100311_869152_B7E4B895 
X-CRM114-Status: GOOD (  12.18  )
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

Add _IMX8QXP suffix to Link IDs which are specific to the i.MX8QXP SoC.
This is an i.MX95 support preparatory patch. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-cf.c |  4 ++--
 drivers/gpu/drm/imx/dc/dc-ed.c | 12 ++++++------
 drivers/gpu/drm/imx/dc/dc-lb.c | 14 +++++++-------
 drivers/gpu/drm/imx/dc/dc-pe.h | 22 +++++++++++-----------
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 846705534546a..6cb83182a3668 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -123,11 +123,11 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
 		dc_drm->cf_cont[1] = cf;
 		break;
 	case 4:
-		cf->link = LINK_ID_CONSTFRAME4;
+		cf->link = LINK_ID_CONSTFRAME4_MX8QXP;
 		dc_drm->cf_safe[0] = cf;
 		break;
 	case 5:
-		cf->link = LINK_ID_CONSTFRAME5;
+		cf->link = LINK_ID_CONSTFRAME5_MX8QXP;
 		dc_drm->cf_safe[1] = cf;
 		break;
 	}
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index a63c387a4c023..9a141c6aa0812 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -110,12 +110,12 @@ static const enum dc_link_id src_sels[] = {
 	LINK_ID_NONE,
 	LINK_ID_CONSTFRAME0,
 	LINK_ID_CONSTFRAME1,
-	LINK_ID_CONSTFRAME4,
-	LINK_ID_CONSTFRAME5,
-	LINK_ID_LAYERBLEND3,
-	LINK_ID_LAYERBLEND2,
-	LINK_ID_LAYERBLEND1,
-	LINK_ID_LAYERBLEND0,
+	LINK_ID_CONSTFRAME4_MX8QXP,
+	LINK_ID_CONSTFRAME5_MX8QXP,
+	LINK_ID_LAYERBLEND3_MX8QXP,
+	LINK_ID_LAYERBLEND2_MX8QXP,
+	LINK_ID_LAYERBLEND1_MX8QXP,
+	LINK_ID_LAYERBLEND0_MX8QXP,
 };
 
 static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 34ea61c2de87d..619353456743c 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -124,8 +124,8 @@ static const enum dc_link_id prim_sels[] = {
 	LINK_ID_NONE,
 	LINK_ID_CONSTFRAME0,
 	LINK_ID_CONSTFRAME1,
-	LINK_ID_CONSTFRAME4,
-	LINK_ID_CONSTFRAME5,
+	LINK_ID_CONSTFRAME4_MX8QXP,
+	LINK_ID_CONSTFRAME5_MX8QXP,
 	/*
 	 * special options:
 	 * layerblend(n) has n special options,
@@ -133,10 +133,10 @@ static const enum dc_link_id prim_sels[] = {
 	 * layerblend3 has 3 special options -
 	 * layerblend0/1/2.
 	 */
-	LINK_ID_LAYERBLEND0,
-	LINK_ID_LAYERBLEND1,
-	LINK_ID_LAYERBLEND2,
-	LINK_ID_LAYERBLEND3,
+	LINK_ID_LAYERBLEND0_MX8QXP,
+	LINK_ID_LAYERBLEND1_MX8QXP,
+	LINK_ID_LAYERBLEND2_MX8QXP,
+	LINK_ID_LAYERBLEND3_MX8QXP,
 };
 
 static const enum dc_link_id sec_sels[] = {
@@ -281,7 +281,7 @@ static int dc_lb_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	lb->dev = dev;
-	lb->link = LINK_ID_LAYERBLEND0 + lb->id;
+	lb->link = LINK_ID_LAYERBLEND0_MX8QXP + lb->id;
 
 	dc_drm->lb[lb->id] = lb;
 
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index ffeb1c7af1c9f..866859403a79d 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -22,17 +22,17 @@
 #define DC_LB_CNT		4
 
 enum dc_link_id {
-	LINK_ID_NONE		= 0x00,
-	LINK_ID_CONSTFRAME0	= 0x0c,
-	LINK_ID_CONSTFRAME4	= 0x0e,
-	LINK_ID_CONSTFRAME1	= 0x10,
-	LINK_ID_CONSTFRAME5	= 0x12,
-	LINK_ID_FETCHWARP2	= 0x14,
-	LINK_ID_FETCHLAYER0	= 0x1a,
-	LINK_ID_LAYERBLEND0	= 0x21,
-	LINK_ID_LAYERBLEND1	= 0x22,
-	LINK_ID_LAYERBLEND2	= 0x23,
-	LINK_ID_LAYERBLEND3	= 0x24,
+	LINK_ID_NONE			= 0x00,
+	LINK_ID_CONSTFRAME0		= 0x0c,
+	LINK_ID_CONSTFRAME4_MX8QXP	= 0x0e,
+	LINK_ID_CONSTFRAME1		= 0x10,
+	LINK_ID_CONSTFRAME5_MX8QXP	= 0x12,
+	LINK_ID_FETCHWARP2		= 0x14,
+	LINK_ID_FETCHLAYER0		= 0x1a,
+	LINK_ID_LAYERBLEND0_MX8QXP	= 0x21,
+	LINK_ID_LAYERBLEND1_MX8QXP	= 0x22,
+	LINK_ID_LAYERBLEND2_MX8QXP	= 0x23,
+	LINK_ID_LAYERBLEND3_MX8QXP	= 0x24,
 };
 
 enum dc_lb_mode {
-- 
2.51.0


