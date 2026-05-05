Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF05CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 00:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eignGx7fjusmcXSJihfEr7oP7drwG9sN6dcSfX4AaRM=; b=Tv4Y2EpPPsH74NCr0wg7HiLX8l
	mzTt2m3kyLq/peMozGVAh0KXbDi9Y9cJq1ZQZM5edhjNZ1xJDlnTCbdJU5H8LFrAaWUhTusZ60Ls+
	HcMToZFcGXgRnFKBRhWlgenQEcC/RAtjs3AUf0CqzgGFInBK4/U72tg0GO+Pu68WjbPa4O1KCgMwN
	Oq4aVY6JnVgemlDQpT+j2+zvR1nAMy1nSTOwwmhFDzRu9FUBf4x0EovXMZWCaBsgJ5+tRgSB0CusL
	4Syf9wnEms6p4VMeNzkaNbuvuxkdhLUCmnXCaFu993R9sZbrSzVNl/lBMohQJvt/Gl5ER65DVQK7V
	LVQJrxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK3uT-0000000EkK7-3hIc;
	Tue, 05 May 2026 00:45:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK3uQ-0000000EkIu-3tQy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 00:45:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644KdUAb1186879
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 00:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eignGx7fjusmcXSJihfEr7oP
	7drwG9sN6dcSfX4AaRM=; b=oxhvehG6tytp3ZNyHh/gRhnPbZw+SQZnQLCMlx/K
	oCNkZ1kd5jHpoqEi2sYGsZBovFKweRs6TabXCamJ3SvMzj+SOI0TrxeYtH+ITokf
	AI3qOhOi2z6kbsg0R+Lj40uIzjCLhVPUKh39UjdAqcId6rRWgotq381p0YiTdlWa
	aYfgABgUxNQM+R3LXCFSXmAiM57LF/iFurQ2ruCW0K+mU9HLjwNPGku2Qij5NELs
	/pPCzz8RKiQ7a1EtB4UWeyVAt50IdY8k5HxaV5uZzPFQ5IpbOkPdYayqoJP3Q11T
	a8X1tlyVnbY8RJJkLKPH47UGlHwObP5wGIuPEPf4VRBT2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvga4kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 00:45:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50eb8bad331so9828871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 17:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777941908; x=1778546708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eignGx7fjusmcXSJihfEr7oP7drwG9sN6dcSfX4AaRM=;
        b=gkV+7s/zQ1wCByBLfkuoryoLS0h9fEHhgrppkucncgr1z48MO/R/RN70K2NtMc8fNm
         5U20HSm83q9nBjJCUQuQGflotcsZiNd2AUIhziYvF95F70dmxUJpVxh3rq1Y5tbW60EZ
         E1WqlvN9evHaAPXoQyngLfdyk8A/Lu/XJZx3G6HC2QvoOSJ9NasATbX4BdydAe7euj3A
         ziDAvHlynI6GY6cYajMEbMCt7vcb9pAbYkdRDo/0fbEzFDpNgm29NIX62N1pNvHiCQ8g
         XDcPm31YBijJ9RJnwhM/2cOWT7Ziy1yh538Ne9dGlfScTnwNsNNgoMVOZZMtP+IwkD86
         Garg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777941908; x=1778546708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eignGx7fjusmcXSJihfEr7oP7drwG9sN6dcSfX4AaRM=;
        b=gppJA6c/gpP3B3Rl+AJZXJnykozDIdDEZmeuSedYzY+2Xzp+WS7uWfGnD++s35CqHv
         BlrGiX7bo3YUrEyHudi2OWF/lWOjUA22QnZcbgx6cYBxjDesNwRV2e/DlX1MhgorKggb
         +Ezcz+yQEHbwmAYa2MIm85wECBCK4UPX+YuupgSO4JscklWir9lIUWZR93wu+i5hrPga
         +ybNq+RYL7lX3s9gVlt+ftENnSVJ3kGWVQiYX3Ueolo+asSF6wxU8CwWs3jdw/qpRJ0V
         7rEk9jslNKq/k2epzKr5OOqbG32YlDLOss1pRsLH3q42EORJqKSzDwwvgyOQMgH2Dnu4
         lJsw==
X-Forwarded-Encrypted: i=1; AFNElJ8zQdBQsE4mHgVulp7ZtpA0sz2uYjp5xT6krx632a7/NF4PsNXdk+ZxMY8o/a3pySHAmKAyK6OM8wlWy7h4nGn7@lists.infradead.org
X-Gm-Message-State: AOJu0YwuYzjXMqpXdwAo1Drp2KYRzw6OMflnd6HxttRZ74zMH8k23O4a
	sLxqhw6DbqPH/3kfMcLckWiY2+qV7vFx8gORMm0PT5800h3bff7dBy79z3Xun9YUS7FqQfSkREv
	zJebInMMRBYwvw0OnDYj+qVqOuSOFGsydzorNtBgLhVmw91WxuOZXRze46B9tBVYOVzqHP8+jvP
	XZhYJXS9a7qw==
X-Gm-Gg: AeBDietzX+OxaSgiLS86DrjH3kTxHYLqH5HE6/4MuETgq4y1FsKKZtStPId4GhUMVsf
	VEWgmlloUo+q62DnsXrMlJxLVvDoEC6ULSwNsf9EwmZQhgy4qVxNJVvQ1qRMZcll8AeyNCSRFGf
	nKezSKOiLNhfeXKSn0X5jVxGkLneUMtvu3oPfNM2Ov1IkV78FSlYRXTucLtZB23c4Ba6eS9UozW
	6nvWQ3SrnoZRz1t3quznUj5rz1JkbP/9y0CvA67Lq4YNFIkrzfkQGOVktziYfS1gFHpkM+NFgMT
	dE4CxcVDpwsDx/7iR9sCls2AYATo1425Hbb3kn23pD5W+ph5S3NOhgdZ9ed0zFKuhDKvn6rMNaH
	f97yX2wbEtW0F5FmoH8jqh4EfZJFuvv3zwk3RGGxWpW4LRzVDttxGqLGmhbK17TFQB4EskkZ0B9
	tWWMExPaGY/nB8dfHxQp6krNlVNaH24/vIjy8VaNntpmicRA==
