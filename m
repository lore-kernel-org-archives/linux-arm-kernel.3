Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77386C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZD5OAXxmdP8p7ekKjjkB8GfJ5CHud9HvDJcqeKiUHz4=; b=HgSikihSvNkjdVb94XS7w9dYWC
	RDIJrQIafatmnQzNceDbyOa8XBGNrsEEqcP78RodsjqZPzhqaSvzurrDiYNExuPkepmDynLxDe1Dj
	+95VoiHIpIXZz8P6NaL45gI8RlQKI9YP83rJxLxZauGGJFBhPzshRXlPvdwjVNTXo8LR7ebDsr+fI
	tUphm8CmGGHA0+wqAvhfSc4umGWLt5gnxFxnWDsSU4kcsdJzOg+0WWpuRw551b2R466F20WjEgGKu
	HKe2Xr+FrXqjnDDO0ZboDZcycJXdiPPalGJOvEGQUvC9juwhFC+SZfGxO6EGdqtRy95ZEtqe5WAst
	+hTM9/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4duJ-00000005Q2Y-3XZ2;
	Tue, 15 Apr 2025 10:52:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dlP-00000005NI0-2mHt;
	Tue, 15 Apr 2025 10:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713814;
	bh=Sq9KcR3RDrb3KAj97zK8VaCYoywPdOSiQnimWw65Ta4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZ4b9NXOkZatwk9TjGN0IOMEnQ9l0Re4e5iTEB9idgxb2n53aE6aujxwbujlTeWol
	 ePHm0im9IiUz5CGIzuUBpFPO48/Vy5DJh/KIQjG7RnGdL0ksL3gsOWjuU+5V65Ua/V
	 8ULFhKVfntMQ7kWuMnCFdRx8M0bSGLC/GK03sCt8+mrW9KzsjYyJTnYR1Sydvve9hK
	 +4LL+GTZr06AGjMjlfLbgoYnMquQZoer6ikeaMoDA7U32HYZRHqDOOJLw9aZOQFaZX
	 bss11ak6eT+K/XC1J1QQebqIo5KNM+BX7q93YxPxDNXQu5l0SitqtCVkHZKkxZESuL
	 VxeuWmMvBL9jQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE1FB17E35E5;
	Tue, 15 Apr 2025 12:43:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 03/23] drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args
Date: Tue, 15 Apr 2025 12:43:01 +0200
Message-ID: <20250415104321.51149-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_034335_844431_48C11704 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 06e4fac152b7..1358a5095fde 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1447,15 +1447,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
+						      1, &hdmi->sys_offset);
+	if (IS_ERR(regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(regmap),
+				    "Failed to get system configuration registers\n");
 		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
-- 
2.49.0


