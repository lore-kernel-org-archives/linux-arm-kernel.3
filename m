Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0009ECCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 03:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6gfFLOMNYMkWUfdwrHHvmuf2M4FWVMTiIkqm7l+1fA=; b=PuVHpMKLuJHdCibtmaenU/qB/X
	MPRi5kil3AcNPtdp87YVaP10u1bpPxNoHy7DHlHwuMqjSVBBlEDEeIf+qFGYbk0m8asO+SZeZq+RB
	vbubsR49ZTpjjCVVIZb9wrrSKh19NPIUytBofnT8hZdEnBP97xaCI946a8EVp0bGupMOVhuAbCw+p
	/a0L1Ai30eQBzlYFpC1h+QbEazRtiX9MCj2qIJZGDu0OJtTii9zHowOpdKNFotb54xISf17VqYMhp
	qlTmLQZjZSR2dBTdxQzZCVSj0AoeB+Mbpu2bhgBN8/95m8TyUm52tgYpZcdErvzgXMNMh0isaKWjV
	IRfaoPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOAq-00000009qik-2ZzA;
	Thu, 13 Nov 2025 03:39:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOAo-00000009qiA-1TOZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 03:39:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11GpZ2909737
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 03:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V6gfFLOMNYMkWUfdwrHHvmuf
	2M4FWVMTiIkqm7l+1fA=; b=E2ibn0NyZbA3Ts+3iEG8rYsonyqGqBzb7Ro76wZb
	zZI6L5WNFI2zNwHFMTt1D3mIn9JJkfiezHMBwBbUCufUcQ52HHeuYSd1IGIbgy0/
	i15vALVjKL7pBHbSItp4nT4HPtQPzOTuiTWmS2Hahj0/nmRjhSWHhrTIs6FDus2Q
	zUTOp36uw5ratHgr1ZWk47v6meB2RtMc4I6Cr2gKtG160X3rO12oU16zHLyahNMu
	gut8iqAP7KRZaFGftoPYKn9K58Li8a5M9ARctTc6gEhu6JIYX4PR2UfxXw21WY1y
	WnAKCz9A95GPo7BfBo3BIX+rps6T1yMgr1Y9Bf3lr0zBzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acygm9egn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 03:39:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b19a112b75so122732485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 19:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763005140; x=1763609940; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6gfFLOMNYMkWUfdwrHHvmuf2M4FWVMTiIkqm7l+1fA=;
        b=NDcKx9iWwtn7lgE5DGu80TjoM5gc93rBu5ob/001wOnaFCM+NiivXbTqUcOQiCA87A
         Odrr1gZawphVG2ByuvWrHzh++QY3aJRNJoKIm7Senfo+ugnQSGx+FqU7wKguglsLwBy4
         JlAGY5KBgpo3KjzGoXr+zXq4pG8pW4HiNNFoy3W08c/gS4Drjq+d3GWanMRJ8wEkNRZm
         DCOa4rzCiAjeNnGcbVen6QBTllFyu90pCG6W0QrTKEvaUApNSPDTcfWXRAm8C2USxLip
         1gj9LfY6cfgW6eQjwNLZvjkHRvbDApZaYejfN22f3vfesulzYbONJRZOpk+AyU/HdqJk
         wYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763005140; x=1763609940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6gfFLOMNYMkWUfdwrHHvmuf2M4FWVMTiIkqm7l+1fA=;
        b=LQBuiq1SkKK2eD62LWOYTUYST7iv/2lxKHK8QJaQ3sZG2FPNyWVwCIPnaK2bhgoFmY
         n5yNWPc3zrgQEpu/WSyyLWW6yo9Rrd76qreeqO89BaHU84L/bxRxQi2wsKmFNec/eOpj
         wtb/R/9JNdxO5b5gmhylX8/syl2vLrGLWPm4/o+mvA3/Z2Uiz/cUw74LzeF0w9Og2o6U
         l/uf3xIEd5nzxpCmS8QH/Cpn1KlIkmHFqJjtpUNCImumz9jpNRuylR1BJy+X5W9ptCv3
         HCsuriZM5cFIq7TmQMrgJCYv8jkYlPa+vLx7EsV1oZonq4Kuhq0+JrORvbFwISxbf6UY
         potQ==
X-Forwarded-Encrypted: i=1; AJvYcCV28X4e+OUx3By/ga2vG5PTvsG6VBgODE7624czwEX66hojFbwdT794WSukCfQuGZO9MhzRkRcOZbtYl+NftZWR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4C83oqZGSWKInZzRPDVdvgaXV6BEYLTA4agfWpAA4s50K2Mah
	9vRgZW9UwnfQ2iyh3KTBuw3R1uII/ZYwrwOKhNJqL6IsIZ6WNUPR2gH5uG2SZhVs+tggRB2ocMN
	i6l4PPWmhJDnixnIYwdMlN6t5n1u9JpCiX0YJbI8bMIUguQW6c5Frw1egsHOa4bx47RL3v42hHi
	Pynw==
