Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B757FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03rptgprQ5ZgED7iO7IjtRFgpfYYqtbYZq3I8MdIhm8=; b=JiGRhOeJwPBtgONUxngO/xOo+t
	bMyeLsNUZiV8nMgmVJjzOmyOMLXy8D2pqQUqXLy6JuonLEwI/1DylUlAmAu3tigmq//+vdA/gvfgm
	d5mZXoesF5NDVW9bBjveEXlY5V1bES7LJ2U7HOsjbxHQXTZBjXIT9r/5W+0UxPxgDfQC2VlwyZ8Ih
	mLyNqq3njWHV3EHTQjn3Uasj84Dlz/zCGtS5Pxui9cBHnFyZzx50uKYSKNagRDo+nZq0GkOZoM4lm
	/U/P3TkRSIhgLCd7ll/pgXcpy9dDrKTsM8G+UrIbOgPZ2aXlWX7bytWdrzmrpRh/aT5vTWhRrS1/a
	DFQhRdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuhZ-0000000Fv0I-452o;
	Wed, 03 Jun 2026 23:08:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuhW-0000000Fuzp-3sQA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 23:08:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Gje7G2262005
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 23:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=03rptgprQ5ZgED7iO7IjtRFg
	pfYYqtbYZq3I8MdIhm8=; b=OHI8CmfynVWzzqxqL+5SSZMLwT0jlY38Fwr9GT35
	BuJqId4zl17zWmew6vwc4rVG6ZbUo8rMNlmNMOUsyNrpqC6DsV3q8b/6SaF1r5jF
	R3AImzs30KGY9dkdDnY3XNjsFlL2nxy98N+BIb2vOtRNC4YBzUj5CP3EVtHAul6/
	8RPh0EiC8DriiySDx/E6l7nuWB/z+ot4+jNJxXKzYhgODIX8ULfs4XsVKDjS+vb+
	rgQ+YOcOMeWd3/GS6+JZgWDuZp+bj0nyVYl+/mpnmhmUhXk4KCOAI0ngOVoUCbsa
	qMr5DIo+w+En1jPiAQ5ZO01Sg3YsqPIQ+8pWZpguO1mvbQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mhdn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 23:08:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963bc9a24f0so109263241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 16:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528121; x=1781132921; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03rptgprQ5ZgED7iO7IjtRFgpfYYqtbYZq3I8MdIhm8=;
        b=cUKSwFx7/LO23/UL5cryzrbLXQ0cRNcCLRJS5nlpeXeIdzRFuY869FYUNeCwIga0ce
         ViJAnt7+k2i0kHbC6Oo4w52OZrhjs5oJ2SckAI6XIE7XHLQr0hBwnaKYVl7qVk5Lhx05
         Ah/EgmAtcZSJSWu39HC6AmxIM3kyfk3/vMnTb1EFXpucJa1V+IxiImAb9GWWadF0qW6C
         Pcd7VvODuKylTSBzAy8a53lbESyRzRr0s1ymalJNIszh8KA4+2c2OHv81oO+GYgC9uDI
         oPC3aA3nwk3m1ac5SspJLRuc7szSJ2syPmbpRJBGV3ruH1U0zY0sBClSTlacvUbExwMe
         dpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528121; x=1781132921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03rptgprQ5ZgED7iO7IjtRFgpfYYqtbYZq3I8MdIhm8=;
        b=B5+Xa+QY39X9Ud+cgE+AdhoTEcRhW4H0ivckY0IHWS62ORv/mzP9Pa9ZlGKchct5cW
         OnPPOuqW4/HWpqG+vStTGMPd78WVCqpE5u3TAXoeQLMvBtmukp3XSCUhrz+3ot6DCrTt
         8GgcE5F9fk1Yy40xrS0TAIpWC7O/0ISWrDoAfMUv9/8oRoF61MGCN6x/dkva7b0G9tw9
         ACBIto6R5YbfGCNZRAZwY8sF1/mTU1CD9484BK1ThlVsMzwbHhxkbStnbLCRs2hV1Qp/
         QnsbML8eLrOHZfwVyYaEjrdAHUUcM/NkE/aRPVNiXDzmbQQDO1nGTfoTbcT0R7FyhRkN
         oFYA==
