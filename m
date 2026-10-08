Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90228CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=; b=igrLyqoIDMPaDBwwIwpnbglpua
	g+86G/+LLe2d5LdhkT5fX5AAmjjrwFSM/0s4CGyaNoYcJbxRzbtvkUmvxawz3tmxKrJH9+NpJ0Lle
	Co3Znxi2D0VrMzCuRvbY6JBSxvMIydXRS5WuQNVzbt4ZB+kco2Sf27hyptybPvGcNQap/1mT2QWnZ
	pQcH7NFTubaxRFxOXUZfl7PMoSpHHz3f5sjKxXYiGgwf/pc3APE7LHSZdPtwlxQHgITQTCMkPrvo7
	WtgEPmLHeOV924sp7EMizUVeK7O/QOpy8rN4a3OUeX2qgcTqkFWMICUsQcmzbZITH7zLwfPxo7Br3
	C0LcdgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmeO-00000004Ht1-3hWk;
	Thu, 08 Oct 2026 11:51:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmeL-00000004HrZ-2R52
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:51:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKJMe3225005
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=; b=fUcqI1O/4rl7SyIx
	NhvkJS+F42bLnU8/JqymQMwotM2ZGA3Bv3GJEabhst0ap0I9ZyiPdqo9RwxmsHAf
	RG1uyKqBvm9IJ31XbftFhTJFYMKMkn+KUSIzZkoI5sO8LEA4z9hoEJ0haBXRMI65
	bWQSqIBFcPYKU7+6ZwX6R4mThDR5kBs9FzWRo+uVyj9gKJ+tdnR91G9OfVXCEeOp
	ULj264Da5qCYqdSWVE2iHUc/9Rs2p2SraB2dlfw/pV0O48FI2hiV/nkBF5A2rQnF
	ddYbUzLNV+A5+uKm3P0EAs8NEG6Bp4voHyTEjunTlkbHW5apV7keHZzMwt46ZBSn
	tvN34g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42rgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:51:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so7778835a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460260; x=1792065060; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=TSvCyjKGTQfQCD1SZSt0wfiw41Zj5STGyAWsegcDwDaWwUuwAzzsUFs190B6SX2rRW
         fyZEj+WqvgXvaK8VQD3Gm8qR1W/D7UxGQ8iKdh8G0/NXUbsq0p+zEgMw3T/y3tckAaPI
         5QJB4HbeHby9TcRIQVIzfKcQmq3u/8OB5SVNmeP5nAdWu+qXAZEvgDcpzM3/WmPvUYR/
         ySsqfKTdojT/fMzDKVSjqHVFlj/WjOioixvGPWDIDXrG4mqkuuKgGvPM+66ZNbiECSvR
         sL4CN+enGEO4KqUtaSn+cHHKf+4yWh+xn/h/zrq40Toi576GtZ/4LVCmdlvIvzgMhPUj
         MKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460260; x=1792065060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=DwnpziEzm5r0lgCbNvOOn2yPJaCFEbbDG9+g7EMXqunYa9zwman9t13XEjQhdCufI/
         S+SiilJEAN9HatDiTe4bJcNSiYS9vM1jkhDb+UQZeOdXGBpSGB5QjvER+lCosparz28g
         XAeXqJecYBvpTtpCNtQVYFJnILGJMniFForTv0yA8ZnKld7MofKruUeRYh24eVy0W1e/
         x3RKGPM7IDhiHJ/KQk1T2Gnd9Ws/uz/vVFr+CwrCYxzBEAOD76o+s8ubTmQpwDnHYSms
         aGykXPaCmyTb7sSJXfiWuMx18Jc/P3cCAGWRIACrj55KJUILreSlUOZmpVEJ5IAOpnzt
         oh5w==
