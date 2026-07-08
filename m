Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=864WgdCGKVvhVw+X58LxeAIhuiQbwracGrd3VXI+iDM=; b=q1XMoBHWi/qflzcxr9RfNxkDs3
	jII1qb9D0pJCQ+8qv4kg2PwYOS8n40nmkUjV565K5hVzZ6hVWWLbevNPZOfxp8SEdnk58zzoY20Ga
	IEvnrYW4JomotdC1+IfAA297jry5pqH1E18JE24uG/AjFtyFG3w/WW1Ph3cLjyN4FuXnyh2aCKCvY
	+CRf0krKoru/39Z/A/UjWA8BZh4jTlK7RmvI86k5T6+fKwDPpBFJriNB6gEY1m3T5m2ZhXgL7qSRX
	gtKD0tpRoMGERZm0fqF+IHvvthI4GxnujmNKht2VznLaTa1BuMuY/X1zxs2RWzvehYi+sqQvKSbsS
	8noBp2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaDm-00000000Ta4-3dZ1;
	Wed, 08 Jul 2026 21:54:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaDk-00000000TZR-2Il0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:54:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b27c7451so3829775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783547659; x=1784152459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=864WgdCGKVvhVw+X58LxeAIhuiQbwracGrd3VXI+iDM=;
        b=RJi0why+Z8aiJ/enPQ8qcrQ6gyKwfc1ez2JqBO34n22MGD5doAmqIRdWyTBj4G6Jsw
         3BR6ni0seQ8HYMaPeAcqMFuNNEinoyV7ZtWaKjB7p06Dh+cxfAXFvSCIn0Twy+xrxkY4
         N7e69GWqV1ny44lttFd6DoZjAbXiWOpL1YFsIpwtlhl1/XsEervM01pnk/oO6sB41V3C
         CXf9HiU+dQpRmGuhg6tQ9Cs3vY5EF65SaXvpWyHmCrMjTQxt81mhhTEu7B8oAuZY4VPg
         g9CZkmdTf6SR06y0QrR+ztOdko9tsEVjpk2ZelJqGanJfSN99H4mPRyaG4/uTUrCT0U1
         Y6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547659; x=1784152459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=864WgdCGKVvhVw+X58LxeAIhuiQbwracGrd3VXI+iDM=;
        b=QoaJ37eZgi6+qYmdvYbEm2wTAlNPu+oR44QmcrR+o/GUg69jaD/vlvVkk1TYduBHPS
         seNhenYS+Y7EDNyRhiJRIrDZDkkpILiSRRCXv1VaIvsZ2yGByZmrmCSQ18kVbPrRTEGU
         OATH3EoPfzOVBRr07z6Cg8Xl3BEv96AvgTXxADFRhdzAxMRFr2qqwE2OuOKmS+D2sNdh
         EJTqkqrtIjGaJOZA2jK45vACBU214utnZ+nll9H0ZYBqtaphm0J2naLw6MdjIF9YPhn4
         yvgmO3frqQmhySzJ92kF4y9ZymVAJQSGR3BYcJh0h2Lgy8/ohJxLK1kmVc8rC7VWTX3k
         uxtw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5hazyH7uuCecgljiZw+8otJgMmgKLoRbg7N6T5YJDwb6G05ar9jtCuNPUmJqkpuZy6P5IJ+CLV1dbo/x7Zso/@lists.infradead.org
X-Gm-Message-State: AOJu0YyrfQ/PXhjR4atta95Z+SdqHsN8NsNuprp+Y7TjHRtAvwj4ksYX
	Y0xWrW+lFEBzo2i5pTPpGqAEGPkSLtBOo9YEvYIFuDY/MS7w95hMQiPA
X-Gm-Gg: AfdE7cmSfWxkS+6an553HJcvhYzFiTlH3d+PCxu+42n5h7TJdGluG9f8DumNMuY6T8g
	qP0/DVFxCAxYutN3eqvaddedIPs1zwv+PLXPxJij1ezLA/OAz9aWIRugFgmXEEy5Kai7r+vUsXH
	qHvAgT7/phNW4pu2PHWA9506TDyKzRnF9HEb3ZphP8esdRok4Phdq21g2+0MYsBWVnTBmVhZogt
	84ptghulN+Z0AjW43WFECB9V0X32y9WVn+yH0A/oR39oY4jbInUUzRy8xRHWTNFDwv1Zgl67+9H
	OhX0C3O8fIO+ttAV8ncampGPbCihDDrZYgGhnJEI+pnMMqjyZKX8T7otf7+m+wOcHsJmgadRJLK
	0eXGp0DTaaa+fQrLq1RquhQR9QfZbf0ZuDHDWGAggLpaWywqynM7PEzgb5AgIvxUHIuvXaBE5OU
	evqujoboY0yjeAedr7DGEFALZASOa5mfMqR/5lJc8TYFVbvX4cRA==
X-Received: by 2002:a05:600c:3421:b0:493:cbd4:8925 with SMTP id 5b1f17b1804b1-493ec55d788mr490785e9.4.1783547658604;
        Wed, 08 Jul 2026 14:54:18 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:7550:b182:7bdf:fbd0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm1032704f8f.16.2026.07.08.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:54:18 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] drm/imx: ipuv3: handle PRG channel configuration failure
Date: Wed,  8 Jul 2026 23:54:16 +0200
Message-ID: <20260708215416.147586-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145420_603513_364B20FA 
X-CRM114-Status: GOOD (  11.82  )
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

ipu_prg_channel_configure() can fail when no PRE is available for the PRG
channel, but ipu_plane_atomic_update() ignores its return value.

Atomic check is expected to prevent this condition. If it still happens,
warn and abort the update instead of continuing with the original
framebuffer address after the PRG/PRE setup failed.

Fixes: 00514e859335 ("drm/imx: use PRG/PRE when possible")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index d6806d1ae6e1..78a3ea0581c0 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -629,10 +629,14 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	 */
 	if (ipu_state->use_pre) {
 		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
-		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id, width,
-					  height, fb->pitches[0],
-					  fb->format->format, fb->modifier,
-					  &eba);
+		if (WARN_ON_ONCE(ipu_prg_channel_configure(ipu_plane->ipu_ch,
+							   axi_id, width,
+							   height,
+							   fb->pitches[0],
+							   fb->format->format,
+							   fb->modifier,
+							   &eba)))
+			return;
 	}
 
 	if (!old_state->fb ||
-- 
2.43.0


