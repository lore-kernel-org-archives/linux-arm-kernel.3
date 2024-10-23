Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFAECFA461
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXVu+XPK1twrhAqeJinZn0FZ1mNK/jEIbakCvmjUtPs=; b=qvGLH5+SXZuBYe4p76PMf/eaq0
	m4ZuMnSmbMzHz3MMmODJlxzQzEPF7gpuqN6sFLrtdKW67OreIKZlY28spdU5PxqPEddQSWNbIF/a/
	HYn4rqT0LLRqCdvXiIMXWEX7XUDWt60IuEM0qkoqz27yxDGmD4QzaSxKVHySXT7UkjJInvRHciQ0j
	npnNB1qa3gPKLV3ELnymdNYYW9gmJLsrQkel44rjm78w7qh7+WPxT/XTgsE6DiOsF1MaMyuHNogTh
	gYiHXGCUluguG9j6zgHNoC+T2iO4AwitUTsOi/jZGIBHASvOZ4OeVkUNGT2ukmWdKOZVhp4jeTy0g
	NSa8RkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gs2-0000000FdKO-0l7u;
	Wed, 23 Oct 2024 19:18:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZN-0000000FDdY-3UxE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so69621855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702248; x=1730307048; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXVu+XPK1twrhAqeJinZn0FZ1mNK/jEIbakCvmjUtPs=;
        b=SVmIKWX6JHUFb22bjPLDPZcY6GIaegEArV1rPG6JzeTGiCtGNHmjhuX1rxn6cZtsVH
         3r1uEmVAWfsBvbTE9yln5XeoSgr17ijLUVfNkGfDjtdw/OCe9PvIDBUfcZX4DQMVCpx8
         FGG94SQtZGKE5Lp6d2+nmH+0Or0oKrcmwQkw0zISGpwD4FrCmdnLcogNWiSwFPbJ9Diq
         CQp/ll05asH2kmA9PDgwP8DtsCWKYoD1KkFHyTaXeqKfRxEFgrC/ohc103rCbXp2Hm+k
         FACNvd0lcdAu/KMGyNSf6wKTta0MpIiNNQ1Pwpl+VdhoTZTXJrp0n/cV+t67VyFiSBCP
         jMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702248; x=1730307048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXVu+XPK1twrhAqeJinZn0FZ1mNK/jEIbakCvmjUtPs=;
        b=tIM8FxPKYE+7Dk8TDid4LwDg6eNcr0WdOg+4ABirw+Tq+zXEiz+TJfCJ+WE9sfIvil
         d8D8HdIyoPimWm8cJ67Dlgwst2wwh5ynYpUxJV2pv7JGVGS0KINX0NSW+5omc/cNBbcA
         UQy1gygwldPyUXMeE2m7W2JXfSdX4bmMmGjRG4rnbUMXoQUcAfEh9L1sKPrb2KvMDPC2
         ctQOZjLy9EJrS1XdWuTT+zprWsclWN2E7adaom7H2SPoiI6PT66j8G+etpiUivSNiRGN
         jua9LQ13Yp5BZ11tdV5SyhS5jDJ3/bw10jaVlEttT8pGuFuzusE5JOnBqk7GV4/xFpcc
         bz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVB857HMnF62H36P7XkcwAVsQ6QuRhEz81RZiMPCJajS7yjpV3jEhuLgn1uryflb/8cBkrfeGZaWD46QRh+w11P@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg3s+Lb489cfcSnJn9ghvOv816dpwB9RLk0Tp/hgx4TQ6+XfKK
	lw1NYySfKNxqHPxlxNoduZ45ooigRqV3/2aaFlNAWFvbBeVLPJuaajHJaH4tlF0=
X-Google-Smtp-Source: AGHT+IE4mgCaYm2elKT76LlNq3zUCFQBwxYPgla+kkQUxdQtty9ocFGx1hYzfLUy3hw38CapCGa/1g==
X-Received: by 2002:a05:600c:4ecd:b0:431:612f:189b with SMTP id 5b1f17b1804b1-431841fdademr30938035e9.12.1729702247813;
        Wed, 23 Oct 2024 09:50:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:25 +0100
Subject: [PATCH 28/37] drm/vc4: Enable bg_fill if there are no planes
 enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-28-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095049_882841_13949846 
X-CRM114-Status: GOOD (  14.72  )
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

The default was to have enable_bg_fill disabled and the first
plane set it if it wasn't opaque and covering the whole screen.
However that meant that if no planes were enabled, then the
background fill wasn't enabled, and would give a striped
output from the uninitialised output buffer.

Initialise it to enabled to avoid this.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index f15aba4b81d7..5d40bbcb3b54 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -936,7 +936,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
-	bool enable_bg_fill = false;
+	bool enable_bg_fill = true;
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
 	unsigned int zpos = 0;

-- 
2.34.1


