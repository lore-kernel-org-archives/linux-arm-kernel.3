Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1BFD58CCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=; b=FyHNqj7JyYrzjiTgNh0RYDIpdm
	wqRBj6IiEvj3m0g+cpBnaCtBqKFYYggzScukSiSmQ444fRAjLk8ASgnZs9xQTIfPdC9g0CaJbrQbj
	vdCDfc6W1h3i9QweIpKADA/z7RaI4pskkAtBpm0MHqhSeN5FPHSjxpNRpw/nZjNmbGsiiEFS4olNZ
	EPJMsU68+V+ZVeDIPrCM1AUZNQPo556kv9EadGX1PY9AQyhW1wnmg2srCh6Mu4axcPed1+w5VyLWC
	IrXxxpnqCMwpte9z34i/14Kmfp8xPwJroyUgyzsPa0EfkKKfDJpfZL34r1JS6EjxRR5agXhlB36Ya
	KFKYfB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WbV-0000000Fzsa-3Nu6;
	Mon, 23 Mar 2026 04:09:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wb6-0000000Fzf3-3oPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:09:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MBo2nA2173767
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mLU7+MItDUu5Kth0lmGo6bE
	IH05p2nnnuPD4hW7xVo=; b=PJM5pA+8Rt+CP033st/WkGLskaoVd4kJ2BweO5Sh
	6RXUql+pqIyx8wo7KPHvogwy6ApWsQP1j0BPMjHgC1FBuyJnWnDgW2r2qI7TsUqi
	lqzMi6Ml1Ye0E10VE5n9jF9747H3vVQdENdPz5e1lV/gR0rao9xzqK82jWN3s8zY
	C+68PvP7iz/GbY1epbq9ej2RUlYmh+SJRFqMpVgU56cyWBwYsxkWmqfOrwhwjY3i
	yPCb5/wgJW3JLgpswMvct5EcWgxjtBFZLI9fRkVcdwy034NKz7D/cgD+XC6BYRHz
	bujwB1nCbXbN7gV/TlGRRsS6Fwg4gNHT1Tg+H3k8z7G3yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hkph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:09:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso529309685a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238939; x=1774843739; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
        b=acfbF4xk4N2ymXOGxHzpM80MC6hexBtGt4UL3ae6LzOUNXNeVNaOr8ZbieHeEAhFpr
         Wij3aCN+B8i3UCUgbYDgab7ZcncLGHPop2qgHdKBgRMy62vXShn1h26SCzUiBRnAQyvl
         d7j/hj4/Otv1NC64oIH6I9MickP5984SOFQrT2ka8vCQKkQsNWRoMaJSbTMn8VImQElA
         pUb9ZBmU9oV4Aq06Xk6FmUGsBOAqC+t0+ZAJchunvnyluUmOWCsdcc68CpaxC4sKDs/k
         aHaKKQCcqLfniy66JIGiDPFJVWGbtoq8vwrQuUYj0IgueR1k5eDIP5IR7Jt9LwIp79MW
         z9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238939; x=1774843739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
        b=Fh3T/WBbM/FApBpQ1ct/isS4z46IK8DydUw5fEBiEMh5fdGkqp1CN5/zDVQIY+Typo
         EhszNtlZWlWJL3Dq59zIdn5QxBcclfJfH5tFq6We3TVY7YRKNZZzXvYpdSv0aEEuQhXg
         FsIAONCrU+GvJWDNzsVY/oNMKgdIv2w4GdJfx/uOedkOEo9aLslTMwaLAPq3dyv6rBZh
         /DcisFW5VGrD1dxAWNJNcOBUl5+z8rdVMHvQZJEHU900YIaRvbcHBmLygRBQvQ1PTXJN
         Em0qhTWwkE73jWrm+ExfYl9ZtTYqxMT3D49S7lVq76Q2uJcmn/lVoJEFzbDW/8RkdaO3
         xcjA==
