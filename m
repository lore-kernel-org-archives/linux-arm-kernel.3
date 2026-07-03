Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA4EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WphAaBfcRlWYgnvRJcxXsFzhs3SYzfpc6/ER6PZ0Go=; b=XuiHqpbvYwlNV1+txkSuDF+YSW
	1ME/SnDUmxm90pY4iASOkoPu5PwfXYrJ2d4D5FEHmu4eD3ngF2/4o/LqqgDQa/+p0Rm3i5ewzAfnm
	tyhCnQaAVE6E1rj9SdYpcF4o4AhikdSshu+LFUFpMBiLdcs+lUa/L/GVHkCV7L3fvjGxCSkmuh4Bp
	5/MOPoK8Acb99wz24pEFL4hIXzW05UAlSdbO9JPPhE3MKRXcwOzPc+xPXuQyb+FOnONuv+Eq1BciX
	10SCoaJcE1BIwurTOppPdwSWMITiDYreWR8qGk+VHoLVmUfpg8HUwW+m8Hh2En5NalNX71OtzCExp
	NbvUNmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeW7-00000007CXN-2iUm;
	Fri, 03 Jul 2026 14:05:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeW4-00000007CWH-1DQG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:05:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BjB8U3053370
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 14:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8WphAaBfcRlWYgnvRJcxXsFz
	hs3SYzfpc6/ER6PZ0Go=; b=K9VVEkD2rLMkBv7y7tp3n6q3nGwYMBWOzCMev1xY
	nsscDr+wwL2XtQKkAP32ur5++LQkZEkOe1NYeATQmEaJUJ0ptqpBUdJRGXtgO5+i
	GiKsu8wRDdReHmFFYzDepdZCvhY256FS/Q74LQ5Rqt54d1zdBMfcONdyZsFb/RXF
	ZK8bjekOyEIQt5RaoiIVtFuJMaXw1u9JwKM4fBCXKqi7LGrS8LeuqUQCdTxwODWo
	Asr6vrgrVDYVD98bLtMlc9gBHmQWcNHaOqEoPumQqyzU+di3nEsB21HULmOynh8e
	2XdWocKCx8imEU6vNuIZiUT+VstS6ZgeFsJb1ee3nxn3tA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01r9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 14:05:15 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-486e64c8edeso348380b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 07:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783087515; x=1783692315; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8WphAaBfcRlWYgnvRJcxXsFzhs3SYzfpc6/ER6PZ0Go=;
        b=kM25MLxptgt/5X3u/boc3zkVcadi1vXt+2V79r2TJov2WD5A1ZlfuXHXzVat/5Um04
         DgnC6ovGGLga5ugqeVRb/TMKNzvbn57roqRCkCqsOVhj7IHmQkK7VPjhA6yAV3frZhxu
         G3eYMgSi+uyseTWm1kuupoLX0SBGqCRfOKvjxh8GeB4PxcaOBcqx6oKHHeVDoDNdwRzY
         D7x+L4lxfGgytzuSctMB93Oi10c8kY6wXZf6jJ1PXiKgZtBke3hdc9l0B7/NRdGLV9O/
         nJPAcEpkKk1Q2OAlP2Wyk+rlHtf7f/8WoPRVduG7XSQi+zAAO7GteHuw023F9TFloX4D
         BxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783087515; x=1783692315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WphAaBfcRlWYgnvRJcxXsFzhs3SYzfpc6/ER6PZ0Go=;
        b=i9WA1EY0kmvLqF8dAFDjNMIa+OmydatvNVZDJqqj6fdLShiMNMxkv8pPZkbFAyYin/
         Apu7kn07YVuMlwxTAzqiV3Y3H45+yID/FxXrjPVwHo3za6RzHHRQtJRQ8aBjBgGL8azM
         7m3kLMSL+yeTE03yWuh86KgFnXwYL4YR4rVresHKfLCy6rEalXLHQjnriDrIgwhm3IxJ
         ov3m2e/nFruawYLObvs3w33alF+zGXrOZ7A0ATFpuEH+kgGtTqkGu34Htvtybf/i0QZJ
         eSq+kcynUiue0SO0rb4+m6hUQsD9T5Zi7cuDg3ZPTpSFtx1eW8agAqkw2NJ1dlOsaNZ8
         jiBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CRm2I4QO44LiDupl1+nGDo51YdMPASvaiEzMM4pw+qOdgj7KKVGbS3G2egKvZgc0zj2a84ykQiS+MUw1CAYBG@lists.infradead.org