X-Received: by 2002:a05:622a:244e:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-5130695b1cemr15250001cf.12.1777941907642;
        Mon, 04 May 2026 17:45:07 -0700 (PDT)
X-Received: by 2002:a05:622a:244e:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-5130695b1cemr15249611cf.12.1777941907177;
        Mon, 04 May 2026 17:45:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e16sm3444610e87.30.2026.05.04.17.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:45:04 -0700 (PDT)
Date: Tue, 5 May 2026 03:45:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Diederik de Haas <diederik@cknow-tech.com>,
        Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v5 05/10] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 SCDC
 scrambling and high TMDS clock ratio support
Message-ID: <b25unnbxzzpmi3sr4dwpmq2tofriczjshmq2o67xwqsfuh3elr@gdtornkrplol>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-5-d778e70c317b@collabora.com>
 <m5fxlfktxtvki5yaxhkx4h3hsjj5266stwvfdykhqkgcjbz5bk@s5gggcd45abm>
 <539f1bb9-6509-40c7-8692-bb3cdee33f91@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <539f1bb9-6509-40c7-8692-bb3cdee33f91@collabora.com>
X-Proofpoint-ORIG-GUID: HM2DuoE3XfPRCAOfVRbl-RgR9R5Ig-LW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwNCBTYWx0ZWRfXwSAQ2bNHbCDr
 Gn1+3pzEtL0HX8IIo+z9o1N23aZSzeJGV4xriGn77bGLrOkPtsthWrKJHXySHoe2JQhjkK8SUyh
 Eqtpkl/8l3h35fvjdyLN1xvqwP6Gm2bgNXesY9YWQC+dE2PrIyDhLsoAHtE7o/h1+8QQh1ELM9W
 e0f64X58xAhztY18RuAwpmUJ+UxYw51eWFBI45t8xgCwFc55zNDTuW/Lw6cz4lPV6DFeH0cIY6z
 3+v+MLvDktZobT8AUGViOXT7fuoZFdbfBDdy19fZ1JU40pUOFXqOQv1fR6jmjabGDNDon8O9hMn
 GV7sD6HHMTxRjRcEl/R8ey7CIjOjVKJAQZRanE6IBW/IjPcAzMsZCwrwXgbirhak0Pm/HHGES7C
 ii7AgHajYDliXCXlozLPe3h6D+wy+XWgbxGmAD2wN41jLfzp0pqGbLko/+A++u3XwEH/ZyHeCrz
 j1N5n6G9bCy9a8BsjQw==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f93d94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=MTERcTr8AAAA:8
 a=69EAbJreAAAA:8 a=QX4gbG5DAAAA:8 a=v_zPfFD72SJ5nyloC-oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=1w2Y23rLpnaGpkO2nlKf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: HM2DuoE3XfPRCAOfVRbl-RgR9R5Ig-LW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_174511_079577_A6775210 
X-CRM114-Status: GOOD (  29.47  )
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

On Tue, Apr 28, 2026 at 04:51:46PM +0300, Cristian Ciocaltea wrote:
> Hi Dmitry,
> 
> Thanks for taking the time to review the series!
> 
> On 4/28/26 4:38 AM, Dmitry Baryshkov wrote:
> > On Sun, Apr 26, 2026 at 03:20:17AM +0300, Cristian Ciocaltea wrote:
> >> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) by adding SCDC management
> >> for the high TMDS clock ratio and scrambling, required when the TMDS
> >> character rate exceeds the 340 MHz HDMI 1.4b limit.
> >>
> >> A periodic work item monitors the sink's scrambling status to recover
> >> from sink-side resets.  On hotplug detect, if SCDC scrambling state is
> >> out of sync with the driver, trigger a CRTC reset to re-establish the
> >> link.
> >>
> >> Reject modes requiring TMDS rates above 600 MHz, as those fall in the
> >> HDMI 2.1 FRL domain which is not supported. In no_hpd configurations,
> >> further restrict to 340 MHz since SCDC requires a connected sink.
> >>
> >> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> >> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 188 ++++++++++++++++++++++++---
> >>  1 file changed, 172 insertions(+), 16 deletions(-)
> > 
> > My main issue with this patch (sorry) is that this adds yet another copy
> > of SCDC-related helpers into the driver which already OP_HDMI and other
> > helpers.
> > 

> 
> >> +
> >> +	drm_atomic_helper_connector_hdmi_hotplug(connector,
> >> +						 connector_status_connected);
> > 
> > I don't see a forced hotplug event in the existing drivers. Why is it
> > necessary? This function is being called from the detect() path.
> 
> For some reason, without it, the connector seems to lose its state after reset:
> 
> [ 2142.982967] dwhdmiqp-rockchip fde80000.hdmi: resetting crtc
> [ 2142.994132] rockchip-drm display-subsystem: [drm] HDMI Sink doesn't support RGB, something's wrong.
> [ 2143.140827] dwhdmiqp-rockchip fde80000.hdmi: dw_hdmi_qp_bridge_atomic_enable mode=DVI
> 
> Will recheck if that's still the case after the HPD handling rework.

I think so. If it doesn't help, please check that
drm_bridge_connector_detect() is called for each hotplug event from the
hardware. It should take care of parsing EDID (and thus updating HDMI
Sink properties).

-- 
With best wishes
Dmitry

