Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D874CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kji2nmZ2FEr3Raw9eE5h6cYwgKVR2CawlGpJNJ1zd3g=; b=4zonljEayqDerKckYR6NgdhqSa
	NrXFWZESrz1a8hXYCh6160I+2vaplbOaVkTTcqYHjpdMurQqZZiFPs0LoS5xsvaB54X2wuDzNn03u
	BI+v3Q3mj6qYZtOmtwKzSFIHI1kTza6dQIUU8kGMXLNssYyIBeFSaQu2JZoMclnV9lM+o6GE3pmu9
	AJ0gmvpA7jNJ4RT62Wf8NMTv+EnQMTIyMK3FwUGfeFCOwE0k6G2iSPXHGlLkM/xs17JswFnZL57zU
	JhE8zDZGnwgIiddgr2OU5mdfsBmjbPscRs2quSMiXFpnsycOe7IoKJNhzzwmP4ARi0x5FCTY//Nqo
	GHHtNhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V3j-00000004XAR-3bxU;
	Tue, 30 Sep 2025 07:46:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V3g-00000004X98-3SMZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:46:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HPGD017557
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kji2nmZ2FEr3Raw9eE5h6cYw
	gKVR2CawlGpJNJ1zd3g=; b=Vw/XAKGE1YO/T9KY5F5Hr22nkn+F1e2vVFdW0Yk5
	HucrueTDHPW8bQKdDS7ZSJUH3pMjsUmxgjV5CwqWy22p0FkJGOSH8eDfhqa99wnu
	5vEcvfNhuri2ynbFqymBxNt7EZXstZtoGedJRH6A5Pyrm4eC0yqYDV27uLk/EqRt
	o/cXfEAV0/hfQyepZ4CuB64ceNJN5tA5Gx22Wf7at+joGv3XvywLEfUK/d6N5dI6
	tO/IDDnLwKdrQ6WtRWBlhPalt9dKwRC6wSlNQ5DSkDFSkfVTKugIaHAwexVG3Q4X
	HiJbykLLeuMB/0zcLomnZoSPDz6RSPpIlh7S9P4PFf8sqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tr6hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:45:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de5fe839aeso97753281cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218359; x=1759823159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kji2nmZ2FEr3Raw9eE5h6cYwgKVR2CawlGpJNJ1zd3g=;
        b=efV8ygmx7DpLe8xAhabaNhqsaVoRrHouX0aYfz+iFJB8cwH3TOJmED5H+ptlpiF+zp
         gF3/w8R5wAao0M9HI3KSin1CQpa37KS/vpwX2QkqUnIK6rWBgNGOwGK3yc5FElnXP+Xw
         lVBen58/aYQl9mgg1ecCu1Cvmy95/km9bHbrBXxU2Np+call9vFYCKqPAVE9pPq+/7zY
         P23xBW/GO6+sdI0Swehu87ncL7B39z1J44aWxPWoFIRfKO8BDjJ0uS2L4iIXhDBeOzBg
         tWL6ewMesUp4dUMRUlqGYzp9icN9wMTgrCjhTfIA0mV2PijtBpSptsSafc0Yn1F19eNt
         pZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWDgKzXmBb7x1V45oPiyOyOCLsw5isEF6ymTzoOCqT6iotnjgHRLTBWZ0L4V5N47YNfMjyinDQfKb5RBI/eSvkF@lists.infradead.org
X-Gm-Message-State: AOJu0YwPw1A2hI1D8b5+AF813B32TXjuwz22ZjWrgM8qK7QMibI/e7Gw
	pmU3Ut/tHslMPBIneL8v9O1Qc10cZUfb0+5uyNJfEnpb8Pf4e1Tuf6sV9qEgceWSueR50UYymfq
	YuLzn3jWoQoe3xwRslz8mz15ZkRp8vxw68fx07fWgWMXBd6VVCJktRADfXGqTyzp/OJDrb6FU7l
	j8WA==
X-Gm-Gg: ASbGncsNldiVoiGhh0tmOviA6nXjSv+Ub1p5ZKb42KApxwfdFz7ZP6PVkCPgvK4JRQw
	sgaNIj0ViagFQVguOH2aI4onD4noXZPU7SvKt6ys6QxtytO6j8yH9oiYsj2t4mHqr5nQ8YT9RNf
	zwf8f5kcBdfkmf+1JyzKUmel0IHyMtulHN7bASbpPg2IwPR+lr57ExY+2XpZo5qaOZQx+LX5vmp
	BBVNsMUhJ0OyYfMudSgbznRueHIrFHCw9D38T8WJnjv/NMMpMN5U7T6icHI30O8buK8IAoWAlAe
	ChQTApP1Ux1yWZu8SBUDC7R4g6j/YnMbZxShJapnQ6UqYgijoo5ZogUJL6zbm9yinyM6R2V+V9o
	Gx++HMdtiuYqDdhWCoJJpcvg9FccZ7V97lLec6fM6rIfb1RWfOlF3FPoK6w==
X-Received: by 2002:a05:622a:408f:b0:4df:9e59:9d79 with SMTP id d75a77b69052e-4e2661da9f5mr51016361cf.35.1759218358988;
        Tue, 30 Sep 2025 00:45:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECErpsVHn/gl20DmHz+69GFvY5gifpdT4tSpKn1PuYqRHRES76ncOLU7Pd8idEKbvO7WTlFQ==
X-Received: by 2002:a05:622a:408f:b0:4df:9e59:9d79 with SMTP id d75a77b69052e-4e2661da9f5mr51015931cf.35.1759218358442;
        Tue, 30 Sep 2025 00:45:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37289559058sm17247361fa.2.2025.09.30.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:45:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:45:56 +0300
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
Subject: Re: [PATCH 14/17] drm/msm/a8xx: Add support for Adreno 840 GPU
Message-ID: <r2spx7vu4sg4ydk2pvhe5gq6wxaiahmec3f5dpijvw5mseldmb@755zm7c2nv4z>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-14-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-14-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX0l/7BnglWeH3
 U7kCi74AInCjCVyrJV05yIil1up5PIcNHh1CNTVk+Yjhh3hbl/RJ6Q13KBew4fB0VCqtLc8QkEX
 Fq8jLJbXVeDdUaP9hd+mMdzje1eE4+nLQOpjU1pQSxHeLupPfSefQu35LHaIS+b9loyY9I+IoNP
 6jCR/6VxZbSxyE9HSG0Sda7h2BtdoqX5lFeqr8G5Ug0DW7eRmveDhg5oYcNn8oNWrDaH3dALNNr
 f18mLtdH8NnTWWyAHJyUrxEB+5MZqolAR4/ENp0NVmZlbNgDwBaCUUsjfsAt6EtZLaCSlBNJjfK
 OjCPkUcJFWptfcOi1g9jL8AVO+MgjruTIZwyxZc80zIg18dz2Krz5QhZy9qWVuV00uuXhhJSmSH
 2f81zN9uVwR5m9jtkcg2K4pF0pmeEA==
X-Proofpoint-GUID: 5aXQq1v9gNIWhr40oftM_H33WABmEPi6
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db8ab7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=90rIqVWp54D9reHQgRkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5aXQq1v9gNIWhr40oftM_H33WABmEPi6
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
X-CRM114-CacheID: sfid-20250930_004600_981677_2147033D 
X-CRM114-Status: GOOD (  19.32  )
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

On Tue, Sep 30, 2025 at 11:18:19AM +0530, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
> in addition to the SKUs supported based on the GPU FMAX.
> 
> Add the necessary register configurations to the catalog and enable
> support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 211 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |   8 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   5 +
>  4 files changed, 225 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