X-Gm-Message-State: AOJu0YwtqZsrIzUhsmg58ScbC9HhAB2WzmSZ9SqblaTh6rrVyoZxFwml
	zVFYKm1L9nmIfvUNXQgwwHANxawMWZpD8pVce1XtsEG63YOC45BZQQYwSQK4iKrWdEMPBUxGX0z
	RC7SxOXX4OHnCPYSI60alZYeuakMZans4XW1Be/aLg0Ulsv1Pw0xxb0FPcZXOFu3Pq2UOUCxNJF
	dAwcmb3xR+mA==
X-Gm-Gg: AfdE7cla+lCwkFNrV7h9gn0uTnUREovpojUzYjOEoy1e9vjHWRm4PoAAUTHHBjnhXiL
	d4c2QuqXTWJZJq7rjRBwDIptNJnbx2DPp666rUMfG4tkidb8svE1/vTc25YCLaT1i6+0uXAQumV
	U4AL2EyN2v97CYhf/HQm8i5m0Ibb1pbnXa0TedRVR9dAfXjoYb3imkkLuYC46PInj+YzOToDUvF
	tUoDnGTcOYNRTz11U0+ljuxn0+Z+Y/IX87raqPuiqploZyXCFlfaq18oI0XMfndEcsPN3/pGY3F
	svFsEZ6fCz2bJJD9czd8GxrD9uOvcNduMOY54GIyNehUosKA87yc+Y9gceCCWzdJQZONii+iHZ7
	tfsTF4PLjwlp9uwfKijFGZuSAJsmbwR9iUhSPYaAj8VeHl3HQkAR0z9KeRU6kHAVu36nP4t8gGi
	BzIOg4z1Y3siLVitC020skqTjb
X-Received: by 2002:a05:6808:f8b:b0:495:f74a:4080 with SMTP id 5614622812f47-4960ed97758mr7337404b6e.15.1783087514644;
        Fri, 03 Jul 2026 07:05:14 -0700 (PDT)
X-Received: by 2002:a05:6808:f8b:b0:495:f74a:4080 with SMTP id 5614622812f47-4960ed97758mr7337318b6e.15.1783087513937;
        Fri, 03 Jul 2026 07:05:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5d1dsm3358161fa.27.2026.07.03.07.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:05:12 -0700 (PDT)
Date: Fri, 3 Jul 2026 17:05:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 02/39] drm/connector: Add caps-based HDMI connector
 init helper
