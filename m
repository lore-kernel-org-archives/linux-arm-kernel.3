Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE16C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neSEr4Vb10TXp2iyqI1V1pKktA2cv81JEUUM8szWa8Q=; b=wvwweSYGujTskvEtcuCqYtY/lX
	/73XaFlM2ptIkAINgKUiI83oK8gMSi+1RaTS4DU342QqMIpj53oyApHvB6bZ/y6xURGwqBqv0hSTX
	Ryx+8Fbz3g/zZrAYaLP2J+ptOwr/RDPoZTot9vgbRMzI59lfYqvEaK7ucUmEIiZT/u4OsTLZsJ/sU
	Ta/8dKTPikmGHrsuUGBwIGmL4jTS5UJmrZZcek5ViGVWAYSwl6mGsHLooyGK/t1Z71vw6U7b1k34J
	lJhJBaESsW1K2skdB22cCoeAd9OCt4i023XQGQoiH6knU6vbsK0SqCJ+EizZKSKO/ciZAvsXGJqWE
	ay9VQeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO0Lv-000000025RK-2Y3r;
	Sat, 07 Jun 2025 20:41:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzvx-0000000230f-37uV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 20:14:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557JVsSa021564
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Jun 2025 20:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=neSEr4Vb10TXp2iyqI1V1pKk
	tA2cv81JEUUM8szWa8Q=; b=aWBtNL/wBLh7CzJ6ADsTcd6RZes+GaWM9LycJcLq
	C7Jz4+8RJe8RokAt8cHhZbC99Sc4sCvW25ZKoTUthmsXUo486GQvgMCGpPNJs7OD
	eOdlhGb4RgKYbOexm82vfpwVDVH8b2VVGEHf97jUZBd2fbtVw2g42uLrUiSdUxxA
	X1N1yxLutj18RPuwltXnToYvs9w8ZI5B5g/fh4+DlEooQepkt3AxS/0FvPHux1XW
	CRWYhppRcI6mFcB930+ZjmYG5eRtMJkCYiitb1pxlJahvDvTV3FROEWZMnz3SotO
	aaXj1Z64Xt4i7x6ECtaPNKIzwQEh2HjpoRnI0PP4e4d89w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j16ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 20:14:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a528so763835885a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327267; x=1749932067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neSEr4Vb10TXp2iyqI1V1pKktA2cv81JEUUM8szWa8Q=;
        b=X1BNFXq4Lqbqu50HQBufEekI2c0cWt5Dd2BtkR+4xWlcy8uTF3wF5kiZk45lGotqVL
         5UTl4bA6rCrBK3MWkdWc7eN5o6gOtcJqX/6GzT9QeRXoyEswUWJ5U8OnTmfYhbhzTGIi
         pTEy5LrOLKjERZEMFSfcbI8lM+I6gAyfJE7V45R0GXo7cYiZmzZSeJg6CqCxyQnHfg8I
         fTcimMuR1zzBv3GMCtmE2kcNJxx+bOvCtlImf1rukisCsVsca8g7L/6byIaNPylPOm02
         IJeIobB91f+z84eoqc4BnWiiH6kquvWR6FGIl3TtWHsGSF4g54pZLginzuP+q/lMzEtG
         F3EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL34UjTANmONx+nQZ1k5igQiwv3/UfVsmljLg+71UlkAnO0Ef/2QmNzbBtXoPUUqbnqOTECnSmiv8v/ZZIOpkW@lists.infradead.org
X-Gm-Message-State: AOJu0YwfFELwx1tHiuQAmOtQP5MU/nhzpYX2IdYKeBvGBJ7b/eaId7F1
	h/8cEqEGFX6aVPDs3nVYE2u/4eicZKBZqm7Jq0coP6Qb41ACzAfOJmyg/SK///xOzid3hKZdrUC
	gaA4jHwdlZMi0a3A9GFKs9Sm4SimQAcXwMV6kZdVA6H+O9eyiaTfyhBxyGB0mdttR2XKFeIxiPB
	IcDg==
X-Gm-Gg: ASbGnct9qi8Gza+VAVB8XzEJr6satVsZXk04OwyjcucUqx/AeWa9yLQnkRLF+gUsvRs
	wpAEUnCdY/zo8Cc1JjgSLtiC4O0f270IcYNGwd6HOr7EUIaITJ637YSY3Dui6Iyuarw/4p/3Fmj
	ers3FSvGR8VIhYEyZun9gHA9ly9YI+o3qkuu1l2xdbzHWtYKEGDkPObz3/DWa5asOtaa3rjTeVj
	MmsOoB1sEJ2dFqLVKJcvg5M53wwi9UZ0V77ncqMC5Hna4Bj5QPsa+ObR4hLb1eMpXOeEKsYfvga
	FV0qUJwgtCEvkDI6LRvSxJqcNzG0GXzygjxeLmu5icqLmgVTvdim7wh0mAssMUEKhWx5/eeOU34
	=
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d229895ca3mr1050770085a.28.1749327267618;
        Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCuag0taTHrzm6R/+ZyR5VGeUYcsVJcuUbo2+TlgX3IAKr2Foit53gWXRD7B4X3LAeA0xVTA==
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d229895ca3mr1050767785a.28.1749327267232;
        Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cf7fsm5606531fa.12.2025.06.07.13.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:14:25 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
Message-ID: <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX/5QVJthCQ+EL
 OuCRjLC7gnvMV/x311DqoovUy9BO9WH/2dn07aRjGElrZwzi7tkJ8NNpeB3SyD9XXptIwmiz3XO
 e2EkUsb4grk6wRZVfI6yTLav7D++SNFyFZuXzcmpwU56q314She19tMUQrd1KkPS8Rkdao+G4dP
 z8B9r4DIpqzLhwwJhr+pXOawuUt8T6HQ056NuvdzU371D6xQPEK8ltlVRwz9RlCu9rRjxnjr6+u
 qX7onidT2GaDufliLnMJ+LQurFUIXK188v4x0GdOvN2uVf7k5wSsSio+s73JUITmxn7NroUYQuJ
 A5RIfReqb37HipjacguaUlrxd+1ahh/LTRukYOml8Xxy7/bHprJw9wkZ+4Vq9vvmfUQYRvIDxA8
 nkjzdPw90b5B1XOnqX6zvkG0Tkx6ewRGFT4VkcZbAncVO7XCJQTfKFYW2SlLF8pNBJAuF4lw
X-Proofpoint-GUID: NMNOtG3cuGG4wXJ1Rb6WsRJjTz1JDAqX
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68449da5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=K9QtY5NQ_aNozdUEqbgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NMNOtG3cuGG4wXJ1Rb6WsRJjTz1JDAqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_131429_797616_167707A6 
X-CRM114-Status: GOOD (  19.35  )
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

On Sat, Jun 07, 2025 at 07:45:00PM +0530, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
>  			},
>  		},
>  		.preempt_record_size = 3572 * SZ_1K,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
> +		.family = ADRENO_7XX_GEN2,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen71500_gmu.bin",

Any chance of getting these and ZAP into linux-firmware?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

