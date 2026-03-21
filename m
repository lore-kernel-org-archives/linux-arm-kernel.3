Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D404C1094463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gircwKOW0ywrfXjrpGmIf8114zj09cFmRcezKwqZ3MA=; b=nx5S1omm5MvM7jPFqPZJMsYfKT
	ZYsiZAm1mqOr8tiJZUUGsA8+aNTYdfLK3PlfLjKYlyFX9XqyMTcNMPp9dqKA05J+rauvLMDJ1vPMx
	I5HMNrD5Q7MkUqXSzX0N8Kdb12eEqRZD4KBqCr2TAyokQrMsvJvWeS7HH7mm0/L2zqtifnaqJjLro
	pdVpTc9b/QkLe+gbeMBsShcqDx9dGz/OOn8WUfYai/dJJn4aMhW2QUO722Yz+n6LeF3u5MvPnOEjp
	+dDVgF4KCeHmARW/AiM8h8PCw+I4IaGG4uWuIEJEdnkkpjzP1twclNBYOSNcLdUuR9cKNbT6iOvVd
	eCXrFljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3r8V-0000000EDGu-2HQw;
	Sat, 21 Mar 2026 07:52:43 +0000
Received: from mail-106119.protonmail.ch ([79.135.106.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3r8S-0000000EDFA-1JoE;
	Sat, 21 Mar 2026 07:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079557; x=1774338757;
	bh=gircwKOW0ywrfXjrpGmIf8114zj09cFmRcezKwqZ3MA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rM5Tj8HXmcx6/twMmRZ16BVflRRl984vDLQj+4hTRIJlzAFvOxANnCrI6v8wtzBNv
	 BPTqgvU4ieqM7yGcySgF65i8gcIOim9qKgfvJMmSs5e7rLAqOxxfYiyV6W65WRWqgw
	 liF6mM413dB0NxjPlL79maMuxy+A/OTuwp5zImwFrcGWz9dnZfze684p3giuAdvpKJ
	 8/OiOP06fzD2oNCd0sbFn1CH9H0XqqVylhBEjiaU5wAS+hrqkIjRUyUccgOuC8HFzn
	 wNcOn/Fnb2bK3RPjDyWv77qrDoJIaI+P1GpkeJZnh+6PhJUWPP49yEEv8EX0Ni2gbY
	 gvYExjNlwwg4w==
Date: Sat, 21 Mar 2026 07:52:30 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
Message-ID: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 827c3af36e90d8440263c62eaf3d19cb861b9eb9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_005240_801392_0D039BD2 
X-CRM114-Status: UNSURE (   6.08  )
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

Add RGB101010 to the unsupported format cases to fix -Wswitch warnings
introduced by the addition of the new pixel format.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/me=
son/meson_dw_mipi_dsi.c
index 66c73c512b0e..59fc0083d318 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -119,6 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 =09=09dpi_data_format =3D DPI_COLOR_18BIT_CFG_2;
 =09=09venc_data_width =3D VENC_IN_COLOR_18B;
 =09=09break;
+=09case MIPI_DSI_FMT_RGB101010:
 =09case MIPI_DSI_FMT_RGB666_PACKED:
 =09case MIPI_DSI_FMT_RGB565:
 =09=09return -EINVAL;
@@ -232,6 +233,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_dat=
a,
 =09=09break;
 =09case MIPI_DSI_FMT_RGB666:
 =09=09break;
+=09case MIPI_DSI_FMT_RGB101010:
 =09case MIPI_DSI_FMT_RGB666_PACKED:
 =09case MIPI_DSI_FMT_RGB565:
 =09=09dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);

--=20
2.53.0



