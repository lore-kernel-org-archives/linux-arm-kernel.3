Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195DACD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgZvs8ItyoeNzwdrSoQaw7NU3tYQCqRT79Wusa/gol8=; b=x29VG/OBWXqkVWKJI+eT3d7CKn
	SWdHx2qIuVXg1IPYEc8Xrk0ecDHh7ANCNU3eXURIsERKkG0zWAXAfU8LkID96zfyUildnsBIEjdnA
	EZpvtcF8UzUX11xc/oQvobI6l46dlubUBKT172auTkG9RFbbYiL0k+1wwgUEIJZKT/Xhq7OEQUutV
	2ifDxMdg8OsTC8KWsPOWqpHCxYjivflVxIYaO7qs0vrJTCNNNrxTHslPtX27mxuebALGEiwSIceID
	/YJiYUb8uN2GNbDaKobd5uuD+KU4z7dUr+RGjB+/T3zA5ZHun7l+mFmLHLPH4g/+e/HkTAKaVWgkn
	En8BpM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVpy5-00000001aa9-1y5v;
	Sat, 06 Jun 2026 12:17:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVpy2-00000001aZa-24Lm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 12:17:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGPpw1321802
	for <linux-arm-kernel@lists.infradead.org>; Sat, 6 Jun 2026 12:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgZvs8ItyoeNzwdrSoQaw7NU
	3tYQCqRT79Wusa/gol8=; b=Wpo9IbW2U2wCrMvLt6Xez0VLv8ki56i9WVHlQUZp
	bZooegCRoCJXy5IX18MVaTLrte5oIcfWoS9qaiLiVqEtwTVNKDPGdej+SKmX/FX7
	dwnxOh5eNKpI0M9t1AcExvxaLEvhZWxOhSJ/zTKsdACXfTr93T7SGknbAcrFXCtB
	lKYI1aL6epM8UXzLhlH33hc3OpiMVEi8I9hSx4Jnr0pbzE8DnpM0ZFmd+8z/YXMc
	KwugfXljpdaQToMRX/9XQaQvO+mAONFvpj0RsabkdtlEOQEsdcg0sEBYRh+fHP5m
	NM2dnniTrJIJrMK2054lywh6lRSYo7JSXRXJ83ZpyP5scQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4s97n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 12:17:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso1426203241.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748251; x=1781353051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgZvs8ItyoeNzwdrSoQaw7NU3tYQCqRT79Wusa/gol8=;
        b=T21ZVUYWIFfUNU1zqIWJD3984iRK6p5gQbwKHeBYV6DuQrXC9/iQ/MFvlwQRxh7H1K
         3+AMrXvFO0wkEstEb5ozH4iYDp8nEJ5ATah2jSITUtFW71mbzn+Adi7mJ9oOek9z1X64
         paSiGrltF9kNcnoLSJ/OBMz6buArTg4eV73mvW2QPLS+8ahO3gcfDareSpwPd0G3MVIB
         N/PaVZpyihWtJizJjttxTnffCwylScyEaWFc+FgLnvxYKLv9uFHkfC4I6N04M12lnLJ9
         xNvfuTCo62OuR7w4so5j4VfU/FfxyjkY8Huh2fTZydEJTU81cJbAsGM6cZhUfzVCp6T/
         s7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748251; x=1781353051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgZvs8ItyoeNzwdrSoQaw7NU3tYQCqRT79Wusa/gol8=;
        b=qjdJSP8P1gbVaFmzFI7Dqkl5B1q1Onz6KaTzotzD7HjtFu0bIsYb/v7DRsgyuFE0nE
         VZ9Zcc/xfnZvSlW5fuCpHpGiW9Fy06p5YL/YcaoUyk53iQg19kuoSXZk/NDwiorYi4b4
         okSu1oZcJ9myiRrcZVOpPq5tx+HCCwX7n9jiuUgJn7bPoHxnrLjM7a9dR+6P4Uopqh4K
         uMiqmWGecfm0NprY1kZ4AIOj8zVmOY+AnQzlJbVmcx8qQDhh3HN8aTIwpl0QAxkHNj4D
         yMGhgvD/8bIia222MckO9Mbsm/g/lvJg91IoC9D6vXezJaI5ptGQbUikAonHhcZI0iNc
         CfEg==
