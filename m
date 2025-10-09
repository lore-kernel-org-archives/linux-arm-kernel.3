Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8070CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u9Umol56pcPf/8TeFs1AIjO6NYonp9MTQXBusmiU+Q=; b=s30ghE37Xl1pUB0mSaQBJs01V3
	ASaQgsAXJuKg83TTMl/lkEb3dkewJQUucf0QtdB2ld+ktBZFVdKJPWG6tL91OW/PTaJIDRGs7L+oK
	bO8E32cHJ2Qki0pf43vyfRVZBWo50zXvqEtSZSi2e7peoxM1ElI7bmlGYO89M+mFf8ISiSJHuz6iu
	U51aGoOOW3hdBDWwWG2cMKpf6XtNDWItTO9qxrNLG7z63wsOxUC9Asc/gn8x2bbaeGGIpFBXGsVcy
	UnTaaJoqt68RtE9ItcBf1rwL8K9FK0Dv9omgwNz07ZCnME2151MNbotdw50y8b/saEuaHF5M3c+Wj
	T4KMPklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6z9Q-00000007F5d-1DBu;
	Thu, 09 Oct 2025 22:30:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6z9N-00000007F5J-47ge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 22:30:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EB6vn029992
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Oct 2025 22:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7u9Umol56pcPf/8TeFs1AIjO
	6NYonp9MTQXBusmiU+Q=; b=MOz0kaNI3z1KFLWKgm67QvZsO4sKsIlmf3KfrSp8
	x871heTRYJHsSvvYs7zGLng62g2qwVsoLrOrPI/2rc8wC5st46CBRuKREuimw5Vt
	P1KBQZscb6ADHPZ4WDWSwG7E7Y/f6pCBi2hgIWAj3aTmav3nV5jicx/C1rC4knro
	CBsSwuMT1Ev7PilVMh6uY0c2SiQjPVjOhasPsih6JznSzDn/2rfbeR+SuqAAh+uN
	7aEyJby90yISJd3FUYWHZuesr0A9Wu4GL4PWfDQ16CWYce1edLgM1dAY2NlwhcVD
	ZRKfSKmGh9Ct6nAeusAQkEJcrv0JmkDdAHb08IIzOI37Kg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kvf6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 22:30:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfe8dafd18so88039811cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 15:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760049016; x=1760653816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u9Umol56pcPf/8TeFs1AIjO6NYonp9MTQXBusmiU+Q=;
        b=ZbY2EJMd9h63mWGyQt0MBMafrbYfzNuUEOHM2yATC+WKHSCXXJY+BOt7GCL1pi1158
         SaduvgwJCuBBzHULCywSrp+1DLOUCFqqiGa+2UZKjW+Xiy4sLYGvrgJUjyc1aGmnVAXV
         FnHKqeAaPWVLp3zmru4kEpri7Ydfa87pXngphM+PaK6VQbEHe+gcwi38yEQKBQqaSdPu
         4GmuCrL2HI3dUT5KM8WRaoW3XKNDX3bZYYI4iDFZqTGTCkdmCznv0fydwHqn+qQNgGwf
         tnUwOjlPnQYxENT2c+Mfaw73b1zBFJgdskuRIvoQgLXUTQGxVUnw21GDnSCBo/1gnTmr
         BsGw==
X-Forwarded-Encrypted: i=1; AJvYcCUFC1AgapTnRgcM46Y1/Z+lCSdzBa7sTX8inU30o6mjdRYfF4JnreBAe83BVb//1+Xomx3Ww+m5k+Ouj2DAZ8w5@lists.infradead.org
X-Gm-Message-State: AOJu0YxCZ1yTnu+F418ItGRt9XxaYyGLHusRgqNe43WI7Qn4WB3skTaY
	bpFhKFJGBWb/bEK46yYOkSyD4PDFlP/TOkRtNWLBCxjOZ7TdqYzpK6spLpl8IF3H9eMZvtCiNhB
	qPR1bSkjrmhL1Mdf3fldL1gYTojXurKA7Pxy3jJIqN0ueHbViF9Rf+iKZKpMYAmOH8UjH9djIvU
	TKkrn+xCnGow==
