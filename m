Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED7CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZILBarotSZWQdM56LLJz3+w/7JscPhGYyLjRbrYgdnY=; b=i0w1OYCHPCYcc0+hI3j8VKfZ4Q
	4S54kqBlLa5mmV3OBc2q+Ei9rJ+EIAAA+x1Ar+bpjy6MQ69n4L5UvAM23PLQfbFBYbpY5dV1vYGmc
	ygsmaXp28rbAqlRvIZXjZT+O7u8eXJx76567kGQoQCYPzcHzAh5gfs5OMt+ARov/xS/x48DTnJNxx
	uaVLnQouB50nJLtWRKWKzNenYReV/xRn2uhytM8dAvhVMviU+s8VCkSURhDK8iQ6+QMC2Elr4G+WE
	dbw+RxYtTspT7BOYvFVVPq6081zL4cA23WTYioW5/w6etpaHnEBlMnIiY4n/8ybQnmN3FjBTDiELN
	d6kIAR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UOZ-00000004QJe-2odL;
	Tue, 30 Sep 2025 07:03:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UO4-00000004QDF-3oj9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:03:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HWqM020359
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZILBarotSZWQdM56LLJz3+w/
	7JscPhGYyLjRbrYgdnY=; b=OOut8Vw5yYRY4OGq48yBkocOurdwvVdz2F1lCt6o
	k2gP3wjxwc5Aysiuye2xQK2pZM1ndn2A08UC2m1ielc6IQUggOShqqOGyiZXadlm
	vhpKm7dbSBDU+VPSb/YE0XhgUHTUEqZLq+3yacne2pSC//8fyBfWbXLFqhlG7/p+
	3BuJ7W3TU6nEUBTYIdkpFLp77cyYQwCxCvZnvHAQTNtd97eHYTD9YylFAH8sBFA8
	lje4KKku7gcJcPdVJwW/6MMd9qL14cPT+Q0IGW5rpts3lhEI4sz1qEwVj0bYYlKV
	RKee9WgC1CRvh3/JcmNlaoeiMIOrdP0vRyclmTH5YulaFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5r1ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:02:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df7cdf22cbso73255661cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759215779; x=1759820579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZILBarotSZWQdM56LLJz3+w/7JscPhGYyLjRbrYgdnY=;
        b=snSRWOPDkXxI7E9VZfK3JHnYwvKlz1iQFLguhK4VE+EImgkHA3KS7eTiBNaObi/MbH
         mceHkcTqZNVOxlnxkElvL1RyQWaAk9s9NeMIeHRJBHI8FEiiDyb2DiTZM+qHLYlYKHIe
         0y+PzM4eZSp+lnAy+BhiYRBuARCJb20S7dGOzgqE9u/g3Of5bBhdZQaZ++6BZ3njxpNn
         LLUx37xiWQL2z5dIG1De7ct/GPODzsW8ZuHUY1mbxEsTIb0JozFMCsYa87mxHy5prBU7
         YHVM9HfLTZMkxE/w1DGuW42x+gw/rKRuYtvdVjIXNm92WayRVtNhWLR17hS+7tKXsgZy
         xrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcKqFdW8mzTz712J4Rv91gzvodfPrszCPQD0HiXlw5uRYXrrJuGUGp3XZsbONVis8lVX+ZVyVzJaZXyvKbZwly@lists.infradead.org
X-Gm-Message-State: AOJu0YyT70vZqtDrAzLuF7hPzsoC7rP4hkxKae1g2uH9BqHnGoMzchBX
	QKci3T0KPo45N0p7r/AdFHtTLQeq9gxW163upGvPHzOZF//EqXDjwoIbOj9c7EaFkvXt0uRTApS
	PeCJ6g75kCi2SKOiDTLAHi36TKduPGzWIKS/NMi/dNc8jgbK005nfQwpG3Nst8zdMxGlrWVxGAy
	O3lw==
X-Gm-Gg: ASbGnct2F8t318gWZMUFPPf3jd3dzYKwOQJZEh52QkvIewb6/bvORblVJW86vxIuwXA
	DEdwv8gEkXcv3g69ke/mvaoUp+b63mm9e3GNBdzRzt7w93SD0/+iNDRVYHl9D3EH66FY/RsgL0o
	TS7V2syyZSFg6WNE6Euw6GvfArUYcr5W10U5YkzZZ3ehUBlXZUAhybUa9vKZXd+tYFkhCuTY934
	2iwpIpS73NypUT+T78BT9nK6bQEfBgMJTqZwvFIrRSsYfB4fBR/8BSyx8lndhSVfgk4v8aqjFol
	TIPnqJPWZL5t1uFaNX5mmoSLH+VgE1lywIMxW2Zek1GfY1J81ajHOudI4+hmP7EmzqSKR664naj
	Tyf75xtjxZZ0Qtd+PsQLllUv5CMF9KWj48yDVzIon/K98xEG/FBRzuV2acQ==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id d75a77b69052e-4e27d7c1b65mr43578251cf.7.1759215778753;
        Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA6lGjRTL6r8mC989qOKGIofS9wz03iYOMq+60qPx/pT9WrIKYNjXkEHiEux+C3IniYKpKBg==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id d75a77b69052e-4e27d7c1b65mr43577931cf.7.1759215778195;
        Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5839329881dsm4325236e87.87.2025.09.30.00.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:02:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:02:55 +0300
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
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
Message-ID: <yhcqj3beliary34msn6zbaig7j4krn32st37g4n3ey7oipswea@ckio3yjuwswo>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: iAEDxPCXULchh_SelHW9K2tlrmqRqZ_m
X-Proofpoint-ORIG-GUID: iAEDxPCXULchh_SelHW9K2tlrmqRqZ_m
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db80a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_QbXVIGTKPyQLETMuiAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX5YvZkW/fhSsw
 ikAL8VmRznHuyiZKWnnXOhZ1WMIg/ZsaUirbjefyc8eWAudlwAr8oQ28VVXKjTO0BqJX/JzUWoo
 u9VD+gcQeEhJ/6MsR/ku15n7ZZOSoDctXBOoLDN3kB9gwRyvpEDrk+K+X+tDCQlmCUFL48iLiRn
 bkOkVht0kQ/nZFgN0ROmtI57msmEv+eVPJophPBSxxGXoC0Pv0V5XWJ/KtL2xMA3fKKXxcx9Xwt
 Q6RjSPYvSh5KeuyELCMRWdUsDG/Ilqblv/F7sKnGY2OkbacGa0lknLD1Mqixkp+Bzf1Ve9Jec6R
 cN2bNJQAlriHjOIKM/HLMHWFgIRkFxVBeUca5OM1iLuimOXyB128v7E/yTqoGTv663QbWtyvyti
 gIGrQyO0wpgND0E1BzKvCDy+TswLmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_000301_111461_A3E090EB 
X-CRM114-Status: GOOD (  15.41  )
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

On Tue, Sep 30, 2025 at 11:18:06AM +0530, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  include/linux/soc/qcom/ubwc.h  |  1 +
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