Message-ID: <i4tjtsf5rsckfcayo5nuhlger5wqxn3ujeaubm4g2fgrwvhzb2@hf4uhgq3ja5p>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-2-d79890d00b6a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-2-d79890d00b6a@collabora.com>
X-Proofpoint-GUID: z4zJvLZSwbMNns5eLDP34rf3zzj0-i7e
X-Proofpoint-ORIG-GUID: z4zJvLZSwbMNns5eLDP34rf3zzj0-i7e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzOSBTYWx0ZWRfX4AdEUuzjxhJl
 Ew/sWyBbBIjXWqarHk3ag4dB8Xs1ZYDI5cBK0WdP0mKyK6XNtPncU884ARAcbPfD0Tl7cCWaN28
 xVUlI3r7Rra0tJLsl7ioin8IGfKI7Qo=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47c19b cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=W2josiyckoAQp7urw8cA:9 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzOSBTYWx0ZWRfXxbiss6RjAIRx
 bNUmqDWb5WXZ9pN0ZgGPq8l6ZU/avZLHZB0C0f7WCQXLjF8SiEExYXrSsEGK92R6Ij/hGJrB983
 AnycfeQzjSsYxicN50wvOMyiWR1/Am9lmA3bNLf9UJC1UkF79FhA7sdHuO60MlmES8S5x7nP40R
 vHPIbivV5yMAeBQ5BEbDeg7zHjnefsOjAKL6MuO5UlO3dXDQZKTFRGbyrF+WzP80vzWWuh+yM4D
 PnZx5l7rfbSaLpPjHgi6bBbTNbqKGBlQ7MGGYAiBdFDLVWaps1akVoNtgD2XZZG1hfSnn1oLzzv
 fRLGNv2F/h3WPepfaxQWBz65lu2ExOU0aM893Izl47ODps9duyY+r3Od3Y0ticyGkUPzOlp8iX3
 uJifKGCB6Mq1MtGbG4Uc7GiRtL55g0sxel3OZXTQxdRqPxhJRRbmFLA2lbwc+1jy+oQL+1e5Quj
 i3BMD153kQGbPQjwbdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_070516_337408_393E4AFE 
X-CRM114-Status: GOOD (  34.66  )
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

On Thu, Jul 02, 2026 at 05:46:15PM +0300, Cristian Ciocaltea wrote:
> In preparation for adding HDMI 2.x source capabilities, introduce struct
> drm_connector_hdmi_caps and a new drmm_connector_hdmi_init_with_caps()
> helper.
> 
> The existing drmm_connector_hdmi_init() helper currently takes
> individual capability arguments such as supported_formats and max_bpc.
> Adding more HDMI-specific arguments to that function would not scale
> well, so move those values into a dedicated capabilities structure and
> implement the existing helper as a wrapper around the new caps-based
> interface.

I think, it was an intention of Maxime: make sure that every driver is
forced to provide some values here. With the struct-based init it is
easy to overlook or to ommit a value.

> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 202 +++++++++++++++++++++++++++-------------
>  include/drm/drm_connector.h     |  55 +++++++++++
>  2 files changed, 193 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 8b4baed060f3..c7ce6b7bd8b0 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -542,6 +542,137 @@ int drmm_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_connector_init);
>  
> +/**
> + * drmm_connector_hdmi_init_with_caps - Init a preallocated HDMI connector
> + * @dev: DRM device
> + * @connector: A pointer to the HDMI connector to init
> + * @vendor: HDMI Controller Vendor name
> + * @product: HDMI Controller Product name
> + * @funcs: callbacks for this connector
> + * @hdmi_funcs: HDMI-related callbacks for this connector
> + * @connector_type: user visible type of the connector
> + * @ddc: optional pointer to the associated ddc adapter
> + * @caps: optional HDMI connector capabilities
> + *
> + * Initialises a preallocated HDMI connector. Connectors can be
> + * subclassed as part of driver connector objects.
> + *
> + * Cleanup is automatically handled with a call to
> + * drm_connector_cleanup() in a DRM-managed action.
> + *
> + * The connector structure should be allocated with drmm_kzalloc().
> + *
> + * The @drm_connector_funcs.destroy hook must be NULL.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drmm_connector_hdmi_init_with_caps(struct drm_device *dev,
> +				       struct drm_connector *connector,
> +				       const char *vendor, const char *product,
> +				       const struct drm_connector_funcs *funcs,
> +				       const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +				       int connector_type,
> +				       struct i2c_adapter *ddc,
> +				       const struct drm_connector_hdmi_caps *caps)
> +{
> +	int ret;
> +
> +	if (!vendor || !product)
> +		return -EINVAL;
> +
> +	if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
> +	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> +		return -EINVAL;
> +
> +	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
> +		return -EINVAL;
> +
> +	if (!caps)
> +		return -EINVAL;
> +
> +	if (!caps->supported_formats ||
> +	    !(caps->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444)))
> +		return -EINVAL;
> +
> +	if (connector->ycbcr_420_allowed !=
> +	    !!(caps->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420)))
> +		return -EINVAL;
> +
> +	if (!(caps->max_bpc == 8 || caps->max_bpc == 10 || caps->max_bpc == 12))
> +		return -EINVAL;
> +
> +	if (!hdmi_funcs->avi.clear_infoframe ||
> +	    !hdmi_funcs->avi.write_infoframe ||
> +	    !hdmi_funcs->hdmi.clear_infoframe ||
> +	    !hdmi_funcs->hdmi.write_infoframe)
> +		return -EINVAL;
> +
> +	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> +	if (ret)
> +		return ret;
> +
> +	connector->hdmi.supported_formats = caps->supported_formats;
> +
> +	/*
> +	 * The supported HDMI version can be used to infer the maximum TMDS
> +	 * character rate allowed by the specification. Some controllers,
> +	 * however, may support a lower rate than that version would imply.
> +	 *
> +	 * A non-zero caps->max_tmds_char_rate lets drivers override the
> +	 * inferred limit with the actual controller capability. A value of
> +	 * zero keeps the default limit inferred from supported_hdmi_ver.
> +	 */
> +	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0)
> +		connector->hdmi.max_tmds_char_rate = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
> +	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3)
> +		connector->hdmi.max_tmds_char_rate = HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
> +	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0)
> +		connector->hdmi.max_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
> +
> +	if (caps->max_tmds_char_rate) {
> +		if (caps->max_tmds_char_rate > connector->hdmi.max_tmds_char_rate)
> +			return -EINVAL;
> +		connector->hdmi.max_tmds_char_rate = caps->max_tmds_char_rate;
> +	}

