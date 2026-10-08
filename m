Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57122CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=; b=LKds5aaebm7lWut7Rc6tWePmxb
	j5fIkT6YO/JXCQxfRb0b4POShpkZKx7CqBD8tmUmbbmhJKZ7n5yMGd9zPJUPgxkcQD41jcDxDGsuJ
	FXvro6CCkRPIj6ZeD7W9LPXuMQ3M3rKoB3ynJAGQPLnn4yr18c+e1Dw8t6Y6r/KJsU0JVKBbvM2C9
	cTaHQxjIBFaTLqrM9/rEaYZ6YXZM6rvvm0yhhl1Z0Q844QINDE4tTSO23I4zN3ZOwmZewfeEzjP4Y
	OoFqv+jxK4l9QE90sYuBkNRajOGdUrmu8BnAAFlM0arTlxZKUT04TQ61kMXlKMC8+CarnO0Etthpg
	VnEAFaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmWV-00000004Gq7-23Us;
	Thu, 08 Oct 2026 11:42:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmWT-00000004Gob-093g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:42:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKIwj1269756
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=; b=At1Jql3EGdrWhOW7
	NuPq60MwP0gjrEGtwxAWWf68t5bnUtuFk2x2aOL7N/Gozfo0KvRnY3mCe5R2TsAw
	WorVmwJB5Cr0QabS6TT9dYKt0HasWXHER8ADk8h+iK+H6tZxYWNL1nlsW8ASvOSs
	rX2wc/ucoDS+JCKMgFpELxZNiU16nwCvoyIw9kHyDNWSPlIyf9yv5EjneiAMUxCR
	heUoR5yq81U8DPBeAeJue0D+vTu2ViXz2DuRxbVpBESHBarWMtiNXkpTzsO9xp0y
	7zeU9NtBCio2DkqClLdhf5toYm7cAjqeYBOezG8V7Xn0UIEXuwf6OibKw6+jC4mh
	1lDFtg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32n2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:42:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso661302a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459772; x=1792064572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=;
        b=cemnrIfuCR5jPTUqVJrrxN21e9Ty9z374aOJjF9iJZ6gKrWDUud80JonvoO0b1TnbY
         433wLBdHhKzUBr5t8qyhKhMwAm28RlQaehxxLN1ghjMErbKBCz1DIeDq603xqRlxsd3M
         OBu/4Amz87GrsiaO7t8M7Wnwyutqx0tM6MjVZ22DGbLVnzaHacqSVgxOOIUcOB9GxqpH
         ZZ8AhBL3rqfhmTgtLGZZHT2M49W/brZTZNFa2y15DE0M9KtLg/KkyIvREOZPQOOyaPWq
         Ehvso+PqeirY6kFT14ODOcIc2F1Dm3f1rUWMYbdkC56yEflucde+GYd/R+BwQBKXVQjw
         iN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459772; x=1792064572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=;
        b=Wwq5TlSLj6xEGScqnD+YfXDDpFdLlAFTDpYAHHFkwlrEgEsmi8UC5dtlZZS2OR70Zn
         J3pdcohWjRoArYbdcceMgog692hZILK7Yg0H/cAbuwsHYpgEks7cVbFQm2nsuW4BhiiU
         XUYRG5wen8QbvllISi/1jaNEsXu2UQnflXq7yRhWdWvcN6OnNRKlb1yg3QIleYAZui3g
         JeBZCbNfWBOexTUlN5NcMLSewozolUCQ2oiN8KwQ3k/wKxLfDSdMzHeH07jCvSottKS9
         NGwb9+/QDKqon42cVE8iPC0WvNrdmCwSf4fNfgIgw5LqwT3+T6hmanFmdKuFgirPmXmW
         AzUg==
X-Forwarded-Encrypted: i=1; AKwUvBxV2IQV9pArbkastIJzuEOMp8p2iEEQPh2HghoYdTS5FXRj1t/gFVONBwtWmdAL7xv0jVwKfo6WDiqkBfIihVXB@lists.infradead.org
X-Gm-Message-State: AFq9FYLEHiVkZLw0Z4f5l2nOTZnXgBYaRy37sAc3Hz0FgHzixbtPvtQt
	js+ZBQtSr2dygJn4xZqEA5FlnIYCZPXVFnTk0ooVmhWRm7hZIfxNzrOE8Eyt/c9HFpxxXqlRwUI
	RQwAh8QsCEQj78+YTMzRUcnVqI2sCtmNs1IDEmE9tjwmUtRw9PzS5nAu32ZJpDbgOHqAt82ivKB
	1k4w==
