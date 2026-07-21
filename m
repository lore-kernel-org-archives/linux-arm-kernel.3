Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F4BC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slwBi5KP6OQ3DnlZedyezBb4ItPHq8e3XVUJisai6M0=; b=CDl3w/Bj+F6uCLRO4Xje1y93sy
	5KpS4OVBoWObi9wfacDYU6Zl2rjzqpawvoDyGusj73JkLGUAEbE1yJqvcwDNbuv+T/srzibUSnXxU
	1Dr0E5j3sUpkKHGiBp+ySvXkWagHn56mAKgW0LSOFnmESg1GJ7gh94B147b/HRYt2eZt7Z53zd3c1
	3TKVxMI9GEOl+qvFHuiEUACj7wzrNF6YYTUETNcPZ87hXPgUGp1GM4uIsdvxAAtxL3KMNa+Sf/xfD
	SqRNIbrF/Z02oU8j+NEQwZm8LGuHhSld5+Jh5zvy9QjkzGEY6f8thk2fjJjy9dGMBUiMtts15B5xj
	HJaB12lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85l-00000009G2U-3RJK;
	Tue, 21 Jul 2026 10:52:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85a-00000009Ftn-3m36;
	Tue, 21 Jul 2026 10:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784631160;
	bh=YiA5DltXNq9O0aocs7NhApObemt4it0eOdh1BVE1948=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CrUB0g5R0gNqQ1XeAxlQBuDcN2qdwJuJPNk1NNojT/f4bWop5OSCidwv+3lZeY+wB
	 sgtMu7s3erMIqYmrsHMHkBC3Y0n2r3DXdwQmiXQbFf4p/7lI56sZULil1t4PXmBkI9
	 x4plD8PgM/2fQRBpQXw3zyFuRTI9wAZlv/BeZMucysFzfbra6HLXdVvHS51uauurMm
	 ZwlyZA6Aucd4E9falGuBsNJOn7fLBR6TbeUAzNt/n63f+zgUGNdEpU3w0cnrre7Pig
	 MIC2Gj14tK4DYRRjVrX5mr1dZ+c+rDD3a1VTkVgf0+NnSCjkl/zIqdSF0jm7u34Esr
	 fE6TJIXL96enw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C45E717E1066;
	Tue, 21 Jul 2026 12:52:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laura.nao@collabora.com,
	fshao@chromium.org,
	wenst@chromium.org,
	jiapeng.chong@linux.alibaba.com,
	frank-w@public-files.de,
	bchihi@baylibre.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/2] thermal/drivers/mediatek/lvts_thermal: Make reset optional for MT8196
Date: Tue, 21 Jul 2026 12:52:30 +0200
Message-ID: <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_035243_093810_A93C3ED7 
X-CRM114-Status: GOOD (  13.55  )
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

Depending on the SoC+Firmware combination, the LVTS hardware may be
may be actively used by one or even multiple concurrent MCUs!
In this case, resetting it may produce either a severe slowdown of
the entire system, or even a thermal protection AP reset, as some
MCU(s) may be reading a very high or very low temperature while the
LVTS is being reset.

On those, don't fail if no reset is found as that may be omitted on
purpose, but still check if there's one, because some board(s) may
be running on a different bootchain with reduced firmwares or using
firmwares with reduced functionality.

So, use devm_reset_control_get_optional_exclusive() instead, as the
LVTS controller always had only one reset and retrieving that by
index, specifically, always made little sense anyway.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 92711896ce24..8b779fc5e970 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1473,7 +1473,20 @@ static int lvts_probe(struct platform_device *pdev)
 	if (IS_ERR(lvts_td->base))
 		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io resource\n");
 
-	lvts_td->reset = devm_reset_control_get_by_index(dev, 0);
+	/*
+	 * Depending on the SoC+Firmware combination, the LVTS hardware may be
+	 * may be actively used by one or even multiple concurrent MCUs!
+	 * In this case, resetting it may produce either a severe slowdown of
+	 * the entire system, or even a thermal protection AP reset, as some
+	 * MCU(s) may be reading a very high or very low temperature while the
+	 * LVTS is being reset.
+	 *
+	 * On those, don't fail if no reset is found as that may be omitted on
+	 * purpose, but still check if there's one, because some board(s) may
+	 * be running on a different bootchain with reduced firmwares or using
+	 * firmwares with reduced functionality.
+	 */
+	lvts_td->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(lvts_td->reset))
 		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get reset control\n");
 
-- 
2.55.0


