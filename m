Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39138CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=; b=t4h68waAw8G902mljeWfqlZZIq
	N1lRcX05/2wjceNpB+OnxyvcI9tVWaQsI8P0+hIhFC1Rowdg/1BKRVjrvxM2mwcgulkd5T+n2hjor
	wQjk/A9nTXSOBpVQxcBiz9MZaJedEDUHQ+mtYsVVqRP/MEUH3ruiHEruCo9mr6ohVFQQ84rU7Vr8N
	WWTV65Xw9mKqQTI/Qk0rmT2nUi2zPUVNRrBf6I3088APX7fx+acJkgmlZH1JyemavSV+6APgATnGJ
	JpDzTAAjhkGSrx+WpYbrdxA7YyE4RhATqh467VpckRX/R9Q2+xTo5nksgaxGQnbfHoFae/mqfks+f
	/UDFg8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmBY-00000004E1A-00yF;
	Thu, 08 Oct 2026 11:21:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmBW-00000004E0Y-0T0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:21:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK9nv2729486
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=; b=o6rSdA7r90kr5/sL
	/ulaUY+7hOWd7HrhkNWDjweP0N5jRvQQbVGXE5pv96/+kEYEBaay+aHwrCBRC3dT
	SXiyeS4NQSYenwMVsQ5s4Z991oU7LmRysyJWxjd6NzhMC8fCoeYXFIxrSU8wA1DR
	dcymgbtWe3DnNzgYAA/MlZ4Og0FMCmv+B7Smx7IGnEa9rgDf5NLpe83gAPxJMh8I
	Wxu72exx2O3L1PDeXKNU9pzPBUnB0VJBK6bCbn/O+VyurFWgCvdVTYIx4Vycwmpm
	WE6Px/jvfiKB3DOi7jMVmc7sT3uwUOepzH24GQEM8ykZs2CbkzEQaOnUVfwNYPEp
	vtBqLg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3akqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:21:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so53102875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458473; x=1792063273; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=;
        b=ZaUvl2JtDBA4PCWP97+kF4V4QjN9PdDC/pmDtqY+80J3BPfDbJAZKzp/KYVkznRqyQ
         aqB1YOKb2ZQgTKZiJJo4nAFINXMndtBDNk95wLu7ExcDn+Exyz0SmDVPyeb/tZAJtTxg
         +dH+OuYao2xWCH24/fAkORSF/BW5t7hzeznF6eE70fnF6oD3xABfIb7Gp//B2TWw6yrV
         C/n4LcBrrAyrY7uRtpRPbL4jBs5B3aPB2cOzjmj2pq1fmnDca/RvvJUlAobmzq/2a+z5
         +3Do5LzYZwE9jv0VYdW1fmIA9Dxcz9ProD/bufnjFnqFy8aKunovYIhAmtbZR26yKziM
         jCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458473; x=1792063273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=;
        b=ad7K9TYJWTgUrONmTVMW1+9H5HcLLViip+HBAz6h5eJ3BCfvHcXQwh8MN7AimEEhro
         Wa5XUaXXskVS6/vIRYMwI/MJ2wpCuSQqUS19I0GPM+AsXs1j4/7ACJWwBarPNnaDlSm3
         1YnYESllPBOhfE7pEPLak4LExBxWLrYH2/Ni8JgTFPgqDdSi38vxSDU6FUBexPO0C6vv
         6oGu4Os+nKpRSjbY4WQ3qGM+5sn6vhwRo8LGvgoInrpG+xofdgnI8QYLXtz4BVhQj0bl
         QlKAPC0QDmRAXf8rMuVMdzX8AIopvZPGLUPOYfA9/hQgZt3zprW+Wveci/RHO4kMLsbi
         hyig==
X-Forwarded-Encrypted: i=1; AKwUvBy0mZM+3k/7BXRBqsSwYOhPNhVY09pF5fyBvM1/1FcLIWDL/8eSlrc8f9y5uTQNkaCdfssjA/Ifx8BYx/5wZoXj@lists.infradead.org
X-Gm-Message-State: AFq9FYKI/zef9dWTqWnvWXPdFCum4Au7akyKL/tyzuJiGC3crm7LkhoC
	ymTTGNE/+Im4cgWiUHBS7icpBHiOjJnWwggAsmG7gL/5iEvI01DMUEd8+Nr+gFJVRh1nrosWTdk
	ZTtCc8g2kPxP2aQnooIncgDb/FwijJPBgHXEDJcqVVABpXmFP4Nv/YMv+yUZrtPDBOaeaqNxXgC
	eknw==
