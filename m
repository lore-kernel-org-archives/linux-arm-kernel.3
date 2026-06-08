Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13480CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TszHFZ7K4js/ZAFR2FtK66NQPI9cujME4oGOjetByeg=; b=Bdtfp3nS5T/N+SpSN5qwhpdZQf
	ormkUJrjCXKvytWhJB6r4JiSjArIaOSf0AOd1tLxdcJoGJuYZoXkBMiBa1iFy2r8Ca0H98OlML+0w
	aqRBOArU/nJxbHQjZhUFqHg4Y43ZfTQw2JmNmov1JjjB2hDuahGHDGeE6uCIxKyOxcxzOTrX8WVEg
	kBI2YTqld9DFr9b3O49qGRYO1dkXwS1otVcOKmHgN4ydZoCh04XWBEhwnoeqvQNcmiAdS0mw/bF3y
	PlF1tO0/wKEuBEW2nQZ8kVUOep+CbcCJxVX3y33Cu0xIThjYJCo0BROHk2iq8o134niyz8mMJqt+V
	y7qVW5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUGx-00000002yE6-0viN;
	Mon, 08 Jun 2026 07:19:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUGu-00000002yDb-1nHv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 07:19:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OrLL2274530
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 07:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TszHFZ7K4js/ZAFR2FtK66NQ
	PI9cujME4oGOjetByeg=; b=jpcG/D0X2/E/WrFN1uFBDKV/q4WUAZwxEvep5M1J
	j1BiCdduPfaq02JEUHAzRRGLIAwq7CjazfFRjN+HyM+LAM2dyysoT7hDLqIfAvXz
	9Nwg5sfFc+41cIR/o+5tI5fRue7n2BZoRBGGIh5VJLcSrlIjAnd39++ucNtF89fP
	bKfGg8DXlFg8BDDJFMlnFQDFUXh/JXj1VoZYWzUC8f/bcUENSh+7CQoCmrODHd/2
	YiSkB7eeV7/TuLUszkH9X6BWGlPIN4wX9gb26VtOQ97G5a10pPn7UCuS583WphJE
	jp469EdWpssWsVebwH5dn3ZN4TXUWvfxF6wbVymaoP7obQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgx77q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:19:43 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96391e58e62so5400047241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903183; x=1781507983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TszHFZ7K4js/ZAFR2FtK66NQPI9cujME4oGOjetByeg=;
        b=ee0aLi2woAvTemKuyMIIstClMpPrCu9HLXDfbbW6PebnlgKRuAi5ydudqFquIgDulW
         ztopmofueKsdmPqtzHQ1+Duh6k9WQ2MvD2uM+qbVInXAD8y80q4gjNaqWnJhyPVbHRx2
         kIV95Y1TDRthZVgvWa8hTw8CYvyKe1cwXlFaSFz8HhKNV4lnYp1CxQZUHb6LPPYXqTuy
         1HDNhhFUpD0Zw+PMjagEqDJ6j59csRZkLlJ6N3HnD0dVb2XQCzmbNpkObvWGoLQ3HZqW
         jAeDjCpnce2Mse3X15rNg+PI98aP3C4sJ2QiKhSnUXOqr9dyIaqF1eAJi0kvb4PLKJn7
         FbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903183; x=1781507983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TszHFZ7K4js/ZAFR2FtK66NQPI9cujME4oGOjetByeg=;
        b=GIPFnX+CsmvxIL05/XvSLjK+zuj6SFNgIOJQD0oyvJedvO1naW8Zmc8dgyIQP5eB8e
         36xFWqDVfelAlcqsmu+asK/ot0ZqEUNfHpEvsopCGKk3uVfNmixT9gtSg7mVnpbvNFSX
         eHpffyzYe6ZccoIxxYV1dwh6dLzGdqoXZL0DDUh2AJVw3qs1EZg1XnnYtaC+smpC/hhl
         BSbvZfYksHknbDI41AEzDJPRJR9Cjk3FJ7jxexXaHVoYkOFYIPIWKZQI5W5e3aFNne/8
         M6ecrnYzKbFhtl7dVKlbsVlQLME8D/dw9B3hw6UOoEMnJ6dEGZGj2QCPjvkZ3Pk6FahU
         i+tw==
