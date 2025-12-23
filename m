Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91566E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mhas7AYg8Al125AIAoaWfTDzwb64rjoVqeGsBofVfR8=; b=muiD+BBCh+5pEF
	Umd1HP7g5DBfjeFHfUMaAgy3Oakw76SQ3mKgek2HaoViqFefmeg2zHnP0I+uYTY5vJF8peZ/6CV21
	lfJ6QfWJBZE21bBOPiQ9yiyJJiFE24z7J95lQkRggKXZDAmFjQ/XBPF5Z3YoLujxahcn+xhwW5q2V
	qKbjFfehHkWTNdNgsWDXkgjYC592QvEa/akcnPdiCmJE6xC+O6/1/QkQpHnjjMfeSTwcDYW9zBdTk
	fLInRcx+xSwuL70GwXxs63Fo38RNN0wSP3QgL87771kHngspqQCjKQaJqyTCY6+J/upT5Dc/fGBCw
	Vx/HS1PLqvCYifPu5xZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8L1-0000000FzwY-3aEZ;
	Tue, 23 Dec 2025 19:46:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Kz-0000000Fzw8-39aX;
	Tue, 23 Dec 2025 19:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519186;
	bh=DsNXs1aJQccVr90Um4OPsrkOwKn/wYgaO1rvK+xVKFM=;
	h=From:Subject:Date:To:Cc:From;
	b=dQ1cVjcklyhGmSVvKJWC4MbWA9eKtmcZ9C0BcFi36rR6S7n14rK7SNeTI76qwytP1
	 +8B8iQROhFaQ8KA+NTRRLQaCGusnBm9ZDaW3odtwrYz21XKthQ0QBdl1MioJ0EWL9e
	 0i4fysfaXrXxFe9Ni8QCEu03NAhp/JmWUwPW8gWj0X6DInbz+u5/DYWvu2pxKUCoNt
	 8pSyK/UR37jABIAsB4WyYWX5IiMuzzCLTbu37vf3FLxL8b+/O+ZBL9W6B18Kq8mLv4
	 RXBCjNs3oRv5TQeZoQjpxYGRxw1Z2B4wGIqRjOKBCgdKIZL3KB3NV0tO3xdQEIMs6c
	 Y0bpbYnBi2abA==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AC4D17E0C2E;
	Tue, 23 Dec 2025 20:46:20 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Date: Tue, 23 Dec 2025 16:44:41 -0300
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACnxSmkC/x3MQQqEMAxA0atI1gZsh6L1KuLC2owGayOtiCDef
 cosH3z+A5kSU4a+eiDRxZklFqi6gnmd4kLIvhh0o43SyuJ+bihXwCMRukDR4yxBkhwZrXGt013
 38dZAGZTky/d/Pozv+wPQf+wfbAAAAA==
X-Change-ID: 20251219-mtk-ovl-pre-blend-colorops-95b7b2883d95
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114629_948380_2555B22D 
X-CRM114-Status: GOOD (  10.62  )
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

This series implements a plane color pipeline for MediaTek platforms,
specifically for MT8195-compatible SoCs.

The pipeline is composed of the following blocks:

Inverse Gamma -> RGB to RGB Color Space Conversion (R2R CSC) -> Gamma
(1D Curve)       (3x3 Matrix)                                   (1D Curve) 

The curves supported by Inverse Gamma are:
* scRGB
* BT.709

The curves supported by Gamma are:
* scRGB
* BT.709
* BT.2020
* HLG

Given the lack of support for writeback connectors on the MediaTek KMS
driver, combined with limited hardware documentation, I haven't been
able to verify the correctness of each curve, only that they were
visually sane (gamma curves made the image on the display brighter,
while inverse gamma made it darker).

This series depends on "drm: Color pipeline teardown and follow-up
fixes/improvements" [1].

This series was tested on the MT8195-Tomato Chromebook.

Regarding the support of color operations in OVL for different SoCs:
* it's not supported by MT8183, and presumably also not by older
  generations
* On MT8192 it's supported by ovl0 and ovl_2l0, but not ovl_2l2 (despite
  the same compatible as ovl_2l0).

For this series I'm only enabling it on MT8195 since that's the one
where I can readily test.

[1] https://lore.kernel.org/all/20251219065614.190834-1-chaitanya.kumar.borah@intel.com/#t

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (11):
      drm/mediatek: Introduce DDP plane_colorops_init() hook
      drm/mediatek: Initialize colorops when creating plane
      drm/mediatek: ovl: Add supports_plane_colorops flag
      drm/mediatek: ovl: Enable per-plane color operations on MT8195
      drm/mediatek: ovl: Implement support for Inverse Gamma
      drm/mediatek: Add plane_colorops_init() DDP hook for OVL
      drm/colorop: Introduce HLG EOTF
      drm/mediatek: ovl: Implement support for Gamma
      drm/colorop: Introduce 3x3 Matrix
      drm/mediatek: ovl: Enable support for R2R Color Space Conversion
      drm/mediatek: Check 3x3 Matrix colorop has DATA set

 drivers/gpu/drm/drm_atomic.c            |   1 +
 drivers/gpu/drm/drm_atomic_uapi.c       |   3 +
 drivers/gpu/drm/drm_colorop.c           |  22 +++
 drivers/gpu/drm/mediatek/mtk_crtc.c     |  36 +++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 287 ++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h               |  13 ++
 include/uapi/drm/drm_mode.h             |  16 ++
 10 files changed, 381 insertions(+), 1 deletion(-)
---
base-commit: 1783cdadb70e74a30dfee250f8c2dc13b4e61128
change-id: 20251219-mtk-ovl-pre-blend-colorops-95b7b2883d95

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


