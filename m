Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75D6CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wkzrxKudGSviXsY/mtwV95ApO2/F8bqxrMw6rKRUQs=; b=R09LoNEOI3kt7mPV4j/LVddZV5
	23+WdxzG0weVYW4jbdkW/CYVZansmk+xkZDKX1nxmj1bFI9vwhTrh2iz+GFxqis+EV9xWBakrBGfL
	Y38VE+FJmHzzbEZTpECWCaSRbMppkOZao4vpyboolVl42XnEO5y2f4HZpF+XVNDDe0OPUOzrf6kEI
	e5YrUQZWOzC1HwIHt+iFyKbqqmi8+KPx6rXQ1wG8M7zuvmDMi1sGmq+43GmA2wM0y2YBFlLkHNS39
	iiB7kt1WBK3huq85R+UMh+U8wMYOTkC2Q8oYXJggSj605VbEYGSt5xb6GwE3Di/b6j8TWXXg36CrI
	fjxvFLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Doq-00000008cxS-0otA;
	Fri, 10 Oct 2025 14:10:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Don-00000008cvn-0Zke
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:10:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Wn1a008198
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 14:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7wkzrxKudGSviXsY/mtwV95A
	pO2/F8bqxrMw6rKRUQs=; b=YtCKZR/MKHgtOZi6vcOxpQ3qKxJqn0UgdFTNCXsI
	sJVqDaRakSag7bU65LgFJK+ZEtLghWpshoZQpGdcZbfU69ysSXSVY6nMYoup7qmn
	/S69nHAvpHOe+A8qTrFDRHds8Q2JVhmmPdI4LK7R7iLVuFXUhxD0dtlC2opfsn6f
	CiCfBvQ5lcF+SNXOiycOUAV0cDzWQGeUdCd1qpJ6PjWBMQVSLtJ1NZBmDu+ihbeB
	2JvToGRINChtwlpNekLtlqubx4oYd1oDeBN5FvHJ02rIK8AadmMX7M1YJz9aigBp
	U9tuzgu13YAiJua6n3sRGlt4YTW02NVsgH9Hf0qjdcTaJg==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kpn0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 14:09:59 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-42f8824b65fso115899475ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 07:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105398; x=1760710198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wkzrxKudGSviXsY/mtwV95ApO2/F8bqxrMw6rKRUQs=;
        b=am6Tok+7ewSdPMvT9LPP9iLGGfu2KOhjLvCMznPiD571QbVulDCxOkF36OzpXuvkxq
         9dzQTAwbCyHf0RGDW/jXU0m4DE+n/tA4DxAgUUAPIR8tgyiLjedq4yMNmyDI4OJ5+BRm
         RZZr3eLlVoD39nr5IWudCL08ePV0yV15MA4Kz3CmLu+C9Y0lOrmfvnTpkk4Q+HfHA/CH
         vp+kYYxD0NB+t4nKmsM7kgoOVwijEpCqTVYWoD/177cxu8G+FMz2rXl6NF4zgjBF77ZQ
         lwcvEm11W6hpBR3B0Gkb9ZjTEMx33Xhi3nCk7BjdKx6GnaqDxVOD1hJiYfwatbEW6dXz
         DKmw==
X-Forwarded-Encrypted: i=1; AJvYcCWETGzXQZVaEmIv0qaEoOUkLwwU0zuZhPiJWz4KP5Wqi8JVwudlym3fjCu2DDJgtdKOI4sYvmIpPMYFldJ0YEXf@lists.infradead.org
X-Gm-Message-State: AOJu0YygDiSWbWodwvo3mYijo5bx7xuqvxwWMZSnlBDTDfehIBfTNyF8
	ldsIakiqzpXZttEpIDHCSnyR2woESo08FkQR7iRT2Hzwo8SoML1M2ym+GalcN+h0yoJ5QQEpOKS
	4RXu9SJ8QlSnLkDWw5aFbfaRYAWDOAsQ1KWJ9ESZjmt5Q03noKPzAccJbviOLl5qnRGkONYTv18
	/8uA2MdM+nRA==
