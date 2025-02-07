Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD41DC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5V/bbxdnuE0p5zYw08/xaao9WcsmqSt+6jfUsWqXWy0=; b=w/1rEXlBOEy/TBr6Dubl9y3Oxs
	lYV7S6quA7Mec2k4iiSJIIshCEswim7Vu/EqykNZObfCNLrYWKFc1Q0O/23omjVHwxOe2afb/gmj6
	ERQRQ2Ga7MQdlCHMbtZgAwPO6SQa/WrW2Nqh24X38hw5PRdN4d8vjMwZr+R0D53m9Z+E6Y6uzlnTR
	naBWYpLf+2ykTsRtDIaMeaUa0yJmGnW1Zk2jeEFlV/uo+8ISBve9E8k3/w4XXFJfuKC90M9qxKJYe
	ky3u4MOi9ks3XBJcxcPACJBR6rmPDZ3JJAUs0WC1ntzk8t6wI5onNEcrKezx6AM+Am4HdZefzuXeE
	rX/vp7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQC0-0000000A36r-28Xn;
	Fri, 07 Feb 2025 15:22:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQ7v-0000000A1u2-1VEp;
	Fri, 07 Feb 2025 15:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738941521;
	bh=I4naQ4du97R0ib9F27jLpy7nIKZ3D3FTwYtREBA8SF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mianmZKbEEIXaY0pyE8qmNml7S5tH7mMg6iQyxOf/jTsADYmnSpA8d1Bbb2JGPRjX
	 CP9pWVAHBZUVauj+aPe8cB9j0KfaBVuXxK6RL82O9K4aZkhAzawn4/Cyn19LmQ7xBZ
	 VVYswt7nr0agGAkX08/I+hTLnj62H3ppKMgjmFFhcepyBWqxpC3FS8mVrwXLlRcHPy
	 uP4WBHbf+KchpaB6D6kROgJ6Sai75NFlYwD5FK1eWi9q4bFmMfwS5jKFw/QBrr+pT/
	 aJYNbcKNcSVr4HjjiET4/wtIMEZgxS5s0TuKHv24J38ZDpW0reuk5UXlPmNuQyDcBC
	 JauUwICBOLZhQ==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F21EA17E10B5;
	Fri,  7 Feb 2025 16:18:40 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 07 Feb 2025 16:18:31 +0100
Subject: [PATCH v3 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
In-Reply-To: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738941518; l=1373;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=I4naQ4du97R0ib9F27jLpy7nIKZ3D3FTwYtREBA8SF0=;
 b=6EopXfZjmiAqGuV53X9US0qgB2osoMvaZrSYUiqqyZXINeVtqzc40DXaXLGUNgknMbzJFPeqX
 K68iZTd1j4PBWW8A9wOwzN9IEdQsGMRhmUMZ2n4f1fAJbZ8Qhwm2wTg
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_071843_544601_AE94A716 
X-CRM114-Status: GOOD (  11.26  )
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

Add a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
with the same platform data as MT8186 (one regulator, two power
domains).
Despite their different GPU architecture (making them not being
compatible), the MT8186 platform data can still be used for MT8370
because it only describes supplies, pm_domains and enablement of power
management features in the panfrost driver.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac761adcd80197d87e8e478df436fd5..7b7e9f6f620659a7fdcb5d907ebc4f01eca876e0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -859,6 +859,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8186_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);

-- 
2.48.1


