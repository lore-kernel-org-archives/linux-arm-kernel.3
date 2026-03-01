Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE13FD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23yFjRakNDMv9z7eHrnsMfwGzCe1oBIgBUxRG3B4w9c=; b=XAus6oigRU2muytbCT8CucPedt
	jCiZe2ZWbCzZSdEL/voylm6LOiZyJv/MffD8RGcMDpE11dNXPrMtgXO7Ksgr0Sx2dMh6VfMoLyJFm
	gx0HA4BNA7HMN3Mf3xwnTMzFoOwm2r1Doyb5rX1QiX0YlWbTxdPoGTCtU1SDAueAeIvqtYvsgYd/d
	0AVR2QHlVt3tmAyneE7V/IDbOhUrtyPRwqcnE6bAoS1p5UAJOf9fnKLSm+8gw3ao7xe6kr49OsZqf
	H9Jbl/t0hAGLN5v3lZcjGdpS+SmX504V7HSGXaziJLgI8BVxnpZcyqGbOpEhBbBqC8ecO3N3SbTVq
	wW+IRZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjxS-0000000Bg9r-3aHa;
	Sun, 01 Mar 2026 16:47:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjxQ-0000000Bg99-2PXJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:47:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6215P2FS329026
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 16:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=23yFjRakNDMv9z7eHrnsMfwG
	zCe1oBIgBUxRG3B4w9c=; b=j9k43y29AY/jcOBaZs4hjILMyf4NJhXj35Ds8fPf
	WOCMUgc83CYIceqbax3lqKhzX79Ko+iYQC1kKbPZDfsyqOkPtQI1g5VEsX7Lu/qL
	AxtlMsFmktCzVSbsiJI69w0rNrE7ejK0npefurmC+7ixrdHK1PUZe8EUs5aAClT2
	0dCCX8KR5It6Pr5VJ5vpuJH+eFms1e653wLTIIoz6kdz/S1wGb/5T+JN6GgqOTHL
	S+SDKd8+NufyC2a2lQuyvzgeT7eO/Frd6HF6ueEq71KVMYEsRIOilY3LgMv7z3FW
	WkVeV3lPmX4qJcZAkupTCrsicOZk0I+o6inqX9bWQ9NUlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgru161-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 16:47:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5359e9d3so3366535185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 08:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772383671; x=1772988471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23yFjRakNDMv9z7eHrnsMfwGzCe1oBIgBUxRG3B4w9c=;
        b=ehyn7NUg0f4AuyooJFb1Y2LL2QiXKUIEQSmGN2bxnR1Y8A6tLdJwnn8AdaR+OHWkDq
         YSgEFIo0ChS301M1BrsREulStIkU/QgtvzFKJGM1SCQeGFfxvDiRKzVaTpL5u3VeFs0y
         4YLo0LAxrhKAqfbBdAExpLoCXxJ6cvUYLzWVuc2Lr0MBggDUnd72L/zPmKiLdy0V1mX1
         EwGycKPsc6GzzVVUK//exVDV5U1QfBuaBDkqGopekOB1579kSLE0Uv3uyHKkaOqk/CUg
         C9F3RmmZTSTdN9vixXV4yqW5W1hNySPuyf3YrKepOjgFl8owoyBh+wa3gjXs83zDlawR
         r84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383671; x=1772988471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23yFjRakNDMv9z7eHrnsMfwGzCe1oBIgBUxRG3B4w9c=;
        b=VLySLRnQfeuCx/Olegkx9KVWXzdNwPrgrmj2tNMPTng4RSxUBf/XtjIPKAY0/Hun8a
         QqvH2a+RqaIGk3AQtZEonZypKxrhj8uO0DqCyR188z6ccb9+lv84rst8SRDS8/z92BLD
         ajTl5dgHyIxBkngpLFgEbE23jfOVB3ilo44jEMJAMXogByAjxhHClwmjJk4Ufl1iVu8Q
         Qb4OfWWQeswMD6M9kYXXo050Jy+w3pnak+QGSCqlowpmQMYQ+5UNxdo1+3A7zor5Wxth
         UeHuGYqQGX5cckPC6S67OgoCaB5gmoT326xk6ttjZODtL0Gpfp/14ruD4qLb0rhnEzxw
         rTSA==
X-Forwarded-Encrypted: i=1; AJvYcCWZONuglUWap9u/qhqnFcVQbV6ntf0o60UgkbQyaKFlOWB8ww1JGAsogLjOtQnI14SFkMVTTo3cdwdMYPt1dzdp@lists.infradead.org
X-Gm-Message-State: AOJu0YzxIWCvNjiZgl8+E36agQdQbEcnyL4OW0TPezIGPB4Cf2UM+mER
	cwX2ZeWPeQy2ngyvaipVm8RW8MCaI2HTlMBwjyGZS5tMlU0e8aseJZn8cIO398TXLC8fXfnmuwS
	qP3jC2n6KOPllTpWMsqsTA0x4SZOl3kuMP4Or0W6CGF6HkIhZILj0V2PGKFLpOoEsuwQL0FVRt1
	T/Uw==
