Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEA7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0aBhZc9WF+rFPlDXqAf/XhE72xCrYOeF47F21xku7w=; b=Mk1haFp/+CzoOkBZawbMLCCHMV
	zpCd48aQAhFq6JTTrS84ebMZJAnq3WeA4giJRrvzN8bisq4h5I3yZDlCkSiTndyvjFSswLavTBCGf
	KhFXitXRsNIBM7WDbXKjpPC4pRqxif0uuTtl/njqR4xiXBlngKnZoeBUkCtqSijkm6tT6JRPNG8Pq
	WPPfnhfj40WRf2j4wR66VdsXMtSkHOLNHgLwKqIi8O9NWHxcgvrfxKy3KZzBY4+mtrVe0aecoiFIg
	fV40BThTDiMNouUEccdRYzF3NNv7saRXxzemamWbdlhm7yF6AAeJ1cnD8V0OSv1MfJ4TQ5XcP4+W/
	8JXtFsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeyT-00000007HH5-26EI;
	Fri, 03 Jul 2026 14:34:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeyQ-00000007HFw-0pKG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:34:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663CFI1R3144471
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 14:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F0aBhZc9WF+rFPlDXqAf/XhE
	72xCrYOeF47F21xku7w=; b=Gr8DXkkONkkq7N+aZz/zMERdhhLMnmXhh8Vg1ZTS
	bFCB3Tc4v/DBDvqjmU8d2yUGAEfebpaGuyysZ0KQVfulJFjDyruCzhsh71U/ay5m
	3io55qCtOgZcGNHA4iFjf1aCg+5AKnaOFrAWO9iIvUx6g+cWtc9LfnqOjggtwqNu
	wpoGFOT7PVUmPTtL+/QeojnKRB7OjFT3t+xxRMA7XnQUvGehcLW58NY8Y5vSWF4A
	OqAx8yxPgrEBo3MuLbVBkxXjCgDYoU5QnBl1ZKSKsamr+LzkaHsyQM6z8h0akRaW
	D9MF2t+ue2Eh5YRsBWMXIIFGZYnNUX5dR9nUqngMLHsOWA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bspsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 14:34:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73986bb438eso862867137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783089273; x=1783694073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0aBhZc9WF+rFPlDXqAf/XhE72xCrYOeF47F21xku7w=;
        b=HAvaOvjA6GRb445uU5v3f39lT4ecWBfncMSSCI35ThJ4XR7KY5h53b3I2fWTsHrb80
         ONPaRaLRcU4rK3ZZoP4p9XiJNcFEz9tARhIHUaXYFpoXA1i2gxzr2sbdpEjB2GfXfB1J
         H24MJ8D9AVWRzz4faauwAaEhXkEYz7PiMTZiVvTfhxMXpFsHOj7jILD3/ys/T1kczuWu
         IlN8SAgUHB/4Nsis4rTTkgef9/QH9vAjU2xZESvxQaGQVZjE86TkRg11mk1hzPfkni3v
         +wTp4gTrZG1jPxEXdADhCOkzbRXE5wjf7x/F35PkQnV8xNsNpOSqes0Ts7+7d7Ib5cfa
         nnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089273; x=1783694073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0aBhZc9WF+rFPlDXqAf/XhE72xCrYOeF47F21xku7w=;
        b=ADODkqzsaHxp+dRC5fo4hm5I67uX7vluRymJpbd+oj2fd6xYM2XZsenGybteQ5W0RB
         3CcAt6Gxmm0xjp3iWk6OqqkbBtGLP+B1tQkd5wt6ARfADFIRBnprAql58wV8yGxxSLPi
         fU0qULchHaAlmTcWu6uu+RaQpacCoH7NHrNhS1d+RpytUv9LUw5VGD9fA2R9ickxp7iw
         CXzzlfTH5by2bcfWIZvhOwtJaXch3lUtYGiLAG7KEyRXp2eRoABzBUbzXFV36IqvYR2d
         eUsmIiND8/XGS1avvMshqo+ean/FruwHiHtmyH9XCzDEEhOKlI9Dp60sh9sBNhzY96Do
         LRyw==