Here I'd totally suggest something simpler:

if (!caps->max_tmds_char_rate) {
	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0)
		connector->hdmi.max_tmds_char_rate = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3)
		connector->hdmi.max_tmds_char_rate = HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0)
		connector->hdmi.max_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
}

> +
> +	strtomem_pad(connector->hdmi.vendor, vendor, 0);
> +	strtomem_pad(connector->hdmi.product, product, 0);
> +
> +	/*
> +	 * drm_connector_attach_max_bpc_property() requires the
> +	 * connector to have a state.
> +	 */
> +	if (connector->funcs->atomic_create_state) {
> +		struct drm_connector_state *state;
> +
> +		state = connector->funcs->atomic_create_state(connector);
> +		if (IS_ERR(state))
> +			return PTR_ERR(state);
> +
> +		connector->state = state;
> +	} else if (connector->funcs->reset) {
> +		connector->funcs->reset(connector);
> +	}
> +
> +	drm_connector_attach_max_bpc_property(connector, 8, caps->max_bpc);
> +	connector->max_bpc = caps->max_bpc;

If you don't like the max_bpc argument, let's do it other way:

if (connector->max_bpc < 8)
	return -EINVAL;

if (connector->max_bpc > 8)
	drm_connector_attach_hdr_output_metadata_property(connector);


