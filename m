Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7221ECFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1187eCau7YQm+fLqvdnzaKIPua1eXW5DaRGJ7Ln3ZlQ=; b=JmkfDBcnOkulb0JXkgk04OBQCS
	stqL/+gwyKHhV95GzKa16HafjIJjDTLjtWTf4uMFsiFLfVTYOr8/y1lcu8h+V5VN5Okiw996zCCaN
	zQIRYlGZR4sZINej8EanUPSBiRdk3t3zpX6PSLaIR7K1K04Sx9rI7moct5rWIUR84cb2vRieFkkLm
	HSkN7mKEmKHlQMzTqUFoaI9OVRdyDXQ7YlVYp+h6tMiMoR5rzuecFaeZ+DeJnbffs0b9HB8Rjv8uC
	gtj20tYNoGiPVDewCzquRuAmdZTw6Jimk/gASW9DeUIDVyL7wiM3gLjXaPKn+9vMu6dtoctrnWBMh
	uYrpercg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gs3-0000000FdLU-2p8V;
	Wed, 23 Oct 2024 19:18:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZO-0000000FDdt-0iay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso62470845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702249; x=1730307049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1187eCau7YQm+fLqvdnzaKIPua1eXW5DaRGJ7Ln3ZlQ=;
        b=B0+K8QrzwxEnpaPI67nKg8EMZ/WDj1yHCnsNMa+tzQvscsQhkUAoliMLDg8edlftsH
         4d2ATsLtKHQvvkIrli1Pz7GRe3xoJrMe3VCeI3aJt7pq3uLpM6b9gCa7/ouooOhxfnhw
         L8IgmJbYdCVPre0DW9YQlNlXKDzI0H+jMlW2ophaeoLjjqSGMkIitS6Xar0n0oaIiynu
         2R06Gi8PDkM8FMETU3tHwmBTWQ0dxt/N0EivS3HmBNgfF3tYwCmh5F+nJEJ+Ywfsj4iA
         taGc2vwRBHCV0lawDrU01A9o1gmYeuK+6TfOJhfFJQwIrD+2/ByuNhpja8LmJ8yZ5+mX
         dkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702249; x=1730307049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1187eCau7YQm+fLqvdnzaKIPua1eXW5DaRGJ7Ln3ZlQ=;
        b=dBfPZ1Z47V44B/l5gd4B9mu2xbLG/MooOs3LiC6eVL5AKMBcV9vKHD49hTQpLkOQ0a
         zhKiJsrv4pScRYCUz3QsTTAUuBUuS4TlUEDBi2jGoH1xrDm3QNu78NWUV7lpQlCLM4qL
         MZ5oIrNG/SyrQABMiq6hUE/sJoFJTFARVSEBLyLrxKUfe4NI/A+QjrIlYLlt0hGIu2u4
         eliyO//CwhFkmN2uOAwVpUmQdKY5bQL8KXSONqjqZFQgIZFZ0Hoa+to3nYkzA4JdTXF3
         dZqYoZa9uPdtBBJI96vEeg3rNzEGCaG/8cnMBcjr/tyxxbiZBFxM6hpj38yra2qcUo2f
         McrA==
X-Forwarded-Encrypted: i=1; AJvYcCWFUpZqLjNVkZR45dc03tGeFAY5qw8q2GdSMJV4uhLP81ZiemZOs/i5ej8KW3t5oaoz4+WsEkKLPIpGAS1isluR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyy/R9cAWXTZOXFrcg4hD6XccNFZcc4oZixF7HWr8t2PfgMV9e
	J/7SYr/0k/yorq+LaVRQWZiFSwvqFGnifHKi3e9EmMRc+T/KsktdSkjI4O2wa7E=
X-Google-Smtp-Source: AGHT+IGnOy6934iu4X4nAJLDq42XcldaiFx0K1e85HTnwt0PFdy3j0mfVRmbr6x1y+nTvJQlVW7Bhg==
X-Received: by 2002:a05:600c:46d0:b0:431:4e25:fe42 with SMTP id 5b1f17b1804b1-4318419f2dcmr33339855e9.32.1729702248667;
        Wed, 23 Oct 2024 09:50:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:48 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:26 +0100
Subject: [PATCH 29/37] drm/vc4: Drop planes that are completely off-screen
 or 0 crtc size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-29-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095050_278102_53196699 
X-CRM114-Status: GOOD (  16.05  )
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

It is permitted for a plane to be configured such that none
of it is on-screen via either negative dest rectangle X,Y
offset, or an offset that is greater than the crtc dimensions.

These planes were resized via drm_atomic_helper_check_plane_state
such that the source rectangle had a zero width or height, but
they still created a dlist entry even though they contributed
no pixels. In the case of vc6_plane_mode_set, that it could result
in negative values being written into registers, which caused
incorrect behaviour.

Drop planes that result in a source width or height of 0 pixels
or an on-screen size of 0 pixels to avoid the incorrect rendering.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index c084967d3527..94737c587f20 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1230,6 +1230,13 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -1753,6 +1760,15 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen.
+		 * 0 destination size is a redundant plane.
+		 */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -2135,6 +2151,10 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h)
+		return 0;
+
 	ret = vc4_plane_allocate_lbm(new_plane_state);
 	if (ret)
 		return ret;

-- 
2.34.1


