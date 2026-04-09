Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550FF364B6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy24ThaE7zxCmOTOVBB95xQISwb2qBaf1w/hIxxQ6/A=; b=omWNLlj2AyFSs6YoNen9M2qORp
	zwclnpjsw2S+7LXjrTIl3qSFl2vUdxqJVBXg6FJYKX2Ogvz7kzmyGaHYO2heGnsRME1gXYaUwMHyw
	Ayojkc1hCGdsrQuEE/vSOp7BLn4V7TuQpywMzaTRmHBlSk1bZnqBd6wjXNyAwk4p+sbhOmuS+6LJt
	JZsAQElgrP4k641KcIGPN2rRC8yoIkEyPdaJQ+p8Kg+WzrOfPbb50vPflkpu7X8KfYdrz95EJQmUb
	7Hep/fLzvUiq6OZ76mUusBN+HRi+8AOs0QXvvyxgTQRn6UEf7D62foavhfdzZp7i0hr+JSqGKc+oz
	y/LT9Iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwWU-0000000BCrG-1gA7;
	Thu, 09 Apr 2026 21:02:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwWR-0000000BCqK-1G7A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:02:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639IIATh779509
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 21:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fy24ThaE7zxCmOTOVBB95xQI
	Swb2qBaf1w/hIxxQ6/A=; b=iwt83TLdksEzI97LSyWc2oo6OTCnetVF+TBZtYiw
	jVvR93rQ0vMOjI9AGB43I1+Z3MGaVKHQYJUcZtCZqTVo/msgQFETyPAZX7TmH5lP
	Er7k8jHnbsNkbtFBIu0Bgw9oaNxRBDsuYIdIpXeBbsrwTQVqSDNe4wmGkL8Osx90
	32VlGgSVpKG0UmeHh5TgbJx0etVjXLB0VhbY7KIvrSqkcHv7uR9Nuvpuxgvc+/6x
	qIpPaf8zT4TNVfSO7dpdO+FYiF3Pa89SwQWrkYQaWb+0/dujQoFTymbuiXbHzp26
	jgNmLP0WYZRPyl6YuD5rT2Ob8d92OA/BnC1ECwM/vs9AYQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hsw52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 21:02:42 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-689b18091ebso2768258eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768562; x=1776373362; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fy24ThaE7zxCmOTOVBB95xQISwb2qBaf1w/hIxxQ6/A=;
        b=SqfYQEK/b2FBvLbcUlyk5U9258qsWLJPxtBRCln7GJvnUSHdhB7WNzui3ePA8CaD7w
         nSFsTe0kN/Icb1WDrAwDIP3y8iblZWij5V9YM9iJt7Kr0/xyOF1O6xEG92WicXB0n0uI
         YQzs7fbPdiSMouNfiXoEUJScYrZpW+5IkolQcu34r14cLxwd9akz/zolvztAq/neM0ey
         xk0lZCExmFtRWuPZUt/R9+l1k84Cza/9hEhUfsb/4LbNKRrDY77uqfHsbgwIY2xcgrGF
         O+5KZI0kBzattqKKPxXczbTHDo6TgOv3GtT0JhXHa1n4899yX2lQnRTSogjyB+XX4CB9
         8wWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768562; x=1776373362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy24ThaE7zxCmOTOVBB95xQISwb2qBaf1w/hIxxQ6/A=;
        b=cXvuyb73besdjy6p5ySY7Dvxr1XqHqCuWeeNetTozIoAvbWaPnwOe5WC3QE8Z2heuQ
         5eoJcV3R3V3AsMvXTMrXFo3/u8J/zA8okGTY6OYdxpduKmfelBRkjVj25HGKJ9Gwsg0I
         SVhPAaABFsIlDVPMe8FrHHE+IxSaLQOGHOq07fNxQSoUiPYpctn474xcFyatt/iy5fwK
         OEhuLacCNG3cBSpySNatwHby9BiW7u3H0pd7jRBO6//2D+MCIcVOu+lOfMG77ecUMBIu
         Bp6rjWAKl3AYzv9UnwSxfpSzjPZq2abLlRulYj4MByEad74XMfcJBS6KWk3BJdyFae9n
         Au5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/uFuT0zQ0rXHz1hHHonTp9WIEPBJYjs9u8UUvIy2oLKY/Ox3ztQTm+TpDOVOMI4qpHSZizu/u6XFpuE62yvtD@lists.infradead.org