> +
> +	if (caps->max_bpc > 8)
> +		drm_connector_attach_hdr_output_metadata_property(connector);
> +
> +	ret = drm_connector_attach_color_format_property(connector,
> +							 caps->supported_formats);
> +	if (ret)
> +		return ret;
> +
> +	connector->hdmi.funcs = hdmi_funcs;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drmm_connector_hdmi_init_with_caps);
> +
>  /**
>   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
>   * @dev: DRM device
> @@ -578,71 +709,14 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  			     unsigned long supported_formats,
>  			     unsigned int max_bpc)
>  {
> -	int ret;
> +	struct drm_connector_hdmi_caps caps = {
> +		.supported_formats = supported_formats,
> +		.max_bpc = max_bpc,
> +	};
>  
> -	if (!vendor || !product)
> -		return -EINVAL;
> -
> -	if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
> -	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> -		return -EINVAL;
> -
> -	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> -	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
> -		return -EINVAL;
> -
> -	if (!supported_formats || !(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444)))
> -		return -EINVAL;
> -
> -	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420)))
> -		return -EINVAL;
> -
> -	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
> -		return -EINVAL;
> -
> -	if (!hdmi_funcs->avi.clear_infoframe ||
> -	    !hdmi_funcs->avi.write_infoframe ||
> -	    !hdmi_funcs->hdmi.clear_infoframe ||
> -	    !hdmi_funcs->hdmi.write_infoframe)
> -		return -EINVAL;
> -
> -	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> -	if (ret)
> -		return ret;
> -
> -	connector->hdmi.supported_formats = supported_formats;
> -	strtomem_pad(connector->hdmi.vendor, vendor, 0);
> -	strtomem_pad(connector->hdmi.product, product, 0);
> -
> -	/*
> -	 * drm_connector_attach_max_bpc_property() requires the
> -	 * connector to have a state.
> -	 */
> -	if (connector->funcs->atomic_create_state) {
> -		struct drm_connector_state *state;
> -
> -		state = connector->funcs->atomic_create_state(connector);
> -		if (IS_ERR(state))
> -			return PTR_ERR(state);
> -
> -		connector->state = state;
> -	} else if (connector->funcs->reset) {
> -		connector->funcs->reset(connector);
> -	}
> -
> -	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> -	connector->max_bpc = max_bpc;
> -
> -	if (max_bpc > 8)
> -		drm_connector_attach_hdr_output_metadata_property(connector);
> -
> -	ret = drm_connector_attach_color_format_property(connector, supported_formats);
> -	if (ret)
> -		return ret;
> -
> -	connector->hdmi.funcs = hdmi_funcs;
> -
> -	return 0;
> +	return drmm_connector_hdmi_init_with_caps(dev, connector, vendor,
> +						  product, funcs, hdmi_funcs,
> +						  connector_type, ddc, &caps);
>  }
>  EXPORT_SYMBOL(drmm_connector_hdmi_init);
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index af075c38f4db..961a729d0869 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2029,6 +2029,47 @@ struct drm_connector_hdmi_audio {
>  	int dai_port;
>  };
>  
> +/**
> + * struct drm_connector_hdmi_caps - HDMI capabilities structure
> + *
> + * This structure is required to initialize the connector using
> + * drmm_connector_hdmi_init_with_caps().
> + */
> +struct drm_connector_hdmi_caps {
> +	/**
> +	 * @supported_hdmi_ver:
> +	 *
> +	 * Maximum HDMI specification version supported by the controller side
> +	 * of this connector. This describes the controller capability only;
> +	 * the effective link capabilities may be further restricted by the
> +	 * sink, bridge, or mode validation.
> +	 *
> +	 * HDMI_VERSION_UNKNOWN means legacy/default behaviour.

What would it actually mean here? Every chip has some version of HDMI
standard it conforms to.

> +	 */
> +	enum hdmi_version supported_hdmi_ver;
> +
> +	/**
> +	 * @supported_formats:
> +	 *
> +	 * Bitmask of @drm_output_color_format listing supported output formats.
> +	 */
> +	unsigned long supported_formats;
> +
> +	/**
> +	 * @max_tmds_char_rate:
> +	 *
> +	 * Maximum TMDS character rate supported by the source, in Hz.
> +	 * A value of 0 means the core should use the default limit implied by
> +	 * @supported_hdmi_ver.
> +	 */
> +	unsigned long long max_tmds_char_rate;
> +
> +	/**
> +	 * @max_bpc: Maximum bits per char the HDMI connector supports.
> +	 */
> +	unsigned int max_bpc;
> +};
> +
>  /*
>   * struct drm_connector_hdmi - DRM Connector HDMI-related structure
>   */

-- 
With best wishes
Dmitry

