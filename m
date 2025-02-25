Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4566C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRrgpS00xeUywlxVgpPwc24kauJL/r4chFWYJ/kG1Y0=; b=SBlyhJoZk+b0RNfAgi7Zobpe06
	E4jTKROKGuPRa6g3hhlxUekFGFdrKKgnkTZHdE3mIOgKlkZHhg8DUpC4+tA1GeXLEOoft4gr9SrAq
	rP3e/S16gX9K8UQIX49cqwI3WolyFh78SfFxcPejLT9uwxYxYg8dOn28wp3gk9q8Q8CT9Yi0qpuZI
	VlvEuBWRvE0deTxh7oYLabKqS0m3XAO1ohnIwFwq3tutHZoyii4FNAbYY0eDN2SS1+h8Y88QFBR24
	EVvAtZUIaIFnGOWbhOR5esjXSUSVKa48ydojSnHO/6URmXxAcxCPxdawjWk4mCop3iEHw31+DX8m7
	C4k8nNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0jR-00000001B7i-1bV0;
	Tue, 25 Feb 2025 19:36:41 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0hu-00000001Auc-0yXJ;
	Tue, 25 Feb 2025 19:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740512106; x=1772048106;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=Y0dgq02rrgg6GhOsq8ZPtCl2ibf+lqJ5X0BUAPIsTbA=;
  b=lWmlG+t9fdtlkAOpfDuy4z4+RroUJ/XOeZg6oTUT8NTJaMXn4oZfvOx8
   9zNJkqB4jCNnNidFudhuxLIe3bGJ90yPqxGS1pQno6R0K5+VNiU7iy5I0
   y/lwDAaFsOPZq78MNmZYpKCTF5rgVsYZthMMtcEeBvjV9D4Yw8ah8+XYT
   ezf6aVBhvFDGA201mpjw2WF4o7la+XDjiC/SZzofOcYuDOMAUTtvmgBu5
   9HhILWIA0hxVuVmQTaY9GS8TxJNHsSMkCFo+iFm0AuTdPJLIOSZHKWxUr
   vQSOmk1uerSqGl3F4+2S+BrSMnYoGWJmWTj0SXXzK/ae1Cse01OABhted
   g==;
X-CSE-ConnectionGUID: 8K2J5sagSgGnCHocpj1TQg==
X-CSE-MsgGUID: AIuYiKbJTSy5sQ5YwMOQ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41465288"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41465288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 11:35:05 -0800
X-CSE-ConnectionGUID: qrC/vWxRRZ2hkAfLY3GMYA==
X-CSE-MsgGUID: rpKIiapzTxKqUpXFTcgExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116263364"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.246])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 11:35:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, sam@ravnborg.org, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>
Subject: Re:Re:[PATCH 2/5] drm/rockchip: stop passing non struct drm_device
 to drm_err() and friends
In-Reply-To: <730ee1d4.f63.1949b97fc99.Coremail.andyshrk@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
 <2c0a76c3.618c.19497bb4329.Coremail.andyshrk@163.com>
 <87plkcbfp0.fsf@intel.com>
 <730ee1d4.f63.1949b97fc99.Coremail.andyshrk@163.com>
Date: Tue, 25 Feb 2025 21:34:58 +0200
Message-ID: <87wmdd4y3h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_113506_370753_74C50F83 
X-CRM114-Status: GOOD (  17.17  )
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

On Sat, 25 Jan 2025, "Andy Yan" <andyshrk@163.com> wrote:
> =E5=9C=A8 2025-01-24 19:43:07=EF=BC=8C"Jani Nikula" <jani.nikula@intel.co=
m> =E5=86=99=E9=81=93=EF=BC=9A
>>On Fri, 24 Jan 2025, "Andy Yan" <andyshrk@163.com> wrote:
>>> Hi=EF=BC=8C
>>>
>>> At 2025-01-23 23:09:09, "Jani Nikula" <jani.nikula@intel.com> wrote:
>>>>The expectation is that the struct drm_device based logging helpers get
>>>>passed an actual struct drm_device pointer rather than some random
>>>>struct pointer where you can dereference the ->dev member.
>>>>
>>>>Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
>>>>current usage, but drops "[drm] *ERROR*" prefix from logging.
>>>
>>> Frankly, I prefer the original version of the log.
>>> It is a platform driver, so it should use its own device.
>>> It is a driver that works in drm subsystem, so it's better to use "[drm=
] *ERROR*" prefix when logging
>>
>>If you need to do struct device based logging that is not the same
>>device as the struct drm_device dev member, you need to use dev_err()
>>and friends. You can't and must not use drm_err() and friends.
>>
>>It's as simple as that.
>>
>>The current drm_err(hdmi, ...) usage is simply abuse of the macros, and
>>must stop.
>
> Perhaps when you initially designed this macros, you intended it to accep=
t only drm_device,=20
> but your code implementation didn't enforce this restriction at the begin=
ning.
> If that's truly what you intended, I suggest just reverting this commit t=
hat converting to use these macros[0],=20
> as neither drm_err nor dev_err can maintain consistency with the original=
 log of this driver.
