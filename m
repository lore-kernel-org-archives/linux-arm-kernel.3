Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935E2C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqHtp61gi/MVVqpPkBkPz7nqzj2NZMIcHn+kla2ZN4c=; b=NrRfPgjcMdvXVkbm825OWO89QB
	cyMwy8VY8wy9/Q6rWr4dAXDghKXbQBKc+kZJD142XETvx7yYLCtPCM30UqQ4fY+Ch4h3Qx9Zwylde
	TD6UPEWJV0wLwlqPFZ1xxveeMipSn7ra2WjV2MOxU1RUry5SObKEQy3oss/XzKK2kDLB6hRrqNo7r
	l2qyspW4zw/YOD8OfMDt6PzhiV2F2SwxqW1lXqk+0Dxcx9CrSLuc4DyMx0cyAe0w7HejqvYDl/Jhv
	V4SXLbe87ciloMyNl8oMuBpsWyv5lp6B+1rsVAw+UOPVUY0ggO0/eb688VJwgh5W0LhVruUE/Nc9n
	ozoQAZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5Ez-0000000E9wG-1bi5;
	Sat, 19 Jul 2025 10:56:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5CU-0000000E9jZ-1f3R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 10:53:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4M8WO002491
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 10:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aqHtp61gi/MVVqpPkBkPz7nq
	zj2NZMIcHn+kla2ZN4c=; b=SdRgksaU3n0/sMpQ8XUiiDYGoQ70xrm0QbQr8PDg
	S0+acoJzMc8l4SYRgpySDuIJSlEcsc2Hwby8/Wt/hNGd90zWTuI0BQ+7oE+t49ht
	9apLGxz83+0t7M2CAMACWcMiYuCppt0E9xdoBFGUlExRGIjTvBP6mXG2regVuHzR
	qZu6bD8W4MID62X2DgD9kIkEIDjO6koIqjP7ry4/5SGzaLyayxxeNQXfaREoEUVQ
	hPUFsnGMEKXZHeHrcXFxqM41p+xgeQISAbSFix/xXhW1WDcGLBO/73pKi172Zfk+
	NMogtuaHI361nKygSHQn/MvffjIaC+BaWrXm4J6RaFdMaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v0gfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 10:53:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so535722685a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 03:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752922432; x=1753527232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqHtp61gi/MVVqpPkBkPz7nqzj2NZMIcHn+kla2ZN4c=;
        b=V0tPG0fbzpYUMgx2fTrNKJQ3bHPZdVmxk3zg+7/eQ9BZyu3PqarhmLRTT5qWstFaYz
         vIv+PpmbkXBZFvde4Mb7GLFFvPZ+sb+fCm1eO7/mMJFKU/0v75na4xBZC5RF4vg0TSF6
         Va03/j3SXEnHjTkAyD/QKe97Wt8NfrzoXKv+jf1uaLw77dm9cxux3AscWmnrVdA0NciO
         7HUWiUAesZdJUjmmlnDVYU9iO1N5gQKzATgV8u8u7EVZtTc2h1A0VdwbFpzA8fT4lfAc
         Kw6JphJDL9lsJOyLoXzZR6U8/tNuqL8xnEaAeYraXoRugRhPa4ut0YrBkKnBtUzLL6xc
         UvzA==
X-Forwarded-Encrypted: i=1; AJvYcCXousiqEuPzEVgUkIBKrsfh9xcB/7rQ2ijKeFvKo9hdo6eBcz10AaCEXAaWst3gi76Pq7jqXQLAWdNV32p4k9e0@lists.infradead.org
X-Gm-Message-State: AOJu0YxrDcosJQPHuwQ/LevYAlOjvoWzCsshSUSXZehGHfFgaBU0zigy
	KRblHzSgNs4dmTaH2fgyclkocZWLNgRSqfit1RYde7QWSP615lnaahAc/3hOYtpzi6wCLY+86OF
	iLrYkXTtuXhGpM4DNyI0L0an8Hc0jsB3qFnHeIgtuhCU2dyBr3csQyYUUa3ifEfNJWvg/u9emz7
	N3Mf5sD6BxYg==
X-Gm-Gg: ASbGncv1Sfbcz5TiJMHDAc+n/U5uZmgz2soPx67SXnHbPkne32BTX7QzfEfmJGJWqwA
	jrS2vBjcgG8yD5DCYX4IntNp/YGnkiGAFVfheNTlTDBVLUSl4ZaN5SwNoqoQbAL0ttMddx9EF70
	rQxQrEPnID2dCLQOds8D94Ks4ZNifZPdaVCG1NUy55WpjiVEjkj7oIkk+PmCy+ic3gPH1GtNsk6
	c0VJLUBgidjQflCnod7/62BKTTGEmOw9qJYvPIEBYqtuFPPDuY5W37UHpCRxghHgkhbCsA8i1PO
	kgApP32WX17tMtHsWubkuFIWQc5LlxtS/GyuNyf7bFeh21P43Aay97f3wC3YMG2pnGmWXRdsOie
	ZoGZsQWKaZzUCmMyJyfoJi9hvJbr9+3oSlMW9wx5ve6Rare89bg5Q
X-Received: by 2002:a05:620a:440a:b0:7d4:49fa:3c59 with SMTP id af79cd13be357-7e34356c61bmr2239109885a.15.1752922432111;
        Sat, 19 Jul 2025 03:53:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPrmyV8egRcX0tplCS17IxY7fqr0+H6cJp69VeGuqF/GMP4bJno9IhBcl041AaSBLD5rosBg==
