Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961E4CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geMF67s9lK2e1WUJdGTKamsDrkDJzWkQ4J1/vFsh4MY=; b=DMPPDVwHTrSc+7tnjCkKDCYSGs
	VUNE58bs7qs0VM4AbBdXzwdnOvKtX34yJUBMbx109M9W5Y5Yagu/n1tg60CYQcdYWyWXi5EBt2fdn
	58uNJYU+TJo1HKIoZpnHEPhkW+djc0Ne/xKBfiwNhIOFn7ERxJc74VFHS5jvltSIHGzFDvRhzjKNP
	pvOI/6KOu8IDmIv+d/PZoSvFyvHib7WAngdgvufVcTNCSsCJZ8u2jwfQJmx67Qw8krlFu1r26UJrm
	tj5PDgMKExtYw/20z65Gx61wRkJpTWDYsYn86mygMNABe7Cm1OFTY/ZXGJDuythCYiRewgtB4jncp
	qfLxUq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Uk0-00000004UE0-25sg;
	Tue, 30 Sep 2025 07:25:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ujx-00000004UD2-2v0W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:25:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HNsA010699
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=geMF67s9lK2e1WUJdGTKamsD
	rkDJzWkQ4J1/vFsh4MY=; b=emTznH3ez3asNBmGW+AXo+80/eVD9rTybYFwZcg2
	ts9ACxZQR37p41NlYT55EjyOJhRAHavX2BiBFPHDQsJcD7H+ENH/w1/x6puGBB0w
	sBfNaHAii2RLUAeLz8lS8fUB+Fbf36NbOk8tZ1NnIF3/2F5xB1HP+xW6G8fGXWyB
	BmQUgrs0JdGiqNhgBfHoF++3COil3V/aguBgKHGrVpNAk+RoUj3M+e+5U0zba0cO
	kvzGZI8AmCfNx1OJah+khh0Bd1l9fQrB2ggTVxgF8dQW4ITzr7A/SBHbVlVUA9Yv
	UbF3C7sYepsLZ56hGJW/x/ZqkxoJtbiyhgRX27XPf8n54g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcraac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:25:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d9ec6e592bso114637501cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217136; x=1759821936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geMF67s9lK2e1WUJdGTKamsDrkDJzWkQ4J1/vFsh4MY=;
        b=kZDGD0L/V1EmcNjwwl+HuoCJRWjrVIPjtszhPk/zUoElg3ntUiewMqFYLzcHqBV7DO
         aW5c3Yv6lYhZyIMJJi3AXhSgCY+deBzfnogqeE1BEXfmH0yT2dYps/gWSdKJ2Y9Eb4QH
         o21qyh5KO8luT7cfP2XLmtIZVtVHC3+f/60CZwLd2hZbOhLZrZ4d3El8y7JvK3p+5jZ/
         KDnQg0dGktVja/ZVikzMIGgfvc0a3oPABL/6FmAX8VvkjlzUFno9KIsT5zGeR5TJ+Pv8
         en4NQI/t+tm/bHB9vjU1sczp1qeQrBbpbYZBwyUnTMSQe/SwGLXZANY7lYLk3im2UvKU
         rTuw==
X-Forwarded-Encrypted: i=1; AJvYcCVKAdvnpA8BN7ulnXqyP2Imh5/bijHiYogNvSc5zSOtqM2B7xcjsZrtXP2jEVBSU86dH8Cjc1iPrhH/MuEiJsnk@lists.infradead.org
X-Gm-Message-State: AOJu0YxKsnCoHW9B41NmMrbWsd4KmkxnTNjNd3doUfRfnRphvcPO94fu
	W6K8vXswOw3z8R2o7puS+aSxL3O7ggxGUmwFmsnqB74OSKRAB35f3TMlXySYYcmzJxZTP8x5Rkw
	3uCftkO4DfwH2+S3Q+T6lBPRHhjObmDGOesOvPTxovkT2F6mdxEnKZlY7onzg89NTjfUEiwoZqp
	0v5w==
