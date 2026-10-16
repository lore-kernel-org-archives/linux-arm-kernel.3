Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23803CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 11:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE4aOaMM6rfgfLxamiGTUaP3vk+wjNz3+/pqgNF8zrA=; b=1b7lC7bn1N7Zk1DqDuevUQBVKR
	Z1wGZK9tMwJanugd0e5o/dRCz6+9F628B3ccMCTFXe7/CNF0HN7v3ZE57TLqukOXLeT3czIf+K0AZ
	Mfjfwg/8LIBqs1bldhAGBbBwhmIWmQswHN52Sy1ukIxNjGLpX8rU9I/Ep8iVvc2mZmZYq/Q96NQc4
	4Yq5TFowcqTN9NGYciBTr+Fj+jkFyLbzhM6Ka4Bvv1s3MLXUG+9BYBVtofjCI7EN1yAtAB6dj6rp2
	z/ej8tYAbAB63vwAjz18vxj4MnHg+mXyEg9JVzjeskJYXswkTX0VJ6z/SxjXAjSwPg5umMI5/GFB0
	NbiMYr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGR-00000002mDd-0q8M;
	Fri, 16 Oct 2026 11:38:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGP-00000002mCs-1Zce
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 11:38:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so57438055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150696; x=1792755496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HE4aOaMM6rfgfLxamiGTUaP3vk+wjNz3+/pqgNF8zrA=;
        b=GNsQwG82RZqai9ZXgvT7px+2LULkziSK/ypmhPxYtXU1ffPz7Qj53fesHDR7ezbnHj
         jZH6lnG6D6ykTWHToBYav5DEm7mJmUfNvzheMXTaCNcV2brtIdHAE2wRiNEphcc3XHNr
         0TLgJ+Pyj/YKNc6tfZXFKRb/P4xBSrpFg6xHsGMn9NvvvdKGA/DNz5QuSzydseBE4KeJ
         O/QIV1lJFxWPY9Z4KlxoJ6gG4MViwTxHar/2VY+qkFQHngLeM499zYnwos32rFxtEc5T
         xIMVhmF2ZazHw2Li6O09qMBhHB1UXEY779LN250hptPLC3WqTVd3VGkCRXepK814eUsE
         E/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150696; x=1792755496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HE4aOaMM6rfgfLxamiGTUaP3vk+wjNz3+/pqgNF8zrA=;
        b=mh7E4YK5IQ7/aHXRf1nRHOwwc7D5Mxw5XG6eoWbRrtuUtlPcN83Mje8viFLTKKjY/5
         nGSdFwmMAtfUW5zODrzOlUShWtfGRY8li2OZFXUYd8eVor+RHvdT669VlENQDd/1RsJQ
         rByNjP47gXIj+HYyw5dpKYZ7zcCe/ZEVp5csn78NbYGVbIlSRolMvNVFKKzZ1p/jeqEf
         zdSf9yxlmP18dyqYtgKgRDl5bRNj0hBLRi7CRYIJ0ypze4laHVvv1mY0Sa/YcrW9qhdW
         Fh0LFFpDSPhPx2iUBy5TEztPkhgZpnNrp7RVVkJi6wd9QGYZfBucVOpKYFzQqI4nJ1Vx
         BCjg==
X-Forwarded-Encrypted: i=1; AKwUvBw68J7Pf9lhUs8HABrPo4/UL9unpKAl8apOnAyUVzDKiEkGHB/XplDXvdLZWq46KWbEplqE8evhNli+8Q23ONol@lists.infradead.org
X-Gm-Message-State: AFq9FYJnu5tE/NGvA458PEs5dhyiugtm/WNv7xP9dRSA/BHxxaqe/Zw5
	YB34vxJiIH+FV6VhtlTD6Q4TBVUzUnJMj8YG3AJAUT2XBWhF3yxv+J/l
X-Gm-Gg: AYBFou2S7d1elO98UMEdOmdKtIsNXd2IVeR2SGTgkUEnTt8ePl0b/GBW7j7ozwKjPO3
	x0O2L/GHU4rXkzSnRx+kHtQdgkoc/uyEOSKdV+4Mg/oWkP7+tzVM2mQ2J+iWeVWgPB+F/ELKyV1
	AnHRWfr6EEwH5QXc4FqPoTBF8a1TMaIpiiTOAvcZbkzWrp3wntOVtj7gc6kGdPaexe8/l0NuEM3
	/i6YQL6LFW4tOUAwee05zpNsldHV0n9aX8+gKCz9SvxiJJVrft2nYXbB3SUtzHTAvHfElCc1qJM
	F7j4JhWfeRZ6lvTkXY/09Sk41pZmz2en5poY60dW2xiqfkZnHEyij2sxClao6VU8edC/uW+ES8w
	4aEOjnNSf6Tac5GslzOCj2s6arY5r+CzFGkxZwGLH2CFfAy+KZWn4XPHkxuc3fGauQoWuzlLzeB
	LIuOzV03c7svtUNUgPbxLfMd/PyZ3Xw1Tye/+3CUgFPiKZA/63TBSm2DvcooHScGC88RzuDXz1R
	VBV4EUIB2QjcRHNBwUP+XfJyguaxF9YG2lKk+Qp6tSmCCb2KBFNzXMAlA==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr448860065e9.33.1792150695791;
        Fri, 16 Oct 2026 04:38:15 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm22383595e9.2.2026.10.16.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:15 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 1/3] media: sun6i-csi: capture: Align size to 16 for NV12_16L16
Date: Fri, 16 Oct 2026 15:08:44 +0330
Message-Id: <20261016113846.8602-2-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
References: <20261016113846.8602-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_043817_435811_78B49C08 
X-CRM114-Status: GOOD (  12.07  )
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

The NV12_16L16 format is made of 16x16 tiles, so both the width and
the height must be a multiple of 16. The format preparation always
aligned dimensions to 2 pixels, whatever the pixel format, which
allowed sizes covering partial tiles.

Select the alignment from the pixel format, and do so after the
pixel format fallback so that the final format is the one used.

Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f55edfd0b174 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -41,6 +41,12 @@ void sun6i_csi_capture_format(struct sun6i_csi_device *csi_dev,
 		*field = csi_dev->capture.format.fmt.pix.field;
 }
 
+static unsigned int sun6i_csi_capture_format_align(u32 pixelformat)
+{
+	/* Returns log2 of the required alignment. */
+	return pixelformat == V4L2_PIX_FMT_NV12_16L16 ? 4 : 1;
+}
+
 /* Format */
 
 static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
@@ -665,17 +671,19 @@ static void sun6i_csi_capture_format_prepare(struct v4l2_format *format)
 {
 	struct v4l2_pix_format *pix_format = &format->fmt.pix;
 	const struct v4l2_format_info *info;
-	unsigned int width, height;
-
-	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
-			      SUN6I_CSI_CAPTURE_WIDTH_MAX, 1,
-			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
-			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, 1, 0);
+	unsigned int width, height, align;
 
 	if (!sun6i_csi_capture_format_find(pix_format->pixelformat))
 		pix_format->pixelformat =
 			sun6i_csi_capture_formats[0].pixelformat;
 
+	align = sun6i_csi_capture_format_align(pix_format->pixelformat);
+
+	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
+			      SUN6I_CSI_CAPTURE_WIDTH_MAX, align,
+			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
+			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, align, 0);
+
 	width = pix_format->width;
 	height = pix_format->height;
 
-- 
2.34.1


