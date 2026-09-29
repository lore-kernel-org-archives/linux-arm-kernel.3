Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FAFCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=; b=0uJR/32UMXSgFBL92t6yoiuhJu
	81T5DrENv6Nc2ehvdUElAoALbZM6YD8LefN+KNSF7o/6RIgii0ApzzJ5Xov27IY1NEStgfr63WVGX
	HRYg3MVv+pq2taGz8jHYRvI0disUHUXlecXURGpnU0Iixb1+O3bvI0exndqbShsfhz8p+uXO/0rAi
	KfLs3RO+8Bbm8svDxnc/jxyKpwlDMQT/V96SiNmDzHIFhCHlKJZB0CBycL6Y42whPkG2BtZDI3fsm
	ttHTx+IHYRhWsTVB7rrtsjyordQW/OE+1dRI1biS7Fob9QElAUlj55rQYkg18vJXTZ9HQMxCRk5s1
	AFh9lC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUbr-000000032j0-1fgV;
	Tue, 29 Sep 2026 09:58:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUbS-000000032dT-0cT1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 09:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=; b=G017u54WtlCiK6tlhxsqfAfTJE
	G/wxWaatSWJD5Et2fXcQTvJ4ouC8yWhTYd5+afoPD94e8pmAYJ0gbEm/U0da1TNPSpyprGy198tCY
	oQnKyWQ99iMEEfbisbVCpjJvYjEKgDa97Dd6CJgF+6+1f0s6JDZ15R8NTBgYi+ZvFyThcYQOz9bFW
	D3323vU7FzEHyxHCNvDzXBDlH2s0ie/O7c1arlO3qw/YdN9qrs68ugPmvhOXkRSxDPjnAskFdsr4q
	E3waR1gHEWOsq1KeFqS9kvcXSMrCYn6rSpN+f6CklIRAzebS+MQqdVnUEdIVcuAOATZj32ZZ7cQ6X
	RfEH7bNA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBUbO-00000002RqJ-0Uln
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:58:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TeQE141378
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=; b=QK5JIihTRv/kofqt
	4QaoUpy65LqzTQHfXDhdtFjOwFKUi6/+nsI95VEXDSggZ6Vc9mnegaKosyoeccz/
	FhGi/AKvkoqLzJtIDjpJ1DdwBoIR1gxXqFLYpz9n2yNbqfMpuBlhVwqVykDWWGgO
	lRVFWKWRqUj9gFFdfJxdwvD5glXbu90v8CaRD+zz1DEiXOJmGXpHtdV3kIVxaOKI
	m0R4Y7o+Tj2ulR5f8dDNeSeWvX+bKhSECwaSUT43d5g9yhzn6GwdKpNBnGqcfPjQ
	Zd6/gS8utn/fuhwPpsZM1L/t2KeCMG4GhjnF2baHaDUkLpiEamySAi85hRi0AwdL
	nKkJHw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0gruc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:58:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7508220a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675897; x=1791280697; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=;
        b=hyDU12S3prpnG5qKM8rLeYqgM5UEqbT3zp+g5aa0TXNSyBF/1twRCiBOnyF1X8CqhS
         FquabLPJlDgNHqZ2qsnFfMfpjFxWNiC/eDmhBhMnrbAmOdoABcqL66TQBf9VjjUdXl7s
         JCYSFzNcx5+1z6uXKO6no4CkIKC8g1vSEl097dr0KJ9hLlWwIss3KBWZliPWc+KCaqYi
         50apNh+QtpvwIhykaejkzXn4/eLyjwr4l+fEzQ8rvSeptg+xBIcppRd36BiPSa3N+zg2
         MwzckKpAxeiK5ed/u4Nw5yBIR8qSaZszxShEkAKA02vbISde+aTUVjNT6e9yrjEvY/oA
         6a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675897; x=1791280697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=;
        b=kkz2QK+BwksK3QFY//+hH2/tmHEMj7hQvvQcFuqLnF7NNlHotWjrN1YKFEwir3Wjk5
         LECGRF2K2T0bYU2eAriuQFeugJSVhE0ooycv917kV0hutEY5lMz1/mFI3I5lc7e8NNwK
         4F6T0EYWXU5LuZCevUaTlYffVpEneEkzxoNqYM3mPgcvWthaU6erTsxsQU6WrePXGakz
         I6uwQob3BlQiTck4sp3N3tGrycRgSk5d15qk0XRsWVm03i4p5r8p4LysIzfWR+Lj/e/L
         SKsbELR8uu7MUIaqNk8rmH+DMUOvr4OjhaP0U5TCudF/cdiF7En3/QAzTEgbrdodEcsn
         6TPw==
X-Forwarded-Encrypted: i=1; AKwUvBwHMxQelA2kA5oL/sT67F0ccoW21o2haEU98VV8FDYXeO4RGO8meXMQ3bBUqeoVHNZEWa31a/vH2CaGBHGcxmrR@lists.infradead.org
X-Gm-Message-State: AFq9FYJXf/o05VIPmF3cmTwEU+WVZcQXg6pRONBy18AHqNBwu+/vcMbS
	9sJSjaocSZtkZOIP4+Hcp+i+oAns7K3TClAAzUrVjORK3wtxC0u1R+pGEywLPHUP0onQ3+c4i77
	mBm0bYJelO+mdPt3MFrxkADbOYlVWJMLDs1cvnvMXaGUA9V9PSU99MFKa7dlw8PF2zOKVb0Lj/X
	M7XQ==
