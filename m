Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D74F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=; b=edFk39U2Q/UfvUIuQ/AWTC2ei/
	OWF4aONHtWweDD0+PgtNNyCbFBcTUrZNoe9nWY9IG66Y7PMbn7EblZWG/9TnMopjnA79vwHnT3VYY
	QC+cb0f8GJMOCk2dM+9QnoJOt+Lt/BI7ZlmPB9ZYVrtCQ4tZLlwfUVoFNg5A1r15UPPx7qIWAVF8V
	QQEcDGaVeUDaHHNmXKJEI0D0iHXgOxfgo4JCKqbNrBUlQWuPikchcm5xFPSdQ3Krmv3eXAYjx15b4
	MPP5jjFijWla01JYfNyV1Yg/v3UttDOKMeZMBWZkJovX0bjRqzEG/vS0uvZuO/exfQiSCrW/OEu1n
	4STtbrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy55V-00000001Owu-03DY;
	Thu, 05 Mar 2026 09:33:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy55R-00000001Ow0-3Xat
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:33:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258k7Xm3160359
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=; b=SzbctnVqNSZ+NFa5
	KZNgrd87lqL1C4EWwyQX3KRCSqm4AR1CtRNPJmQQtSDMvdXfmaYnmP1uJ9mcoU39
	x5oHt1CxUbWXIScr5LqJGXtUzjCR3EYOjo2JeJIVt2bcNqLBumFoF2xCHxj8HJ8p
	3uVKCn8YTKDR50zX3M+04OETB2mKG0qWZNedQEdQDbDZb0bLJzOCAmlar5/bjaut
	YMjVGHQb1+qtI0EAX15PuyQtZJgJfRzxhNIuefwEoIPI+6NkaOq+T0x/MsEecMhn
	ShB8NHHzJIhEeKGVmnCBE1EO3Fsny1DEDi9Ymkt7u8i8x3T9dawWdfRZXVHjFv7c
	+rn9/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v2u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:33:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb399597fbso467724285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772703220; x=1773308020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=BAeay3WAs7az61rcHsuTdtHPoCc7E4GT8hViJ2SpRUeAfUCGwn2bTu7OkJ5/Wbcsw+
         H5DnPOT4bLCNxqiDqdOLvNJwKdpvAx1Xr1BmztW7yiLyow3fwjc9xWY2DfeOITrPGf6A
         xA/DCJspsqde4/0wBVqH+YaYfdC8a2QcMKgKdAAe5CrMXzVCJ67zmZ43ABoU73wmdYZs
         FXohNSdnw5xBZkG/eVFr1MGbJJgO+H+DuKnApgoykI8AcAR2rCmI3Kmsrsv0yVl2goFG
         YiZ3yj0Q99qNwNVx60T2i/PyZYNndvvQHYEFnG4MnZhlW0J4B2pIYnjyeIsV/j7MLNwC
         b4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703220; x=1773308020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=gkQRNON9i7EzUUFcDHU9pG8XM7+8LlfLH+rFktPA5DZg/qHmaldvFCXvV/rDqzU2xl
         TLucQXsLMAp11UNMWQ9780ovAiXbgqScc10vVjK2evmZmNM+oJOnX6x9vEXBt+ql1emk
         3xwqcoc16X+UOLLu9QyjFS8p5Sc4G1ghpDpoBaHx0ikrGpbKOkIlsAx/j8dZal8aZ3lJ
         4H42atq9n+RXgmCQbDEUFgp60Wc2p3jcQdVVw+Q0as0+vvzfO2rhGs3Qyx7f0ZRPc8dy
         23LrlmUnUG9Q/jxMe0e23WuZZO6RQb/L+ZqgxSWtR+gC5v4iQ54NgbexplFwpGFMHX3m
         yfHQ==
X-Gm-Message-State: AOJu0Yw8qwxOwXA27QfZ5WZ/TXre0rAoDPRKDDw8GAG6lhavdt25YHyW
	tAKkQ32pbr/YSt4NWRjD519n4bhL2v8y1iX4R+S6Dn1Oar48l0OazhntW+JLcwM+4b3GrGonoHy
	fe+DTJAKrpDHjOrR9eaufrF5CgfSPfrRRBZxKrBsoMNkSKuum4MCh9GOdfaUPZC3hj9AZYpgWDk
	Layg==
X-Gm-Gg: ATEYQzwNKpEMKFT/LcpzsLQtxleoXU7JwqI1SK7S0qJT6eSf/lwr4/IgDXKtQ81Su52
	KlvruJivdLMpbWIyF958iK1tq1P1XlGjwL/Z+ENJ2DIW62cDIhD/EDzTLzhTmJWBKcCJaomlR5J
	hF+B1PubZ1m1WE2ZqyGxMMkefiSG1o3Dg8Z8zz1WTrNboo/N9+ibWoYpW/lDJIOSUxviDt0AfyR
	KooYCZ1PdJaBM+xx0bWLwyaBnUr5WDwDnot5idqqPwrYa/YuMIweK0xcULqj5XeaySNln2Ovepa
	DLm7FLJ/6GfgA2zdkithiYVxsGffw7LbiXArz84AHDsYHfYjQygn5xjRTV0qsuMQEXtqN6G73Pm
	GLuO/5Acjknvy5HNFhv5hmHFtlL1ppk3Htl2mM0sjfAPBp0Z81L+puGkBV86O6bpUVRrNx3VCma
	VnDpQ=
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462862985a.10.1772703220101;
        Thu, 05 Mar 2026 01:33:40 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462859985a.10.1772703219701;
        Thu, 05 Mar 2026 01:33:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm884380166b.41.2026.03.05.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:33:38 -0800 (PST)
Message-ID: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0UWwfaHqg1pyRRlWadyj87ZOkXylGaQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NiBTYWx0ZWRfX/0rrEPcF3hZQ
 IQu/0Q3lIfZ1jxGyR6XVtf3FUj7RuhcicvZAzghkbzcaP1ocI1YU6WrGI1Lkc8+u+c28huPLzGG
 /UAMKaHkryQ2GmCxdFQQp6PnK3B2NLpliuTWnfM/TUW51ZBrQlqewdY6tae3xWLQtpycI8CD0FX
 HvB3GwgtOJbjGv5X318UEeDZoQ5Sz9g/P9xEFYWj+ClHqdorHzK0OaCQEn270pduLiMKEqOJAkW
 70JpqXfp51TkNfq8K174FSMMbbhoaPXq8TEpRScdSR+1gFzD59KyjmjN0LhhJrrL75hnJtbwjYU
 zKIDpnMF3AkQi/ZRajtPU1j8G/goidjIHW+vzNS5nO1Ut82Kvt7S8ERAAFxbPrnC716QzIzfKLH
 FfHC9NhdhksPxch55ffsVqoJgVOl59AuqIKhSDvfFu1rKspdRHFTc+EXHFKNxtB/JdavEuuutaF
 NE6YsTTTxJQOm3I9pAQ==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a94df4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0UWwfaHqg1pyRRlWadyj87ZOkXylGaQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_013341_995567_5A615C19 
X-CRM114-Status: GOOD (  10.92  )
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

On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.

I'm having trouble finding where that's used on pre-v3 even.. does
that actually get processed on the older iterations?

Konrad

