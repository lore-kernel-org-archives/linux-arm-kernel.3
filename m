Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C32CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHrr65lNXuCbU7GLecWRSzb5A4LI0xtyUM7m4ktwrdY=; b=AzoYPRUEgXhZmqiepu/oXUYCWf
	6nBDOx8yPToqWOOyeuweJhCp+dMFQcjMDWqC3ROr5vSiX+W3bbpstYImLw+JzsCv3HBbfzXTH3Ilt
	XOKle6c1ucptuavnd9jw6EW+zLoteJfHLtX4oqFa+DAzpzMXEFUasgXXVEZUTN5ybVeZE0PmTcpoi
	DGiRm9sCi3RPkqtQGoXfPCB5QZmcQVY1KIKkUHmHnA6uENYargH+f8t9RSGVgLI496AJlnlPU48vA
	N4bk9J7P4jcFKOXIxs/RoKVwRE5nRdqOMbTz3vE10gp/n+cjSpPfSP6ZsEn+JcVc5Bmn1swo/SFhv
	hNeoN+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47jc-00000009M5H-2FgK;
	Thu, 02 Oct 2025 01:03:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47ja-00000009M4v-1XGs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 01:03:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbwE3018676
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Oct 2025 01:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fHrr65lNXuCbU7GLecWRSzb5
	A4LI0xtyUM7m4ktwrdY=; b=IZphk4Nhg0W0DaJgkAk/2l6BgMbcMbaUAmi4e2Ht
	zf19C5MX1zPKhZOFpiLyarnSwJE4FCZ2/9iUjXgoTfvUPKGQpWBO0HPZFzEhpVFm
	qd+sPnWUvm0ei5lCm/U9NXCQUiCqgiYadMkQla56TJFVuNOYiuWrHHTVk8FvpyxB
	qqaJSTm6N02CJLa6o+DbETd0IHyz/bxBFo2F65K+1bJw2ccYTc0kpMh7Yq2pFNm+
	qUbPTcbjlatp84jBLUT++FCoZDsO62ewDaBV4l1KmU4JbXrVO68H03uww+Xa+vuF
	fALG5LzZCoGY2nYVuFutQWPJ/3if8tMPbU+tmxBtHMD4iA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu1am03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 01:03:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b302991816so9693001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 18:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759367028; x=1759971828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHrr65lNXuCbU7GLecWRSzb5A4LI0xtyUM7m4ktwrdY=;
        b=Q0Ocim2n2fQ3Ey2kg7UEpacj6rhVCpwCIfSYr9Vf3HLXgNMgxnSFSLbRI5OHmQMV55
         BQO+XEUhVzhoPaa/Ga1VWXv+eYC4FA/D/PHNKeycSW0zJWMx/l3rQ5nu+A9j1P0v4TIr
         t8rcedOW0tnDU/B0Cq2fNPPKho5ovCHBhe+m13wVHiFrOKTUr6NOsS4OPfc1DIHjvUKY
         tRRKfaFzfABTpvVueVPOC/jiTAn+B9rlnNYpxgJJvRKxrqYQPnUWtw1JXggqGrNcwjGy
         MhZ5w91jfHPSLXK7PpyUmRTLdB2MwkVjGUdJt0BOURXhJcGFwAgHn7zFxA8mR74o9krG
         ZObA==
X-Forwarded-Encrypted: i=1; AJvYcCWCr5LMauKuijLJ/PWk5d18bpdTvzBXZu1pNtLUiv3xcqCB6A6U1gqLYGa4wClfddi57Bn+yjSXxP6vZOF4rMEJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9MX5/qqC9z96COXq6q2x49KoewMxWzMW39y2ycCow7Q4YR0rj
	rzXAO7ZEmvGPKv+ws9KHANZxmDOyQiA9ypQwi991wknQIaRgHm+rYAJdVbaX2HI/rJ1AWzIEV6l
	/Oyp3wZTtTmQJxwkSMrC1WRxJ9a3lLoYszzXgWrHUAxevYVDDB+WjVSVBm6Gspyk1rIs/e/bECI
	mKkg==
