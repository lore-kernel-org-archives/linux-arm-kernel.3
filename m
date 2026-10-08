Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBFCCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=; b=GHCS7/iH5dLy+VFNDEPypyAez8
	Kr+TWVe0Wtkm5/HySlpgvqxcYuCFHYR01oU6edQTeBJ7sR+o+GSJJL1S8iFteJjN75QFRZ32Iro0r
	R+YmNTn/nFJwNHI9c34tkqtdq12UKdaEZiCwgHCJ5n4C6AcoVY94hj7YHZ3JiwBudZIz0H9KgCgtc
	VwZspxK9CX/YlGu489kFS0TvxUrU2WYqJB9b4aYGZVrlQfOV0Vdt/U+wOdzSa7RYsgfgr4K7zyx3i
	ae6CyDmg8fpMLRigQQFLBmg+D5f+2KQG+IjNM24x5Y3KB6z5yJ7Pfv+UQJwgz3R2jBdIv8K/GfZ5n
	gld1r9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmDe-00000004EQ4-0LdU;
	Thu, 08 Oct 2026 11:23:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmDb-00000004EPE-3XCR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:23:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8DY3099351
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 11:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=; b=VjHjNCFEpz2ijCdu
	HWpKMMEfNmoXuKfLgB4mFb2PXcZ/QkvsW4sWU9+AGlaa+DTwOOyDpkh0fXiqgMTx
	MVdLeT+VzcqhvZTrOzAaAOeEmyefHZ/B4TM2bQybvFKYsl/FBIg58Pq6dwmxAbaY
	kg5VJfzLTwmANbbiHSSAVccKp3mrC/JdKyIVcEDgVWxs9oT/ABj98+96atHb/mM4
	valAhFMJvqcXcyeEQR1CYipzUyWtESOQ/skMNnXV158o6BTJj0oMb2DotzLi2+es
	DJCNIc/6Bzz7is4ckqFaqDJKYr+brUJyAYzA4mjXdImRrNjtMArkmtXFvRbUA4zo
	xdprLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82kch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:23:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so8392a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458602; x=1792063402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=;
        b=emlQH/EXfu9cGXT5avXgi5FIydOvT5/g3xGr+f1p15L4YV5IzC0zQ5PKUStnEvqaE2
         6+AUioNqT/wkJEmapkHDhQN8xt8J4AmWMxT0QdYbvaM6P9NEzCvE5bHYdP/3UGMDrbVb
         P7ln69S3fAo/bJ1f+2BXZdf+GK88EZib+GNSk3DCr0lPNSXEy7Uq2qU15zizOdeW9yXY
         l++DEbjFZwQirbCJZTNo1htHBd8C5A30EEa5Af/Z/gmnrTRpJsjcFmezwvHiX28QYgQL
         F7T2xBTK9bSkPn5L/ppRwVkxNCZsQCdWc5vH2S1vNx0/TEiegvrnJPMcBnxRs0JyKG26
         LiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458602; x=1792063402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=;
        b=mCf8mxYuZ2vVp/jz/OkqyaATDVL2oZeM5d4vmVaMV7FD/GSCbBVSfPekrfaRKHh4OG
         DaXXCY+cYUeQjtG9Z/UputYkCcHxa7uzm/gsbE1p6MCrn/5qHwaPAy1ImbaD7HY5jT/7
         ZUvuA3E/R0YZX1nwmfbKKbN+Q4qOwXXYDG+G3jdbaRg3+V9ZY+lw+x2xuH836iT0xxPm
         5oZZ2C+fLFFyJJtFb1MTc4wX0UTtkzGKkh16Ra8TnTTxe78ejZmQ4vuev7HG1dj/wrbc
         VMzxFIIOJu8LDm5+o5noQsDP4P2nQ0rR2ok/1lx6Zv3sUfi2Znqb/qfq1Y/2zpa1UrMv
         BXNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1LsviMqmmIxAsMfbR4b04jhlkqECuwPdysBE556Ia+jM5yNHMN8eAAUkoTPacuCwhwibc+RJ+eIhOu+i++/il@lists.infradead.org
