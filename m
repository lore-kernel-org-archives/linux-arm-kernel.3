Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F918CA9EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLPVlC+6axKfDRySa5Z7wZIL1eMBWodDTbsl5nbJ71c=; b=yb8Ocek00a267+jZadCPzYS53F
	eDiSl+0OB6jUW9idb4UW9/nI10VOXglKqWEHtaqXVkIla1gOYR7cs3Xmk2c0lxy8GLGvH2AHjTL8G
	Zw+uKLQoDNIbmR0cmAG1YgXLsTWWcp+tAdJQqUWn+JHJB70V32e7nkzOsOQcDUVsvZrLSnG06kDTR
	xnB95pOUVBU5Rd9cuFLtS3CKoRM73VCrItN6fGdYmZ7/yP6TkKrWRqR4mayOAXuVg6mpGWSuM+v0m
	HH63EyTKWDrFOVB6C97wajDY2v+F8NLUEJG7tirVjN1mu/ESypSrsvooROYHWU2Y/w0dc5hd4OHc7
	0XbtHBQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAQ3-00000009ppT-3iRV;
	Mon, 12 Oct 2026 07:25:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAPq-00000009ple-2I6v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:25:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-486e8faff03so621635f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789945; x=1792394745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPVlC+6axKfDRySa5Z7wZIL1eMBWodDTbsl5nbJ71c=;
        b=Ql8uQhIgzxfby22+w/eUDe1o3oVW/IqfijAuhey+yOFVpQRApaOHjKWXiQO+FXIMzz
         603e0F+/MrgDaO+bC7F2KpiMyKm/c0UKNWlKSw10drEjH/cHlmJ927Db87MbZnR5IwDC
         XylT78sU7WJw64CJMSDVU+ohFCEKBEqpopGIFZAz+9pNgzfWOJVLmIx/3rZDYdlIPGSq
         eLAEBwk63ofqtClc1DoT3nNvYQH8VQKr2SUXzbSxJ/RppdJcvOQqkyRlsBtdU5DevmOe
         y/IARhIilHo2Dle4n8wk4C6D0lTlCXMZBFImwtgb937dHYqpbckIbiWE+M0M/Q6K33hD
         3MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789945; x=1792394745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLPVlC+6axKfDRySa5Z7wZIL1eMBWodDTbsl5nbJ71c=;
        b=KJrRLhQKbvf2fYMP5uOHcRMc+DcB/lTP8vS5yoto8QLa4uAusWrIaH/zQ78ojdzoEk
         x3ttXyq5gJAxOXWI2RKoIhOC2AGxZEFV0JreAdhqKr0AqIaBl1/rUpJKW+AQ1VGp8wsi
         IHadS+IDc/cqkSIzRIauTGiGVXUtCDOvZodo0JzyUuxvfXhBoPla1ugZ4XG9jHLertVW
         /2FZRHIMIxzc+qZUN0snw6uKhpnEeOdeLlINVIluCHp22ucfOKPF05uFPLjiQDGePmi8
         wI4h94HWg/OTDYiop5NyuS0AnmbPfA9W/e26/m42bPzpK+QEAgjsLISsr9hnSLIdWEaz
         5OKA==
X-Forwarded-Encrypted: i=1; AKwUvBz16n+39dtfdmZuBEXWUfEH1LlK2iOxz5uDUhk74QfFu2wYkjY6aGJi3xXPcu/6JkqnvtU+F4YqlnqaPVQ8gfbS@lists.infradead.org
X-Gm-Message-State: AFq9FYJnQyBeiu+P3iOvB5avAMCNAozFDBm1eIjor0/tDKRyY41NVDe8
	l7gv9Cpoee5UJgyLSi2F0uFR+UnjJO77ah2Zb2FtPmfy48M8AwHk695o
X-Gm-Gg: AYBFou37CXjeiGzFkh+ZEKErfaj1jAT4KQIznURe7/UcihaHN3qK728PBcB25qbi9O6
	IF7gBoVjAUit0x6DgYLACms8b9b+tv7Y5P1/2IfTkskm1Sg9Ff01wFzp/XhebtDi8qbLjj7eHEd
	y9wJOATC9d+foa0tJDK/xK+CinDAcTpSpMdWOv69yxlQcqy4JUKaL/yP4eNqc1Kvphv9n6kNz5/
	Fpfxr7+QWnKsIV/vzeO/jcEfrsOVlpy7Iy1C7HG9Eyx/sqCmaqMBoQ/laLAz9ueeJU0ILyt4NKl
	14rxyWLUwDMZ03cPpp2mNIPSe65C+ispMx0pLY/+vmpJrHwzPLEfsCGA7Cwmjo9gcTJdCp66dzN
	posp9v/S4TFZ/Q5ToRoiWujp6k1pI/Wk5FoXU6oEDiT5BuZqLNgQZcCUPvXK8TxLzjNjDUjjNoi
	pgMYYzXYAT6i7SJvqkqcX6qHW64hFBKM5sxW+7Pin5NJOPkzd87Il2QUPl+/ycZjByUoXrHiROj
	UipKEYZtwa7sNoh/45Erj9Lb8xoy1ZqfruVD+7eY8/ZQQVWJBctBMY3zBFKTiPDPVcC4wcNAPA=
X-Received: by 2002:a05:6000:29c3:b0:48d:c15c:94a5 with SMTP id ffacd0b85a97d-48dc15c964amr8654279f8f.14.1791789944272;
        Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:43 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:24 -0300
Subject: [PATCH 2/3] drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-2-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1350;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=FKye5mFa3sfDemE79K6SG+Q4irfMpkj0xAlYwYUAH/8=;
 b=4gNcdbAkP/ZiHikm++CidN8Fg36WinGvfqCWvKISeLt6d0w54Kss0AyxWHJbCrRJwOu2/kOcV
 8QKluP6TaXpDlREVlJEhq5mYay7oLM2OaFtIyVnaU7BXUcqtKIeCnLJ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_002548_357704_76AE48D6 
X-CRM114-Status: GOOD (  11.17  )
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

The VGA bridge on Apalis iMX6 consists of a simple resistor ladder that
converts a digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3fba7002322e..3f88fcdfa214 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -253,6 +253,10 @@ static const struct drm_bridge_timings ti_ths8135_bridge_timings = {
 	.hold_time_ps = 500,
 };
 
+static const struct drm_bridge_timings toradex_apalis_imx6_vga_dac_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static const struct of_device_id simple_bridge_match[] = {
 	{
 		.compatible = "dumb-vga-dac",
@@ -312,6 +316,12 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &ti_ths8134_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "toradex,apalis-imx6-vga-dac",
+		.data = &(const struct simple_bridge_info) {
+			.timings = &toradex_apalis_imx6_vga_dac_timings,
+			.connector_type = DRM_MODE_CONNECTOR_VGA,
+		},
 	},
 	{},
 };

-- 
2.43.0


