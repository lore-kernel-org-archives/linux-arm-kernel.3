Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC1C71150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/nSrIBv4yt3biINdeXeIMPLDfbF9b/T3GDJ71EMnWs=; b=XBpzKm5ZT9e9oqZBR4tay+frmJ
	vO/9ICVMl6xJLjLR0+N0kvIMSsiR1a6V/Ly18mFRmPR9K1MmL0AcNTH5H+8l5omOkUmC3K77HnUfD
	BSaNpZYTxPBDajMFSEw60Y5KGoJPKyGjBcTEv9CL/n8aTZmlLHsjINvak/gTHu10uc5S9/dwcIHY5
	KNVIvXYd3v9klF/pYRWoiRy2rz0ALITqMWD3xhA5/kVp4XSW8rNLO03YhCnNC1oQhqGD8YxZISq/n
	BRFd+VZl8fmrYm/JPbNcdMXtl2QjAVL2kKkuRDlHxpoQdpNDXTYsehE9fzIRtYFesLwn3xnnuWZni
	8io+SMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq71-0000000EjFs-3Hbc;
	Thu, 12 Jun 2025 22:09:31 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjid-0000000DlTC-3rjS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:19:57 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B246825FB3;
	Thu, 12 Jun 2025 17:19:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9C6iqa3FDfA; Thu, 12 Jun 2025 17:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741594; bh=cbcjcKOlSDiXuN1ZryxTPjxHoMCH5EADuQCdyG2cINs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I7aIZh6Ln545sq0unm1sphOQFrhraXVVGY0qJ9f1qHb6rgkTD1MKaaPDlrOh76eXy
	 3arDXBu/Y/9SmV6QiK/P4JbHat4qGTvxLNMN6+gmj7iJDtl5qrh/WK+BRwgUwddmE9
	 UX3CZoiw1fGKKxyWj+S90qOOCZOekNJg/tpmYOwgGOe9jQznHGRubUmziPLU6CtYZD
	 SCn3EzGATpmgQOvUt4adeYZM2Rtv+DGo0hc76JhoFMZRPwLQytUIji9IBKeJYlQ8Ck
	 7zhCHZoXEjsPBoNatdNOANAFsrrZhdja3EYKBx/zP4EW/vefEPFu9MmIxlSz+57icy
	 WY46IgqVm+tAQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:13 +0530
Subject: [PATCH 09/12] drm/bridge: samsung-dsim: increase timeout value for
 PLL_STABLE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-9-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cbcjcKOlSDiXuN1ZryxTPjxHoMCH5EADuQCdyG2cINs=;
 b=tiIUwQi6DLbTe77YgBJLRkD2Oe6Q6xWPTXRYMY/gZ9JE/8+RjbNwurwr9+FECVQNxZx9ijXlo
 38E3959WWPgDBF5hnJ1jpi9uvHuZh8mqko4a4TTPwBQdpQsDGOOkqyZ
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081956_095825_4AA5C928 
X-CRM114-Status: GOOD (  11.44  )
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

Exynos7870's DSIM requires more time to stabilize its PLL. The current
timeout value, 1000, doesn't suffice. Increase the value to 3000, which
is just about enough as observed experimentally.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5787746c63035a94c0b8b7497df61bb1e69656cd..50dcdb9b81f68098936fbb3f121a0010b11cd8dd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -751,7 +751,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 1000;
+	timeout = 3000;
 	do {
 		if (timeout-- == 0) {
 			dev_err(dsi->dev, "PLL failed to stabilize\n");

-- 
2.49.0


