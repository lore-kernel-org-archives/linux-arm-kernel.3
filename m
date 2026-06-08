Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF53CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHWZem1sX5qRm+cZyCdgQwCQRbpaBa69F1l2ue7kqdc=; b=YaatI6L/uQBLog+vYZ+XbKPuf/
	9Y9YaOJKklETP5ToFQ4bEwLVV/3i06hiqQXJI99ptKhQh9z9froRvjfBxWemGw2Ginsg17FpcAopT
	UxMIF7h0Hmy8EBKDBitWUAaMqkCqyb2zqZM3Vxl+BS0GSHGX3Ang8cf5XwA6oQpSYbxLUkZEEWs5i
	lOhSA2+Y5JvFaRegO3YrFEvf4535JEbdorKsO50/BXll2j8DEQKirehl5JpLQVS8s9cJW6C4N2HfJ
	MWFIjFdm0LpdxxL96RV68ZUNAlQ0gPF4nSo3GfC8+VLCi2aRm0e842zhloFYxE9dCvPW+PKlfw4Lc
	92Jqzcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb8T-00000003nQK-0Oem;
	Mon, 08 Jun 2026 14:39:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb8Q-00000003nNa-2tAu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:39:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7107A41E5D;
	Mon,  8 Jun 2026 14:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EA31F00898;
	Mon,  8 Jun 2026 14:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929566;
	bh=dHWZem1sX5qRm+cZyCdgQwCQRbpaBa69F1l2ue7kqdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EstVCjGiY9h1/7Lhl8o/judv0Dse+qu37RZOU6ncX/qNnXLuCu3dfpmaawAQr7WI7
	 /xBKC9kpyP2gkxPVmm1NwU5KqbgRk7ep4Dn2XzMU1iS47TF/pQuVNHcy3hsyC9d1pM
	 7YG5rA3P9HnaSWrpoxiQOAW+mHJ2dV8SWRj3ijXMpXhB9ABsI3lsCgVePeoZo8y6/X
	 BwXOgxoO8gLybcItH3UcJJATR5JGaGdqlm9Z63d0xMIQQgzr4zNvGpJNCfIZNEBs0l
	 WvDP3yxAoCqOczaCgf1nfz8lrOy7nuiiRXExkKZqcjTX9RXw9DT/ffOsRvLPsP/vFv
	 o9FFsxRWQudmQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:49 +0200
Subject: [PATCH v2 67/78] drm/stm: lvds: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-67-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FHLjqSxtAsmlVX/L9fjMlbC7Mb50wFkU0ZGIw6Dxevg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql5PmZ60N1t/HKbryxLx1f++EdcYceWIowxpz6aCCW
 eWEGGP1jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR1+WMDWtn8z8y5uxIn/nd
 NuLpYoP7ifayUflnF+vNefaveP+MFa1L6hz9pE42vFJKV7gj9fT7T8aGv3qevcrv7vRtOHnG4tb
 /pomn3yRz3m373xXdlFNb+GvV0tw13bVH5PhNXhRcqHvHYWwOAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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


