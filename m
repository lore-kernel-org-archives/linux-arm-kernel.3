Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61366CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=; b=o4yqfF1yucZUqhfRQFoqsPV82U
	IJEp7ZM8nom43AfGpaHEHw3kSzSYSCMPV5gHaMj5A66IjZLr6uka2/PPNGGiM0k9Wt7lWUNTraQ1Y
	PQMSNeUNl5pzGiJnkG10hrnzjADFCC5LbHdpd8jo/vUgd0gGxa9UzfvYOol+UpBpdtz/OOCsA0Aaq
	WXbKx6jmyTe7s1V0eFknWnenhiY1XWqej3O06hims8ZVya7uvGu1EZvOUDUy8VA0mgsPo4lv+S5mf
	gfTvXQq/rRYh7nxQBK3D/KtoO565FWmIPQ8aGrB2ohgSYtm7S6LVezp3VNSWtDngCadiRV+n7M6Vo
	hyYNsfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkU1-00000007A3H-2yHR;
	Mon, 19 Oct 2026 10:20:45 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkTz-00000007A2H-0Dy8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:20:44 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-15354aa70e8so646130c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405242; x=1793010042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=mKCmIgj+kErQXmYyKqjPuK92Efum2GTger718QN5KPKpjEXX/UT3UPv/x54E28iWb0
         Z1eYlm+VjcEOoClLuS0Uvhfi+aQo5oNa6ytPnwl9SEUlYEgXjsgs57u3oXKfBE+yvB7e
         fb86MYfoAGfJZ7SwliCOouoN0C35iWtoe9/aAE+nxoY3jKbb/kVTdUTdTwn0btHngn5Z
         mCm6Y5F3h7BrWArqLMHlYQtO7Cv3qJzkKnzq9jpZ45ZZO4XF/FEQeN+gsmLRgF+N3CWD
         Q+/35cG0M5I8GVbo4zw2dhkXcL/i5FFjvHCHQA1ysixj1pkw8+4T5byM4V22xk49Du7T
         vW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405242; x=1793010042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=vg4ob7WSYPIuKBe6NdtAAbWg4nSW4gu93qU1NMIz19zhQy34+4wT7XyURFeFTDkQgx
         7rmigOOFrcRsGl3i4QjNv0EVXcXwrgapZzkc0iiawc+NLhCC0A/W0S4p7AZUgA6Mseef
         YGZtzHWsU0NiBRgeNpJnGsFmVguPD/ie2wEHJZCWpEfcQu2rrYT+qF1a3jb0aipt6i+m
         f3iuNEojxUDO7IAvuhcPlt0Ajrcwuz4Ett5mDhLigadXHyREFBX1ZF5eP8vwWAwUFqDd
         kMfq3ar6IE0KmDoukWoDDsLO6We0RUcDO9ihZFnEiOI/pAaJsqUulisY08awz/rBVJz7
         fbsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzshRyWpreackj5kVrLFMjRPk8YL621VarSIkUzqbYsr/VZroEwk7HjatrL+Ba9dAjizSjY+iKfyVpjgPEDaSD0@lists.infradead.org
X-Gm-Message-State: AFq9FYKGWbO01uyezYXv05O4GI6aNi9LBzRO+2Bv66dlt2/lV5yGySjR
	wXG2B78TDTRR+0VNPw96UEt0uiAiMCVZBbMObi2mKUA+W1CGTFfDdJOa
X-Gm-Gg: AYBFou0BuXOuQwWnyo2qVjCuHpOCYsyq6Dn5u90DA9aK1Pbzc67S+IRdxqBrSZ1+jeB
	l2xYOsQZ68xpHhi6+hrI2qgpjQ5pJk9qq/9Ui8d0WEtwzBuxZJ+rPq/RJnPn1to6jWDyS8OIME8
	cI0ich6Px1sM+fmCi0jCGPHAUShY5TAwu//OhFFmSnizU/+70mrSt4BxdbM/e/7gpJfVMLQ8Tq1
	HkiLUI7u9cP9NBV+mv9fnIxp1wDFiQEVSMugVqy3dS+Q7VuNr5tTNZ+j29lv4YMa10BuCeKywke
	XfFdBdI3VodxRXIaWhxlZAZcf6otdSsiNXu+6pM4GcfQkBvtl6v75fGcKTptERQIIKuRFCNSsho
	KNRKxXh5qBM5FbJXsiBu6cwhT9k2BgViDG2h6vJ9kLMcuaJHclZVznZBEH/w9szTmI2X7G3eY3b
	Fn8hVVW6rVt9/IiTo612Zax1Ud+InbS1wltF54xpSipR6o5UDcegLbZjpIXyCxcAjrQKItq6xQl
	97H4I3o/oD/pA==
X-Received: by 2002:a05:701b:424d:10b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-1850c9cf427mr12119481c88.3.1792405241814;
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:15 -0300
Subject: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=2075;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=/IjtTShiJA+F9KmNWlJJNMy2lTKWTky2io3jmPVXXVA=;
 b=wT8coFssfadnbio6KHmF1yBAZdfjcW8j5Ftd+0jWUjv7dcyReSTM5NiEs8ga+Dm7iSM19YUzq
 JsnS98IOb0zBMI8LksAaaJsn7t3ABSIdTS+heHkDqYkDHVufmMApZIH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032043_102762_04BE837C 
X-CRM114-Status: GOOD (  14.52  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Some simple bridges, such as a resistor ladder DAC, may include a
data-enable input that must be driven at a specific polarity.

Read the data-enable-active property from the input endpoint and fill
the bridge's input bus flags accordingly, so the upstream encoder drives
DE with the required polarity. The property is applied only if the
bridge doesn't provide its own timings struct.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 848c2df2a276..c5301295658a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -183,6 +183,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	struct device_node *ep;
+	bool de_present;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -220,10 +223,26 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
-	/* Register the bridge. */
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
+	de_present = !of_property_read_u32(ep, "data-enable-active", &de);
+	of_node_put(ep);
+
+	if (de_present && !sbridge->bridge.timings) {
+		struct drm_bridge_timings *timings;
+
+		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
+		if (!timings)
+			return -ENOMEM;
+
+		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
+						DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = timings;
+	}
+
+	/* Register the bridge. */
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }
 

-- 
2.43.0


