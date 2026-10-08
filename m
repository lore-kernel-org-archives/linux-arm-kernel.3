Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81255CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=; b=0hpsayhFA9QDUeCHu6L32c7tPk
	JUefwmA+/0++345bHe5d5bbk7iPYpaQ1rlvO4OJ1tq0ys0hlP/C5gpVPtvwsx5EWE8Nn+GWro9m/K
	JU9u83xnNJz6YV7sY7bCqknVr/hA9uyki+/6kHGuSnGugvpQJJwb1828nub9BZIrqtMzoBESehXpK
	d7OimIJeazmjT4RF2YU88fmtAvuV2LxXiGe/Wb16qBO1RBSGhQrdQBo+t4mUGGlho0ovS2NwoQrrh
	Kdfljw2pEk4AnaTYdfnMK9fb5sxN0KA1Uer2peblqW4AgIaZ2Mv8aGaeKNFmx7ZZ2EkaFIycuIFTr
	b9r0uuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmhd-00000004IIj-1xcs;
	Thu, 08 Oct 2026 11:54:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmha-00000004IHZ-1vbK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:54:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKImI2384271
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=; b=N8e8+fBh6SfK0Lv6
	KsPvsmj8Xl7TCdUDRDqXu2u2MTAXKhOxa2LPWdFyHxBzwaX4yMhfyvR8ksxw8Duz
	nIBo67XHK+sVvNOWx+UlxwBvKAyrcCvAZpFxypcXJTAIs52M7xlbIrjKuGtZbKVe
	qLWroJ6R0qnMMD7KZzzs/7gkuubtD0rmavcnO0sBgxTbLTvJQpewigkxHYjJ8sLD
	eHddYT028+wK0/4gn7gu0iOTDGLwyECTUk5JQ4r8/zU61igmtNaEceQhTYqNT6dI
	WGXsw8Cvf+bGFrgrStJrq1EGYNrYyr7GYwl7uZyTfjSZMz0n2TlyOw9EQk+qGxbn
	soHCmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ju8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:54:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so6133611a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460460; x=1792065260; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=;
        b=gkj3ve6l1RbnEDrPuu3J0Fv7fG+TlAmjzDPU2lOb73EOzY0uLAXcB2cRG0uCVLJAZO
         TKNqBKOVPIZ/qihnjlCQfwANnh2Ik1SsY4j4U7vC0WlyPRz96vkon9AyLtP5YoaqSzfD
         XRpl1QKp0hTU3RIz8J3d7ZUWXQn/qjTOD3q8oljIIH5SNz1dkmocRhvJ6Vr/+sOugc/6
         bOsFF/900fyECP6M1aw3NgJ7osm/AgTMFiwLA0kvy5ryyFAtetU7V3YgW0/FoNwOVZKv
         S4WsXnsHk/kQYA5iftSBAro754W2GYotkvhb4rRYpDc2uGwODg9bTZvdyBlrCu9FUJF2
         XDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460460; x=1792065260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=;
        b=ZYLcfdaPotw57hpiIAYxx5Xkw/d9QMowHkr26ymakGmxTQbbsyOoVohPEQoJTeFKd8
         G+jhhdUuLpU9mbajtddFLMRYCxqSfo/dGGMxYDTe0PbOh27/O6ucNdSLGAFP4Wh5EXl6
         PhDqTjddFPA8V9+Bql0gaD2OAoskIM4JDV/AVksztE4AD9+bpGZkdsnsRXa+Mq/H8XXh
         mFBclEYq6kaye4671zvkgeHSKXOB/+V3H03PB3Mpv9d9EEov20LZZAPlTxi5VdkRZruf
         rLa8TyBXIxQ0+r72ZAUbsbrAPeKFueupIKhcoAvJ5vH1cafFQgtJFUxB3viFKAvzWQlh
         BanQ==
