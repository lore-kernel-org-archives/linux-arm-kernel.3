Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36CCCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 02:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XezuMrCTQbMzbi20T+1rCrxjWanYRbUDYkUJJW/TRwg=; b=dSNx7r/L2AVxMaXCn/EVXmJWrU
	U+7AkDwKDuiaf6dElsIFsqIfukzDuCD5RP0VM/A0zctIcrk/8jDqgsifWfE9DIcXDWzzUfCAIjji2
	Kz8Uk1nov47cW4sfzcyeeplE/qGp+WO62ixcHb78U8/6VWXURAVtQvcLrDLda492C/5XpIDTHuR9q
	g5LDJppg6BD6uBYkHWpwr+erkhg2SzH+nSf8oDMJB2NvIA+ucaBmYarj57dfUggseUe0tyU/5nUPW
	VaHAzH+K/xsRV9mpOM0EDggiRgwyR5vviS9FUMoBrSfwY6wChGncPSIY04r8zlSW0kyCQABmvzIhi
	4avexQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFND7-00000007Rhg-1UMK;
	Sat, 10 Oct 2026 02:53:21 +0000
Received: from mail-m127156.xmail.ntesmail.com ([115.236.127.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFND2-00000007Rgy-2Dx3;
	Sat, 10 Oct 2026 02:53:19 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50848de2e;
	Sat, 10 Oct 2026 10:48:09 +0800 (GMT+08:00)
Message-ID: <80f7ba75-d374-4eae-abfe-d53ec2deb52f@rock-chips.com>
Date: Sat, 10 Oct 2026 10:48:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] drm/atomic: Handle max bpc properties before
 connector state allocation
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Igor Paunovic <royalnet026@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dragon@radxa.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa123b5f22b03a7kunm6360a2b5135bed8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0lCVh4eS0NISB0ZGkIZQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NDDV4FoZEkpnMGy2XPGW8N+gwtaSRGLvEggg0PegiDpBP5UhKFXzFgDGs7vhPjaiOze7Fyi4/WWCLvCSyp2ikyPrx//6pcTMrtVJcxyw9Qaw1Za2AAiM6d2ZWXCVVg5KUlWFQXDDNihwmxL85/LQ5quIpkQDKNopIVW3o7xdwo0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=XezuMrCTQbMzbi20T+1rCrxjWanYRbUDYkUJJW/TRwg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_195317_147164_36747CF1 
X-CRM114-Status: GOOD (  22.03  )
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

Hi Xilin,

On 10/9/2026 11:15 AM, Xilin Wu wrote:
> Allow drivers to attach the max bpc property before allocating connector
> state, as needed by the upcoming non-HDMI bridge connector support.
> Only update the current state when one exists.
> 
> Initialize max_requested_bpc and max_bpc from the attached property default
> when creating connector state. Use drm_object_property_get_default_value()
> rather than the range maximum so that state creation and subsequent resets
> restore the value chosen when attaching the property.
> 
> Cover deferred allocation, existing state and restoration of a default
> that differs from the range maximum in the connector KUnit tests.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c  |  8 +++++
>  drivers/gpu/drm/drm_connector.c            |  6 ++--
>  drivers/gpu/drm/tests/drm_connector_test.c | 53 ++++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index a2ef272e9f27..8352b5a9097a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -494,7 +494,15 @@ void
>  __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
>  					 struct drm_connector *connector)
>  {
> +	u64 val;
> +
>  	conn_state->connector = connector;
> +	if (connector->max_bpc_property &&
> +	    !drm_object_property_get_default_value(&connector->base,
> +						   connector->max_bpc_property, &val)) {
> +		conn_state->max_requested_bpc = val;
> +		conn_state->max_bpc = val;
> +	}
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_state_init);
>  
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 8b4baed060f3..34c30469f405 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2886,8 +2886,10 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  	}
>  
>  	drm_object_attach_property(&connector->base, prop, max);
> -	connector->state->max_requested_bpc = max;
> -	connector->state->max_bpc = max;
> +	if (connector->state) {
> +		connector->state->max_requested_bpc = max;
> +		connector->state->max_bpc = max;
> +	}
> 

And for patch1/2. I don't think it's right way to go.

As comment said: 
drm_connector_attach_max_bpc_property() requires the connector to have a state.

There are two reasons here. First, most drivers follow the convention
described in this comment, but you only modified some of them. Second, 
it appears you are removing the connector state, so the 
"if (connector->state)" check here would always evaluate to false, 
which doesn't seem to make much sense.

>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index beb1d50a6646..1174607441b9 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_kunit_helpers.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_property.h>
>  
>  #include <drm/display/drm_hdmi_helper.h>
>  
> @@ -187,7 +188,59 @@ KUNIT_ARRAY_PARAM(drm_connector_init_type_valid,
>  		  drm_connector_init_type_valid_tests,
>  		  drm_connector_init_type_desc);
>  
> +/* The attached default need not equal the upper end of the property range. */
> +static void drm_test_connector_max_bpc_default(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_property *prop;
> +	int ret;
> +
> +	ret = drmm_connector_init(&priv->drm, connector, &dummy_funcs,
> +				  DRM_MODE_CONNECTOR_DisplayPort, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	prop = drm_property_create_range(&priv->drm, 0, "max bpc", 6, 12);
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	connector->max_bpc_property = prop;
> +	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_NULL(test, connector->state);
> +
> +	drm_mode_config_reset(&priv->drm);
> +	KUNIT_ASSERT_NOT_NULL(test, connector->state);
> +	KUNIT_EXPECT_EQ(test, connector->state->max_requested_bpc, 10);
> +	KUNIT_EXPECT_EQ(test, connector->state->max_bpc, 10);
> +
> +	connector->state->max_requested_bpc = 8;
> +	connector->state->max_bpc = 8;
> +	drm_mode_config_reset(&priv->drm);
> +	KUNIT_ASSERT_NOT_NULL(test, connector->state);
> +	KUNIT_EXPECT_EQ(test, connector->state->max_requested_bpc, 10);
> +	KUNIT_EXPECT_EQ(test, connector->state->max_bpc, 10);
> +}
> +
> +static void drm_test_connector_max_bpc_existing_state(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	struct drm_connector *connector = &priv->connector;
> +	int ret;
> +
> +	ret = drmm_connector_init(&priv->drm, connector, &dummy_funcs,
> +				  DRM_MODE_CONNECTOR_DisplayPort, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	drm_mode_config_reset(&priv->drm);
> +	KUNIT_ASSERT_NOT_NULL(test, connector->state);
> +
> +	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, connector->state->max_requested_bpc, 10);
> +	KUNIT_EXPECT_EQ(test, connector->state->max_bpc, 10);
> +}
> +
>  static struct kunit_case drmm_connector_init_tests[] = {
> +	KUNIT_CASE(drm_test_connector_max_bpc_default),
> +	KUNIT_CASE(drm_test_connector_max_bpc_existing_state),
>  	KUNIT_CASE(drm_test_drmm_connector_init),
>  	KUNIT_CASE(drm_test_drmm_connector_init_null_ddc),
>  	KUNIT_CASE_PARAM(drm_test_drmm_connector_init_type_valid,
> 

-- 
Best, 
Chaoyi

