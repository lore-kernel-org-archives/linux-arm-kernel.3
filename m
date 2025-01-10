Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B658E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=; b=ytmguqM8msFnH+XB2U69VtdsR4
	d55FSWqPz5lXl69TE7mZOsHFNy9fCUfy85yRQz6sFpcmK4M3//2cNhT0oLs7/uRehoj53S7U+YY/N
	ydqRmSESWXgTwQ2L8aOulmz5LJSREKOSoO32pWv9FuPV3kuYe1coE11bBg5o830T5kKolYY1+Yk8K
	Oaav3i2U0fxcTjNWlnf7yF8v89BswRBVUWcXQ53tLb2pPBBUV42wRz761D0ZlJipfvnIZp2+ar8p2
	q85OiSBoCu8hsjrnGF56gSIfNlkGpB+bWGtTI2bvReOTvDQSNlG3QnKaaBk+pcH+AVQ1BMb4oYwYp
	VzR4zPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFBg-0000000FV27-2sKp;
	Fri, 10 Jan 2025 13:36:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6o-0000000FTug-0l75
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 13:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=; b=k2xBDtPmdjsxypQgDa7LR3mciC
	CvwD4rqjmCb/lzmrOIyLimEJQrz72taEhS+GRJ935IVqDajEKq6D8k1N6KsF5oicUBUPMv4Zo02Rx
	p3DstZrfQaVBcYQpu9/FU8NL6+1NzidCfbM3dGuy8KmOvD32WBhKsAc/fOmiiKiSAHh+s8RyjW/BV
	Dk/Zc7Y97m5HoB95zd2j9/8OqJTDcwgkn9V7+TnZ4I2ec3eQnMpQK7wKt/mvPpbGUCSFkfo2YpiO6
	IUFuVf0LsfUahAV8dwYYrNpZ/jUCQRh551E9h+MhMdCfTmWJEvSlnL4PycHlm7mSyvRJQjwf1N3zM
	OYvjnTPQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6l-00000009m9J-18yu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:31:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385d7f19f20so1098072f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 05:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515885; x=1737120685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
        b=Cg+uKbd+g/x/44GHCEPS4ToaI1jWhHuRfSdQGUmEkq45iO8eNxfgp//2rx5WxwtuCW
         /1xFM7d846rUDBH0wB7qCkyraItGc8N72xDm9NTM3IYHLR1xYv4qtyp8MqnjyWsnBIfl
         +y7pFgLYpEkvMjfkd5sXencknZ+38Zb0GIIfk7GQpgtZqj5sa6XCG5j3i5bXhOqOv2/w
         iVNP5k1ZjjN4Ru3kNOIapAbybd827xHXgQm6RCmD9M+kx8ZjLkiJdLSmUsEVxrlZC6uo
         8s8ZyJDowHry6KctoE/AQEO47sXncHcnN0uecRAQh8E2psWQlJC4BnZMv4PliEnYYkT6
         /GkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515885; x=1737120685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
        b=jHtNKoE5/OQ5VzGjgMYUY1r8fXh+3v6Z90e/Y+mfckg5TopmVLzlWoFSGdlLGO+yzF
         FEGA5e+KjFR8vh+bq1pNoiFOBRIGUmOusRZLaFARdngAUzMZrSj7qzye8iwjpD1K1WGF
         OOcBCemszjOzhiFF6nVYTlmQljIz36Zw60z38B5fSwBXm4rAGVs9U0zLWHdUeZoxKSm1
         9jmIOo/T43LbuehSmOA4+3cOHK19OOCeC/32z71tNPLXQ6t6A/9H/4LrjM6VNv3fta5F
         EcgdOarVIutj6P8InY+ByC5bRj2jOxYZd/l3IPcGvu+tBrQ9PyWA+9VX9cve71nWpQ29
         F86A==
