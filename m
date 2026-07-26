Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D03C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbhNNzs08fTZ2K27yGEfF/2tuOjSgn/k+EN2qVB/Pe4=; b=nnRI4Hq/yroYWa4sVT1kGqwRKE
	sj4tRILATHnznNlOYR6T1rBgv1H+VhEEKzfp2WC7uy9bvbIv+r3mLwFn2qR7GmquWimdhoRHpP4oA
	ffnj8zKiSbfiCJOVLpAPY0FK/Rlf2aMqHngwQrDCjHJ6bA21Z7M45JHcqW0qRYclEO3yuBFukm7wR
	1tk/6/+42F6nbdPwMjCsv1WIhVvZsxb7dfniQg7wQZ0pnFDRrPH06wurngcotKl06S5+eZ85+AqhR
	utI01FjeYilMHKWx0XcW2+BX/9iFcsW+SzH2Wl1mzKiZJfyHdR6sUNw8l/16QkfiphvVcELwphOxd
	cKf2r1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Sy-00000001b4w-2K1B;
	Sun, 26 Jul 2026 20:28:56 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Sq-00000001azq-46qc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:28:52 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cab1b0bb489so2196256a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097728; x=1785702528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbhNNzs08fTZ2K27yGEfF/2tuOjSgn/k+EN2qVB/Pe4=;
        b=JWbs/PaZd5dXVH6By6HHe+yx058u9pFCTTtNOUSxLiPyDUQMZBoEDaWFjoOCkzzRYw
         D/qlu4IvXy2mL5KlDO3TAOpbi/4lLsrJ2Ys17n/8k9VTU82Alz71ChQJ9AeYipR6Z3pi
         sDYevxtzHJcjBo2dA7Czcr93gx04FNi2CizWGxB0JIlweY5Brk33TjmGLaQVYl9keEi1
         a24tehI9CuVrl+ajbTd6z4xkUhzYmTGg0yyi8JKQMU5hdB8I9Q6Mci9gsA9EMDyebfKg
         s6fJyQZYDGP25sDFut7nesZEUAexf/Pk7ydjxg440uq1AiRwADiEdlHF4IjbzhD27+B+
         dSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097728; x=1785702528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbhNNzs08fTZ2K27yGEfF/2tuOjSgn/k+EN2qVB/Pe4=;
        b=m1ZhnzE/UrA4F4C17yymS/ln2z0z+D7H7thIwmg7y9vEPJmvl/hj9XSKhWsjfI+7gH
         chV4i6AKLK5Ct7xay1ub1HReSIBODW7Id6XwupdXwwXUlif5hrnEknWMykhpAZxpinWp
         iPXmTzyAwvGe9liuZAZbCbQI7JpKjwaXVLrh0GPLFLJO502twZbHkZ9Mdw4vOVSMc/K0
         +20MHRUcZaTg5nY0xCXiRLSf2pAfVJ3bqSBkEgErl9VlvYjjNNlOpPL00K/axR25K04T
         +n64yQw2GhcDEs10AIZOVDF7EjNH1bp4k11A34Tcq/mB5QLSISdbh/K0E7CFFBocjU8p
         rlDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXkZlFNz5kvVl3SQVQ6dU6INnk28g0UmRZD6dQBIav1TiksVeNIl94qmjT3Cabw6zZPt6+O686R4m7W76s3Ma6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxhzukmkg+4fJqW1XbXQZS1soYajB2l+vLyeDvqDFUMAgYPCqt
	KUdI0qngz26Mt43IycUKIO1vRoDxl05f8eSKWUqQ1/9J4TLqiXMLStx1
X-Gm-Gg: AR+sD13kB7uwmAW/pMvbiGhthCLHxFrV/l+IXqf8Vd+e1hpIIxXM68A0Gz4/rZoEJfD
	uV6qr8DepZMIh85pqPEMdgjyfEXopd/tNFOGOcLdsonEgKZVyo2+zx47505c/CtU0zCc0V1rm1b
	iooVo1rrlwD8LtUKAJYkSh0siRiVL+0ENRx6/ddE7as1sYCKCHv4mJ6fhJVitilBv9nOtx3Zvc5
	pK2kkd/Qv0hy0FkWP7Bh2/bihX3FDKXUubxVVwXIradJ6DSEI1mpGp6Qo0QATPMKisFxoov42YM
	Qibu+Ofs23OEMpmS7638TF3byoPW9+2vv0jbmmvn1m5DLN1fB/sBzdEC3jFR39Kg1LekijB4Zm4
	w88NKCBKeqBp/Ym+StLmODPaccjnQ+f/CHzh8GxheRfgJYGms9Gw6uNNTNWfpNup9FJ49v5e6xo
	RoTaYUx8AEtTBnHuH9JvRlJvGhBHdjQjnQ9QbOAwX5YVqarSzz
X-Received: by 2002:a05:6a21:618e:b0:3c2:dcdd:a861 with SMTP id adf61e73a8af0-3c67df10b92mr5823010637.43.1785097728339;
        Sun, 26 Jul 2026 13:28:48 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4d7d:1e60:c46f:4bb9:6cdd:73bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm132697c88.14.2026.07.26.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:28:47 -0700 (PDT)
From: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Date: Sun, 26 Jul 2026 15:25:37 -0500
Subject: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in
 rkvdec_fill_decoded_pixfmt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>, 
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_132849_053911_179F252E 
X-CRM114-Status: GOOD (  11.82  )
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

From: Igor Paunovic <royalnet026@gmail.com>

Ensure bytesperline is 64-byte aligned and scale sizeimage accordingly.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 436bb460f04e..6ab6530b1cc9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 				       struct v4l2_pix_format_mplane *pix_mp)
 {
 	const struct rkvdec_variant *variant = ctx->dev->variant;
+	struct v4l2_plane_pix_format *plane = &pix_mp->plane_fmt[0];
+	u32 aligned_bpl;
 
 	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width, pix_mp->height);
 
-	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
+	/* ensure bpl is 64 byte aligned and scale sizeimage accordingly. */
+	aligned_bpl = ALIGN(plane->bytesperline, 64);
+	if (aligned_bpl != plane->bytesperline) {
+		plane->sizeimage = plane->sizeimage / plane->bytesperline * aligned_bpl;
+		plane->bytesperline = aligned_bpl;
+	}
 
-	pix_mp->plane_fmt[0].sizeimage += variant->ops->colmv_size(pix_mp->width, pix_mp->height);
+	ctx->colmv_offset = plane->sizeimage;
+	plane->sizeimage += variant->ops->colmv_size(pix_mp->width, pix_mp->height);
 }
 
 static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,

-- 
2.43.0


