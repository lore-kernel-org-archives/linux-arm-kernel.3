Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8634CD6E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=; b=pSIwd25GzjgHsTVdWTDnbB3+xE
	5t1JF2EYGB77YqbvGHfEhJLpEy4iz37xqwYtkRrjVG2cZaNUa7jKu53JR3E2W3Mi13SMza4ebrTUA
	tR4jeFxZzvDf7X0m1zw2gvQfiqxHx/Q3xvD6TLJErPfvCrQKlJfpZas20KTpKwvf7m1GoFtKpnfln
	oqvmYeNlzV4o8Tm9sMRa+gVeRxSBYB/J4J3H+Dqq9Vr9NEnLMZBOnWMfCrI0V8DtlsY5WFvNgP58z
	M5ecZ0vgpIhsQcpXsMA+eDxwJ1sV5xOKD8AGpfEYzfvCWwBjQ0mm8qCEnJLS6LFIyJd/fYo/LmHn+
	hzyReiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLx-0000000ARz0-3f4M;
	Thu, 13 Nov 2025 12:23:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLt-0000000ARqr-17TH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 12:23:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD65gQi3563292
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 12:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+GplvHX5yxJ933q0AmGSwv5z
	wUzQHMR7HZka/BgtTp8=; b=EjxO0CH97Q5YXz86h/exEubfja23O0cpfbonUSFO
	/EcgGBaDegu0X6DGJ0COHg4/Cv9Whk1CLhs50au+g/U68OYvdjxcYC7LRDJ10C7Y
	f/4gtfgZN7C92XuqmFmkUcBwU9m2tAFrbdOOV1rXoz4mAE44i7oGgN6ulNcyb7Mt
	q66lH2BpsdMtxD7wn1BvJKKjaKHlpW9IlRPOV/mfcG9X6d6ayeZNAUG/ZyFFnqiP
	UdsICNQuFKz/CIksK0/8U4hHosXzUZxZKMw3QchC3x+3QITrrMf08zLIsSgcQCtU
	MNNLvmSf631noRe0hvxaCyRjP+8cXcDnfCQpru0hatbOCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvh3ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 12:23:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so22708451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763036579; x=1763641379; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
        b=KX/MTMjkRlmfQnoQehP81tZz1y7CI2g0rF0UWaYvwAMQ7+NccdzJKzWW0A2oYnGDFE
         LSfpolgUijd2WkRcqlKirVDfya9LheIdzxy2/1kbXYCPRPcfRIQRpidKIxcGLIIbLe+C
         yWvp1kowsZNFLuEe9hEqdoTp1qQgqAn68VJvSxN17nLwDhQrDpG8B27PJehF1y5y+t2z
         R65N+HuOa7V+JTPwXno8ZbfRvAedyWn5xeMFEhdKwHde9pZOo1WJtpLT/FyLvDQ+Oz+M
         NDTm4Ke8n/AAAgDEEgdG3Nz9iR8z0dhPc62De7g5lubiyXu2sihcllyUiYIYJWyGwUyS
         zhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036579; x=1763641379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
        b=IwsaBcx5hVCh1N/ATNaWUH3I1ZfGMEwVGUQXD15mrI1g82zYWyy8ktCrY9SGiEBy4K
         0jIGJBtt5lZNGPmEs3PfEkr3iJ11v0lXK9/6Pi8KWdhHWvVDFWU+zDbK3dGzXpfcLLSo
         zAmb/fwoj27NHq/m8dU6vE1GsESGaUi/IDUEl96ANgxGU9nvCnZoBrw+qkFuQd2fLBRo
         SluX9u552WasZbWZfnnOdKWoDIoZMOq8QaAosRVfKZ8svllO3ye+sh82fvtVZJG9B09X
         Jt+ly+HE/TOP1biBrC0uw7ZtY0yHIsfuE1AFxe0R4upqIy2AdUJx7PwMlNgZY6tNksDr
         PS5g==
X-Forwarded-Encrypted: i=1; AJvYcCXsXWz4uvv43s2G+Urgwt66wxa/VXF63KsGRjXURWQ1/pGgtBbCqq77M6+YxYIj/malnDFuovnaP6xVRsERptNI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+1hrwtTv2Viy3Cw7C8x2rsUJh/En1VkvMZ0MDP2ALmk/izV23
	TUrv7FrzGIehy4mmErCqR75SR/lCko+tEl/JPJeB/Zyc9R7sNDJsY8R339s47YILl+sapUWA55H
	udV/0vB3VfntPEiTRUHYnOoEujuT2qoGGiOUUFrp9FKRWE0nG3ruIE29DUjsWcofTVdSDwcSkSC
	cSLA==
