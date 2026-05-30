Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A086CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn8gTRXxK9/bEoINz/7pIXPe+6dBDNV8P9MoF71f6+4=; b=qOsPaqoJBHhTPMzcY6CvnHJ3Oh
	Ye1bOIIVt3qZyTkDaI7epDLM9Ep+PLdn8hM+NI0wW0qCEwA88IsI2yN1IQAsbArz+bITNjR3a4bw4
	EXTbavab7QZgaiV6kv7Xj37jE5tZVSFSFVvXOZJCl/HQJ+j2M9gQe0k7ROeC5PjvGbzgJR5BHSsRS
	mtC+3XC2CrwdivK2rP21YiZ5N6QzBiBzOZ4RNceMtoEWYHS4kS/y0xt3D8R+iPCqXnRTtqfTWci/k
	TwAWpLxtfgZyX+a3o9Fa4rIu4Efk32wWc7XSM2o+Ut7KbSUJSfX6W8Y4IuoDEhehCfuRNHfJtPLhy
	UVvgjvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKHB-00000008nuE-1cV1;
	Sat, 30 May 2026 14:02:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKH4-00000008nou-0Qgu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:02:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B73B9405C2;
	Sat, 30 May 2026 14:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2549C1F00893;
	Sat, 30 May 2026 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149769;
	bh=Fn8gTRXxK9/bEoINz/7pIXPe+6dBDNV8P9MoF71f6+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KPu8QdU25hMNd5TY/u+ZTbAb3v72oKJCkZhnUbdO5bvG3yonlxJwuUgwZFZu1wtjB
	 wxjRIyRLKsX+pwR4sYXhkpbNvqWgqtjWVLR4ZoTnUKRHCjugY2TPlN2GVmqTSYGwGK
	 94JgsdB2EYR4pfzFRXWRzjfV9r/Ax/JY5EN0S4LXam/dBDyaXyXBjU5O5cJDsHzExG
	 nW5CtMEI0zEnriiVAv98IgvEPABaVVt7e05orZ1sZ5nE96vjNNnhEh/ty5JIfLHSGG
	 ZfvRE4exUERSlnLxohrRfTfcL758D8Vq+fnQzGzWx7U3wIflD3+mw2RzmLk6eJpip7
	 on5r1f9oV3cmg==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 16:00:10 +0200
Subject: [PATCH 65/76] drm/stm: lvds: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-65-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=mripard@kernel.org;
 h=from:subject:message-id; bh=p1ctsj0p7RCVn2lCc0CmuKvGhl3fgjR9lzhvzc277TI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb4PaL7Qa11bd/bb3/QdpodKSBZMV1vSd/FNrxHIu4
 +YzTcG9HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAip+4yNqxSWTBpkfCqC2IH
 cmetljD+IPAvMjVcf1Upc36QOa/bn73rkt9lOjWFxfJsEjufbXAhhrE+daL2049bVlf6RxyX2ny
 x/7btF+52vTf9t0wSltwIYqmUSO8x/ewmL+C95jrDxm8HpnECAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070250_190319_E8B51504 
X-CRM114-Status: GOOD (  11.73  )
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Yannick Fertre <yannick.fertre@foss.st.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Philippe Cornu <philippe.cornu@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/stm/lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 50a878688e47..90a44e722057 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -1036,11 +1036,11 @@ static const struct drm_bridge_funcs lvds_bridge_funcs = {
 	.attach = lvds_attach,
 	.atomic_enable = lvds_atomic_enable,
 	.atomic_disable = lvds_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 static int lvds_probe(struct platform_device *pdev)
 {
 	struct device_node *port1, *port2, *remote;

-- 
2.54.0


