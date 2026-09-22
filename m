Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C8C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=; b=18TYe8iFG3px6d5Bp3kF69SjdK
	CdOeTCAG3MsbMj9tVrHjr/H4NzqxGoW7Vf+dI7vdjmcnGbWkEDs6DoCw8QvPBVnWbl+N5DwEbvglj
	S3qgdlk1ic09154BvUq2PN+haNu1rCnwhwdaIEZw5fmpjKnB8mL8EGydwOKPVKgCWlu/M1KCmzK+W
	ftzX54v2JUct0EfV/hDJekv41zBEthlrXMcNiFuJP59I7cXlNpE7eZCV0/rd0PRqXcSykdiHH4fVl
	7Mu65A672rXGImX1E6+KUwJq0Bm14YCfESWGZJLYOb7BQqqaBUPnkCw2XHUCxFyytz77ItI5uQuBO
	tvCyP7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95yx-00000006N9R-0zxE;
	Tue, 22 Sep 2026 19:16:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95yt-00000006N8E-3f29
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:16:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7CUi368025
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=; b=G1ADCi8kpSlVZNY/
	wy4USVl13QGfszXumugmn4e6Gr7BjqN8TZmtIYSK8IE7EuVVBV9A0Yv3rc40jtYS
	26xcDOhoXXf6ygzoy6/iNma0NlKVst7wSvXHgAjP/RLh4l7EZLKscHh6/o8pQrYU
	bUlYXtiH7C3H4nZGe6kJZ3WNtTyvi4Kwd7sz7MD2cD/ej8nBjr8cbPOqbZa5EBTo
	Haz7C3JHMUQkhkIiUBaYxHEueu3J8m4Mftqm0fHUek26gNBjkL2y6jhz7KTBQMlV
	wdX7bvcJthgfO9pXlh1/wJzdDR/OQ87+gLpEqZdOMtD7p/J60DFWIwVudAGFhr18
	RkwEbQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntacgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:16:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so195369c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790104602; x=1790709402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=MoWPUOqBDHKSJTGRXtfTlIrEEA79jKrwiwJkbQmJYnc1PKA00BWH2SDAD3HzH92sU1
         M7RxPJCvZQxFkkn7hoVZJWeyesyglANPvrjMCXw921v6lOdTjmt7G3fNVlzPipnLeNkx
         vHsL+UD48X8VbJdT/J+ORCufgnvgEGiuOHn+9dBZ0YLvewNhXs7RqbDjPtCGjpDYME1m
         rdd4m5Dm9arLqLqiJDkQl4J0vaEOtqmXs9s5KUAxD/vUtrZg0UdXV/1T/y9/suC1nQmz
         vuM0CcJfLT1Mo2p7/6x38WAYxWu2ojL9viwF62LC1zZo9GdLJHw2bDEVVIUEr5L9s/YG
         VADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104602; x=1790709402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=Bgdr1dCBV+sq7XafZ3PvYI1yATisi2Vvl0NvjAS7B/p8vvzp6Ts2VLGYqxIKy+Wu4/
         +8emoTUmSiRPJ5vo2PrVe06VLYIKW2dE0ADmaHUOKNUQ/1UKLqJptSSNF/sJSy3FcZSA
         5AseKv95cgCuM0fzon+UJhgAHwWLX7w8pim6Cvn8jeCTr+zxQRStRL8W/O8njdNTLZHR
         Vev+toX8J1ENELpclRjFJhhcsEMRJvQkKvHdVvpw8RUfbkTbIcGQm0aoWxOD26NG5ODj
         O7vajzTRGa70pvSbT3ngUBomKgLpFOLduibPEWGIIIrVbzBMamFq0okl3WlzZfMenj2E
         OUJA==
