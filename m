Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74113C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MYuuA2G+3W/uvr0CyQxqIxAaENDczI3l8DDQQ0A/Hc=; b=uBYwByG/hmfckoydTRYihW7VDT
	0wTlq8hVK6qiqsJshqVCqn9+AOHK1OXSauqZN6DBfzoPD1bIz4qHL4q5xpHsFASiAuDF1S4dPG+ax
	s2O3rbysdSky0qjIdUCGq2a9qf30CSWtgM8SJuiFmFlYUiw3u0SLaXzyPhd8s1ucyOG+BzEsSe+ro
	WoZHG1v44MeWoQBUmOOGCWJ0VJPm94sYiGGYWU+Di94GgjHYkznh1vbM0uLdSTU/ogr+DRU2DE2Cq
	8NMiCD9gP3RjTkJTD3U6uLacmcZg5MFfvchVfY87zOYMGEMDuaqo428n2PZM8pg535r4GtG5VMpBc
	saERKe3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAxd-0000000F5kV-1bmc;
	Fri, 27 Jun 2025 15:25:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAi2-0000000F1Jt-2i2P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:09:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCGUsD014660
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 15:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MYuuA2G+3W/uvr0CyQxqIxAaENDczI3l8DDQQ0A/Hc=; b=OnDg/9hdtmSvSmLL
	ynNfsbbnIiwSr9BjDUizsy7NdocbsgLRPVZ1tZY6zI7W/Znhw5Q4VQmtZrZNnYkN
	DrXQjKxWT0Vkmprkm49OW60kG8OGUUGZDnbQQm0RKrQDzN0YpkuG1As1fmIE0j9X
	ppMNRr0jnxXFUULrFbUiGAwN1dYnVf9B+5BvNXfNKdjpKCbrqaqsp7uCiALDTNh8
	48OotKF8Ohg6Tf/NX5ME2xK425160xlk4oyt9ZZUpMsyhIr5GO4VKadfXtgdFlD5
	KQYz61rXfD7H/NAyGfYIBX+JulUwZApu4X5e5u6qr4TV368xP5cmi6MgLbKcPFoR
	t5LcEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25u6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 15:09:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979c176eso45757885a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036985; x=1751641785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MYuuA2G+3W/uvr0CyQxqIxAaENDczI3l8DDQQ0A/Hc=;
        b=FqGchz5cKI4qHREEXYzYiREXF0K2jon+2CjBib+0xeA16ypCBLi1lvdWwvDiHRVHFk
         ujNoMRrSDa+UgEZTItJHsmJK0qeaEZ/FVjcOM+CcBtdz0dZaR0fi5wNzfhNGVqufD7gU
         gkAD+/GsU6G8N88C9hq/BPGGEvRrMpE7fbtbGzUNUcmvyEOiPFaknPS+tDHiY+u1QGxh
         ekAjNobO074HSbOUOg702YHXfFKG6IaE/ASgBc1vo1eSqqgECA576l5ZwlSaiMQg+Lhi
         iCufh74cJCc2YVdRXB3kz7V+p99SfHBDXduslA0FiCdmxyNv0lvPaoF21yZdHO3gmrpv
         MX5w==
X-Forwarded-Encrypted: i=1; AJvYcCWS1rgvS+d7r/lJUWCi6cNgw6BItU1E9wKHfxuZI73YPkCJ4u6+nrvPXkuLgLDINEneu7i+HT8FsU88aQmoKnz+@lists.infradead.org
X-Gm-Message-State: AOJu0YygC4LKi9XpJZUWAIx1yWyZtQx3MHGdDmiUpdzYsXYhyruV2+0d
	q1R59CB+Mqni5eIcn4N86B7qTaU4dIPGhR/yCKo7VwHaBAvkRkTTchD3De28nUDN0cWPS57il0m
	GXePj1L9fmO0i42XtrPdpaMXwawUIbo7y2fNNpIetnhlZ+TLoa4Rq3LwCvrQ+diaVB8xCIeTo93
	r6RQ==
