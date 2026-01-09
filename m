Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9771D26D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=; b=pQn0R2TDUrZpo+6hWbsExHtgZA
	5rwfvq52hbmFsyV+vGlDGgCktWp5yjYKzAtTQjzDGuZFvePLrp1gefevp2WxRS3V+sZcoUInHxG6v
	tE6z92BDM8NoO90gbJ2b2aCYIL3aUhDlcQ84Ogr0E8EqdCXD2kbzxc/gtQwCRe6tFPllSXjOJD4yj
	CHCDEMw0f8eLnfvnYHQ8y7dRyRnnBaeSwBi4SsG2w3mdvqsZVeDYDc/Ty4+PDROCcJQ/5J/pdzxNI
	RWanzCljtPedWhX+gH4VgoCANWoOY/0oXf67RN1S6/OP3TnBrvLue+KdVrSTVptPaRQ/b1Qz0F0rK
	VSO3m36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEHy-00000002T1w-2PWa;
	Fri, 09 Jan 2026 15:20:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEHu-00000002T0I-0tJW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:20:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609D4aej3019338
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 15:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=; b=KxPoJCGMd2q3ygLU
	Hq8LIjz4xl5PNqjiQ5vpUjELOg4YFU0Galj1+LDodqf1jmHCZyBHtpXc0zsWDQHq
	AOnk6oLA6TWcPSkliboJhzvpqJqSi+P8fIRapAv3PpEVjUkuBLYM2bq2JSm3t3LX
	mixYHafZqiZQmE5Xbph8rV1OkitED2NJGLwjSRoGw3DRMCWs56awEQYiRrtCVKoq
	3/HUzuiYfRnUL8DUErBdscKxUBEwLSOGvYYuYLW2zURUcBqQ2Z9lcqOAPGwt7tp7
	vlPzObkiYa/JfA4PDQb8kYaUu3rObLeJRAylvPJDpxR+xVuPrdMTiE61ynlbtaY7
	hINskA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3k5ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 15:20:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bc4493d315so1033042685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767972028; x=1768576828; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=;
        b=iGUFLNz+xrUei/dufDytOk/foUKsf3mw+ahWc6TD/BP1o0InJYojzcfQylJToFuvcz
         g2nrJe9GY6fCFWUN/UDRjL1xZMAhoT2t+AoXcJ5oOl5xVJ7T/mIU7YZ1sO0r5EE7P/Mj
         xi/USNnQf3d74CRusUrcU/GvLZQqicuo0IgKUzChh6J7VqVGex2YgkOPIKZx3tIcPKYl
         P8/HJLZK2LKaZNHUnIXitmj2AD6ytTcJesHCjqp6uwYrqENVfavm2YmBe728fVwtwoQI
         ffVkZtWEUNAbD9SMEiPeuW8DClVPZ5aAB6snXjTZk1K0AgU+dqFt1bCk/8huCdQor1DG
         ZR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972028; x=1768576828;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=;
        b=PaSj+s68QJmYj7nGMXulVlAnzFS6u17Mtxm0Nw5o92VtYlq9CUhSMw/iMx0Bwmofvp
         SXKnPN2GgE7okrmA1g7PySihfXcgBpZag/bGGmtvnnVxMAPq4KAnopZpagvy6lBoPoMv
         x+qNhLxf9xE5l8HbXD1A7srnh83U7OZA9ZEWIkv3m1jPzaqK4fT/xM8uPZqb3ryc6RAv
         3m5lQ3RnKtOXBHaOfpkBiUhtbRn4RnZRwX8BZRxqRxPSj5t6qoqI/1Bd/thWIUCsym7T
         SsdTK0SVLdme1IFD68I4y9DL/OFdq83ZQu3yipZ1rVk8RwwgBXSrkt9r0osa5FXrSq/U
         Fxgg==
X-Forwarded-Encrypted: i=1; AJvYcCXpUobzifNEKh1YGrn1Xc3E0LVdUZrvT9t6yaqBbbkY2qJl1W6kgR3y2NJ3e38FJGYgLYGZX2y0fkgSrLeG+06u@lists.infradead.org
X-Gm-Message-State: AOJu0YzVzrzLws/IgByZ5heXL9nUjf07KFRuohblccUr30IyyZJBMgVI
	hT6lp/tEQ0z7T2M4t/Szck4CvrbJQdoyxoaZMNmHrt+8YJ90kIzGtDf4xptnEu5/DvkEch8cdAu
	KVhuC4iZmMWo17A6unMLoVuhgmi5AhUnXqd1+vONXbdnNG7zPbvFLq+vkSJIxfxxw89fr2DWgtJ
	hP2Q==
