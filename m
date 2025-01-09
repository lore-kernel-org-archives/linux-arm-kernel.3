Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1FCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=; b=frB1KboCzUsJZkPWrVYeyzq95c
	qqEchlZcX6j38mBWPsHakgZh/AsH4vsxOG/p4nmK7rdAVarqCOA5YBGZrNa0UIzyV5lJs6E/0HP+7
	kc3qs1ZJyZwo9xiaeMVhhKrKoEbc9FaslSlNMMeW6BSe/73PPQfwc9CAnYw7bK2wPEi2aSQwe7CLM
	lFcWVSuuyb+x6SjDZ7UudBR1ivh5MYxXy2mbfx/ADOw1loXLnrrke8daJJZvORsWWcRjaZHeHTfPa
	vqekkNCt90jn+yD7iUXW6hN9co+LXBMo9AmLf7Hg6RWhMlmMWInTESE8JML+FYGl6I5pfLNLj8uZn
	kpEF9mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpyx-0000000BZl1-3x13;
	Thu, 09 Jan 2025 10:41:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpvN-0000000BYuN-3Vkg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:38:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43621d27adeso5647065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419080; x=1737023880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=THV2JtoO8VFpJXOBXtFwdy/VZUcwzkees/pYrQj0juxiWOILN4QzGxuLpo5fuOHc3U
         RL2S4n1b9tVAdVJf/PAMKiaet1u0s6h7lSSZyozpP+AKWFL3my2RiWihK1GgQV3v1OAq
         v7c9NJasAzVeFSfDXijKmvW6vw25jhlNuXPtIYKRcYuIChgQk8GfxKGtKOKxz4WwWy+9
         K4eP3ve1aAQE0ESBd1FUZI5icmuce6q2s4KaDhfGaf676VWJV1oH51nKT5DQ0SJ/uSHt
         vhg/nZiQo4Gg3IFQV8Zb1VaHFTLDOgbU/6TCCkxRXbxkpVSSBtB/iPITwF3wBkjIpLxv
         yp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736419080; x=1737023880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=xUtKF7ooSGY96FsR4rWv1+aBADgroGr0WVJBH4P7My0bFLfSgaWqbSSJ7TR/Mst9iU
         mDUH4JdOv2zRpvDay0COAPJ7ws5YOqlVWf6FVY14pL6Qnpn9zBKtdetaFHR6C43Vbd5o
         1Be8MYGyCzajePPVy1qHkZj2l6JTLVkPf2cLqWt5UbI6ANfnjtramq8Fbszb+aCiv17C
         6Kbe1/epdObqf+ylLpmBrJ/EL7lYWdAttaSfAj1txPt7YOSGlXtikcmfmCu9pDzwc0ly
         McOANfIjAAJKl96/lqrZ74ntdMQLDM6VP3q5RLQXtH3IWXab3vNELFrRez2QK8hQboNR
         t/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOgTqt9+yhjNS0VtzOZgbn2dQCWKfhIWiYgizv03g4zkU50EQM9WuUdfcvlSAtawdAFQNgqxv+CI11vSU83ies@lists.infradead.org
X-Gm-Message-State: AOJu0YwUBvtEfiabggEUM9K1zdRPHH+3LttGxUo/zcv9T9hGsGEDp2Ii
	7lA4iNqbl4z0GM5JmqBD3vUrueyYg+ZjKxBPT7VqXtioTJV0Lsxbs1fMP2xySJM=
X-Gm-Gg: ASbGnctB8LFKLZ1oW45EQ4i5we4ZvlfDBmCGgyrX6l13rMrmR3pdmuNUBPkiTUWth+A
	oBraKU3M1rQW+mnX1G2/T5soixYcMI+jH9xvhtPJgAeG/La4Di3KgbXBhmfjYWFNNy285gNsH9C
	jKW2wtNOMHxVcYMA9DBSne0Ii3jSC6NKLGKcM2S1JSKe+kfyb0gCFlVREZQMc+ag0indP8jKLa3
	6yUeYn+4WVTX4Xz6tw/xhH+BXTCAjkknfxlIsV4AsUUCc1nlFYJoOirhcc=
X-Google-Smtp-Source: AGHT+IFqrF9VBaIGIQv342u8nnxcL3grxMu66H5YdF4aKnHXSKZ8sqOEG/h96wNqmjPS/6bRF8WYeA==
X-Received: by 2002:a05:600c:a44:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-436e2692d98mr53720915e9.9.1736419080138;
        Thu, 09 Jan 2025 02:38:00 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:37:59 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 11:37:55 +0100
Subject: [PATCH v6 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-2-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Yn0yDiaGCUYQbX+kBDNWi7Wqy2+4x3TU5RubErw6Doo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDwdONFcg4NoVECip2enCTYPobmCH1FlW7pj0f
 vkaE7iSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURSPtD/
 4w4jm96OBg+7I4Hu11Al/9Y0xh9+Oh3kbilSLdnrom4hY3QZ4s7zBD3cCsVUNkid0FLAfkhsMpd4eD
 phj+a50KyeJxdLZ2W9mahlJrExdjQhYo1QuiMNzOwvUhb0setLby8V6aFbs6qcjiHddZZh19gF2OL5
 IJwG0L1WBP48ANNIByya4m067yxpJr+JmuDQbkRVFtWB9oXwzfAkL62i2nYaiyA6tWQNL/q12MGydn
 cNcFzOWckYcGQWzG6MAM1XFekhLlrawheg/eYFMYrHD+gFX9cCU35y0+Go2MnFzYW4y7llOcVjwBOP
 vlLLQFuys/YltGsZ+2K/Mw2hrUO9PFHdQWGvnRfIslGH6jIFVcH1nJ+/FhHrpC6mAc9b/VlTjxjMTF
 5zx0MZ8x4SKVvYp5YpnmmAaryXjax2HWnGX355TxNOb8JQLf0Su+Cb0ZbckN3+9FpOqwmTg2Ga0PbU
 k6uL0C7UZCbj9okzz1bFSMvAlWXvoQn0EicsTdbmucSljHbw4R7nCGRr+h4d/fYL1dkMpVvR5+3F7T
 GaTnq5/w5LziPJ+FE1wRHcGfYi9iTS/vNVfuFKgGNRpBKJBJFnsyNSU1bGpzHXmktkJbLimW1NpxEY
 pxQvTazZz+jDn8BL55TiOGLwoUJr8eBRA2Ioyd7Z2ctupdak/5s9qnWE66lg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023801_941898_011C401E 
X-CRM114-Status: GOOD (  13.21  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a..dcf0d93881b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


