Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AE8D5E122
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNUHUNW3N94KhZGI0JJqHmpslwXn3uHqqi//pMXWTvY=; b=L1xSsKe7+4crh9FHzTMp2dsuFE
	dFQpOEx3pNO99LI90nWxTd973OBtETxAFLLqfW7gaZLNDcpiaqsyj06wlDiA3YjPGjqe1He39YuGP
	NPCh1x654vjqB+4Zs9sZ9bSn5WSFZVcVpa4wsC7k03qBOcBxLQqY3SLxlliS0/8yzP4M+U5BKEmK7
	ztZYP4Mp2LC5D1dubHgejdgn/BKDlV+CQ/7kg3uFuylohqakY//egtYmy7udPuOjkLX/CBRUPQR/n
	yHqMvDLCKmP0+IAiKfXvxT2rjMLkg5l3Zdzf7cU9VYWj3hyRBKP85AUX69+H70XAx+eLt1MKSFNkC
	DaNH7e4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9fgo-0000000Cqyg-44tj;
	Sat, 09 Nov 2024 07:15:22 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ff2-0000000CqqL-1qJD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 07:13:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539e7e73740so2732589e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 23:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731136410; x=1731741210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNUHUNW3N94KhZGI0JJqHmpslwXn3uHqqi//pMXWTvY=;
        b=hoxPIeR8hwOoKUjlfH1knizgixuPwIBRb2rC9A8OqziHnsZ0cPzLl0JbYSxwDthTey
         +YP97hQfg3oFKF8erwQted64gQ7NNLHdqL4lTBV+6Sm1uW71c3HWNRi2SiQpT4bWzePT
         cFtVnAyZUHA3rV/bO3EsNlUtLrxSXoif9lzVnnpgL2fBymi8+EyS6XOes4KQp6BsD9gO
         XKnyFNjtEPLAweVzxa24VrkI6xWrppbP6s8QVzW+X6nm3s4qKAGBgv1UZeZAWhX6JGnO
         LZgNvZDE/Gv1t8CsSr6Ahr0UdfxD3Et9ykrwEHnKGYnngDTICj9NHH8OdNBOZKtZX4Kd
         hfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731136410; x=1731741210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNUHUNW3N94KhZGI0JJqHmpslwXn3uHqqi//pMXWTvY=;
        b=Eqn2SygtkN7lqn+W/WiKMEbs9qmB8n8BY4znP3nOwyaGB4NTSLNzb2JWTOEhBxtjtt
         oTLhCxT9JgRI82lCIF5eNxTec3d6E4OVyYy1yuZP0An9BK14EIOxIePNPj3Cnr7NIIpD
         CShjnETLRo3Tf7fv/yE3UznMSe72mpH9MSA0oy1nY87dYxlgbOkJqlZPIJN/UtQmb5p9
         2UcBHylbVvx138Q5FR6KcM4sp/1Ny6uljgLJ879aTLVN1JflSrBVdJ08IurbBIFVOJIB
         0Btha5iAZI11dXCq4/hR8rpP0e136uVJP8YJpwv933k8N0mkfPlbDu7L0mFQ+PD/EpWq
         138Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwcQU2FEA2zvXV1QIcIMCYBaODkbsUqVLDVQ1nUZgLAvVFL4e67sVqwgEW1a8qLzGNXTvLuHeivcdDSDY2urdW@lists.infradead.org
X-Gm-Message-State: AOJu0YxObCSAgkiM1bxU74uojSP30SkEkDXnQuLH3xOTkjZI9XOPtQFb
	PJqOhdB1IAzeD5aqn1bf56esEyPIb94zHrw1Z3d1GeBBXF0+DRfmzj8t1dHEVEE=
X-Google-Smtp-Source: AGHT+IELVyqCmpJuWdmxqNJGcDVWXJacjDsFRR3SZdVXZ+ml1eAxfT8jopEjNHnnwf1zbuasIuxsXg==
X-Received: by 2002:a05:6512:401d:b0:539:f922:bd4e with SMTP id 2adb3069b0e04-53d86231852mr2709861e87.23.1731136409613;
        Fri, 08 Nov 2024 23:13:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d8267847fsm861315e87.2.2024.11.08.23.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 23:13:29 -0800 (PST)
