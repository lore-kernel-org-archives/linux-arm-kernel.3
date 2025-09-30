Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3835FCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCgcpA/KH22QIJWR6lWCGCo8yAwGEj9Grr0AmK4duj8=; b=MdZT/3UJgt1iZeVLuSl01huI/5
	qKrF0tFWFtDKOQur/oE2TvDKcBvkVsXV72s2BLbw8sZOEj+NCXgttCGGc/tQpxILJvE6Ls99m4YMZ
	BJJ12ZwzXLINK6mdUv6aZ5c3eJsTdvczqBW/yLrzh/5cT41MBHaqtyhMmnOU/Whw++1/aWJQBq6Y+
	eXx6bOGQci5J0lL/eOP14aILs/Qycfx15Qe8OUCY4xYGCryTVgz1v48M5rUi3AEH3ypDcZroepKhi
	Iw3mOVsi+5a60V3zCrGmOMuWKjsYR99zgYVvxXx47kKufLfnq8rVDwfkuAQ+QT24IgcSmVjmVetwE
	GVpd4AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWJ-00000004SAd-1Ldk;
	Tue, 30 Sep 2025 07:11:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWG-00000004SA2-36lS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:11:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HQPc023802
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kCgcpA/KH22QIJWR6lWCGCo8
	yAwGEj9Grr0AmK4duj8=; b=bWBKbjC8XOLZUBjxlVMArnVyMUk7L/cho3IZ8cAF
	EL5Nz+r54Fs8LIgnnKp8AbYGTg3br1F/XM8U2PrL7PYLnaxGDaTD0JL2uFUtfV50
	V3wAHWQYP4dEKJhvFclfk5q0U3mD6yu3gGTK1NwkDJEx6D9m0AqyNnA+V4M69j26
	PGzcRT+HCKxiNgdXHcMizv+fZtvCp8dSRx/J50S00rvzJlBE10zqROhY4ZkYNuFV
	3V2jA27AXp0UmNXViOWhJ/Dao3UhjAdPPKDHy7dVBl88m4i4xmnbI83xk4iHMjm1
	93jlCRiUpvFuiZjBZj3/BNHnHDUFO6ciosLCHqIIJjqCeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n0c2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:11:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-859e412f2c9so1015701085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216287; x=1759821087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCgcpA/KH22QIJWR6lWCGCo8yAwGEj9Grr0AmK4duj8=;
        b=gNtU/NGisAQF/sOR/i2+xPTzds5l5uK3O43/UtUXPEcz+xVfyeDcIw5CgKhvo1qXCy
         Xrla4+cngZZl5u78Kt6Yc0M00O7xareSEigv3dKXI9TQKRNKt037MuZAdi7Aa6lW+Fi4
         YnVVHVQCfD0scFHO3bVH3EFM5/jSqC1ZX2C+0ZwkdUkv/BmdTpytRsLjYNcUPlvwHn1d
         FNRVFP+mEi7GZDTcQxAsgVgJy6imJPSTl1H/RWb3zYhVGOZHJvCIoGegnHcmPAU/hni6
         IaWww0uih+JW6YOG14wFXTS/GX3qB87fzmUPSB7BxCrAM6P4utJ545dqJNIG2xaVNyVz
         rY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW63VGDWxGOsXfka8idzR3IbLaXUdfuOJ3QZelIqDQReRvB0J9RG3S6qvZFGScLkhGGNfYuWPsu3+8ewsl/E8ZP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/XiL/FvjF1ryBuW5BptyoP4/YJGGz92ltcWzwciSVdiDIoyHz
	LWS3lF673AlJBnRaYscUystsC7dIQMFpeSdCTugSMikZVG1q13nK5gXAHDhrb4hy+Q0VFmZCx+X
	sEFfYY2J3tJ9elgiJBwQJd+wYEHlOrkfYf2ALLMUKYSgrcYm/V48NxdW5bsqDyCAIY42F+A/jKM
	ddWw==
X-Gm-Gg: ASbGncv4CP0VcMsYMl8Ekmq9kdC0Bpk0rC7crvOuIKk65jsO9DHoTikw+lUoux09Gxs
	vl4G/qaAV8iKyk4+3wcU463zV0L+6xGJd63rKmRSw6sCJgIn+sy5Y5VI7YWbC7tON8FJuJh0fSY
	FuiWsu/OaPyUmWU6LbUSdicIaeCiT5pDnMWNsI51fDePWUVsVI79yPTC6wEJyHzDpPkO5Hi2so/
	4zeZFNa9q4IGVKPhlwaPJXJbfUl6EBL4SiS1KHGhwQAAO3Gv8E/u6R/zVlqdNZ6v8zdIETxxzW5
	nrnfz7vK9tGtlVraAMTTdjORpDC9+VRLkEyrsv7MbqIeKlvtu+OJgqbSJqW4fFUfNlY5fRF5RKB
	brDyPo7TcfOsnOjXqSMj5kXBd4J1a3rg+Xb1f8ofp5KWq5t3kS15X409AFQ==
X-Received: by 2002:a05:620a:1a26:b0:858:64c:22cd with SMTP id af79cd13be357-85ae94c6f9emr2830953885a.72.1759216286551;
        Tue, 30 Sep 2025 00:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYRbssu3zrykdvcozSbij6HKAxVNsfP55t5zEwTHN2XSjTz6lWJykcsj3kQZuHoluEGfqVDA==
X-Received: by 2002:a05:620a:1a26:b0:858:64c:22cd with SMTP id af79cd13be357-85ae94c6f9emr2830948585a.72.1759216286049;
        Tue, 30 Sep 2025 00:11:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4772cb8sm31868951fa.10.2025.09.30.00.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:11:25 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:11:23 +0300
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
Subject: Re: [PATCH 07/17] drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
Message-ID: <x7segnx2v4id3qw2zna6vxxbomfcyogib734ggifggynyfsp4h@7zs7savbiz7a>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-7-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-7-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: ol5N43qcVSaLohsan0DHLQl8Ta9XxEiy
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db829f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=scbeE0iXsUk0x8BJeo8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ol5N43qcVSaLohsan0DHLQl8Ta9XxEiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX4Lb4fdHYpbIc
 YzB1jCx8uOSlfH/yho1JuDTcv9ArQEpTJY2arHPLBzoafOqPM7NlVQWrd8V70XzmXZwGQ+MQfsP
 u0FXWJaOAvrLf/oQJGrYa2wIyLeyesRx4SuK6C2bFCS66+3g5Nw8UGejmXhs3DFQcKYG8veXMK8
 YIeHkOXM/2373vWqnowSdoKQMbZvz7s5O1/YoAlWSa/QYgOPJmTzL2Micn3+nuQ/NOPDqezkUYt
 +Zjm7RiJhtyTVj8l/38RY+ud5HzAAmPLnBgGBY89sY2Dq07zlsDsh2roTd3OvHu8rz1kdY6bAyt
 WE1QhoTyJPAp/hVy0ZTRVKStB50kfO87oElze62j500U9LG8lE2AHVFjAHKJxstHk+o/smIzlL2
 Gn593czWUxGcVQU1Z5VykRqf0Tjh2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_001128_895870_D4088A9E 
X-CRM114-Status: GOOD (  16.10  )
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

On Tue, Sep 30, 2025 at 11:18:12AM +0530, Akhil P Oommen wrote:
> Move the gbif halt fn to adreno_gpu_func so that we can call different
> implementation from common code. This will come handy when we implement
> A8x layer.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

