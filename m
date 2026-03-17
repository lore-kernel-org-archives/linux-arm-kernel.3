Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440FAF33807
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1Qal9owEWmx10nMbdaip52xdARaCO/YU8MURG1lRk8=; b=MYRB1GxKcPXwiYE8oo0oEQQ8Id
	BviBcwY39qpLBFOssVxzeyZzx8QBzueXhV01xubis2ZZOaME5dFEjjphPScp+Aa/lq91M3nEo1wzJ
	yXwcM1g/bPPujF2fTVpHXDo2Z9Z9LWnzTC71EV4bHrE8mqBOk404Y1XYbXq5ZGduTKaxruakuG5YQ
	DL/dOdt+32EFqsQSJl4VjFQmHEvyQiktn29P70BzOHu3Jw+ve+hVXPH1jCYU617nY9SSjeUReuY1r
	Rpv9NtjEtZDVsGLZ2nT0Mf0xIUJBxcZ4Rvcjr7okuEKlbPXtjG/YDvGMmoo8+kFUx2HH9q4gSLvMB
	jMm/5KlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7K-00000005Vq4-2syJ;
	Tue, 17 Mar 2026 06:41:26 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7G-00000005Vok-47c3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:41:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ab46931cf1so3554715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729682; x=1774334482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1Qal9owEWmx10nMbdaip52xdARaCO/YU8MURG1lRk8=;
        b=kO9l7PWirWaMWEjKByNguFJGK+IHzlpIZxOyUdMW+oeRzvL+LiiyBXxP47R3jJgBI3
         W+8ZVVsVTl6K+WrA1eMqNXGVYyhBC8vqgPSzm4hITip3eCEFepeQIsZOKLG6GCTMmPHS
         0j7I8fX3wIicdmVZxijOl+AkWqjBLCPPgUTRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729682; x=1774334482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1Qal9owEWmx10nMbdaip52xdARaCO/YU8MURG1lRk8=;
        b=R1V6izkrEfpc3wnCJAL7Z7lGOZ1fIR95BOTPNoZLZb401S3QPZ04EvxQYnpYDimx5f
         u8jhs2bSZKy6JqLnnMcY+IkycjfhCEFavwc/KyJyZp2DZ1yXAraueRMJX10++agzM2kX
         uaYVss14aYoTW4pAadDvl+V2zIeHbFSOsKEWhGi60UavumTWZIfmPa8zHaO+qtHD/zeP
         Yc29XYk2aPWbaXG26m9X0hykzwiTFJvS1CjPhJzn03ryL1AXPPCtV60vmG2udB1RtQMI
         nyhoMrDuGRgU4ZdCvRskDjB78T200akV/ba4r8n1F3aplQUCLUOFafXDn7cIr505hwwK
         cAWA==
X-Forwarded-Encrypted: i=1; AJvYcCV0jp1KTdcA1hl+RikyRBKBidYYFhjciqtSxQwVmYOz7l6wS+i9IGzSzhU5OpaNI3Kz49ORXx64GIseP4niF5hN@lists.infradead.org
X-Gm-Message-State: AOJu0YzVzfhpp8JrOBuQl6kVYEdETlf0zP6xH9oQ/zVEnf8Lp7ldBKgx
	xoojEoJw98SQnmDh7v3fSWnX+1EfFwPzeO47MnCuQiJvWNTu6LAT/7jQdUdkgQxm6g==
X-Gm-Gg: ATEYQzxByPhw6WJIdOcbcJBbadbDZ6cjtoEFqnrOueNPhgY4j/byWET6chIGk2lMTft
	uYhqxo8tzcyAq+1ZNKNwAsD2q84BiSyrgQUW85jMoL1NfqbzxDyp+MUbvL4bUFumO1KrnRbkxhp
	Qr+ZmHby7iiJRFyTXDz2/Opo/kwoORPDFypdpVRl8mttElquqmcI6oC/8qDkfhA6A0c3h3cN4GN
	6jqG/hgYjdWpJIv7EUEJmibXEO6i495r5v8by2YgsNcknISdAOw8C9Mmf7K0xkprCIc8U2ix+H/
	CyqmN2sV2kmKn2cWE6z9Ijjhig0uXGDDAe2t+/fBRvZd8yJbKWDllxDdJU3vL0tr/b9w1rocfBM
	64A5O1K9VJDRVIrNWJMcObKMRtohabuAYTH5ee5g9QOAdAys2o0fAyPEBhFr4P937J5qzmLb49R
	dt7MIZPbzZrpIKglnocEwLAhX3PIa972Q5RKOLKPWp1QYCjWOwJrTu6GDKqzDo+8KcRzMPJCerB
	MDuS0Vs
X-Received: by 2002:a17:903:2411:b0:2ae:cd2c:8f30 with SMTP id d9443c01a7336-2b06357ec34mr19215525ad.1.1773729682153;
        Mon, 16 Mar 2026 23:41:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: [PATCH v2 1/4] drm/rcar-du: Use drm_gem_dma_get_sg_table() helper to get scatter gather table
Date: Tue, 17 Mar 2026 14:40:43 +0800
Message-ID: <20260317064049.696795-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260317064049.696795-1-wenst@chromium.org>
References: <20260317064049.696795-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_234123_041841_A41F04C7 
X-CRM114-Status: GOOD (  14.31  )
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

The rcar-du driver is directly calling dma_get_sgtable() on a
drm_gem_dma_object. Not passing the dma_attrs field in may cause
problems when DMA_ATTR_NO_KERNEL_MAPPING is added to the GEM DMA
helpers gain support later.

Instead, use the drm_gem_dma_get_sg_table() helper to get the scatter
gather table.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- new patch

Not sure if we should add a helper like drm_fb_dma_get_gem_addr(). This
seems to be the only driver that is using a scatter gather table to pass
DMA addresses.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 94c22d2db197..6a62608ee3a9 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -291,10 +291,16 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 				dst = sg_next(dst);
 			}
 		} else {
-			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
-					      gem->dma_addr, gem->base.size);
-			if (ret)
+			struct sg_table *ret_sgt;
+
+			ret_sgt = drm_gem_dma_get_sg_table(gem);
+			if (IS_ERR(ret_sgt)) {
+				ret = PTR_ERR(ret_sgt);
 				goto fail;
+			}
+
+			memcpy(sgt, ret_sgt, sizeof(*sgt));
+			kfree(ret_sgt);
 		}
 
 		ret = vsp1_du_map_sg(vsp->vsp, sgt);
-- 
2.53.0.851.ga537e3e6e9-goog


