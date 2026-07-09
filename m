Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMd5SzYa2JtJsuef3gXqhLimtjjWD7XXATJ3fVJWKFY=; b=ZNshnhw5qgMiz8n8SulYUzT7+H
	/zkBN2kZxAkoOxVLei9o+MDVKGvocs/SencrwbpVJVe28JpWpBo8/0IEJK9pS018P+p+XiLqvdm2H
	hFmTBKvNU8NN/bwDm9O/DPgzt/senjzcwFcX4ybZ2UQlRKCK3WWdCJtFQsBEOuXbAUAfkMQykk8ui
	gEHAXYd5SiSoRWJShX9Ma6xp3SNgB/t2oSdOqb/omaMBWb+d57P6Q7Q9/a6hny/G08GJXx+s3mGEU
	cPeEGHNV+ipscf6VsW+O199k1pt8FEYQbQpgTfsayMFVkRhDekrZrCrZwj4hphQPCCkMvips+FmyT
	kJLj8opQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq91-00000002qdp-47kz;
	Thu, 09 Jul 2026 14:54:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq8z-00000002qci-32ex
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:54:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwUDd2014496
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 14:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZMd5SzYa2JtJsuef3gXqhLim
	tjjWD7XXATJ3fVJWKFY=; b=fgFK1CrJsVkn9+lyI6grWkzihN4jSETSO5v1zhyx
	yJs1ZTq+7KHtpwkUTbuaxhcF3PrJU2srnVT/38qhJ9mzZM1mQ4QjpOepB4feKAhb
	qUCPsOaFsIoCJtlfRnch1AnGKK1yM4fPZZ7L0NHLzFKXA8C32Mq4xZlovyMONOpy
	As1q+d7o8m7GZ4QhEASjtxVGnbHUjp59LzbgeSQo4ZsQoFzzQ+geRApF82v6PJQj
	J5c9kaLgTPyqOhu17GRIOLVfHTARtljnj0obrgas9663NRdQSoTqMvFGSqpoDCT6
	DLVVepZvtOFYWaPqh6A4NGKOmJiJpHkHoVfPC2GrQjWg2Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6mdfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 14:54:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7c828adso377358137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608867; x=1784213667; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZMd5SzYa2JtJsuef3gXqhLimtjjWD7XXATJ3fVJWKFY=;
        b=BLJeptHLvDbpxP5NVYM2WbjzysbQ5U97a4647rm15joXkYFWcPRcpQWQOkS7n/pKGA
         1B3qiCKd45AZenXKsgpcd5iap8xs/14G+a9XxMNOgdkE8wO9DwbCpwWRVLgA+4EhZTWp
         aXK+ChFOaG4NwwOYYRx7QWmUmgQeGyWsaGMhWXk/1aUNt9rRya3vdFal9sp21BpcO29D
         Px6IKsDZf2HROw4HYA9V6UUWR38fFL+C3NBoy/V+fJj5QeOnmfe2CO+kI1MSptV3kIb1
         elW/cwNWrTfc4GF1VOz9ec6suZy98ltuH8l5/qahtqxmVWatcaaceV/OfHu8M9At+ucZ
         q2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608867; x=1784213667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMd5SzYa2JtJsuef3gXqhLimtjjWD7XXATJ3fVJWKFY=;
        b=DDxkE4ABJpgFYjKZVC3R61074pbNxZogCmiDkt+on/Q6QaP3ibaKZHlXtmou11j9ww
         GLmTFM9pWNCj8tQg7UF5Q/MS/Oqg0SPaEjR0ZOl6YIJZkrkTrdPy1DS4a2hnSEBwSaE2
         hEbTqJ//Brym5ECci9xyWzavrTEhEc+J22WmnuurqeFdoDr0sUH4UyKQ2CKupl0/NBru
         0Dflj7QwccfcmEk1RQNlhWREk1jSEgMMicnmPaxOmfkfNZEgCoU88eSISeplr2uioCG6
         vQUaJFB8IhhgamWKxeeq6mR2xiWoGpyv/dYEwq1HamppHPdbaTRUjqXe2cyWucTcm5+C
         IzWw==
X-Forwarded-Encrypted: i=1; AHgh+RpnJDIIBbpgTwvfWU7Ue+TkchQHRDBYBLnTNhwBSXkJtODPZtpg0kUG2+jqWiiVmnYtk8XB3YvbIWlRlucRJvrA@lists.infradead.org
X-Gm-Message-State: AOJu0YwEgBf312kGliLE+YCStD17wfWAy/CML7loLQZ6b1fC5qNzVz2w
	MdrZhESCM0l9pme24Z9QUKfXTwyr/LsExRv1JaAdGIzi/XZe3JXJhBDZksJa2H04yrPtnug3Bna
	P+7GikcQiRHmHkQy9eY85qN8x/TSRl62dfjvS53bDdlnsyg+UjOYLZ1pHdJeYfUMV3DRxQPjFz+
	nlZg==
