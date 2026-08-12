Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B728BC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=en3WBeGYYKKXUQNTqjZIewPokiWrCYWKofzjGcl8Hwo=; b=iJAD1oAo1aPUdg+e8b+oqBNCRR
	jjV6UlFyz6Xorjwz2PKNM2/GnJ3rhHA7E2hy80ISrC8WSu+KeuBw7OmRruMtW28ufDGdhBhb1Y6m0
	uaux/wWw7ID83cvSlevUhQIeFeD/uXzVG4IYlcpocbZAfvcRetm0SJYD3Dm9Avv+z+2fZDXVfWs7f
	6VnTjYzc2Ueayx0Tqtc9rbU8jFRq77Nhk1ZWj6ytyHECE100DUsRFbyXX5q3LwrQbSjCU55lMKuvw
	ePOzV0TFlev5TG9u++w4T+82Uyfcohbl9j2q66rUe4Ke5flCtdYxVTRoz7JOlQjDYTf1Zu3AN0ynm
	k90KjzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu51P-0000000FiWN-0M4K;
	Wed, 12 Aug 2026 09:13:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu51M-0000000FiVY-1dab
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:13:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C92fGc298704
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	en3WBeGYYKKXUQNTqjZIewPokiWrCYWKofzjGcl8Hwo=; b=osRJ3OkD/txwrGrJ
	lYo1OSnlvhhGF2/i/13Kk7xLHpWivjlqAtdThdDCHwc/s3INThmnBrcB7/pHbgST
	pHDUOtI0/SRtNYiJuVTPGDs9/WB/L/mpnGHwbMmA/vUH24Qm0RkxNIf9rvbvD/mi
	cnohwO9Jl61A45tm9uE2iamEmWawRtIN8P/w9AsuIIFcZfX7IqOgi2PjtaxgCJYv
	t5PpN3VcOt0gsNEFwzU4Q02tQb5bGnmtcqHnZIw5ElWmkIGLV5Tu0AtBuSuJfnG4
	CznYM1wo3J/6JAbGhzpf8/HISfINk1wpHjohJR41rICy2jZLt5tYzRDIxwhleqRI
	17YWHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut8199-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:13:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1342035a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 02:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786525991; x=1787130791; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=en3WBeGYYKKXUQNTqjZIewPokiWrCYWKofzjGcl8Hwo=;
        b=Z7LTg8r5Ia87WMAPA8I6N9DBMdvxaAqe5fFKWdEbjh9Ru+YJVi2xjuH8kL+kKfhIwV
         H3EmtPXtT/F+kYavuHMvMgUWlPpExBtO0uKEiruYNko1PZPJH6WYP/l5CoZzWxZywRjE
         h70pGmDcIAd0rMQKDP585AF/Gsr+WZEWnbm2mtxysfo0O//az/HzGy7+Gfp9Q8NeI/Ly
         PUiw/Eke2KElZeLZeBKu5vWvCzwsysN5tu+kOvif/NSI/Xx05DkKQBzw+iQ6V+/784gY
         Ai0Kj2MI7a5mrBGtkmsdnO4N1EFoeLqxuNyKq670iMfBBbrRAQoFS+iT+gbNEbDKAbWw
         UDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786525991; x=1787130791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=en3WBeGYYKKXUQNTqjZIewPokiWrCYWKofzjGcl8Hwo=;
        b=o5Bz2wMh3H8ROqqtfQC1fLiUHcVy7lBnb6Q2DBKTjnIXaIrlPvl8AhND+DgAX1YaO2
         ogELNlNdBp+vybT3kn6igDC3htRpZvmcQo4FUrH9Tdxja8CT3BvKrEjpkyPLK9vMT8kw
         5OrOAe3l3oC0QYIUulZysD8fdguktkFrWKmL9FtZdMSPmNlQBXApQBf3zkSQ0xfbXviU
         C8VN2S9rAid3sLA03yAhGa+AtW6KcW+0/PRFzC2ZuD0+1xofPQnZjcU2Axzu8sfhUxRr
         iz55LJsu5wqGhSyQ/522Az03IklA83y5FdU/wB/uWlCm2Kum7M5O589vC7p7KSiReDnC
         j8Nw==
X-Forwarded-Encrypted: i=1; AHgh+RrYkaysIPqRp6RAyrDGpwb58SjmqWoYwePJQyf7MZuKVp7zCnKVTbpSgJPHCZWqjJLP2yP1F3xrmYDIHSq7UBNX@lists.infradead.org
X-Gm-Message-State: AOJu0YzCP9/6iJ9hp+55JFMv5mFOuQoH+fQBaSgmICqdDVkuuOX9H2rI
	OZsWbv7p4bKA1nWe4lnQwTeB9i4JgQ/xfLKYch3O8a4QVLpyS/KLzccWIF4O7S68iPAKiJ2fJu6
	B6zeuLyfITXV3n/qTGldT1hZ44knk6hbu00SkocGTdh14XOWJ1/KjRuaLfM/RA8gEsszxgbDYeS
	mzrw==