X-Gm-Gg: AYBFou17LEo/SII4tqWFxNH/sJWESIU0ulq5Jjy81X1nKPOp99EpBQPcwTTUj9cNsyS
	vsSplg9Kx9t+zV2pmguS7snqJuPjzJRI+8Se+BII0nHWZjR1mQ3lkIyQ3rAQtM6ozAGyk0lnWfT
	RaHH1alKx5H8K/7K8mnM8CW5TWNFFD2dbpqidYww2Oo83gXhhVmh1U5oXsvCu4zVkNuN05SmR4P
	1YbaR0Vte7gp/3eSxnwStjnknt/JVJzhkoX5lHhL/wcHZhJEEWyPx1ymvM2wZjtMwxRbfF5EJPR
	F78Oqe9XOvfQ06qptJ62/mZTIsp/HYTio/o8lWXgI41VQm2nqlss3LTaThXfwl+MXa2LqBou6Pi
	xPnvbckBbFxCCICyaCh/7IE3y2BbsedwrLQNGQvwX0pFS8fW3EVmuVdowAFtBouOMvd4pbkHc9T
	OwhCBYlvzI26n5IAfbpWsJ
X-Received: by 2002:a17:90a:ec8c:b0:39e:2e7c:d43c with SMTP id 98e67ed59e1d1-3a0bb552ff6mr9601342a91.7.1790675897477;
        Tue, 29 Sep 2026 02:58:17 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8c:b0:39e:2e7c:d43c with SMTP id 98e67ed59e1d1-3a0bb552ff6mr9601308a91.7.1790675897013;
        Tue, 29 Sep 2026 02:58:17 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm4634983a91.13.2026.09.29.02.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:58:16 -0700 (PDT)
Message-ID: <ca8e656a-50b5-4cb2-a2e6-c6b275fb7b5d@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:28:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
 <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
 <c341b7ab-fc59-4234-a25f-715035fc1779@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <c341b7ab-fc59-4234-a25f-715035fc1779@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX4/jVkbzgU5Ht
 u+e3XR2pfXkDgiWHfZccyoTANRdIP9BeTOTjZHC1QOPlSLvYSTPO4QEVIvdlnYvwNZVzFZ0zKs0
 krFKmy9qGIJhtl4d04GfYcYq7mgvJsc=
X-Proofpoint-ORIG-GUID: Axi3pUUMKcq2PAgb-d4xPkaeS_1W5LDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX0iyG5ytmRktu
 BEfZZ8i5quTMhKQKHjOQ0bLI5dKVZpY0J2xrGqDV8q2klWN1LW6pWK4rm6kpkULmCKjcDcU7zTg
 CCqnbCdLNtfzLZWTMl3041nJEPpbx9Th+kmhz8rC2S3l5W38uQjV1E14MnSlm03+HFrHFAadFJF
 M/Hicb9GszvvoSR8g0WsoaKAIU7Em/BRNKlOJlVWdjScgB0lRSgEMOb8JusefWfbjC8Gy2QW7bg
 3upcaikV9gWRuEVNBsnLrd7MlA/CgOUbFk54b6vflhp7uVWyqKwVECEyE+SjcnWbx2mG5neIS4p
 vB7t5ktXbuqkzGFATuEC5A0JuIEgCVIZm7+algOKT96F5ipJraudg2YqMMaq8bkOMJliy9udz9p
 7KyuaI5wua927xmyV6TuFrkWeomYdZe6zLAjncaQZEuF++xdaPjG+K3lVNce0Q8bXBkThYQvPCt
 wazBDll7rhUNvvJIw1Q==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abb8bba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eAyIkxj0YKcLyhwK4dIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Axi3pUUMKcq2PAgb-d4xPkaeS_1W5LDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_105822_624755_5E3FFE93 
X-CRM114-Status: GOOD (  17.84  )
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


On 9/29/2026 1:56 PM, Konrad Dybcio wrote:
> On 9/29/26 8:59 AM, Hardeep Sharma wrote:
>> On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
>>> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>>>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>>>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> [...]
>
>>>> +            ranges = <0x0 0x0 0x0 0x0 0x1000000>;
>>> likewise here, you don't need to precisely limit this.
>>>
>>> Konrad
>> Hi Konrad
>>
>> Here I cannot use ranges;
>>
>> An empty ranges; only works when the child node uses the same number of address and size cells as its parent. That can't happen here:
>>    - The binding fixes qup0 at 2/2. qcom,geni-se.yaml requires #address-cells and #size-cells to be 2.
> Fix the binding please
>
> Konrad

Thanks Konrad for review.

Fixed in v7 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

>
>>    - soc is 1/1. It uses 1 cell for addresses and sizes, like the other 32-bit Qualcomm SoCs.
>>
>> Best Wishes
>>
>> Hardeep Sharma