X-Forwarded-Encrypted: i=1; AFNElJ/jMIIC+mwIzWAe+W9OUpps5KfVp6CP3Mrgz4NfYuynRotWB6gBwGBWke1V/EmItlASbDbxyDFI2kE2rVR4NTJf@lists.infradead.org
X-Gm-Message-State: AOJu0YxzMu5K6GDTG+kGlvcaJGyZcA7uy0yatcUXESWZ1wx051lQM93N
	8v2oAWloXPYju9AJpwv5uSgPITQ0bFz1iBWBGPrT7Dl9RbGRLZLj03QGQZeZrzw1Izck7QzroV1
	DtQt7XAHngTuGJGVsxxyScEvvU2Oe10eYO4I9dDUUz96Tu8OI+c0xyGj3YSx7ez6oOiHACKXF2h
	Mn+A==
X-Gm-Gg: Acq92OGGnj5D6/xDwYt82mpEg3SQug33x3PwM+H7VsYAjz5gWgK72j6SwrAYkZ3LT8A
	9N879f+mrHpTXnR3KwORN5QB2l2ScNwHZ2tptnOSlKWThOeFPv93LxhkuEItrJgBAUN4mROKnIJ
	FREcf06czclhgFHjviGaj/gzLfKJjmjH0upotU7LZYDPYiI2qzaorevKsFlTVtdt/drMW77x01q
	IfIsqSS0K8JsKA4lP3fP7vl2ZtEWFToQlsPvavBaeky2eKH1hy9rY1T0hrmMNCxzWmxvubC5Sdu
	Sg9pBWVxEx6S0r5M2hLqQOhIImzpJgXtt/Zc6HaiYhvKQGLw61eMfnKGLcVBRhmDQF60e5zC0ln
	PhKWubjslPNK/hdwQkjbrXOeLOLxiEf6j5TXDv7uWcbYLuDvYZozW+9XkrPPJFVanjXxrlBJ+A3
	DwXQ+UUi6hFcPGl8vh8GQvRwxZyas2zGo/icXgRF0hD99FkA==
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr2919808137.0.1780903182940;
        Mon, 08 Jun 2026 00:19:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr2919793137.0.1780903182529;
        Mon, 08 Jun 2026 00:19:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm3605566e87.23.2026.06.08.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:19:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:19:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <dhtuvm4ejg456jy65kwbejdo2amrg2khaljlmurse4vkjok25p@rd6wd7tp4rwd>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
 <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a266d0f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=h5pAuauRZTFNeIU57NgA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: V0vKnMippCqjbF6xeLWt8CdlErgzVezm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NiBTYWx0ZWRfX+wUHW39EfL+a
 EHgGoo6C6XVRJUI25ZcPdfKVbVO0OwnWSjYgxeRUZIy4G0iUOztoQbuuRxDj9AehUanq62s0Ro7
 lkbYGCRSL433QkWlLBbK4qNft+lapvi/kMSY7Hlq/7FTDmWaP1CoqVin0snGmyGRyluj6s08h5Q
 4s0g6xX2jszmxtM3q57ngTmafBec9HMM0oiTEuW9T70/qt3xeMFcoyjbjitL3LBTwNHN1mwq7ap
 yy9B9TrhXRntpSN21uBy6Sh+aA6/b3BwXFKvEM0pLPDyoTpCwWWZ0FIXsST2ZtzV9n0W1pTKiN4
 Wcaldra1aEcLPo/s9BCvJth64Gkjg4EGeSaS1Mmb9X0D1D+a1TF/Orva1AmV17kKdm9rN9J8kin
 /kQoSzM6nenzIrAiE23YONo+V6ozHs7WGJzrzapY+BS7PjkpWBfiajcJ1Bw6F2/WxSNs0+92HQI
 7cTTod5MY3atAYkTdCA==
X-Proofpoint-ORIG-GUID: V0vKnMippCqjbF6xeLWt8CdlErgzVezm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_001944_495592_ABDA9CDB 
X-CRM114-Status: GOOD (  15.51  )
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

On Mon, Jun 08, 2026 at 12:31:42PM +0530, Nabige Aala wrote:
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
>  3 files changed, 21 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