X-Gm-Gg: AY/fxX6uJE5xdkstxYFxi8FlMGo9hMiT50hvIMdrkrYcxF9GQLKaTz47w3PtDyrP6cg
	nhWzmEWQqmn1rLusnop4U4rBAon7qSf5IepkxibmVcXQVJ2/YQFD9RExWG/rNz9oJnDZGzaSt13
	0IqFmSJXwQEgjEd6RCD00qLKBExXBO9tBpbrrlm+zNdxze/zkNfvT7NSpDy2mFscoQrm49+ugVH
	8gImu4QUHKY+anvNlL07znpLKdBIUXYL32gfR3qHW97qh5h70yYGDjtYKIkHFOqYxwBM/zEv46u
	1Lbens/SCAPV8QnzWMyLh1Qq9/vAYy8RP+JMST2lJTSEC2tyoRn9MYzzyG1OZwY4PkGejC+4C/1
	HviOqsEGj+42Sfo7fnsl3lthUj43N67BcoeSjUw==
X-Received: by 2002:a05:620a:191b:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8c389411a4emr1096206285a.77.1767972028282;
        Fri, 09 Jan 2026 07:20:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4T7EpPkz3EWkla3fr6+RN+eZME331kblvXjFVWSsrchwbSfgu8tBxJVnkAZJ/PMc9qkoTFg==
X-Received: by 2002:a05:620a:191b:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8c389411a4emr1096199885a.77.1767972027621;
        Fri, 09 Jan 2026 07:20:27 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef885sm209365935e9.9.2026.01.09.07.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:20:27 -0800 (PST)
Message-ID: <955e5ed7-6469-4f17-9e8c-3ee06f5dc3bc@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
 <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
 <cd8fc344-37a0-4281-b3c0-29514b97f5f3@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <cd8fc344-37a0-4281-b3c0-29514b97f5f3@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Cuq4yHzOqbpYzGq5ME9pdYRqH6tf0KHb
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=69611cbd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=xCSfWrHGVKLGKJWD7hwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Cuq4yHzOqbpYzGq5ME9pdYRqH6tf0KHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNCBTYWx0ZWRfX4FCwC+ITpcXA
 9u9jX/mb0ecbesVBis70vbxi35MKDEWEqNRdE4k5GwZU3dcLDV17eDh5XitmyZKG6BC3Ir/7bS8
 vEyznRjmHrK/W0BosIlvGRVmyZxRWuC11LdVFhzXBlWxKGwmWrrteaXujOl0o2T1YHybM+HxFpy
 +fCia9zTX0FjBga+UIWSLVEomgXc/H0sHDzcUlDnwuMdlQ2hMyv9SzUC3a5gB8UPjBINewCwLLs
 awyANa/62Xewqc1LrAysKEm2XqD260b1oEZMhgMzfT8fupa0Cp2cL6cdOi2IHvx4XJFzvHamNdv
 Qq0vP1Zx3ydWUEWgw0nnjNggpZAaJEqND7IMSENqBoPZwP2h1arb+BMpxITGJqwU5+E1U7VJsRf
 d3f5huJcK2rEwDFcofD3eH6cZYU/W3KmzAqsbakoYZ68CDXNfFcZYpk7q+/FIFL9Sos0H+sN7N9
 6i/37BPm0Btd8s1r8Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_072030_274943_380B9DB0 
X-CRM114-Status: GOOD (  19.82  )
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

On 09/01/2026 13:34, Gatien CHEVALLIER wrote:
> 
> 
> On 1/9/26 12:55, Krzysztof Kozlowski wrote:
>> On 09/01/2026 11:37, Gatien CHEVALLIER wrote:
>>> On 1/5/26 15:37, Krzysztof Kozlowski wrote:
>>>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>>>> make the code a bit simpler.
>>>>
>>>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> 1. New patch
>>>> ---
>>>>    drivers/bus/stm32_firewall.c | 10 +++-------
>>>>    1 file changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>>>> index fae881cea9a0..92414a4c7bb1 100644
>>>> --- a/drivers/bus/stm32_firewall.c
>>>> +++ b/drivers/bus/stm32_firewall.c
>>>> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>>>>    
>>>>    int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>>>>    {
>>>> -	struct stm32_firewall *firewalls;
>>>>    	struct device *parent;
>>>>    	unsigned int i;
>>>>    	int len;
>>>> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>>>>    		if (len <= 0)
>>>>    			return -EINVAL;
>>>>    
>>>> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>>> +		struct stm32_firewall *firewalls __free(kfree) =
>>>> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>>
>>> Hello,
>>>
>>> I'd prefer to keep declarations separated.
>>
>> Separated how? This is the coding style of cleanup (which is quite
>> explicit around other styles)? Or you meant one line without wrapping?
>>
> 
> I found odd to declare and assign a variable mid-loop but I found
> multiple occurrences of the same kind of cleanup.
> 
> You can drop my comment, I'm fine with how it is. Thanks for the
> cleanup.
> 

Sure, just to let you know - it is fair to reject cleanup.h entirely for
code you maintain (like netdev did). I only disagree with sort of
semi-cleanup.h without following its declaration and initialization
rules, because it is more error-prone, leads to bugs and often does not
make the code easier to read/simpler.

Best regards,
Krzysztof

