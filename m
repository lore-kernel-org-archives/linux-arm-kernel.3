Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C84BCFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=; b=qFPHxUAm+9JM0ubn0ojsw9pgBc
	FW91gmvHB0udyKerPf/TppOptvQ8LmlfVU+PxFGgBm6XT04mzfYzZLZa4/nwnEpXGw99YnWMAIe+1
	+4UE2ZidQwk7iH85x8NjU8PBYtIz0V0EeSWu9Wty3vgBULm7u+Qbdth+6JnB/1/BGR8KuhxkJxn42
	pfFfMwiUVLR3EUg5sb/kTVmvGZc3i1WzpVnTIPIK/iqf3Q19/5ULg2vcSzyAUSIFbwd1L/V6WbQ3d
	KWuvcYHt0J6Dec9SjM9XCyA3yG6oNL+/LfKt1cbln//d4ENpwk+RsKGvkey2cHeX0H5nYCksx3Dft
	bi3oXfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g7L-0000000FXbG-2uT6;
	Wed, 23 Oct 2024 18:29:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ5-0000000FDQn-0tbH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=; b=j4JdPNTlHvHAgsHLzVJVoyzcTR
	btksuir6EGP+J+04+/tkqK3WrZqYiyzgJUoThnDkZ1OUt7LyIXuwmN4569I0w6y5sp2QFlpApeLE7
	+FX96z3jLaMsFf5yu+Ekh8d3/H7PvXc6VOKp1MYZVf6gXVmayZHW3n0y6U9v00wPasq1GDmpcigpu
	eESqQ7K0624x1d86/yIPVtEWuHGygGH9giz6/UgKYEqbTG7jwcZq4FN472+vXZvJeVokQBAZDTDpG
	Ya0ygeWb1D8EJzlu+OjZUW8ejlCYKNUc+F8K6iKahmA/TK0x8j4sHpOFPxq9QssotEFuohRvdnK9m
	t5y0jZ5A==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYz-00000008TDc-3MPJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-431616c23b5so515695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702225; x=1730307025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
        b=H9nQn2OwyX7cCVGbceqVUksgRhPowze8MJYDgMUifZSn/SiTqyLAwgc0xyI/mp3xL/
         0IW8rVVyx6vkA90AQUChfKFCtIKFXMls8T71A0GGLrTNIYZMOFE8ajeHyoVguIWipnkP
         +uQD+QEVieP+UIFhmBl5ZV0uFVmIhE7HRBcdSsPFtPETI5AaX0Gdtx5ke7QLxSp8ZEiN
         IX4J7GbIzpO+lJBx2uQqw/6xMjMxMtvjIkA1Q1tDYt5NIcfBQpaXMoIIbicY6RSkMsZ4
         4AUye8Dvjf/NfDhGbsPGE5trT4LsDTs/MTAeeNHoAh2ouk3SU/bZd9otouFpAGm/b+jG
         6Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702225; x=1730307025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
        b=I5P3bxQoHYgNG8Wg/bkKEkUhgWrPPOr4FvKC/bahhSWfG7Rpak+sNsuBAijWwR5uck
         Uw9hoWx/28i404jPKJmlRlFmLIoB7ziZEKweFHoC9spWaIWrMfDX2i8tCy/xG4FetkHM
         PzbHjAgqtpAcgSGY9Q3vSh3X0OqpNSVYZRmjXC9po9xel3I/NhmDT2TwImC0DmnVMI3B
         HE1Es4jukWzavRnXqoJFrT4QRsZRUiLxx7/lo4vL42A62FhVAyLfbNpAjDzlHMH2JM77
         OaZv4VvbBe2+F+Rf/ExaX5xcz9RUOcJnV3eH2pRrspkOlLHSMMlvB1NYQEWmiifWUVny
         l9CA==
X-Forwarded-Encrypted: i=1; AJvYcCX0M/tpnu1r8DwZ8Gt5IQl5x25msNqs0900GuuQCo/37Y0LsssCxsYHWOueS0YaNf7KtFmmHiWQIdiAS592IgVV@lists.infradead.org
X-Gm-Message-State: AOJu0YyVbumyKlA44p2c3rMBngckYXKVIQT6+umzKLWVNDxxYhp6mQEK
	qVAkl2iSby3pO4euPSycQImb8U5b47wDH2y6oIqmGpN//ge5OAiM7H8ZfV3Gy0s=
X-Google-Smtp-Source: AGHT+IGF/wmrQgX6tkn2u2UHI/gHpOuI8sr3sYRtr4SIzuUG0YYH6LOTQMbTm4H44/RrLqlF3LH1FA==
X-Received: by 2002:a7b:c455:0:b0:431:7c25:8600 with SMTP id 5b1f17b1804b1-4317c2586e2mr46271995e9.2.1729702224583;
        Wed, 23 Oct 2024 09:50:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:14 +0100
Subject: [PATCH 17/37] drm/vc4: txp: Add horizontal and vertical size
 offset toggle bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-17-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_175026_086582_E218F2BE 
X-CRM114-Status: GOOD (  15.54  )
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

The new writeback controllers that can be found on the BCM2712 require
to have their horizontal and vertical size reduced by one.

Let's tie that behaviour to the compatible so we can support both the
new and old controllers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 27deb4cde02d..984fddae0048 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -539,6 +539,7 @@ struct vc4_crtc_data {
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
 	unsigned int has_byte_enable:1;
+	unsigned int size_minus_one:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index eaf30b2cfb5b..d2ee872e9c0b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -291,6 +291,8 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
+	unsigned int hdisplay;
+	unsigned int vdisplay;
 	u32 ctrl;
 	int idx;
 	int i;
@@ -330,9 +332,17 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
+
+	hdisplay = mode->hdisplay ?: 1;
+	vdisplay = mode->vdisplay ?: 1;
+	if (txp_data->size_minus_one) {
+		hdisplay -= 1;
+		vdisplay -= 1;
+	}
+
 	TXP_WRITE(TXP_DIM,
-		  VC4_SET_FIELD(mode->hdisplay, TXP_WIDTH) |
-		  VC4_SET_FIELD(mode->vdisplay, TXP_HEIGHT));
+		  VC4_SET_FIELD(hdisplay, TXP_WIDTH) |
+		  VC4_SET_FIELD(vdisplay, TXP_HEIGHT));
 
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 

-- 
2.34.1