X-Gm-Gg: AfdE7cl+aoms4xBFHpXFO9VXBSVgKvFOZLaLncS9feOSkdYURvbpF7U4c7TQaHMu0CP
	Hxar1oFbylyV1sys1kObvIoDDQMsTfqVDqmRSfrGVCSEkUQpBq9k7T7ENzC3c/7YZ+v1FJWa/xF
	mKoaYkTBsqvZhMXRvTDlmCe9qCxCnB0kU+yVWQ1K1dRfJdkoZYpGu6Foe849SDOoOX5YBIpmkml
	eOr8jTtSqGLcgL09jayJLkRVMGOn5hLUOcMKUPLRhEzHebpT4cpB7SNrw4wqMuBLQjnLqpeSz7U
	UqKAPyE9Bzz1dYisOfEVludDRhVKhR7xqQ8nREU/d+yJT/vN7hiQWfl6LqxM5Iyv5sES9QxPDYa
	2hehB5YAX1wbW/dmwZTjK9drkO25Ywcj2sWZ8M9zmR/84C3fHhSoiGu+BHhkwQ5q655hmLWXLrb
	sp0OUp1VOAg0p4XjSbdViIlDJ9
X-Received: by 2002:a05:6102:5cc1:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-744e03d0408mr4194093137.22.1783608866717;
        Thu, 09 Jul 2026 07:54:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc1:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-744e03d0408mr4194057137.22.1783608866193;
        Thu, 09 Jul 2026 07:54:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b017c29961sm500429e87.29.2026.07.09.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:54:25 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:54:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
Message-ID: <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NyBTYWx0ZWRfX1R1T9KttMSxR
 bNpFHEvBMW7ZIMHn+Ms9qoGYCrlQ7+Jw53eLV4OhblPobQ1zryWpzqnDWn56D2CFxPLVcjkZeRN
 JUOMhQXkmgCBF/RBN071CeditxEW644=
X-Proofpoint-GUID: xts3HPNhJODlc7LeS_UaiqtW_nKrB_R5
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fb623 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=pGLkceISAAAA:8 a=gTY0VpHTFMgWGwS8g40A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-ORIG-GUID: xts3HPNhJODlc7LeS_UaiqtW_nKrB_R5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NyBTYWx0ZWRfX0n5LUh1dKZCm
 DSeH27hWNuH5tK/F+rYqlJ8ZY1EHlMfuAvmqv9a6+rCnrXvGXFi+rmr8ThtzYI3vXGQA4jEsxgo
 oFYcC2jJo71Xd1LGh08aqOULb4/WcRS6xHpCfI7I+9eQCzZp8PhPN6m+ERpehwNT/DzGlHYlUAH
 WkaL0N+y7m3QT2DCkCfaFFMZO7+YPxi6d6oXdfFYzKBq/tBicmpb4eR/tE9psU38VS68gQfanCC
 nyOD4hXvKoubdlNwUQbOhl+4WmXpCVR/13ouZmL9bC27b+uyf3guv3pdti73jpzmmIw7b7PzuKB
 MyKIySYdHIixpuSQ1buEXw6L57AS4j0BCO5NXoYd4W3jt0D9W2AkEMT3fnkdTXQagU8JOiDpLd8
 EUnRBGtayfTknl13OjjeJvGqXLNOPvhPUxY4MV8koG0FkIXmWNQ4C1TE+cGATDl/IaJ58fqthw5
 ZOCKQ9yYCGqw/I3aF3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_075429_879723_69D35996 
X-CRM114-Status: GOOD (  38.45  )
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

On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> >> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> >>>> In order to associate the SID used by LPAC to it's own domain and
> >>>> context bank we need a separate node on the DTS.
> >>> Can we use iommu-map instead of adding a new device using the same
> >>> addresses? You provide zero explanations, but it seems like you are
> >>> trying to separate a part of the GPU into a separate device, but it's
> >>> unnecessary.
> >>
> >> What I was trying to say is that we need to map sid0 and sid1 to different
> >> context banks.
> >>
> >> From what I recall, so long as we use the same dt node, the iommu drivert
> >> provides no way of doing this.
> >>
> >> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> >> and secure.
> >>
> >> The address on the lpac device doesn't really matter. I have very limted
> >> knowledge of DTSs but I think we could just leave it out altogether?
> > 
> > I think, you were poined to the Glymur Iris patches. Another option is
> > the QDA driver being submitted too. Both ot them use iommu-map to
> > describe the same usecase - a set of SIDs which are used by the device
> > but which should not be a part of the defaut set. With it in place you
> > don't need to have separate qcom,lpac devices, no additional properties,
> > etc. 
> > 
> > I'd recommend following the same approach.
> 
> iiuc, the conclusion in this recent thread is to use child nodes for a
> similar case:
> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/

Let me check internally.

> 
> -Akhil
> 
> > 
> >>
> >>>
> >>>> Add the code to look up that node on initialization.
> >>>>
> >>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> >>>> ---
> >>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
> >>>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
> >>>>   2 files changed, 21 insertions(+), 1 deletion(-)
> >>>>
> >>
> >> Best regards,
> >> -- 
> >> Anna Maniscalco <anna.maniscalco2000@gmail.com>
> >>
> > 
> 

-- 
With best wishes
Dmitry

