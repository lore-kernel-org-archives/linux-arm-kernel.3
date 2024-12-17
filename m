Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13E8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u9oA4iw4W+DGpb0H0Usn6hUzYgISvntMx+NioEpj0U=; b=MHzxSCBWfyyy5hFkM9JYFUDbS+
	A4Jbo9fZbaQ4uBAcVxKNnrFfrLjE1v2zQ3kMfFwBgVvt/8ZZMwSWcK34UYhP80od4XcTqCikCW8QB
	sdtj251cTSbbg6reqbWOld5RaH6+PF7lJqQGEfsF+KQnc4fbpuxbmnmCu7Q74KEsiyfZx0nGDs9ad
	tT/P+rvN8yLX1bpDoWSto/obOxfmvNIaMOsSJ5mAv8eMr9IC6qkt9j6/E9Qyhmb2dWRs2YuqyuKfW
	XpXjLjgV7Yol8XUXbqMCTlbv/UxU56XsRnE8sYEnei7gmnLRQDHERBTT20OgaabI3RuGuvhIF29an
	L7RVkqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaKg-0000000E9VF-2VIK;
	Tue, 17 Dec 2024 16:22:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZkL-0000000E0A5-1Dhm;
	Tue, 17 Dec 2024 15:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450268;
	bh=K3NExiNqHDr/dH0KkasiqAHlrrm5EPcA/B5tJUWXD5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bpuaXE48nGNtBHXtgMR0j7EMyBgsvcNAvTnh3/bLBSKGp6d2u8W8LGH6+kxrAW+Nr
	 plgoWmNb46qrN9DzWucPbKlM+ayuniMNAo0p+T5LazKUgb6ROHroMtsNr280cdC8so
	 aAmENhxodxLywM5v5raZUOOexlWkcTTwY/sPaRGWHg5jYxteU9ZpnVjEIBbtHUMs/J
	 4Voxf689aa95Zxo3+4Gug/Gb7/TQfbb9gjPaTpncnv8Z3aF26Avht4WUmAJAdZAAzb
	 U6PCVTQsGbS8s6z9Slm6mN8U+ILBxW++CiIWPHVieE6vc6yj6fX0Xw6+ChuruBqIBE
	 q7eA6sPJW8DkA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4A1717E37B0;
	Tue, 17 Dec 2024 16:44:26 +0100 (CET)
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
	dmitry.baryshkov@linaro.org
Subject: [PATCH v3 26/33] drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
Date: Tue, 17 Dec 2024 16:43:38 +0100
Message-ID: <20241217154345.276919-27-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074429_478387_358A5CA6 
X-CRM114-Status: UNSURE (   9.79  )
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

Remove the error print in case of mtk_hdmi_clk_enable_audio()
failures: since the APIs will already print on their own, having
one in there is redundant.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index dbcb9fb09edd..6c9d046809b2 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1705,15 +1705,8 @@ static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
 static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	int ret = 0;
 
-	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret) {
-		dev_err(dev, "hdmi resume failed!\n");
-		return ret;
-	}
-
-	return 0;
+	return mtk_hdmi_clk_enable_audio(hdmi);
 }
 
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
-- 
2.47.0


