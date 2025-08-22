Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004EFCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8gOs4fYh6eyB5Xg5l22CDzCNbf7B4y9zYp/SzMxQaM=; b=Rtu3bNqncVRO9o
	z+dkTH9ACzm28IXdtF+Tltdjnsb92ZqXNyGq8oi9RaffNqbfjhouE2GM+65bkuuNykVHD26rABQQH
	RX4pMMtKkYi0pzn3I+mhW/TYbyhs8rxIBB4M3nLIjV+tQeiP8N8VZWPoeJ0J2BDihbEdJ5T16Ar+2
	2IZODcAn4vvsHM9u2m2+nBlbf4zPjcLB9dDRONStgPtjy9LW1NoOivHNlg4j1rIoiJBWWWqpemxT7
	z8SywD/ZXGHY1mCla01yr9Waifc5fWEUIIR2YHn2SUYaWue6nHDnj7G0KmG5vQOdutPqSgV+B2uGk
	m6orxLf1ZG1RkE/AWLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUS-00000004MfO-1jHy;
	Sat, 23 Aug 2025 08:20:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upWcw-00000003Jqu-3xrp;
	Fri, 22 Aug 2025 18:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755887795;
	bh=ojMWLu9sR6XdGXpcfVIIZPVqzPufzHlxziClp8RvZuc=;
	h=From:Subject:Date:To:Cc:From;
	b=Qp1zDczVZTuL+KKSr2IZlvqdH3/8Y6QxXavfHVcwdXakerqipjLzv1xqzn6zjw9nS
	 JCt4PIpVo7dSuYysFkbX8+LcF1aa4CIOY9OodbCsczlOVGuh4sCDhLE3g4NPkxirWp
	 XgDaCvVoU/10UIhfLRtl5ZSKp6Hs6R0AWhEeIgNQdVAfVIj3Rl0mxFu9mBf0bQyY/b
	 XaBCBI2ft6njRroOTCJKWe6boNB/pNfe7amjyRE8JJi9/t9AQrWlcw2UK+szQZftP+
	 JxoQ5GvUlQ4I8k4gCvBNXjJTD5tAKvPzO2LOE4SCra4hg9lLU36M7mK/kpFlTQFL4j
	 E9deI22a44jgQ==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C6D017E110D;
	Fri, 22 Aug 2025 20:36:29 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH RFC 0/5] Introduce support for post-blend color pipeline
Date: Fri, 22 Aug 2025 14:36:10 -0400
Message-Id: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJu4qGgC/x3MTQqDMBAG0KvIrB2If1S7FXqAbosLjV/t0DQJi
 RRBvLvB5du8nSKCINI92yngL1GcTSjyjPRntAtY5mQqVdmoW6X4t37Zu7jyZGBn1s64wF48jFh
 w3bUoxk7rpgKlwwe8Zbv+Fz0fPQ3HcQKcyOaBdAAAAA==
X-Change-ID: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_113639_137337_F3D51CD0 
X-CRM114-Status: GOOD (  12.11  )
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

This series is based on "Color Pipeline API w/ VKMS" [1]. It reuses the
same concept of a color pipeline API but for the post-blend stage
instead of pre-blend, by attaching the COLOR_PIPELINE property to the
CRTC rather than a plane.

Patch 1 implements the necessary changes in the DRM core to make this
happen. The remaining patches implement support for this API in the
MediaTek DRM driver in particular.

This series has been tested on the MT8195-Tomato Chromebook with a WIP
Weston branch [2]. Both gamma LUT and CTM color transformations have
been simultaneously configured in hardware through the API and validated
(test commits in weston [3] and the kernel [4]).

This is a very early implementation but I'd like to get feedback from
the community before moving forward. For instance one notable thing
missing it to add init helpers for the post-blend case for the remaining
colorop types, as only 3x1d LUT and 3x4 Matrix were needed for gamma LUT
and CTM use cases.

[1] https://lore.kernel.org/all/20250815035047.3319284-1-alex.hung@amd.com/
[2] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-colorops?ref_type=heads
[3] https://gitlab.collabora.com/nfraprado/weston/-/commits/post-blend-color-pipeline-lut-ctm-test?ref_type=tags
[4] https://gitlab.collabora.com/nfraprado/linux/-/commits/post-blend-color-pipeline-ctm-lut-test?ref_type=tags

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (5):
      drm: Support post-blend color pipeline API
      drm/colorop: Export drm_colorop_cleanup() so drivers can extend it
      drm/mediatek: Support post-blend colorops for gamma and ctm
      drm/mediatek: ccorr: Support post-blend color pipeline API
      drm/mediatek: gamma: Support post-blend color pipeline API

 drivers/gpu/drm/drm_atomic.c              |  32 ++++-
 drivers/gpu/drm/drm_atomic_uapi.c         |  50 ++++++-
 drivers/gpu/drm/drm_colorop.c             | 147 +++++++++++++++++----
 drivers/gpu/drm/drm_connector.c           |   1 +
 drivers/gpu/drm/drm_crtc.c                |  77 +++++++++++
 drivers/gpu/drm/drm_crtc_internal.h       |   6 +
 drivers/gpu/drm/drm_ioctl.c               |   7 +
 drivers/gpu/drm/drm_mode_object.c         |  20 +++
 drivers/gpu/drm/drm_plane.c               |  36 +----
 drivers/gpu/drm/mediatek/mtk_crtc.c       | 211 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 100 ++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 107 ++++++++++++---
 include/drm/drm_atomic.h                  |  20 +++
 include/drm/drm_atomic_uapi.h             |   2 +
 include/drm/drm_colorop.h                 |  17 ++-
 include/drm/drm_crtc.h                    |  19 +++
 include/drm/drm_file.h                    |   7 +
 include/uapi/drm/drm.h                    |  16 +++
 21 files changed, 781 insertions(+), 108 deletions(-)
---
base-commit: d152eee7ae3b72e2ce70064a7ad9764f7ba8641d
change-id: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


