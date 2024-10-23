Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C287DCFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=; b=zFCtUWyJcEct1fBQZJW5pCXSNm
	6kZEgHQOVG3BF86AXmF7LxosuHtwIw7mWXEpr1SZYGFDu5c8C7TPXMaSLqmbLCG+w0WiAQJMu6urS
	SbXz/DpzjGpP0gThgG0C/ZKakAtwjbuVUuzA9NxhQilFWaLfqkzDzbKAcFLl62YjRJP+syXDCoSLR
	5qsnflpMMtjB/X7PisvovyEWwnae7bDxR7V8CRqPW3fhNwFitcJ4bUsOvfvFwyTRTln8wIYEMY+7/
	+h3gyjfQ/x1PjupCJTeCFsfmaR2Vruv+MsQbEnaQ/3CvOne+JQXYpeIPWCENAA0Je+JyW475VSuPt
	BjQoYqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gru-0000000FdEg-0Bex;
	Wed, 23 Oct 2024 19:18:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ1-0000000FDPS-37jB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=; b=FEFH4H2xebW8ccRrVXN1AeSzSR
	brTdufHd7dD8L7Qqzvcw8yTCR9KOCGoIrN3cw3GQ6JAjAdRbx4/6lQ+zUX6N6U+eAB5GmRItv6kUY
	2wSZjWqPN0Eh3AEb77zkGrcIyXhxror4RLw2DGnNu2QHXNkYkd65sr9dwQ05lYi1/taQaYg83gc6Z
	mN93c6jpjxfB9/VIjRTKi9zZ6gDPVL2m+l/aAkd+IPEBdIAi0mhO/sT7uYM9sZGq1P1ubeYXFfmUZ
	jzW3LOa3RXpghM30b2I7oMXxe/XBvvrmW8+xcf4ZdCDbJADQ7n+GfheaEVrMDDP/pPeCMwM1vlv6E
	3hV0slQg==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYy-00000008TDF-3ud0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43169902057so46654415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702224; x=1730307024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
        b=Mxd939k6PqJA1M0qBndT8M90jh1Nwfy6Lv+F4lsXSYjNUAEOgAG2rCGMxhrux1a5JP
         x08S9eC77pKo03vNBwzExMD8Mr2mqRDn4t3H7wBl+Kj/WhIK1vMA9a27vq0uQ+l0uOyN
         3b6Y6DaczCD8E3d974Tz0G8ZuFrmyBluu0zrSosiDadH5xicO3PiEjVBxktLCMGCOZ0C
         EVtg+g/0ghlQwb8HJlF4Hq353cXxURDCZ6+ag7oxTqkoVOtIUIT9asCfE7m3gKfsPUgg
         6yYKwHhwOtJZwUqQrDdFh50j2raaGvtHTVCmJmdNuLfqA2tB3uZZQINvOUj2DAAJMeDz
         HfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702224; x=1730307024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
        b=vq+mXCtIpSWg7upqI/yk2OqnOvlan7DbdACf0SrQGs5slqD1TNpA//OWPLVn7pUtMs
         U5VlD5oKZ52X2kPZVwxnIQflSbuXHlsm3P12o5N0ODTVBXkympBJlQFg2CyTixNa3k8p
         jArDWseNuBuBAAdPYNnZlUCSNhFXbN3SJNijozCGus8oAguKkPJyAyj9uG6ZaXOw9nJF
         +YayycodqjhVX6Quc4Sya5DwfQw0RGDuytXgh4DNdLoJBxMZ0Ux4JlLmFRSHMtmnHfKB
         QYQ4mwDZrZRV4Lfz4AqqORH+aqJZH/wEFsgZxSXGcLudQTb2Wtt9rrli8ZVTI128ppz+
         q3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMFj/tpb7G6E3ufRBO00qNTaxDMtymCucxkxNPQ50zFgCS3UgIe3io4zTLixq1SDLtpLIO+WrhBMSw1oK+LU1Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yws99pNcJxcrpPJTaTa7hRdfhuqZl9YnUw4c+86u1XxlMmFlzxl
	MwsDmtaoS2VxC2tSPQcZoFTWVrj/w375X4KViHKOVqGA00QW45DLu+hMV1H9POg=
X-Google-Smtp-Source: AGHT+IFQpdDu/f44Xgfd+NG6WrKmi4zfDWeKblhsLQsMneFB4Oq57+PB7CTMU6NnjVTgfyxomcFzlA==
X-Received: by 2002:a05:600c:3b16:b0:431:5ed4:7e7d with SMTP id 5b1f17b1804b1-4318415b482mr26031435e9.18.1729702223590;
        Wed, 23 Oct 2024 09:50:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:23 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:13 +0100
Subject: [PATCH 16/37] drm/vc4: txp: Add byte enable toggle bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-16-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_175025_120012_3C4F7573 
X-CRM114-Status: GOOD (  16.01  )
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

From: Maxime Ripard <mripard@kernel.org>

The MOPLET doesn't have the BYTE_ENABLE field to set, but the TXP and
MOP do, so let's add a boolean to control whether or not we need to set
it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e08c90245f94..27deb4cde02d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	unsigned int has_byte_enable:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 6fe378b454ca..eaf30b2cfb5b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -287,6 +287,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
 										    conn);
 	struct vc4_txp *txp = connector_to_vc4_txp(conn);
+	const struct vc4_txp_data *txp_data = txp->data;
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
@@ -309,9 +310,11 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		return;
 
 	ctrl = TXP_GO | TXP_EI |
-	       VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE) |
 	       VC4_SET_FIELD(txp_fmts[i], TXP_FORMAT);
 
+	if (txp_data->has_byte_enable)
+		ctrl |= VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+
 	if (fb->format->has_alpha)
 		ctrl |= TXP_ALPHA_ENABLE;
 	else
@@ -492,6 +495,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.has_byte_enable = true,
 };
 
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)

-- 
2.34.1


