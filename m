Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE60C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngMJFXW0MVpSyT9cIuB08wDDgujyroBQVzUzKlhc52Q=; b=v0INp4l2NTtUhWEomfd7s9oiIS
	P5Vic4D3NkQ9j1GDuueUncJSav1nONjJhIyA64xCeJ5sndxcT4cYlwkUMLs3cbLCoKrUrVu5wQJ1h
	3YwLpsxRGcW56YPzY2t0F7akBn268aoG0ei69mV4ApfAlHNkkNlpW+aMcXzI18B3TWVd347qvDQqD
	5XaOB0dxUyO9N14IgEhp7AeU5H8aoAl9OdOrhJdxfWRNbVjLZI0LVmkI06X0LCvgH7DTX8k3eepen
	bOsD15WZhjFCZiNujglkHi67lCEHM1h45bEfq7MK++4p6rDLLQsLzVna8z6L85KBOqxsN8qUql3Pi
	URze2xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8q8-0000000FTsb-0Me7;
	Tue, 07 Jul 2026 16:40:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8q5-0000000FTs3-3jFF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:40:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT8OM017939
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 16:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngMJFXW0MVpSyT9cIuB08wDD
	gujyroBQVzUzKlhc52Q=; b=MiYr/TPIV1tgnI2ssrts3PiyItGY+zxGj8RBOb/N
	1US8orSQS1Kqkf5lDLxiYel8uxWhE1agG5lZh4l9NrQ1+3s3uU1iu/VQEr93MVLy
	hLqRCwJEW2fTBgHh+GNsCmTRW0NE+TllBeUgadAL6gokqzklRbdaJk/4GDfpKVaS
	GHputQFD0WBQhDtgOgcQjtX3N97uCAAqy2nFq2EYtzlm1iqSm/Qqzu8Zs24Dk0Fx
	qg0cPK8IkgftVeeByYZ39VmtZm+mreJ4g+8P+NdkDKHnkoDGrdFPyJKu3opDXq/4
	EQnaEm8R8JojofSQZN+MI6uHIH2aGXhvJf9hoINEC8deWA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep26v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 16:40:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73a5cef4811so1034395137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442402; x=1784047202; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngMJFXW0MVpSyT9cIuB08wDDgujyroBQVzUzKlhc52Q=;
        b=cv/S0IUUh88RBYj+knm5h8CrwGhdf6QQvtqa9r7pj35xINJViY7dSSCUterHIZp99V
         dv+8eH29VOAMzblpHQ1cAkcc7wlFEJTV4wPu5SASyF8dUgkTgWa7OSf/wyBirxiEQtiU
         J0Twvs1TGgS7nv5PBPEh1C+7XekYjEgYZtm4fmYMUkomYD0tKRtBtV+EOn2S2ARYQXEV
         13XIp/HrIR5G1Ga1yqtD2Qct/bQ0Ok0MbMt3KLW2km1U70LGOKbphWkl8ZHAYoiNM5VF
         hfZRtm4I0GEKcBYEpUhxvHy54gFhOx5xuB3KoG+lzQUWLpu/V7jIEccMeRlK46ROphmS
         m81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442402; x=1784047202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngMJFXW0MVpSyT9cIuB08wDDgujyroBQVzUzKlhc52Q=;
        b=SbBIN3WkeajIxZ9YrTCE2P07VZm8dVIrlmGTAQcDN13Nt8wZ0kRol2HGF1vdI9+N12
         BmuraBCVBpRQAMGxEj61ijyJgGbrHocl1XEWT1s8Da5DtN6pTdAKeiJy+WUmA65zX0Og
         s1javqb/s080ijl4kclFJqXNztSkWuREybaIg0AIpqm45GwLhYtNeKnWJr2O8bGuE+g0
         htvN9ORqE5XdJC4ueYHPVf1rrW4t7FX5PRP39TmHO4qt0TMLcB3x3yCCV81gc2N+AF6g
         8gnTzclKvA2XSbfnQ48dmsvektwXrW3gTH/9fIOvKdeqHyjC8ovRqW0OFuL3TgGS0G+c
         KLiA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/rnPV31UJ929mCLu5NXP6MxDNg3iFO5RhqrIdYTnbPzPIoPm1W7/CKLgpRSMu9OiKBaUDOol65hQkkmlnWgts@lists.infradead.org
X-Gm-Message-State: AOJu0YxuJPhk5W6/rUQK0ZQ29KYXbLfdmyPJAQac7MGBaPcWVKIRlFtM
	iyejH6WSodDntxgtVrym4yB/KgExI5Zg3qOkGH2m9v+H5KI6pAS8QdxWkX9qnPD10K0X43MKFfa
	w2oajH4o0U4ee7sCySCXxwOeGrj1AAoymdqCWtGLgQP01trqfn5Im/r4898jJBEbeUOCRdVjRCX
	BN/A==