> Alternatively, as suggested by Sam  in the initial submission of your pat=
ch 5 years ago,=20
> there should also be a macro similar to drm_dev_info(device *, ..).[1]

Commit 1b8f576c6958 ("drm/rockchip: dw_hdmi: Use modern drm_device based
logging") does not revert cleanly, and even if it did, DRM_DEV_ERROR()
is deprecated in favour of drm_err() or dev_err(). I'm using the latter.

Ack for applying the patch at hand as-is?

BR,
Jani.




>
>
> [0]https://lore.kernel.org/linux-rockchip/20240813-dw-hdmi-rockchip-clean=
up-v1-1-b3e73b5f4fd6@collabora.com/
> [1]https://lore.kernel.org/dri-devel/20191212215303.GA11520@ravnborg.org/
>
>>
>>
>>BR,
>>Jani.
>>
>>
>>>
>>>>
>>>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>>---
>>>>
>>>>Looks like it's possible to hunt down the struct drm_device in most of
>>>>these cases, if that's desired. This was the simplest change.
>>>>
>>>>Cc: Sandy Huang <hjc@rock-chips.com>
>>>>Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
>>>>Cc: Andy Yan <andy.yan@rock-chips.com>
>>>>Cc: dri-devel@lists.freedesktop.org
>>>>Cc: linux-arm-kernel@lists.infradead.org
>>>>Cc: linux-rockchip@lists.infradead.org
>>>>---
>>>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    | 16 ++++++++--------
>>>> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++--------
>>>> 2 files changed, 16 insertions(+), 16 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/=
drm/rockchip/dw_hdmi-rockchip.c
>>>>index e7a6669c46b0..f737e7d46e66 100644
>>>>--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>@@ -203,7 +203,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_h=
dmi *hdmi)
>>>>=20
>>>> 	hdmi->regmap =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>>>> 	if (IS_ERR(hdmi->regmap)) {
>>>>-		drm_err(hdmi, "Unable to get rockchip,grf\n");
>>>>+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>>>> 		return PTR_ERR(hdmi->regmap);
>>>> 	}
>>>>=20
>>>>@@ -214,7 +214,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_h=
dmi *hdmi)
>>>> 	if (IS_ERR(hdmi->ref_clk)) {
>>>> 		ret =3D PTR_ERR(hdmi->ref_clk);
>>>> 		if (ret !=3D -EPROBE_DEFER)
>>>>-			drm_err(hdmi, "failed to get reference clock\n");
>>>>+			dev_err(hdmi->dev, "failed to get reference clock\n");
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>@@ -222,7 +222,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_h=
dmi *hdmi)
>>>> 	if (IS_ERR(hdmi->grf_clk)) {
>>>> 		ret =3D PTR_ERR(hdmi->grf_clk);
>>>> 		if (ret !=3D -EPROBE_DEFER)
>>>>-			drm_err(hdmi, "failed to get grf clock\n");
>>>>+			dev_err(hdmi->dev, "failed to get grf clock\n");
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>@@ -302,16 +302,16 @@ static void dw_hdmi_rockchip_encoder_enable(struc=
t drm_encoder *encoder)
>>>>=20
>>>> 	ret =3D clk_prepare_enable(hdmi->grf_clk);
>>>> 	if (ret < 0) {
>>>>-		drm_err(hdmi, "failed to enable grfclk %d\n", ret);
>>>>+		dev_err(hdmi->dev, "failed to enable grfclk %d\n", ret);
>>>> 		return;
>>>> 	}
>>>>=20
>>>> 	ret =3D regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, v=
al);
>>>> 	if (ret !=3D 0)
>>>>-		drm_err(hdmi, "Could not write to GRF: %d\n", ret);
>>>>+		dev_err(hdmi->dev, "Could not write to GRF: %d\n", ret);
>>>>=20
>>>> 	clk_disable_unprepare(hdmi->grf_clk);
>>>>-	drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
>>>>+	dev_dbg(hdmi->dev, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
>>>> }
>>>>=20
>>>> static int
>>>>@@ -574,7 +574,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev=
, struct device *master,
>>>> 	ret =3D rockchip_hdmi_parse_dt(hdmi);
>>>> 	if (ret) {
>>>> 		if (ret !=3D -EPROBE_DEFER)
>>>>-			drm_err(hdmi, "Unable to parse OF data\n");
>>>>+			dev_err(hdmi->dev, "Unable to parse OF data\n");
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>@@ -582,7 +582,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev=
, struct device *master,
>>>> 	if (IS_ERR(hdmi->phy)) {
>>>> 		ret =3D PTR_ERR(hdmi->phy);
>>>> 		if (ret !=3D -EPROBE_DEFER)
>>>>-			drm_err(hdmi, "failed to get phy\n");
>>>>+			dev_err(hdmi->dev, "failed to get phy\n");
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/g=
pu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>>index f41151d49fca..3d1dddb34603 100644
>>>>--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>>+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>>@@ -242,7 +242,7 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_=
struct *work)
>>>> 	if (drm) {
>>>> 		changed =3D drm_helper_hpd_irq_event(drm);
>>>> 		if (changed)
>>>>-			drm_dbg(hdmi, "connector status changed\n");
>>>>+			dev_dbg(hdmi->dev, "connector status changed\n");
>>>> 	}
>>>> }
>>>>=20
>>>>@@ -472,7 +472,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>>>> 		}
>>>> 	}
>>>> 	if (hdmi->port_id < 0) {
>>>>-		drm_err(hdmi, "Failed to match HDMI port ID\n");
>>>>+		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
>>>> 		return hdmi->port_id;
>>>> 	}
>>>>=20
>>>>@@ -496,20 +496,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device=
 *dev, struct device *master,
