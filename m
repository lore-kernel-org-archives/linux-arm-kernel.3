Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AABDE6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyoielU3zjNqonG8ClwRvy2dP0ivTU2tipbGsgeAAfw=; b=n9K73vYhsYzihSxIZu86PRYlWL
	XHwYsfqvFyOsocgDapps3e9tvvQ0i1Q3S6cZjeIRbenVABPF1RbUcUaFGIbr8U9G+HKwlasCCuxYu
	hvgG+xYmoxyIfcyCcFcCa5ksj02PLlf2aItQCRTyW5dizOj9MXngIiZgnKIzB0tCLTdxoCx57mDUo
	uZTniLPyK/RisI7AxHDH/0YkQp/JJbX8PfzgC3Oa6mx9bbsXbGOVmDF9xDhyAG/ZhuTPofp2u/lQn
	r+j68Eu+N8vZfOhoCWS4WLtzFY8rf1vWC2HKW/M9wm0BW4BZy9EFlMdEAgkCAem1ru8UYYqiblE8x
	afzQni0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LJ-0000000G06a-1Pvj;
	Tue, 23 Dec 2025 19:46:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LG-0000000G048-3XBf;
	Tue, 23 Dec 2025 19:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519203;
	bh=wh/khd0MG4TmlC1+SwQHtrkPFJXfgwSIZjK19Qae4No=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=It0HZ5oOwjvJfgmJntjU2VjEHR3wpqdCxoGft86uIydBrC/H+6PC18BP8ONEbcx8j
	 e/noOhNfKee0AVTSJ/kbf9FiUPSFN0gpGdG0TwjnWt205JUmAmirAAzcKa4SQ9BCS4
	 q7i9khvC1gtFej2twvf8dAShQSfKF2GBcVXVfTUjFE1THCLsrSK/oJn3lFXcf1P72F
	 NoIERAaxk6kRUnIJaAcbM+TDLYajjHfN/O+pcqDVvdbFXg1qLq25gP0+cneMVqbhpb
	 FGuc6CDglgIWalQRx4eBypZ5kGqkNXkSySNwisMk3cjdTmih/AqbM+mUpQCOIjb92l
	 wLlXXAMpqjomw==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0817817E1345;
	Tue, 23 Dec 2025 20:46:37 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:44 -0300
Subject: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114647_043164_9C7C364F 
X-CRM114-Status: UNSURE (   9.09  )
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

Add a supports_plane_colorops flag to the driver data to allow SoCs that
support per-plane color operations to enable support for it in the
driver.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8e20b45411fc..46238c21b0ac 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -150,6 +150,7 @@ struct mtk_disp_ovl_data {
 	const u32 *formats;
 	size_t num_formats;
 	bool supports_clrfmt_ext;
+	bool supports_plane_colorops;
 };
 
 /*

-- 
2.51.0


