Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35297CFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=; b=2VaT+IZdQsnwKgtWDb468uSif/
	lBQOz3o7nmJAlXUEFujwyw4z2FvxULEwnDuRY2gXzriFapABITafRTC/ak4YqGRi8bRz1YsiQheac
	eglPnOF98NVueYT/XFon53Xny9qyhtU2hmEn4HQz6zX7nGllL0JApCIaj2rh99wpNCLkxKWbV5LMw
	1NAhpLM28fan9GUZzoKzeD/569FZTS7FU3duEPfUZ5DOR2f22cmMkv1HSjCKyK0VFG6eIZSH5cDkZ
	nLqODTbR60VuKGS3FAHNR+lTVsxYlP4zQhnM0D2anrO8s9QpaAKUG3EPcBVPdgHBAPEYJ9YpX5j7N
	4qSulAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gs8-0000000FdQE-3kEF;
	Wed, 23 Oct 2024 19:18:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZP-0000000FDeS-10wm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d41894a32so7718f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702250; x=1730307050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=YOlFOVvP9RiuYlGoEcjPUOYeaPYfYtUH1CRQP6N8Sy3mF5afRU1NftHGLMbjXydBq1
         dF1ottP4V1z1k5ph76178ui29lk9g8y4c0iohLx6odaDsrfsfehkE8nIDYWsF94LYQQN
         eG5goVlin0qZkUOKKCNfayIyjVjOtIuaRKyDcYXQLVCcYlql+x0bO3VcjfEecg+2ADzZ
         VONwqsg4LX/FmqI5VIvdUoz+l3jiJL1L8aavHqv1h4ROJe/ZZcT1WzlaN+hvtX2Kwlag
         +UWdUunTUScQHyY5Bvb4qJnr5Tedrz36dvImWUP8lN7RYsAjWC2teAF7nMnCqLcTW6h8
         B/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702250; x=1730307050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=ux7/jfWwKczqCWghXBmS2LUf1wVqQNhXis5GYHpgAnvO5YgOqpy9bwGSmoHPXUDVkw
         x96YMtMLBHrd0TrC37TnqR5gLvfznoOt4xI8AMv8AjRo4hyiwWcgW9xz/RKxW+H7Wnc7
         I8T11XfsNPy8msllCcpTiSTz1ABFWnIjh3BIeOAreuNI9m+rE2zq1+OkfDTryYU8lB3q
         76lLcr/wK+7wcK3q/ev/ZvfJw+6E6lpX8z2gxLV0M1TN2uxekrtaMsm7t+KAxNW+nC+P
         0Q15XGuAofcKz7Oxf8BWM3RhnQZGjzpcNiYzy2JFO1c2hPGtL9/oKqcMM49B4y3dGhy2
         2KuA==
X-Forwarded-Encrypted: i=1; AJvYcCXUw3iFoaKMNTa3zDsWyoij+ds18wv55q0awHbo8QRMmFGVC1hwnVwK4gxhv7QoWpseMaGeSKVJZnj9qlVtxXvm@lists.infradead.org
X-Gm-Message-State: AOJu0YwAPUShlAfxPotsXxdM6lOU0fn5bYQmuHKrGWxks1YippB+EmG7
	yTsfMTTkTK/8f42z/bwuSJNbLsKhqUrG1NQvRnuL15XmA8V9rpYVPHeTtOu2u1Q=
X-Google-Smtp-Source: AGHT+IHiThpqNk1aykeI/HCv+JYxamwU4EBdrmtK4EAyvKSVy0PZGtmgt/LXmRWsriS/yuXmN6RtIA==
X-Received: by 2002:adf:e88d:0:b0:37d:47eb:b586 with SMTP id ffacd0b85a97d-37ef12592e5mr5273994f8f.4.1729702249886;
        Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:27 +0100
Subject: [PATCH 30/37] clk: bcm: rpi: Add ISP to exported clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-30-1cc2d5594907@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095051_353617_16B02D81 
X-CRM114-Status: GOOD (  11.62  )
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

From: Dom Cobley <popcornmix@gmail.com>

The ISP clock can be controlled by the driver, so register it
with the clock subsystem.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index a18a8768feb4..6d5ee1cddded 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -118,6 +118,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_ISP_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},

-- 
2.34.1


