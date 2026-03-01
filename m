Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7162CFD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=; b=rlafLuYIhW/Iv/7b6lhzK5pTBM
	eIHApW3h9x8slqzFBpT8DEHfv7tRUd693mPAEfjj/zh3iiMZG3l+hYfK5q6RqhJKmZyDmjvzm1mVg
	Vrjug+NOA6wuwLETKGiKDHScBRsQ4hG1zq8yRpz//gZkCJEGPxfIIEv5Pz1B//Rb2ODfgcYQtGJsv
	X7D3zx3j8FFUcDIOlB+fKFNcMaukyd+Dk/mGP0HrXUDfa9ptoAUlyVWp1sCTGhrGkkGvkxGgfbZNh
	kHIxNVQasQMxlbXXvK3nCwjbMEUNF3sPElghl4r88CNuBw6vpaM2aXZyFXilqP5hWMGY/cRTa8zDf
	+iHyEaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk64-0000000Bgt5-1D9g;
	Sun, 01 Mar 2026 16:56:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk61-0000000Bgrh-281E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:56:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH01kr3052055
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 16:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eOVsPPjRSHguluqilN+Kykf3
	N9M3bR0DVUL4ZH0XYBg=; b=g7bYISNYlH4zm8Xc8NmJw+M0K5jMvJ5cjPbQXgbm
	bGMeZQy7zp6MKJDjrHG1fpDIjml8NhjImDmfW+kEkNkuk8P3xFLHN90IqHo373cM
	RW5Ndm3pzApXW5silQHbujFxwqjOsi7o42PFypVLnjOlH32AAIGkMYcU1z4FAhXh
	n9bbyOltX81FKyM+Ec7S4fznCBe/RqQqafp0KNFl6kNigll5bQBsL0XwZxmm1AH7
	5OYkZGlfPKuqgshdIAdW+rO0jDOUncXt3YNu1bSO5WZY4Kl1DWo/wmKwpwLodB6R
	uuIKygv9NTamdvEIi7PH5LbqSED44L5RgmBIIQyUW0La4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgru1gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 16:56:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so3603644685a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772384204; x=1772989004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
        b=IN/XpQgjDNBZe1Zfnsezh5GeJn7PY9fwiYraSIv+5GhcETK7r6yeMeJ1tbExi3pCLr
         YCLNXjsZDblq0a38vztj/TIDspKFFQRcvXQkSTBO1fBDKIcdHiNRshwaTT9NnXs/GKqa
         83FqjYlzgYrzQ+ek1kagm8hVvPM7sUiHtAxzInP9KEehH5hKZxDBrKofnnos5CGGJR4J
         brPWTRKQMwMPJMqG7sb2dqCuQzTAioRo6oJKkg6UOmq3EFw9xBj5CTAnx6dO3zn94jQI
         /s8L0igEZK/SuJKYIFyCCd87hCj/sj0j6nqxraQlp6lcV+49JsgnfiBLiiCrXyFATv2/
         iBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772384204; x=1772989004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
        b=Hzt8MH/hhfofjFEQnrO4z+PJq5CcRcVC8yzMBW9DS6eQRMjpaYkHirkm274EQIqOjt
         GX8BV0AQu8vZO9g5fLaG6J34S+lvQlLSxV0EOO5Plou9V8rDxaVyOT6SBR5CDXdTMXfc
         Cx1aEkL1lax/eZe1efDU8g9gb6BFSFuFEt9CGhwJSscKSnZYlrV1CEy7sPg/BnKi8WPR
         qweVw86lyWvYxDGKF4vXpTpzjqopUTbcQbJY+40MXoHS5WZ+vyN+wy2M5ax9QH+fW+oZ
         JbKiCCC/vdLZPe6pzBrSLSZ38weKQ2TPJxvpINIqYbXretIGQ2UwU9IdNDwBwnYnrzYF
         EOWw==
