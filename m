Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FC9FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 21:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7TCDHNSisOZ4cJJC/DCoEBk+8T/g6HxxJjaANTvPeQ=; b=Eq+7Gtw2oW+VPmjwkxi0sTV5J2
	6PTpHZXe0x+ZLCDRzFE6Wi/M3WH+HC8mHOGK0aVcj9mSAqKNhWgStEC0kuzGOK8s408gzpE/Nefn8
	PXvfqpy4p6PhyBZSn8bHycLx4NqHDKG2fo1xaokFZXz8WKd9Dc2qv2uEwHyxcBgjUg8E8yO1SfzyE
	orviO0iTZ+B1xM0aVJCp5lboWow7pXASyaKmymRdxFMJUCuYjPBgq+WpZA3rvTvLqisrD8nFPeAkD
	T0/p7nwHh6RJe+p4CxVOdiHIaGOHrXrHc2q0CWugNZBbUyOggr6vfr2DgYAhuawkiQcjd6ziyQrGb
	aEgat+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpkf-00000002VYU-0Qkp;
	Tue, 28 Apr 2026 21:13:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpkd-00000002VY8-15CC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 21:13:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsboP2890730
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f7TCDHNSisOZ4cJJC/DCoEBk
	+8T/g6HxxJjaANTvPeQ=; b=WAjSRAHUekQ7NED9nimZkG80gnp5uIoyFJuLDCwa
	kNNQymlHGipY+WOOrKJm4io6w6OWu8RwKxfqDO7cRU+jLhftD8235bgIqmtw4baP
	gjJXdliIxYYO1tORXlyfAf3G3JsWHQXtU4MhiDl0XXhysvyZRjWvCKk/YHlJeYO4
	fjp2+QPDaNj+m43KJyteZK128mNiSnPE2769POprj5nN+nC+x3fxgT+ilqrkV8/r
	5k9zX0P0rKhlryvA5bedIl+XkyZXbBEOlM+FX27qLh7l/2Jl+bJGjLWCQQAXK7hs
	jkSOxkUeGioZoVPVzJgk2QVImHamQUSvnJc2EMlfjpI+vw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgytncm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:13:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso316917921cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777410829; x=1778015629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7TCDHNSisOZ4cJJC/DCoEBk+8T/g6HxxJjaANTvPeQ=;
        b=iLj1xgiGimGTseV4O++dwGcmbybheyoYCRL80kXVzq9/Snwj8zEGImtdUOrWD5MwjC
         b5LWZCE5PJ22DOozqhMtV/R4jWO9lDf1wKZ7kp5ULDMkJFLiFH2nG4kCNiL50hz8yO3j
         6BzwFztSFOiFuKYjkZN/C3TNUeX93OFTkcTSplaW6cXW9wOtQhoqxBTXJ9DDM3e45o62
         lU9y05rmPNX5yhjDWQsjk2QU+vQu8n8SUeZlNMAv1HWbT+jYfe/Ja7ERhn9qzIsMJqaa
         Fzf5/dvV5ZXEYt6UqqoWgQ9cK9PCtkavqvpKQACwcITW/aT8yxcbAC4opA/S7CdeOuee
         DD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777410829; x=1778015629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7TCDHNSisOZ4cJJC/DCoEBk+8T/g6HxxJjaANTvPeQ=;
        b=dP0nJku1esSCsbMBfkGVDpFlnRJwigCJOhcwkR/gI8B8kVGk3t9bnEZycejr4m+MMw
         fbuU0+1qpSo/X8Fg2LawcYD8dO6e/WxAQPRac7afcANbFBlYGYLT/RB6IIQP5jp8bdkq
         cNY03qzQyfrHw41kxG7ySYTdGyJ0md3DKG2bPRHgiaiXAkOZbWq8qLVPjAi36VmaE7td
         fypKGRTXuDRyPloo9BLRZCU7GUIdregWTGfd+IIfQmukFpByT8nGqjKqzTuzC3Hmd3Gr
         bFEfudqS2H4IbXJUEMJYOKA0JYlDpyPOuB6Eo6yoCLnkMpiAbo9YsI03ejhTAO25wFuW
         ag8A==
X-Forwarded-Encrypted: i=1; AFNElJ/VOEKwutLZUsug1cj9bzUeQ8TsMIIW8yzHXMq1usqUZBGBq/uVPPqdtPZNH8HyBCGEAFLAnC1uc1CmnTHE70jE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6rX2lT2sFgsjs2wciQnN9vQjuJlQHH7+KiD9Uh1dmSBS1GwGY
	tYK/yuk+5hMHDVCExk6HTcFigTk5+cOtE3kcAXd+wR2dFQMSavr9znAIog/mqJ7dfiEcqco4xLX
	xp7riPoX2Q0gczd6Dm6t3pRNxyl0KFPDp2xUgV//BAZawcK37KRgmSKy930hCbKtcK86QE6JD64
	dUqHgzGk3Hog==
