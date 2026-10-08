Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE232CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=; b=IbOjfP4MM3Qr5vFqO0tYDANPAn
	sB2+d0XIPP+Wd/hegGG9LtXg7qhpp9kvjSQ/qHJYNoQF/7HSLaByJ5XR6ztpwJJSXn+6PquF4pWS/
	wiMMCafdhm+J15VpiZan7ZFQ5KCgMKGX8y4SOQWDsl8eWlSgVRHNlfKk0AB2U+iVrT8qywXeWFrvw
	+e9jZyWHGCF46Rqaxk1+4De3D4i3lFYqsEkcRaZyO5oJmWbI6sUkEy+1fprwNz+IjtX2TJd4rgS8/
	mtv71trWivfZMLEWGrOegn+97FcPUax7hQEpbsr5PmOzTlq+aeD4JRYBd8hL8Cqwd0wAjgjafo5xW
	JrFWa7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmqs-00000004Jg2-2I1t;
	Thu, 08 Oct 2026 12:03:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmqq-00000004JfF-0DKW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 12:03:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKABK3733035
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 12:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=; b=ZB8HrEaFAa5wL3qp
	5OwDbl0eAnpOsGCz0KS+PUlQC9X+zwDXXT8/Ypq/hRXKNAT3kVv26VPPpLubgizT
	5/Cz/MGvgQl7MPjTnIHXVwavRGsNVpVvnuduiQcOCarMI/H1AykaoadZLY5WWyjf
	2FmBkPDWvOiNekarQnVrljgOSOfnfjKyCxI2FsNizaGl8xWQsQZmPjeYe2LL5Xt1
	QjLqXmI2ZyWTtnA9JOVhOnkyBzPkN5lYanvustmEOoceXLsawXLN+IoRQePvrtwb
	8jZAtBACYiyarf5iQDdccfYrqzsdU08vZkKGJ1RV3FFYzVXCOoSiRBEBovuJMpmY
	3pXc5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6atfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:03:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso1678187a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791461035; x=1792065835; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=;
        b=UzVzYDfz0zowsKeppUksfb5B2wwKwSEfq8eYGvFpTi5MVoduMo7oRLx3IqibebQM97
         1zDIN4edmX4lmKi8XUfCykHl+GvTYL0ae2emiahrteW0u9/RBGb7pE+pmfABJioTQWy3
         9q6SwwsDpN67uW+Qm8hD5df0KrOPmWMOKPB68zAZ+WuC4tSbvmiBu2FDP1XTAKrNprk/
         1xyYYC0ISRnsj5efHJxs5KSkUax084LYAJWzGOObgCZUaVdQQzuXMNVtQYiIVpijfOIu
         81WieuGTMSkmetyNisfkWeRQ6l1/IfJnz5z6EMI41tsrDynl93Jic7cVoj2EX+ifQxQD
         daJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791461035; x=1792065835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZKv9cqgH4HTSKDf2wA9wGyhNJ6KF/zvEMsfNsfC2i0=;
        b=jQBu2XWmym9amUbjfA1xpoUNYpBM2lp4R4RwYgI9/izWgtViES4IyACcMBWh8mnct4
         w9u/PTlfy/b3uWYq+5yErikwJclDBphy/IY/6+imIhiyv7dFlxc/qXqtx8hUrpCDPyBf
         dZqHttD8Tr49Z53Gq2DkJ127xW3zSmZnUkRUAHSCvkjFcyZR2a9XHvadaJQal18mesF6
         mECAbU28NS3WaX80RPNZ8l2YC/v+GfG81FCwxDusYE7TO5u2pgzcEQLtQB7B5U5ImKZo
         Htg2vQaaByKtIXVuNkP4Gt6ck6MECgmsrU+N5b6NHgVOmT1UJXDp1oBmqghfcWSO4Nqz
         DyJw==
X-Forwarded-Encrypted: i=1; AKwUvByRVzL2/2V5M47JosklX1ZJajoLLnGivylTl4wK5i+K8GASxifpuoWTB8ESm8+uOXdgxUgZpWqPrSuiNEf50n97@lists.infradead.org
X-Gm-Message-State: AFq9FYJevSTPWper1BLQ70HYjtOKiC5Z+Uya/GG1T1vmoMzCyDZn1w/T
	Nf9oTyXhT29lihKtPFMRxQM9k70ubg89gxa49nRLlqYkK8WAf8xUDvptVdVriLa5DbEgEWTyjZE
	QSK+O1ZbXKFhq8nvxQyN9bmyOqXe1SjbANop5+PkH/+g1wDo/7g8I7SOQt/ke0plefnQIeivUJS
	I/vg==
