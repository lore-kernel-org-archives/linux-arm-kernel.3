Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD30CFA461
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=; b=AbknecjiucKbAYOKJyKQVHXlTj
	dD6THm0O1SZPu7i/glyWe01YDbngUBMJbyHlJjQIgnuqdBP9YPU+qngFJexxubtUNZtuGtFFJE3dl
	CsPm5dwloBy+FNID8Y7oyKb79cEqWtIMh28wViirSNYxUYGttloEw4XgO55wVHkIbf81o/lzhRGUe
	bTIZA1EP+lmgeAh3Z70mMpIaNYEaGj531l+2nxD1L6uZ+PaeWdA7nuflgoTa7kSBjCtwFNRr67bcD
	2E6bx3wu6HQIHqCitcJ5zTFbNn9++Whjm6FTVRfTUxzZZwHVMi/2F4bfy7f5cuCzlkPN7AiSQru8l
	mRvqilxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gru-0000000FdEo-2tYC;
	Wed, 23 Oct 2024 19:18:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ8-0000000FDTI-1OYw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=; b=avIm6ubxKjf54JUS5Q84Ycv77Y
	xWi8mXFZCyLa967Ok1mCTnemuui72UIsHI8uVMgsLpE/4OFNAvcHT5UwN2ZxUrpDMMAtOjViqMraL
	3/7QsmCc5WjJz58hA+5k1VXz07m15jdDGUGkeXNfUL+Z4L6IjMND7qylHFuwiq4cy+/v0d9p7gNCb
	dTP/0ffyie8fLAZG82RKWD24kKG0NmxY9Bj+rXS8QNpg92BQN0kjB5qRVIT2NaYMCHchOf55A9iHC
	pJu50Z1GNEh/KmrwDr4EpiAU95qvy9wssLKXtLpO82tO+IHcH/BWF9s35RVwgBg9wGM8X6qvHe/VP
	SiFp+Juw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ4-00000008TGG-03XZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so40948355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702227; x=1730307027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
        b=N5AVjVonOR2hB8AroMrTsyl7VlhA42bulqRBAvletl2g74cz5o8qiCdds0C2jFMhZ9
         ST3+BiYZEfNjSBPofcqXA7bdickft/b8CZkEdt++M+oOdcbR+fupO0USElqdCmXFh4VL
         mrjMVFdGsQKBQxgRdYks7x8yFIJReeXGhQ99S0x3k3vltvuPDHdNzI2hifnYzihANWx4
         q44HA3+KD6gByn0GbCWb658k53KGE15FiROlKBJahDkGEWPe2S8kytNqKcAUmboe0JNM
         bGyU1JBuGbdWIgE2nxCMXqhVf2Ae1p2RVSco5xcwdLzWPOiJwdfYzQRc+FBl758kY1hG
         3nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702227; x=1730307027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
        b=dfFGJoFr2zht7Uf532pYwKDRnSPjzC5qJAxSsPOI26sHCSfhneW+vOkEogGRNSWNf2
         80QFvikInjA5Jk3H1/sOslFbrtAwxerntwnH4TwNrgxbwHHOmzDLQpjnvX0W87qBz1Mi
         q37Cz6HUgxuKfgHU/lAlDpDkB67QMPkfkH6ao/faHBlQ0hMiL5anMO+MIgScESoqRSEE
         TY5slMC6anhkAkwy6IO3Xn9xamWFJsvrttNJfLhxdPi8X3JlWf3FC7pAJSC9u+F2oPCF
         41VbDYETL9DsZkCDbJDEJM9cr+SJp4XfXomS6i8McW32E5IuzGBK2S2jfF/oVsnJrD/V
         mTsA==
X-Forwarded-Encrypted: i=1; AJvYcCXKB3oK5SUQlHBAp0tdImVsx5jyj4ubJxVBe/rqaRc33KhznZ/lMy6VCQzTjrn9/M9UV+2798e9U8pb+xYNt0kJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1zfd9TOmCU24A0HCRBo2dJIbG1zp4+Wzqx+Ke86l0CFrF4XlX
	/WwfPM6J/i7DLfy5QOM4N6XOCnIeecdz13h4RHYXeDWpBeGgswCM3AnQezc1tMo=
X-Google-Smtp-Source: AGHT+IFv4syC1FFikZ8gruyh5lMTHnF9kDQfrU5MuNhEjDl7pLUYMo9HHAxXod5ZqqEK/UZfyyrovw==
X-Received: by 2002:a05:600c:4ecb:b0:42f:8287:c24d with SMTP id 5b1f17b1804b1-4318415cfccmr28210645e9.21.1729702227166;
        Wed, 23 Oct 2024 09:50:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:26 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:16 +0100
Subject: [PATCH 19/37] drm/vc4: txp: Move the encoder type in the variant
 structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-19-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_175030_175620_56B206D8 
X-CRM114-Status: GOOD (  14.70  )
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

We'll have multiple TXP instances in the BCM2712, so we can't use a
single encoder type anymore. Let's tie the encoder type to the
compatible.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 34e72e711a17..70b7a771ff47 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	enum vc4_encoder_type encoder_type;
 	unsigned int high_addr_ptr_reg;
 	unsigned int has_byte_enable:1;
 	unsigned int size_minus_one:1;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c2726ccde1cf..ecd2fc5edf45 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -515,6 +515,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP,
 	.has_byte_enable = true,
 };
 
@@ -558,7 +559,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	vc4_encoder = &txp->encoder;
-	txp->encoder.type = VC4_ENCODER_TYPE_TXP;
+	txp->encoder.type = txp_data->encoder_type;
 
 	encoder = &vc4_encoder->base;
 	encoder->possible_crtcs = drm_crtc_mask(&vc4_crtc->base);

-- 
2.34.1


