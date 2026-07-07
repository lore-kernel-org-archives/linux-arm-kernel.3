Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07C0C44502
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlDWtQ71cy4M6Iwx6C9VpFd4pqPTgh6eJknwRkh5wwk=; b=C35XuAAvd5JgcUcq/HToLofum5
	n4Wv3of9jPmvBbP+XsXt6uO5oxZPVnbS78kfV9UBonbZXm7ZFKtVIoL+tVLf51YQeIW554mhE2kXx
	KshV1MI+cASDi8u6A0/3ipxdSE3F4od+hrpqwIzklG7NOTx76+t3XMevjuSNI7/WVW1hIOVX8Adw8
	2wHDdxb8Z4KGwWpQIOWQ6nYIJABoF81o+cmWP6lBErZ1rAdyIGRlFKmPJ1iUSq67v8UFbjFHVfmPW
	Vhmkm2UvL0wtfZw7hIOmXgKaQKwcir3CLUFgLHdJDdWK6UX/i5jy1aGT9uQFsGjUlhfzYl/zRGURg
	KTAuUPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7o0-0000000FKHZ-4ASN;
	Tue, 07 Jul 2026 15:33:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7nu-0000000FKEj-2bc1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:33:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso17410775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783438425; x=1784043225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlDWtQ71cy4M6Iwx6C9VpFd4pqPTgh6eJknwRkh5wwk=;
        b=Pnlt3OQwtBnfZdf/C6/UN4zQl8AQOP4w10PQYqOujfkbC66c7aOffQEvKBR2b1nm4S
         AUFJUdIg21eycD+cEOw9Na3+jw/FpyuQz6UgC9VF9rslZgC6OsOUU+eDjZHN/xBIQwNI
         Jt5D/jMs8zFAGT4uDak1l5jVwLnJ2iuEw0LD0rItYtb2NcwXFz5VcL+LbP4RgEsSDens
         1zUTm1HMcOVmtyFkeLgJaeYxeGuUMUjs+WYoIghLdLtU0ajLrqOl3QKZfV4VHVzXapcc
         hXv9faqp4Pe3+KAznfe7Bc+q/kdhPFMX18OkbDZFsHyMbnHXtxGvThDZWlcoPgUsN72Z
         mfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438425; x=1784043225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DlDWtQ71cy4M6Iwx6C9VpFd4pqPTgh6eJknwRkh5wwk=;
        b=eXTgwGAOzWUjyoJPEnXefN9G4/9Ck5H1A12p3i/x5SOOXtZt0cXiKWLFqz/FmDqxmN
         LBdVcM2blsNj9IylZ2zoKy//TFQnFcEqAdLXdpFV3deFveXhTWT6IiJMeBiCQEoR/Z19
         v+5kSnENqUPGLtZnAeBT6OTSZ0qyCmNzrD+FjNAsRHYt+/Ck1jxSahiFdOT468CabHOc
         uBgJ6MzstrM7Gd5luFzmap1YGYREzt1mkbjoJ1Untm42s/UI6dNo+675QT7rvjj/xHkV
         mF+BauLj0O6yMXV7vcMmPMqAwQkKCWH57CHpGfzGdoe5dKVYN8f8ea88D6JCY052/8Py
         7Zlg==
X-Forwarded-Encrypted: i=1; AHgh+RrsoN7Bse95SpZ+ZyZc9Mtu6UZcQmBrSrNdHLHXrr92txACOXBvD7x9VS86kr1mqRCHVuz7Ax94P2UINGLyOn8H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95utQ8CVDHAa1a7wRz/+fiVhjo6dcjNF9moWXwkBhrjU7GYuA
	3Um0DEaL22yjcFmmaUQ//gv2HlyFiQfwwJkD3QKmnH+jIMhwU8JkhP31
X-Gm-Gg: AfdE7cljJ6KVdxN7/bYFEmIRdS7OcmOc4/8uQGkWMVCuiY+ILg6PxayPFo+jzMYOYvi
	X4aHtUj2+o4aYBfAw5Lx2qW/BlpEut01Cb2Z5zgKnfDWxsydlISL2ZIFLxIaXN8It1DiOujdCG8
	XABOYeJu8fxivz1VM2lT5LmuisglEIPRkcPaHU67gF+NdiszLrKYpc4aNe5JLCFyXz9k66O905F
	68dP2mnP1/7i/7Pk0EQJNBTUsCfBMkHyhSTbaXkEukEXsh66FxLziEBBtljPHaTdhWwqrx0yCy1
	G5w2kTVhkBn3nGqOn/IycRQvbo3fdlLVlcvjI+cuQnmc7qAvMumnOZ+xr0DLY11iJoQYmI2uhdA
	P0ISvwuLkecnFtrP4FxZj04mbayULPpwHbTU6uGl8HcKLgRhLBxzgNFG9U4RCmAV/TxYQZNhZSR
	q7w9abUSNuUU5x/I0nPsPC
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id 5b1f17b1804b1-493df0929f3mr4664575e9.26.1783438424204;
        Tue, 07 Jul 2026 08:33:44 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm100622385e9.13.2026.07.07.08.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:33:43 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 07 Jul 2026 17:33:27 +0200
Subject: [PATCH 2/2] drm/xlnx/zynqmp_dpsub: check return value on
 drm_encoder_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xlnx-simple-v1-2-df50c6665b02@gmail.com>
References: <20260707-xlnx-simple-v1-0-df50c6665b02@gmail.com>
In-Reply-To: <20260707-xlnx-simple-v1-0-df50c6665b02@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_083346_703326_EB3D06F9 
X-CRM114-Status: GOOD (  13.88  )
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

A call to drm_encoder_init() can fail. If the error code is not checked
this may lead to drm_encoder_cleanup() being called on an uninitialized
drm_encoder.
This patch addresses this by adding the proper return value check to the
drm_encoder_init() function call.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 698ac692abce..1d194c2824e3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -439,8 +439,13 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	/* Create the encoder and attach the bridge. */
 	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
-	drm_encoder_init(&dpsub->drm->dev, encoder, &zynqmp_dpsub_encoder_funcs,
-			 DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init(&dpsub->drm->dev, encoder,
+			       &zynqmp_dpsub_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		dev_err(dpsub->dev, "failed to initialize encoder\n");
+		return ret;
+	}
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);

-- 
2.51.2


