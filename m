Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26425CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kbaM76E9XIMD3rRvXUXjCdgvz/AxED9u3Llq8yAVaY=; b=SmSVJjelRbylCkj4S9dCrBzmZ/
	prBMHeHndm3GGGtgWnS7UywDqw52jinr4ldK665b2CnvAQiPqOxWTtPrCNehitM27WqZkvQHafuP/
	sD5GMNM0Ma9s8BEdvQhb6OZyJMUWfN2alFVL2Hhfb2h4CWEeX3C491rXgQp3F/EIA0fFwhlFJCWe6
	fayCrT/ksIUXZ9YJG1SDPNpS/iRj+xCgbTbIe1aTG0eHxZZ2yAM+1bXrw5H+rEUnC+NY0UMhLJtLq
	kJ2IRXZlILcHN3h1IEyOt28uXWEnsALRHWrUis30+L+PtikrHJDBTkets8Rqu7MpadpmU0zz/bhLN
	jMwEX0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI6w-0000000F2SA-35zn;
	Tue, 16 Jun 2026 00:57:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI6u-0000000F2Rn-006O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:57:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OMt9092138
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1kbaM76E9XIMD3rRvXUXjCdg
	vz/AxED9u3Llq8yAVaY=; b=LA9/oC2SG+bp/2vSC+T5fzx9421r2DAAaLl7vYxz
	5gVHBtNNd61dUXxs+P2hgXdQKwhII/PoVX9+LOmFK2TACn0bv3phWGb9O2G1tSFu
	0XKm98eBi5wBxbGMv8NnmJcXsN/FCMmNEKxK9jKd+qjreQJ6IIhL8nRbon8fvdvz
	FWtK6yg1qIIDlB1xOI4IxB0u6/I/Jdjna/QcrjRtOlui2t0vwfV+S429YTzNiiuK
	tGPx/9CgYRamLstltjtBA6crY3Wi+5zdSqF5fDk0OJwD9wEZxer6xX6WR26ZUnDH
	SWkQO5fvFF2aqg/RGrVZXaDVR5kKdPPLVw1GdMniOg+o9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete9840jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:56:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158f2c4b55so640553585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 17:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571418; x=1782176218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kbaM76E9XIMD3rRvXUXjCdgvz/AxED9u3Llq8yAVaY=;
        b=PVM4ZcUOct96tq+y9SM2ANig3g1/B9s59ADygeWL9yTbMeivlFbU+xwNGLKhGWHB8o
         IpLUkuedbgypD649sLoyjd9XpGPZOnKNcEDVM9WL7DA0g+UP67O5i3Cdn7JVgFAPTBEj
         GEndUiRHcvw0sBJPL2RDcFCMa3gkNL5VMPmq3P1+TfVGKW1Gurj/N7WSMDKSF+BTgcNo
         hF66NKKLq2pV8dRya5Y4SFje8nq0qOMYZkP9eGr0Xb3LkzHUJO9ACb1MxKDIPEDhRZD2
         wsZHxogJ9ak4OKNmzyhPveGEZi+mqfkPAYigkpGMfBWIodT6lnk729cETLPkfJ6AY/Jz
         4zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571418; x=1782176218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kbaM76E9XIMD3rRvXUXjCdgvz/AxED9u3Llq8yAVaY=;
        b=gl5xQlL3gr321LLazASQnxFj+llQyys2u0D4VhKi40YgL2KsZYqluG52ekpCsEeGL7
         UncwWv8s7BmsMNrrguaAW1g2cwHwmVDizj16wwKqcm3C7QscgJBx04iYzmqrpSjq7xOj
         X0sHJK+biy8A/1vHyJ2INPI41ZLQ0o7BcERp6TzXQcBBnB0lCtVkj25CiJ7d8n+kJqch
         aX1iltLxqEDqrEpAZ0kD+q2WoHHCpBre4Cu2GGyPCEYxJWtKjtmSKLTnsOiWbRswFbK4
         n8bYpzIdBQWc4aPmAwcBvUinnKKuljDyWY0FRn3a1y0dBEJRBVBpp81ni3+0uNWqnByq
         0rHg==
