Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878D4F531C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12XNat6g+cc/zIEfoBGBX//LTYgOYu/rE8OpssDOmfE=; b=dNak00zhOOgFipuzihcTrS9CEq
	4/wat17J4alGTIrZmsV9fQR1Nne7FLfDD8nXnZMUDDD2bmqggv7thTVW8UV7pG0yVjUmFUC701NT+
	xFs54TIcfeTNSpn4R1CZaQTm4zlxu6CFds6EUbVcjS7Rrg5ocXewjE0ZqbTgtgcp7n4BJ4Jaa/e5W
	68D2KF7GYR/FNBtgJLK2HMcboRjY3pu0SA1cGyK2HWqcRdNWxTcR4FBRcw6T4htI1C2xIzMQBg9YA
	O/kTJG1UWo9cKTTG+4bscU7Jh2VahAe7DURmKiA1oF46TIUwNXhcEEezgX6fShpkZ6epbiitgz60Y
	MqH+As2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLrU-0000000GBLr-1YoY;
	Mon, 13 Apr 2026 18:18:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLrS-0000000GBLM-0NnU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:18:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDgK8D479871
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12XNat6g+cc/zIEfoBGBX//L
	TYgOYu/rE8OpssDOmfE=; b=VqM8U2IhfULeH5BJ6dCm3pLntcvpyiM73qIS6SVx
	oZmOYURgSAaeAeCUYSCTh5YsTe04/NklpiW58RHSTCzTSZgKa80PKvmAysuK9Zbg
	+v7MgjRC9PkR1d/lQJUlxaZ8xC3+ptW0melopkf8/a7K0UozeaEHLc5tED3eHYr0
	wCQSjuWGVxwYMPTxBWnZEavafnSULeJOZGnnMqdyEBs6ONbhHTiD+HaBetzcJtn8
	x9B36+DpsktHyIt/6AHFmRJr6rZySzfsWgllm8EOZWHQ4J2F6/eaWJHH6e1IDMXU
	F/ojMPh0FjgDTSl1PX4BU2rQ5TwRX3Vx4VWBiHqQEx3wGw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguujadns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:18:13 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-61010bc9c12so425350137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776104292; x=1776709092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12XNat6g+cc/zIEfoBGBX//LTYgOYu/rE8OpssDOmfE=;
        b=OlHKyQ87HFqjNd1P7ejzLx0tic6C5pubBpbIs0F4XHmiNnwSAw6kpeaH8E/oXQmiqC
         zdJnLPG/FzwRbl0fqerKX5cwRvDtgj1pTV28ooggeHMH5Xjr5Y2LokecKpxMNL7wfh7e
         GyOCjkgF8wM1jyupRcuT53Mt1rPqgEzsKFRWG8KEGMl4R4uCPr1Fh8RbbMYVWQBSCb9i
         xMq31/fzD5jVkfBQoU8hvFTuWfw8bWEuhjuAFaWpz+lCF3snPrI5EwrqLIhRNK82wLLL
         pEquL6Am9P3WepKJeCAEM3ML8H5I77uk5w0aZ3cPXacMh490739TSeaxneZVqqHwjiCK
         iK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104292; x=1776709092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12XNat6g+cc/zIEfoBGBX//LTYgOYu/rE8OpssDOmfE=;
        b=BywOgwgd92COrCVpoz7GbvbulVn5W4SCSzda4247gmRfiZlyZXDpNCauf74az9XSOR
         bEXROv01ovK6ojxiFjJ6SXrz/OeXSvLnJzYnYQ63iwGQFsi+JQxP5isUDKqcvvZB3GOr
         Yyil82LzF7IlFLXci3nrSnKpgIxoJkZQg7UALLSo8LLrWXT3aV6Z7TFSKRZOzsXAh0NX
         rsC7bDmtrydUreW3Mf9L2PgJpVE9POVQQ6d5y5wNkYH489hqv+3hRtmwdBZvaOqHVIEL
         vk6wzgua7D/VCjE3pFreP5K93qql4Y7EU/+C+ikq3sYKFh5ZuYg84Cql8BONu6q2Keq7
         4Q6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9tuY81x6W/ipQ1UpEn6VJgTvS8oW8LMU83wTzr3f2ZJCjCZffiUUxJ3UCbOjW8KevqdE49TwYStT/Ikdc8FW2j@lists.infradead.org
