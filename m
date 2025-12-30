Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB32E95A91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8yZTuNspVskUxrDKvimuXFp++sGxgQZs425R/ZcSebQ=; b=nP+LvirT5NbjTw
	UC8Tiov5QMb+N1OT8OpvF/x8vMsBkvXakHA4Yb5aGdvEYahEAbTMbvOvuK7A+xmw95Xm0//35DdO4
	kVJmEh/mHy1h3QLPWJK5N9+nb+XWI8ndrBbZfB15+a8r8suAAF26d1nTnded7/+Y2i0WgSYND8q06
	UKmfe9dk4GiDfPh5Iey7+Q2EAb7gnjy+hx+Nshf6GUqwOkxmaGbFDhlTRA4GSVCiNWBZujhlNbv0t
	jHkH/bT1URvRW/XBe66mIjrM01HM+e5vTC3kMggvq7pnfxfQLSRGiyjlDO0xeV836HnRFFTxuq5XW
	r/79HhEWV0lNoMYgnYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaK3-00000004tWa-1DDc;
	Tue, 30 Dec 2025 14:03:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaJy-00000004tVY-33UP;
	Tue, 30 Dec 2025 14:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767103409;
	bh=4upZlyGNOfjRwcM6TZxMkwiVrYZupHgE9fEWSopfkLI=;
	h=From:Subject:Date:To:Cc:From;
	b=MKWYMYlD+peIJcCgOi2z7RbSWlMPZM1F49Kmkq6/Kcj5acqm7QMtpKJSUzQgfIgNc
	 pRG/NDxxyTEDDJ/KQ4s2W5YvIzRSh7fnRk52X9V492qGB5ue21i/sjdK71MY4BahMd
	 XhxSvz9jwIGqmkIkw3OzXoy3/xyoXWdpo4F9B8eoQATB32Kcyc1Igy1KnrZaJG/ZrZ
	 +RHbJcspXfvkSS8EM2yf53yG0vaFzPdgvzl5J37dEH3zkU7zA53i9LbhMCXdXrOXrH
	 Tc4O/pYwI1G1X6CCU38ia7ugq+TCnARQbGIwUa9pxeD7XxJ6MGLLw5j7Ob1VPuDZBU
	 BvoYkTECTXJ3w==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CE3017E0ED3;
	Tue, 30 Dec 2025 15:03:24 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH RFC 0/6] AFBC fixes for MediaTek DRM
Date: Tue, 30 Dec 2025 11:03:00 -0300
Message-Id: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJTbU2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNL3dySbN3EtKRk3bTMitRi3SQzU7M0S6OkZKPENCWgpoKiVLAEUE+
 0UpCbs1JsbS0AflewTWUAAAA=
X-Change-ID: 20251229-mtk-afbc-fixes-b656f92bc2af
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_060334_930436_1A28CC2E 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

This series contains a handful of fixes for AFBC support on the MediaTek
DRM driver so that it can be re-enabled.

This is sent as an RFC because there are still some issues to work out
before the series can be merged:

1. Patch 4, 'drm/mediatek: ovl: Disallow AFBC buffers with width over
   1920' did not behave well when tested with Weston, so a better
   solution probably needs to be implemented before this can be merged.

2. Remaining AFBC issues:
   
   a. The first 4 pixel rows are always skipped in the displayed output,
      that is, the first displayed pixel, on the top-left corner,
      corresponds to 4x0. And below the end of the displayed output, the
      first 4x32 pixels are displayed.

   b. On some resolutions, there are still artifacts that look like
      misalignment issues, eg 1024x1080, 1080x1080.

   c. On some resolutions, no output at all is displayed, eg 1920x1080.

Tested on the MT8195-Tomato Chromebook.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Ariel D'Alessandro (1):
      drm/mediatek: ovl: Fix misaligned layer source size on AFBC mode

Nícolas F. R. A. Prado (5):
      drm/mediatek: plane: Remove extra block from AFBC data payload offset
      drm/mediatek: plane: Correct AFBC alignment definition to 128
      drm/mediatek: ovl: Disallow AFBC buffers with width over 1920
      drm/mediatek: ovl: Disable AFBC on MT8188
      drm/mediatek: Re-enable AFBC support on MediaTek DRM driver

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 59 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_plane.c    | 48 +++++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_plane.h    |  6 +++-
 3 files changed, 104 insertions(+), 9 deletions(-)
---
base-commit: 6f47c4646bee47319cc0980c693ed695c4cfd395
change-id: 20251229-mtk-afbc-fixes-b656f92bc2af

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


