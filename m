Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E39CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXs862lHntqXQwNUIePs3juXTkdDKRSL4lc3ieGUpc4=; b=rCZ+Q09O224Elwr4Ah5ngdP0yV
	+HWU2UtsYTHfdv7l0zap575jGoZqPGKqfXMGB/7DSMrOk9ri4Cr2gI7HrZDhCPWM0Q/Mf3dSqoPZb
	C0EKqFls8fq5kB0NhCYZIvEQqaKdCMCdqPX2JIh7w0MzJBOE0rA+kKu4BY7wFr/CU2sq+Lbi4M83k
	ZezUlUu8/GNyAQvY/nOqgDQgjMrnCye63USRgQObOvmrGeoXUx1Cr0SluBIjhTVNhCsCnCzYTBsEV
	MxcK/UtJx0DZpoj/vViSyoBmWAG3ejL3G6QH7Addn2FxmTMRlX5zephEd4nAH8YEbnm2jzG1dBUim
	wY0vLnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1eb-00000008n6m-0yw8;
	Fri, 12 Sep 2025 11:09:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1eZ-00000008n66-0Os7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:09:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKbm009098
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXs862lHntqXQwNUIePs3juX
	TkdDKRSL4lc3ieGUpc4=; b=bl+MZNeRJm2odMXHbz5MBmppwbDpNzrIZUDhXYto
	oiHlHMedpKDBvrKEV9cQVUoTs3htou36PF/hMhh2kQ2OWZjice3mAmYehnUKCDxw
	9Qk5tAJ7EuA/S1VSGHIbv0dBNL3Qa8P2zzCd1xPRK9J9l0OIJBUiBQGgJUNxURtl
	54AzGO30qSd1N1QJtKRnyLUIMsuYPa2tuwlZ00w8d1/bxQcz27udyvhOciGRVu3Q
	fa+OYXWq3b/k1YX/UvASSsDig9EMaLum0zGnMGFbAoBDVOw21J+YsVeb/zdZuSzP
	JKUUO3z+3kf8nud9zavD8wMGa61CFYaEHfrHXPyn5gRx7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13cth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:09:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de0bdb600so29017256d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675357; x=1758280157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXs862lHntqXQwNUIePs3juXTkdDKRSL4lc3ieGUpc4=;
        b=FHDlUCl3d+0zT7nxiJt3HQBu21PYQgQS0s0oZWD4DmDublkh16AhdpKdt3e+bN8kiz
         33G3XBL7nbOM4sUiKTnpvrTTxvS74+L3zhSpRlZpIl7kZOaIKCpMhm16IJoGX/LOwOTO
         3DpCCBMFleAf3bpEnZZCQM88+RFjdoizZ7dLSGcqT39smrGSliiEAxeDXcX6lEpQshY9
         Iucv7wmqg99ErZNaKI7EBEaJzDj+7MykHEgAE6rIZXSSnaLVfeU0sXxlEfaF/hoI2k/U
         8KhoDugAhbM/CFnpOhIDgmgA4VTJmL4uQla8yZ1LwAPA485HFmTx0gJyp6C2unSYrkUy
         9+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXg2URI8G85bKDREJbGWiNAqMd4cmrNnmkKpLEncyEpgxXrovVXZMGU5ZfCZFegP0FF6mf9myramsnsHky1FVru@lists.infradead.org
X-Gm-Message-State: AOJu0YwjvoQiCkU/mvj0V1ALcDey66la7p7FAorb3UatMHbf2jT2fCmt
	xAbUEa/l7dr7YnuFHmGUBzgg0WDKlv1DrIVXuus9+X0A3+0qDbbQP/KPIzt+8EGqGaSEcaWrgtt
	va6fJZGe5MpttPnT+44CuoTgCEne4uqMHf1GTOJcbfnP6Ea2uT1fJ0BbcBPmkCSY+em382rwIvX
	9zdQ==
X-Gm-Gg: ASbGncsaAMhSqsB0EJf2RkwFKltoKS63VKDAYyjkmVxKhihlt3RxAFlBKYTeS7GFL5/
	wTl2nIgKJWNhVwxZ8cVEc35KrzdwWkm7ns7Wtg7Trfk/Ns13NoTLj02dRTxY2GoEGyG75wAGCNr
	a4MnTzUrLhLe/2O/46dVK7Z8vnegElD8HYgNUr3pIkbKILVig7psUBqJXTBR4Rz0O8wtSUl5094
	GVMBlBVI1gyLzsdbBHHVUErBQY8RAy1q3hQ0v5Vt0ziTsR1yPLZRdVEq2esaoFaOZWjIIap5xZb
	pXvb8mL5Zl3s0nv3srCysPGx3hspLjuJzGJC4oO4UhayPyy1sj6MIc9cPtag3kdBvN7HJhh5DGg
	Ox3OKiJ+VQdF9ZLlD/xRyFq+MLTCHvklObQJa+YL5KdIKOssmRAR9