X-Gm-Gg: AYBFou1Ut7VXyPCSFz5UAp6g5eTrR9rGIadAzDanja+uM/zuYxroEsVhXpYwUeRm54O
	alUk5Kp0O7P+6tUUxkg1l3NtVt023GExqaofUmqYryijtvT6TANuXePOlUCoCjHLVFz91tswNWP
	EJ2Bfk9sTD/HhG9S9TD02JSnNnVWDKBSOAkB3tAaPcvYu18P7FlHYrd14ISSFXfOfb6lFsNXt/T
	Ve+E0QD2HUdOjJyhUYeYfY5P1UCnMKTfrdTG05wPQiUintE7Ds132BPJhcI0gm5CUeeRKXh0CcI
	163s4ATufXjHzPtEBb5ssZ9htMs099BJ/sqiyFtDAf5TKPXlv3G9PJwF38Iofum4/UJTo/78eq9
	9gcoJ82nbbaaWhS0nFyqLFZwi9go=
X-Received: by 2002:a17:90b:4fd0:b0:3ab:188b:c5b2 with SMTP id 98e67ed59e1d1-3ab188bc8efmr396397a91.49.1791461034784;
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3ab:188b:c5b2 with SMTP id 98e67ed59e1d1-3ab188bc8efmr396354a91.49.1791461034281;
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a9ba4f24sm2810782a12.23.2026.10.08.05.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 05:03:54 -0700 (PDT)
Message-ID: <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:33:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error
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
 <20261005110257.50145-15-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-15-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -b0ypC39R_9Yek3SoGJTdmPgsCsYdOVc
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac786ab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=gEnLFtKB0XLziNsE2NQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: -b0ypC39R_9Yek3SoGJTdmPgsCsYdOVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX9HRUs0upJFJS
 y2bhDKGrUtsRpSbQyrBseYBWlHxmkwiJssgLQdDcLCeRg+y4Drr1BKLRPU81ZOt4c+qAM7SIqKY
 jTSQUWiY9323OyU5e7y9w8cz74jBMznJ75jHwwiYHskRJ208t0YKxKtCEXvv+YnYDzjavL+eBzQ
 KEsgKRBaup4cIXbFi5Q4znhc5/qdYRcxWv/KNyl3SBoI0U1PJiugNUAttFZpVZhngFisxHqXwV9
 zgYe4hvJaA+eX80+4p+vVNo5xEgvP4ophcleyQbuvuuj+8hPHcHHACZQonkmdvY4vGA09Gvryp+
 6P6ohEBAvCKRFMnYXHnQBa01fjyUXmwayLvIsrUm6W1R4FpEHyWX0ay+9MrYrZYVi8a9S2YyyMM
 F7dd7rqOvi1wlyQML7RwXPNnSONZVhJhy/I6kJSHShiWHRhu9gyZhSFE6x/4+pA1kWBWb9VsWb7
 VX5Hr2BEgrVc1LABwFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX7OopmDR0yCq8
 5dqXzt6AoamYPVax9Q1yEuhUDcm+G2+5QyywbNlg9msWrJHoEySkk9EobsRujFV6y2qPctqfv8B
 0HYS7Q5cKaMYWIjsExjbF+nqpcfqI9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_050356_101535_CD37A722 
X-CRM114-Status: GOOD (  22.58  )
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
> Propagate the error returned by mt8195_afe_set_clk_parent() instead of
> ignoring it.
> 
> This allows clock parent configuration failures to be properly handled
> by the caller.
> 
> Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> index 94abde15ea09..8a58a142064d 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
> @@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
>   	default:
>   		return 0;
>   	}
> -	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
>   
> -	return 0;
> +	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);


The commit message says this allows clock parent configuration failures
to be properly handled by the caller, but I don't think the current DAPM
event path propagates this error back to the operation that triggered 
the power change.

mtk_audio_hires_event() now returns the error from 
mt8195_afe_set_clk_parent(), but the caller in the DAPM core is
dapm_seq_check_event(), which is a void helper. It logs a negative event
return with "event failed", but it does not return that error up through
the DAPM sequencing path.

So this looks like it improves error reporting, but not actual failure
handling/propagation. Was the intent only to get the DAPM error log 
here, or should the commit message/code be adjusted so the behavior 
matches the "properly handled by the caller" wording?

Thanks
Ajay Kumar Nandam

>   }
>   
>   static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,