X-Gm-Gg: ATEYQzyHLwpv1cNe0F2b1lkAL6RTBPycuEZ1LaFAm58hWInZtiwyXbPq/3q5kkYGdCZ
	htplkOjXOiGB43NNFD+RmH5qdn1Od4aMJdu3XJBsgfAuSwlgDlM3XqyKbwauoJSwgJ0wPhntkTC
	fgNrPzLtVNDFyVkAKxGp/874AUqUEdaa567yyDFrRcVlvF30qFvO/wF0JyKKnDC3w1eqV34H7qY
	rpOuogFBtnfGW4cILCkOG2b3iLh1/eSyOUF8qJ1vmHtwY5TZn8LdWRF94VT81KDqqF5DQcKGbKW
	pXkUL4oAPsVksztbdNnFTTBGz0eQPttdTSOiAPNFql6lQdfwU3Q1yUUDCETkSMFw3Y+IJQX3oFT
	5v5lgcrIL0HFKF2qxV/wtTZxcbkxM6Svtw/hIXBdEjgYrL/cPId27W7q4Zma0l1TZ2hdPHmlcO0
	Ywu4ez3KDg32D3uMtH7IkPqAQnxmVNrXyFL9Y=
X-Received: by 2002:a05:620a:4801:b0:8cb:4066:7acc with SMTP id af79cd13be357-8cbc8e4b74fmr1215343885a.50.1772383671061;
        Sun, 01 Mar 2026 08:47:51 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:8cb:4066:7acc with SMTP id af79cd13be357-8cbc8e4b74fmr1215338985a.50.1772383670575;
        Sun, 01 Mar 2026 08:47:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca083sm1146993e87.31.2026.03.01.08.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:47:49 -0800 (PST)
Date: Sun, 1 Mar 2026 18:47:48 +0200
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
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Andri Yngvason <andri@yngvason.is>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
Message-ID: <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MyBTYWx0ZWRfX+jKzNg4jH9Ln
 iGmQyXFNrhqrmGRJDCr0/coRWsPg2KcK0TzOpHxrXgaw2xiL2DtD0NKSMrLw7Szv3P6hfqA/BNU
 AMSy08dcOEc5hinMYJR1/ZubkSmhdGtrmALWh+KwuNw+7ZM0GW+nhZ3QfhlQr8BaxTDLcmpEZRQ
 PQNm023+dRyee7foicHomoAa2yPwy5RzjHmZRnt7J586jGZQrEAImwfOt/HyBnTiKTcyk0q/EN/
 NKpDWG1oBy8+FbuukiLRczpAknZz0q095cdo75RQk3DkFKbf7uommaEBHwJHNgALC18R9sBB1wV
 TJckPOGnDOZaufm82XQrXbBAmzHXj+iKGP4a6OI/Khs8ciXoeuVEkaJlFIFtnlrdhtDveV/0hbt
 uh8DJHVracL9ZhWTcFPVfk51GbrtBUvm8qw3WwanaJ7pCibnpkUEqjIWNRNQh8zHB9HnBKb80Cw
 GfUF0ULPrnW744hd2hg==
X-Proofpoint-GUID: 9Qs3rze09NYu_IPVHkU7oMibSTODtdOx
X-Proofpoint-ORIG-GUID: 9Qs3rze09NYu_IPVHkU7oMibSTODtdOx
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a46db8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=yDUiu3_GAAAA:8
 a=QX4gbG5DAAAA:8 a=bDwM_fcg3tGIVG_HqXcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=gafEeHOdjwYkg5oUpzAY:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_084752_620712_5B50D2EF 
X-CRM114-Status: GOOD (  21.31  )
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

On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> From: Andri Yngvason <andri@yngvason.is>
> 
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
> 
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)
>     - rgb
>     - ycbcr444
>     - ycbcr422
>     - ycbcr420
> 
> Drivers should advertise from this list which formats they support.
> Together with this list and EDID data from the sink we should be able
> to relay a list of usable color formats to users to pick from.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
>  drivers/gpu/drm/drm_connector.c     | 124 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 103 ++++++++++++++++++++++++++++++
>  4 files changed, 243 insertions(+)

It seems and feels that the common code to be used (almost?) everywhere
would be:

if (!drm_mode_create_color_format_property(connector, supported_formats))
	drm_connector_attach_color_format_property(connector);


Please mention somewhere the reason to split that into two functions.


-- 
With best wishes
Dmitry

