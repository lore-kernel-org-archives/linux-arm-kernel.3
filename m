Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8669E9A777
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy41l+CjiLxNPt1yzWCa9yREYcMW6OvI12kT5kkLAYw=; b=sDmsQwt3snu/PsUH28PQGD4hLp
	qJwgDg1muShH8cNFCRu2Ir8odpZESCFnWqzbZLoNJulRgk/Yh3UO5oadeCLPOAu53vB5AjRv+ECUX
	0ikb7pMBEOffbf8/w9I+UwjviQFknG5Ojp4VRbTn+dEWJgX9OJzE8+BzZUxFl+xW6+4yw0HhvtD/S
	+PulZd3YkHnIu1K28qOJMwBp35TKjFEnN1Dm5AHT9dJr+sCZFj9ay8lo+iQ0HT7wF4Cu6Q5Wyu00N
	T8I8WsyoWn1pD+7YGqy07j0OwHAj0MO+ACpn3azhzd0mPbcxaKUXQ/jD1xTcfXb3+m52grY7oJu3p
	OlBNW0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Fs-00000001JUB-24DG;
	Tue, 24 Mar 2026 11:49:04 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Fo-00000001JQc-0xGl;
	Tue, 24 Mar 2026 11:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352937; x=1774612137;
	bh=Fy41l+CjiLxNPt1yzWCa9yREYcMW6OvI12kT5kkLAYw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TtcY3tm4izlAS15nSq8Hs6ZPAm56+k3IEtsZ2JHiqlwUaD+TeYISztpIeXE651GGo
	 xbkwQLOhTTVg46bz1aq2Nm+pNV0UK6t5MOGv6DFk67sHiLJrwFfdxXwwZrdXlKlh8y
	 j0BMl8r8kHlKj3i3WoIBifCNCNU0VJN6JnN+pbN6U2yMi77HwgXPUblgExuMcdR4RW
	 Pw9qf42iRZDDgUnLbuNbOXkCNDKdIj2pFbVaIdUhTl7AwXO6Q3Y/9pn9HZSWYrNcJM
	 /v+b8mBvZ2uBieKZIhgutpsfX4Ad3ZoNL0IVeU8Crs/h74GcjEHe1hITPk7UOWiyym
	 bRfgSWumsvrgA==
Date: Tue, 24 Mar 2026 11:48:49 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 5/5] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-5-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 28fd0706425e97bd489645195d5853b55e9e1c64
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044900_427989_982056A8 
X-CRM114-Status: UNSURE (   9.44  )
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

Add video and command mode destination format mappings for RGB101010,
and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
the new format value.

Make sure this is guarded behind MSM_DSI_6G_VER >=3D V2.1.0 as anything
older does not support this.

