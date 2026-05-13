Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3EFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQDKVHkpUsfpWP0216KpWZo/ckkZQvWAnsqZGCHLh74=; b=eWmcud631pvsSlxO7GLyYDz1Pi
	KDfiSwS67iHiEkf6oJeKkkOpP6b0gT4KFWbrrszxaMFH2xAFZ/g822q7rkYXjnR/zQwf+oOb0kR3z
	d122CNuCfia5j2fHq8tlma7z4Xh0sD85bMDyxsJju3SoGNFcDGr7F4+mGMtGPLfNrF6Pr9vCEHgSQ
	Gv/xrMOiuvCf/VBpIG5XO0k6wh3RbPVp4HykYiL3U84/CymOBizM12S6Ka8S/Xow/bckJm4yVYxl7
	FyxhDJmbYS45bM86ZssdAkfrh//n7cezxg9unmaKr+rCyI4zyy2BKMnXhDsvgkxfB/561OKlXl5AC
	xbJ5emNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCor-00000003Gbo-3x8A;
	Wed, 13 May 2026 16:52:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCoo-00000003Gap-3BRI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:52:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAeYVC1393072
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PQDKVHkpUsfpWP0216KpWZo/
	ckkZQvWAnsqZGCHLh74=; b=Ub9SG6+JgDbR98bvDLUhCV9iBCiaZ2TMHpDiSraS
	Kxee6/wCy2LOyFoS5fSuP/f6AN4+VlmVakSq+jruUriTHDoh8SSpyCvy+CwFiXpx
	kPO1H5Nl1vrZ22MN5zAsz3+ke1ipSWJSxSxmEzxK3didYf/fpqFQmF5Af5Vl/z2k
	i23RfLj2pmfIJnh9C8TS70J/VzJsi6ncVhIKLPjfyjVDmhe3okXnA5EEv3DXAHfZ
	i1J3q8RIFywnRTVNiLLvs108RhgG8wuOJ2IzBrhA26nc29JtS4G6OfteEprEiUz8
	hYGXeEKA7Rgqm7bkFCuiuZi8I8dieqvYDx/HrzTFRimuOg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262q6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:52:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so2678899137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691141; x=1779295941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PQDKVHkpUsfpWP0216KpWZo/ckkZQvWAnsqZGCHLh74=;
        b=Hvj7NHHoKNIFpzT+EXgN3MgSXJ9UQWX1nlJIxPy/iso2DaNK8LFKrvZYfCB+hJ3XPI
         ig/qDrJgDkE5Tv6mXelAOv4gejoFX0R68g3qlHppn6ZPnGGeSK2uyzCC7SEJTMcDEQRE
         wT1fqc/DzX5ZKPJ4Co/vxT6hQlwBMAB8snGpTBIg7i7a86pptvOUl+oqfsCDbHU+Tifk
         U+7Vs4PX2ouJgylY001rFBm3pFde0r/jRj3/uvEvYZoSMOdwQ25fyKUzofLYPvqNrrGd
         u8w7aLTZoONS9Z49AQ75CN1i2SLH5rMXVAIX2NWQc6KDouYQgZpAyu0rzARCIIHMcBEU
         QBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691141; x=1779295941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQDKVHkpUsfpWP0216KpWZo/ckkZQvWAnsqZGCHLh74=;
        b=FKwK6pz9WBfCNjdHmHQ1tVgecKAQQtMGghihC3JtdoviEvfk/+lMbxfYB1F690XIOa
         UUFPPzj1BXjdz+5J8wq1REcL115X1YPIQL4wzQZEub+G/sLhflo1pDUVFQsqxOyq50Pw
         I/neOVmCRKcYgMLa8pNj53t8wILD8kaRJ6yekPV7zq7iZKUxVkYfL53ocjuxszNSGEHH
         kToboF+RwDB0+DqY4lg8RYS27D9p3LgJvszB7P+JUG/avxmAO0+vmOlT1r5mTf05uW2E
         iDfvdqfemAOp5yO8cflPtUBJEbWfvauA+EZcqZNp88HT/BaDUTCRVKlxZreIR0tThwAG
         m5fA==
