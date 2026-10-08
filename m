Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879B6CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=; b=s9uhg+Je18BH3s3kAQ6Bz2F04K
	65X4k6QxaqQUorwPvNnqP4Hnk8ouwS2c2OHV7AUBr/Zjr5oGQ0JdJiJcb3ZTYOX4Y9pnRFl9R8JaU
	Zjtc4V29QxL0ruTrjNzdPTe4MX9KAYk5psyIshFhBY6NJf9RHXTG3ohK26VpDHCGs6NsPUzL+ASgb
	r5Y8NJBtP/4OwJxZ5CwI0rk6Zu2Tb5ggSBY9nVGpz/44uKbaBCpIgTLvYrZ0fuHfQl6GHrZZ+vcSs
	ivX+Arrr6uOLHL79He5N+sxTLDvLd7f2cOgbt03UEZC/kEy6QJxVMDG1wQ2M2Z7V2kOPM9yCM1RvN
	c20vltbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmjE-00000004IVi-0iIs;
	Thu, 08 Oct 2026 11:56:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmjA-00000004ITq-2cla
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:56:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKPPV3100006
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=; b=H/eOWCrPhPA2EjlM
	sTpcc099xLSGzL26cEaA8v7aYEBtZwWIBBUSm3KJNeJK5sDIMS95E54FV76NB9+S
	Jkj8ZiQnjShOhOBAJEQU9eJcCzRL/bevrK2RJgRfX4utVkjD36VCr1tv5HIuZgmA
	4wGvGfAImO2jXXtHU3mA8h0rHZaoRAo64uTCC2UovW/6fY02fiJtmS05iHz5i/w7
	qjkC5tVZJN51WCsdWpwWy5ReaEnOj7xeQarRyK/npxeO7U+13H5x+U3CsRz/UToy
	fKjvntqJQvgCfNh7OnF+S1tKYRwBBxu/vTf6rqa7QeCItQ4SAi6CJtp2nfPk6vNU
	bYhohw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82pms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:55:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so68922305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460558; x=1792065358; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=I8MK/Fr1jXPL+xSK+/fqtV/fpRZ/3vA0ddW30OhRFgpoGWjqV0cdOfL1vakiMZeAgD
         oBlsH3h6Poe9PO946tmEF85vSrSt8OwojuBs0aAhH73kOUiD8CnMUFSbLlqSPbDhD955
         CExV66B/uCUsaBgkKlywUG/XptP9mL0+LdnsRfKloNWx7YtQcpbzPKlve0wG3TFTnKjm
         ZMHpXLYxa4C04zG5ODCAakLltY5NmrKtPhH8S0xoDKEXVjfnGhwCOu8mxpKUilVet4py
         bds2io9xDkI6zpAFxf2SjaPDDg1UXbiIjF5rxlzQWEx/ugfPMsfKigdMAoQScDdXiD0L
         8IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460558; x=1792065358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=WW2iU2O4LTfb0GLPoMNAVGSYJM+Ch2HkOGu31WtEpcXu0aeJr8HdN9zolt3e7R1a9j
         B5aDRX006MagGvyrzwZAMa/CXR7rYLyUtR96f7DbDWJiwUfS57A69phLCcOKP8yTbHaT
         0KXUolkvrDbVTNqWFn6sKFUgPXcg+zFtNQq8Kk3Ah7+M6avfucih3L72WhYRF85G8/cd
         vRJUBNNxHEsighuLTrWwIcLzBBK7p5EYBqcbcurb2XY0w9sYak/HSEA+AND2MkDjBBmn
         1ml3mi2T/+qfgdcaFroH9xBgmxzXsWxDyvCVrTt6vjCXh0SIUUKLmGELoeWrv1WNLXbK
         29Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzWu627R8XpZZakpg2oItRGzJ372oBsKsXzV3z1pqxRdALBx7yOzgD3OpG0RXJ3IS3kpFV2AV3LFYveuI2tQgMD@lists.infradead.org
X-Gm-Message-State: AFq9FYJracAawN/mkR7l6lXdNOQDCcWT3GaHW+0p1qGI2enEBB7kILcu
	Y+DBiREuXCazhcpPI1VHGhixRDx37dsiGZSI7fpEty5Vxyza4pMmcHSa9upGgQL5gd/lyM3wbCP
	g1JhR6ZOxJhMcQKiRAlqdaBtbXIPwFwicbEuqETWue7SzIieicDrwTnR0qDt7bEdf9hH+dB/zs4
	wNrQ==
