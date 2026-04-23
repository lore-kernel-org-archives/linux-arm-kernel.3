Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C06FDEE4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 21:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9uFSWtuIRcr9SSJRs3gaRR2iVTyJghM1wfQEx/zvyg=; b=SulkJUvczJppI9X/JrxbmrhFgn
	zwLhCiRemyVwbKQeYC0M69wmqmCWmnETS7Uq+5f9+uxBOBrxPuudFYTb+vC9I7Bn6nOpA6wJileed
	Ph8UzljztgjXm4huBwtMQEip3IgFuOLyVc1QRfl1rsyvgU6jpeZZ8yfQSrg70hMXidmKFBP3Np33m
	pChZuDH2+FELi+i2kfgQMzZG1T371hOpsbLQZU7pETpOIk8rpRAG46Snkizt73n9SgfApN5aVfp+j
	CgFUPFeCXinO/0EELTSV/pEXgFZ7pidoazKJXn+SgcPLdgC/vHkA1tgdPvmFNv8uBn7hxPqZuVgVr
	w29mQlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1O8-0000000CKFS-1rBc;
	Thu, 23 Apr 2026 21:15:08 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1O5-0000000CKDN-11BO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 21:15:06 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g1plB2FTJz9twV;
	Thu, 23 Apr 2026 23:15:02 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Thu, 23 Apr 2026 23:14:38 +0200
Subject: [PATCH 2/5] drm/panel-edp: Add support for Samsung LTL101DL02-002
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4g1plB2FTJz9twV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_141505_495977_1FB6C08E 
X-CRM114-Status: GOOD (  11.55  )
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

From: Alexandre Marquet <tb@a-marquet.fr>

Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
Samsung Manta (Google Nexus 10).

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..2004699db41b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1542,6 +1542,34 @@ static const struct panel_desc samsung_lsn122dl01_c01 = {
 	},
 };
 
+static const struct drm_display_mode samsung_ltl101dl02_002_mode = {
+	.clock = 268627,
+	.hdisplay = 2560,
+	.hsync_start = 2560 + 48,
+	.hsync_end = 2560 + 48 + 32,
+	.htotal = 2560 + 48 + 32 + 80,
+	.vdisplay = 1600,
+	.vsync_start = 1600 + 3,
+	.vsync_end = 1600 + 3 + 6,
+	.vtotal = 1600 + 3 + 6 + 37,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc samsung_ltl101dl02_002 = {
+	.modes = &samsung_ltl101dl02_002_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 218,
+		.height = 136,
+	},
+	.delay = {
+		.hpd_absent = 200,
+		.unprepare = 500,
+	},
+
+};
+
 static const struct drm_display_mode samsung_ltn140at29_301_mode = {
 	.clock = 76300,
 	.hdisplay = 1366,
@@ -1696,6 +1724,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,lsn122dl01-c01",
 		.data = &samsung_lsn122dl01_c01,
+	}, {
+		.compatible = "samsung,ltl101dl02-002",
+		.data = &samsung_ltl101dl02_002,
 	}, {
 		.compatible = "samsung,ltn140at29-301",
 		.data = &samsung_ltn140at29_301,

-- 
2.53.0