X-Forwarded-Encrypted: i=1; AFNElJ+ACxirgEtlMQCmxLmGVjVm3Au81DHMPd5dNNigAAkUcd4AvSNa1f+qs1+N3S/4J+Cwxf5toJmsfinysE8QLIvK@lists.infradead.org
X-Gm-Message-State: AOJu0YySK8X6+9HsWkba2yHtWPAHRI8fz0QXxpciR0KUwJyV9kEpw9z8
	Ln3Ve8WFfBakIN+CiklkFXdY5PO3S47qzFclnh4TwQmohnDKigfHAurcdK95UAwUq2A+WS3G2Ji
	XSL7Nuk7fhB6g5kypieLeSMrdgqmorqqclobYomgt7zgB6H7ThsPyHHa1+NGTzrMHRw3li6qNVa
	9mrg==
X-Gm-Gg: Acq92OHqGHPBVmxR8e4TlLxaiaEApqHpBe0Vp0OOFSUVcCuHtCLuUTGFPD3de9q4DCH
	Kh7zwCf32PdV5DHiuTVTGmLTFkjvrcq71QuS45Z24+pilfDRi5wj3zOjIQnh9ZcZYRbzE2VpW5t
	GxqXpZvDo+NcdmbQOu9iV9e4GR7pLcFlUNMoo7myDE9YBlhKlXtkJku7ies7DBfJ/Q7vDY+5RJy
	s9QaURzxf0OAGsW5Czel0UeN9GhjTl7TKYnMKSGsnZVhFK1DEEIN2gdlrtfVqoKrHXCsoUD7bPx
	Be9SNFFtjwpaK/aaBdRHSidVgzJ/92rUQk5gUr2FW2dyLDLx44WvlNpYnO47oD0Fw1bBo6RXkVr
	372aDGCv/5kSSr4hWw44DWB2iY9IyDGqxH4geb/WTrvrQNU8gOnZtXUZCXgo6YYY2aDe4pqHQ2W
	GUnd91frfhFsI0ga8nhN6KnPoGt9I38AuOjLiYHIx3TfJRpw==
X-Received: by 2002:a05:6102:6f0d:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6f03c5be1bdmr2261984137.17.1780528120891;
        Wed, 03 Jun 2026 16:08:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6f0d:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6f03c5be1bdmr2261971137.17.1780528120532;
        Wed, 03 Jun 2026 16:08:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07e243sm12553661fa.12.2026.06.03.16.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:08:39 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:08:37 +0300
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
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Message-ID: <4lozntipmx246uojyh5qso5kdplzyun4jzr6a6qdck7hfwoygh@tupqmauuswvg>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-GUID: FuYLt0R9MEo9sTacfufXIGuWI_81Z7kL
X-Proofpoint-ORIG-GUID: FuYLt0R9MEo9sTacfufXIGuWI_81Z7kL
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a20b3f9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=irWgbQPqOsrm4l6MN8AA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX45KgRUYWbvq/
 YeLLucGx1ilSLFlsvB6GLIreu5fmVQnXbThKJ86t9zTHKoGsYmnGopJi2HBHC5dhzgEQxykAjvF
 0jASH72LJLD+vrcL6rv5rdcFXK5p5KKN+GhqdrYtNLnszTJ3uhxhF/Vqgw5VqvrtlS+sBRQ+E5D
 8M7AG5Kw18hPjAgyb9C08KjIh+y3fo2odH4MotvSefP6FM6iiIIw38tx2BjpS5KQJSO9mB68zLv
 02lqKAI6FlSfDPCfdfxSOYnrL1q4sZfR5lFdQeYqgZalyTGrI9s+3FU0tn+ghjdv22Vop11njdz
 3zIc0erRBTUERJS+9Bwmntp4AEFIzGvh5fekAJ8wNZUnOZjXA/P0S5lmZBEgWgNBG5ipz0DIuww
 tOSJSxj4EUFrbUzxKiMFPi/bSLtt7wZUG57+NtEEdJgz7J6dwGcrmuMONO7Tn77LDuD7TJFTEOw
 TpX5b8075ZeZEoOoGnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_160842_969209_B3C77739 
X-CRM114-Status: GOOD (  17.22  )
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

On Wed, Jun 03, 2026 at 08:29:26PM +0530, Nabige Aala wrote:
> Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
> sharing the same register layout, DSI controller and 14nm DSI PHY.
> Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
> rather than introducing a separate binding file.

Why are you introducing the sole compat string instead of using Agatti
one as a fallback?

> 
> Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
> qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
> to accept both SoC-specific DPU and DSI controller compatibles.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  4 ++-
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 34 +++++++++++++++++-----
>  3 files changed, 31 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

