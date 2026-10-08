Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0025ACA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=; b=4OLJMGmbJzhrzMiBT/ejnLLVud
	RjjOsNq//lP/R3vd2vTVaOOw5GBDSHVoqPlHhgdbt7TtzYILP/Be9W2Qx+J7MnRVef9KoEcOxHt2o
	2Fx0uEmhg/ghzmjewI2Y4AyvYABIIU2dOqy2MfOW22QlBUlkC9cZCI/a+msWAz3NWHQIjIpOe50wq
	dmYc8LbtH5cX6C16wJHe/qYvY8nGvOY19ljUsiDo5UZUiz/PKAeh+7tCzLMSMNneu0/5mguvklHon
	vrl+g+/oOcX/eCsdXFf0TsKdm9lZQ9+oFwXENnjr9fMeuIZQ3zyzZ8l/3/PZkO0sn+kPLFCgL0mam
	OL2D6jLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmcP-00000004HdV-1DhY;
	Thu, 08 Oct 2026 11:49:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmcM-00000004Hck-3Znx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:48:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK7BJ1882229
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=; b=akue/Wrx4LlADWhe
	kc1Qhr/HbliJoEWUnAfatjZVPBrg4PEcWq3UuVdOhvPgBMXkST3yW6J98j3TXfMH
	UarS26K1NApJT87nwcT9pt2V2yb6YKqfBJIVRRM8ZXRbTVu6NnpjZPNziUe5Rckv
	AvWknQoyiMtViplbVMMcEl1X+FU+bvNXuCQhsi20ZVNZ+pgxXeRnu1F0hFK37tcl
	kPRu0KWpBDzGhzkebWwI8ZvinfHHjwOlzy4p/sjiztyxwJv2gXZzH8C7TwL2Rgkt
	mO6a8imA71fYTcrNPTXx+2/gJkkp39+p8thw79kLk56gqyC2PIByW8cd0QZ4EMAc
	ojqhww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tqxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:48:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so8906147a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460138; x=1792064938; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=;
        b=cW/UqvxJH49R1PZxRpDZi9OVhN9s/cdCChv1I5mtQ7qMV1SAfuQ2pziSt7fldKz/xh
         /pOgFTSQIfMzAK4X6JweItWTZOoHuoZYhMVzdsotnbPI44x0j86+1G5WqCiXq8/kgJA6
         fOcKhuuJ3nUuyUV50ruDyEQ7WKJ4B28G7LnOwtg/SSWczod0rOQ6UPwEFentMrjbK5RK
         KIOdLeGYS7sJ7CjeemfO6Ha7nfI3y+cZxnEzbg4wNAM/oj8kiJHujYwdaooJOVCgPwsU
         cEyQXID12Y46zeH//Z0jfo0qFm2ALoVjDTlZDbymimiM3NDp/dXMZwbEzi7UMBhgck9G
         B0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460138; x=1792064938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=;
        b=1/4fe/GZM2wSU7zWo/P2xRnVNrvaCAZax/v3UvBlfdpV7Z9rpigAUQWUKwfEp8CwNN
         pF5I57sMGPyzka9OdrvQbvSNKDQtLMLXcCqWgOw6xcFTrW2t5ScFCYpTdZGEchA9K23/
         F0bGn5RcldVS8rq5rNhc6L5SMqO7VAaBLr1QGoT9sPKYlUpt1VLLazikNzKphssrTCG6
         je+pwU3TNhRmNtHHXC88YW3xRge1KjVxnZ11BqsapE+ByuG816Q2QYk4z23+d5qBpOS1
         mdBo5Qib0o05POnMkgIcLcbCaHYHnc5QNVHlg6CvPalX+lnYK5tMIaBSXGBVvqOk5sXr
         pcgw==
X-Forwarded-Encrypted: i=1; AKwUvBxE+3vQ7nIXM+ce79CwKtvoR15KfekeornLTP/u98cAO2zKiANrSMugPsIHFoycy0F6bqaLgZNzmtq95ZeahV9a@lists.infradead.org
X-Gm-Message-State: AFq9FYJKH4y6yaL8grobzZfl+rogX8TnwAYqCUyV1cq9JJmh57HNoEob
	yL0MQISalcku/9kQmYZKPd/7lU3lQ2WRIIhDFOzNEVrb05MQtSD+TNB49cOHThAImjI7ySrC4YX
	ltt+alHqiz0gd3DaOXQw6V3c21hFl5nBk64t6gdvRzdgbo0cRHQ0s4dub2TLHaxpRAZIlzF04t3
	/Waw==
