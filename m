Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628F0D58CD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0DNNdGHDR5wlsCt28DXVO7/ykGGtL6iZ7ih/B1pDZQ=; b=k3s+oU0LqXifw+x11I3/op/0RD
	UBNrF5DzViLCSX5RjLdUnrtIOIWlYoLpWCokdzinqgAv9zNJT4q6ID8Fsiariw9QSapWqdApng+RY
	rdWwL806fnUahzgWlgM5cm+0OfwM67g/pKT/qpYsMTCKdc/yFSX6jUE1kv2KUKrECKryMMkXyM8PK
	Tp6W8URuKikhvJYSG9oWKdZPjacp/jE7tDQlL3paklq+ktc5KxTNN/dG6SZmUEbMi0YC40r0y4ipB
	dKHM/qkPG/UWEQ6N0Tes7fCjbHIEDQV/RgG5v9UAVDoDqIFA52Ar5e0uu1yCH1TJlPG2ECqOBUb3v
	fLZgtP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wb4-0000000Fzev-0QbY;
	Mon, 23 Mar 2026 04:09:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wan-0000000FzX8-3RgS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:08:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLnevC199272
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L0DNNdGHDR5wlsCt28DXVO7/
	ykGGtL6iZ7ih/B1pDZQ=; b=Hm87qYBK6EpqLzvsAKKiVfisJdYCA29Rw9vKImJz
	lU+T3ZSsQtEyN0sicc1mVQfFiOJsMlFjJdAn1ibQornp8c+1tT3rdXIfazxKoT+0
	r3paTKRMYcrOnDzrgpbSpH8tw/vChxTcx0bH62Dg3aYq57KgrNidMW8QBuaISVjp
	9YDOiKfjC+4FZQ48QIHNEtaGcdKhYgUIL8v1syDcBi7YbkbLuQbMbfbS/qXtxWnO
	xii5Fg3z6LruZZPDsJ/9otr4vKpZK54kJwDez+Wlgw8qNYeYn6a45LXb7YJua2dX
	FswqKzTSGkiGIaMaAod2Kfk0A9WqVRW8/qqRoxGYxhQxuA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e3sux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:08:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso316688441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238920; x=1774843720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L0DNNdGHDR5wlsCt28DXVO7/ykGGtL6iZ7ih/B1pDZQ=;
        b=CbSxRpMzIn12x7UEicZXYptQVONVJU4RYVr/l9y4jk9+o/c6ATe7A7YzPvhkvCEZr0
         Ae6Ph++LwLtI7YPu3Ol9qIYdySzgL6vMskluPWSZs5w4POMO6unOPxMsaIcRSW5N4C1v
         K/KKop10Oq3zWqvjRMvZ/Eub/TTRbSthb/Ol4MBVvXZ7T3agcoVqj1tRUPwJX0lXw5YE
         MXgtdBaDH3+gSxnFPj84RXiT20EZ9b2S68NIOyji+/FK10Bm1f+OoCOHgpM/JhbfJDbF
         GsjRy5FKhmNwTPHtav6hNexyoQB6N8DS2LkKnjnKD2fP5MxfPnIt0hIYf17fbn7kj0Qw
         3PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238920; x=1774843720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0DNNdGHDR5wlsCt28DXVO7/ykGGtL6iZ7ih/B1pDZQ=;
        b=DSVc8G9E7QYitT8vBcOC71FMPwXGJR9+kRoDajKaBx50Y9yCtN6YaY7EZ1vnJaZBzu
         gqhTFDc0qNYoOs6Fk+xSmGov1uwwjqmt6b35Saq4giBJKDCVZwfzggqAWmNk9L4jxhW4
         wG1cAl/T757Cv965e9rzHJEVDFulfppBDla3kQOvlL2Z4XaQDDwYUHoZwdVfnop/4mGS
         JHOk1j3jjxa5KtctzzXltf9LY9hYUp3nat6zTWNtKa3NIJ6MPjU/GvFsJ5IGZTuKSFqi
         Y3rYacBOUty6pUioEO0NFYLSx9pkm5qmOIDpR3WTKfVa936V0RjIJqFHkYY1DoquxFdX
         UTCA==
