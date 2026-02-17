Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B475E6817C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne+Xdf/klpNlR1z4hftn1Ok1OX4m0aO3qAGj4Do7clQ=; b=nGjz7Cw3whkb2J9OpgRWv7h3n3
	AiHx7xT7Zy4wwhAf1sSWQcXFXQxqWcR6vUQ4ovl1npuAqJAZrNeuxitXMTwoAKv2q2/sXjkO++cd1
	Jb9Oh8Y0c1qUuPXLlXOSdnDfvtXAdryQdqB+tBLkDEHXXxoYRSinocgD1K/TqOE/yOPfGVdUy7898
	eaX/ItMYRWwqkftYMkc3vBimcIi4lBHCpl78ntyJBNit1XHceFpL3coNaHYYUXb1Gnv8wgyGHGbm8
	9sjX4qIRxfsSCEXj+DDYjCI3TzPtnK1KoxM4eluFZKlFkTwZr6PIQN4cvIxibbl6wUWDve2P0HURh
	DvtPIHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK9G-00000008Ce8-1mQ9;
	Tue, 17 Feb 2026 12:25:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK9D-00000008Cde-34G7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:25:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9Eg7r1545005
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ne+Xdf/klpNlR1z4hftn1Ok1OX4m0aO3qAGj4Do7clQ=; b=k+0lz/dfjjsnmxNR
	aBDAvatxGHy7hAkDALDL3Ze4mJVJRNLq7ORjuf98K8+FsUOfD+00XEZ1iUh6Fl0A
	6VZRDEPrloUufWBkezXWbrEr4AkFjh9IzTVPaVmZt/ANTzI2ua2FpM5+LrWOA8eC
	w0U2CK9wkss0yayqga8jjAZTt9IJ9kbkVI3uAoYPrNv1dYdM2wsxHx9rJXU3gRic
	PsmJgU26+RnQvSSpevsVO/An2XBuAxw+Uy1U6T0u8ysz+mDMPWF3HZtqzAnlQ+Z8
	ulYXSpcAN6t3DNtXbJjEneJdbyZ4LlKm1OQKWIg5tD/bsZQroTToIT6xwXg/craP
	up/3lQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajt5kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 12:25:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4b8e9112so252013885a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771331145; x=1771935945; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ne+Xdf/klpNlR1z4hftn1Ok1OX4m0aO3qAGj4Do7clQ=;
        b=ZWfQ0r9CegZICSEV4nNg9k0N2dC+Lel7TmL17G6oW4sbEOkC11F0l2ZUEbd94/bTIO
         mNiY99Zuysw3rL7zK6zGpQu84uoLtiKxROvKWU8uVhcXfk58qKY3KZjsQobTAmxN0Z6O
         gqG+X0TeT06sv6JtmXV0rcYnfKdvRZcHony4OpEK4v4pZt7o7InbuOP8Yc1jEwU60Iws
         PDT6EreUn67xbOZebt+PDXh1hLDPPmC3DBjt6DZiSOQOBVtC7aA3f6qx+I5XfzLIFiik
         0GoPR8uu6MidMIH63/7kjlNAyZUOc+hNdMeh59GE6gHualLBR4i+HOJqYD9KjjQp3GAU
         MGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331145; x=1771935945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne+Xdf/klpNlR1z4hftn1Ok1OX4m0aO3qAGj4Do7clQ=;
        b=R5kq7X4vsALNRz/J6Nk2BfNjq2kQ8vkBXIdbVH7Dl+p6qM1mwOSgDXtV2CGjTImXGw
         dnlH32BRUwyvauaV8UilIcI3zAgtDixEet132L8u2OuBTWA+2F0xMn+ruUIIs2G6GqyU
         BHT3oJa0B5TMFR6Wt9ESFPp0u5xvWrRAb226UDsGbjE+oz1h+wno0upOGqnsqboeDv5K
         wQr62CFO28K6rLs2yrXOsog+MtzQgPj2Q2wb/NUXm41IoXAKss6k1JO6koa4v/8uRvDy
         rgY+b6nVBW9DJAxhL4TZG7TAxNXz+BimTJWnsPOeyfPEzaUW+MHeHwBzk67AC6XgD8rQ
         2Vqw==
X-Forwarded-Encrypted: i=1; AJvYcCUr1sAoGqX6IrfPbEHWaWqCd3/+/QrvKW9izrKYiy0A5RWFYmqoHzEqeXdZeQpxzfrOT5DZVmLC5vVYYykJM8ON@lists.infradead.org
X-Gm-Message-State: AOJu0Yykvud97VU1ovj3qwQv+PEh2vEhNJbrCb3UIhjqgGNO2iA2ZPWp
	nkZPvgwfYvWuROG5X2rRg9xmFthBi1W3yWwY03lp37R7IRpBI8lNseL60qH4nDRASgutCpT+b8H
	s8kaec+KU/HagTOhyIUcN6p/mtxpo0+HSjaTx15EMR1RkFKI0oXzC8thEk9rqA1fo/QHXaEJU6V
	JW1U/i+Mqh5w==
