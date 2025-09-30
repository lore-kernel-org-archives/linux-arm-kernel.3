Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C8CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnz5TqBen53zV+5c0hfw9xo0Ki5Ws5bufZFZJ5eyQqk=; b=MBKtSwsyEl6PNyqmg6tMdH5Oda
	u8D3gAHqvZWXUX/q27/oDQHY7DYHxFXC74DrZVJajeRVIp/oBvo//1dKXf14TxbOeBECLzumfKG7u
	axE756y8M2kA7EAqJH+H1J0ibrcgSSkGYppIRgAZcFQ9qcbhTITchwyLwibRJJx1D8SOYpWeeJiWN
	z4oEIkyktLzhpzKOzlDKwhzj4yYz1mWSFI55YvFTiKsN7113gfiVgCzCHUYZDks4lai/zbQxIxC7x
	JJ+r97RYspj5lgbgXGtHLKne5wNZwNGoqzRJfQUiuXrunNMdeYYfsMQz5IZdJ8vs90qJrr6w2Z/0U
	VU0DgpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UP6-00000004QR4-3YOO;
	Tue, 30 Sep 2025 07:04:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UP4-00000004QQB-1LVk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:04:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HNOn017533
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tnz5TqBen53zV+5c0hfw9xo0
	Ki5Ws5bufZFZJ5eyQqk=; b=pazFXeSCg6o5laK+b1VdfeBi/n+XWo/NDACcUXTe
	UThRpLJb+Di/Os6lyIJ2n2gB5DCHAf9Y9P4MKFydgDKh6p9L1lChuHqP7i6IKcZy
	ffNiiibIpJwhES1cDQkWs27bxgAwDm64aK/C87iSuqxqkx1hrN1glNoHKpIx+1pT
	12MUrxNMPV7xJf3dntnWub2mC1b65RUpB7Che2v89b96bVzQ0wTJd4L3yI0NkPbz
	1rt+1z5xtboyQ05MHbJ7hDBUds1Tfe5NjHwoS2//qqZ3+C9CySiLf3PNw7+9e5Yp
	jgJqQCm+uRBwMET1BkMmb7wAzbWV92jcVZotc1l0Gif/jA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tr2pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:04:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfe8dafd18so92535291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759215840; x=1759820640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnz5TqBen53zV+5c0hfw9xo0Ki5Ws5bufZFZJ5eyQqk=;
        b=Pz+MaZ5N2mH+Po3gCA0hLfOzkO0eBJeZY+4IxbssuF9RA34khLO7dpJkBjm348iIRu
         PC2oDch5D8ZXBGmzY5agX0a1bCcDkmcfVY8GrsdM3clm6ngrecUbGov2hHBeLvWfqn56
         PX8Dj7t4CoozELlljI6sDzmcVJw2c4vKXwMRH+cIg5pNtWga3cqUqj0mQBfogQs/OPL3
         5ht8yT6M3a+XxN4jGtvX7+GXQ74Up1mNPNY8+1lqgxWrixHPxnXmj4MWMWKD9CaK7EDG
         PivDNJ65DTBaT57X5AMY8HFvE3/p2T3yHjTlP5hmeMGDlqhFSIQnSdiOlApzKXW0DvPK
         83Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVY0fxe4udEq/Rt7GepIKvOJrH9+gXH2eTF8txP0M/3tNihZdEYvsj8Fw6CDT8GiQ/DgqY3m4/H9jnYhFcNVo1U@lists.infradead.org
X-Gm-Message-State: AOJu0YxniarcHndinE7n2v3skYyYMw5P9r+weKK3kLkd53sVANYODM6G
	crI7yOyVpurVsLMrX+x60pGHKXEOI3rmZF4jiC4ZznrI1C3OkQRGVocMZHDc9DlvKVo2ryKptqe
	Z21fwikTSA/2ERRlDE7MnCkJbe2+Hgpv1ZTWqwUwMs8qpr4SHFQQZsHpNJSOCPxf3BGYX3GFGZN
	AA/g==