X-Gm-Gg: AYBFou0bWmfvTZDS1k4E0lDfik62WtITBDtVJFyjbsuX3GdmETQRqacqgls4if7KqFF
	LFlAmWzlSwd6+CJaoEEezYoe2Qsbtb5PBzaR24VHjcWIDPN5BBiB7DCNO/idAd5bQjIb+hLQZPU
	s+AgHgPSFHCxorXf0MuUr/2NUoxDC5zq7aKKIUetZVoSA4gPkzsYRZmmCPCFRqazfmYu1O8sp1l
	FJmCX6aBGhKXrKOgxzF+ifHF5mzPbhEeSK9vhfItP+dgE2R33wSREbxVycSxkmGjxsc7RpLcKpA
	OgqFKga8VjsT89klOOAWMDuuCOi0Uu0+i1Fayo3oq044Jc37KL8QoHQUcWv3Nok/l3bHFTWI76a
	5crIO/LJtqwTn7fw4wY8fF2JDI7s=
X-Received: by 2002:a17:903:3246:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e6004e1588mr46557905ad.26.1791458472910;
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
X-Received: by 2002:a17:903:3246:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e6004e1588mr46557605ad.26.1791458472408;
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60443810asm22367435ad.9.2026.10.08.04.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
Message-ID: <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:51:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error
 handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>, ajay.nandam@oss.qualcomm.com
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac77ca9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=SQuuAJ8L7pDmPWVkXYcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX1fNjkxx8YtDK
 2rP9VpfyE7Zry1BvDi+owZdxSDWkomZvGsUmuiTHZRyy5A3mGrEgRiUwneeRwBYSejQE1Yqmv68
 IkTs4xmZamLZlzCELsuWNixWNgvCrMM=
X-Proofpoint-GUID: yh6bSntmEziFD6qoe7DQIb-KzLUBZWXv
X-Proofpoint-ORIG-GUID: yh6bSntmEziFD6qoe7DQIb-KzLUBZWXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX2XTz1oRZ6dSt
 PoRoDJHHsyX/ponwcPsHPBn3CNv0OJT/mvdM6g0Zf2f8b+Q/VxnKMxKzONS85lZjJgwuFe87sb0
 +GyhP02jLtb2/ZJTtflxfrNXvaWuUTNELtunKHSZ+9dTvAlofZU8uKNAtzfxMAJVdzmGeA55Lh5
 fqECJ+e6jVwEuuS6eleUlrMH7Tvl9B0qsXoGw/GnXRZ6MIkg/JQIZmmSQLUhn1exi5C7N/uI+Jx
 cvaXzTtJs9VMM6/fVoGRQl+oCVMz8UvV/DYuOIPAcANpJvy0DIw2MaGyl8PRofuqI5Vgh88T3wP
 NPimFJdJvwLtSk2lEduaT+aV0COeFMf/nnahxfK1na0DHmbSeKD538JKMpf6R8kS7nm1ajIDa8g
 yBjif3e/XvW0KMiF2A2ulUg75jolM9iTR7RmQoLHxv9gkXJzpZNzgKOJkipKywn3l91wFzov4Rq
 z/6nWenVuUwLCt1u6yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042114_168243_0B788E0C 
X-CRM114-Status: GOOD (  22.37  )
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



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check and propagate errors from mt8195_afe_enable_clk(). If enabling
> the tuner clock fails, disable the previously enabled APLL clock.
> 
> Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index 618d8400913a..ec1ea5b988ff 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
>   				       unsigned int id)
>   {
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
>   
>   	switch (id) {
>   	case MT8195_AUD_PLL1:
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> +		if (ret)
> +			return ret;
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
> +		if (ret) {
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> +			return ret;
> +		}
>   		break;
>   	case MT8195_AUD_PLL2:
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> +		if (ret)
> +			return ret;
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
> +		if (ret) {
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> +			return ret;
> +		}
>   		break;
>   	default:
> +		ret = 0;
>   		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }

This makes mt8195_afe_enable_tuner_clk() return the clock enable 
failure, but after applying the series I think the error is still 
dropped by the next caller.

mt8195_afe_enable_apll_tuner() now returns the error from this helper, 
but mt8195_afe_enable_main_clock() still calls it for APLL1 and APLL2 
without checking either return value. mt8195_afe_runtime_resume() does 
check the return from mt8195_afe_enable_main_clock(), so checking the 
tuner calls there would let the failure reach the existing resume unwind 
path.

Should mt8195_afe_enable_main_clock() also check these return values, 
and unwind APLL1 if enabling the APLL2 tuner fails?

Thanks
Ajay Kumar Nandam

>   
>   static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,