X-Forwarded-Encrypted: i=1; AJvYcCXje/VQTwFeogtsoY8Hy2Yve/Rafy9Z8ICFV6ZxmLQSzJFqilavYCwnw6nCCGB8tNcjcA876s9senxF1SYLGyEc@lists.infradead.org
X-Gm-Message-State: AOJu0YwtV1fInOnatGFEikRwpwIa8gKVmkO7g+FWpbW9ICoStG2RYa81
	uGEXh0j3938LW7LqfeAOw+OZNUIjwxlwJscB6y3GnGuhPlOOK0yeZVkia5hvHBg4ySzJtNxCoDX
	ODtaTfK1CQwRYqdlhnjRL6ZmyLTcSU8PGSPslIwcHPAw78VIap4+GP/hfggl5j4nNHqhlX9bIY4
	00RQ==
X-Gm-Gg: ATEYQzyyDFbayj5x85GxtgSJA03YKhK9Hhqaki49p0qO6gBQrJVC2w/LWHf6+aO2WLu
	Qr7TE09pBOICvHf7qFMECSt/ao1YT41MpXt6wiZU3kjK9u73ZtdvIM7T3m22AOv2ufIbrboYz6A
	8wNLq3nwjSGt6ixY8lZdu8csnDErHpcD4aGEM2AbogPtazgtgGwIl9NQGQ6KIx8JPP6d2QHCiC7
	UmyifyymIp1M2CojptFWCDeCLllWSPknMUQsOvesTEpMG8X/oqqGD2hSo0RWwvtipsWJYl/snMf
	JYW+IsWrVP8QryWKuVifoxZv0YCDpKviURijVUiEioQEBb9R3oGaOoRUNniF/SslnQo3MQP3bvC
	19mFNCMNL+zcl3idMlU6DxAeZxgkg+KWv0nPWWgaX6nA4jlbGTPdUqMsy3cOlPF4pFFxGeYyO4r
	9bUAujZAeDu48HVTVQwghPVsLVjUTV7hN7Ajc=
X-Received: by 2002:a05:622a:901a:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b37597952mr157491881cf.61.1774238920220;
        Sun, 22 Mar 2026 21:08:40 -0700 (PDT)
X-Received: by 2002:a05:622a:901a:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b37597952mr157491621cf.61.1774238919820;
        Sun, 22 Mar 2026 21:08:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm2204742e87.54.2026.03.22.21.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:38 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 09/14] drm/bridge: synopsys: dw-hdmi: Convert to
 drm_output_color_format
Message-ID: <dahh4njgirmhll7tttfxe6dlqaz5qhpyz7g2vztgvbys6xysyq@ord6abbyjt2i>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-9-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-9-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: _H4FxnDSG5r2OMC9BUoG0jtZfIs3rlpJ
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0bcc9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TUq2ns179Pknwtu5XVYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX8su6bCcmFenH
 tGo73JdqFtnWdJ/a0zBu5DriqHN8syIeDrUj3VixWKvQwNTR9OiJESohCH1IZrJS8HsU9aTTGY0
 xvyEKqtgQB8K8XbDTmIjAwBdorqMvxJ3ZaFyslE1ra2Oec2o0BqWlcCvJqQ5uFflOZqLd9sEYDO
 4ndReDUhdTPl4REn3Ufpp50qpkebMhoEK8v2ZpwlNl4mrlFSfwIFOkfNYrhBk+UWI3OOa45RYvK
 x1GMvV4i0YRFLKuTe5DNZpkD5EIZJIlk0Vb47OGQKQlmE3YtI/JoEnw+YI2XcNGiHQIamCM5nEz
 wSdmyxU0594izsLf5Uo7EMsrIORAS2nl1GcZx34a3ttkLH//N5GA8PXSUituq8geJm83PSuc/7O
 /w1+hwOCa3QV3t40/g798p8wt5CZOsIH3DQDUpvLtDxi1K7/zsg6K5jWwOvsGEdKv3QticYxpCZ
 Kjv77nEP8XtTsljFpzg==
X-Proofpoint-GUID: _H4FxnDSG5r2OMC9BUoG0jtZfIs3rlpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210841_966997_B48A868B 
X-CRM114-Status: GOOD (  21.97  )
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

On Thu, Mar 05, 2026 at 10:05:01AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

