Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E7DCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2wriwwCuGG03tcdpA2vNLIkCQ2Q6zugdIwMiQUBbFs=; b=S7KKW8Ix7Hxops7KW/RnrsqyXu
	R/SLWDwdWtNubDcQiCdl1qyJRoBoPO4M3DUdrQrX2S4L7iwCoYLNkyw8MNUkAdgFYdVbYuEneaz6x
	dhnlV5IBJQ1dRMZlcmHgszYWhVoPD/ZxvmwjIQ8Yo78Ku7jD59Ad2RCbQ7M4Xt8Xpj4ULQSBVQPMA
	UlHsciBiYKmkqzGKefLGIrmCmX7lWlNBvqKqezkqmze8HCaoD1MDgrq8KsCo5Oqxjb/PDr3nrjWcz
	y3moboZiJOSi9KAUIJndJ239Z4L6P9B+BKZwZhDHBWph98Bfjra/n+VX93caZ/qu9/Plx3Q26Muo6
	OBM3+Rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0j-0000000ANzs-1YS1;
	Sat, 11 Oct 2025 17:04:01 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0c-0000000ANmd-2OnM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:03:59 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVLw5YRdz9swL;
	Sat, 11 Oct 2025 19:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wriwwCuGG03tcdpA2vNLIkCQ2Q6zugdIwMiQUBbFs=;
	b=yC3vECz/W8QUTOGG9iIXnH/8ccYmTYzhSUOABtp+EOwRyNvtW//1gqC2kCE1wzkyVL7hzC
	5AYeFASONG690eMolQOVTXkn7hhYi4T6zE9qIy7sY4opaZsbeRieuQ4Q0ab/LEeiT3Vp1z
	AswdkrF51WUo3d9lc028wzbcqxo3BeBnNEwYSlN0Pb5iiTG/otmQhV4R4TWfClfne7uNK9
	gItSf07SjopNanA8RFo674RV7A09zxt/JDfrUh9i592XIV72N7/zNvKxNUQyZ4vtkUXwiM
	0rbTbYybzolDCUmakm01yLGyxuiikXdpMc/rUWWTrI1usP+pm0CmoUnlXVFP0A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vhTGkFy8;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wriwwCuGG03tcdpA2vNLIkCQ2Q6zugdIwMiQUBbFs=;
	b=vhTGkFy8dlQURfQ4XqFzPeDWi5l3EsnTevi0EGeogKj8BppU0nNs6bU00n/UTLPr58X78W
	4O2y9zBeSFBC9aI5YPcNXpZD5EDm6DlyfbtX6rhLVPN6EtnzI3hfOC/K+PQkpKverMcaP0
	6MX/SzmfqrjvAgKKL3Yvc8k9oxDYLMksdmEIi9ifQpwsaV0eUZ4wRT0xGfkLbl4QDn65nH
	yZ2wzgMAcTTP530CS6mmrc8066HROZbytmerxyTCPXGvIp1LWmNOlK+ADIRP5+kNEbF0FS
	tfbE7/S2rlI8oG/fTNnca1N748l+9zjUxNAJZCmaj2vUy47WSHcJY7U17+YaJw==
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
Subject: [PATCH 21/39] drm/imx: dc: crtc: Do not check disabled CRTCs
Date: Sat, 11 Oct 2025 18:51:36 +0200
Message-ID: <20251011170213.128907-22-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f051028d3c2b282923a
X-MBO-RS-META: ztdi9s6gzfo1aq94hdnq1xhnz89pchbm
X-Rspamd-Queue-Id: 4ckVLw5YRdz9swL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100354_791835_4C39DC40 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

If the CRTC is disabled, do not check it, as the check will fail.
Skip over the disabled CRTC.

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
 drivers/gpu/drm/imx/dc/dc-crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 56991cb033945..4955f519db917 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -156,6 +156,10 @@ dc_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	enum drm_mode_status status;
 
+	/* If we are not active we don't care */
+	if (!new_crtc_state->active)
+		return 0;
+
 	status = dc_crtc_check_clock(dc_crtc, adj->clock);
 	if (status != MODE_OK)
 		return -EINVAL;
-- 
2.51.0


