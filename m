Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFE3C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmE9iIxnUvIbx/Dspv+KKcwOK1+i7P4ctLBUvFTCi3c=; b=Qaabus6obdmfLIOUa1ezBk+XQp
	UOPPpFt9lPk+IPhmKT3MLpd3F3yRXy3B5bKSJ9ZAG1CF0eXtJpnqq2tfrJEg7T6nHBTMjAHbxxntr
	s2xM4wYYzIXk5u9kSQZNKV7wOz94IZ54ibhOXoj1wBw3AR2BO3M68wrduiIDmxxRIWrKc+iB3j8xb
	esdmMgcQxASPpKCQrhrCfAsUOKjAXIH4yQJSy8XP3OqUWqRv4oL+O+s3lKiGLGndXg7zePbr4AGV6
	vbG4sXrT9hnaviwEGB4XHRydeCptDJ0giI2pkJmmvbs7M5eQr6UmGXr0ettxtXiuO8+0fCGUUtut8
	89WEQ/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbI71-0000000EayZ-0ND6;
	Fri, 24 Jan 2025 11:44:35 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbI5i-0000000EasV-0IkO;
	Fri, 24 Jan 2025 11:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737718994; x=1769254994;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=3GxZghT8/UmmYstqY+mXofNgLJhuY4yUJDtRaLYNwVw=;
  b=nH9Z/R3gLcWXiDlxuNuW/wgfOPrTh6K4yEaCkJSeguvSiRr0sI96rgvy
   k5f3zQ1S9g3CJ2VUMIr/XRZNyibri/s9qjGcjdTTbnN5c2f/20byJpYc9
   ImT/7Md1k2bLvKeBw4fBc2HE+6HPpPWmwZ3i3CzJH+2So0+75xs+8tDwL
   vMjDL2QJIEJ6xa7IGtoZju4mtqTF507Z67NZOqd2VXGTcSr8JAIOon7H9
   mEOAxux6L//Ebmh9UboMo8sCMLYeqcSWN0x+zLyamzg47x7lKE3+345Z5
   OyfOSHPvpo7GQIthbSmkbXCs9aodS4fetoadcnnpxJTQG1Gqs3zd98Efg
   Q==;
X-CSE-ConnectionGUID: vYn+teg7RiCDVjHygNUxlQ==
X-CSE-MsgGUID: D64GQnpvSLWTTKgNutLGww==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38280691"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="38280691"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 03:43:13 -0800
X-CSE-ConnectionGUID: J44Cq+BmTJ60kjaqAULNbw==
X-CSE-MsgGUID: V1mdlc5FTKyYK7EimpLcHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="108346498"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.170])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 03:43:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>
Subject: Re:[PATCH 2/5] drm/rockchip: stop passing non struct drm_device to
 drm_err() and friends
In-Reply-To: <2c0a76c3.618c.19497bb4329.Coremail.andyshrk@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
 <2c0a76c3.618c.19497bb4329.Coremail.andyshrk@163.com>
Date: Fri, 24 Jan 2025 13:43:07 +0200
Message-ID: <87plkcbfp0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_034314_162315_CE11897C 
X-CRM114-Status: GOOD (  14.28  )
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

On Fri, 24 Jan 2025, "Andy Yan" <andyshrk@163.com> wrote:
> Hi=EF=BC=8C
>
> At 2025-01-23 23:09:09, "Jani Nikula" <jani.nikula@intel.com> wrote:
>>The expectation is that the struct drm_device based logging helpers get
>>passed an actual struct drm_device pointer rather than some random
>>struct pointer where you can dereference the ->dev member.
>>
>>Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
>>current usage, but drops "[drm] *ERROR*" prefix from logging.
>
> Frankly, I prefer the original version of the log.
> It is a platform driver, so it should use its own device.
> It is a driver that works in drm subsystem, so it's better to use "[drm] =
*ERROR*" prefix when logging

If you need to do struct device based logging that is not the same
device as the struct drm_device dev member, you need to use dev_err()
and friends. You can't and must not use drm_err() and friends.

It's as simple as that.

The current drm_err(hdmi, ...) usage is simply abuse of the macros, and
must stop.


BR,
Jani.


