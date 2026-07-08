Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvzXlqdntkeYd6Lz6Tq6hR2GvHLprwV8utLcRsUGXgk=; b=XapJrckkOdD0rl0cO+yG8GhSF2
	QQK5ww4O3EtEBtBEP5PUtRwsBuU3OnSTX2p/T/U76oXgXhr4/8l21H+2Xoa4pSz2fSoeLfgwu1Ix3
	tI1ewfwOziVkibsAKDMJfCw2Z9243tQfA9F+K/bfvZquatLITDaGTtiNqkLz1H1MlcbUOwXDUPWwQ
	cSv0DG7pbl7b6LP2G7gMZnIEbNI7piYeWHseR74jflY0PmKSlEHWN+iexi1plKUr9zig3brTAzeWX
	Gu+BpEN3uEbkcXURkPhlFJ1mtlsLVXPz90tatSO3t54KO1w19fSKl1qdm4Abz/BvOGswYM8Zy7hpH
	CynzKzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMhu-0000000GVXw-2DZj;
	Wed, 08 Jul 2026 07:28:34 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMhr-0000000GVXE-1vtY;
	Wed, 08 Jul 2026 07:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783495695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WR5jo7+vNWexm49ePnWJOndMo1YlNnhLvzLsnvOGNkAw7Yqz6+O5R2/lJUMWFmcamZ/p7xmgwbDcps7hG3OHydjhtqfGChWey+1WU8DR8pt9jHvIoFBugPOfWIi+A98szZWp9Z/0FR/eDBIrn0qM1OeQn7L7YZwaUH+sH0oNC0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783495695; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nvzXlqdntkeYd6Lz6Tq6hR2GvHLprwV8utLcRsUGXgk=; 
	b=mD8doOq0sE4gog0+/qNqHVag3+yT/oNYfgA7rNTMtEW8+hFuckEzn1WKuxjwLXX0zuWDXwAa9a/vcfjztyFTLPUm9EVOQCWkDosgDW0EsqTW76lcRl5tXNvQGiTzb7l1vefDIRTFOaETlkKYw7v7jqOQB3/wy4xrW6l6ck7HIJo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783495695;
	s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nvzXlqdntkeYd6Lz6Tq6hR2GvHLprwV8utLcRsUGXgk=;
	b=f4xLgGRkJ2ufgc51CfXJ0UGO08OQ8/7KRgGSsaU+OjaFp0gAMaAOjCAT8UUZbdr7
	DmTR3+gowpM8M5bETqjafQGItxHQWNqHOUKISNrHgLqgMIw+b7fgBEwDWWOOOvk+OoM
	lLCb6NtI5uF8XwI/z0uX+rsESFOkWTGZu2nbDAwU=
Received: by mx.zohomail.com with SMTPS id 1783495694387551.6316499671505;
	Wed, 8 Jul 2026 00:28:14 -0700 (PDT)
Message-ID: <e8384d37-5fb6-442a-b17a-547506abd157@collabora.com>
Date: Wed, 8 Jul 2026 09:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/21] drm: Introduce
 DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
 <20251223-mtk-post-blend-color-pipeline-v3-6-7d969f9a37a0@collabora.com>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-6-7d969f9a37a0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_002831_564179_161C9734 
X-CRM114-Status: GOOD (  25.98  )
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

Hi, thanks for the series!