Required for 10 bit panels such as the BOE BF068MWM-TD0 found on the
Nothing Phone (3a).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index b55ffe2fdec3..992407bbea84 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -757,6 +757,7 @@ static inline enum dsi_vid_dst_format
 dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 =09switch (mipi_fmt) {
+=09case MIPI_DSI_FMT_RGB101010:=09return VID_DST_FORMAT_RGB101010;
 =09case MIPI_DSI_FMT_RGB888:=09return VID_DST_FORMAT_RGB888;
 =09case MIPI_DSI_FMT_RGB666:=09return VID_DST_FORMAT_RGB666_LOOSE;
 =09case MIPI_DSI_FMT_RGB666_PACKED:=09return VID_DST_FORMAT_RGB666;
@@ -769,6 +770,7 @@ static inline enum dsi_cmd_dst_format
 dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 =09switch (mipi_fmt) {
+=09case MIPI_DSI_FMT_RGB101010:=09return CMD_DST_FORMAT_RGB101010;
 =09case MIPI_DSI_FMT_RGB888:=09return CMD_DST_FORMAT_RGB888;
 =09case MIPI_DSI_FMT_RGB666_PACKED:
 =09case MIPI_DSI_FMT_RGB666:=09return CMD_DST_FORMAT_RGB666;
@@ -1713,6 +1715,26 @@ static int dsi_host_attach(struct mipi_dsi_host *hos=
t,
 =09if (dsi->dsc)
 =09=09msm_host->dsc =3D dsi->dsc;
=20
+=09if (msm_host->format =3D=3D MIPI_DSI_FMT_RGB101010) {
+=09=09if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+=09=09=09=09=09      MSM_DSI_6G_VER_MINOR_V2_1_0)) {
+=09=09=09DRM_DEV_ERROR(&msm_host->pdev->dev,
+=09=09=09=09      "RGB101010 not supported on this DSI controller\n");
+=09=09=09return -EINVAL;
+=09=09}
+
+=09=09/*
+=09=09 * Downstream overrides RGB101010 back to RGB888 when DSC is enabled
+=09=09 * but widebus is not. Using RGB101010 in this case may require some
+=09=09 * extra changes.
+=09=09 */
+=09=09if (msm_host->dsc &&
+=09=09    !msm_dsi_host_is_wide_bus_enabled(&msm_host->base)) {
+=09=09=09dev_warn(&msm_host->pdev->dev,
+=09=09=09=09 "RGB101010 with DSC but without widebus, may need extra chang=
es\n");
+=09=09}
+=09}
+
 =09ret =3D dsi_dev_attach(msm_host->pdev);
 =09if (ret)
 =09=09return ret;
diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/dr=
m/msm/registers/display/dsi.xml
index c7a7b633d747..e40125f75175 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
@@ -15,6 +15,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/free=
dreno/ rules-fd.xsd">
 =09=09<value name=3D"VID_DST_FORMAT_RGB666" value=3D"1"/>
 =09=09<value name=3D"VID_DST_FORMAT_RGB666_LOOSE" value=3D"2"/>
 =09=09<value name=3D"VID_DST_FORMAT_RGB888" value=3D"3"/>
+=09=09<value name=3D"VID_DST_FORMAT_RGB101010" value=3D"4"/>
 =09</enum>
 =09<enum name=3D"dsi_rgb_swap">
 =09=09<value name=3D"SWAP_RGB" value=3D"0"/>
@@ -39,6 +40,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/free=
dreno/ rules-fd.xsd">
 =09=09<value name=3D"CMD_DST_FORMAT_RGB565" value=3D"6"/>
 =09=09<value name=3D"CMD_DST_FORMAT_RGB666" value=3D"7"/>
 =09=09<value name=3D"CMD_DST_FORMAT_RGB888" value=3D"8"/>
+=09=09<value name=3D"CMD_DST_FORMAT_RGB101010" value=3D"9"/>
 =09</enum>
 =09<enum name=3D"dsi_lane_swap">
 =09=09<value name=3D"LANE_SWAP_0123" value=3D"0"/>
@@ -142,7 +144,8 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/fr=
eedreno/ rules-fd.xsd">
 =09</reg32>
 =09<reg32 offset=3D"0x0000c" name=3D"VID_CFG0">
 =09=09<bitfield name=3D"VIRT_CHANNEL" low=3D"0" high=3D"1" type=3D"uint"/>=
  <!-- always zero? -->
-=09=09<bitfield name=3D"DST_FORMAT" low=3D"4" high=3D"5" type=3D"dsi_vid_d=
st_format"/>
+=09=09<!-- high was 5 before DSI 6G 2.1.0 -->
+=09=09<bitfield name=3D"DST_FORMAT" low=3D"4" high=3D"6" type=3D"dsi_vid_d=
st_format"/>
 =09=09<bitfield name=3D"TRAFFIC_MODE" low=3D"8" high=3D"9" type=3D"dsi_tra=
ffic_mode"/>
 =09=09<bitfield name=3D"BLLP_POWER_STOP" pos=3D"12" type=3D"boolean"/>
 =09=09<bitfield name=3D"EOF_BLLP_POWER_STOP" pos=3D"15" type=3D"boolean"/>

--=20
2.53.0



