Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E62FC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=poyGQFhxfjPpwyIrTQh0fZ+JdUzuLojhwNaxF0pNYJE=; b=sJmIOaIbfBwFj0NLS0+5nFRYAp
	SkkFq94zHGLVwi+tgQIW7Hue66xfQPkJkiPUjA8nYKJ8liEY3l5Mf9zMHTgKjdWpoUhvOx9BB2WEO
	N1rZT0UOLfQ4GnnuEEBVRzmJwWEXEfh7xXaPnfMGwUBhQiB0QjJFNxsT99cbLSIJBpnD8A+1ZHN8a
	v+w9kfFvQ7B1Bt9eV3wJN/rLkk7ROqZsTVFhcyfepfws4HH47/w+jlF1QO8Sh8NwQd8GJz0FkO4E3
	66bFZW5o2sOigncVIJSb0RqSNawPVOxmZ76qD/3SPhXbpupwk03cc32AuY9549Qiyz557BMU217dC
	jSPhbg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOLn-0000000FBLx-2DRw;
	Sat, 26 Sep 2026 09:05:43 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOLl-0000000FBLa-0Xso
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 09:05:42 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so696007a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790413540; x=1791018340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poyGQFhxfjPpwyIrTQh0fZ+JdUzuLojhwNaxF0pNYJE=;
        b=hlHUbKL+alElw6j6K74pH8plcou2dvECwHFvCv3h6dttpxhr6bsjcQ4z69hi3hiWwu
         IA8H4bmUf9cOeYVE5rK00GzPv5neFk9VdKw2u3a7b/05r5l6C0p49UxtQ4NZHQNRBbxj
         A1k0tn5PqkG/P+h/oYgqyyPBUrR7ZnhvR3Ol2zLIr7yNZnQeDYRp0473l2GR7C/20NyD
         9gQiwlj9m2oqfWGPWdw2qoFD4OLlmafZiX/6V1dDyACT3jas+KGbYN52KZpwUJ0eg6z+
         lrzRX4xl79Y7KTcy7Vz/y5bCFNHvfkNVyZlRRG2vdUbY8EwAx5m4SDThDehukPXRwLuI
         /QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790413540; x=1791018340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poyGQFhxfjPpwyIrTQh0fZ+JdUzuLojhwNaxF0pNYJE=;
        b=Ixg31pDMGsqEsdJQsGYPDlvybTzJ0gkYtHIHHQfi9+vaffx90ZvlMz2SyJGu1bhPeD
         X0v8dg1hnCWFETIwZVK3ms5h0mQnrLXreDIh+YYN/pbtWWVfimII7t7duCdUaQSqt++T
         MND/T7bpinfP2+Do+IcogE49XpT5031cMpHtNM2GAL+ZLSLUr6dmaoW0W4edYpkIF2v8
         yri9/gSzrbo650R0IPh0z52RuYU1fTK2YiyiKEIBjpxlDAK9SNNIQ6xFBvv0+m2P57f3
         48j+Pa+Sop3ybhSe4uC/0Z0kt0MMJqxLQv73U/VWlQWtM8uazIhJ40zp4gBOlQOVwvOF
         Oq8g==
X-Forwarded-Encrypted: i=1; AKwUvBzu+UgksdWGqafA+C9OSbz/WiuOxgvjElU3N0l6g0/Ti8I/mtoGNEqtjUpohGX1SEHMnhNhIGPs/+wQbi0Dkmk5@lists.infradead.org
X-Gm-Message-State: AFq9FYIXIan+IW1g9FTDJfSyls9f7hRVj3v1D8t72nw2U/ZTtmOsX0zv
	oMJKqOt85AnAHkd+YIMuTPzvB+c4gU0Nh+EpxPd7op6GoINMQUnkQQFt/Os8j6oL1+DP
X-Gm-Gg: AYBFou1wN5Q6+m5NWTQ3ofSHodXprrCf5w1Bpv7qPvj1z+FwNIhVewZ7kl5KaI0Jubg
	YobZ/2WcQtrtc1uR54edS9kCBpbut/oJa6FCT88VoF51VXDeT7WMCi5jdBfrkCexzm2bB3E3j6b
	prNVO4gNPHauqiUQJlfvaNK9H/nXbS8qoP98WuIgDKJPiXXqucm+DaUO/KOrFy5pDM07H7l6FUP
	WdQFTjWfI5hBQvu46Nx3hY9cZuaM0f0EEhpZ9ILMvDmyevwArxQUCG92HB0g/GSIfcSjTWZRY3y
	mH53hTNckkR+GNjeXbb4Kcb2a++aHKZ0u25HfdvoB+urO2qS7cGimfzbnptpW4tVBbWgu54F93K
	mAoa/wujeD/1wwc6d8v62F5v+un8ZY6zNeGPKijv5PgC27IcVxuoy15+4wza6GwaLPx0AEh/5WA
	B+7He3sBDHVnA5TWiuE59KDyVvtf14orELf5SLIOD3cmxj/03uLOVhOC19XeRP6kl0Sw==
X-Received: by 2002:a17:90b:3b90:b0:3a0:cbe2:9e00 with SMTP id 98e67ed59e1d1-3a0cbe2a110mr2426179a91.42.1790413539584;
        Sat, 26 Sep 2026 02:05:39 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787959599sm2299078a12.26.2026.09.26.02.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:05:39 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH] drm/sun4i: dsi: Get the A100 mod clock at bind time
Date: Sat, 26 Sep 2026 16:05:32 +0700
Message-Id: <20260926090532.126025-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_020541_183136_7630B420 
X-CRM114-Status: GOOD (  15.56  )
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

The A100 variant gets its module clock from the TCON TOP, which only
registers its clocks when it is bound. Requesting the clock in probe
defers the DSI forever, so the display never comes up on the D1 and
T113, which use this variant:

  sun6i-mipi-dsi 5450000.dsi: Couldn't get the DSI mod clock

Request the clock at bind time instead, as the TCON driver does.

Tested on a T113-S3 with a DSI panel.

Fixes: 4b71e269f5a5 ("drm/sun4i: dsi: Add the A100 variant")
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae583..69987bb5b 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1062,6 +1062,17 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
 
+	/*
+	 * This module clock comes from the TCON TOP, which registers it only
+	 * when it is bound, so it cannot be requested in probe.
+	 */
+	if (dsi->variant->has_mod_clk && !dsi->variant->set_mod_clk) {
+		dsi->mod_clk = devm_clk_get(dev, "mod");
+		if (IS_ERR(dsi->mod_clk))
+			return dev_err_probe(dev, PTR_ERR(dsi->mod_clk),
+					     "Couldn't get the DSI mod clock\n");
+	}
+
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
 	ret = drm_encoder_init(drm, &dsi->encoder, &sun6i_dsi_enc_funcs,
@@ -1160,7 +1171,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (variant->has_mod_clk) {
+	if (variant->has_mod_clk && variant->set_mod_clk) {
 		dsi->mod_clk = devm_clk_get(dev, "mod");
 		if (IS_ERR(dsi->mod_clk)) {
 			dev_err(dev, "Couldn't get the DSI mod clock\n");
-- 
2.34.1