X-Gm-Gg: AYBFou1fxO70qipQ1rHhmysqrLpea1KNT/dTHwW7kVBfe33IwkuJsP4Lf3jYR1jK0L2
	xt9udLrQAZmTgWq4tkg4ijsomWbjrhif1ws+DkP4gujr8GzqVuV4J1aUMbQAYmixbS6kdXjU1qD
	p32ADqn9PwQy6IPHLDJ20dfZvoiRgFyOwKxYqlvJ6djGRE1rcfUnfAnOXuEyYNxEuqP8EiiGJ6k
	9+A5PGjSpgzLlRjcpXVpMo2aqu20nIct4RAfW9pWT6UXtvvh86ikQHrAy3VplxMPXYwpQOCyEGr
	M7xl8ENapXt8+dgFpVuoS2ZYH9DF+PCMN9fi+5DASOB2eo5Dl/ResBLIKK1nXzci21DCbIfwigt
	KDzCVg5J+nWSnJtdhtizR035LT44=
X-Received: by 2002:a17:90b:3d89:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab0c809900mr758600a91.19.1791460137610;
        Thu, 08 Oct 2026 04:48:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab0c809900mr758586a91.19.1791460137159;
        Thu, 08 Oct 2026 04:48:57 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5cd5c3sm4315881a91.17.2026.10.08.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:48:56 -0700 (PDT)
Message-ID: <0fdc0f3a-48b1-481b-8ef0-8d415d99e6ce@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:18:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] ASoC: mediatek: mt8195: Remove redundant error
 message
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
 <20261005110257.50145-9-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX4fhpHo7ol0Mo
 NOLzFw8n0STyl3q6IANSznJxPnFSqDXA5omP/jkU3YNxolvioskR8Q+9Kh8fxsR289A9rTMkkbo
 cBIxW3lU0QRTpMCvY3Zqm7alCjRmPEM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX2/+T3ItUn//C
 y3BZHbSSe7h0WgzdQgRn+Bwuy7iVNyWQakTZJ663SfU+fNE8nXFg9nFsXf7ORcF/MpzyFsK7sXv
 R4k5/vrpWRF+keFetLmgN/IoxbrFwDgzWHF7giO8V9guBRVPSuKOV6Q5YWKu7Nw7dgL46l4hDJD
 hk3krgg8Ykwv7MAo1rq7yOaSOSl3QOm+TgFKFVRobO6JInRKJV8wwReeJuMXUH/Cz33ExS5/CDJ
 HarvnWAbiPSamL/tYvnthBwBRiufeI6opWSwkHIKyCme6FDFN+RkAGdMkr4V9JThyFysUOeDos2
 86b81G5gx+97uShoajciklH2MlKzXDOjbTBxjK3hb/H2jDZJzdmr/Ho1Ncsfn+3/HdYh22nym7M
 TJQw/PTXLn2cclPRLieSZhkIIZdDNS/pGewp3XgUB8Ay75T9xHuMZJ0wL+toOXNbBdmHcF2+JJq
 k+npaxtyORg3fAqaRgQ==
X-Proofpoint-ORIG-GUID: YUrnaoLQpEp3gqEUq6wvWCI1MNn0GMoi
X-Proofpoint-GUID: YUrnaoLQpEp3gqEUq6wvWCI1MNn0GMoi
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac7832a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SQuuAJ8L7pDmPWVkXYcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_044858_900860_6277FE9C 
X-CRM114-Status: GOOD (  20.70  )
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
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_warn() and dev_err_probe() call is redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index bb357cc674cb..1bca2f62e76e 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* initial audio related clock */
>   	ret = mt8195_afe_init_clock(afe);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "init clock error\n");
> +		return ret;
>   
>   	/* reset controller to reset audio regs before regmap cache */
>   	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
> @@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
>   			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
> +		return ret;
>   
>   	/* init sub_dais */
>   	INIT_LIST_HEAD(&afe->sub_dais);
> @@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* register component */
>   	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
>   					      afe->dai_drivers, afe->num_dai_drivers);
> -	if (ret) {
> -		dev_warn(dev, "err_platform\n");
> +	if (ret)
>   		goto err_pm_put;
> -	}
> +
>   
>   	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
>   				     ARRAY_SIZE(mt8195_afe_reg_defaults));


