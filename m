Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5BEFD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZjRbJ2gpSOpi4BD2wRxX0dJ2Njlip5bE4IRh4tsp0k=; b=VOLG30FWqczFrFpmSbaSxiR/Rt
	KKt/Td3Tf69WLGpyEWpPewQMpPao5hbTraTFa4d1C0w9rI3hK8HUXnGsgd5Wp6Hqc0pqYVRwSMcSt
	fxY8Wns0L95avtyhpKltBjGnR66KgymEk2CvTKpoEe/8NhxGGSwL34VHCRT55yHEAQWHK2o7QsGyF
	m9EXui2s4h3OHM2nD8dBQftDA5auaBz9fbRUxn8fMqk5yF3jUiw/P+oVxscaqLZ6pb6JTcMYOUTkD
	aKcdtAGMrXfoeF0ze12dATs25GAz077PEVjbTGwDO+9boDspJosDT1YVaqwElzreNQQRok4lrhwS4
	8LeqYOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk7m-0000000Bh86-42ph;
	Sun, 01 Mar 2026 16:58:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk7k-0000000Bh6u-0GZT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:58:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Fr0EH1472018
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 16:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yZjRbJ2gpSOpi4BD2wRxX0dJ
	2Njlip5bE4IRh4tsp0k=; b=fkhYPumSL/QAlMbXMLtEWChiX97tIzcJ8VeBIX4T
	7342qTqQUCnt0S7oDq9sQfzhyGpEUUJellGBOuoJYTfsmMFHgnXodEk5AC55z1iG
	c18u06r73+Pdj0npRxhtTGO474kenLYedhcwWpbRcBC3ivwUaTrgm50Dsqk4R6aI
	+2cwuKSHZdg1z1b9ojEBXDyD89t9uzig7w2KMFQb1bUwamY01WeikQvsTWQDMhlM
	wS7Axd8o1A+YDbnxSksJB4wZ0i060owQOeU4T2ACD8MJ4tYn9Af87F/Z+bjux2Vo
	fOz++88nKgW1Zk3CTwm94ccFlRFF5WRpv6fuV0NvlWcAeA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg72wvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 16:58:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so4666653185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 08:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772384310; x=1772989110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZjRbJ2gpSOpi4BD2wRxX0dJ2Njlip5bE4IRh4tsp0k=;
        b=VQPDE4IeJXJEafWqDoJaR4Iz8ohl3PMuxkIR1TGJ6jtsPr78E1N1vks0YRNo7ULo1Z
         hsMY82RZk5kRVtpnwQMOUzuQXMy6dWuM1zIXmttu1LawFwOhw/29VMwkFuyRBKCblczD
         4/lp9qoPdM4SjGnd4XXFgbargODnLtMSq9Ut6lzbUQJvq8xm+NuxGOKB0aCQVHGPN3Ma
         pZAatt28TrczagThVa7OgyENnSELGLmzHW8XlBuW2PdPZJfDQqd5pNx/Szo+xHhV9ca1
         T3KRvPmaI1ftVDCYsOIOteI2ro6UoM3Z+vT4Yy1beSHUluathD2qdl9ka8kSmpWa45/m
         7k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772384310; x=1772989110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZjRbJ2gpSOpi4BD2wRxX0dJ2Njlip5bE4IRh4tsp0k=;
        b=eCH9dNyahSqAC1CdDs75hp4Eqh1fkH6uVHQtMfjJXe517/0UWIZfiWMb61ShsTgcJ+
         scS7Pm/DXfOetv9KZuTn280mCANYkjH13dYvcxEstq2SWpPMWtPQSNF+8OglshhWLT9m
         20e6NOy5nyoiiGkcSB3adpM6mIWJbPvpEvLhn4JyJdBFL+3+qSkbMzFom/almNaus9JC
         ZKkcfBL366ZK6klL+1lowDv46/YKKpxNv4hJkaN8WGXAwTWQfjibCdYHiKoLaLdkc26K
         1csL6a+nRHmxCcVEd17CkGxyrsXGIUXhkm0idixt6jxAb+dD63Lu6ZB4f9t5mb5bxkNB
         Vv5w==
X-Forwarded-Encrypted: i=1; AJvYcCUoxrtlYmDXuc3mq0oEMMHZtZ9FRkpu3JgQIV9mVPJxfvvY0X9ywUAdsT7GzjjvRkJO4s3g0PXhYzHyZBcJQcUh@lists.infradead.org
X-Gm-Message-State: AOJu0YwNEodI1UjIkedQPejio8Voaug0LYqAgAO46qzCuLDTR1PIKVqR
	NVwlw9i899IIpR6Y1/GkzrGaSjsngnhhmcjvcxrYC5k44izh3m9ht1fuN32MaGEdOliPaQpXzxw
	QBa3fNQDXRFNK7Gvcmp/j1gEk4zUlR00pGUxk5EqyyX/X4l5PcKJY2sncv/yVGG1WkAYN3AVMk2
	3nAA==
