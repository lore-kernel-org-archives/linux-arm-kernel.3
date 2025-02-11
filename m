Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E54C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhhC4n8IP2tRHLVo/+06UFVWSVROlkH9zwoTZXTPd/Q=; b=AX71hNcVAbElN8oGIt3mWQFm4m
	mEHNrmUTMmuRdTOjkW1n1UTiMomlFJYNAbZaGWy6SKI6S0oVbN4i7wOJudGZzgj2Gy7XKsD/LrQ1E
	qjFyxvmbIc4JskpM/aVbP+ts0AhxYnwFTBdBmHZJ3aLzZ1fcP8TaPNu8nrXcceQJgrwdX0ZtMmSpW
	TBmeFempESdt2F1dmsqrs60dW/rhwsKPhfulwT3kpQvu4zbMokNMD2R0Xk/QdmoapmBTxRXrbQGEw
	LUsFj6wDymcnTFFQ4xJvRKEWc72rI/ralZPSymkitEmUxoHE5+awasW5AyeCRP4J22saFpU8MKalJ
	+wQjj29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpfC-00000003pCt-1yOm;
	Tue, 11 Feb 2025 12:46:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXW-00000003Ytd-26OF;
	Tue, 11 Feb 2025 11:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273693;
	bh=1g+QX7fFBKnJwOhQKLJmfrV1RgOf/ayILX6PftD7LPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtJ/Rj+n+0Mwr0yPHhZgLLdpCfBmVHGdRptLUJVu0tu98tfMfKLFkGxalLm3PU4SO
	 /e0355YNLOGwdMClfxBC8FQZMHU+t18emP+P9ST3twd+pLFJAExpWnKbc605RYE0B/
	 wn4szlidqi9jkfHvyHPEIWTOfuktMuFRUZKn1Zdol6K7hREL7KCGUFYQefzx4GZR3v
	 jcilZ3biAtrk/Iob3kozO4LbkHbCcfKvbRrijVRrKzEbTyoduqO+Zne4sfcuSAObdK
	 qR88MGAZ18vyVObvB7NUYnW8Av0y7FvkSwSpy8ik4V+TC15/0pSWLyK3UCuOQHDUU9
	 kOjsTdVlZdMyQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE01517E1548;
	Tue, 11 Feb 2025 12:34:51 +0100 (CET)
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
	jason-jh.lin@mediatek.com
Subject: [PATCH v6 22/42] drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
Date: Tue, 11 Feb 2025 12:33:49 +0100
Message-ID: <20250211113409.1517534-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033454_683915_8522163B 
X-CRM114-Status: GOOD (  10.05  )
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

In preparation for splitting common bits of this driver, moving
the hdmi_rec_n_table struct array, and the hdmi_recommended_n(),
hdmi_mode_clock_to_hz(), hdmi_expected_cts() functions, add one
function called mtk_hdmi_get_ncts() that sets both N and CTS in
a single call.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index b5245ac15801..8a26cfc9fc61 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -682,6 +682,13 @@ static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
 				     128 * audio_sample_rate);
 }
 
+static void mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
+			      unsigned int *n, unsigned int *cts)
+{
+	*n = hdmi_recommended_n(sample_rate, clock);
+	*cts = hdmi_expected_cts(sample_rate, clock, *n);
+}
+
 static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
 				    unsigned int cts)
 {
@@ -712,8 +719,7 @@ static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
 {
 	unsigned int n, cts;
 
-	n = hdmi_recommended_n(sample_rate, clock);
-	cts = hdmi_expected_cts(sample_rate, clock, n);
+	mtk_hdmi_get_ncts(sample_rate, clock, &n, &cts);
 
 	dev_dbg(hdmi->dev, "%s: sample_rate=%u, clock=%d, cts=%u, n=%u\n",
 		__func__, sample_rate, clock, n, cts);
-- 
2.48.1