X-Gm-Message-State: AOJu0YySNXD64PQxS6lfw19/gtKTTO1B07fUOl88+VUbiy5+U7BF97Mm
	T1tFrjb1tM6PlHvzAD9AOqFOjPE3vd5JAWaqyhmVpVLpg9mD6qMwczlx8pF53vId8aeAudtWFhH
	f47xpDwEvdAvs/ATW/WxVFN0kRiiX3jzB/FrIKqxLVGb/x4o/LFzZhUUl+X59Fma8mPNTuSbPfo
	lkbw==
X-Gm-Gg: AeBDieshz1XOUH2BIOfmH7VmOQt9PE3rgI9hDmCaTTlg5DR2wOx0RwH7OT7vzOB6BPM
	uHvoa2g/J3JK8Muoqq2h9cQKrkieRmY38Umr0EspHtBSSyKJy+BGOmlL/pWVLvNR3EM2L8ZZRbE
	4uT1Xe/iij49sVufbYhFQ3eVy8PxUjRVX/tZ1BySDghaHCLZgw5FPfqHK02hFiO+/gjirrt4AQ5
	Iaxxa8RLTGE5zOeafMG6fDQ1SLeyDbUXrneN8T82btEIs17+Q3MwzySDjbtFN46KfaiO5WlCfrJ
	KyxHWFmx8DDtuwD9AIhIvPP+p8ynBXfIb8rI9HZqwPUCVRldRBcBXA46WfjzCnilnVXTLXJEP4F
	K1J8BwX9qhwgjcUhRIVOILxB3pYiKC9X0C3NqjgAeLYiymAyH0uWfecie1y88TQ6pYn+85sEoIl
	6huOnl7t1r+XVW+qhLGcDCY5R0OqBEB22b88U=
X-Received: by 2002:a05:6820:678d:b0:68a:3b31:1bfa with SMTP id 006d021491bc7-68a68d5fb3bmr2094629eaf.13.1775768561825;
        Thu, 09 Apr 2026 14:02:41 -0700 (PDT)
X-Received: by 2002:a05:6820:678d:b0:68a:3b31:1bfa with SMTP id 006d021491bc7-68a68d5fb3bmr2094597eaf.13.1775768561356;
        Thu, 09 Apr 2026 14:02:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee93264sm160532e87.29.2026.04.09.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:02:40 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:02:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        victor.liu@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, krzk@kernel.org, jingoohan1@gmail.com,
        p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, kernel@pengutronix.de,
        festevam@gmail.com, alim.akhtar@samsung.com, luca.ceresoli@bootlin.com,
        nicolas.frattaroli@collabora.com, dianders@chromium.org,
        m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v13 10/17] drm/bridge: analogix_dp: Pass struct
 drm_atomic_state* for analogix_dp_bridge_mode_set()
Message-ID: <cvm3mvyh5ggs2fsjmikzn6z4kf7vsgxcxl3qusyxnv6jmtt3sa@fof7vydwsvff>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409065301.446670-11-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d813f2 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=pclm5J9ib1Ufy00r_ZoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: Rm7T7jmJrWuH8piUVihJi0kpxKTGXq8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX5cxubq65dXn5
 VWiUFZzxgVqCZ6Eg4g3U88pOBDQr4fll5+S34pky4cB7TB9jqamrnnhikxyaSsVkVz0+sUIeYMS
 ofSK3zy4NHEkhb2stx05WoOmqLvDPjDoWDBev+l1LAmi7ccdvn5NXv21ttjT4TihX+fN3KUUwuh
 qk28/7MQFLFht79YDht3bgtZuK5iKTkjOiWsY3QKlw38TWWzmwseu2qJ+fjWnReCvq+7lDcVeDo
 0sF2+lZrSLsy6cR2/0PtxGbtda7m0Q8KDj08Xl2Xc9p0sU11vszm4YQZZQ+akCyVsfGXdkII8Bz
 v7tNFrz4DmLSlXMbCgtfvIScFUo2n7uqxbBV5KBgz5IDCOHBPsskvcY3+lQ2CfnP0W+O61K+p+F
 uARkgao7E7g3RONTq1i7llwvnaer6JTS6B34508mD/i9uS3EewVFKXihF4DAG1ky7R3ybHW6OnK
 dlkYfwGNDq1orRA1Iaw==
X-Proofpoint-GUID: Rm7T7jmJrWuH8piUVihJi0kpxKTGXq8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_140243_345718_02FC7469 
X-CRM114-Status: GOOD (  13.33  )
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

On Thu, Apr 09, 2026 at 02:52:54PM +0800, Damon Ding wrote:
> To avoid using &analogix_dp_device.connector for compatibility
> with the bridge connector framework, get &drm_connector from
> &drm_atomic_state instead.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