X-Gm-Gg: ASbGncvsakYgIVji9ghVVn4YOiTzwgnsSDRGj5Mrvt0XGQ3MduiZpk7sm21D/fS5VhC
	l2UUPkp8Tv4LvegRK8LAM2+oY+Sv+UPliTi3njxvkCjY+rhxV6IZ0cwjH/V+xyU7Yk7hA7jPGJr
	8XLD08JwyeZvn3+iM0IepVc6yNvNP5SIftWBxYpvlHx1pyzexaL60E75nhNYEsBKMTwtq6rl5av
	5+mF7QBQyuARscmZZaj7WxywA31+ESAFqA9mRnzIcIZ6AQ5QQ9r6ClyiGzjansFvrB4DbAc9Ykl
	szKhAeNRHENfd1g2ahRHozQ7rYGIP7994lSYODIQfNN23dL+yXyYPYT/pQ9dxSX6KSDM+EMZelX
	lqGcGWLq+NXaGTI2HfSYJKssdhm92KIloNn5vAE9VmBVBN7w8GoAP
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-32da845f843mr16839540637.45.1760104966473;
        Fri, 10 Oct 2025 07:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx6lmwhdGB5tiz/Bc58mePgSBZ2wqdgFCoifjtltdKT0RsIy6in4D98ACg4FIrT0oC09J4cw==
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-32da845f843mr16839190637.45.1760104964177;
        Fri, 10 Oct 2025 07:02:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4de3sm909304e87.1.2025.10.10.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:02:41 -0700 (PDT)
Date: Fri, 10 Oct 2025 17:02:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <dkblceiweall37j4anpgkumizxc5zni3axnxb5hyokv2jlsta5@immpjaczktnh>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
 <20251001180922.6bbe42ac@booty>
 <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e913b7 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=s8YR1HE3AAAA:8
 a=Y6CNJq9B8L7KKZcxe68A:9 a=CjuIK1q_8ugA:10 a=Ti5FldxQo0BAkOmdeC3H:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: WmLrujlZzXYwb7adLEauszqXsPrBBVE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+UhOzFEgq1xx
 RckCChfNd2irQle7FQqYdEgQgsa5UaPjjZyIxuMene4948Es2RnGKQ919ylBAuB75+JyV+tRxGa
 owLKJcU4GbNF6IoF4ibGeJ23vDZ297rAF3LfqEEWXpw1Jcm7a8XyNzlTfWoc0cHInsPNSn7SuoU
 SSRBbwZBLyIcipluheWd5T8YaBzAotDuITWaPKhs7OPCXnBQjDdrChsjmrVeW8jq3beL1q6/LwC
 1YMaJKIZ6kCI7YmOND0uKZwxKEVpdxWyWJo5j0FeMM/1NzLxd8mOa7UDrmrobfkFGWoz7PseUU1
 QiCyFjuuWedT6bXFpQ6QwtgL1nQr+cKjmxJgwOy7CrA9dUVcBcegKdALlvaneUTuHFaeqjYaQnB
 BKHrwvb/EwFjF2BVyjUWgOHYk/midQ==
X-Proofpoint-ORIG-GUID: WmLrujlZzXYwb7adLEauszqXsPrBBVE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_071001_194964_DD5E3071 
X-CRM114-Status: GOOD (  45.85  )
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

