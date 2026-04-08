Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D341073C8B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=; b=eZJEX9ONuBQsffqQWFmpbTCybT
	co3BpNPsg7FgYYypV+r0EAqWBJrJbyw+IBe6diH4ux+C//tQHHdiiNyY4r1C9czjjva9ZygSEc8d+
	F1c03p85kXAAypKkF0gk+MsvPrrXSSkcDNGYfgMNqnDAyoJs975s0ZPchZG/EdnTeEiAVPy931NNE
	yU96LO5jlmJHuWA3LXXbUDy1mziW8nXoa7NugEQyxo28Z2YK7PTCYTVyRUFvdQBOpmirml/EJByiz
	ADu/5TZnUfo+4QVIP/L4s3NXyLDzxhqJLmQwPM+kq4hEF/SFODk/DQzXGHVx8x2mcWbGetIkwO+DL
	WkuT1QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQMg-00000008hKI-2MVO;
	Wed, 08 Apr 2026 10:42:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQMd-00000008hJm-3ojm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:42:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63876Z1m1619750
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Apr 2026 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=; b=eUm0ulenZv7T07ga
	Wwy6Ix3TveFCCSsMuAD5Da+iSCArU1d4XZMDY3YzOqvwN+Q01S5PcZS99suFnLkY
	uC55j3Y23aXhs4SYlsETiqWufchXxm0Q6w1pvqMGrzssnogqXxuZjAH/EPIDBwfS
	9egdeM8EuxLoSiVqvPoaVtXSe5+Ilpou8Xjcr0i20lwUz8mdYoaUpTSa5OB0Txtc
	0IqDMhgK77ZCU2pDcuAt/BdSrrywoWKbj8anfZfAWAPUgKswHRp91B2LQyHOw/Rb
	7oDfVbq9pJN05kuC3Bwi2rhnpzNWKceggm2y/7jwKSELSRaURbdl56gQ8uDHoPBh
	Ot2kLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrjc39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 10:42:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so194134185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775644946; x=1776249746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=;
        b=VBegPo8L2COzNbgxL3XL0+gfEaFTYHZzwBOFo+P6Wq8BQlIy9NPdUTn/Y6S5nGf7Uy
         mwIBPbBtWXlozOQVcwsPotLcWZVNAuvIwQqlhceOpUuCXZ46ANVfLYbIaQ18aSGPrM+4
         /5WJFiHHtOHNOHrHqa3tEj/uul/xwmALka82bztlVusVrsB6gN7Uko5MZutxULezCfQT
         wZ9vYxSZwrGd3fq2MgN67p07NiBp4TERmcEQsXIeOh41PL39g/YLFSmQxRbcWq2SsdQC
         Kk5LGZh9YzuCpbUIF4Smix30FXrKexiaF+REfoxNX+P+O27EMa3qkLsQe51hPjUuNSaN
         iq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644946; x=1776249746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=;
        b=kVoXd5+ZfzIvHa9wq3tEgPi3QJsUOXKST58/O9ep7UVm5Lu0G/M9vqChHd2TyQyPXh
         ebmOtgJ+4eRH764lOqc9F1kxV9d5EZkLVlZxf16yWkl17jtcXKLJrWnQK/vcCtKphQhf
         Z8FdwlAz4rhtjdheHAnKxU8PE4syWvbJ5KsfUadbI82xSpk8aul+KuBaI2Eatl7M42NP
         JrMDxfLFrI5ndSSB/vZAdD64DUx/KP9zJGTL4MXWdj8d843o5TtOCBh+5SbSTxLZI3E2
         gLjTSwG0eUFLMq4/YGtaDzCFxXOM8TRqJKGDZZdI+Xe9JAP4584lVm4zjKnIeh+WxpTS
         EdWA==
X-Forwarded-Encrypted: i=1; AJvYcCWLeX+rQNYNoK/hCiN7XyBE2xWe/dKBfPV7Zikjuu6GRrgIpysTNuEpya/k7GOJk8k1x1yBM9FyCLSF6EDxbHhH@lists.infradead.org
X-Gm-Message-State: AOJu0YxjVapWKjWNKqcA+D0oYoqpoScLDdYutVzYsF9JTLRj+11fgGzE
	JrPMr8GcA/RJ1icIvR1GvYfRjDqmNLPeEtGrlj01v/LjfHecbB0CD2GbyS8PmK5ymJzi0rlli/s
	wdX+iHuoaYyI6e5ZptCeAY7b7vW3cjpmoksTkaZhIFiEvfgfCT91uyxKlj8PO5e42me5FF4nnqU
	Bbvw==
X-Gm-Gg: AeBDietNGqXATRqoQzcJhz4Rdpt1tbhdynLYb5MVHsisKSFhi6OE2W826Tagx/GTBTD
	8PhEptjC1SEI/CW2sL8nPFhxtySuRwC9VDhuR2ZX+NHbCgAZWApbDUaU6Mz84Cw4jSfWeTEpBDG
	T9TlGgjPULjHxICvAb8+NXTCExBAcHQ5JbqrUJaiRid6knInt7FKynK+IO+/+iJtQuSbde5CK+G
	IHc5hJ+wmH0XcLEz/Q7XBSbKv9/m7xqSW59FKr4uQOHmSERXvEKPUJFohz1OOOYnRj66i5TDS51
	JSMv5Iw0hrit7zQ47c6oPMYK9gXdgy4oBLRJoXpvV4PEJbo0FCtdrUtaVXpcBxCReUwFBiC5uFy
	MplziNvBt1JCtD351TpLjXB8D+avF4UbCnD658VLLZ4f5cQPDFXox1Quh7Cd1cLAwlKj5gQG0CU
	PvCQc=
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr225687771cf.7.1775644945883;
        Wed, 08 Apr 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr225687611cf.7.1775644945460;
        Wed, 08 Apr 2026 03:42:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec5dsm650018366b.15.2026.04.08.03.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:42:24 -0700 (PDT)
Message-ID: <e70839e2-a94a-418d-83c1-87336c558189@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fEF9tmb6Zyh_jxn9P7RVlC7IZkJBQ7YN
X-Proofpoint-GUID: fEF9tmb6Zyh_jxn9P7RVlC7IZkJBQ7YN
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d63112 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HxVFgQzDQVkKW_O196YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5OCBTYWx0ZWRfX+hdrybEMBfDV
 zxZZvbf6M+qKHpBL7A9BEmJyv0gkJGWgoZWvWs1w79qliuWAaGrgpqW5E4KhcKrq75QNi8IDcCb
 knRJGqNz2+zdPOepmAaCTX6IezolgXgUmG0LcOZF8zpmkljcM7IXqTJNcVLd1VzD8Z0zbsBI95R
 iyPvBmjdI1D2NgdhfMlJNfhb4X9ppWauw/9S+dP+H26gSOyxKUCOIga7SXG2c4s83OWflhbs5Nm
 lUdjOlUNkHX1HvtO+mBewWUEPIn6efHUBcuChrjdIWGFJZ/K6P360eVl0Q2x8wmbd0bQyR1v+re
 QeREmf8Wukls1EfWyYxd0h1inLrK04lBi6g54ECv1sr8/UqxsOtBiErqLFw3aGHaxn8rCW/70Ti
 qIuJM8QrGTrtE/0WOfGvP44RX8HfR3N1ZCcxUFgDO3mEl2OLiVBcBjx8q19ixCYA2n/o5Mxn+3v
 CNaGc69y6hQfdhIi0sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_034228_097888_8DA43477 
X-CRM114-Status: GOOD (  11.39  )
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

On 4/2/26 11:28 AM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

