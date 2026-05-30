Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD449CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=; b=HFBVRF0F574zDA
	iou9ur2yDfAkVK3IqDc89bAp0SueZLZ3oyaETqWsLCvtnnXAsZo8gEaIpmQt92zjLG8FLqy8N+xiW
	iTLgtphq8VoYr4JfkQo0o1nnbQNxFbfTQ7DCDcRsKcDNnmlMk9HYYt5ICjnoDnoEldKIh9vmYo8qf
	TacAZYF7/rmNihXHUH4vjWMC3gN8yfAEdQO3lEHiHx2fvDL4IdxKn5FIZ8GBWQBFfuprgtm8wgsuA
	5hSQnv1hktBxRkmp3iK5fvC9xjx5fZMC3HSVnXzran3Sdd4cYOSGip734LSb0/bWmTt3XU0HDajCl
	Df+CXbEQnH4PBxpt0Dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGG4-00000008bEP-3YFo;
	Sat, 30 May 2026 09:45:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFz-00000008bAl-13j7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:45:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf1cda2b17so12737725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134326; x=1780739126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=Sq+dJChtAsCDFwj68rMJi5qoV1bOd9dxPo6j6fRy7Cb1qabINNl1+wiuodTEI8oKm8
         QxTvajf0ibmFrOasLWvA8oEHZEBzaQJx/QlJsrHqpvzrPMHjOUWXZCi+lZGDPvBIqQoy
         E0l/xzy6PMc9IUQADEUHQjZpcbN89iA8MR9CE/w3FoJZK77pestbSHRXjCCt5Ub5/FXa
         v5rKoX53lYykWuBk8YiRM9etkmY62Jjc6OO3SE1Y1UXaWE+bv6wkIQFDHi8lOVgwDK3/
         nNbMvPv0rf+5mQjevdXwokjeLWU2O9RHdgvVBJhOQZzGDBGcSRoOOVINC28fo2uZUztO
         3/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134326; x=1780739126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=oCnwazxs3VHvjDQRAIA4MejE4nadGLQ4ux9OBy1wmxBIuFIUn6wFr0mgVMNFzd5ezG
         G8sLxGjVZf2a0T8S5xiuddDUrH+FvVl/pkNf/XTXEEKTwLUnjC02M/pXzqirWGxD1PW9
         31U0BZdSwtXVRlvg2HniD+c1pxSM4ryCL0yIcgCS5XiPaSvnEl/4SHhfL5UAgmhkoir3
         yVyw/N7/md/PW+WIuOlJxYgAUQ7aIbAQcb0w3Ih3TFNIrHSVka0YdM7JBh+rbhkzZ8fi
         cctFk0aE6dwu2Jn3VZIdsDz7U6rC6NaQGAHI99ZmpnmZHZSdO6+kvpRLhvMg2+krUZZd
         tQpA==
X-Forwarded-Encrypted: i=1; AFNElJ+vxShtLIVlk09V1Y76CemxvWgB8jxBukjXntKpXIwiQyTonAxI2/NABaFI2HOlckDoVsABKJtqw7DACO1+kHDp@lists.infradead.org
X-Gm-Message-State: AOJu0YzPCySS9UQ0iQbaYxLObkA67kQOmE1YHCHiSmMigr7MveO7C9Wc
	X5Tgh5NQepe6LCrPAEuAZLzmqQGEQAVWdKx2OC52Riwobi/cVT3s4Mp+
X-Gm-Gg: Acq92OFbNNf8WH13l89BWyTyKsQRDas5cyU9306LdRr8qleRUNH14l886e8ljWxizHh
	SDTtyhYk8OZ6lyU4I5RGNRoGe4fS/7mXroCwsfcvcab3uuliE4ZhYcQQm1D6iQCeo7judhli0Fe
	F+PFWGlsZ/p+ybvH0w53NkfDRRgfsumjhovQ2Rz3uqFArQS+HaT02HXhzcGXKtUl4wvx/GNrO4x
	EQfTm7EtQkfZR6Tpd9wfzuwKVNX9qyMNClP7fxNiK6dKtZh1FC7yTKmW8SjbCNIkmSWAxqOnRUG
	MMHaCK5CYIAYU+6H9rX9l5L15oKfC3urtmLy4z6709dWJQwuOM27jhVabzISaGK8M6aiS8m0R9n
	Jg3SFTUla2+z66p85YS2W62Jv8bEPm31/KiabfVdJheXfgKK/04uRmfKvCUHD4+AhA9jU3x+LdS
	nCvq0cR/tEGHR1AliSogXV/kV/T0KhbbQ=
X-Received: by 2002:a17:902:c402:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2bf2048b983mr72327425ad.8.1780134326539;
        Sat, 30 May 2026 02:45:26 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:25 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 8/8] gpu: drm: meson: Fix DMA max segment size for DMABUF imports
Date: Sat, 30 May 2026 15:12:54 +0530
Message-ID: <20260530094326.11892-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024527_296859_550C1E17 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When using hardware-accelerated video decoding via v4l2m2m-copy with mpv or
similar players, the video decoder driver (`meson_vdec`) exports contiguous
memory allocations as DMABUFs. When these buffers are subsequently imported
by the display controller driver (`meson-drm`) for rendering via the GPU or
compositor, the DMA API throws constraint validation warnings.

- Call dma_set_max_seg_size(dev, UINT_MAX) to allow large
  scatter‑gather segments.
- Ensures the DRM core and canvas allocations can handle
  full sized buffers without hitting DMA‑API warnings.

This aligns the driver with common DMA setup practices and
avoids failures on platforms with strict segment limits.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d3..8570add8b831 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -247,6 +247,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto free_drm;
 	}
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
 	if (ret)
 		goto free_drm;
-- 
2.50.1