X-Forwarded-Encrypted: i=1; AKwUvBzoiLwQ97eQg+IjLkjULFYQg4oJvYx0l8nAR2nTQuWuIcSLloIO96avHRwMkHQUlCp82k0oLfJlodYejaqOI9vU@lists.infradead.org
X-Gm-Message-State: AFq9FYKavpfYnfrg2IK7vS4hjWwX3muOxpORbvzzEUwA9bw5TJ9DJkVo
	OQXCR3XRh2/j0EoNQEW8a1OVJ9Mi8eOJo399x6NXmaf7M0s5ktp8AcvO9at3aPcZKImCDvDPAMa
	MqrIyqPh86bpSWRxRZisA1basPxHzCIrpPnjDP+G1dns0mD71vLvHeeVP8yBRvYZ9zIEX/Znc+V
	5gdg==
X-Gm-Gg: AYBFou1ujmz8jq/0SUUJf9s/ew68y7r9oP7dYFns6RKu4PiTikDXru8JK6q5abhFNEm
	vkIqG034K6pC2n8QqjuIvArgdmS/EGFeKrcoICF6XM4V/p3p4Yc9aI4xjnfmD/IMF2+X6E2UVPt
	bn2eAZxxEVwrCjbfaNK2gxfx6T95xvgTgt5JwZzDr5I/871l6FYbFIPNNgN73xpyS7idNRkvwbu
	gfZI2VkgWrY3CYJLyzRBqawRBQ+dB68r0qV5pYkxR1wFAeIf2c/sE/r2IpnSoamVcs/QkbQEP72
	K/02mCVwv940A1piK4B7VEJN/j282482Hb0D220Y+6F9q1DIP9UZTUUsLGkB90Ro7KY1paER0a2
	smidiUIUHyrq5yWO/ns2cq3QDwQ0=
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232230a91.6.1791460259589;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232209a91.6.1791460259138;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff817537sm3864991a91.8.2026.10.08.04.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:50:58 -0700 (PDT)
Message-ID: <eb3bb86d-3d73-4dad-8041-8d8e26c2cd21@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:20:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup
 errors
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
 <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CwaDH8H196fMBYCY_Zq9SexzOieHFiit
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac783a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fkDIAU-C-wBUwbiI5OYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX71OCjWeO0L19
 mj09nUl7PpMlTn8h1BddhW7hteAKk8o/zZxHdRCi55BCwdwbMwZ8fgf72gJIFakAiaCyc3huxy9
 U8Yz3dtf4M05mNCOR4D+PY2VHOu33vA=
X-Proofpoint-ORIG-GUID: CwaDH8H196fMBYCY_Zq9SexzOieHFiit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX4YTVivheNXOK
 N0xRPP0jA6yv3iMhnzOTgR73OBnQDHuKpym26Isg2mRV1Oqo//lUOrsM2DyQk9ndjRK5oarvV7p
 8QRFj3t05YTqpQhIxJIei6+zhiUPS+X0/ZGVWX1WRH5qf+wM7LF482NBf+5Wh4WRTwKZL24ZYKQ
 AJDe2ajo36AE8Fpw7YBZVex76p/dF/1hpV6on2oeYBk/9XNga4i4x8eUhhyEDtT/KvsVSUGoSr9
 VgVB1SCedk0zI7VD3tBB/qx4wqizTi6vcX0/3maAOwcM/vRHIagJpkjUZedUUbVbYIgUlYQSsVT
 4mqirKy/BZ6kyzBuP6EQz1SMQ+yP0ZY6kLKOU8kGSCTG8Rq2M1hUv8pe20LtUSdcOivAlVi3kEv
 A9+1w4Hz92k6H+mAx0ph63OXahOtVsHbdS5/p7G70yXa2JQCVIF3NsJd3lPh486R5PsHPyaR2oH
 x/a0hD/+0SPG8o8yUqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_045101_731935_9908EFD7 
X-CRM114-Status: GOOD (  19.78  )
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
> Propagate the error returned by platform_get_irq() instead of
> replacing it with -ENXIO.
> 
> This preserves errors such as -EPROBE_DEFER for proper handling
> by the caller.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 1bca2f62e76e..4ddf2114a1ab 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* request irq */
>   	irq_id = platform_get_irq(pdev, 0);
>   	if (irq_id < 0)
> -		return -ENXIO;
> +		return irq_id;
>   
>   	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
>   			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);


