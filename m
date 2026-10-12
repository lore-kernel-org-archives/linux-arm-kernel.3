Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B7ECA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+fv5z59h3BrsGh9ocdCXpDShfQmJTPHUsOE2PlPFqM=; b=FJYqz9zGdmico7yE4uzJ61AIuh
	ZdqSrSLVfej9sUDmScGNikGtBu1legNavplIOnp+HeNoqO5n36OiRPuUmCLvVNZaBs91Jkc0PSEal
	NCIUxW6lcpP7DsGiNSxTIpTpqjjzFCbTgJc5EoSderoM6lnz8dt8M4Uk0uuUcaDLwzFOX1tWayyu+
	fTle5l3/QDjlUQ8MsIp9V5Vle6G3NxkYCuQJ/fF0j9XRKeNDOAJVeDYqGmg/I3DeXJsESWa7x8mfd
	Kqn4xuGJE0AC+QaMIr99V8JnunqeEVlb7ik5j5hw6ihk8VLb16MWN5Bp9Ua8M3yAhuj6s3cxRf2JV
	GiSbCIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNwz-0000000BaCx-0G0n;
	Mon, 12 Oct 2026 21:52:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNww-0000000BaCT-3D8U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:52:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJN1JE1779163
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+fv5z59h3BrsGh9ocdCXpDS
	hfQmJTPHUsOE2PlPFqM=; b=DdAOuTmjL52rL3XRAhWdcUSgGBfsa18vzPxlcXk9
	WxjTb2S5wwvYud+MgOIP5Gp5Tsa1RoaEahGC7erKxQftuVmFbRCwVNSqN3aEcyxb
	fRRLD9jLK55vY/4V8b9ocux97ItVdebIUuusF15Qi+sBp9wR/o+BH9KVWHXN3gVI
	NzZPx7ZESfGuKVBHvf7pschn6nTgI4cw5DnREAXLytJ7XyB1UH8YoC3XjWKE0rqI
	QUd4TafUL2BJRXDaf8OlFm33A3jO2x/xtNOv9ZNgRr/vhWajOii6fdUfjgw0xLgq
	sOHAZesQsNY9iXsm3U0Xl31B7ta1IYB3i+WqsTtMhmRXQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfctx7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:52:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8067974so609038085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791841969; x=1792446769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+fv5z59h3BrsGh9ocdCXpDShfQmJTPHUsOE2PlPFqM=;
        b=EdTCgHZrc8ROeE1qVQd+UEgNR0oH1cUeZ2S4W97gESMkZ8RdJl24+K8kCwwW3fL5tz
         KGaPxrSqj9fgu/0bvu4fXO92+p3bat4Q9dFWiIROosttGz+LaQAhstTrtW/VxEqmGozu
         GqxmCISlaLKOPuIsFAp37VuRqvMFxqxgo/jBPktoocqbCi+WrOK9Uwis9BIFyad+dvrj
         nWdG1x6a321LmxkWpD69DgPfYgLpfM+jZJZf9B+wsXUZcIMzpO6HWK/TDRmVNHJbUDxp
         vbf6oNLq/DwT4uJRPFKIpjZQDmA2lP341hT+UhoDvip3xvSV9YV2LHuqDwacvAiiCJn+
         CONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841969; x=1792446769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+fv5z59h3BrsGh9ocdCXpDShfQmJTPHUsOE2PlPFqM=;
        b=zUd4hMuXcEdfuGpzYzeUta5wlbLePumzN3HANdX8Vx+8Hik6lnF95ZosR7pMtZfVZg
         vbZKPLUnuTLJgspQGDCshG+Aura83CVf5A5k4PExvOQWyCIjqZ3DeMdhWSzCYxqyldsa
         uJRrcH8jTQyHov4bRsALeMMvdJSAu3Ckug353k6uBSojiWosLp+pJtP4ovs9/S9nnkKY
         2Hq//6lFY6OO/vV3sIqzAcD8ThAJL7zL4k1kpN1K60nC97PZOIR24DoyraBHQAe87A70
         PnsysTc8ZgCBavQcNa93/hpbGi1eUgeQZbdtbIDAws5lC41yjMl3I9+PwQWiNZdjyj1O
         UdJw==
X-Forwarded-Encrypted: i=1; AKwUvByEFMf2L4KpnJ06McV/y90qHy84t2L/NEmqBI3X5QkFAsMP29ERYZ5OPcoFXbYK6rjXg5KJ3g6znU+KIaYNdM21@lists.infradead.org
X-Gm-Message-State: AFq9FYK+C9U9Z8VL8/nooR6kZ//6B7SzvGurekUabFz3wSx7Q0OFOaRs
	0NlbYJoe7ehBUlVELf1bg9Q9XtYsRr227XNQEMD3duZZV30n95cqHPn8Q6ejcEwEcjm+WyUJOD/
	JKVaieIwaXvFIgA3XSOOL0qxAktPwyAk+6a2VhGg5kFa01dw7EZbtR6Oy7LWKadnS71G0Q/BfJ8
	DisQ==
