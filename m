Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C70AD7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=; b=PUa0hNwIo5iTs//D7UdUWTIS8k
	nciMppIMADmnmTHqfBpVqjzljECgu9M9/ty/P/VrJUpgEcL+GZHvnqIYNB4cn2o/b4K62dpapiksp
	y3GRgqPadENf4EVdpA8t1vtCxH1Bjh7WfQt7Y5N5VaLVavs2GbV75oFf7UrUjLL0hQV3Y3pBZ2NCv
	QNHti6RppRBCS8uAceW8udL9rswOBR9dVaTQ4hR2XImFYBX/5wAYoSTXrcVVlMEpHrwK5xNWTyeU7
	nysLkvw00CRKGSSJ9BeuTSl3R3UGsz4iTLptQsNoePvX6ifjNknXAfL951x/W/N5PcNocFrcG9uVV
	szJYrlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8kJ-00000006jrc-2XFJ;
	Mon, 02 Dec 2024 15:53:59 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8dz-00000006iMb-3ed7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:29 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d88d3d1eb6so23649936d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154445; x=1733759245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=Aom54JQGAaw5QcfFuJuQ9pz+7+Mi/6a2sO8XiF3jn8abdb0Dilr/K2eRgjV438i/z5
         dpRkIwlt2X2dhL3dvy6daMcwOqPtmXG4fVqdYzN2QSIFFD9cu9owjNvzwVr+ueuE5X4A
         Im1HcPD30q6DLxhUz37EGe8f9at/qOWIdFC8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154445; x=1733759245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=PhZq/ycslP1noZwru3jJ0QtlsLeiUQ0V6WjT0vEFtOsQynzQnVZ26lNRUuGfuLZ9Au
         ahruDsPsq/HLxrk04lfdEzip/vOmjEaBYDKDOrcNVapfOInvs+fQa9S/Pefld1AIllJy
         hux3RUYcYp8ME9LKsShUxSARBs5QF1LqWJxSLH+euq5iAK6B0NZ7NMXjI5UkgbS2Xyow
         9/kg0lmaE1P98YxIQcZhHsH5HGO0H+8NCYUO3xJZhqTEUBZZdozjnVJoebX96wyA+een
         OeB43JjUF51TjLHHYcHvoo6fQzXgkudSvi8Zi72y/OXt1vWDp28e0CVEe7/WE2DI67+l
         DUnw==
X-Forwarded-Encrypted: i=1; AJvYcCVZh3AeC8/LhGlhDA5aJ7dUxEQQdeRk6f8rbS1EBuwK0vGPz+kHsphzVm0Ywqy/r4vk7pGLv+0pDYug9KYehZcU@lists.infradead.org
X-Gm-Message-State: AOJu0YxcyLtKr+uaErpWKkatO/O7kWu+WDY78kfcpcQnac3bmk80KctE
	Tdpedwe4Yu0tcWnXintOoAtU3C3Xgk2zei/OhDIV9KQF/Yy8YzwlRMAmNPJohA==
X-Gm-Gg: ASbGncvvyCBws/xKi0p/nnKEQsiPSrK3iHHu8S0VqBH3c0i8q6NQOJtngUDVwAaiiv1
	ptMPOKMF0OmhAd2rS/ak/DH8QaSDqb3U2byVBUZcIhHEluuaAHZk1xWpuRfUJG8TIvcOchkFJ1p
	gZaVKJqqO44T4uofXiwGO+rqS9CQGLVROrgXOTH0wwA/VtjHxNktKmem2yY1h08bNhjUEtLsARm
	BqmICNl/1sgHStH+KzXpEQRIcwtHRZnnnZ6A6M+wI4soKm5qHJ6cxvWnrIeyi03tTjXfFTuPLun
	5vpKRiVhDmfennsBPrEQqrql
X-Google-Smtp-Source: AGHT+IGi/PMi7HKxN0drYRNoeMrQehkEDZgCgHDgtdOzyjj8HEWJDMxx4Dj3/iwSYHFuTdJy9nQktg==
X-Received: by 2002:a05:6214:626:b0:6d8:a1b4:b58f with SMTP id 6a1803df08f44-6d8a1b4bb2amr99633466d6.11.1733154445272;
        Mon, 02 Dec 2024 07:47:25 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:17 +0000
Subject: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074727_909781_E3D9CD41 
X-CRM114-Status: GOOD (  14.27  )
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

llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
the same enum type, but their are part of the same ternary operator.

vpu_inst.id is of type int, so we can just rewrite a bit the code and
avoid the following llvm9 warning:
drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..4786062e879a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
 
 static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 {
-	const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
 	int ret = 0;
 	struct venc_h264_inst *inst;
 
@@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
+	if (MTK_ENC_CTX_IS_EXT(ctx))
+		inst->vpu_inst.id = SCP_IPI_VENC_H264;
+	else
+		inst->vpu_inst.id = IPI_VENC_H264;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);

-- 
2.47.0.338.g60cca15819-goog