X-Gm-Gg: AYBFou3JslK0cBPljC6z+sSic/TqDmHYONYfnic5HYAnkfUIExkf1YNYVSnWK5Z5Kmz
	6FkGk7WHi3sNQM38Blun3iGvRKJuWOrUyhmWycQs1WbtuAdogERUWtOgh8K+V/wgSAvi5sHMQEc
	5Iv4mYilFplRaEGxzVaBltJLqs80IfjU+dLWUExUy3tDGpAogQKR/Js+/E59bmFNiNfTH6MEGub
	wAFv8v1n6FanXkpUIFKU0KRj2esL7o/Nj1yQckKNQWGPBIoMNYJ3VT8HCTM4Zx9Qf4QdO8CrCzX
	zd8kdzibehrTIYTsD8Mt+3QoqV2gzqRva88rkjRzhwptf2WeRVBxO/cEOGEnqySxw+jKmmqbD79
	bSFoDJLR0nkOWgIRLq/AnsKyPcTI=
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1220452a91.19.1791459771644;
        Thu, 08 Oct 2026 04:42:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1220424a91.19.1791459771026;
        Thu, 08 Oct 2026 04:42:51 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cc1fbb2sm3776475a91.17.2026.10.08.04.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:42:50 -0700 (PDT)
Message-ID: <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:12:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock
 error handling
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
 <20261005110257.50145-6-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX5SkCuqToTRcy
 TA/Pq5fFZyYkInUG55SWHZEIs9boMQKKqWY95HDHmsfQUeVYdt4TaFOJePJ2cdnAgdCFfcxedgw
 gkyZ11OVYbhLppAVOP9O9wSanoRnGy9HPOWnr2JU8e85S4dQfqpA6QTPRZUJsoSW7QWOz6xHrWl
 qg5d4WX2q1w/0jAjxVEhuMz08TN16yn7zhLX98P0cnv1wuX0xV0Yu8eI2+s5xihVS/RamAquVoT
 4+bxkKHsAWJvZUySPI93AQ6HlYBeSmIDIX8uSDvfHGipi4S1HlqfR3XjZGXNIUDvI1M6Mg43FF5
 lQrZL3CfVBkWvr0OqAQ1B06CVlCtiouroaG5oY3wDwcKMF9K8hb5ICShPiuubcqSaWeBmd748Ss
 MTaOXTxNZyYNMt+NatJVoYzSy+066jHrNCc34Yw3qxeVWUAvkkpkSric3xpU6ZP2VbOTXuFW6eX
 7K/JMlbz0LedhpDiIHw==
X-Proofpoint-ORIG-GUID: GCjOy8wx-Ngf4XJT2WBkOJF9Rrv2mFRa
X-Proofpoint-GUID: GCjOy8wx-Ngf4XJT2WBkOJF9Rrv2mFRa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfXzee0ZS3dBj3j
 jUP9LgNZpO3QSUrOC5xTobeOYR1Q+bbd4+8PaXWgDOG5Hcywcu8yU7f5JMkAifDhPTNmfVXvvZP
 cRI+O94/Cp1VPJYhDYWAYQK3stinECw=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac781bc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=JvgeKo86Odfbx7RWJVYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_044253_083836_A8EA82D9 
X-CRM114-Status: GOOD (  22.86  )
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
> Check and propagate errors when preparing and enabling the paired
> DL8/DL10 memif clocks.
> 
> If enabling the second clock fails, undo the clock that was already
> prepared or enabled to keep the clock state balanced.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 52c3381e6766..1d3e01e2c3e7 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>   	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
>   	int clk_id;
> +	int ret;
>   
>   	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
>   		return 0;
>   
>   	if (enable) {
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> -		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		if (ret)
> +			return ret;
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
> -		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		if (ret) {
> +			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> +			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
> +			return ret;
> +		}
>   	} else {
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
>   		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
> @@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>   	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
>   	int clk_id;
> +	int ret;
>   
>   	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
>   		return 0;
> @@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
>   	if (enable) {
>   		/* DL8_DL10_MEM */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> -		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		if (ret)
> +			return ret;
>   		udelay(1);
>   		/* DL8_DL10_AGENT */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
> -		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		if (ret) {
> +			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> +			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +			return ret;
> +		}

This makes mt8195_afe_paired_memif_clk_enable() return failures from the
paired DL8/DL10 clock enables, but the return value still appears to be
dropped by the trigger path.

After applying the full series, mt8195_afe_fe_trigger() still calls the
enable helper like this on START/RESUME:

    mt8195_afe_paired_memif_clk_enable(substream, dai, 1);

so a failure from clk_enable() would not be propagated back through the 
DAI .trigger callback. Patch 6 handles the prepare-side helper in 
startup(), but I do not see the enable-side helper being handled by any 
later patch.

Should the START/RESUME path check this return value and unwind the 
trigger state if enabling the paired MEMIF clock fails?

Thanks
Ajay Kumar Nandam


>   	} else {
>   		/* DL8_DL10_AGENT */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;