Date: Sat, 9 Nov 2024 09:13:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/6] drm/display: hdmi: add generic mode_valid helper
Message-ID: <vilmhcvixztpseh2uo5sdc7zzhfmexctfnd4aeahy2pui76ntr@kbswbxi347zg>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
 <20241101-hdmi-mode-valid-v2-1-a6478fd20fa6@linaro.org>
 <20241108-certain-kickass-goshawk-a3c596@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-certain-kickass-goshawk-a3c596@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_231332_519437_9BE0E6E6 
X-CRM114-Status: GOOD (  34.84  )
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

On Fri, Nov 08, 2024 at 03:17:22PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Nov 01, 2024 at 02:25:04AM +0200, Dmitry Baryshkov wrote:
> > Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> > It can be either used directly or as a part of the .mode_valid callback.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
> >  drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
> >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
> >  include/drm/display/drm_hdmi_helper.h              |   4 +
> >  5 files changed, 229 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..560c5d4365ca54d3f669395349cedfd6f75fa033 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -9,6 +9,8 @@
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_property.h>
> >  
> > +#include "drm_hdmi_helper_internal.h"
> > +
> >  static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
> >  {
> >  	return sink_eotf & BIT(output_eotf);
> > @@ -256,3 +258,46 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> >  	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
> >  }
> >  EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> > +
> > +enum drm_mode_status
> > +__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
> > +				 const struct drm_display_mode *mode,
> > +				 unsigned long long clock)
> > +{
> > +	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> > +	const struct drm_display_info *info = &connector->display_info;
> > +
> > +	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (funcs && funcs->tmds_char_rate_valid) {
> > +		enum drm_mode_status status;
> > +
> > +		status = funcs->tmds_char_rate_valid(connector, mode, clock);
> > +		if (status != MODE_OK)
> > +			return status;
> > +	}
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +/**
> > + * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
> > + * @connector: DRM connector to validate the mode
> > + * @mode: Display mode to validate
> > + *
> > + * Generic .mode_valid implementation for HDMI connectors.
> > + */
> > +enum drm_mode_status
> > +drm_hdmi_connector_mode_valid(struct drm_connector *connector,
> > +			      struct drm_display_mode *mode)
> > +{
> > +	unsigned long long clock;
> > +
> > +	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> > +	if (!clock)
> > +		return MODE_ERROR;
> > +
> > +	return __drm_hdmi_connector_clock_valid(connector, mode, clock);
> > +}
> > +EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
> 
> It's not clear to me why you want to place it in drm_hdmi_helper? It's
> relying quite heavily on the HDMI infrastructure, so it would make more
> sense to me that it would be part of drm_hdmi_state_helper.c.

Yeah, I hesitated a bit. I selected drm_hdmi_helper.c because it doesn't
use state-related functions. As such it is usable even by the drivers
which imlement just the basic HDMI Connector functions and don't use the
reset of the framework.

ANyway, I'll move it to drm_hdmi_state_helper.c.

> 
> > diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> > index 34ee95d41f2966ab23a60deb37d689430f6b0985..8640e7280053bd95852f53b92159f493b141f2bf 100644
> > --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> > @@ -43,10 +43,12 @@ struct drm_atomic_helper_connector_hdmi_priv {
> >  static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
> >  {
> >  	struct drm_device *drm = connector->dev;
> > -	struct drm_display_mode *mode, *preferred;
> > +	struct drm_display_mode *mode, *preferred = NULL;
> >  
> >  	mutex_lock(&drm->mode_config.mutex);
> > -	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
> > +	if (!list_empty(&connector->modes))
> > +		preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
> > +
> 
> What is this fixing?

If connector->modes is empty (e.g. because of the tmds_char_rate_valid()
rejecting all of them) then just list_first_entry() will result in an
invalid mode being assigned to preferred.

> 
> >  	list_for_each_entry(mode, &connector->modes, head)
> >  		if (mode->type & DRM_MODE_TYPE_PREFERRED)
> >  			preferred = mode;
> > @@ -125,6 +127,18 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
> >  	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
> >  };
> >  
> > +static enum drm_mode_status
> > +reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
> > +					     const struct drm_display_mode *mode,
> > +					     unsigned long long tmds_rate)
> > +{
> > +	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
> > +}
> > +
> > +static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
> > +	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
> > +};
> > +
> >  static int dummy_connector_get_modes(struct drm_connector *connector)
> >  {
> >  	struct drm_atomic_helper_connector_hdmi_priv *priv =
> > @@ -147,6 +161,33 @@ static int dummy_connector_get_modes(struct drm_connector *connector)
> >  static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
> >  	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
> >  	.get_modes	= dummy_connector_get_modes,
> > +	.mode_valid		= drm_hdmi_connector_mode_valid,
> > +};
> > +
> > +static int dummy_connector_get_modes_100MHz_max_clock(struct drm_connector *connector)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv =
> > +		connector_to_priv(connector);
> > +	const struct drm_edid *edid;
> > +	unsigned int num_modes;
> > +
> > +	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
> > +	if (!edid)
> > +		return -EINVAL;
> > +
> > +	drm_edid_connector_update(connector, edid);
> > +	connector->display_info.max_tmds_clock = 100 * 1000;
> > +	num_modes = drm_edid_connector_add_modes(connector);
> > +
> > +	drm_edid_free(edid);
> > +
> > +	return num_modes;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs dummy_connector_helper_funcs_max_tmds_clock = {
> > +	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
> > +	.get_modes	= dummy_connector_get_modes_100MHz_max_clock,
> > +	.mode_valid		= drm_hdmi_connector_mode_valid,
> >  };
> >  
> >  static void dummy_hdmi_connector_reset(struct drm_connector *connector)
> > @@ -1734,9 +1775,132 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
> >  	.test_cases	= drm_atomic_helper_connector_hdmi_reset_tests,
> >  };
> >  
> > +static void drm_test_check_mode_valid(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> > +
> > +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
> > +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
> > +	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
> > +}
> > +
> > +static void drm_test_check_mode_valid_reject(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +	struct drm_device *drm;
> > +	int ret;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +
> > +	/* You shouldn't be doing that at home. */
> > +	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
> > +
> > +	priv->current_edid = test_edid_hdmi_1080p_rgb_max_200mhz;
> > +	priv->current_edid_len = ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz);
> > +
> > +	drm = &priv->drm;
> > +
> > +	mutex_lock(&drm->mode_config.mutex);
> > +	ret = conn->funcs->fill_modes(conn, 4096, 4096);
> > +	mutex_unlock(&drm->mode_config.mutex);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NULL(test, preferred);
> > +}
> > +
> > +static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +	int ret;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +
> > +	/* You shouldn't be doing that at home. */
> > +	conn->hdmi.funcs = &reject_100_MHz_connector_hdmi_funcs;
> > +
> > +	ret = set_connector_edid(test, conn,
> > +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> > +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> > +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
> > +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
> > +	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
> > +}
> > +
> > +static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +	int ret;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +
> > +	drm_connector_helper_add(conn, &dummy_connector_helper_funcs_max_tmds_clock);
> > +
> > +	ret = set_connector_edid(test, conn,
> > +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> > +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> > +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
> > +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
> > +	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
> > +}
> > +
> > +static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
> > +	KUNIT_CASE(drm_test_check_mode_valid),
> > +	KUNIT_CASE(drm_test_check_mode_valid_reject),
> > +	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
> > +	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
> > +	{ }
> > +};
> > +
> > +static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite = {
> > +	.name		= "drm_atomic_helper_connector_hdmi_mode_valid",
> > +	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
> > +};
> > +
> 
> We need some documentation for these tests too, and what you're trying
> to test exactly with that 100MHz cutout.

I'll add a comment. Basically, I'm checking that
drm_hdmi_connector_mode_valid() actually rejects modes based on the
tmds_char_rate_valid() or on the info->max_tmds_clock.

> 
> Maxime



-- 
With best wishes
Dmitry