On 23.12.25 19:01, Ariel D'Alessandro wrote:
> From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
>
> Introduce DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE which a DRM client can set
> to enable the usage of CRTC (post-blend) color pipelines instead of the
> now deprecated CRTC color management properties: "GAMMA_LUT",
> "DEGAMMA_LUT" and "CTM".
>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c   | 20 ++++++++++++++++++++
>   drivers/gpu/drm/drm_connector.c     |  1 +
>   drivers/gpu/drm/drm_crtc_internal.h |  1 +
>   drivers/gpu/drm/drm_ioctl.c         |  9 +++++++++
>   drivers/gpu/drm/drm_mode_object.c   |  9 +++++++++
>   include/drm/drm_file.h              |  7 +++++++
>   include/uapi/drm/drm.h              | 19 +++++++++++++++++++
>   7 files changed, 66 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 07d0d224fe58c..d1bc78b2567a9 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -433,6 +433,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   	if (property == config->prop_active)
>   		state->active = val;
>   	else if (property == crtc->color_pipeline_property) {
> +		if (!file_priv->crtc_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				"Setting COLOR_PIPELINE CRTC property not permitted without DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE client cap\n");
> +			return -EINVAL;
> +		}
>   		/* find DRM colorop object */
>   		struct drm_colorop *colorop = NULL;
>   
> @@ -451,6 +456,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   	} else if (property == config->prop_vrr_enabled) {
>   		state->vrr_enabled = val;
>   	} else if (property == config->degamma_lut_property) {
> +		if (file_priv->crtc_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				"Setting DEGAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE client cap\n");
> +			return -EINVAL;
> +		}
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->degamma_lut,
>   					val,
> @@ -459,6 +469,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		state->color_mgmt_changed |= replaced;
>   		return ret;
>   	} else if (property == config->ctm_property) {
> +		if (file_priv->crtc_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				"Setting CTM CRTC property not permitted with DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE client cap\n");
> +			return -EINVAL;
> +		}
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->ctm,
>   					val,
> @@ -467,6 +482,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		state->color_mgmt_changed |= replaced;
>   		return ret;
>   	} else if (property == config->gamma_lut_property) {
> +		if (file_priv->crtc_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				"Setting GAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE client cap\n");
> +			return -EINVAL;
> +		}
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->gamma_lut,
>   					val,
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 4d6dc9ebfdb5b..aec8a5c0d593a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3440,6 +3440,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
>   	 */
>   	ret = drm_mode_object_get_properties(&connector->base, file_priv->atomic,
>   			file_priv->plane_color_pipeline,
> +			file_priv->crtc_color_pipeline,
>   			(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
>   			(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
>   			&out_resp->count_props);
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index c094092296448..ab02e6295271d 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -164,6 +164,7 @@ void drm_mode_object_unregister(struct drm_device *dev,
>   				struct drm_mode_object *object);
>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				   bool plane_color_pipeline,
> +				   bool crtc_color_pipeline,
>   				   uint32_t __user *prop_ptr,
>   				   uint64_t __user *prop_values,
>   				   uint32_t *arg_count_props);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 2884075660ddd..14746afd82783 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -383,6 +383,15 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
>   			return -EINVAL;
>   		file_priv->plane_color_pipeline = req->value;
>   		break;
> +	case DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE:
> +		if (!file_priv->atomic)
> +			return -EINVAL;
> +		if (req->value > 1)
> +			return -EINVAL;
> +		if (!drm_core_check_feature(dev, DRIVER_CRTC_COLOR_PIPELINE))
> +			return -EINVAL;

For DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE we just solved the equivalent 
problem by checking if drivers actually expose pipelines (see 
https://lore.kernel.org/dri-devel/20260703073230.19982-1-robert.mader@collabora.com/ 
which just landed drm-misc-fixes and is marked for backporting). I 
initially went with the same approach of using a driver feature (see 
https://lore.kernel.org/dri-devel/20260630084229.529682-2-robert.mader@collabora.com/), 
however the explicit check turned out to be both sufficient and simpler. 
Using that approach would allow you to drop the patches 5, 17 and 21.

Regards

> +		file_priv->crtc_color_pipeline = req->value;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index b45d501b10c86..ea4508f6a09a6 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -388,6 +388,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
>   /* helper for getconnector and getproperties ioctls */
>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				   bool plane_color_pipeline,
> +				   bool crtc_color_pipeline,
>   				   uint32_t __user *prop_ptr,
>   				   uint64_t __user *prop_values,
>   				   uint32_t *arg_count_props)
> @@ -416,6 +417,13 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				continue;
>   		}
>   
> +		if (!crtc_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> +			struct drm_crtc *crtc = obj_to_crtc(obj);
> +
> +			if (prop == crtc->color_pipeline_property)
> +				continue;
> +		}
> +
>   		if (*arg_count_props > count) {
>   			ret = __drm_object_property_get_value(obj, prop, &val);
>   			if (ret)
> @@ -475,6 +483,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>   
>   	ret = drm_mode_object_get_properties(obj, file_priv->atomic,
>   			file_priv->plane_color_pipeline,
> +			file_priv->crtc_color_pipeline,
>   			(uint32_t __user *)(unsigned long)(arg->props_ptr),
>   			(uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
>   			&arg->count_props);
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 6ee70ad65e1fd..d0c323378ae46 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -214,6 +214,13 @@ struct drm_file {
>   	 */
>   	bool plane_color_pipeline;
>   
> +	/**
> +	 * @crtc_color_pipeline:
> +	 *
> +	 * True if client understands CRTC (post-blend) color pipelines
> +	 */
> +	bool crtc_color_pipeline;
> +
>   	/**
>   	 * @was_master:
>   	 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index d726828bdf408..991ef14c5377c 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -927,6 +927,25 @@ struct drm_get_cap {
>    */
>   #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
>   
> +/**
> + * DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE
> + *
> + * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
> + * property on a &drm_crtc, as well as drm_colorop properties.
> + *
> + * Setting of these crtc properties will be rejected when this client
> + * cap is set:
> + * - GAMMA_LUT
> + * - DEGAMMA_LUT
> + * - CTM
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This client cap can only be set if the driver sets the corresponding driver
> + * cap &DRM_CAP_CRTC_COLOR_PIPELINE.
> + */
> +#define DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE	8
> +
>   /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>   struct drm_set_client_cap {
>   	__u64 capability;
>
-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


