Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGPWKT+T/Sc4FxhkqkRyahjTyPdMRSTRlzX+JKb5mbQ=; b=zudeGL3oxvesKlQj/UW6T7Cmtp
	9H8aFMUoQY4T4BrsOiHPgl7GVVc6vNg3kokcg2LA6DpBRwisHv7Z8hV/jbAReqIDqB4nQFdskN2Qi
	iWqYFGOeA7gk++S1r6gsTlBge832EFyHTsPYwolJ9PHqupV/1REuxIDFoJWFGrnc/tUaO2TCo1n2p
	Ht3eYZeCP5v5AY9Dpv7lbzT2b/gFfH881qnU+xTl7V8uiHhZOIa52eFSYWycL9rfalOv+A/XCh0T0
	2U78IdqPBNzeqP5D2f06JsTS4iyGOdQ0HC0AS5ch013n81KChjbZ3h/eV3lj/JIGvKsUt3MUwfPB6
	EMjqbn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYnd-00000000Lxw-1hlY;
	Wed, 08 Jul 2026 20:23:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYna-00000000Lwo-3zIm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:23:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so1506435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542193; x=1784146993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGPWKT+T/Sc4FxhkqkRyahjTyPdMRSTRlzX+JKb5mbQ=;
        b=bu/5c83yqUdsL6tlitYyBH2b6TnuqkTWdX9Kl1gYi/JgfUHc7gmdA2VmXx1BG2qMOp
         ZXcvbE7LzVK722eucaZjHmrvXDnTvZSkqHaTPGnO2zNbmPZhvRU/IX25iPcBmd0jF9BN
         bG1qpLgvRNMZ0EXBSUSxN6Qolry6mzvq6UZHCUWTMm2qJm0OR8PdORuuoZYe1ReQ2M08
         FcIr0sugAm4SVv7/e6dK+Z9yn9M0QQSRwi264mTzqrrCi4cUueo2m9gR/FtwUumtZ5dI
         0Nxz+xxa1rL4d0zoqIwY1qL0zIWYc9zQtn5kspK/lDkJoZ1a+HS47y538qKW7XE4buIa
         P5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542193; x=1784146993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGPWKT+T/Sc4FxhkqkRyahjTyPdMRSTRlzX+JKb5mbQ=;
        b=X8NRTaaokkvQyEyyfGwCqMWhh9w5Ms99PvfyLsHYs81HJUIaJy37xX87D/T29QUojD
         jMRJudCDw8GmjHStrSHml6e8SgeZmbfvk3Zvr3VizLFQNa2RYpBGZs3OnCqXP5VuoDJr
         5VHN9xC1zprqHmPYkRHbgL5cwvkClcSOiy1Ma5EqsxoCgXcCRCP8nX3g/ClSAAX3gAsz
         DIYJkVH0SbcRFfKS9E55Yy2D1WoUtZhogbeP94/PyEf2EoD8ednY/IieqT7mcU/BaiFl
         OVsxzYMjRZXY1BwcATkUn26yDma0tve/7WNWyEAAt2PWj350DzKbKx6TAdgUcj3XAFwy
         kghw==
X-Forwarded-Encrypted: i=1; AHgh+RpR8Pl/Dp/eu3qoeTbSrei9QNf/j7KbMxDruR2FixaGWPMOjvkYXtN54IhtTrrRU7kYIrW5gmAoEqtfNQaT+4DK@lists.infradead.org
X-Gm-Message-State: AOJu0YzaTVULQXJg4K7YvSbsnABLTgczfpLCs+SjXurCHPCY0stqtEZt
	1OyzuWxwQkmFh/aGm9kOHyo3YqAABYpYlyYjMKUezBFgTBbJs+3rmUUE
X-Gm-Gg: AfdE7clTNVFo7NJZm85T4c/m6UgJpS5v+sKfBS71H9I5Fm1fvP0yE9XBFOdEqGdaFrg
	+d3X9dvdIiEm4VTlqlscTCe1GIxr6eG0IxEyKyv5811FkYbn/gO0xoPTAUBEDKF5dWZB5CaFNCp
	4YmdQPEjF51oqywcd+vApjC/MbRJqED8HLWrJ6WKei6u1BCeY1XBM2wfd5/IxFvfyod8JpcHX5e
	0gtB5Do3DSZArp56PphQD7j5ZAhmUP4AFvg2rRBNc1KTiQNuucc6iimSk9xERxY+kn8hU3nmaQ+
	iZk1Rho36jvRL3aCKoH4C8H7EkKiNg81kmkxcSEvhfeiUevP2szyL3f/7AzzzQhSKWZRXW2Sw8K
	XW/zFuWsEcPtdN8Qk8RYaYSmT18NqdP9Pl1l9UZ8z3tJsKb48HyR9FEDJNlyDHf2KEXGW8Slxmp
	2F3OxMNouOL0cN3nri4sonYD1EyaU6pm5dBf5YYbCW/6DqURgjuw==
X-Received: by 2002:a05:600c:528e:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-493e68f03damr41743525e9.32.1783542193163;
        Wed, 08 Jul 2026 13:23:13 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:2b86:7192:b44e:9f03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm101663785e9.2.2026.07.08.13.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:23:12 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/imx: check parallel-display drm_bridge_attach
Date: Wed,  8 Jul 2026 22:23:09 +0200
Message-ID: <20260708202310.12971-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706142732.49397-1-osama.abdelkader@gmail.com>
References: <20260706142732.49397-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_132315_005573_48C489BB 
X-CRM114-Status: GOOD (  12.95  )
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

imx_pd_bind() ignored the return value of drm_bridge_attach(), so a
failed attach could still proceed to drm_bridge_connector_init().

Check the return value, as imx-ldb and dw_hdmi-imx already do.

Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- add Fixes and Cc tags
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index eb75827394f8..fd48845877cc 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -210,7 +210,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))
-- 
2.43.0