X-Forwarded-Encrypted: i=1; AHgh+RpTD7RtYvUF+LqU/0nbuIJgFsXTeRysrRbOMQBdmTQbVovBxE2VLR2dTQMnKXAtWcjIBiofnsf/8dm9CXaex9EU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf1kZGqxQ8nC+A3ahGr0qs+lBRqs0+J5mdlf1pRrAk1kwrq2oV
	4DMvpIPdMGGkbkr8eJNVBulFV5CNuBBA0kP2NgEa2q1lXN6K5j+Ee67MTcd8NIdMzDpiqyv0/h/
	cnQK9XsL+ziymrydGfWOw/DB3zVX/eHuuf439RFVDw0HiYVJgLaxHvGsUGbFX6z720K8WDS9Fy7
	foQg==
X-Gm-Gg: AfdE7cndHBlvUhfGu8py86XexLE53VqLFQpvONE3hGcSblVmIzvHRBnhDDi5ihJJORJ
	Vov+tW0ZR/nlIXAuiF6+HSa5gm4HDGU2UK5O9MZY8yXBeQdkbbVNpum3B0AaujtbWaO8qkw+w7O
	tePp877/XdTLdCyDd8H73LNifVns40RYPUNmI2CGAl5ffK4Rz2b2aJ70XYnZsmVyXf/itXdvde+
	9PUu12N71tzinrsB9KPF2E1FH37CLZY6+9Yci8fNVQKi3Jklo132I3kE0DB8yFetXDVw025Q/c7
	yNzgvltmI5fxTUOtVsDgGQ2jlrv+I0Odwxi98TudpUKTttpzYokBsqkNlQwVWpZr4mhEL0yZHF9
	cMDCIsRzYIqgHj2jp7iaiMGZytNa3dUJ/UyMEH+C5N7hpS5xYpzKV/s3tmfpQw82QqA9qLkkplH
	s/2DjiOEn7cUnk3vTEfU0hJDIm
X-Received: by 2002:a05:6102:5349:b0:739:977f:c1ba with SMTP id ada2fe7eead31-741f650d784mr116926137.2.1783089272610;
        Fri, 03 Jul 2026 07:34:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5349:b0:739:977f:c1ba with SMTP id ada2fe7eead31-741f650d784mr116889137.2.1783089271966;
        Fri, 03 Jul 2026 07:34:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8b5bsm526521e87.80.2026.07.03.07.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:34:30 -0700 (PDT)
Date: Fri, 3 Jul 2026 17:34:28 +0300
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
Subject: Re: [PATCH v8 04/39] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
Message-ID: <tjsidlnvswo2rdhqa6jybxrnb47lxgmxdlfrfbasuh67wjbqoy@3a45n3zawvnf>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-4-d79890d00b6a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-4-d79890d00b6a@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX3p5F651eowSM
 0oX7Uud7O2QRTOQXvFqWal3bVoRhzgQQLSYkrlu/ciFdSVWV1e1oB40JAofVVpEUoAX1C+3N23V
 qImifw8U2Bs/Sj79d2Kk0WokBNJU4AykYpTWxLcggZSll63PEF5a1v8vHj0Fp1KML2tGTfEp/HT
 C1qoIXbla9ywZtRTpdIU3shx/l7BoAWOU2KjCWtaHuFYnrex28VutW8G18c8W6lg5M8VIs1iA9W
 0dmBdl4m+XgtPjQTOrKhS3XwGOTIYBVHTtATPwY7sKDU3TXalKLeVNFyfJ74HwjHxgoiLZNg+zE
 9/rtOXlNUDcz8xtuYfCI8j5l0DtVcltO7Q9ZQuETZhtekPPBp8/AF3ObVY+qUVHYmJzuxxsNErA
 N3tnL4puMCxVJwciy+qc5m+vtZpvDEIVeIQKDlMvvHTnwz71pk30jBb4gYqpFRP+CsVqGiGl7QK
 3H8e08KMtSkhGwJii/g==
X-Proofpoint-ORIG-GUID: HkmCIVBfCRm7Wqfs3Yt3njp10btKHIKL
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47c879 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8
 a=GwlrSY-_3Y_gmMEHsFMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfXy4e0a5rTzWcF
 169ayHbavRry3KgAJdd8CiJmSpxoaNg8u7QbHnkLu3aorRKoi1z64m1P1FYMRtAd8e987399yoc
 eLJtJz2cxPn6YtM5SxIOhnfGL8oE1qU=