X-Gm-Gg: AR+sD12Sv+LhJaM4PtaOUr1CxD+I6nOxLt8yoH6xdUvaoXwd7ojDqXesHWik7wFvcsU
	vQD3CRQVmOTm73DDc1N8GkyD3mhVwA88a5mpL1/GxXYBPB/m0DSew/iqMUas0Vlus0u0UC2c7eR
	rVUXUuMi4EF59IuU84rLcRaMg0JRowqPby2y56qR/GxIrZ9UbZEf/Y4Bhra7OQ5u1vcgcGKn13Z
	e1lg20M/66dB5iowIcqJi6oUMdIPdhkfzboNDo6oZ/XXC0ieAn1xMJIA5w8CyJ6Mq99342If5+F
	fBHleMeQK6UIZfIL+dktvt9Mwk5/EpfIwoFE9Hj8HxH+kDg9X9DTAruQL6ZDFuQlDbn2vCAieDX
	ygzQ471v8LMq+eJzQt8V2NYYBcTU7iW4N9w==
X-Received: by 2002:a17:90b:3c11:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3930119ed5cmr3829303a91.4.1786525991249;
        Wed, 12 Aug 2026 02:13:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3c11:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3930119ed5cmr3829241a91.4.1786525990816;
        Wed, 12 Aug 2026 02:13:10 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f88d239esm2915805a91.6.2026.08.12.02.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:13:10 -0700 (PDT)
Message-ID: <779ec0da-4b51-4f8e-a59f-d482f8e8dbaf@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:43:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
 <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
 <CAPx+jO_-1tZfZcjae9shyWcKPsj0fM1SvRzC9_JVOvJr--EeuA@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_-1tZfZcjae9shyWcKPsj0fM1SvRzC9_JVOvJr--EeuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX5Iv3+TSUTZh7
 gPSBfFbPB5XOdL4eD2NxsKyorPqqH2a+f8naM9HgC01i63P44LlpRZmzh8Kpwas19Z0Ofu5NPtf
 QbcM+27HTBD7xWErEKJ52O03VS+ITGk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX77uj4hHkxZ0u
 rx1d0S63BcLggioYgrzY19zExRlZ2n6DC+PSHz2c0q0PEbUBW751eVoZHv0rA3tslQKd0YBTtVZ
 3vPfGmfAHO3ehpLJ+LWURnepLWiR3RfDwq7GiQwZZbBHvTPkoUxhiBYF61ZSUItsDbg5Wa8MgJP
 Vo+MdAG4j54p+amUYAA7b/QeJNqmCZOQIqzdn6wazxO0izni7aVm2qmdLfUBGvhIMQTEB9QW413
 tFM53MkA1Vrr7GEwbrwxSeHGCuvIyMFjKb+xrIgTAcoYaY2q+zn20zxYMKBJPWf3/9Q7hR2hjiI
 Gx7C/fnGyWNhDWGYOi5HA2gLlFtkzXs9glspQqbB1gohfoUv1xkx1k6N5AA6JkRo1eiaYSTfo6g
 E7MxhtgddKsxxqq9821AnIO8LMfRI4ZmMja9m+gsGjuMzJqxECnL5XEkCWiLS3H7LG7JDM/vT58
 ng36odeFu+W+mf0mnRg==
X-Proofpoint-ORIG-GUID: ZPAvUMKOVoeULxe5ojLrCFkERqNPk3da
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c3927 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GpIJag5-aaecOpU0j1UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ZPAvUMKOVoeULxe5ojLrCFkERqNPk3da
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_021312_918700_A1B5B9DB 
X-CRM114-Status: GOOD (  17.32  )
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



On 8/12/2026 2:27 PM, Ulf Hansson wrote:
> On Wed, Aug 12, 2026 at 9:24 AM Mukesh Savaliya

[...]
>>> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
>>> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
>>> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd, unsigned int state)
>>>                return 0;
>>>
>>>        if (!state)
>>> -             return -EINVAL;
>>> +             return 0;
>>
>> Won't this cause an issue to other drivers ? how are they going to take
>> action based on changed return value ?
> 
> I think it's rather the opposite. With the current returned value
> (-EINVAL) the driver doesn't really know what to do. It tried to drop
> its vote, but that failed - so what can it do?
> 
> Moreover, from genpd point of view, this fixes a real bug as the
> aggregation for the performance state becomes incorrect during runtime
> suspend/resume.
> 
Got it, thanks Ulf for your explanation and also read your previous 
comments.
>>
>> Remove Acked-by due to this till i give back.

Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