X-Gm-Gg: AeBDievM9jK4kU8X7nJDGFw/vm17X9oxcv0AzkFM5I9ZwzEgtBFoKqd0o9Ztq7hpY2s
	gi72skoSZOF95xfBHmmoQOLyQVUnfmP4BuXtAINgN22R0YPHh38yygyCLyLd/eOXOQt0KkglujB
	BUeaa/pJxXrQwbubwS5UQEDX5qWjB6kP5XtVFrJAcufckr7Z3Z60iInVybaJyf4w53jisToSxbS
	WNWnBBL7NsSPHp4EroxIrxprGVpU0h4kUImZEcFYhf9qL1VQ1sG3V1J/2dK+PkAESrfzAfp4n0d
	R74FAInxUY0O5nYNUpv1vwTvHSlHqakTggIGOdmiS9BycZhOvGpyDKd4vXbeqT14FUXKac0xyKI
	8Z3pMN+GOHH5qRCp+wqxN1QbkT7EKuxP5JI+LS2RTL0V2ph507Fa82Las27mrwFEIudMzci5PwF
	uyGn9xBxJaYo2ScIchw2J1zKjpwVq7bNh5cGZzFZb+4oH4eQ==
X-Received: by 2002:a05:622a:4115:b0:510:1325:58b9 with SMTP id d75a77b69052e-51018a8d7f6mr19041341cf.41.1777410829598;
        Tue, 28 Apr 2026 14:13:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4115:b0:510:1325:58b9 with SMTP id d75a77b69052e-51018a8d7f6mr19040911cf.41.1777410829073;
        Tue, 28 Apr 2026 14:13:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756d1bsm34384e87.47.2026.04.28.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:13:48 -0700 (PDT)
Date: Wed, 29 Apr 2026 00:13:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
Message-ID: <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx>
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vB5xRRIBy2htjvF1GpU9bFq_yk994uc1
X-Proofpoint-GUID: vB5xRRIBy2htjvF1GpU9bFq_yk994uc1
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f1230e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=_EZUpx9RV_GiafN7jJ0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIwNiBTYWx0ZWRfX8lO7hZxDR25s
 +uets01lNuMRz3u0Ncbk6eav3viznX1OuW/lvK9Ty2mzEKFXyzsaf+tGMu6iPtOYx+iWp2NpOPG
 YXRqhbPgPxs20YPJC1bpbWrdEf7EoG8Bk4viyRCGU+RSq0SMD0rApIPLc6KV8R9vVl17OFsbhFs
 lki9gR7msVxbvR99tsM8mQrNCDQigyvuPpQoJa9uaIIKInhaHpGw3S+rcT0TBWmeoNshnVvSfe/
 +ThpTaQPUHpkhh2MhABA9Lvqrba9f7C1u2Yq5f/007nhaz9kFTvvjbCNwv4nsrXS9EaaPF5BwmG
 wbdhYk2jU0cmEGhtV8No1HdjFrRSX60WC3kcsELpVB5qdyOybaxMXmoQsFtuSWVJdnm+Z11SDYO
 WF1g/CAHZ/xelqlUsV1de8OFe1yAKl1hQUVsaXNawCiZmrIRWt6Ooc2u0JaqDe4LCf8OG+tvhej
 v3wgztR6Zie4HcC0LjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_141351_303403_75FACBA3 
X-CRM114-Status: GOOD (  28.41  )
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

On Tue, Apr 28, 2026 at 06:35:49PM +0200, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
>    PINCTRL_HAWI, which were not selected before but should be, because
>    these platforms need them for proper boot.
> 
> 2. arm qcom_defconfig: no changes.
> 
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
> 
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I did similar change for clocks and I will be continuing with
> interconnect and other missing pieces.
> 
> Changes in v2:
> 1. Rebase on Linus W. devel branch. This should go with pinctrl, I
>    think.
> 2. Add tags.
> 3. Update also PINCTRL_IPQ9650.
> ---
>  arch/arm/configs/multi_v7_defconfig |  8 ----
>  arch/arm/configs/qcom_defconfig     | 15 -------
>  arch/arm64/configs/defconfig        | 46 ----------------------
>  drivers/pinctrl/qcom/Kconfig        |  1 +
>  drivers/pinctrl/qcom/Kconfig.msm    | 61 +++++++++++++++++++++++++++++

I think it would have been better split into 3 patches, but this way is
also fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  5 files changed, 62 insertions(+), 69 deletions(-)

-- 
With best wishes
Dmitry