>
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>>---
>>
>>Looks like it's possible to hunt down the struct drm_device in most of
>>these cases, if that's desired. This was the simplest change.
>>
>>Cc: Sandy Huang <hjc@rock-chips.com>
>>Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
>>Cc: Andy Yan <andy.yan@rock-chips.com>
>>Cc: dri-devel@lists.freedesktop.org
>>Cc: linux-arm-kernel@lists.infradead.org
>>Cc: linux-rockchip@lists.infradead.org
>>---
>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    | 16 ++++++++--------
>> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++--------
>> 2 files changed, 16 insertions(+), 16 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/dr=
m/rockchip/dw_hdmi-rockchip.c
>>index e7a6669c46b0..f737e7d46e66 100644
>>--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>@@ -203,7 +203,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdm=
i *hdmi)
>>=20
>> 	hdmi->regmap =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>> 	if (IS_ERR(hdmi->regmap)) {
>>-		drm_err(hdmi, "Unable to get rockchip,grf\n");
>>+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>> 		return PTR_ERR(hdmi->regmap);
>> 	}
>>=20
>>@@ -214,7 +214,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdm=
i *hdmi)
>> 	if (IS_ERR(hdmi->ref_clk)) {
>> 		ret =3D PTR_ERR(hdmi->ref_clk);
>> 		if (ret !=3D -EPROBE_DEFER)
>>-			drm_err(hdmi, "failed to get reference clock\n");
>>+			dev_err(hdmi->dev, "failed to get reference clock\n");
>> 		return ret;
>> 	}
>>=20
>>@@ -222,7 +222,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdm=
i *hdmi)
>> 	if (IS_ERR(hdmi->grf_clk)) {
>> 		ret =3D PTR_ERR(hdmi->grf_clk);
>> 		if (ret !=3D -EPROBE_DEFER)
>>-			drm_err(hdmi, "failed to get grf clock\n");
>>+			dev_err(hdmi->dev, "failed to get grf clock\n");
>> 		return ret;
>> 	}
>>=20
>>@@ -302,16 +302,16 @@ static void dw_hdmi_rockchip_encoder_enable(struct =
drm_encoder *encoder)
>>=20
>> 	ret =3D clk_prepare_enable(hdmi->grf_clk);
>> 	if (ret < 0) {
>>-		drm_err(hdmi, "failed to enable grfclk %d\n", ret);
>>+		dev_err(hdmi->dev, "failed to enable grfclk %d\n", ret);
>> 		return;
>> 	}
>>=20
>> 	ret =3D regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val=
);
>> 	if (ret !=3D 0)
>>-		drm_err(hdmi, "Could not write to GRF: %d\n", ret);
>>+		dev_err(hdmi->dev, "Could not write to GRF: %d\n", ret);
>>=20
>> 	clk_disable_unprepare(hdmi->grf_clk);
>>-	drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
>>+	dev_dbg(hdmi->dev, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
>> }
>>=20
>> static int
>>@@ -574,7 +574,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, =
struct device *master,
>> 	ret =3D rockchip_hdmi_parse_dt(hdmi);
>> 	if (ret) {
>> 		if (ret !=3D -EPROBE_DEFER)
>>-			drm_err(hdmi, "Unable to parse OF data\n");
>>+			dev_err(hdmi->dev, "Unable to parse OF data\n");
>> 		return ret;
>> 	}
>>=20
>>@@ -582,7 +582,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, =
struct device *master,
>> 	if (IS_ERR(hdmi->phy)) {
>> 		ret =3D PTR_ERR(hdmi->phy);
>> 		if (ret !=3D -EPROBE_DEFER)
>>-			drm_err(hdmi, "failed to get phy\n");
>>+			dev_err(hdmi->dev, "failed to get phy\n");
>> 		return ret;
>> 	}
>>=20
>>diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
>>index f41151d49fca..3d1dddb34603 100644
>>--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>@@ -242,7 +242,7 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_st=
ruct *work)
>> 	if (drm) {
>> 		changed =3D drm_helper_hpd_irq_event(drm);
>> 		if (changed)
>>-			drm_dbg(hdmi, "connector status changed\n");
>>+			dev_dbg(hdmi->dev, "connector status changed\n");
>> 	}
>> }
>>=20
>>@@ -472,7 +472,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>> 		}
>> 	}
>> 	if (hdmi->port_id < 0) {
>>-		drm_err(hdmi, "Failed to match HDMI port ID\n");
>>+		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
>> 		return hdmi->port_id;
>> 	}
>>=20
>>@@ -496,20 +496,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>> 	hdmi->regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node,
>> 						       "rockchip,grf");
>> 	if (IS_ERR(hdmi->regmap)) {
>>-		drm_err(hdmi, "Unable to get rockchip,grf\n");
>>+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>> 		return PTR_ERR(hdmi->regmap);
>> 	}
>>=20
>> 	hdmi->vo_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node,
>> 							  "rockchip,vo-grf");
>> 	if (IS_ERR(hdmi->vo_regmap)) {
>>-		drm_err(hdmi, "Unable to get rockchip,vo-grf\n");
>>+		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
>> 		return PTR_ERR(hdmi->vo_regmap);
>> 	}
>>=20
>> 	ret =3D devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
>> 	if (ret < 0) {
>>-		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
>>+		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
>> 		return ret;
>> 	}
>>=20
>>@@ -517,7 +517,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>> 						    GPIOD_OUT_HIGH);
>> 	if (IS_ERR(hdmi->enable_gpio)) {
>> 		ret =3D PTR_ERR(hdmi->enable_gpio);
>>-		drm_err(hdmi, "Failed to request enable GPIO: %d\n", ret);
>>+		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
>> 		return ret;
>> 	}
>>=20
>>@@ -525,7 +525,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>> 	if (IS_ERR(hdmi->phy)) {
>> 		ret =3D PTR_ERR(hdmi->phy);
>> 		if (ret !=3D -EPROBE_DEFER)
>>-			drm_err(hdmi, "failed to get phy: %d\n", ret);
>>+			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
>> 		return ret;
>> 	}
>>=20
>>@@ -564,7 +564,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>> 	connector =3D drm_bridge_connector_init(drm, encoder);
>> 	if (IS_ERR(connector)) {
>> 		ret =3D PTR_ERR(connector);
>>-		drm_err(hdmi, "failed to init bridge connector: %d\n", ret);
>>+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
>> 		return ret;
>> 	}
>>=20
>>--=20
>>2.39.5
>>
>>
>>_______________________________________________
>>Linux-rockchip mailing list
>>Linux-rockchip@lists.infradead.org
>>http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=20
Jani Nikula, Intel