On Thu, Oct 09, 2025 at 12:10:42PM +0800, Damon Ding wrote:
> Hi Luca,
> 
> On 10/2/2025 12:09 AM, Luca Ceresoli wrote:
> > Hello Damon,
> > 
> > On Tue, 30 Sep 2025 17:09:13 +0800
> > Damon Ding <damon.ding@rock-chips.com> wrote:
> > 
> > > When multiple bridges are present, EDID detection capability
> > > (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> > > determined by the last bridge in the chain, we handle three cases:
> > > 
> > > Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > >   - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > >     &drm_bridge_connector.bridge_edid to NULL and set
> > >     &drm_bridge_connector.bridge_modes to the later bridge.
> > >   - Ensure modes detection capability of the later bridge will not
> > >     be ignored.
> > > 
> > > Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > >   - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > >     &drm_bridge_connector.bridge_modes to NULL and set
> > >     &drm_bridge_connector.bridge_edid to the later bridge.
> > >   - Although EDID detection capability has higher priority, this
> > >     operation is for balance and makes sense.
> > > 
> > > Case 3: the later bridge declares both of them
> > >   - Assign later bridge as &drm_bridge_connector.bridge_edid and
> > >     and &drm_bridge_connector.bridge_modes to this bridge.
> > >   - Just leave transfer of these two capabilities as before.
> > 
> > I think the whole explanation can be more concisely rewritten as:
> > 
> > If the later bridge declares OP_EDID, OP_MODES or both, then both
> > .bridge_modes and .bridge_edid should be set to NULL (if any was set
> > from a previous bridge), and then .bridge_modes and/or .bridge_edid be
> > set to the later bridge as is done already.
> > 
> > Does this look correct (i.e. does it convey the same meaning)?
> > 
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	struct drm_connector *connector;
> > >   	struct i2c_adapter *ddc = NULL;
> > >   	struct drm_bridge *bridge, *panel_bridge = NULL;
> > > +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
> > >   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
> > >   	unsigned int max_bpc = 8;
> > >   	bool support_hdcp = false;
> > > @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	 */
> > >   	connector_type = DRM_MODE_CONNECTOR_Unknown;
> > >   	drm_for_each_bridge_in_chain(encoder, bridge) {
> > > +		pre_bridge_edid = bridge_connector->bridge_edid;
> > > +		pre_bridge_modes = bridge_connector->bridge_modes;
> > > +
> > >   		if (!bridge->interlace_allowed)
> > >   			connector->interlace_allowed = false;
> > >   		if (!bridge->ycbcr_420_allowed)
> > > @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   			bridge_connector->bridge_detect = bridge;
> > >   		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > >   			bridge_connector->bridge_modes = bridge;
> > > +
> > > +		/*
> > > +		 * When multiple bridges are present, EDID detection capability
> > > +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
> > > +		 * are determined by the last bridge in the chain, we handle
> > > +		 * three cases:
> > > +		 *
> > > +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > > +		 *    &drm_bridge_connector.bridge_edid to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
> > > +		 *  - Ensure modes detection capability of the later bridge
> > > +		 *    will not be ignored.
> > > +		 *
> > > +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > > +		 *    &drm_bridge_connector.bridge_modes to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
> > > +		 *  - Although EDID detection capability has higher priority,
> > > +		 *    this operation is for balance and makes sense.
> > > +		 *
> > > +		 * Case 3: the later bridge declares both of them
> > > +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
> > > +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
> > > +		 *  - Just leave transfer of these two capabilities as before.
> > > +		 */
> > > +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
> > > +			if (pre_bridge_modes)
> > > +				bridge_connector->bridge_modes = NULL;
> > > +		}
> > > +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
> > > +			if (pre_bridge_edid)
> > > +				bridge_connector->bridge_edid = NULL;
> > > +		}
> > > +
> > 
> > If the above rewrite is correct, then I think this patch can be
> > rewritten in a simple way (build tested only):
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index a5bdd6c10643..bd5dbafe88bc 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >                  if (!bridge->ycbcr_420_allowed)
> >                          connector->ycbcr_420_allowed = false;
> > -               if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > -                       bridge_connector->bridge_edid = bridge;
> > +               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
> > +                       bridge_connector->bridge_edid = NULL;
> > +                       bridge_connector->bridge_modes = NULL;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > +                               bridge_connector->bridge_edid = bridge;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > +                               bridge_connector->bridge_modes = bridge;
> > +               }
> >                  if (bridge->ops & DRM_BRIDGE_OP_HPD)
> >                          bridge_connector->bridge_hpd = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> >                          bridge_connector->bridge_detect = bridge;
> > -               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > -                       bridge_connector->bridge_modes = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> >                          if (bridge_connector->bridge_hdmi)
> >                                  return ERR_PTR(-EBUSY);
> > 
> 
> Yes, this is correct and maintains functional equivalence with the previous
> implementation.
> 
> I previously attempted to implement this feature by modifying the logic in
> this section. However, that approach would obscure the explicit propagation
> semantics of the bridge chain flags (OP_EDID/OP_HPD/OP_DETECT/OP_MODES).
> Therefore, I finally decided to implemented it as a specific check after
> this code block.
> 
> Dmitry, what's your take on this?

I think I prefer Luca's code, it is simpler and easier to understand. It
doesn't need a huge comment, something like "leave the last bridge which
provides either OP_EDID or OP_MODES" should be enough.

> 
> > Another thing to note is that this patch conflicts with [0], which I
> > plan to apply in the next few days. The two patches are orthogonal but
> > they insist on the same lines (those assigning
> > bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> > comes later will be easily adapted. Just wanted to ensure you are aware.
> > 
> > [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> > 
> 
> This is indeed a clever approach to the managing bridge resource cleanup in
> drm_bridge_connector. Thanks a lot for the heads-up! I'll resolve this
> conflict and rebase the patch series.
> 
> Apologies for the delayed reply as I was on vacation. ;-)
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry

