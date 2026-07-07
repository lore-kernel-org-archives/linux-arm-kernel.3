Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2111AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fABNw2w97X9GRxh8PzbMHvVe6Mugz+Bwu+oLmBySnb4=; b=DDnblnVP3vhzR0RVxClMaSCGMS
	wBCuKYmoG78CUuq4jjokhKe5CcmsC3xPc2nX9cP/gKBuJAI+zy1r3IrSsg1qYD79HzNmFP4ALQ7ua
	Q6vChZEoq6RxwfX+fDZJIopHgC2cwBXNOBK01byaJPI2fhf9pFQSNf7IKSkG7SEkjiJQQdMmyYgAS
	73/fCFT4L4NDJaGofGgnrn+m4u/u6YIGiKzTBCdP1qjp43NDkQP+UPZIDm1yoOS+GqVuPzJzcL/9c
	XKUuX2qaS9pKHMAE6k3vCYI1PPnwcI/BWHQzt9VqBDvJxqTH/sO65gMmAdTAcYL4HWHtwm/PsF8qz
	oF/lSZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7nv-0000000FKG6-1upK;
	Tue, 07 Jul 2026 15:33:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7nr-0000000FKDy-3Dv3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:33:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so31957605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783438422; x=1784043222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fABNw2w97X9GRxh8PzbMHvVe6Mugz+Bwu+oLmBySnb4=;
        b=o6VmU3ySw90CewjA90XCN1qiE9jAIvbaGhaCIMLwKL7W8081uvvusr+PSt7bWTU14h
         9HOcl2R4PUHxaDmoBevo+FFTwdsEc/md9kRQLN4tj/ZgaQShnCQY71oEZFPAZp8ZPVDX
         BaMtT/WHz7Eukp/T//gNQzgF6Q8z5CTLDD4W8lcwmFi54svcu9vMtt376FBQUNOoyKAI
         +ZzR64AMEfASFEYuAudzndOJzGma9hC7VQuR/lBE4z1LyFl6MPSeA0Nb/bvkpImHE3J1
         92Q83JsSNo9SYrK+HjQAtpU6guOPxJ8H9Xnn/LKz88oSWxP+K5K06DNTA0+VN3T9nU8x
         Lhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438422; x=1784043222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fABNw2w97X9GRxh8PzbMHvVe6Mugz+Bwu+oLmBySnb4=;
        b=drgkAvDksWqPeEbDbqyGNyUNaEPcjK300xgrS2QU3mXWaKydhioq1yVGhOvBnP3m1X
         qdX8a4UhCd6Lox6ZRs/60VNFUkF0CCaXEbTmAknPkc/e0nWlrnQNyG4HVTqDGjkm6WwB
         eSNBURGwQoYE62guf7HhOjwI7L4aE/+TO6lrN7sPw1cOlQewVZ53no1i/6SmrQiMoELL
         lUcx2bepC3K7U73VccEVKcTUHXdSDSYuCJA+eiB+KARWC78HY7Hiri4SUonXsbwANcgh
         0YnSmUqZW3hsPEoPykNTTycT2zrVGdme0Z/7ml/ocSMvExrlTLd3FzIeOgcz1K0RLUj+
         Jdig==
X-Forwarded-Encrypted: i=1; AHgh+RqZEqFEoX/SYXaoc9rTBLlWzyBvaWgn6pFBp2qQYoaAzmbesP1IB0fFlg6i2cmaUZVzByZEL5nBJ6B9N/Zx6+re@lists.infradead.org
X-Gm-Message-State: AOJu0YwL9TEfZOPH6ce6c1sAV49o2lDhlSZiP4PTpqzf7f06yHprN9MH
	YXRq8rF7cqXpEQuczRGCosX1snV6GRPcM9/qEZBJUmR/i/TxHC6y+/S9
X-Gm-Gg: AfdE7cmr6gEXv5lfMGPPXzpTRIij86apj+xhVvSKT1OoHFzVDalhwP6O0aOLq5pj2KZ
	MHzIcc9hauWl1n7Ap2OpqR3pB9SxBoPnVdkROhrY7+am9ljKsmTs2KyuqG7Fbwg0zE1YpqP2SZB
	UYqhrxMWSVB1g5K9JbYFO3qQtMZ5Gu5vmso5vgm2W8s4lLAnBmfLJAFkiRQmRxK+ymezuLyQLBs
	f+Q3Kc6M2/poYap/Lv1x7CdnrCWReL9+ZOCOv3ReeJ352K/ckQZ43jXDhwcR5tAlFyHZ9UHE4dy
	LGs+Z/5EaNlFbrA6jbif73LuT1hcyOTRNvKwZN+gq26DEg45z4NMTyOCIj53UchogTWdvOHxfIP
	lmOEv5svvgxCifl16+GBXL7r3NkQPNXSXKYCZRfDB6NJyWEFhIeSGo1BZ9mpDvpXoiPb2X31Fyv
	OK6U7QlPojGoU1nA+q6UMC2kKzLxUHI8w=
X-Received: by 2002:a05:600c:154e:b0:493:d216:ed96 with SMTP id 5b1f17b1804b1-493df0b6a8emr63241635e9.9.1783438421411;
        Tue, 07 Jul 2026 08:33:41 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm100622385e9.13.2026.07.07.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:33:40 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 07 Jul 2026 17:33:26 +0200
Subject: [PATCH 1/2] drm/xlnx/zynqmp_dpsub: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xlnx-simple-v1-1-df50c6665b02@gmail.com>
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
X-CRM114-CacheID: sfid-20260707_083343_945353_9963490D 
X-CRM114-Status: GOOD (  15.95  )
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

Simple KMS helper are deprecated since they only add an intermediate
layer between drivers and the atomic modesetting.
This patch removes the drm_simple_encoder_init() helper usage in the
xlnx zynqmp_dpsub driver by open coding it and using the encoder atomic
helpers directly. This is a step to eventually get rid of this simple
KMS helper, once all drivers that use it have been converted.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index d5f9224505655..698ac692abce9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -30,7 +30,6 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/clk.h>
@@ -417,6 +416,10 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 	.minor				= 0,
 };
 
+static const struct drm_encoder_funcs zynqmp_dpsub_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_encoder *encoder = &dpsub->drm->encoder;
@@ -436,7 +439,8 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	/* Create the encoder and attach the bridge. */
 	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
-	drm_simple_encoder_init(&dpsub->drm->dev, encoder, DRM_MODE_ENCODER_NONE);
+	drm_encoder_init(&dpsub->drm->dev, encoder, &zynqmp_dpsub_encoder_funcs,
+			 DRM_MODE_ENCODER_NONE, NULL);
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);

-- 
2.51.2