X-Gm-Gg: ASbGncuxxnvSFz69o9jGISpBZ2In8wHIkG4VCK4dinnVKNctLkO1vgmfxD9aFBfBDZT
	R7g8QONmS15E05ujbfY/0Hm+Ye4rJFH09yDlxBjxcUrA5OtRdYZsK/vo3XJqMnDMAbwoIBex1Fc
	XRSD08NyN4Xg8KG8/1cXNpbK5rLGFCmjqcJZNu0kdHJewt9w8/8N8O/rUurdXpy9An4nq6QIZRy
	93Upj+vI4ro9Wi6PWytXbGIAcnmGHcMR9nN9gD7S97KiRlWi3tQk3dllRBcNuAdpF5I7xK6NyGZ
	tA8fGX9t3ffaWgZtE746ULmqYUk/sIwg5dB36Mk92MHGE/8H4weC+UQqqQO95QDInAmNh+zthCn
	FBMMrMNPbjXUUWsCI7SsP7hn/kOlv+zJsYqXo6ffLeyhnE1IrAIqOSFclfA==
X-Received: by 2002:a05:622a:1cca:b0:4d8:afdb:1283 with SMTP id d75a77b69052e-4e41e5453cfmr73046581cf.66.1759367028526;
        Wed, 01 Oct 2025 18:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+PPEgu5a9spnGcgbd8IPDdjH3CRYSnDJceqwk4HUzRW0WSjlgTwcpzIm44jNRFI2tTLMX0g==
X-Received: by 2002:a05:622a:1cca:b0:4d8:afdb:1283 with SMTP id d75a77b69052e-4e41e5453cfmr73045961cf.66.1759367028031;
        Wed, 01 Oct 2025 18:03:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011b140asm337846e87.133.2025.10.01.18.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:03:46 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:03:43 +0300
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
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
Message-ID: <eicw5g5ozli6tvcsvxdorvd5ymxizidodbrfitqezcezwlzdli@6koxrgnu2lj3>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
 <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
 <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68ddcf75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=93h1c-cikf9FHO0Tq-gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nFjSa_EfRVewVFe1vzXE2Gp_7yGOB1MY
X-Proofpoint-GUID: nFjSa_EfRVewVFe1vzXE2Gp_7yGOB1MY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfX8cmWeG4ZtwrW
 pvfEEmNsVqU3P7YEHwPedvC2cEGlW+Lh2EPSVE1ik66TpOgMgrZPQ17iDq6hd12EZ9kydRqn1N7
 X9chbp1ufuI7QealEvOBLOEnpkZ0TEBI/LYy9pejVcPlWFY4dybqEX457D/E+SgvGm8g7IXhKW3
 X2DwmKMSN5NuRDfLPW+iqN5w6Ke5ha21ms8wtDbSdht8XlFsriLcmCszh2IoX5k0hDQnL8ZeSem
 mtVPuzNVl2m0nwNsb/k61pgdDeicd3PKl3eNTzZFUzXPK/Sa3dB1QQCsCby1mETuUrJD5EzChw6
 lA2+aS3HNYN7n650dHEBIFFiLJtTNsVmv96jotr/p00J1qrxpA7Ppxe/2EJZ01CnEb0a4kYi93D
 gWXG/0dvAm1zSmkCYjPG7PKsQY2gZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_180350_408697_4945C464 
X-CRM114-Status: GOOD (  32.03  )
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

On Thu, Oct 02, 2025 at 02:52:35AM +0530, Akhil P Oommen wrote:
> 
> 
> On 9/30/2025 12:53 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
> > > GMU registers are always at a fixed offset from the GPU base address,
> > > a consistency maintained at least within a given architecture generation.
> > > In A8x family, the base address of the GMU has changed, but the offsets
> > > of the gmu registers remain largely the same. To enable reuse of the gmu
> > 
> > I understand the code, but I think I'd very much prefer to see it in the
> > catalog file (with the note on how to calculate it). Reading resources
> > for two different devices sounds too strange to be nice. This way you
> > can keep the offsets for a6xx / a7xx untouched and just add the non-zero
> > offset for a8xx.
> 
> It is not clear to me whether the concern is about the calculation part or
> the xml update part.
> 
> If it is about the former,I think it is okay as we have confidence on the
> layout of both devices. They are not random platform devices.

I'd say, the uncertainity that in future the offset will be the same. As
such, it's much easier (in my opinion) to introduce the variable offset
now.

> Also, we may
> have to do something similar for other gpu/gmu reg ranges too to
> conveniently collect a full coredump.

Don't we collect the full GMU register dump?

> 
> -Akhil
> 
> > 
> > > code for A8x chipsets, update the gmu register offsets to be relative
> > > to the GPU's base address instead of GMU's.
> > > 
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
> > >   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
> > >   3 files changed, 172 insertions(+), 140 deletions(-)
> > 
> 

-- 
With best wishes
Dmitry

