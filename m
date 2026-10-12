Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBA1CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpOndlgPfv1kdWQOBM72wFH+Lnf26uksnJykK9/Hdy0=; b=zfnyClG60vfHcmoDb+8w2i5jev
	N7s1941A54HUEmk3kUTOYOj0iY0hTT22qIgW7IQrjOUXer4OYQP7DRexFqt7pOE0LCcufBDDcY4T2
	dA0NK9p+g78dll68ij531n8zv1+8YvX3JYwAle1p8RTIiX0WpHPIXpEHPg3QUImwKpyezn3AaD5v3
	cGSg4ahrYhFlplVVMEbr/iLn7aUnMGZCe53vt8kMbuF9IFzf0XJXuU4jmKlpiMdi4lTcj0sQa1MQG
	+a2l6WwE66lxIGy/2J8HH2x8ourqVWwYsa8IN27Z/o966nV+WPO2dRp4PnFP2UGh0itv+co+EGx0f
	XauZFpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKY-0000000AitY-1VAV;
	Mon, 12 Oct 2026 14:48:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKU-0000000AirI-471H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:48:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08uT1933178
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpOndlgPfv1kdWQOBM72wFH+
	Lnf26uksnJykK9/Hdy0=; b=leQ3bD+g5c4VwVA6byRTH+0bNQu9f658P3LBrm0T
	OeuBlhUzGR7Ak7FXaNvBsYmbvOCx4iV/fyfr7g2TBld1Ih9q5tdgxeH4Zrof98pY
	yer49v/uHQp/PuurFmz/HVauIFCeyCmNVC/UZQ3jRqT09sGtEI58x+P2uRzRufva
	CR0Npj6JR4C31oqsUyLrqhqGA6FhBT4LJondzTSWoOOwl8JrTrYTSQW0CIP7++hE
	XC13s1ELe1gMVTM48x+eMKyN+20CrBsX1zL+ninXNBmkvBRSoQtSIfugCPaVBVI4
	ukHpmfzp7qGfeT6y8elgPZ7KAmFFIntQNJSm4G+aJvO6/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjqfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:48:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917bab67568so68058606d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791816521; x=1792421321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpOndlgPfv1kdWQOBM72wFH+Lnf26uksnJykK9/Hdy0=;
        b=EiuvBguNna9NqFDPcs84n1+vNG4Pd+C/mHJj+dfoV6EX1/0KL/r+2dT71c0jaCrn2E
         gQcO6hyUD3r7q9uf3apgvOj1eB/Oxyl7em9bps1aTmD9fHuMfYsMi1lfZvEd1MaXFkR9
         aIVZ1UaJFccFGr/ElDJJRVia4JRO2UJDu6vmuy110P2Pm+IEYOrE48Fd5ydu0rAeLthR
         0wUE7S4V4FEpdi+KyMDb1fytBrjzdxHYBfi7k1k6ky7i2ucdKAczBNIbbzuQvAHPY/7b
         8SdlzNNZzN7mQHz0P0ntaFFcqj3j5DhBz2DER2F8H5q5a7NfVmwJXlHR7CmBBGPlGT+r
         WJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816521; x=1792421321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpOndlgPfv1kdWQOBM72wFH+Lnf26uksnJykK9/Hdy0=;
        b=NYmWXOsWnWZKBJdZrerZH4ugN8jcw2UhBazdRqW0uDGCWetUGyuwahqZm4nPb1CZdN
         sdlQ6m/AeYWCsGtuFJ0jga/h912EXVkX5aq8JXzQ/vFOcJMbqZUtilRSyv7r6rqIjDX5
         HEIWoAFRHCLlQpvfnmVLiiA9nD2buNBXwc5ywiLmJEHEavPwuBGHguHQKrsiXPNgfI24
         y4oV2UfPHbF6hIloT38YSsD01sIMk2taS7juStjRNbEEZ95iQgYy/MsOpIQlmiWv7pbH
         e+EexNl/5OvBTh/7ubXMw637mk/dAnvUw25myQ3YeHFf3XtGbYIH6ECs8g7k2JYkkiU5
         QTdA==
X-Forwarded-Encrypted: i=1; AKwUvBwMXBarWw/8O/PPrOVTiit9gfJjOthgc+djuiKNhKI2XXZUUTmnuKTeQLYv/dKxhsJKqjqrNDRcVKumcD+6Y9Zr@lists.infradead.org
X-Gm-Message-State: AFq9FYKkflgbHAUM4+2S/6OZ23RrIodvxomLIgqMrSH2uUy3YyQwszHm
	suDZIhGOynlO9wh/Rg0kM6vFJQ9FbALPBS7657oVzCa9oNrZ0/mnxlFe95pwm3mNyKc8obkwBPq
	hj1qWzuCv/zwqFvsYbjtA3sEj9LmPMuI/PIgn15UIsAjLD2T3LmFVEuqrDB/P3oVTpnE8CWxfvt
	BN1Q==
