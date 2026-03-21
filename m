Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E01094462
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXIrZ2JeBYt7lvRrjXt7T5FwWusy32QKCFn/6PrHSYY=; b=IhFq19JzolS3jAEgY3FT0KrSGy
	ALRJ3JUiJkCrursP41Ysr2mQU/DXGC3XcErgOkM8YFb7Hdofh2RhwP4CLliX02LIwwA5WPz4L2yba
	t3X+zNnXSnB57R4iZ7a5i+SoAPXFzb6W76VRCI/LbqLWTr62G11P7V0//cZsW8ozPIoCclz2hcUMs
	fdU7nzdULIgX/kIyLRtq0zgINbVzEVYVkQJN6EznqvROjJzlEX8PBCOr3b+7JS7qcZiWrQozSTkNk
	jd3E+i0Z26tNQQoVneAVkR85C3ENoJEzHJSg/Bu4zd0h1B/+uKzGfYG6cDXadvO7Y5SiwVmsNXM3T
	9IlT4ELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3r8j-0000000EDPd-0x7j;
	Sat, 21 Mar 2026 07:52:57 +0000
Received: from mail-244116.protonmail.ch ([109.224.244.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3r8h-0000000EDMc-0cO3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 07:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079571; x=1774338771;
	bh=GXIrZ2JeBYt7lvRrjXt7T5FwWusy32QKCFn/6PrHSYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jB/Sy4aFU4bYROKDZO6trbv16jvGwLbuXAMSwKZvdgBKyG+jDhoKqIcvCX4vnWIPM
	 zdzANg6OAY201s7xjeU2ILkSpRhaI7PkTEy5slXkTPGN1hmvIieFEdjr5g5k0X/Zhb
	 ORElhunBjYRfiSSLVJn5xZbhNe5TM9FYhrai1mrdIlXw5NqLDm0PXydM43dz45Rs2n
	 bA8zVphKpaalPxNoemc/U5wL4wrJcS18Q7HHcsbIhdvBvDvAw8uVgHY2hXInVF8R6i
	 H/GutRBI5DVec8rxlAVi4yJztLacvy7mTtUvj573ud9cpALMSi/Y+0ocAbc73urT8Y
	 obCIZFCA5jRNA==
Date: Sat, 21 Mar 2026 07:52:47 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 4/5] drm/msm/dsi: add DSI version >= comparison helper
Message-ID: <20260321-dsi-rgb101010-support-v4-4-eb28ecebbfe8@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2b0c9cedaf796717b0cb0c1a53938aef4991d5a7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_005255_343214_A2EF82AB 
X-CRM114-Status: UNSURE (   7.39  )
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

Add a helper for checking if the DSI hardware version is greater
than or equal to a given version, for use in a future change.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index db6da99375a1..b55ffe2fdec3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -782,13 +782,21 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm=
_host)
 =09dsi_write(msm_host, REG_DSI_CTRL, 0);
 }
=20
+static bool msm_dsi_host_version_geq(struct msm_dsi_host *msm_host,
+=09=09=09=09    u32 major, u32 minor)
+{
+=09return msm_host->cfg_hnd->major > major ||
+=09       (msm_host->cfg_hnd->major =3D=3D major &&
+=09       msm_host->cfg_hnd->minor >=3D minor);
+}
+
 bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
 {
 =09struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
=20
 =09return msm_host->dsc &&
-=09=09(msm_host->cfg_hnd->major =3D=3D MSM_DSI_VER_MAJOR_6G &&
-=09=09 msm_host->cfg_hnd->minor >=3D MSM_DSI_6G_VER_MINOR_V2_5_0);
+=09=09msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+=09=09=09=09=09MSM_DSI_6G_VER_MINOR_V2_5_0);
 }
=20
 static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,

--=20
2.53.0