X-Gm-Gg: ASbGncvA4vw1aQpmQdTZSiB5ejJO79v0XsYjC5kvmAku3nUHoRYaGZrhfm0jfys1CUD
	nbdx/NGuX6LEMfbV3RISgCpsod5IMwC2L6RsuOvAHQjjnP36ARZtJzpkAfbjKy7nuqPs/wVl8j0
	1wuohjxWcJMd73ciwivWDRNYV2VU3NICbICYmS72cSJFvhgv3DNzOGvaFWo5icu0uIvAdDNnwzA
	lnPVSQ8iQiZsEZ8ongGsALsMr3x7hekfaKlrOQn4oEDlUWDK6sDJpSrs75HjUKvebVo/5FZ1Une
	YS9lKNuxHGDEwpnLzOVZlof9fiR1ISeWiIfs1NmJwWQez9NtzjEz5xRv4O6Z2UblQSh1iHsbSwR
	UKX94aDBncCEocnCgfnfiABo1WiUvGfxg7GJCBTDX3+Z2GMEwLS+P93bMTw==
X-Received: by 2002:a05:622a:254:b0:4d5:229c:9d1f with SMTP id d75a77b69052e-4e6eaceb25fmr123334701cf.32.1760049015775;
        Thu, 09 Oct 2025 15:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF77+YGORmN/1V00YnubDd/uwhGM0Ew5duFJ5RpvkZg8bhb7cpDezBj+R100Q6pO/HZIsgBYg==
X-Received: by 2002:a05:622a:254:b0:4d5:229c:9d1f with SMTP id d75a77b69052e-4e6eaceb25fmr123334311cf.32.1760049015316;
        Thu, 09 Oct 2025 15:30:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088579e01sm238719e87.114.2025.10.09.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:30:13 -0700 (PDT)
Date: Fri, 10 Oct 2025 01:30:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: damon.ding@rock-chips.com, m.szyprowski@samsung.com,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
Message-ID: <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
References: <20251009193028.4952-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009193028.4952-1-heiko@sntech.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2up8rpezaIU2
 VLdc5BgfZucUHO2ptahZ3mTWFMG9vD/08Ev0CshDAPwlUsG8OzU7Modb/LEKjGPXNhlXTYQUbJl
 T0AN7n3S0jAqlL+SiOH9EpLVdcxjkMX5HgEtc25XsaeSPQV8bC84EmWUa5dd4+4/xbcQ63T+deI
 UCtKPQDTb9Cl6Q6ITkckqKn2hQcwOMutvIq5rROjKu750kAgfBDym/3MMNErXdosYxUmxLeTDEt
 dBY5ezNVUgjfGxMyWLYM4s3zPAWMoXlNc8aGoL5YPx64Fi15skYvPcFYMzmZyTCO+HhJMhTEBQO
 cU65jFlW/m4GWHcTySPqux+2LZcWW0EVLumkTM+eX/8jJJ9ZEyNMOlyVjJxDJudxNquNfiYdLCo
 RLkVElvndfjCalyyilWoJG8Ldz5OTA==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e83779 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=Zt2WjO-vMssICJJY_9YA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5H5Htc7OVXq0OrSYM9kUEnxujc8N-vub
X-Proofpoint-ORIG-GUID: 5H5Htc7OVXq0OrSYM9kUEnxujc8N-vub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_153018_025830_6CDB6835 
X-CRM114-Status: GOOD (  33.60  )
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

On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
> Right now if there is a next bridge attached to the analogix-dp controller
> the driver always assumes this bridge is connected to something, but this
> is of course not always true, as that bridge could also be a hotpluggable
> dp port for example.
> 
> On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
> connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
> for DisplayPort targets is more complicated than just reading the HPD pin
> level" and we should be "letting the actual DP driver perform detection."
> 
> So use drm_bridge_detect() to detect the next bridge's state but ignore
> that bridge if the analogix-dp is handling the hpd-gpio.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> As this patch stands, it would go on top of v6 of Damon's bridge-connector
> work, but could very well be also integrated into one of the changes there.
> 
> I don't know yet if my ordering and/or reasoning is the correct one or if
> a better handling could be done, but with that change I do get a nice
> hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
> Analogix-DP ends in a full size DP port.
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index c04b5829712b..cdc56e83b576 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
>  	struct analogix_dp_device *dp = to_dp(bridge);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
> -	if (dp->plat_data->next_bridge)
> -		return connector_status_connected;
> +	/*
> +	 * An optional next bridge should be in charge of detection the
> +	 * connection status, except if we manage a actual hpd gpio.
> +	 */
> +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
> +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);

And it's also not correct because the next bridge might be a retimer
with the bridge next to it being a one with the actual detection
capabilities. drm_bridge_connector solves that in a much better way. See
the series at [1]

[1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/

>  
>  	if (!analogix_dp_detect_hpd(dp))
>  		status = connector_status_connected;
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry

