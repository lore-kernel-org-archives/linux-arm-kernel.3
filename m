Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037C0CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9P8C3EgLujC+SyMjcSHJMVnTiYYgF5ShDLErcRG4l8=; b=zjWgkuve4UCvM8f5BoANxEyKE6
	JR9pvNRztALxQV4wZktBpVkcUqje4+JKRIpkM+DiayfkByWf5WaoKxyZxXcCiXrkGLFgDAcKLmqfp
	fWVCSVs6DwSlLJF9I6UJsoAEnCY+4c551DKusqMVOWJScGwiqNqMQ4ajOx/trbKzsaS54eVc7/u6a
	8qE4nVopOmxkaUHPNcFMnk7Awgsi4e/1E8iwKQbua6i6kuBg5wanKZRao46mRYY2TRYrGhlMo6Rxq
	TryxLNOrYRpXT3uce8QifnnX51A/bTeykgDcQlVkXyPxDidOoZQeAEtbBWk4Ii3Vz+H9g0CKbCvZU
	mscIBzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UiP-00000004TwG-0CPN;
	Tue, 30 Sep 2025 07:24:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UiM-00000004Tvv-1EA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:23:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRuT030609
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9P8C3EgLujC+SyMjcSHJMVn
	TiYYgF5ShDLErcRG4l8=; b=hshRb6I+JHtIlOsVBCil9QBuCchiZ2SvX49aR691
	j4cL9/QnIkuDfSpqQfv3+WCgl/DPub0oI/kSe4TthzAOFULW+uiCdcogm52iRZQT
	ZJZMdP9SO4crLjRvGAKOwb8uPNXgd7fEbD0GWG/Dy4X0ITKMT83EHGCT01XV5xWt
	v0FyH5XcS92EFEQ2jA5VleBvCdiKss+wqWZsuoMPqfd+fXQEoo8AZI4ejb2ings/
	i83BZxxS1ABWC/x2xWYdwe5BqWPAxA5t6rGFisSQg6B9zYc/1EougHlhZ0oINwMM
	cpA1JPQ23+P2stdnT5+A/9rV6lpQ0hvJ45owHmpF6LB7Pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdftnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:23:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-828bd08624aso1095316385a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217036; x=1759821836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9P8C3EgLujC+SyMjcSHJMVnTiYYgF5ShDLErcRG4l8=;
        b=M6B/pcIqUFLxfzK9bgrhaVAvzA8nRTnN30kWjY/xP7KKzdBGTOtLoVFHMqz3lFDZi6
         B1EoWImN4/ap4m+Igj31tGNUjuCrZW/F0iEjtdPmp1n5B45glNIXLiAvTz5elarsMh5R
         g/7rK/Pp/2fCCBbonnpl5sbJm+KU7cEIx2hSY9WYLGUHxL2AQUBuPjsG/2ZrBMVvjBlc
         OkIm47nTd3jF6uymr8vmrJLnxAMevTLOmehL3Jgwzho+r9XgmG8gToXrBfafJDGMP+I7
         CxB3YzmZN8hEH7doEv4xZOi63y9L732paarq8i+brlpQtY13hDiIsZKwEzIxrsG2SLFM
         vZnA==
X-Forwarded-Encrypted: i=1; AJvYcCXPPtjLRiaQfNjlp2doPgSvFAvjmBGCrgVzExRLXPqj6se96Dmdyk1tBkggOsNvfStP+7d+bKUq7Ly836upf/YE@lists.infradead.org
X-Gm-Message-State: AOJu0YyCPKgMyNT3fMERNYwnPTUltWdR1tpX76hf4KimKS+AZX4JX6VG
	OuuabIzUnssZX+xD/czaZBRYk8SMuHSXjd1PI3PW0bRcLaq/QU1BTGsrRTAi0spPkHfa29EpO9q
	UvOii8Ey1oaPBmgWxsimHhNi8yhbGlGZNb9y5Alf4sLRquX3et1jBuXMW0OHEZat8BgT2JOp+aR
	DLLQ==
X-Gm-Gg: ASbGncsYCZIpUpXsR0XNnEmktVZ6f1DjuO7SlWRk0BOJiChZjUuNJn6nT7DR9eNkCSh
	H7bL2qM/jtwIatMNqeHzAeIvaOv7VM6ZYQR1BENm7Ux10+BXkeQlT1j1vxEJOGZUCdLDHMo9AML
	Venk8KHLag+zeByQ9Y6kN6Fz6L33w+UCrdWm1vpWT6Lhw4vQhIQgU7ssgNTTnAn0RJaqXJp5wsl
	NGTBiNFRuqTzaYfU/CXLr26eXJx0yso/CQzyz7YUfW6gT00sY8byGrmrzCH0ACDrbgoZ750MnMj
	Qs20fgbi4TkYEYn9fHA7DOHkj5XSlWbUlP1n7Beibo3Wkoz38xm0lCsa5tWtDU6DHlB/bhBzEvU
	oUsGfnl4qRQ8NL+vhjlH5c4zmEI0nlxRZaCzMhr4g4cn4fIS+/9rkU2Gz/A==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id af79cd13be357-85ae033ce46mr2294501685a.30.1759217036306;
        Tue, 30 Sep 2025 00:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtokqh05kg7AoFYMORm7EciWzypwxfanES3STHoDORc8Badi06y8IJ5mTLaRxU8ZjwP/+wMA==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id af79cd13be357-85ae033ce46mr2294499785a.30.1759217035829;
        Tue, 30 Sep 2025 00:23:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb771023esm31994681fa.41.2025.09.30.00.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:23:54 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:23:52 +0300
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
Message-ID: <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: tvsb1Lvyfvd1bjJQbXuTVEFmXuC3AxGu
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68db858d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xSz5tX2VPR3T1CvqFR4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tvsb1Lvyfvd1bjJQbXuTVEFmXuC3AxGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXzseFftMRAGhD
 pxSS2PlMsasnZpCjn7FIj7gv+lQbazfJsfVzscyzsWUNtggxC/UPqIzMs2I4j09KA/rzRylnuwU
 aHxZaWkK9ka6suREUMS6nBNu7xCFexKThvPcPXcJ6BjPVNym1HFcbvhd2XYK+scq+biPgkHL1GJ
 UkcQ1IlPdU1dIRGko1Z51YGhTKtW1urNhrhKoM0xpCUycNKedLfGCJsbAIOBprxpn4iWVUyn6ct
 BElcCZrGpkJQDhB+y/wr+av6xGjBRiKqWoHaoNhGqawIQoxx8M+hfkmMgErK/5D7JRmBZxu78w1
 NKiaoDRwgk1KTKzrt/u9czxaXyvkJnB3FiAVnmqmOZrJjFCaZCoMNzQ/1BRtuEwcvFfs63SGTLG
 C1j74ryx3xZSRhpUmEc751xhD8OEoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_002358_332858_C0F16366 
X-CRM114-Status: GOOD (  20.37  )
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

On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu

I understand the code, but I think I'd very much prefer to see it in the
catalog file (with the note on how to calculate it). Reading resources
for two different devices sounds too strange to be nice. This way you
can keep the offsets for a6xx / a7xx untouched and just add the non-zero
offset for a8xx.

> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>  3 files changed, 172 insertions(+), 140 deletions(-)

-- 
With best wishes
Dmitry

