Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42984E9A776
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bd8puGPsyAqrkv3KsDLsSC/8GgPDmqGf8nZTwBgCbY8=; b=urz3ijtVYLwM+R1Rr4GHryeZHs
	mZx25308UevO/qS6pVesOZgjxUI0xd4q3h63KGz+1mg22B73wfjK9TtURAhIci48eMrI0As04baQh
	qgqEpvEDfJxFp1mmO6kJUVL01apWWFEXxVyL1mXi8dDkYY4/9kL8SRx40wDaFN5qs11Rtp6LXd/YE
	GrJI0xrfHYWtYXoqfBjt9xhbM4zuey0qR8m20IotUhxz746wc1bNImwcGyLK88f/p8QaRilt6E2EV
	lW+dueFY48V/21NeDjrxjbo204/VQoQdeLBwEejDMVyhs5uT8JW5GoG2jHccTzTOKv3vAYVr1VQJv
	vzZodOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50F2-00000001Ix0-1B8X;
	Tue, 24 Mar 2026 11:48:12 +0000
Received: from mail-10629.protonmail.ch ([79.135.106.29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50F0-00000001IvY-0PdN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352886; x=1774612086;
	bh=Bd8puGPsyAqrkv3KsDLsSC/8GgPDmqGf8nZTwBgCbY8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EQc3mgI203+O6uIdKN1cbKBrJYYKtopOnFWgus+/77ru5URIvTFagSqZyHFir824s
	 aE/ASlIDrv+C5NA2iIpVKVD8hSMJeGXMc4S7Oh63GOtdELyQRcyrLzf6+O1hzDWg+6
	 TgdhAVimU3kpsmmMNZWFUiUUfDnCHZVIpCtFJ/PNaTgzc9VUOxSjLCUD82ciSw/jXL
	 nW4ds3oUIlflSMLUvmx1lC+n+HghZvUSfsHdRocVFMmZCUA6+nLVKzOsYIs/N9qYrG
	 cmVVQkJfdPSug0HAqBvF0es085DZddnU1Hr/JZxVsiyTtdCu5OxwFtJI2FFfrze+H9
	 YNg72gCqc8p3w==
Date: Tue, 24 Mar 2026 11:47:56 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 0/5] drm/msm: add RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6b2dc60d395a13138b40b2adb8565c23b7c2566b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044810_298004_E97F16B9 
X-CRM114-Status: UNSURE (   9.46  )
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

This series adds support for the RGB101010 (30bpp) pixel format used by som=
e
newer panels.

Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing Phone (3a)=
.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v5:
- Add comment & warning about RGB101010 support in compression_en && !wide_=
bus_en case
- Move RGB101010 check further down so it has access to msm_dsi_host_is_wid=
e_bus_enabled()
- Use default case for meson_dw_mipi_dsi pixel format switchs
- Link to v4: https://lore.kernel.org/r/20260321-dsi-rgb101010-support-v4-0=
-eb28ecebbfe8@pm.me

Changes in v4:
- Dropped dpu_encoder_phys_vid patch
  - Needs further discussion and rest of these changes can be independent o=
f that
- Pick back up dropped drm_mipi_dsi.h patch (oops)
- Fix meson driver warning from adding RGB101010 to drm_mipi_dsi.h
- msm_dsi_host_version_ge -> msm_dsi_host_version_geq
- Fix msm_dsi_host_version_geq to handle major > major
- Link to v3: https://lore.kernel.org/r/20260319-dsi-rgb101010-support-v3-0=
-85b99df2d090@pm.me

Changes in v3:
- Fix typo for MSM8998 DSI version name (V2_2 -> V_2_0)
- Add msm_dsi_host_version_is_gt per Konrad and use for RGB101010 check
- Fix up comment & commit message for video mode DSC INTF timing width chan=
ge per Neil/Konrad
- Link to v2: https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v2-0=
-698b7612eaeb@pm.me

Changes in v2:
- Only allow RGB101010 if MSM_DSI_6G_VER >=3D V2.1.0
- Link to v1: https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v1-0=
-6021eb79e796@pm.me

---
Alexander Koskovich (5):
      drm/mipi-dsi: add RGB101010 pixel format
      drm/meson: use default case for unsupported DSI pixel formats
      drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      drm/msm/dsi: add DSI version >=3D comparison helper
      drm/msm/dsi: Add support for RGB101010 pixel format

 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |  6 ++---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 34 +++++++++++++++++++++++=
++--
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 +++-
 include/drm/drm_mipi_dsi.h                    |  4 ++++
 6 files changed, 45 insertions(+), 10 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-rgb101010-support-4956b1cd8657

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



