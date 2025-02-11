Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE89C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVDk82lOFOpEQghAEnpYBmpKKsaTc4NVwZsAs1knG0s=; b=b9pNA4E+54VKDMA3CMJmZseJu9
	XC+B3kV3iFVYdm3PnxRk9U15niEA9UdrEd22CNNt3r8dV1rd3xbZl+clVrl+XUD9WkWI1UgetWpTt
	f8cyxq3COsWKu8H03V0mXlBH56KA3eWj5z+dJNkPDtEipNAjx8zOslF4GjjGXcizeoEL4d0ZsOJHY
	bKrVbtmDvXgal0OvHbuZCWIWSzw2AXXO+R9FVkEwllG0sQ01SRtzUg5Vp0tpXawx44qpHffwwNdMv
	e1PD7rLDdTNP9oo73ZEfHdRQqhk941HcW2krtTYfUrPBoqLs0qZKc5nBPuZigQOjPMZs669zg4LpX
	N+Nwl9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thr65-000000045p0-0XL8;
	Tue, 11 Feb 2025 14:18:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thr1u-000000044rp-1CT9;
	Tue, 11 Feb 2025 14:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739283264;
	bh=SRlaHOYyJkMSzTpbixqpKGHDSFkBJLV3ojeT27kdJus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pCc4SUw/Ubu6yJksuXeS2qH18Y2cxh6fWvR0tXevbQtqHbrzgUZZRIe6/56l30Mui
	 gqZzzp5EYZriNBjXZHXvtwzOlSx1wQT4XtfUtaRS0xBYMVrK530G1Yj0YE+to2ji9U
	 Y6G9FU3b3j3uO938jLkFyeBwRWFh77gcwpzg6kCikcjc+3R6NA2me6ddnohjdJAh43
	 QvCTiCrcfBEWTRz7jFgNMY5uA2PKIf470tIFOR+KVQ4Er74VZYiah3TdRNt4OvzXtp
	 Yj9/IPiciyHOaYL9GXjMPA1mi/Q3+1Q1YSPVgda1u7VXrvw4WDoqj5qObF3VsdOcep
	 IuzInnMZCxjVA==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2DD217E1249;
	Tue, 11 Feb 2025 15:14:23 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 11 Feb 2025 15:13:09 +0100
Subject: [PATCH v4 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-mt8370-enable-gpu-v4-2-77deb7a75c23@collabora.com>
References: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
In-Reply-To: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
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
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739283261; l=1520;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=SRlaHOYyJkMSzTpbixqpKGHDSFkBJLV3ojeT27kdJus=;
 b=t2jBv0Ox2nQXf4CZADMRuWiWUJA5JF75wfksRsCTyUeretvmJbzYufNJV+n62u4Df3Qh9Ck7a
 JL+X+MmYIzSAuvmzH9CpjOqYyIqmdgBC5NK/yBhLdJW4JMYDzTAhxDi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_061426_475735_074B8016 
X-CRM114-Status: GOOD (  11.06  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


