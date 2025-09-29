Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93587CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 04:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=D5wRPUu5G4Y4BWyRfH1H7IBbVKWaqq7gWN8q6OvyK9M=; b=Rvv4Tsw3oBVYpWzhmU7mEDM/p+
	4LdoPvy9Iq+7hybDudOyZNZAVCJHIBm1/IAxnkrGYY0WIvdvOcLu4iNd7keKW3EIAr4EEi5SzRBzs
	6Zh08wbvn5i4XBveP5+3dJOs4emhra33acpsEyF/qkfbqTBvL7FGCRwxQcXOEGniEt1EG7YugkfMF
	CUlDw8AAKJVXcZ6nVXgN5g5a0ktRXf+2QEXGQD4Xh8M1nZjs2W+9fR+YAHsVjdahgkW4jWeDQ1hO7
	XM5gy4iC0/YovOZI0C1gsyFSG74sA6CfhYMoz0qWr9AwHMmGeXJpJCP45L+zHnK/E3lBGcHCN+Gwd
	DgWLrr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35Vy-00000001JKk-3EQV;
	Mon, 29 Sep 2025 04:29:30 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35Vu-00000001JIc-2MDK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 04:29:29 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250929042918epoutp01a2d65d2d8c06aa0b062efd98e69ead2d~ppnbDqMNP0608906089epoutp01G
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250929042918epoutp01a2d65d2d8c06aa0b062efd98e69ead2d~ppnbDqMNP0608906089epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759120158;
	bh=D5wRPUu5G4Y4BWyRfH1H7IBbVKWaqq7gWN8q6OvyK9M=;
	h=From:To:Cc:Subject:Date:References:From;
	b=s+v406U+PLcaD+EY0XDxC+20eJv3QWSeozFIVY7UsAN4tfULGnTc8F7vQSD3zdzyO
	 rhzpEmMEGY6CAL4L3PLWXI/qKFUKe3zAZMSrtlp/1C6Zd+ZZoMYrbxOFkv98iJV29r
	 f8slEvX3yQwMPcvUiHi6ykaMs8z9bAvV5r6Izqaw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250929042918epcas2p273bdddf86958b34ea115371bc3f2d25b~ppnar_-kI1350313503epcas2p2L;
	Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.202]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cZp9n5Csbz6B9mH; Mon, 29 Sep
	2025 04:29:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86~ppnZ0b28b1831418314epcas2p2N;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929042917epsmtip15533e0f7be7361ed94f2258f0311f7a2~ppnZvhldn2403224032epsmtip1h;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/exynos: KMS cleanups for off-screen planes and
 mode_config
Date: Mon, 29 Sep 2025 13:31:07 +0900
Message-ID: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86
References: <CGME20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_212926_921878_8F1330E4 
X-CRM114-Status: GOOD (  14.21  )
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

Hi all,

This small series makes Exynos KMS a bit more robust and better aligned
with common DRM layering:

- Patch 1 treats fully off-screen planes as not visible and routes them
through the explicit disable path instead of programming zero-sized
dimensions in ->atomic_update(). This ensures the proper disable
semantics run when a plane contributes nothing to the frame, and avoids
keeping a logically enabled window around.

- Patch 2 converts mode-config initialization to
drmm_mode_config_init(), tying the lifetime to drm_device and dropping
the now-unnecessary manual drm_mode_config_cleanup() in error/unbind
paths.

- Patch 3 moves the device-wide mode_config setup (funcs/helpers and
limits) from exynos_drm_fb.c to exynos_drm_drv.c and calls
drm_mode_config_init() from inside exynos_drm_mode_config_init().
Historically Exynos put this in fb.c when the driver grew around fbdev
helpers; today it obscures ownership and ordering. Placing it in drv.c
matches other vendors, makes the init order explicit (before creating
CRTC/planes/connectors and binding components), and centralizes device-
level policy in the core driver.

No userspace ABI changes. Comments and reviews are very welcome.

Thanks,
Hoyoung Lee.

Hoyoung Lee (3):
  drm/exynos: plane: Disable fully off-screen planes instead of
    zero-sized update
  drm/exynos: Convert to drmm_mode_config_init() and drop manual cleanup
  drm/exynos: Move mode_config setup from fb.c to drv.c

 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 49 +++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_fb.c    | 34 +---------------
 drivers/gpu/drm/exynos/exynos_drm_fb.h    |  7 +++-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++-
 4 files changed, 60 insertions(+), 42 deletions(-)

--
2.34.1