X-Forwarded-Encrypted: i=1; AJvYcCWS+dtQ6r6igGJgkkBdLMcNigJ3HZD/FrO3BgIsBHMEbjp8QWvL9npN08rOp+FEedW6bttx6le8jaE3UyTc4yqu@lists.infradead.org
X-Gm-Message-State: AOJu0YyKbmZNjdAhsqQmmLgYICUm4HbM8a7SVmRrKDP7d5kHEnqWXTYX
	RuiIwevsXK6epxtM8d6Xtpwa5KTIa6DoPfpfs+w6zxk//vgpE6WdY8Kbh/wDoj4=
X-Gm-Gg: ASbGncvMqfSMTKPVV3E5Kg6OciDLf/9uUdsgZEbk9gZPqH/0lLAdb1fRlQ3dHJ/kLf6
	m+ne8eoaPOi/9FTWfszjuH0ktZBUyR8pyF5p6CX+tjsfHIVdESCNLcIuEIPiBxftb8+vbRuAnLY
	Cfa2ty5rnWlBaL3HuVN74O8tw5AcO48S4nblLx/u+wICRgclf9KnlVNqDji+RrqkIF7YoktZ0mP
	hQPbVElZ8HpzDPUkEb4YzXA9yDt05Ql1u/rRfjbwOZFCekca8yCDbU2aey6
X-Google-Smtp-Source: AGHT+IFx2GC2yPIa0jo0uLSF3wUAfCDb+jHxkY/Jz5/qgDxr5WT9ZW2q5ZSeDjEs2iELnpyG7PPdYw==
X-Received: by 2002:a5d:64ad:0:b0:385:e67d:9e0 with SMTP id ffacd0b85a97d-38a8730d521mr9053765f8f.29.1736515885138;
        Fri, 10 Jan 2025 05:31:25 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:31:24 -0800 (PST)
From: amergnat@baylibre.com
Date: Fri, 10 Jan 2025 14:31:13 +0100
Subject: [PATCH v7 3/6] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=wfidoNqLEIpqSK6RG2PAlzWtAyJfTIKDPdldVFKf2ag=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEn6dIUV44F8BjerVW+RaDvB4bQEz+FY+SuSLdC
 zThnaqCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURR7ND/
 9QHUK4fkSZ0JuFIq8kAo9pXcFTRKLN5YRBM6U51ybQaouZrB7uPYUqkPmuHlzNymD7+e1nPAhsjsVA
 fa2fNmQiGduEJhPZZJVQWDOfwizbo7Blgzat5TE946k6xnyscmUl/86A0IcU0T2CaqDN+64RIXbeOh
 tVe4RUUzBFDtrxcOiNUkPTYW6ZeM5t4fyx/Yl+aLItJrrTBsmyne18s3duvddS/5eF/XysLTuDedLN
 JmTG/tFPeUsnaZZkNrkKNvmtvc3bqKKDt+pfcVBsxVlNxcBnw7lSw2L9IHZ1J+So44qRXKJyYitGsP
 epvfvPsHkswsK5VO+hr/K5kHczfxohSGIukWZSJ75GqYqKSM4jDUZWAKo/vQAWfuWG+F206/Jda+wi
 +Gx2TrbfaX2VSSGVtXJc3Va/GDFWFcxA1k3CRdfMklYYmhMLT98eLpSYxY6xT/zXWFHXFSOHtttUkX
 b8vIYKwbVIPi+AO6YUFa5pbFPGeM6z2As/FwyE82JReMRPZpCiVwqro5fZYs8RIZbSYAwZBxMlajcI
 9oZln4Ep0IanTgFreC5xAChZmTxAT07/WJ+Q589eASkEAsPACxQDYDC2vZkUnsYt9Sd6pROxh9P8xf
 RxXuegHE62J2LoezUNJ+7KLyzCwJ1wKDwgFcfeY6c2pPfREbqG+DhICutwKA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133127_528598_06C47A49 
X-CRM114-Status: GOOD (  12.17  )
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0829ceb9967c..5471ef744cc1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -328,6 +328,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.min_height = 1,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -355,6 +359,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -751,6 +757,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",

-- 
2.25.1