X-Forwarded-Encrypted: i=1; AFNElJ89+qJ2rKsF4E8Tz9OetBgtBB83/vTOd6PIFgSg3ofLGDhWBMgFgpqlk3TYNxYg0LQ6qiijp6RdqFmG9aBV5GUK@lists.infradead.org
X-Gm-Message-State: AOJu0YwFFsqqI7O1Ok3Bvj91qTd5bW8kbXmnFnsUNC5ivqz0nphpRfSG
	CQaX+to9KmPyvfbVd4ZA3bFiJqgHjD7fU7zhiQPMb/ED6qY4gnISbQif651HI8hthahE1FJybbI
	ubRS/UxW8ZopSdLgNlYnwBohJ4bVE2hj/VCfDenVPwoKRqKwKtLbVg8j+8XQXMqfTCIl3wcFlQy
	eEcw==
X-Gm-Gg: Acq92OFTjkj/HGqRt/lqS3tkgj5zNHHl9dCkyorGiI9INSjk+euHX+U77sJQQvRztUu
	BjJsLYmbLmyIqBHx+Pb3HtSVsThL9ogO048dqUJxjt1mYqhxSUKvUvUuOGrTCohz0MzhbwFwAYB
	h1cKWb67ZrtHJAaBYwcCwmM83KuFeMPYLy2Aeet7AuIcM88t2nmUkqgz/tCo+9jZznRHbGh4PEx
	wmfN/n0f/UtMfdfi8K5T0OPQaeKPawAmfKP8ARVqEw44RNaMQZRHY+V1XfZeQSYjISfYL7bV/fl
	Boe+SArArjq3jz3TnQ1kHCCMrh8LKe2yyEu0veKmfD+8piFqRTnGXAJZ/7NV84hqYVb0a4oG8q8
	+hDTYaftZ65INBYY8hZ8niLbxL/rluJVoi2IXAga5y+mIx3GS4Jk1RenpahPlqumnbFEpqaKtHN
	Ob5JlSW01vfCei8BbNA0nMA+W6DM2rnB2sfJxfZnrxgeXk0g==
X-Received: by 2002:a05:6102:4411:b0:5f7:240f:bbee with SMTP id ada2fe7eead31-6feef48d3c8mr3403168137.1.1780748251240;
        Sat, 06 Jun 2026 05:17:31 -0700 (PDT)
X-Received: by 2002:a05:6102:4411:b0:5f7:240f:bbee with SMTP id ada2fe7eead31-6feef48d3c8mr3403141137.1.1780748250808;
        Sat, 06 Jun 2026 05:17:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed56fsm30934311fa.37.2026.06.06.05.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:17:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:17:27 +0300
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
Subject: Re: [PATCH v3 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <aiQP1wpq1MAlsttR@umbar.lan>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
 <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rEpclKPCD63D_BcovPqMLUuTKYoV0Hzi
X-Proofpoint-GUID: rEpclKPCD63D_BcovPqMLUuTKYoV0Hzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMiBTYWx0ZWRfX1NYxzzx1NY5/
 +pSYfKFCoXzvrGttdkm2n6+g8454/RJzTRh0QOIvff+IkCGYrdU+PTk+HtclClUWnyz3274ZY2Y
 Am3b0FBR/SrVb18b4IJ/8vaGhBhIUrPUCyqswAETmCfBJq4hRNbSam40CU83tPSd0PsZMqft9Mg
 wyQu+vCutmo492yyoIYpk42sNEX0GdGWeRGPPrM9e5FNzQyyYALW5mGP4t08ON7kQsoe8SDsuCg
 VJwLyVJscUYdEkAt8jLPH+EV+ReZRUQdG+uP+QxxpCErOiOAa/f9rJuol9Lg/KT0an4xNA2qUF+
 5A1p4093nk7MHphQdjazEugPPAVM5OMQWUsnVVdU1TiOnox1/7t2GG7CGqefZs3ApLVAaDc0VHF
 Q2DaTeA85MYzJXxKNqItuE9qdvtQGYrAdZWRfWUMF4SU+J1aW4KWLBB2pCErSWGs+GFcVc9Dcpy
 RLfby4bv2xc1do2a1ow==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a240fdb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_051734_655735_9ED2BA9B 
X-CRM114-Status: GOOD (  14.72  )
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

On Fri, Jun 05, 2026 at 03:48:52PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Okay, you are really not reading any feedback. This patch doesn't belong
here. Move it to the series adding the actual DT with the panel.

-- 
With best wishes
Dmitry