X-Forwarded-Encrypted: i=1; AKwUvBwaULrutIweSuTQmBTh0xyx9e/RxKgJfUFuCqcPotyk7FViljbBTrXGO5jkNLv2kr/SKflMXkLA6QcXd+KRHIjx@lists.infradead.org
X-Gm-Message-State: AFuF++lrqCV5sX74VHXRpPkMVGrVqbgVfCq/1uFRQv5xuEY7Z9aSaUKZ
	+TzNzM/jwjOJDyKWzwu3o9cjcx7lODIMlLmFjw2UW/hs1boLr0oTnVwNDQpFJe/eehq0re/Q6Js
	/tgzoX6NPYq4DuukHyyAAhPvwmbbpL54J/zriLT/v0f7PRvDvi7P/zuqA2Sb1/W2ThdA32KufI6
	dVrw==
X-Gm-Gg: AYBFou3B3oBKyzWibYQrmwdRJi9TMNgKtfz5Lf52VUscbvlLbcMwqDGJKQPW04fZ8Je
	29t01E+GBm808HYWN7N5B84juKZD8AydpPgLSeuecl122P6kT7n618yxd5epkMUZtjj18jF7CMO
	Y7UUQcb2kFc3Deivkr/XxytNj5yNjSINM3t2Uz453JTxN0TqwPTu38eOaD9o21XBQjrqsQZgarv
	MQOf0hfFq+vDJwRuw+5TitdwNjiyuKRfZT9c/Ln77lbIhN9+r1E594/0x0gl9eUAFKobuAyJ8b4
	aHS8YgBmAF8XCZQwCyhkFxlCr3uVoo5jN+dWQNtQbTf2zb2E9/jAc/HVs20VZa1WxWpBiel//N+
	KXxOQ7k/4lJ6bX+iKuENJC6hCHhspg4PaLw==
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374881c88.9.1790104601529;
        Tue, 22 Sep 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374847c88.9.1790104600692;
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm521798c88.13.2026.09.22.12.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Message-ID: <318f7e47-8a23-4253-860c-0e9874864a13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 00:46:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Keke Li <keke.li@amlogic.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xiWFBSvh6sbMfux6u78Oo906fGjHzFhM
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2d41a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WJcS3fml3CefRcin8NsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MiBTYWx0ZWRfXx3Ht8BKPoHut
 KuXYoZPoJ2K1MJmmZl2pKNt3+QPTtXf9OTpLK5Gmm6DgFnYZI/DM3P4ynlnK2i89bsNcpcG8t3X
 2bQARwfSiqQzzFqE+8OVlhAug/CkJElcIEIlDts5z45Fk0h5dYKsPvI5fDtyqtAm2RoRM/TE4G1
 X9VbpFrOdPRFQUozl7e06BOnR4W4o8jrB3HLIrZqgeZeVcL5RiBeW1+nYJoB3puA/yT0tfJrB/n
 DyVj0/nUeZqRUtADgjTHTt6DlAE18swwr5Uv6gispOqRGFrm4EFOk1KWfyrNHEvRreWFgsOuoSv
 BerUdg1tkxb9DoNCunMq2pV99xa9IEBJqSsWWzAB9g0llUVcg0KsMBqk3fxz2YEeCjroxbaIMxe
 /pT+rtsEPy3twTZGswRPCgpCKpVZsXdGg/8qkyROJLnTNiLBDqA3TqizEJayq11R1UNh/GMRk3S
 JXwQA4XpCYRkhR6JwEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MiBTYWx0ZWRfX7LS6YRXA0Tq7
 S12oCxzhyT87FjdPO0mdl+NExpdZPigUqn8Q9brVgRGXMn5byXblbEjTXwjAUL439AmbDX8JFGs
 54sP4b913QPVGgqDo55uX/ZlBkCLy1w=
X-Proofpoint-GUID: xiWFBSvh6sbMfux6u78Oo906fGjHzFhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_121643_924572_75F32362 
X-CRM114-Status: GOOD (  13.12  )
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


On 8/2/2026 1:25 AM, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>   7 files changed, 28 insertions(+), 28 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