X-Forwarded-Encrypted: i=1; AFNElJ+tBnYTlbHWxq19LLiQa3mSsM9ueJYWdDqs09pev7J3MJuQdOZgaKLvJJgQXoX3YKXMjEHd2jYSwoRtGV9Uf4cK@lists.infradead.org
X-Gm-Message-State: AOJu0YyDY08TVzAhy5m8SgI0ul6ybdUx8lHjDrLYfSXjzz5DrZx2xRwc
	FEYtXuP1vZw3f8ciQKXQM6PbwlJmxn/HkHFjTMHRHFPKDjAzClL4Y1IvfeuO/wkOODtZiooBH1b
	8ATEfdSb1MTuRqtizH3minar10Fz1cOCMk8zZ0Yy74Bv/RIGUFASJCHJ4jk0KEFuGLjOqcTRnzD
	akVw==
X-Gm-Gg: Acq92OFiPIId5JP3+0QRtueRs6VvuNYn9O/7EbNSjeudO/T3anmCueiNibYQM+pL0jw
	qS2J0P6NyyYDgMf2XL9DoUSxJoX1x6fySMeLu7FKtUUG9CafKGG3yxD0gyqkqfqcfgx5/iDpMMX
	B2ORG4OsqP0I4bNwuKbogn22QxHj9XKeeJLd6QjdMXFCBUAJppHmX1F2j5uwZHMgxhkf+3SdY4R
	nlgX6cpS/gRHR4urscijSv4LIyAtjnv0kCyfrJnJgjWAgO1n8yWY8x9pZ1B5qI98jUsvqk0BO/l
	Knc0SQPNe3dlBvMz6NPzIf/j0KzI48e/s3dFWxhAMRv9Evh2J8/XF+XTObNCvzfqhUsvCY+iSTd
	mbDvgsWsB9CqWfWta9Ej9zg9/GmOuBPJmlMuqHGo/dCSN3HE4ELLp73vtswcrq/yhG51IzWF2Ym
	KJ+hSBUue/4g/XVMmIY6kbNoVgVyVV81+sIic=
X-Received: by 2002:a05:6102:a51:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-6377239d243mr2364677137.3.1778691140963;
        Wed, 13 May 2026 09:52:20 -0700 (PDT)
X-Received: by 2002:a05:6102:a51:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-6377239d243mr2364665137.3.1778691140453;
        Wed, 13 May 2026 09:52:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b3d0sm4096876e87.80.2026.05.13.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:52:19 -0700 (PDT)
Date: Wed, 13 May 2026 19:52:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
Message-ID: <smuahoo5kk23pmy6hl3ydnha4aak3xyalrkg4vydixoq4zrro4@rpb2c2oy7lko>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04ac46 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MCBTYWx0ZWRfXyCLjJzRHL1q7
 2vvDb15lrr1eHDrff42chz+NihG16b6iI3T3G7z8Y/cVgR8Il86BXdOwZ155cG2X04wDHfyhChT
 twf71qEUuVYHQ8kJmOWIAZzKwSo24XFyvFRRzEbDKlFN8TTMF0jL6VWpQYY2hpTE1i8S5vVMJmK
 fsTIIIzc06cmrVXCBE2GWbulB4qoETw84GkZ0x0KRSfMvwl5244K4ie+PRcGiFOXxXmdEZxzqpu
 IscX8GVDNI3L+ChoiZL4iXfqEdU8duhtngw4EtdpPhvw3XWyI/JtJu4eZYSrHMRLwvkY6+WMg5H
 CBXvnoVOXOu9HRvBOtfHeiKRANOlrW4UBc+R/tovjIJe89JvBqfKqKCMTtLZh+sO43WWH4yMwHl
 Rmjn1ioqvhLE6W/hf8olRtaZKIl6+Z7SdmK+l/NrSEoj0rVU1RWWM2wgU2wQEm1lyI4EFnTmwtu
 M7yNTBfJ+hKHpUzYTLA==
X-Proofpoint-ORIG-GUID: xS81O-bl_cyweaFoeM8Q04t6Sm89OfyH
X-Proofpoint-GUID: xS81O-bl_cyweaFoeM8Q04t6Sm89OfyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_095223_346308_E16B94D9 
X-CRM114-Status: GOOD (  14.08  )
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

On Tue, May 12, 2026 at 03:53:18AM +0530, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the qfprom node and gpu related subnodes on Kaanapali SoC.

QFPROM, GPU

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