X-Gm-Gg: ATEYQzypIoO2QNeOn5kR/KXNRT4qv8rY2Fs0sarHfr114g9ixfrXbuBVe3PDmgw0yJV
	9t46uVaNCHzmV5T/CDfU4UNhWgK2MdiKCy8kGM/Ys0VgEfcWZLPW0QmhRm7Jzn4T4NBKqzhboC2
	S/cwe3P8AhYhqVNKzdvNj6v1pvc3nylzX8t/8sp8UxImGRbcnG/JhR+6E/5duUMsxLmwShJRw0Z
	fL/wmxoila/xs8nKKTRCjh7Fnf+wjZCEiANxKseBfeAZiuMLI6k8tLK2ah5QmPpQz8uYzO4zPUg
	/ImltEUopjWc0HdxNXP+M74NPcIF0zQ6hgtl+hdTtKqznML/f2Z4H24RO7lFK84ZK8q6hJAHHuu
	YnEBKm13LOPhYr8SdhsCtO6zAvoP93g4B0IpzcYXuhhkDwhAauGVHvS72N4KNFvMqv8MdsgIN7k
	u0tb0jP1hkWPxLAfz2aSzSz9nYSlwYAl2S3jQ=
X-Received: by 2002:a05:620a:3952:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cbc8e4b725mr1252712485a.38.1772384310454;
        Sun, 01 Mar 2026 08:58:30 -0800 (PST)
X-Received: by 2002:a05:620a:3952:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cbc8e4b725mr1252708585a.38.1772384309937;
        Sun, 01 Mar 2026 08:58:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0dbsm1204999e87.41.2026.03.01.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:58:29 -0800 (PST)
Date: Sun, 1 Mar 2026 18:58:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 15/19] drm/connector: Register color format property
 on HDMI connectors
Message-ID: <mxfdm4rrsizf3jzjbeoxosb5lhm2wrzqipn6rvly4ukrodltgp@vcu2fkgwagdx>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-15-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-15-658c3b9db7ef@collabora.com>
X-Proofpoint-ORIG-GUID: JET-jVVrSrRahJFTuz5yYaLOPAHEu5D4
X-Proofpoint-GUID: JET-jVVrSrRahJFTuz5yYaLOPAHEu5D4
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a47037 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=QnxT5sWzqww7kDut_5wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfX+R5HDFTySfcb
 pk3XD30UG2euWEcdogAK4B4RfejxcSYcdsdkop+stD8pU5ma/3yizSbvGbDIybV+p1P1604WI8a
 d1rO4ZcMSAbDWBZg1DlDSjXA0Pa2dP27ed+OuhvF1jL7fwb0IcFOC8B4IiOuN+e7rod8Hcc68ZP
 b5ROhcNBbAWQYUKPmIXOfWmvz+WYWv72k5J2BH/USRxlGtuc0haf/b7/71+EF5xYVaJJ/ZE1a8E
 6vme7Jzk5bCs+XrDOlaEnS6+icrt3UWAvIsvu2Wuy3f6HVnA2ERRU9yklbrL52p3Lc7zytk0Wdf
 ermPC7h8+wEQ7s3Do+G2Tods9XY5Eg0H5P4JEXOmHdcXmkRegzKsOj2w0wOWSrXp3t3uNx9/cPm
 Gj2oo+ouFy4kWggr2oQ9myi8WOsNBL3wI4y4tCPupcnPl60O31WILq6dhD2+s8R9DXAPRFpKuX9
 Ys9XmfbBylIC8lvTowQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_085832_213905_51CD5AA8 
X-CRM114-Status: GOOD (  21.57  )
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

On Fri, Feb 27, 2026 at 08:20:20PM +0100, Nicolas Frattaroli wrote:
> The drmm_connector_hdmi_init function can figure out what DRM color
> formats are supported by a particular connector based on the supported
> HDMI format bitmask that's passed in.
> 
> Use it to register the drm color format property.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a4907e15dfc5..0f4e24446a9e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -627,6 +627,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (max_bpc > 8)
>  		drm_connector_attach_hdr_output_metadata_property(connector);
>  
> +	if (!drm_mode_create_color_format_property(connector, supported_formats))
> +		drm_connector_attach_color_format_property(connector);

It really looks like:

   drm_connector_attach_color_format_property(connector,
					      supported_formats);

> +
>  	connector->hdmi.funcs = hdmi_funcs;
>  
>  	return 0;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

