Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5747CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWG8L06mAn41deSqSo+E7yGhW76hJZ2Ee3eCES/ASh8=; b=3gGhtFAb9f7d6dw13YhyU7zucV
	S7T8ZsFB9tjvjCfzyZwdKZeGGshd3QlAACt5RyOrJIcUxAGYDJV1sttL8WDuYcbzioK+IDBd9VHvj
	luilJEyzcgssEKAK5+jXbAh6muxreSVfKVpsNc3Afvvo5pKA2KxWdvYHCUWRJSudtg9cwnE1f+TBa
	2Ph4+0vunMztBHQTOEJn6sTfiZ8SyL3b3QeMQzYci4HzK/VLtseqTX4lpOAKnKM/tQWN2tmNg87Rb
	CvQdEqzC7tZghJCSBJg54vFV7fCzm8cFlSWct9HLwO9FogpY6diGVxZ+VeeG8lICoqTEwvaxAn3CB
	m31TFVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWz-00000004SUB-2Gr8;
	Tue, 30 Sep 2025 07:12:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWx-00000004SSk-0uml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:12:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HsIG001263
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aWG8L06mAn41deSqSo+E7yGh
	W76hJZ2Ee3eCES/ASh8=; b=P7dtSxAAUpSrQS6/yJuuLSp9MXXBagIUU63eyHxY
	BDwxk8Zq5coSRul7FNXnLHiLMlgrRF3CYd1VrL4+wNCDypEi/OI2uwEfhZ42EiSQ
	fnxkqeKaizh+eDLrDjUsTOL8AZKDr6+Ru1y51TA1po9l7aFEYSbankaBqDWfQvB1
	JmeKlDi8jRn3DqHsZskcXlsU71+gGEpveKvPm0BAabH7PDBJUlPkY+ZleUDW1Mo0
	rJbDnfYg9J8TEAfglTsrAHOfS8y4UesFIVUbs9qkL4hP6R8in+u0bx6sWLcDpr2B
	llQibxDyLKuXD4//T2Mz+W+CjMxnHXIugB6CVEaj5Rzw2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr3g5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:12:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85a0492b5feso1716725685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216329; x=1759821129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWG8L06mAn41deSqSo+E7yGhW76hJZ2Ee3eCES/ASh8=;
        b=YjJFs0MsOxXOHbGtjoaGnp/NHpBDbMuP72uca/nTkPbR58s1vzdFu1+vQKwS1lLKpm
         mXfuhHYynGkBL6vWZxNenWTmDTxkq81uK0Sm0F96AGbzmhoX3rvRrkQvkNLoOeC98cgJ
         pofuy7sVgwcj00MIHSF6mK3+P85//ZG9rtCZbHHJH6KFSdSYXdvMglJdXj3/TH00WlKu
         YnIBVkgPqPY7udkuQqaHvfh47Og2X3MBOiZHi/aXwaVocoatpzSzNhQPVaMSmVlABo3C
         JUWCgnNXuTLDVFzwb4zkBIRp4pKLT1I5h+3KcykUJNGFjEKUQvnB7YPl36gVx+tGch8k
         lDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Eop9tj72p2tqoFl6x68Z/3hgFRkR2czy07Ksnaf9dZq/hCCOg6EEsdstGNj/317G3Rajrm5pa7sAdug2Am0t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4IEQjgPPfSte3SXGXp5Mm4kDNb1wflVPXlPUk2TOYwHJA+M1j
	0U2UsIv6KOIKUDK0JFQ3WW84eU0J1pKFsqkcVfxovoXsx1PNkss3LKdraJaKN19d9jVNNHELVLp
	hKxQRTEQjyA3/p19PS9KS5ux5vrZ2FRjjTFuhke0N9Ap7ot2A2Y67jxkMVzehBvnMyFresUPEI2
	IjZA==
X-Gm-Gg: ASbGnctNFB3rhBaOOmK/VvJws1Oiqjfv1xOlDwFUHu5oQa8bAGmECyF5W1TPgnVJRpc
	aYlh2wM2KlT60+m4r+ZZwMGwsHeFqbbMcgMCWtkASPHEkSP9fK2PR+bf6ha4Pkj4dAopTCJZq0q
	GQWTuyiFPLyj8w2zT0yRCWYV0+cvs8ghyE3VxGTzW8dev0CjETxkG/+7F5I6OesvFEcUZTTEWWh
	GR3ECrxjxul7HY1zxqg6NeTvTIEtcYcCNYFuOemIHj6zX5taC7eFc/GWiuz/RFHIl7a70KXmsjo
	35HGJcEVexSuNpwJ3xcbAEz13vJs/nGC57EJBbqI8GS06N1yI55w4JaXatVnOjFpXiPy9ikli0q
	hwq6W4YPbD911qDAZcxltI5e+ufAwoOkfFAs/PiGMI4ZPcOOuCcOzp+jIfw==
X-Received: by 2002:a05:620a:450a:b0:864:48eb:356 with SMTP id af79cd13be357-86448eb076cmr1401387485a.25.1759216329496;
        Tue, 30 Sep 2025 00:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl9dt1djyaC7zQdYtSaRmLXdGdPGvu1aHOByc+II7EPG2uXYQd9OC3qlxjl8GonAKh2YHTJg==
X-Received: by 2002:a05:620a:450a:b0:864:48eb:356 with SMTP id af79cd13be357-86448eb076cmr1401383185a.25.1759216329045;
        Tue, 30 Sep 2025 00:12:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e39f3csm31049191fa.23.2025.09.30.00.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:12:08 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:12:06 +0300
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
Subject: Re: [PATCH 08/17] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
Message-ID: <srutubksxfjwb6hd3x6oqduyapzo7qh5rjqgvdt36jzqxdegig@o3ukylxtgiy6>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-8-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-8-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX6kKu2Ht8al27
 CqL5hCqftOVYGk8ftUy9VfzzcEhWklQT83sY9QLLXwlCa9DSZgOjpXUseBACU8IrElf9MXk5K9q
 pss67AR3k450lcDk3llSZ+RGMta4mHyFJw/bVlOjCngBix0To+HqeBm+5yk6Ltt+dDYYxxay0MW
 He9QXuTQJuNfe+jiFZwKOR0Ec/bpzjueUqHXn2/cwOh+vxuRjRAr1HuSlY1Ge3JhiLZfIdD//gd
 jSk2vnZsVdxI3MusJKxRxtZUCD69ULEup27HH4KlrKHy5xlxovohrCzxFNs9Oe/PFReCuktqH4/
 OYy00DYCMSFrk8zcu/NvlsModRkS/KtIIRYgn0Fw+B38T2qmVdWEoEieCEVfV9p0LAAAEDPGSfD
 yGPgsJyFePirEwd/YafeaAOEHWpfmA==
X-Proofpoint-ORIG-GUID: pveI6I67YJpSlnoHq0k04Ja3-Tg9K3SC
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68db82ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=scbeE0iXsUk0x8BJeo8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: pveI6I67YJpSlnoHq0k04Ja3-Tg9K3SC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_001211_372948_CDAC2CF4 
X-CRM114-Status: GOOD (  16.78  )
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

On Tue, Sep 30, 2025 at 11:18:13AM +0530, Akhil P Oommen wrote:
> Move MMU fault handler for each generation to adreno function list. This
> will help to use common code for mmu pagefault handler registration between
> a6x/a7x and a8x layer.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