X-Received: by 2002:a05:620a:440a:b0:7d4:49fa:3c59 with SMTP id af79cd13be357-7e34356c61bmr2239105885a.15.1752922431592;
        Sat, 19 Jul 2025 03:53:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9b1b1sm677727e87.35.2025.07.19.03.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 03:53:50 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:53:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/5] drm/rockchip: cdn-dp: Support handle lane info
 and HPD without extcon
Message-ID: <t3th2tqbnkmsqssypxvye6vsfhpw37sf7wyl53cso3r5pqa7qp@gn74pj75j4pb>
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718062619.99-4-kernel@airkyi.com>
X-Proofpoint-GUID: 1IRlFccVJi_N_xIMrgDQatvlBBmtSTX_
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687b7942 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=ady2-bcLGFUvj2b528oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwNyBTYWx0ZWRfXwHeHUMLD8BVH
 ktlmk1anOXYrVkNs647w9eOF2KpaaeF7CgUu2HiNVtnrMtOpJ0zDLOYiQUqbYZVIi2McEhOu5iv
 ZU6GSOsBUqra9kzhl5RLjMfzzeJi7dwWiMrMizeLU0mYqJ6JY8BTKyhSsEdP5JssvUncCjJki8R
 S6aJC/9do/0CbJYjZa7b2D4hExM0+5r3CMKMZe7Tn4dFpXY2rb+jmffSUoVrrprJjjZXfy316xo
 OCpAbCTfzWylMmHG/Lf05hbXt5GqlmqqIhfMZ5+Y73goKB36Sh+54ycmN23jiZwIJyvPP3JeFDf
 Fg0cy6v6Tfl9fBsxZ7qiCzftC8aYMZ8XvIYNmF9hy26u75TrPTIBQNsK2FCoPecSQRCo9Kc+PXz
 AsyXRyBPVkmdD65AJ3n6PTC5KGBgqRBN5bJEIQscuhmZFATmdMiiYdJqsvZ2ILSL+PyzZoTx
X-Proofpoint-ORIG-GUID: 1IRlFccVJi_N_xIMrgDQatvlBBmtSTX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_035354_436199_D53184DC 
X-CRM114-Status: GOOD (  34.61  )
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

On Fri, Jul 18, 2025 at 02:26:17PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for get PHY lane info and handle HPD state
> without help of extcon.
> 
> There is no extcon needed if the Type-C controller is present. In this
> case, cdn_dp_hpd_notify() will handle HPD event from USB/DP combo PHY,
> and the lane info can be get from PHY instead of extcon.

The DP AltMode driver will send drm_connector_oob_hotplug_event() to the
DRM connector associated with the USB-C connector fwnode. However your
DP connector will have fwnode set to the DP controller, if I'm not
mistaken. So I doubt that HPD events are going to be delivered
correctly.

> 
> The extcon device should still be supported if Type-C controller is
> not present.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Ignore duplicate HPD events.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 37 ++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index 24f6b3879f4b..b574b059b58d 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
>  	int dptx;
>  	u8 lanes;
>  
> +	if (!edev)
> +		return phy_get_bus_width(port->phy);
> +
>  	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
>  	if (dptx > 0) {
>  		extcon_get_property(edev, EXTCON_DISP_DP,
> @@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
>  	 * some docks need more time to power up.
>  	 */
>  	while (time_before(jiffies, timeout)) {
> -		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
> +		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
>  			return false;
>  
>  		if (!cdn_dp_get_sink_count(dp, &sink_count))
> @@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
>  		goto err_power_on;
>  	}
>  
> -	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
> -				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
> -	if (ret) {
> -		DRM_DEV_ERROR(dp->dev, "get property failed\n");
> -		goto err_power_on;
> +	property.intval = 0;
> +	if (port->extcon) {
> +		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
> +					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
> +		if (ret) {
> +			DRM_DEV_ERROR(dp->dev, "get property failed\n");
> +			goto err_power_on;
> +		}
>  	}
>  
>  	port->lanes = cdn_dp_get_port_lanes(port);
> @@ -821,6 +827,17 @@ static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
>  	return ret;
>  }
>  
> +static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
> +			      enum drm_connector_status status)
> +{
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> +	enum drm_connector_status last_status =
> +		dp->connected ? connector_status_connected : connector_status_disconnected;
> +
> +	if (last_status != status)
> +		schedule_work(&dp->event_work);
> +}
> +
>  static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> @@ -831,6 +848,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>  	.atomic_disable = cdn_dp_bridge_atomic_disable,
>  	.mode_valid = cdn_dp_bridge_mode_valid,
>  	.mode_set = cdn_dp_bridge_mode_set,
> +	.hpd_notify = cdn_dp_hpd_notify,
>  
>  	.dp_audio_prepare = cdn_dp_audio_prepare,
>  	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
> @@ -1028,6 +1046,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  	for (i = 0; i < dp->ports; i++) {
>  		port = dp->port[i];
>  
> +		if (!port->extcon)
> +			continue;
> +
>  		port->event_nb.notifier_call = cdn_dp_pd_event;
>  		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
>  						    EXTCON_DISP_DP,
> @@ -1120,14 +1141,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  		    PTR_ERR(phy) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
>  
> -		if (IS_ERR(extcon) || IS_ERR(phy))
> +		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
>  			continue;
>  
>  		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>  		if (!port)
>  			return -ENOMEM;
>  
> -		port->extcon = extcon;
> +		port->extcon = IS_ERR(extcon) ? NULL : extcon;
>  		port->phy = phy;
>  		port->dp = dp;
>  		port->id = i;
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

