Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795E6C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqoiYHhRPiQa2sz8xK1KKGZGMFM2Fz+/+jDW0qeoKTc=; b=ZEK1zVGZAJQ638nE2YG/3NYCXP
	1O4soXcB9LdyoaAXD7JrzUdbfWVranM7Khmv8/LsDkmsTMcG7n86sNTktOAlQSZjQcolv4pFVT6mn
	C981oZ8s6T7bUlVauz2t96K8pAghLiFR/OxT5bM+P6vB7F/scX80AK8qIUohveOjqomv1v4MTbSeP
	IY8sPPj+uwOefamytXq55rGbqVYIjiGprm4rtRsgbXwT7igqawIerJZbyxy7zOQYGEwj1b170vBXe
	nRRftEW/oPl4ZKsd0PNbPpKJOwOXB6GFhgqxpI53WbAZXaGD8FjKjWk0X+ougMJgzqjyePq5hhEZf
	nEPDrG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VhE-00000007KVE-2jig;
	Wed, 09 Apr 2025 13:42:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VFL-00000007FIc-3bCx;
	Wed, 09 Apr 2025 13:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204418;
	bh=0ZnyNYBunZVKrfVBzEg9Tb9rO3d2s/FodrkAnZmDM8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nw05zIMOfCfBk6dAHUb1kH3bef413GVK0/DBmfXTSI4P+us5nwZE/kQUGwt9UU+Tf
	 OVhg6f4cRdYwkOX/dHCngMWaqoQXZCNHORuW9/DSs3EVmN2B2gkyNS/rVyVit4GRai
	 4Z3f282PtpKfrtymYppJvRIfyfAKyOe8O+M8TrEM0x33jLGJlqBqj4wtUauveGPf46
	 iEO6xSOKRd6usgScpcK/jS32pYdKWqwYOID6QAPz+LH7P1on8cDgdgVZeKU4fVIIWz
	 bMB0n3IlliR9jSD5fg9aWJg3y2eKLsE1Q3u43SuFQGCDp5P33JWdGmV1LxDwnu0pc0
	 0hfUGn33BqYUw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1003117E0FC1;
	Wed,  9 Apr 2025 15:13:37 +0200 (CEST)
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
Subject: [PATCH v8 10/23] drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
Date: Wed,  9 Apr 2025 15:13:05 +0200
Message-ID: <20250409131318.108690-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061340_051612_F61AE8DF 
X-CRM114-Status: GOOD (  10.20  )
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
index 87cf97136fb7..e7acf392b8f4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -675,6 +675,13 @@ static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
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
@@ -705,8 +712,7 @@ static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
 {
 	unsigned int n, cts;
 
-	n = hdmi_recommended_n(sample_rate, clock);
-	cts = hdmi_expected_cts(sample_rate, clock, n);
+	mtk_hdmi_get_ncts(sample_rate, clock, &n, &cts);
 
 	dev_dbg(hdmi->dev, "%s: sample_rate=%u, clock=%d, cts=%u, n=%u\n",
 		__func__, sample_rate, clock, n, cts);
-- 
2.49.0