X-Forwarded-Encrypted: i=1; AFNElJ9tvTg67A8Prem/MQF0ZPMlgwDgyGhtaHlMZkWMCAoTYmUU4YM6WLsdznfH2epcPKG+k3xksZRJngKNdXft6JLs@lists.infradead.org
X-Gm-Message-State: AOJu0YzliIX6RltsulPWrPiE6vDDcN3y+okB9LfoWKUTMN2uJcX5aAcp
	WaWW4eN3//UobedQ0gbVOy/1lPgv5aKi8hfLQocv3FaJG0jTJz+7FWn1cPE0V43sf9EhY/D1g6R
	ATZNyaAhw4jO5z/MILNzNcpBOeqBX9rdWWcInfxGPlm7Av6tXZyD1Yppo4S3fOfY42fifOoyynf
	ZY2A==
X-Gm-Gg: Acq92OGgXez1BQEuRUYjmrvR6zK+ilhCgQDN7VC/j2mgb4FhMPqp7eaGvCb9bt7xUib
	0mHSOFsd3AgC9NT8aZLyOy+qzf84lil8TcdR8J2HYyC2+ruy6QjT0gJpG0uGoDUwL3D1D/alf4b
	t/u5Ix5IWO8ATVwC1QUHgAasAJMnfgKIzNrQlxJ2B3Q1uDITtDW3PyTddu9CcE/rs9Es1NEjroZ
	KNrxWYRlD7YOegnPM+zi6CHsmsqgufdU/FCPLLqkscpb6HlKU8ei9/Zw8aiGwDn5eeIVPCUXwN+
	1tHDYxoVf09vtzXKN6DC70qnPEfzVE/ygYb0yFiXNGZLit3Q1rajRffCG/VTYcXi9Kf3lVSAo3h
	Cspk6fWJrrjyMV/noGKsVwRRgOFIYfeRuS8warZrwsFwGBJDYYZHD1sW1353do2YE6werWdw1gG
	ewko+HHw5L3VgU/4ErIFTjwedA305xLTT6ZLs=
X-Received: by 2002:a05:620a:258f:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-91c24579d0cmr350394085a.20.1781571418326;
        Mon, 15 Jun 2026 17:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:258f:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-91c24579d0cmr350389685a.20.1781571417856;
        Mon, 15 Jun 2026 17:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad3d51f20fsm925671e87.61.2026.06.15.17.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:56:55 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:56:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Add support for A704 GPU
Message-ID: <yldxcxtrdgsh7c5s5llnoobdmgnass6spyty6mg6yfvcrype7j@xhgga6vafd7n>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
 <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a309f5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EcFSykfY_HSBU6426B8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0XOhYzrYFsmAyDszpCCBPZY02PWGXooP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX/lnegJCnVj09
 ZyandHnowhMBYS0vs2rYitchNlbsus1JEwquqy0r5Nyhn/banZcWcgK6poKpGlULxd4d84MGD03
 6RUtI56VdlHUYFFQ/X4SDwmnMQcdEw8=
X-Proofpoint-ORIG-GUID: 0XOhYzrYFsmAyDszpCCBPZY02PWGXooP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX7T1phvJYdwfG
 GyKDIwqw3QKKrFK80XjC7ocfC2Lwb3mMyeyRI3OZk+ND5fo1UqOe4qIK9cN7P7AJ2ZxCSCbMUZb
 jTP/oDimwHHYE88AVTYGkmtCyYBzoOO/+SmyVlahFsSDAflm6crEmBxt0LYTSYXb23IPJgOCxyt
 KL7Udz9bLtPU3CQb1QfzUQi0jLCKw3IIpZ+PXhyy66duo1YTyZQ+dOu2DTiyFtsQff039EIb2bD
 bat/yNV/knEE25BKb6/d8xNsvVw4P1Et2DA1K8295PzgGcpNJmewHHLsg/ddZTyDLpOIDg8w5gM
 ytFh5inNDrUD1p7LSiyl5WLg70xG3GRnraei13hxUDCCSlDbUAO2S0E6KxJ6YHe0DJcYe1qRZK7
 rqpapqzZHp7YnaEWAF2PmrpFrXA7gl7ekmdkh7YJyB2SO+mDSwbnAQV5irn5UOnMX6jGmjCMuXm
 yswtCTZMz9kqzAM30ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_175700_078014_95F754B6 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, Jun 15, 2026 at 03:02:58AM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
> minimal changes. The only KMD facing difference is the chipid and the
> zap firmware which is specified via devicetree.
> 
> Just add the new chipid to enable support for A704 GPU in Shikra.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

