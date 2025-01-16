Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAC3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FkwoxhNowOMq0FuJIfdzSCJo1eUGM6nMg2Qj557dtQ=; b=r/N22txo3fL/22MD9uJhm8UARF
	lOxoardwddP3f3ad5/W5NWL2Q738Y7IdFQX1WMmlfVLhfBQUq95mfs7OuVgI+OAifDhvqQGLJ1c6B
	8HakKUMmLLGcLYm2bYPo8m/GyjSgS3KdFSTeXuCFtHbp5yw8lsdgVSvSnzI4cmHPxlrxw/eAVo6jj
	miuSCK6lKojqbfNmDd+PGxR7rcg893Ty0J97oQl9KkaGiG1vDUojINjY9OKpPNbyFeXmq/r5W9/eU
	R6Ad4oLr8+N99jG+cuGhBKD5g+CWRRe7AAaU143F0Qz8j9GEtwQYcYZulmpgltpnLWTLX1ZdCqv/k
	zeEEG5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQtG-0000000FAgS-2DWE;
	Thu, 16 Jan 2025 14:30:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQpX-0000000F9n7-3WcO;
	Thu, 16 Jan 2025 14:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737037602;
	bh=D8xwpyjZ9J6n0Ug0JC0bsR09ktmpfFbgojqTtTCsimw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hnpwB10oFf10vvLPJDnp6Gz4aUoMbk4CIFL0k8EvYZokpj6RanPPBEqLaZIC9/IK1
	 3UkAYje3mnjX/6a1nS402vBdQNYaq8oZA9YpCN6kJlXUYqa4IgsANj9QNGyulWarqW
	 ABCijlzf/EBtwJswRmx87W6hg9n0eItv4hDh5oU4Sw2UUPa2FHtCxWg2P3VB8e/HO9
	 APG1VktnX41csm8W3VnI6i0D/rrqeBl5gL3buKcDGREbIK4qRO0l61gzTAhoLMkyCI
	 sUqp4YrKF35hDtyp8bbLpmNF5vcsGYjiK+rpp7ZOb0MfdsdFehO0MXGrLoB4XTQ9kZ
	 1SEudfD6TVJ0w==
Received: from fedora.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B16717E0F75;
	Thu, 16 Jan 2025 15:26:41 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 16 Jan 2025 15:25:58 +0100
Subject: [PATCH 2/3] drm/panfrost: Add support for Mali on the MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
In-Reply-To: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737037598; l=1890;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=D8xwpyjZ9J6n0Ug0JC0bsR09ktmpfFbgojqTtTCsimw=;
 b=envH7p+Ko8PBRZPwLmK+n7lslwoc9tRVDfNeh8MfNhxSq9NM8LDTJPC1M78qLRu/tXxGEjkYr
 30TByGzgJdrByZ+ThSm+C3aKd/ovnZiAB9zjLt/YyrknCUuG2bGQvKi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_062644_052241_EF96EC5E 
X-CRM114-Status: GOOD (  12.73  )
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

This commit adds a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core), and adds
platform data using the same supplies and the same power domain lists
as MT8186 (one regulator, two power domains).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac761adcd80197d87e8e478df436fd5..1d51b64ed0f0660cc95263a289d5dad204540cfd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -837,6 +837,15 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
+/* MT8370 uses the same power domains and power supplies as MT8186 */
+static const struct panfrost_compatible mediatek_mt8370_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
+	.pm_domain_names = mediatek_mt8186_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+};
+
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
@@ -859,6 +868,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);

-- 
2.48.0