X-Gm-Gg: AZuq6aKojjYp0PvLD1KPoUJTucqu/j2WDQ3R5SqOiDI3q/OCIDWqW2jvSeVqEtJ2v3g
	YXMD/e7Ai4GKWZfCUJjbeldq/NRwPEWoPWYvsPWlLBEM9Q7Vd2WxsPTQEePKq7t2dYOY3tWnM8h
	F84OjvhpsEccXB2hjsyDv41KSb4OCe3oux6l/b71l/TpZazesC5rUVeomM/UO5uvI/Wgmx25CJp
	e8XxKqNoDnPNit5EIZyb3zoyg67J9+YERg4GFNAGRu3Sj257p85P4Bnvp4AAeBC97t/w/vylWw8
	hDtlV7Q+73cEoC6JTuB6ghwZ0ymjwUzZvpQNV9/GdVElbloiITFSAIDo8KH2Vne/2cuBVlyCX3k
	dqxfshcc5Z0Dg6uJf3eKcTQAv0C+KJK4gO0w0DNR9IdGSjm0uiQ==
X-Received: by 2002:a05:620a:4709:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8cb42262ee3mr1602128685a.8.1771331145176;
        Tue, 17 Feb 2026 04:25:45 -0800 (PST)
X-Received: by 2002:a05:620a:4709:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8cb42262ee3mr1602125485a.8.1771331144703;
        Tue, 17 Feb 2026 04:25:44 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm36628978f8f.27.2026.02.17.04.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:25:44 -0800 (PST)
Message-ID: <3ae05b60-0428-40ec-a6a8-e60395a8dccd@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: stmm: Constify struct efivar_operations
To: Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
 <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
 <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
 <93de9e85-faf1-4394-a374-f9207bd823c7@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <93de9e85-faf1-4394-a374-f9207bd823c7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwMiBTYWx0ZWRfX7KGdMyDH12yD
 1Ve1Ql00X6XNtbU4YIEXT8tmTmIiM1/pN9Wnc0PZj/ZOveDsMGyvZwQqRkNQQBLZm1XQx0RqOMN
 /j6MFfoGr0Fbya/vFLezewcEl+3nlg6l/ME+hehuRuyEo3y7U+9GkSZj+ceAasmCZkC0gN1mkBo
 rit5MGCWceZb2FvnvsOPpnIMULfYPWxut5/VsIMBzAddTW0jgm5iZfarp9RF2L9wkLTnmPA4BAf
 +v9qkiIGNCrC85clR3VsHLZLh9HwsVqw8ynH64RXjyY0ZSGgh1o1GbH0Bgvpays4nZXAYkkEmMg
 34RTrjYai9gleZgARkbB0UCKONdtUZFp24Pc3G6OvtRhJCRGNJE+aH9K3LwfClMP4joX+bLp3c+
 aisTekoJ0OV+bO2+vJ9RMOBVd4Ve+nW1tSEAugkHKvU4mtjVhembEx0Ok8jyipGEJ82G5wWZNlT
 iH3YyZLsHWagUKyUtFQ==
X-Proofpoint-ORIG-GUID: NR_Mq6YkoGjfS7NfrQid7r4U1BVbyPpi
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69945e4b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=_Y02hFW8pdDoch4LnTMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NR_Mq6YkoGjfS7NfrQid7r4U1BVbyPpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_042548_529793_CBDB3D9F 
X-CRM114-Status: GOOD (  25.40  )
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

On 17/02/2026 12:30, Ard Biesheuvel wrote:
> 
> 
> On Mon, 16 Feb 2026, at 12:07, Krzysztof Kozlowski wrote:
>> On 16/02/2026 11:43, Ilias Apalodimas wrote:
>>> On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>
>>>> On 16/02/2026 10:49, Ilias Apalodimas wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
>>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> The 'struct efivar_operations' is not modified by the driver after
>>>>>> initialization, so it should follow typical practice of being static
>>>>>> const for increased code safety and readability.
>>>>>
>>>>> get_maintainers doesn't include me in the cc list?
>>>>
>>>> I use only get_maintainers and as you can see no. You might want to add
>>>> yourself as maintainer of this driver if that's your part. Or have
>>>> korgalore/lei filters.
>>>
>>> Hrrm, that's weird. Running it locally returns a more extended list
>>> which includes me and Sumit Garg.
>>
>> You might be using git fallback, but this is not a maintainer. It shows
>> random people either involved or not involved (like cc-ing me on half of
>> kernel drivers), thus it is not recommended for daily use and all tools
>> (e.g b4 or personal scripts) do not use fallbacks.
>>
> 
> The code you are touching came in via a different tree in the current merge window, and so this patch doesn't even apply to the EFI tree. Those 'random 

It can wait till the merge window finishes and then it should apply
cleanly to your rc1 rebased tree, no?

> people' are the ones you should have sent this to, if you had taken the time to look at the history of the code you are modifying. So please don't lecture other people on how to use the tools.

We are all using the tools. If Ilias is/wants to be the maintainer
(which I support), please add to the MAINTAINERS file, so the tools will
get it right, instead of relying on manual process of finding who
touched something. Contributors should not figure out how the code ended
up in the kernel because it does not really matter. What matters is who
should take it, who is the maintainer.

This is not a fix, so original author won't be pointed out by
get_maintainer poking at Fixes tag.

> 
> I've queued this up now - I'll send it to Linus by the end of the week. Thanks.
> 
> 
> 


Best regards,
Krzysztof