X-Gm-Gg: ASbGncu70r+VEA55TCeE7UIn388istccH8yBtlzeTCov+Ih8ymFWF005uZMkMRXSTE2
	YPbhTDS+lTPgG2k1jARCZYf/r4zcCHP6wiItTY7Ln24g6jRV3KhUdvZmpMZo45h+aFbZk/Bxbek
	9sZqsUwBV+a2+6l+1ZWVe9F+EGb44ECGcLGOFEF9UygwM5oTJnf9GzGlWX53uRGc1Desy2AJDo0
	3chhNIrN2M17yGo8e631GLIHP+2P5jTKzISyB39QAE1iDJUDul9QS3DQeq7i4nle3bc5/o0K5/1
	mc3gT8qjBaTv9Q7Rdlow1YD+McU/c4pmlRaZo/CJD5cgxI/RnFgk2Uryn30grKfK6ltf5sLQ7qY
	iKWHv9T8O0jmKxonwY+tFXz6Ucwa1VnUyxRiMJiNn2J0SdlX9GUUfs7J/XQ==
X-Received: by 2002:a05:622a:560c:b0:4db:b5f1:84a5 with SMTP id d75a77b69052e-4dbb5f18dbfmr197539911cf.57.1759215840521;
        Tue, 30 Sep 2025 00:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB+47pVViAKJXbEvOe8O+nb1gHysifWQJ8Ow1s0HmR2oz9c6rHltLPTDn+bK5bbHz5yEbEhg==
X-Received: by 2002:a05:622a:560c:b0:4db:b5f1:84a5 with SMTP id d75a77b69052e-4dbb5f18dbfmr197539681cf.57.1759215840076;
        Tue, 30 Sep 2025 00:04:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f990asm4623729e87.38.2025.09.30.00.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:03:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:03:57 +0300
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
Subject: Re: [PATCH 02/17] drm/msm/a6xx: Fix the gemnoc workaround
Message-ID: <7gjolux5eowgpbptxdnuys2fgzkz3we6hznldrmfwrkpym2gwl@e4e2tpiinyb4>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX8Bi3e2fWaVBm
 rNIYpi6vC3HNxNGyTInvnaCq0mTunJVPnauzLocLMAtfwC18u7zM9+u4YCh/sduZ3LJY9QErrXR
 a+3Nexni3JG8uFC0Jpipusb6a7NQvV91a28u4dQjAH97bphOY28+YW3xcv8pRHPvdsP9kTplM7b
 Exis6TYlxeMshiy5gSNwgV5JUfh8HFQaopTi+3j3p6swg8BZyc7rmY6ApcRBVo5ivQXzkpCzG6O
 zrzPOux3/YpX4BrwGbPasc1EHOv8/s2uvpv3SSZ1u+E4ZTlp5mI5DV1XsKhaAQFZKPAkJbUeW1Q
 vtfDT66HtuWIrq7FxXSj+NomaGf8bNS22mlMn8t2eXTgcTVPxXg3Q8F9lSyP336FUhGt93X4tJM
 XT4dSGLM+f45eyRw25MQzyWfh2bt2w==
X-Proofpoint-GUID: 8Ju0peWLv4c2W4aGRHl_1Z557l9ZtGfV
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db80e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EdiAtJSrrEaB_zXPBFQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8Ju0peWLv4c2W4aGRHl_1Z557l9ZtGfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_000402_474608_8C99B866 
X-CRM114-Status: GOOD (  24.18  )
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

On Tue, Sep 30, 2025 at 11:18:07AM +0530, Akhil P Oommen wrote:
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match downstream. Also, downstream does this w/a after
> moving the fence to allow mode. So do the same.

Please adopt the 'why' style of commit messages. Describe the issue,
then describe what needs to be done.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..e22106cafc394ef85f060e4f70596e55c3ec39a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>  	 * in the power down sequence not being fully executed. That in turn can
>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>  	 */
> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
> +				adreno_is_7c3(adreno_gpu)))
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
>  }
>  
>  /* Let the GMU know that we are about to go into slumber */
> @@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
>  	}
>  
>  out:
> -	a6xx_gemnoc_workaround(gmu);
> -
>  	/* Put fence into allow mode */
>  	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
> +	a6xx_gemnoc_workaround(gmu);
>  	return ret;
>  }
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