X-Forwarded-Encrypted: i=1; AJvYcCXBSCXFbcK90RuFnIol3//Z0r/2yfSOWv87vzbYBseYC3/gbs7jamDwwRjjBSN0SWChjV0+1etE5OOHRnfA0KR7@lists.infradead.org
X-Gm-Message-State: AOJu0YwCVdkLHrMTGHwjwYbCAej8ZT/SUVARUiaicRE2rzjDi/Bm3Ls6
	ZdhtDGv2NrGURaW0yanOJgqMy1/kUQ8COpVIaAK0Ipx2gH1aI37+u0Xj+opYxaUu83DmozTLzlA
	A4xpbIFmBs0UZHQg/wMyF2B/uXj9BzApCeP/zYV55KDUnH5mV2DCZ+ZzXrjwMJBQUX7318a/Lkt
	b59Q==
X-Gm-Gg: ATEYQzzG4fnrG/6+1Nj+bt/O+jOD+xucf/JQno+fLqp7qW0CXqphGYZBSPW9Oq79VaR
	yV3szeQRASoQxKYKeQZxsUs+SRy3Nq4DmxqwAFDnThuDPOo81igys+w6dqdLlbdgIqTRTPIWg7i
	T+/O9coqrYHY7C5WvP5BZM2av/dlW/vTyPQxlgme6INTOkNisEFiyMtTV0Itl9ZySse57LaLey+
	hlXctTiWTlMNr1yoisEmHxEqviH4QwS0gHAG65ThX4yOajZcNdbt1puduoT8PYKbY9jnEeNS8+4
	XgGMFDgZ/f/VjzCZoETn/v2QiHDTnov5hybQOx7yCWggq9P1KfvkFW7FOseNeZDIOGoxLUPiv/W
	JjSG6uJ426p9YA/WKAs2DQXrvhpAl2x740EbNP5vSrSSTbD7XnSwxB30kh6FHoM2q2oItwF7Rbj
	/gW+DiAjw8wvdQN+rrok443gpRgwDeAxDJ8qs=
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cbc8d6719cmr1207727185a.7.1772384203885;
        Sun, 01 Mar 2026 08:56:43 -0800 (PST)
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cbc8d6719cmr1207721785a.7.1772384203394;
        Sun, 01 Mar 2026 08:56:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd9996sm1161185e87.2.2026.03.01.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:56:42 -0800 (PST)
Date: Sun, 1 Mar 2026 18:56:41 +0200
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
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <ylcczadyx5ovc7lbb57ehux62x6zbawf2k2pd23ymkp2meaqci@fvrf5gserw7j>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfX2wEOSV64QUGT
 pOAu6AQKaVO1Fi2xI4rZQCVasz4vnPP8E9aPs23ONX37w+lmHj2Sz57j1xfKRC74LUMWqj5uXMT
 QcHHz4VkUL6oRWrnuQSuvgdFQTEhqwB9c+qS5dL3nAvPbcX3Jf8oFcZBEg+sUCzq7oENqcUvpJl
 5oIxW9FS9XXfQ5tcewAhJu04PjSPJ3X2WgG104J1kJe1+tLkL1vF1sJF+VwvQfCoPw4R5xEtSKF
 PfqHJeO0ZZUtbw6x7W/etTkMb4+FCrcTVKFZZ/U5N4dIsAS5ovBdH7SbvAiQK70qsPJfzCJQzUv
 D7QBTzdoawu4JAmYOgepgH7q8C3HUhjLiq74DwnqL2r7182UO9ZEhrL8Q10+bJiPx3It3MPTMUW
 2fbY+eK9Bgx3s3sT4xkgyYwxPGKcThT7S703DvHNjX1wzMGmIU2t/GHTd1fGtzG64zmBDNlLeHm
 glbcJaMdafqdpkOPuew==
X-Proofpoint-GUID: RvtywAU4gAW29hA39C4sdUiz-kKawh4q
X-Proofpoint-ORIG-GUID: RvtywAU4gAW29hA39C4sdUiz-kKawh4q
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a46fcd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=RMrH-QTV4azj2PXgkmEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_085645_994907_F3DF5DC2 
X-CRM114-Status: GOOD (  19.15  )
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

On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
> 
> Implement it by translating the requested drm_connector_color_format to
> a drm_output_color_format enum value as per the logic HDMI should use
> for this: Auto is translated to RGB, and a fallback to YUV420 is only
> performed if the original color format was auto.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

