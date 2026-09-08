Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71888C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=; b=Oj2yeTNgqVBL55HvcQI6BV/248
	ytmixG1RTN6TXkUf+8KVEmi/mT2yLpRUqwc2Opz2bMrsOyRxFHiT+mZ2oSxFetL6mQ1SYB7ADR+a3
	L/Lr1A4x8UlTL2zxQLkDJWarDs+gERtY9xrGac3SFlHALLJdtOHAVmB2YfPoJcCsFV09Djn2C2Azl
	I8s8OUq/oIa4kZ09/XeN/zNQMYkxvHOyxOKyZIpA0jXgsjfGedMIhSvLeu9HpPPgXdjCa5katyY69
	b93279k2TtBrCMWhjo8/pIut4h26UJ4rpPbx4oKvAo14YZbADMjmTM4fhMr+8soRYaToFTt/en3cg
	lFbjdWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ro5-00000008Vyi-42Bk;
	Tue, 08 Sep 2026 09:07:57 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ro3-00000008VyJ-2hnf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:07:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso3213307a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858474; x=1789463274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=D1Tb1Lob06eu+HuksgAEgZ4fK8eCfz8H83UavgDaRzJvhUsR6FvjDseuAufwklVAn1
         uIrbyCvjXQlk7qY93CerTXJPLlbUWqywintMLoJBMwk1Fn51Dikyq+NpufM15pRKaImQ
         GgvpEHsDwstwTsTALXW0/qsPwu6oxVNphHHZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858474; x=1789463274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=avyptvRldcsLxFPgz5+8mSMNENzv8DR6cxcMbaLMOwwUVvg5rN1oO6ORabipx0/qtk
         lXFJcvMKNE65o4KX5bDm42gaqjwYGEyFGFnvlY4HYjhjMKkZR/tT0QuqjC4GgktaKTwu
         RiJklx7b23Nabzjee3zgu8PRH0ib1imElpP7Xyiq+iPu021ISrqnA4UxVTMk74YrG2zn
         BQAOpmqwjgsVivSejd58YWF+x9kpBB13ZEzMA51lBhcwy7eTfxOSWGBrizwLCCMHvhMn
         E9Drf5pWmJm6F8bTCoenkq74hP/Vl8/TJUdc+JSaCnW9b0Ii5qaIiTGuG9rOjEx7KVlJ
         z2Rw==
X-Forwarded-Encrypted: i=1; AKwUvBy04pZz/exTrcDGYOfQ+K9fn19hwRaOL+nVGtxKCjvlrkSwvJsQ0JlLPicBNnPc3Jw8HCcCtF9FtC9wncJClww8@lists.infradead.org
X-Gm-Message-State: AFuF++liw3TZD9le1YOxV9PmUh7bZJ76ELl8uwEa+7/h0xps5QyPRYGk
	x/VbiHUgKcr5fMRVFL31d84oGn8PmvuA7AT0itkpP8IXLPbUpvYTNmZFQCeXsocmzA==
X-Gm-Gg: AYBFou3p+Y7Kscyzy6lV17xQSGSVbnVEYgrNiO4vcizj7T9YwPXjHHqac/3rgHXw5vJ
	+EEPSUvJN9ElBMLc2WwKCRI4g/CZhmr3dFg8DAJu+QvZJeoMFyyy603ORnI8TPJCoKrRfeMovrS
	2xm/nCEYLFU8nZFJMC2PhWUhbv+7za6Zg9ZoWo9sOrmqOm1b9CjybDbNE58DuJRQibvOWjGihfe
	NdDn4n04caD/xFzYjohlDyMaigX+fRd/lv0Kkh5xNcEfUxcbtymbrg4y4edntp/teSitMA8PcQU
	mduVxaldpqGDJeI+G8us1VkkCnicL8diV/JSgeL+23Q11l9EOPKM32mBaBQ5LC/j3xwKBNLm9VA
	nDlQJ51kv27ZUMfo+bHCiWWiXJbZk/zI+uJACQuPtVRiPpmEK+L60DBkU4ii2sXofHN9CGMNAAv
	bcs0KZ+K5hjD1tzgVq15W/ehzFeKyuthh5mf1xRhM9cZVDtg0X8E+eStpvYPc1mNbUjbHjMrugN
	dwh/ZFCpcf5XMMiMIxvG06Ve4jY7UaefRlWh0K3/aC5k6c=
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr45630109a91.12.1788858474627;
        Tue, 08 Sep 2026 02:07:54 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:07:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue,  8 Sep 2026 17:07:39 +0800
Message-ID: <20260908090745.1089143-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020755_728804_4A92187D 
X-CRM114-Status: GOOD (  15.38  )
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

Hi,

This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address.


Patch 1 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 2 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 3 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 4 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (4):
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 63 +++++++++++++++++++-------
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 6 files changed, 83 insertions(+), 40 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog


