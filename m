Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7CACA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=; b=b7HDf/YMZapZQY5BKBpR7/qVz3
	TqXjjt+AxJNZkADupC6vx8nxN52rXju4vZzAX95P5sjv5UJS7Lhcz5KVAZ1OfWNaCnSjltrzJXb52
	cVMQ6JT+x/f+H7HwDjvVtUMeCH10rsKxswdPH0Kt2p/qemYhS7EBF4NhyRRGBLm7UhVaShcDXD1Zl
	KFX0FFi4MNET8HfSGs/AaoxLB66tYaJN5KMaq/BGUHwiwyNpTJTbeouqxdKvO3ydARfx9a4+L7Sfq
	BrkzTjk71u5K6W5tRHLLvPsDKjpPsJ4jzVI3vuLoQqAvLPwKvOVO3Juh8epMCgJn/4wmigt57KzPP
	ou5qm3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmFW-00000004Ehg-3Xxq;
	Thu, 08 Oct 2026 11:25:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmFV-00000004EhI-1PIg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Oct 2026 11:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=; b=gHrvriQO9mcP8rhVFkqJ0exO5l
	Ga+v66rD8fVhcjJrpdpiBfnltrG4d/eb7//zUYI+OfXE3qS03G2xLwTqk+zuXRphEeYbcl+EixR4u
	8Nm3ifN5ISCiBvGdrbOYUmJIlNaZQMEwJNrfe8E9ETY0oL4pYu4PXDF8oYLLZnd2Momrl4mrTq96j
	zkFoPtyL6xW4LMxac7iBgL2uGhU9KysQDQDS0flvEEujuXpbOdzRsIPb0bivH0ehz+E/N32FPLGA6
	0wXNviiOiSfO1JnwcGdNYu+sVfOZMKhwTNg1PvvlLMh/57k/iiFX+SJHu0iL4c9VO5YRGQ4X+95ip
	JWlSahmw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEmFR-0000000AKns-3LxB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:25:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKAmx1269517
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=; b=ho0W5dCDqEepLeXb
	c3X6IpEzpIJuV7O9b4xR+BXQqk3t8784QEqC9pdFly9oxMZECu3kXEi5pLPm3TRH
	EvPmktk/Z6S+yoAxVcPLjsDySWgmvMB5H8ZmGNNc3h3sk1CkWxzCQ2i1pGU0CpV0
	aQ0r19woq/eVoWZW0arhYWDFK+cTaJa+l8wmP4BxqRIXLa7Qkmyw3xt2yIVHq5d+
	usqh2NhRlCCMbLucL8WaTjC33qXNtuxqzrUPtYxDkhmlwwlt71GC5EiAi0c4sqmv
	3sCAE/9yocRYyY0afMZ9e3hFLwZnACvtF1cTFAwXBQWE1uOv6MS71kMUEEXBNFNr
	yDbs0A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32kfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:25:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1374717a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458712; x=1792063512; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=IqPyuBE/JTpy/hMHJMDmuwU+mv/jJYb9qFYWdp3POAIBX3qqOjBsidzlqBFVo+kFDL
         spDDbey4sLOuuGlxbBJchHNGhatsBizVVicWTk2yS1JnxAEf2kE+cwHd74ujja0193F2
         xHEXt7msZ0zwboWA8yWBuWasjatjWtJuNYLPuALhHH489nwblJD4xSsCUgUvbumN82un
         iAnN+vd8MqJA8WFyttDkdBR+vBYKceJuSKEgBoKip4n4LAM8o8fr5WT5qGPxG2W3R60a
         /nc7vOpj8KfItx0wasMVdsM0di7dNOCsUh2AXH1jou5r5eVpHJA3VNjBWdxMe6AEyDMf
         enYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458712; x=1792063512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=Vm5WvBObfmesJMHitmfPUE2SicfV5h27aGxn5Gy0l3TZ2Wl+SAinPSovoC6akGhpp+
         UN4K/yzeviyLhBKMQI/H+heelvpD+N9jFSgYQ3MHGiUhN0/TIJzu9kOgrxlSYpusJvsr
         Bas8kRNBSfYlw24UAF3gwvQT/rhMVh8omJkyOFq2ath7mz+b0F4Ea5l7hV2cEFH2TTfE
         kdZWo8CUTvxaT3Z8QJHvCpk4R5xb2nVMLmcTn3FcnOkTMxk/J4mKE3ydV1BcyL5aOLzl
         njn1mYT7GTqEMqp3Y5eAsGhCBeOyr9h2NlbjDt22g1wyBsfSiWEYjvBvTw3msQh5ppCm
         3sbA==