X-Gm-Gg: AYBFou01U3zQd9/u1erge+m0LnzJqg20tFARYiKxPLaIPA4JV+jTgKB1lHdpsytdP4p
	wxXrtdcU1XSkaoA0zaU73lO434T4zqLDwa+hPcKSRJtHxVxBPiNZ51LJcQRGWQD7RVZw0cDsmLk
	/cm3G9NYQTwxvm7qYaNO6Yc4egBdNvwGfjgy/n1rFuPWqP30liSdEHyo6C6vTA9lIWNZnPFLA2y
	I8+gsTTwm2k6y7o0Sk0c46U4qZ9gM3IuTHaWXGiCkWb47k0DuuQVO2P1zTURNa7S5DjC7Rg8zn9
	Woa17g5aOaPKyH5kTIllKGIBCzk5Sbr/RQDYy/6PGuLAMsGqqC5JUuulFXsIYpltUPFc1h71niF
	xcjlYFPDcfnbpyJFSGRem3Bdx3ixcL4HGFkTHSI5+EIVqJ4coZ+vIMDWo2P/hi9lpeGHFUec4CQ
	z58Ykp6/BS461n
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1101463185a.82.1791841968891;
        Mon, 12 Oct 2026 14:52:48 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1101460285a.82.1791841968289;
        Mon, 12 Oct 2026 14:52:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde91537sm3083268e87.16.2026.10.12.14.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:52:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:52:43 +0300
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
Subject: Re: [PATCH v2 19/20] drm/msm/dp: Serialize video test state changes
Message-ID: <gcvermba6qq7jw7svx644fncfglqvwt3fpj72ew4habdq6gsn7@arxwbb4bdubb>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
X-Proofpoint-GUID: fxtnEwqWslrBgTUriltlTsqzL6tQEH5k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfXy1R5zo0vuLKw
 cEwu3OmJ9pL+Mc0ohZeQl5BHSz3xoKSQ+74fhsoURUHIsuX4hyKZM59AzHhcD5RcZQmlkWz1zMg
 EX7fJ+ooKT7XTZ9JK8PlXZoZYSsnJRw=
X-Proofpoint-ORIG-GUID: fxtnEwqWslrBgTUriltlTsqzL6tQEH5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX5ZgY8QbqokRv
 /wgnyLlQIuEL3iJ4vwzhIa3gkS4EFGZAPM3lLBNN7p+J7swsMs+pWFSmtcSXqM887nSh5inamH6
 jObkTMFF1NCm6wz3kg8ip7dOeGnJi/cWGiLpCgU3vOZZoscKhGYVvBzfySmF2U1aFiCoG8aRNG9
 Gcoz9RHNk+TEW9PKctI9r1soyjVLGIRO7V9LYK5YqXzKHZnPztOs23rSg5kJeACy4hZ9OePywpZ
 CI5ul/JOhdFPEtJZFQYUezbpMssFxGNbU5QOiTGlDmy8oucQej2++HVbFGpCOjejLHcZtkP4zqe
 PNO3k7s4MNSa/RDBYb/YJ8MB9eRZDbbpK+ne+PLO127yz6WOuyiXN+gz44gr7HPj+wrl7Y+0qC8
 ZXpcy2BqvvbDg2JlFOw4wn+o7LctFAPEbIX94yOQMIcjmnlNAmXmYGlh/FMr94ftn6t2QBNEcf+
 Qdy6MsAiSvZ/DF/vzFA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd56b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=kznJ5srmxMGE6xClfzsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_145250_803127_859CC3C9 
X-CRM114-Status: GOOD (  24.71  )
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

On Fri, Oct 09, 2026 at 11:16:11AM +0800, Xilin Wu wrote:
> The debugfs test control writes video_test directly, racing HPD handling
> and mode programming. Reading the test flag and its requested depth in
> separate calls also allows those values to change between the reads.
> 

Fixes?

> Route test state access through the display and use plugged_lock for both
> HPD and debugfs updates. Hold the same lock while selecting the test depth
> and installing the mode. Pass the display instance to debugfs for access
> to its connector and the serialized test controls.
> 
> Preserve the existing SDR test behavior. The shared setter provides the
> entry point for rejecting incompatible tests when HDR is added.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 27 ++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_debug.h   |  8 +++++---
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  4 files changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 00fb1a7ba40e..c26b356f998a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -21,7 +21,7 @@
>  struct msm_dp_debug_private {
>  	struct msm_dp_link *link;
>  	struct msm_dp_panel *panel;
> -	struct drm_connector *connector;
> +	struct msm_dp *dp;
>  };
>  
>  static int msm_dp_debug_show(struct seq_file *seq, void *p)
> @@ -89,7 +89,7 @@ DEFINE_SHOW_ATTRIBUTE(msm_dp_debug);
>  static int msm_dp_test_data_show(struct seq_file *m, void *data)
>  {
>  	const struct msm_dp_debug_private *debug = m->private;
> -	const struct drm_connector *connector = debug->connector;
> +	const struct drm_connector *connector = debug->dp->connector;

I really don't like this approach. My (eventual) goal is to remove the
stored connector.

>  	u32 bpc;
>  
>  	if (connector->status == connector_status_connected) {

-- 
With best wishes
Dmitry