X-Proofpoint-GUID: HkmCIVBfCRm7Wqfs3Yt3njp10btKHIKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_073434_254396_234BD41D 
X-CRM114-Status: GOOD (  36.32  )
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

On Thu, Jul 02, 2026 at 05:46:17PM +0300, Cristian Ciocaltea wrote:
> Add the connector-level infrastructure to support HDMI 2.0 scrambling:
> 
> - A scrambler_supported flag to indicate whether the source supports the
>   scrambling capability, in which case the newly introduced
>   .scrambler_{enable|disable}() callbacks in drm_connector_hdmi_funcs
>   are mandatory

Do we need a flag? What would it mean if the flag is set, but the
callbacks are not? Can we drop the flag and use the presence of the
callbacks as a way to identify that scrambler is enabled?

> - A scrambler_needed flag to be managed by the hdmi state helpers based
>   on the negotiated TMDS character rate and the source/sink scrambling
>   capabilities
> - A scrambler_enabled flag to track whether scrambling is currently
>   active
> - A delayed work item (scdc_work) with an associated callback (scdc_cb)
>   to monitor sink-side scrambling status and retry the setup if the sink
>   resets it
> 
> These are intended to be used by SCDC scrambling helpers to coordinate
> scrambling setup and teardown between the source driver and the DRM
> core.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 26 ++++++++++++--
>  include/drm/drm_connector.h     | 77 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index c7ce6b7bd8b0..deecfc582f09 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -220,6 +220,19 @@ void drm_connector_free_work_fn(struct work_struct *work)
>  	}
>  }
>  
> +static void drm_connector_hdmi_scdc_work(struct work_struct *work)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_hdmi *hdmi;
> +
> +	hdmi = container_of(to_delayed_work(work), struct drm_connector_hdmi,
> +			    scdc_work);
> +	connector = container_of(hdmi, struct drm_connector, hdmi);
> +
> +	if (hdmi->scdc_cb)
> +		hdmi->scdc_cb(connector);
> +}
> +
>  static int drm_connector_init_only(struct drm_device *dev,
>  				   struct drm_connector *connector,
>  				   const struct drm_connector_funcs *funcs,
> @@ -285,6 +298,7 @@ static int drm_connector_init_only(struct drm_device *dev,
>  	mutex_init(&connector->edid_override_mutex);
>  	mutex_init(&connector->hdmi.infoframes.lock);
>  	mutex_init(&connector->hdmi_audio.lock);
> +	INIT_DELAYED_WORK(&connector->hdmi.scdc_work, drm_connector_hdmi_scdc_work);
>  	connector->edid_blob_ptr = NULL;
>  	connector->epoch_counter = 0;
>  	connector->tile_blob_ptr = NULL;
> @@ -624,12 +638,18 @@ int drmm_connector_hdmi_init_with_caps(struct drm_device *dev,
>  	 * inferred limit with the actual controller capability. A value of
>  	 * zero keeps the default limit inferred from supported_hdmi_ver.
>  	 */

Here we need to check that the driver doesn't set only one callback of
the pair.

> -	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0)
> +	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0) {
> +		if (!hdmi_funcs->scrambler_enable ||
> +		    !hdmi_funcs->scrambler_disable)
> +			return -EINVAL;
> +
> +		connector->hdmi.scrambler_supported = true;
>  		connector->hdmi.max_tmds_char_rate = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
> -	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3)
> +	} else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3) {
>  		connector->hdmi.max_tmds_char_rate = HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
> -	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0)
> +	} else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0) {
>  		connector->hdmi.max_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
> +	}
>  
>  	if (caps->max_tmds_char_rate) {
>  		if (caps->max_tmds_char_rate > connector->hdmi.max_tmds_char_rate)
> +
> +	/** @scdc_cb: Callback to be invoked as part of @scdc_work.
> +	 *
> +	 * Currently used to monitor sink-side scrambling status and retry
> +	 * setup if the sink resets it.
> +	 *
> +	 * This is assigned by the framework when making use of
> +	 * drm_connector_hdmi_enable_scrambling() helper.

No such helper. Also, please explain in the commit message, why do we
need to keep it configurable. Why the default is not enough?

> +	 */
> +	void (*scdc_cb)(struct drm_connector *connector);
> +
>  	/**
>  	 * @funcs: HDMI connector Control Functions
>  	 */
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