X-Gm-Gg: ASbGncvybhbyDHEcaKZ7y77zUy76oRVBDBhjfV5D9ICeRQeBdFwCuDFArNNf/RvMJeg
	iWKwg/NFKFo2kVBUr+7hFmkSaA5wYwiUKoWtaexT5qA0SliD2s8NMOG0sK/fnZ//z+UQCflpo+7
	a7621M+cEBy/FYo8Y364y0e/UXTokUxmjt50h8PTHWm2cX580kdJFPl2bheZAg/dHGjGXqCPQgu
	HkqKoK1T/SO0hLC7EsmyyP4tiLoTzZFaPQVS154VwZ0zD8+ODGq2ojEBE7Fa5L+Fxwn6/3A4dZt
	+A/suBy7vjhxWF1C3iWf4sDlSKaXGLo6K3nUqnZwAJH0yYFGNl5V209eI/iH2OR30xr4ZSxGjBR
	2PALtGJQ3uTAl+iRIUBsk4QphMejWjWeyfuJRGtHB5F1aWg399fIWbZjZNhcA0YgfL1czOz++FX
	VueQIC/5ot6Ydn
X-Received: by 2002:ad4:5ca6:0:b0:880:541c:8243 with SMTP id 6a1803df08f44-882718ce64cmr59684676d6.1.1763005140611;
        Wed, 12 Nov 2025 19:39:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLs3C0c93KWlGhuQL2zqwisxhLVaS3eXXtyZ+U1XHiyIF0ajQExCpK2eFHj8X6rYEd79M4mA==
X-Received: by 2002:ad4:5ca6:0:b0:880:541c:8243 with SMTP id 6a1803df08f44-882718ce64cmr59684426d6.1.1763005140130;
        Wed, 12 Nov 2025 19:39:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804057b0sm118302e87.85.2025.11.12.19.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 19:38:58 -0800 (PST)
Date: Thu, 13 Nov 2025 05:38:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to
 catalogue
Message-ID: <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
X-Proofpoint-GUID: KDXvbjMzSZc7YlqCm1HTNTXuDyPKJY70
X-Authority-Analysis: v=2.4 cv=E/fAZKdl c=1 sm=1 tr=0 ts=691552d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CJ44idKeuHZi8Vt8iyEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KDXvbjMzSZc7YlqCm1HTNTXuDyPKJY70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMiBTYWx0ZWRfX/6nEKRedE4pI
 ZRXFKNnR6sHTHrrbEQFqpSBKSQPUUY1bOLjhbxa2pwZyFWdqoCT4FOJhzA1gnF6TmaE9Bwvv7aS
 qgZvjbhcDpqoXMcQpaLWWfeKmiiWZwg64+3uRYVE8XouL3lKmUnZx3sWBXSutkeDuDWHamZLBz4
 T5UXhAchQ/qZNsV94nqnFF97CUoMDbDqm0KP/jBnziKXu1vjUyw+jpHKpRsMHTWePdOZcMfQkjj
 VsWEzQWB8Hvvncy509eQHohhb670yQJ9YBNS7zxJxPReHp/TMzySfJK+jQ4dA/w3xE/LrIT2qj4
 coC6l+ReT56zZFOt6RYrmy0EWsxkcHt3ipd/DSME+MKeiLYxdxT4k/uNVtsQtZYqM1iC2xo3n56
 0t7/M4wFy/ioYyiIlkF4xwZTMc3Dgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_193902_566167_E8CA5905 
X-CRM114-Status: GOOD (  23.10  )
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

On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> > On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> >> In A6x family (which is a pretty big one), there are separate
> >> adreno_func definitions for each sub-generations. To streamline the
> >> identification of the correct struct for a gpu, move it to the
> >> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> > 
> > [...]
> > 
> > 
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index 44df6410bce1..9007a0e82a59 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> > 
> > Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
> 
> Could you point me to the holi's devicetree? Currently I see only a610
> (sm6115) and a702 (qcm2290) uses gmu_wrapper.

I don't think upstream was ported to SM4350. SM6375 should need the same
hook, but I don't know why Konrad didn't enable GPU on that platform.

> 
> In the driver, adreno_is_a619_holi() checks for both 619 rev id and the
> gmu_wrapper.
> 
> -Akhil
> 
> > instead
> > 
> > Konrad

-- 
With best wishes
Dmitry

