Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE02C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzPXXfZXC+3wpWPK11YVxd4SERafXHakNNoEmG8CuVA=; b=NVRwAO3NOhHzKtQUDdQ3DZ6n5+
	rhGFzF/7Pbwd4P/c12ngC5VsIiugd7idS67r+9jk8hlheZtuTbv0arViCmhe/pCOqXZ+uo7WZ58+i
	Ldu0H72+JcXKaYYawwI+DT1jb3g1Roskqt9hKkYR8k+iNQ3u2PTfAZtH5DWIz4afUmmyW7Vav5kcW
	hSF9ohOlLHrVlSmcCafV2BndcQ20LI8sCQhjD/zzYEoGHcbToEUkaTZ14T4RZGc9CLEhsZPAIyIPY
	tImvoWErmF+m6FhS67uM6YaF5PR3+V2WaPr9ZdiVDLPP3TAWbXqVXiePpvN1L8ZJohQiQV9KzST7C
	JkbVP+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QbF-00000009pdR-2sji;
	Thu, 03 Apr 2025 19:51:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q5Z-00000009i8q-28bI;
	Thu, 03 Apr 2025 19:18:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE558A45EB3;
	Thu,  3 Apr 2025 19:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234A8C4CEE3;
	Thu,  3 Apr 2025 19:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707936;
	bh=h3QSDis12+DZtZpk48pGRbePdmUzr9aVvoKyNZ1jgwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhm9Uitaa0GS+JH179I0+9K35YOrnvMdOK8pV0qxvEuXP0fd8wsnqB+KknlsWvSTM
	 bzVahkoam0E77/8tUkjU5e1NmjtzQA+7lc5feuSO5XDnGZDnCBrPM0Qku5R8slwZwe
	 KL8ZNIqcYE6tMMBsCktyJk8TutVF9S2E9bUJX/oW6rockJTdyHFkw1IJNJjLfLeJhY
	 RGQSJ1UnUvJfB49eip0+utAH+eGHwmI2u1DFRMRtivR/DAm3ifkdEaLUfU1yhLA1tN
	 yxdG0lW5s1Rt1BA07agsk6BJ4bQsdC0RrDtt2GA1ukVVNJo20sdBBbZ1npYpGKKo1j
	 KVlMquZypCklw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 16/23] drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
Date: Thu,  3 Apr 2025 15:18:09 -0400
Message-Id: <20250403191816.2681439-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191816.2681439-1-sashal@kernel.org>
References: <20250403191816.2681439-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_121857_680416_0E5E76E9 
X-CRM114-Status: GOOD (  11.55  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 473c33f5ce651365468503c76f33158aaa1c7dd2 ]

In preparation for adding support for MT8195's HDMI reserved
DPI, add calls to clk_prepare_enable() / clk_disable_unprepare()
for the TVD clock: in this particular case, the aforementioned
clock is not (and cannot be) parented to neither pixel or engine
clocks hence it won't get enabled automatically by the clock
framework.

Please note that on all of the currently supported MediaTek
platforms, the TVD clock is always a parent of either pixel or
engine clocks, and this means that the common clock framework
is already enabling this clock before the children.
On such platforms, this commit will only increase the refcount
of the TVD clock without any functional change.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20250217154836.108895-10-angelogioacchino.delregno@collabora.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e4a3bd3989d8a..54fc3f819577e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -471,6 +471,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
+	clk_disable_unprepare(dpi->tvd_clk);
 	clk_disable_unprepare(dpi->engine_clk);
 }
 
@@ -487,6 +488,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_refcount;
 	}
 
+	ret = clk_prepare_enable(dpi->tvd_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
+		goto err_engine;
+	}
+
 	ret = clk_prepare_enable(dpi->pixel_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
@@ -496,6 +503,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	return 0;
 
 err_pixel:
+	clk_disable_unprepare(dpi->tvd_clk);
+err_engine:
 	clk_disable_unprepare(dpi->engine_clk);
 err_refcount:
 	dpi->refcount--;
-- 
2.39.5