X-Gm-Gg: ASbGncsyyyp5FzQFEX+/kZMma0+xfTnNgGiXp4X9pIJSLdOO9FK8csiT9OeHbB5X6lA
	uqNQIrruy+XVhjRu6KxxwOMPPh8yYbN/H40J5iYrk1QnZuVn8YMTs99V5LsDjhcPHQAz0/5G2x7
	NRtFMQA9eAReHlWfX1h1TEQqZ1M3/GFltw6EHbUAOft61tzv7/IPufknFeaqQ01nme+Qqb7B81F
	3xyWhJxhHRXXxj9dAgqrdScS36DloQGkbN6UGGxRp/fwdDidp+YTEhcqWobn3GYbO0EA7xzZ1Np
	wy9Xy/DR7lbmRsgGs7rmMsOhSDJFEsLDx+dvXgXAnQ3BObXatweW6nFNShXjbp8u75B7DqYCDyg
	qgEg=
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr210730285a.8.1751036984743;
        Fri, 27 Jun 2025 08:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt0El1GcFRYFDLI+q1hURApBGF+0X3eNxXSn7/tVJPwdQii+67Yzh11WAEpAraqUYgdU6DMQ==
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr210728585a.8.1751036984230;
        Fri, 27 Jun 2025 08:09:44 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8292076csm1554764a12.32.2025.06.27.08.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:09:43 -0700 (PDT)
Message-ID: <c37349c0-8ec0-4654-bc82-15190509ddeb@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
 <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
 <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685eb439 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Wx9hSxQhFZ4lEN4NqugA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1wy3FHNEioTWuH7n8Y03jBQCZmjURJyQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMyBTYWx0ZWRfX3VZKzOXvkiIw
 IZ5whgkZSbagQ0H/odjVgK3GPTd2VhDzoRJryCpJc3G5XalWUmq1QTDQkwEdMpt5JEK5UQpu7r3
 iwh2Lbq+AnjgDFpSwMPXYTw85ylaxb3ZziJZ4CNEuRXSxZ/29Jgrmrn2QCxo1l3tpnqoDOIntdC
 dL+DWfqPHGhjJmuobdYxnKdNvxlILj15oz5B+kqGnrvGi/W4t5v3QLF6zJZRYjqtZLQ5vtPnwN7
 PajlRj6xrIHPTmLoHOw0QiRFkdFZUqjSXu8cJDP+q79K69xkJynXY2gCbJdKx3F82Ll/YtaTt/m
 Bm+t9yC1T0PBRNn6lEYxzo89ADYA95n3+ryLJm+QUm5HrBGhKIJBDbGBUwT/N29//m7czpKQAww
 GFanaWwGhpJiFIeM4WoPDf5uMXCcyuLFE8zfEdBf1V5H6p8Kh2uFomez9xIHLTphNHDMW0g9
X-Proofpoint-ORIG-GUID: 1wy3FHNEioTWuH7n8Y03jBQCZmjURJyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_080946_888200_41E4FE92 
X-CRM114-Status: GOOD (  14.80  )
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

On 6/25/25 12:31 PM, Taniya Das wrote:
> 
> 
> On 6/15/2025 12:20 AM, Konrad Dybcio wrote:
>> On 6/12/25 11:55 AM, Taniya Das wrote:
>>> The alpha PLLs which slew to a new frequency at runtime would require
>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>> which can support the slewing of the PLL to a new frequency.
>>>
>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---

[...]

>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>> +
>>> +	/* Ensure that the write above goes before slewing the PLL */
>>> +	mb();
>>
>> Here however, the write may not arrive at the clock controller before you
>> proceed to slew_update()
>>
> 
> Yes, it is required here and will keep it.

You should change it to a readback instead

Konrad

