Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E18EA7197
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 19:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=we5xyIHs0NFWcvYDbi577e9O31rX0Xej1rSPQzWrHfo=; b=tI7pfAqt0XZ3gmaMBGLCDkp7zX
	voMCCJsOpScGiGC/rxTsJZXRJE/BXHzXdeGdiUClUnTupGtKJvqHbvmc3h5hnDRMlCoE8Fl8aVPfC
	YJlxFvkp2y3SUplpJGTmMBGaxcAIYBjQVm4TRMkUdAdfVCFpZisHGUr/sP5P6q5F+OYrzLjGzoUvr
	dqbtEzNm21RIuDpdfQzeFFewJLwdE/q8m1/o2rOPEuw2ZMI0PLhaJTikYUrH85lRDhsFm8JDPDBMz
	OstomVpYmivdh5WMKCR9NuQmsMguJszGD7zco1sbcGfcqn4S4HJFoquHXfLBgIopk+Rv2HnUQlcEj
	aG5yizMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXy5-000000062NS-0XJl;
	Sun, 19 Apr 2026 19:38:09 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXy2-000000062LO-3A30
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 19:38:08 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fzJn86M0pz9tsW;
	Sun, 19 Apr 2026 21:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we5xyIHs0NFWcvYDbi577e9O31rX0Xej1rSPQzWrHfo=;
	b=SN/ysULCvLb/0n0ZmFal+NPz5SKWYgcMbk4fG9AJQVSyqdJSi0IZT2hmuwTMM767lLOUSJ
	T2YuZoa8F7RvztKZRjBUpxTqcPc3bIYYi4Afr3AgJlhtp2Q359PlcS//D4oP2sYkwRCuug
	g3qtLlqiDlXjbhZqtvWoZ67lZsnIFhzwEDOHKxuFvoMKK4nZGsh1OH+Z3rg6prLr/Kkdj5
	2RKdCTsAzm8MAY82l1PC/7oHOCuvGWVHjpDj8I10BAfv8aEUQn2rRc7mib/waQ8W+JttN8
	qW8pn7RWA4ZMfVTKiVrYqnipbvi03MI0EDkw3Xp3/nAQxX85jhJky7LpFNtj9w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="NStd01G/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we5xyIHs0NFWcvYDbi577e9O31rX0Xej1rSPQzWrHfo=;
	b=NStd01G/EbLl/qePHAnC2ZYPTFzRaYKmE9Ye/jnrEPYC1t0aPEf8HBfsh0G1Nnbyb5uwjU
	dZG3Sxzwb3Flt77gH8hSayLMB3SLLPT7tDSRk0w0eR5jMD1KVcYyEP41C51JRfHl9FXzbN
	DuxI12UNjqFDh9dbRthX8Us6H77dBCe5hmrAsnH0mCzDldS0nFojeh1mihtNNI18TUvsKH
	5+UECiT+8Qw1d2AFQmbBHdyb7UC7hj/riBL1YRn2AdkvnWfnWKbeSUOt9g4aeGv+WHwdSD
	KGpkVoE8utKFDo7ZAkeVtxWq06H7SiUOVDMBr96pg7VCyfIO6/4vUG0rPcVlig==
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
Subject: [PATCH 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
Date: Sun, 19 Apr 2026 21:35:36 +0200
Message-ID: <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6k9pyw1bts61ocsepbripihpw48mfryf
X-MBO-RS-ID: cba69b7caed497c583b
X-Rspamd-Queue-Id: 4fzJn86M0pz9tsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_123806_966415_C17226DA 
X-CRM114-Status: GOOD (  11.05  )
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

Add support for identifying the R-Car M3Le (R8A779MD) SoC.

The Renesas R-Car R8A779MD M3Le SoC is a variant of the
already supported R-Car M3-N SoC with reduced peripherals.
Enable support for the M3Le SoC through already existing
ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .

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
 drivers/soc/renesas/renesas-soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bdaf..c82835cf6d8e9 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -361,6 +361,7 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
 	{ .compatible = "renesas,r8a779m4",	.data = &soc_rcar_m3_n },
 	{ .compatible = "renesas,r8a779m5",	.data = &soc_rcar_m3_n },
+	{ .compatible = "renesas,r8a779md",	.data = &soc_rcar_m3_n },
 #endif
 #ifdef CONFIG_ARCH_R8A77970
 	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
-- 
2.53.0