X-Gm-Message-State: AOJu0YxSC5geac2FZ6HDExwav55sXyeOs8+P9+ypkIgCYZlyN/m5JKPu
	mPzQLMhIacAK9Kx+AuTT5Q4KbSco3OlzyX8IpAA00QrGs7Iq2TRIIj95EEBfIyaAt4w0M5USuQj
	V7+AUx9GfwUBRG5AUnrnq2BexK6G7JrrA5bxn6NHPkgJnOl9q3OSbtDUaKQppNQDulyrEsav0H7
	oVxA==
X-Gm-Gg: AeBDievzT/iZbY0OgHwZnatLZ6pPdpplb4xqFlSFzajWMYDTRPPPZR9KHApaEMItCrJ
	py+yw+yYP2IZEdK1gvS/K2eS73mHBsqzuA7Xw0S1RcPRVc3qlpen9GyA1QKx9C5JOokjN84Rnp5
	HUG5843adeSD2CHmqncaIfguZiOLIbmTJNSWrWt5kTLu0ilPPFNgfbTxypgK3NFUl/vXeOz7lw9
	GzNwrFIxaRHvxyt0AdJi20xTM3VBnG+yny9HkiiBAVtzsUWAtPgJLCsmgOYhbmp3DiysOQXtzK+
	s3bXW/hDRcoHnHCGacSvQtKJryiiNC7YfWnLL88qec34QKiWqHYptVO7rDRv5WFVeP7TRYz0hGK
	pcIla79r5NCyY/c8h5adcwTWENf8FqAUmEmRdywEhCchQqqrr1SbiKd4pS4yNAVY+RcVkXeh1BJ
	PK+kjFiK0H1wWhDjmgHFm3e/iU5mQbU7AwIqTzWmQcCx5vIw==
X-Received: by 2002:a05:6102:c02:b0:605:5756:a515 with SMTP id ada2fe7eead31-60a0062cd7fmr5486850137.16.1776104292550;
        Mon, 13 Apr 2026 11:18:12 -0700 (PDT)
X-Received: by 2002:a05:6102:c02:b0:605:5756:a515 with SMTP id ada2fe7eead31-60a0062cd7fmr5486820137.16.1776104292046;
        Mon, 13 Apr 2026 11:18:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298bbbsm25262411fa.10.2026.04.13.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:18:10 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:18:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <ojinrxfmkxrakyczzkjx7wvx3je34t6emnr5ux6qbl47vyuzyt@3dbq3llvysei>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-6-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-6-acd01cd79a1f@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MCBTYWx0ZWRfXyFtN1QJLyIYN
 TSkr1+rocILFLc5Gl9Z2W5p1G5v6207PA3/yzuqiogyJMrMVvPPFjs9yX6dFHAwLhiik1Tj7He+
 XcfH6Uffjeexu79UkE7lyldp0kwUPDe94RYP63pOlbBZganUwA9Yw5S9GaZruCqx94mTyJW/9T+
 +vDgiqz01cDRIvIXk2aXtmave7Gj4UXOL2mtydXbSUTxVc1X0Ap6jK92t+IsTrklPSQ7UbhA3+D
 Y99IjYol2LxzcyALCxine+dAoAqbSmRqrPRjwehQEuDHNPYyJUiNCUqRe284DbJOAnZAcZzK26t
 GbeUr3NmAghSJTcPwMrf/VCgebn6etE0baGyf5k562W5P1lIuHVI+jvkh7ch6KOr7MH++p41m0r
 sZDkeDrM5/BK8bEcdY74pEPFuMFDEsN8B38Hz7MAzpIB9tRXF0n8gj9IL2YQdXRKSQWJJFxBsXy
 jf0S8JlOXwjCWq74I0w==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dd3365 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: OUqLwcEXoUUnerx5VJ1XUg0eU-0yPvxn
X-Proofpoint-ORIG-GUID: OUqLwcEXoUUnerx5VJ1XUg0eU-0yPvxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111814_134685_C9E05BD0 
X-CRM114-Status: GOOD (  17.97  )
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

On Mon, Apr 13, 2026 at 03:58:38PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