X-Received: by 2002:a05:6214:5292:b0:729:3942:651e with SMTP id 6a1803df08f44-767c46ccbd0mr29918386d6.48.1757675357076;
        Fri, 12 Sep 2025 04:09:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwpwkiF7tmyFiOg9b2iM6+kt1wZ6fedFzLrjDmSArDmyBGneXRRy71xO9JbYjDDc2/GjMUTg==
X-Received: by 2002:a05:6214:5292:b0:729:3942:651e with SMTP id 6a1803df08f44-767c46ccbd0mr29917766d6.48.1757675356530;
        Fri, 12 Sep 2025 04:09:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8212e3sm7522231fa.41.2025.09.12.04.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:09:14 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:09:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 15/17] drm/bridge: analogix_dp: Remove panel disabling
 and enabling in analogix_dp_set_bridge()
Message-ID: <tywxkfjhulxsgdphngtfs24whslbkmnza7yx2sb7c4ulea6val@46pi6e2sjs6c>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-16-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-16-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: TQmzUnW5VFt5e05MfxmKMU2ZjKk9BqG0
X-Proofpoint-GUID: TQmzUnW5VFt5e05MfxmKMU2ZjKk9BqG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX2z8R6th0860i
 vTkdPeXg2i0+B20u+wHPOUIH10vYlJw+HEXg47MmwlTR4jqI2mlZNourCXX1kiKoCoUscr8IARg
 PASRlDImLgMwn63IVLSU2B+Yskm0hgId5l0P6f0g5OOlaLz8cBRPHuCJ3//GMZtrJFrW4AMI0EC
 NpDUbBnCerYPVPCE4ekzdJj0OAC4lXq0YWo3B0wOW5MmBWKqqMhWVFp/B5QqJgJLqxS6HIZztzq
 cN/Nnmx/j3CDcHHlgWdaOyV0fKItYU5F7bErCnu/XxQLCBTiNDXnKwv8OOCIE9mtm6iNTka6xij
 9lLYXl7Fc8vLnWdtbvh+gNzzyyUpe+H75zIaRcAQTkbkLRyeZIJ6dLD+4MCxDOi5oIOMpZ65H54
 97xRuWkz
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3ff5e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=xk9nQhndt_Gh6lZpDTgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_040919_257223_4C977E2A 
X-CRM114-Status: GOOD (  25.31  )
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

On Fri, Sep 12, 2025 at 04:58:44PM +0800, Damon Ding wrote:
> The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
> help turn on/off the backlight to make the image visible, and the
> backlight operations are even needless if drm_panel_of_backlight() or
> drm_panel_dp_aux_backlight() is applied, in which case the enabling
> and disabling process just add necessary delays.

Not necessary, it can actually be turning the panel off and on. Maybe
it's worth squashing this patch into the panel_bridge conversion as it
will point out that these functions are still being called at a correct
times by the DRM bridge framework.

> 
> Therefore, it should make sense to remove panel disabling and move
> panel enabling after analogix_dp_set_bridge() finished.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 66d0cca1f268..c98058e9c917 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -749,9 +749,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>  {
>  	int ret;
>  
> -	/* Keep the panel disabled while we configure video */
> -	drm_panel_disable(dp->plat_data->panel);
> -
>  	ret = analogix_dp_train_link(dp);
>  	if (ret) {
>  		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
> @@ -771,9 +768,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>  		return ret;
>  	}
>  
> -	/* Safe to enable the panel now */
> -	drm_panel_enable(dp->plat_data->panel);
> -
>  	/* Check whether panel supports fast training */
>  	ret = analogix_dp_fast_link_train_detection(dp);
>  	if (ret)
> @@ -1156,6 +1150,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
>  		if (analogix_dp_set_bridge(dp) == 0) {
>  			dp->dpms_mode = DRM_MODE_DPMS_ON;
> +			drm_panel_enable(dp->plat_data->panel);
>  			return;
>  		}
>  		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