X-Forwarded-Encrypted: i=1; AKwUvBy61zCzI/AdMw96z5RRkyPw4Bf3JXWhknleabSIOtnAwMvb3ks0mOa9+SDNLUK5SZZdSKsu8tBD901Dbf3yy7br@lists.infradead.org
X-Gm-Message-State: AFq9FYJKA9wIjbjYTTsf0oBQTGO4Qg3WE4EcUzDJJNfeTP/147GIr/vc
	YfQiCVUBbfQYdkibk+j5C4Ya+qywLp/pET9rvErPqE95YUfHcJ5LRTBIRoaDjaBRiBBG7nJd8gN
	M2RydggrQSgdqitMW9xjlZx3+IvOXhx0oPAqEb7m1FgdvZviMBlJJuZa2tQB6vqG9W4C0lgQebO
	fXOQ==
X-Gm-Gg: AYBFou3vAzGSRSUxohn0r74uPj9PlA3R2MFsqWr1VPl0swNWWudP2G84kQxC3y3Qom0
	s3iK+nrk0zsDUSJrwYjRkdzxJIeXQgeSHf+mR4E9+ezjZ3AykZtRoiHNxjZ43sGwz7csSnswETC
	2SZ4O4+IQokzMboN81PYXTHgyy9MfJFTm6sYtnhqVkcPALFbVEReRYR044DjXFXLwNJI10jVAtV
	t+TWp7x+Or/QL48gQPrmqW2hBxf00atgSmesAOiwpODwpCkbAB0AIB3owyF87osuv2EP1ElnJzh
	EIBveIupTm+Apxc/EhQwm1SvlU/Pu5jYjED/6ayxmTJGemabgbeGsqNSxoWr61yQQ589aYgp+tg
	2eRECIyQbcKpIbJ13AzzVRlJr3Ts=
X-Received: by 2002:a17:90b:4b83:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3a89f649778mr4613695a91.9.1791460460123;
        Thu, 08 Oct 2026 04:54:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3a89f649778mr4613671a91.9.1791460459686;
        Thu, 08 Oct 2026 04:54:19 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5aeef0sm4180880a91.14.2026.10.08.04.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:54:19 -0700 (PDT)
Message-ID: <3ff784e0-142b-4234-8597-4b12b91dde82@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:24:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error
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
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXzwDZ+BcY3eEg
 gqcD1C6dSb1Ja8r+JgLobGInZRPwtmd1dDArNeul3DGoCJ9XKNxoWHClj1WPFhkoF3npZLAcWVj
 QY5OgE31j5Ft2zpcKr7y0D1mZO1Pqt8=
X-Proofpoint-ORIG-GUID: _WO4E0xzBPJ9p3-Dw4kx8_JhVKoTfPLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX03Vm1RyXNosb
 1dax59TdENbIueE+QqrAiYuHLaogbcNNj77Lvs937CZUFbJ+YJN2fZRMc82NKMSaePQOTEXcbb4
 N18O+HVqx8y3ECPohQD7dbUC3MCb4/oqRxlG1F3rJy2A5okzz4iFdSpfyFY6wNyQHZVonpKZBDF
 bsEquqZKlg3rNhSZf1hqKPzRl8dJwjbg9w8l5TJT9qwLFyzmIWDMjuoOF9qLaVhZJEGuDohdKEU
 53W9ga6Y1e6RZsvIdvtl7nRj+90SYt19obP26uQpZUomqxoOKD90DKtWnBU8TOW/bI30sh1Bsqb
 iYJrdqvGQkUoT0Qqtu18mvdU/HLzmM3UEZuE6rs3pAcFMv4cxOkV9SfRry7Zd8SJqXy0blE+YTp
 uM1Vtg/R3lHMl06JAYzZB8a7/cmv4OI85GGLtenLlSbbTYZQLowyM32KkvtOOKgmAxzUDmdfW+1
 /G+iIS1BImLGt71v45g==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7846d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fkDIAU-C-wBUwbiI5OYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _WO4E0xzBPJ9p3-Dw4kx8_JhVKoTfPLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_045422_620756_3696C525 
X-CRM114-Status: GOOD (  18.12  )
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
> Propagate errors from mt8195_afe_enable_clk() when enabling the
> ETDM MCLK instead of always returning success.
> 
> This allows callers to properly handle failures when enabling the
> MCLK.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index 1a20adb2cbf5..fba51c552eec 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
>   	if (clkdiv_id < 0)
>   		return -EINVAL;
>   
> -	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
> -
> -	return 0;
> +	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
>   }
>   
>   static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)