X-Forwarded-Encrypted: i=1; AJvYcCWWFm4BpEX7oDGUbCfiCP/w2E7nPU6BVA1ClN7uUdiYPwylRKBiaDjDEP+2usPFTngoXkrWIiJN9+lC3+e9k9gz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Y50dmPDO2Q/jraXH0yj5SJ0aUnOOUsUs7W4YSafnNhOdLfp3
	C+7T3vQxZ0kqO90iigPE6Zz2bOVMtxsrLoCRwkRUu0SyCIDxc1DJ982MjvvBYCzYB8yUgAu/JVy
	SBXRBMEBFinAxhpSGE0BmkdNyIbRmZ5mEGsrOU5e25G2pnTBmyuCPpR1Ix42WgoE5n8rfImpznw
	nyWA==
X-Gm-Gg: ATEYQzx59q6VPap2H5HaRIQZfFFPJ7DVX1e1gGL9gf9o7haBK74Y6uLiL/z9AQl33Bn
	mphGc2qPpLf5RcmTR+Tkt+a5eBChC8lRVEYgdLZgm53TbhUnUJLlWtp0HHqJ+3SL2Cjd9WtEoo+
	1hyEcnEaSOaGs1uGZm5nWXuy/21NYadiMf0Xvc4SUXED1lCGSqSIscZY91D3rt8RLk4DcMkaw+v
	ssB8rNaR+HFRub4iDcHNr7m3ZBARagSTawPAEDUbpixD9vItf5Ztb/hPIa3nL595UzBYGe+q6Qu
	sZks0t3ipzzt+BpifxmFb3faI3EVe1csE9DvlSRuRNgCjNzicRq+TdTqe9J0ZqFMBcvjzGUC+pH
	EhPK9xHtnY1CWjCWpduEFvxyhKkdDTu7t2YUyGlKlM097x2h6M17hvrzYo1VrTBVbMFEx4Rd9V1
	ypWMkR7EG5GdHeHIabcHDJ0t8f0qWaSrxM0wE=
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id d75a77b69052e-50b55fb20admr59358661cf.5.1774238939256;
        Sun, 22 Mar 2026 21:08:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id d75a77b69052e-50b55fb20admr59358441cf.5.1774238938791;
        Sun, 22 Mar 2026 21:08:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm1994449e87.14.2026.03.22.21.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:57 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:55 +0200
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
Subject: Re: [PATCH v3 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
Message-ID: <lfq2myl6gnzog33md2madm3qky2x4sasbrqkthhvdvgtfigrjf@dc5ccj7iq444>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX1BLSkItq5LEU
 bfC86ntzVIXYaV8j/oX5dAW1f/v/w2p/gbeln+lOD/u+2aBo8X9Ulgv5XtCpKpXWvGYgJBLAUKi
 FGCMnfIT1dinYoC21aDw+EqRvjrLa7xjlfeP3gdKwdUU5haaYDd61rkfOFi/iU1SXT0f9ZyXcIz
 cYZLxZKCjjkw3D6cqKOv+/RQYE3D6hzLljtWuf5JiB2IGx65Y11+CJsuWN8CArbE2hil4LVq1GP
 xXK6sxS9+GcC//fQVQ5mxHGPyTB+4/RYrKo9mED/klspEwOfWTYc83c3/yqzgrI7smcEyaOxn8d
 uBzrfpcf5B2jASB7CXeFXzjLCGD+192pUG/NHbaZTe+h2okY73dxkdXXyIlZqEtrLpsprAz8f9Z
 D6aSq0oBdaIeTmUjDS10j3qB4Kx+P9fleGReXalQZ1lDEFE5wGuiOyi+q1mHtT/8v0MtfnzbXy9
 /rr3Vf7znf7FP53TW9w==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0bcdc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z8SGupnk27XsGNPOeu8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HIfGzZFBbOajiEfjrpTURlvshNYU-E8Y
X-Proofpoint-GUID: HIfGzZFBbOajiEfjrpTURlvshNYU-E8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210908_148077_7D2DDE17 
X-CRM114-Status: GOOD (  16.05  )
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

On Thu, Mar 05, 2026 at 10:05:05AM +0100, Maxime Ripard wrote:
> Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
> the new enum, we can get rid of those defines.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