X-Gm-Message-State: AFq9FYJqmHsMqdqySvRIMx+qGJX4Rvx7NKVg6Y64wYwk9v/nQRRfDg4U
	hnv1ZOIezHcBhm4q0Ky0jYRTqWpIu5MKrrouEb+DdF+bQ+kToIneGzCn7nMjvEpTepsncV/22CB
	NWg3sqRpwXnxJkPj+34RjqQ1roS02KW9w38LRph7vnEgyzmCQ0aKq0Llh40B8bCbLMum8QDmgOe
	TgGg==
X-Gm-Gg: AYBFou3FHbFiP/tObRlPHjI6+h0g0Zp6k4J5YlIRvD+49B1x1wEGPyUZ0Ompo14mvUI
	97ySzTAuECItD+mJuJkJjmd4S7aPQamQpFezZP3Doqtng60eGFOXXAskFh3ckbpPgPUZ7w9K7tO
	YLLANj6978AeEXh6f/82JQh1W0U3XKwOKciVzzLg0Vh9+ZzB4o5u1Pvjrnu3OkLqiZBt5Xoeb8D
	tltfN5dHYFvTIFcnf7o0/LQD+CwlcihTjKY9jl+GIxt8DaUssBBaOpL5T6TbjkD7gbNdoHz7Hbk
	Yb+91Ade+vbuz68Dbs8TpUBrfx30IsOFeeBCQNb0tKqD4d6ntU/3Zc7udaUuamSubQfQWKKjLtu
	cZ5zwd5kW2X2X9id3+cJcA6Do2do=
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1191047a91.19.1791458601647;
        Thu, 08 Oct 2026 04:23:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1191015a91.19.1791458600997;
        Thu, 08 Oct 2026 04:23:20 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbc4f08sm4001995a91.13.2026.10.08.04.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:23:20 -0700 (PDT)
Message-ID: <07d6b3ba-3d1a-4300-b8f1-66253885311c@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:53:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in
 mt8195_afe_init_clock()
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
 <20261005110257.50145-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX4gyyuFFIfM07
 G9qLTdMT7w7OFr5KUjKSNLU9lehnsqawPnfRYAcHjiXWB4pFzECZA3JgVqSbEsS5oBMavhfS3ZO
 RRBnch1kYdUAuPYcDrJ3OENuLaw8wq3PEm0HX7R/YuPGB9T7z0RW7+JAgSQM3/FadzZ4UXf6mB/
 UpXI6zbyftnKg7B8oIG1tLYy4HOK/Z/ZMRqr2Lc3k6uQFDJGWyEdTGGmxwtAqqtpi7uwTSSS5nD
 D6J/4resu89vbr4V3ByRDJQwUpzz68lkkPFgauXRbRTjwNU69wzzFCr1v33QyZU67s/dfCWPOpk
 txcvgRTqWwz8+P4moZjesgUAz4YA8XujzugDVWZZ1/c/VvhaoLYvF3HAuBfw6owpncol0rxdEFp
 IZzhClk8SVX2hhvNrFCZ5SlNWwPyIAOeH+FIj2SbdVAN0oz/w4x+LmA+p8NG7eFQXDK1ej/sVW6
 rt6TdP27j0GNARhQD0A==
X-Proofpoint-GUID: pzKAVpOK-t_AbfiyZ9N3iofjiUbt6VRb
X-Proofpoint-ORIG-GUID: pzKAVpOK-t_AbfiyZ9N3iofjiUbt6VRb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX29GbwjLbn334
 vpAwPdrXI3ScPsGTS963HIexQy9k7SRBKhszx+keCPzU0xlF4yk1KNydbQrQ23luyUcFxfo21rh
 bdDYhZk+50wkMQuj0d4QKf9H6S1+vvs=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac77d2a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=U5QAfnhbshI7i7es_x4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042323_990885_C955A821 
X-CRM114-Status: GOOD (  18.80  )
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
> Use dev_err_probe() when obtaining clocks to avoid redundant error
> messages, particularly for probe deferral.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index ec1ea5b988ff..12d8159338be 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
>   
>   	for (i = 0; i < MT8195_CLK_NUM; i++) {
>   		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
> -		if (IS_ERR(afe_priv->clk[i])) {
> -			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
> -				__func__, aud_clks[i],
> -				PTR_ERR(afe_priv->clk[i]));
> -			return PTR_ERR(afe_priv->clk[i]);
> -		}
> +		if (IS_ERR(afe_priv->clk[i]))
> +			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
> +					     "failed to get clock %s\n", aud_clks[i]);
>   	}
>   
>   	/* initial tuner */