X-Gm-Gg: ASbGncuYdtrWISYg8LOqBJVeu1XCJDmMuboLAMr+72nDVc0qWvkF8zhM8Mc0nV31GpE
	dXss76Iuh36auOM1a9Q8DXyqSX8JO3qWMTy0LRb+naW+22trwSae1HdYstFcFGxdli4x1GCQK/z
	rRLApJsk8Cml4pjq1z4h0gl+w2zEPSGR/RaLJaq7uJa5JAMpi9llk3zPXwOLysjETG3o4N423gV
	tpiOomcSpWA5atb4mwlLTGA0zOzSpScI5KyGVIWduJVBYpM/HFf/xhuuNsSnDoJyKy0yyK2E2M2
	gZ6c6DPm2wxROG/DL+rwSsFsYZxuu/MbBoQIdKuUkUA2zXgQrPp6J09hHYA38oCcQ2dWScDvXWi
	3MIym0x+RjEvKt1k0HsoA7VJc5vymuNhohbVnHURd6X8VNGzusYb8XzAUKqBG3gtM2+yNpCbKm/
	nUt4s5SJFuAcR8
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id d75a77b69052e-4eddba97f18mr79916741cf.0.1763036579305;
        Thu, 13 Nov 2025 04:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYSlJ7Mqnq9Dyf5Mj+nWkiUVIb7DVf2qG0ZIWMq78bytd3X9FzuruWsSqOGP5mq4NeoWsUsw==
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id d75a77b69052e-4eddba97f18mr79916231cf.0.1763036578763;
        Thu, 13 Nov 2025 04:22:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b4d70sm363916e87.39.2025.11.13.04.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:22:57 -0800 (PST)
Date: Thu, 13 Nov 2025 14:22:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Message-ID: <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
 <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
 <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=6915cda4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LPoitUEaq9Ymm4AzyX8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: DQmL0Ot3udD9j7l6AvAezfqzQnhpDhfa
X-Proofpoint-GUID: DQmL0Ot3udD9j7l6AvAezfqzQnhpDhfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5MyBTYWx0ZWRfX6+GjvJU8GiMz
 OT5FeYPw4FcKfvYe30VdSsFhnS1HgLQj3AuPB10w17LQmfwL2B5uuF6K6otlOTpLrv+2LWpv6o9
 UarIH1G8CsIRMRLMhejeohZj5F3G0zr9Eh/0rblyMK0M/WVbm9miWp5Y4Rp6SBZNM/CovsicIhx
 eBETA2RE1nD7dIZwfXDm11YjSkXvoS5xhjemP2EVyjh0dptoL5EFGeSURaLj4+v71vlkF8u/Pgt
 ad2GskxvvlkczfhyDmjBcbjz97pnWZiq+bqZ5jWT6QmlBgUZyoWswJpzWV3dhlD/TiG7F3R6MwF
 acHMsOliBGZ4mWCY3I03HtgT/uarAED3ZK2+454mx2+PekHPiOQ3AWoi4WVRubCfOZeQfxwtqEh
 H3xXz7h3u2N3SD+En12oQPQpYP/c1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042301_374864_94626EBF 
X-CRM114-Status: GOOD (  23.90  )
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

On Thu, Nov 13, 2025 at 10:27:09AM +0100, Konrad Dybcio wrote:
> On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
> >> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> >>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> >>>> In A6x family (which is a pretty big one), there are separate
> >>>> adreno_func definitions for each sub-generations. To streamline the
> >>>> identification of the correct struct for a gpu, move it to the
> >>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> index 44df6410bce1..9007a0e82a59 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> >>>
> >>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
> >>
> >> Could you point me to the holi's devicetree? Currently I see only a610
> >> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
> > 
> > I don't think upstream was ported to SM4350. SM6375 should need the same
> > hook, but I don't know why Konrad didn't enable GPU on that platform.
> 
> I'll try to fire up -next and confirm it hasn't bitrotten.

Maybe then a patch to enable it too?

-- 
With best wishes
Dmitry