X-Gm-Gg: ASbGncuUIbNA82o7ci2SXhyFGNd/Okux3wxWlrPPy4USb5qW9kq4VUVD6x/Kdjoda97
	4BgIM1gPDNaFKD5j5x1vR7I+0MzV70y66EelNXsK87gO49LoocWeD49IgTDNRAcRU+zTrQR0Rl3
	cXkR3OwpvMbdP1fRXgi2EG0OoYunGCxb49pdHu+/Q7IfH4dXwpKMeRduQ6DAl/O6qxqgwcwpXd7
	G5IH1GaXpqo0Wirg55LXYhLiukM6a+SaGVe+E7LD4vf27fFVFUGP5FfU0vDJaJLfJ+McWtv6u2Y
	SJa2NDh9fRX0OwWPaJ0NrRH+4sruWWk2x3tP97bruiv942NaCTYZ9c4Viqe9cNAO6WJTRhoYLvw
	ZNH5Y2SYmxgby8LnQ1ugDc6GbOS6yi3IcgDbS/kXvEd/yxGv1IjclnoEIPg==
X-Received: by 2002:a05:622a:4b14:b0:4d1:ae10:5b1b with SMTP id d75a77b69052e-4da4b42cbe4mr262137861cf.50.1759217135826;
        Tue, 30 Sep 2025 00:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFydm8Witpz9fh7gZQkdonO45FlyJzofDOb43m9RJWVluGKuEzZbINbtIf8sGlgSFb0MqlQSQ==
X-Received: by 2002:a05:622a:4b14:b0:4d1:ae10:5b1b with SMTP id d75a77b69052e-4da4b42cbe4mr262137431cf.50.1759217135307;
        Tue, 30 Sep 2025 00:25:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58619e6c530sm2504496e87.93.2025.09.30.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:25:34 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:25:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 11/17] drm/msm/a8xx: Add support for A8x GMU
Message-ID: <thvn5qhq6lhweceoofuj23bzyteesdorjvnhpves3bbszsm7ni@zgvdn5utrafo>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68db85f1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Yh7iuwBG_BicX8m7FkYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Kn5kNxB8jLgsPzjBOZLJYz1Yzz0N0Pam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX6aM9BYN8SXe7
 ydPRJ0vQTmQzS8bBr5gWfARksiBMhoE3fNzhH+wQRe/liI0WGVKXS/5RR7/zr7aVX6/Fya5FGKW
 UbeOlpSI8t57kXL8LaoEXjhTqlMMIuHuOPOzULguf0H+LScD/zt4bzRcJjgZ6bjnGD/2ZjfHKIi
 PDr9t6MfstyK9qnCjjdFsGGB1f7bjwBQ/p2yDnB60rgfpTIDmLaACIT+Apgewi1rvqPX6gCPKru
 owedrQjk4eR+Mf/cwr8HlawYfRkwOLAtTP0yYiF2xYIg2kcNGk1hk33zdYp05k1F5VrGAF5XhC1
 awhGdpDSvlAz4UASxW/UvsbYOpw1tN+/kJGnKxowArEVj+0U1J8cMSxYfQ2+04RJSW44x7e/OEo
 D7Jq5M0cu4gJz+NxrYewpE3F4ANAAg==
X-Proofpoint-GUID: Kn5kNxB8jLgsPzjBOZLJYz1Yzz0N0Pam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_002537_865406_914A1DDE 
X-CRM114-Status: GOOD (  19.52  )
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

On Tue, Sep 30, 2025 at 11:18:16AM +0530, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.

Documentation/process/submitting-patches.rst, look for "This patch"

> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 161 +++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |   5 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  53 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h             |  17 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   7 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  48 +++++--
>  6 files changed, 242 insertions(+), 49 deletions(-)
> 

-- 
With best wishes
Dmitry