X-Gm-Gg: AfdE7ckoNclMcnr8GDlsg4nCGUOjf+IwOspj085iqL5hGuNfLSZt9PlZKBqr04+AUsY
	oOqJwQpvyXytehYhn5PKG6RKfXe1V0okPMtqRENLAFd8XYOZHnakf6jeUmas6ZQtdG2m4iuQWjZ
	Zp3Gc7A5ZXJeGuPxhD+h+fb4Xq8hIMRNDs+9y6xOYc2obcwT15LhzPTMPxRV66r1FOCRpXauWEo
	b+89UxSNpGOMeXUToJd+BhCCAZGfMc9pJyLLW54vOaml7eSvVTQzOOtdAG/yUcShxkmZaGDilRh
	BjERKNa0XVK7oPtmL5CtGPQyaLvlRMwZulvky2mqy1v3+UzHaT0Ec06XCkxflD/hBYLGt1s8Qwy
	anPMp1gtHZdoz4O2nm8drEyxpJ15PqOTUdXATBmBiZZeYzPYbqTzOleSQIEd9ysqnnb4bH8SQNy
	VEvR1hMzbcHXcDKSajSpS++ZEx
X-Received: by 2002:a05:6102:5f05:b0:738:be7b:add3 with SMTP id ada2fe7eead31-744b7ade412mr3295757137.6.1783442401892;
        Tue, 07 Jul 2026 09:40:01 -0700 (PDT)
X-Received: by 2002:a05:6102:5f05:b0:738:be7b:add3 with SMTP id ada2fe7eead31-744b7ade412mr3295690137.6.1783442400917;
        Tue, 07 Jul 2026 09:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb3aasm3792026e87.53.2026.07.07.09.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:39:58 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:39:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
X-Proofpoint-GUID: vc7oeE9MIaS9HfaQ2aYYJZQEE0OBCcYY
X-Proofpoint-ORIG-GUID: vc7oeE9MIaS9HfaQ2aYYJZQEE0OBCcYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX6KkjDv/RcGm+
 roh3L0UF5mrkAHJKU4nuQ6fo+drVB81iviLo1TeqVKweCUUrAl08m67mvssCnrNgofUrrGRUY5z
 1rsGl/8QWapypEB4zVM0a/8EDHZ2MyLcgdFib6w1h7hfjn3tmwzJjmZ4/v2pdZGy6sI2DkBbnLw
 LKfR7tV98RGs9T6ANyHYm6xEZ4HABrXS8gAvSrHhkmqVBS+onjqWcn79anpBBrHlZ9+ygifXGz5
 jotaTdJETTSnKgvFs0IxAg5S3kInepqP1X6BpiOjFUutAVasAbkj8CExv4XSBhSL1UoYmL8bYz1
 VzlmaVK3ypq9XX5gGA+N9pa28nEFhi99ouLHrh+nzHtygFZUfoczC8fY6ITcAiNir1rLb2y6HLK
 MpP7J0ZiVIJAIskndalek/Mvkn7KjyqnvunIEyERAPqsFnq3GHuL5a+yivI+tAdH5KUvhaqGM/J
 WcmTeOd5qKeA/LP9kWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX7qtT8k3FVBZl
 6Zf/j0lt5vcK+cLbJsg56+QkOqOUcZG6eQDIw7gPVHaDfy3xfxVlApwR2pH24/vTbRZW+IPDYqA
 GD4F6eRBIdKKEeEiicQl7fmzQWIKwfo=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d2be4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=1fOCVGvR8NE8L1w4xeIA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_094005_943111_48AA6502 
X-CRM114-Status: GOOD (  35.33  )
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

On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> > On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> > > In order to associate the SID used by LPAC to it's own domain and
> > > context bank we need a separate node on the DTS.
> > Can we use iommu-map instead of adding a new device using the same
> > addresses? You provide zero explanations, but it seems like you are
> > trying to separate a part of the GPU into a separate device, but it's
> > unnecessary.
> 
> What I was trying to say is that we need to map sid0 and sid1 to different
> context banks.
> 
> From what I recall, so long as we use the same dt node, the iommu drivert
> provides no way of doing this.
> 
> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> and secure.
> 
> The address on the lpac device doesn't really matter. I have very limted
> knowledge of DTSs but I think we could just leave it out altogether?

I think, you were poined to the Glymur Iris patches. Another option is
the QDA driver being submitted too. Both ot them use iommu-map to
describe the same usecase - a set of SIDs which are used by the device
but which should not be a part of the defaut set. With it in place you
don't need to have separate qcom,lpac devices, no additional properties,
etc. 

I'd recommend following the same approach.

> 
> > 
> > > Add the code to look up that node on initialization.
> > > 
> > > Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
> > >   2 files changed, 21 insertions(+), 1 deletion(-)
> > > 
> 
> Best regards,
> -- 
> Anna Maniscalco <anna.maniscalco2000@gmail.com>
> 

-- 
With best wishes
Dmitry