X-Forwarded-Encrypted: i=1; AKwUvBysQPnAZ381rqdRRcoHWJUgS5kq+IKy922pvR5xGo5HaDZAmiPbjrVtccMZ0oAFV6APP248vwUZlhjZjCXM0N6J@lists.infradead.org
X-Gm-Message-State: AFq9FYLu0OZ1XKXwcJZMXi3Dob74IDJV3dKWYKOLt3ce8l7M8TyPYC5F
	GUpacurShjPYfL8zps77xu995jQhniXe1Pt124BSNc88A1TMKDk+OTp5Pn1DgVmGJgs3g2eSrlK
	MnRsC4p5w+3USkQLpmxNd+WUuOKu/jOKr/KIau1aM1Qrt+9YfzO5bC9G85YANh1nhmKG8poAL7Y
	tMWA==
X-Gm-Gg: AYBFou2gPID0gavYRtFxAJIk0nUjjme5b6MxkOmB2rQrx1GZk5ri4JieNzzlRN9yR4+
	Myw/r4yTEx0XBsEL2A2bqyaytjd5LKRk1YBLiZm7jECtr5SE/D+8LIkmg4a1sSvqFmE7fvjEUnF
	4agvkoQ5VT8Zd9pJAbMz3nfA6wwPlIJFoYGVMA+2pyeyfleS/UNTRQyngL1Jcrl+T50GF93BAUb
	RbZ3itNHJ0T/Suq4yHoMZAxrBT66b8u6Fnt7UENV/ne2OPDU8Tw7zgWTVePgAzuc7oOr4Qotpva
	aTAgIyt2BEuzQ2yOfmvygf/wcrKR1gyYSzupgl0SOHPsg9JJoK0RUW3MF+9flOP+1coEeshd2tD
	Oi9QLTilesvLDVk0CCZq8X3OUEuk=
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40858015ad.39.1791458711619;
        Thu, 08 Oct 2026 04:25:11 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40857685ad.39.1791458711093;
        Thu, 08 Oct 2026 04:25:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6047201e6sm22775505ad.37.2026.10.08.04.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:25:10 -0700 (PDT)
Message-ID: <10fe8480-21ec-4e44-ab21-d88bf2ef03e0@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:55:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access
 clock error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX6HhxwkxzI9iN
 bfcXzoFOcnFjRkA7GbfUQcxx1sh62UMi4gceUF35Icwft/9g7hEpEwvzt1F2JG4F12/PFM20oSx
 nkQoE1uvPIkU/stJBNkw0OhF/qNpiFBZ0tTJ4tQL4BY33OSs0DVVdC6tIxp0ys34IodTr/kCoU2
 Ub/1tXQF3aFXsPwwoXWPydij97GqnQXLFYUcUWRTcoV6VE0/hCQJQ5Pz3cjnDjVSabPWSpCKOZp
 7dkZoH914SOaZjFdLUfw2lF9fX0ouRuCVuAF5r8Iud+jR38VzGyTMIve593gstzGiaPcTSb0fBo
 MaT9Os/VP7RDJn5mFjUbhTHcE3H6aJPF6WodophfMYFsOZFR30irdAcyyH+EPH/t91UwqmpeMGp
 Q+1W7Frj4jAFlNgCydKOHokMZPGW5bIAhk8t4q1lnt1Kl121VOBIrpCfRe5piqIOPSuD2jCy79S
 u72tNQMb9jpY/AYCuyw==
X-Proofpoint-ORIG-GUID: DkPCUkqHE3ykfXVso86MkuOdUToFAUjs
X-Proofpoint-GUID: DkPCUkqHE3ykfXVso86MkuOdUToFAUjs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfXwij3k/d0lBmy
 t5qOhO1/vdT56AK2cOeA65FUYUlmSPJx5xWJ/oeMjA8BzgE7sLN6kwD5fJOoIFyAxOMMxOIazwA
 IHXDKmKNYzYtOM9GAYQ0Mf3MGQO54fo=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac77d98 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rZdDH30vr1OGgawLJCYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_122518_480396_8A647A06 
X-CRM114-Status: GOOD (  25.87  )
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
> Check the return value of mt8195_afe_enable_clk() when enabling the
> register access clocks.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled and propagate the error to the caller
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index 12d8159338be..34c828fdea29 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
>   int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   {
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> -	int i;
> +	int i, ret;
>   	static const unsigned int clk_array[] = {
>   		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
>   		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
> @@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
>   	};
>   
> -	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
>   
>   	return 0;
> +
> +err_disable_clk:
> +	while (--i >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
> +
> +	return ret;
>   }
>   
>   int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)