X-Gm-Gg: AYBFou2iTxMgaDMcZYXJepQeNU2Zchrb5TSjMEuhwsuVOaJ0akuMvV83yIy0Hx+Qs74
	ndiV5wdA8wCo4LxxxGLK0jccjjwe8lS0aMcCa679Av6SpN6Iq+5FOXDV2QooqTkWAF+7MOQHJ2F
	sF0Dr6p/v0Nw/xYA394OcpaqrfBWzYUZ4erPCmi9vLvJ10WCfQec3u3/eMUPhX8fg8Fs66lZSzb
	CktVVhGpaFVf9AqnS5C5eOkRoDrG5iiauF8Ckp/YI4IpiA+uK+lfEl3yK89AS97z3N/aEggwFIP
	n5LG4dJ9wUP7EPfyBrrDPukykeVeDcJAyEUVhaqwj8ntg4AU+IZ3KYWBmpVX/Ib5Ybj+YvGM8kd
	XfQJ+sHfe/Cl+x+3nDe+smDpslAw7qymbVhHI4U/KtG443RqK29UFMbRAReI0ccYr3+qVhVPFJd
	yKaod9HZEZiPIS
X-Received: by 2002:a05:620a:4694:b0:93e:d1d0:67f with SMTP id af79cd13be357-93ed1d01a42mr1036814285a.51.1791816520911;
        Mon, 12 Oct 2026 07:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:93e:d1d0:67f with SMTP id af79cd13be357-93ed1d01a42mr1036807885a.51.1791816520206;
        Mon, 12 Oct 2026 07:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cc7689sm32134791fa.24.2026.10.12.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:48:38 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:48:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 18/20] drm/msm/dp: Signal BT.2020 RGB on DP and eDP
Message-ID: <kjt7k6nrlctvykvqrlvl7ftjeul6woarmjcotlvdasd4u5jb6k@oc246xwutq4h>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-18-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-18-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX3S+/d9UyEr1z
 pPSlCt68cUB/OIf4VbrWnenyyqlzI2mkZS79XFMM7W37N4KLZuOwWuCG64tP2mMJG61pHUNA0gx
 grOmht7b/rud90xsw482gMmCCb8Aoj5K3R7qk2noGYQaJQFLCZbD2DjxaxVa5c1/RZJGL+EDeQr
 rv4e5XdYzuviZbGls3ConbXppekeo/Wfot9T0jZLNFzBlQU66cW8ggrBbwOMWpY0PmVDkS4bcWT
 hWmk1QsnScqhRB0+CDdnRl946/TPUhUTapEL/4iMnQWmJ5ZFneW4AO81vTwI8hG0vefSqcunKm4
 b5ymrYJW9ZOs3nzGcfA+IZ3/PZDYOTUIFrumerQuKc0X5ZM/4+25yozW4zHAiTJ4rJhvrTzXe1o
 ZzsPvc8VI+HZHGXQtzSNo2ePCboqGY/eujzt3KC1L+JX6QJS1cn03YtCDQR2A5FUlcY0+4PTnF+
 bX/ZotAXFzum8Xox66w==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accf349 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ksxQWNrZAAAA:8
 a=EidWXHX74OIilm-ZvMoA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX89YXz5g8SP7l
 acUwlk+M6raEtXfPiyEfrjiyV0K81ybC3/BVzemQ52kDm3wOZ/tmhqyS/JPzchlXBBwR4AmCsuf
 SdJUFduYbAL3bOiLP2hKNy2MYzaKWiI=
X-Proofpoint-ORIG-GUID: DLoFrpI7d2mKe93D_OJpun-xckNYX0FN
X-Proofpoint-GUID: DLoFrpI7d2mKe93D_OJpun-xckNYX0FN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_074843_275550_C7017F63 
X-CRM114-Status: GOOD (  21.68  )
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

On Fri, Oct 09, 2026 at 11:16:10AM +0800, Xilin Wu wrote:
> Expose the standard DP Colorspace property with BT2020_RGB support and
> carry the selected colorspace in bridge atomic state. Force a modeset
> when it changes so the stream receives the corresponding VSC packet.
> 
> Signal full-range RGB to match the existing pixel path and retain CTA
> range for YUV420. Reject BT2020_RGB with a YUV420-only mode. Reuse the
> preceding VSC state, update and PSR handling for the new colorimetry.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++--
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  9 ++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  1 +
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 12 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  3 +++
>  6 files changed, 29 insertions(+), 4 deletions(-)
> 
> @@ -456,11 +456,18 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
>  					    struct drm_encoder *encoder)
>  {
>  	struct drm_connector *connector = NULL;
> +	int ret;
>  
>  	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder);
>  	if (IS_ERR(connector))
>  		return connector;
>  
> +	ret = drm_mode_create_dp_colorspace_property(connector,
> +						     BIT(DRM_MODE_COLORIMETRY_BT2020_RGB));

Don't we also need BIT(DP_COLORIMETRY_DEFAULT) here?

> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_attach_colorspace_property(connector);
> +
>  	if (!msm_dp_display->is_edp)
>  		drm_connector_attach_dp_subconnector_property(connector);
>  

-- 
With best wishes
Dmitry

