Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB185E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpLx2OwYMIkRjIAXzp8thVzRfANzIQQRNJW0pHTLUhs=; b=jH9YCHsKvrsycf5cmMb2Jw2zi6
	VYAIDKMfWv5vGqN7n5tQ6plU3xJaGTSJ+2tuiLW9VP0fa7nqUciYGL7VR5nEi1ZF8OKEEcVbbPRC+
	2xuEWrFIn/tylrz94OXjcI4CR6pOiV62yzSFe0MTy1B5uNx+amydOZMqn7nx6JyobOd1UisCaQMz0
	Z+W9npBjhBwstBIZ9WCAJIPm6dH6N+UrvkM7rH2nVC5MO83dvUYE0GqZZ71J7JncZRLKUOWAkWqqf
	cWF1ao0sAwWJi5EpfVooSU408GCQLYGZNRN6UBgK1fgIMwhFpDdVfJyd/VfXJyArqCKDqkvZC5T0c
	zXHM/8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNb56-0000000EHlO-1R8W;
	Tue, 17 Dec 2024 17:10:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZk8-0000000E01u-1zpr;
	Tue, 17 Dec 2024 15:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450255;
	bh=OEFJhnGi56R7PJFkzZXIALf3gvTaB5bUdb5bS7WVCq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ceSIYpKk8TPS/PsUspupzXo39GETvtMPb9+m5ZNUVWRPx6GYXgob1GlC2rFKbTvok
	 eN9LNQjvHu/URM8M8KyjeZstvuxt5STiy8/8CN9UUhK3YN5wAocGMDOxtAW4TDxW/G
	 6zNsGyMENIFYOlxgWCIrgeFYp4SrqfS2T/WVaWqK4Dw5H5f/b5a+PiZKq9hYaic0nZ
	 F1fb1R0yovvp/YemFrfDWcDaqpoM6gT7u+rts3b+YW1oOZTKYMmO6FcZT6Tv2+gJ2A
	 f9TSYW7n2/cxqbBLM5RF51rUikPyRQ3Un/sA9ikfOclArAS9Qm6Q/vzsdreiIfZDJN
	 ieDbsjNxyp71A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD3B917E37B2;
	Tue, 17 Dec 2024 16:44:13 +0100 (CET)
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
Subject: [PATCH v3 17/33] drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
Date: Tue, 17 Dec 2024 16:43:29 +0100
Message-ID: <20241217154345.276919-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074416_664835_7051E2A6 
X-CRM114-Status: GOOD (  10.16  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index f60c4effe905..ef8dfcb77318 100644
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
2.47.0