X-Gm-Gg: AYBFou2NR6zLmWnkBDajApnIv92xyOAFjCYEXfh9RMlaFn7f+OHszy9rNprWNhRp27e
	J/rCE3UunEoWTM4aCv+sLNwWqWi9MMA/zMlcIHKf6ESSorDa3rLuHKCgsZUIOCdsYaM2p9aBeze
	pxdOxb5wDrXZK5sMdn42uWqvgxS+gR43josqwd+kWxyfq3PlIOXSfuASlEuIR47zLLgtzCl6XGc
	8vjxY7ko1DFSEWpZ4nX+P76tHWvxDZvo7Qj1LRg0kXQjAQt1PMCCoGmacwcPBAhtlZU2WLpcVi6
	wXIaqlspa9G/hABbsPGrySVpf5sqU536A6vXecnF9Zyq9/UE7h0cVJO/h6ot3AoeOCcNuT582uM
	+0f5DXKbjaY7zTJjr7GkjT67l0WA=
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802665ad.3.1791460558573;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802505ad.3.1791460558080;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm22731375ad.58.2026.10.08.04.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:57 -0700 (PDT)
Message-ID: <87bc700a-0b67-4791-9065-b4fa4ba9b53b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:25:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error
 handling
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
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX4CR8md9rdtrF
 +up2bttg+17LfEDB2HVqHTHHD7AQnZr55+HyAELSy+Z9ALZxUHP7dYv9IFv6Swbjzyy322zvBxj
 VCo4mPHK9rBUcR4BSQJBkwt7iHI0lQKAOkMBckaEjich/ZrV5EB0vOGgpqwn7tCpzzYk4R5MuN7
 bHCOmJwhEkedvyz+v9LC5K2d3DIznPHoki0dTZ6mTYM3vXB45RrYb0YjMPCnLlPua68orFc/Zct
 KMkqh0tuuoJ8vGEmRgijOrjnyJTz1+AwMaEeRQXWYI2BQdMTv/M3FjAO2+3WeULfUOVjPPQ0xRR
 7LElaD0aWwFV5rAtw5CcssBMzOJzFBofVC6An5m48XC8IxrRomz2OGzZf3Qer0CJZgxFLEyh9R4
 +G0j6ToM+31T5eK9dOr7BgBj75zrfFuc/IQ8y4q3YGnK6jOM5Az/2v2zp4IqpVoWuqbRH635SQj
 YIFgJtFuqaDIj8rsqzQ==
X-Proofpoint-GUID: 3ZGuNjlVlakfXPdRK_QaUGVxuFhY4ZrW
X-Proofpoint-ORIG-GUID: 3ZGuNjlVlakfXPdRK_QaUGVxuFhY4ZrW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX3R/136Odvh1i
 odOQIfNecE41KtGKVptO12B5nLN/XHXuw/1ZACmEfkf3P8ksZ6jUlIv4OJitDeoTq4fWI4PuKuY
 t+QbhV2YimpjfO9B6Su3h5IIs0Euz7w=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac784cf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KMfNbJP5VoSB66bTmycA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_045600_789014_9485C3E0 
X-CRM114-Status: GOOD (  22.67  )
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
> Check and propagate errors when enabling the ETDM MCLK and clock
> gates during startup.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled to keep the clock state balanced.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
>   1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index fba51c552eec..1270fcac6b3f 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
>   	int cg_id;
>   	int mst_dai_id;
>   	int slv_dai_id;
> -	int i;
> +	int i, ret;
>   
>   	if (is_cowork_mode(dai)) {
>   		mst_dai_id = get_etdm_cowork_master_id(dai);
>   		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
>   			return -EINVAL;
>   
> -		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		if (ret)
> +			return ret;
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   
>   		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
>   
>   		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
>   			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
>   			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> -			if (cg_id >= 0)
> -				mt8195_afe_enable_clk(afe,
> -						      afe_priv->clk[cg_id]);
> +			if (cg_id >= 0) {
> +				ret = mt8195_afe_enable_clk(afe,
> +							    afe_priv->clk[cg_id]);
> +				if (ret)
> +					goto err_disable_slv_clk;
> +			}
>   		}
>   	} else {
> -		mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		if (ret)
> +			return ret;
>   
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   	}
>   
>   	return 0;
> +
> +err_disable_slv_clk:
> +	while (--i >= 0) {
> +		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
> +		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> +		if (cg_id >= 0)
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +	}
> +
> +	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> +	if (cg_id >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +
> +err_disable_mclk:
> +	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
> +
> +	return ret;
>   }
>   
>   static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,