>>>> 	hdmi->regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node,
>>>> 						       "rockchip,grf");
>>>> 	if (IS_ERR(hdmi->regmap)) {
>>>>-		drm_err(hdmi, "Unable to get rockchip,grf\n");
>>>>+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>>>> 		return PTR_ERR(hdmi->regmap);
>>>> 	}
>>>>=20
>>>> 	hdmi->vo_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node,
>>>> 							  "rockchip,vo-grf");
>>>> 	if (IS_ERR(hdmi->vo_regmap)) {
>>>>-		drm_err(hdmi, "Unable to get rockchip,vo-grf\n");
>>>>+		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
>>>> 		return PTR_ERR(hdmi->vo_regmap);
>>>> 	}
>>>>=20
>>>> 	ret =3D devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
>>>> 	if (ret < 0) {
>>>>-		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
>>>>+		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>@@ -517,7 +517,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>>>> 						    GPIOD_OUT_HIGH);
>>>> 	if (IS_ERR(hdmi->enable_gpio)) {
>>>> 		ret =3D PTR_ERR(hdmi->enable_gpio);
>>>>-		drm_err(hdmi, "Failed to request enable GPIO: %d\n", ret);
>>>>+		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>@@ -525,7 +525,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>>>> 	if (IS_ERR(hdmi->phy)) {
>>>> 		ret =3D PTR_ERR(hdmi->phy);
>>>> 		if (ret !=3D -EPROBE_DEFER)
>>>>-			drm_err(hdmi, "failed to get phy: %d\n", ret);
>>>>+			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>@@ -564,7 +564,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>>>> 	connector =3D drm_bridge_connector_init(drm, encoder);
>>>> 	if (IS_ERR(connector)) {
>>>> 		ret =3D PTR_ERR(connector);
>>>>-		drm_err(hdmi, "failed to init bridge connector: %d\n", ret);
>>>>+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>=20
>>>>--=20
>>>>2.39.5
>>>>
>>>>
>>>>_______________________________________________
>>>>Linux-rockchip mailing list
>>>>Linux-rockchip@lists.infradead.org
>>>>http://lists.infradead.org/mailman/listinfo/linux-rockchip
>>
>>--=20
>>Jani Nikula, Intel

--=20
Jani Nikula, Intel

