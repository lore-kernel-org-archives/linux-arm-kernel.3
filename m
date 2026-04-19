Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0E3EA71A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 19:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FnNg3TksIMKumKzmZ4qUSNJ8kwt6MtGt9eMb0slpS8=; b=cFolw1uy15KaLSM+MDUuLBDUcT
	YF2ZUUgTaGIbjaNKd4lZS82aucOJ5VrJk/LjJbY4gyEMA6sAmAxGbNX91DdN+ORb2LxXlRitgZBk9
	osqeS72r8mO1x5tHD91/rQgDynSEJJlk8CTtrv27UTXDHiW6bRmlVqiT8C7esWhKBaGnEqJKEyvaT
	+CeSHCOLMN+tWTPpAUnqZmEXjOBGyll/IucAy3QBzo4ikEeXYMlqfUCNcEUjsBNCVPHWv6SFjt1W+
	jJIeDUsNr4bxdIrZRaarwputJFc0Jz3+cd8jLcNF7nkMcRJxI348yTjMOQKU/yG6Yed4Nuar+YJas
	eUXAz54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXxq-000000062H2-2QDL;
	Sun, 19 Apr 2026 19:37:54 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXxo-000000062G9-2o6M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 19:37:53 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fzJms0xwNz9t1S;
	Sun, 19 Apr 2026 21:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FnNg3TksIMKumKzmZ4qUSNJ8kwt6MtGt9eMb0slpS8=;
	b=QzS/E9A8qbdRfZ82ZU//neqAH0aN4qYwALAQoguS7PgkBwRdAyqXTVanjExUYKBtyFnobu
	AMpHMbPDNyexpqXhp6Udy5IN222P+FndrijyYgNOs5sqnIVpndzJ/cWn0yszgd25x+26fJ
	RAPWy6PIB/CfNqG0wnLNo64ZE2jb1x7+lcKHesK+9BcNdZImRuUUrr2oOZK7i54CPbD/Tp
	qktdA47Gk6sTd7JPKO8T7sosBgFmTsPKdH/2pNbw0SQyycwEoSTZe9WGcsnJ7SZYEWKLT4
	j4E8wSQXYhNcGDNbn7RbBY0T0w9edGMn8DklzG84MYIrauYn9tyAGeUDK5qRRA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FnNg3TksIMKumKzmZ4qUSNJ8kwt6MtGt9eMb0slpS8=;
	b=QFo+ZNB0Yk+IPkjQPCaavvfHqUv62C/gB4pjU/s1YXkkwwmKlylo6v5UVqXKJ+trKaxx3t
	MxsmGOFJ9fcF7V5oT14w9loAlh9hndqecRRU7Fjxm1YGqnNW0JzN2Fvy2JUdpnE7QFA4v/
	4Z9S4yc0uGYd5xRb7k+VXJkgxOmoEw5ECBJlZyY9aAq/aBEizIj8JwrVUx/ZKtRpYOfQ7R
	RRW38GYjdrb88OcsaoyuwMd8tKK3V9EcZvz3ewMGO35dynbd8SdmKn6byMgr6XLB+/87CK
	huXHaIqu3UFmwBUod4GiqTxWwzdMKE+Sp4GtgYmUxa7UbpdgwT4/UFesAd3OuA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/7] drm/rcar-du: Add support for Renesas R-Car R8A779MD M3Le
Date: Sun, 19 Apr 2026 21:35:33 +0200
Message-ID: <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rbd44fn6ncr4kgk3y9o1gka984aws4zr
X-MBO-RS-ID: 73455de26dd40f857e2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_123752_877081_83E18648 
X-CRM114-Status: GOOD (  12.08  )
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

Add support the Renesas R-Car R8A779MD M3Le SoC. This SoC is
similar to R-Car R8A77965 M3-N SoC, except the HDMI port@1 is
not present.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 031d07f4508e9..be862b5524fd2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -564,6 +564,30 @@ static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
 	.dsi_clk_mask = BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a779md_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_INTERLACED
+		  | RCAR_DU_FEATURE_TVM_SYNC,
+	.channels_mask = BIT(1) | BIT(0),
+	.routes = {
+		/* R8A779MD has one RGB output and one LVDS output. */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(1),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 2,
+		},
+	},
+	.num_lvds = 1,
+	.num_rpf = 5,
+	.dpll_mask = BIT(1),
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
@@ -591,6 +615,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
 	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
 	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
+	{ .compatible = "renesas,du-r8a779md", .data = &rcar_du_r8a779md_info },
 	{ }
 };
 
-- 
2.53.0


