Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65751F33807
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxtOz2CsJytYBKr87iuTorThohE/w7ZLhrUsPVVvNZ0=; b=T8tOihbqXIIdicBYK9g76zUzmj
	s7yNT/4luqfXty1RMuK9L8BPcXfPdALpBxfawR3Qutm79uu1gmfG+6huG+XOF14fywJwOeo3n/kor
	eTlpUNlqoFab0bCXO4aBj7pSXofYvburGa+Ed5HEJCSnJMILLQTxgMaxaibvelWn5xY3j5kKG7ea2
	5Y4sFETGbqYmdLFS88lNXvd8Nbquf65cR93h5OARiLn7yB3uCP/FzhC7/J9CzvbCDeQZYD5n22hHs
	Nq80Gijwxaqi8OO3F9p35mtgv2CVi0TPq0DjMdQO45A3uQ/cOXeIe7p8zNvza26Zcr6D9cA/9onUu
	jSPA1oEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OkW-00000005YwB-2gfm;
	Tue, 17 Mar 2026 07:21:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OkT-00000005Yvg-2aNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:21:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4NltI1428760
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxtOz2CsJytYBKr87iuTorThohE/w7ZLhrUsPVVvNZ0=; b=gHzRIkXhEUr9fMLr
	SyB/M5Ot98weHpB+ZuPy0nqVDwKYjAURuTPKx16t9bTyeDrcga3OXOXOPmenXgFk
	59XKyp2WJLpJlD65WFqVa7SCJK11GqzSqN0S4AQqtgE14rnxmuZtLCOQ3reYw9ar
	bHxQqQEJRdHSFUD4t6tDYRzWUR//NXxK2i+q1AQdzIbP8wcqpc9b4QIKqhMKAum8
	eXFIa52+qXQuPtphf6R/iG4NWoSBDMTiFknrpA4vrTOIKUXK79TmkZAlnoljtY++
	+WuQreqk70cIfr0i2r/7jXuywIeYwt5lPshtaJZG9fPoiYNzXP/VUFq4X6/Sqle5
	EyLjMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99bnd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:21:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b9259921fso1646690a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773732110; x=1774336910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxtOz2CsJytYBKr87iuTorThohE/w7ZLhrUsPVVvNZ0=;
        b=Lkw1h4IceiR2u6z1lETkYcflR90HyO2B7uEacBMhHW5gHchXtFpDTyRc1cPBS23UqE
         yvK6tWixQkpHGF5r2Tur85FH3+4EG+11UBF6BYwtyEhPMkSRiQ0BAURbf4hIXmt9Q+na
         ekuXz7NP30N6GXs80qc9WVzI/UABHUIlR3Hr5EIZbFSwqybXZFkrW4BG6pdA1wLOrt5r
         qgjp6PwGOlNBK9e39nvPSoVgFhNMMCVApLqG9+2eqQPoJ7wRaHX7BSKG2mrll4dvHXeJ
         xiNWIJ7VTw0uGcowrXdhyfMnM90n0zbEVZ80SIixvS/8zKhx9XXEEpWKrSUyGnUI3e/k
         Rmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773732110; x=1774336910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxtOz2CsJytYBKr87iuTorThohE/w7ZLhrUsPVVvNZ0=;
        b=ch69/PIfmt41uQSo0Qs6kVLUWx5D0RMYh/vtRiC8b8iwzyhwZAeENHmip7VbzT1A3X
         OsADYjkGhnzr2BqNDvkZMggB+NRrEN/O4RedsD0iILNnwd0BbldY0LRg+8Sq77zVZXTD
         A52oP/1RLi8BOq2LSWVkfOABlkZ7nrNsMchogNFiYhKLDVKNMS36YZYmRlalTfft8+vS
         MANwbpuY+M/iOmGqooYMs8e6hLXqbqy3KMFWn0i3Og/W+IG7Nw5DHNtosqc3u4RJvIJ7
         vcqJE3e6J7ik3QAC0BxQQDWASvnbd1xnBPOw5d2YK5FwXj94+EiHlUBXmvjMv3eMka8X
         tueQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoIoq7R8hYDSQBbUsCKmmsD9U08hhAtxjF7UZEZu2iC/bwOuyFHn5NGYmbO6KotVhQ45opTdHI7FHOJhewyw0g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3v6fUcKxuVGB6diyvRjZmqrkyeUNxwyAY8GKKUQIJcAy6byPm
	95MuO7ntUaSYdArRD80d7i/tOe5ZRYVFiAdChW+XpxrWWlp4RZ57BX0zTTLEM8fcrMGsE3lptAh
	JyQgJjPfOuAYC7UdYDFtBJQhjMjF4hnbQgmzYOBwRbryIY7KljT5BtM3vzqBmI39PZ8lMF8bwNR
	CAVw==
X-Gm-Gg: ATEYQzxVecGQJNbngp+yJsCoZ3PglOg20uzBPe8AYGyAQvMvqvq1FpH3gMYB/9H2Ryz
	7J9r+4GvX5aqjXVqibbPHWFNr9avH/Pg2PouwyMPGq+LhrPyGCvHyuKrBPOPNZIZkqeecNogsTx
	tEH2dijEjo3Jm+MjABv5SrJRdhqr5kfeSeN6LMTqft2d3MJya45J1vjJuUA+kCmWPQ2FuL+ZpU5
	LRUxQ9v1OwU32PRbbmkV8Qqhvwj+9qNkPQkrb+QSFSWZGXdRD/o01rYSjnJTE265PjVZ1Zwl7vA
	d6rtA64K4Q1v4LNxFt+tVJnVxZDKf64jQaoqH6p0xh853Xh3NwaI4uaGTrrEDGobRSAFokmmy4E
	MYVbsBuPrIFtMKL5VHLkaD8M12l0um2/Z8X+vzKQd69DUQld/LQ==
X-Received: by 2002:a17:90b:3d4b:b0:359:c479:fc68 with SMTP id 98e67ed59e1d1-35a220aaff9mr9161921a91.5.1773732110573;
        Tue, 17 Mar 2026 00:21:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4b:b0:359:c479:fc68 with SMTP id 98e67ed59e1d1-35a220aaff9mr9161903a91.5.1773732110083;
        Tue, 17 Mar 2026 00:21:50 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcb8b9sm2417780a91.13.2026.03.17.00.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 00:21:49 -0700 (PDT)
Message-ID: <95d2de63-5571-4fce-aa32-6e8969bb9149@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 12:51:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] Support Armv8 RAS Extensions for Kernel-first
 error handling
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
        sudeep.holla@arm.com, rafael@kernel.org, robin.murphy@arm.com,
        mark.rutland@arm.com, tony.luck@intel.com, bp@alien8.de,
        tglx@linutronix.de, peterz@infradead.org
Cc: lenb@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-edac@vger.kernel.org,
        mchehab@kernel.org, xueshuai@linux.alibaba.com,
        zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
 <edf7e7eb-8f02-4672-bc31-16e0a8fb9715@oss.qualcomm.com>
 <d4e4e2b1-c182-42f9-9d60-b12f0fd7f977@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <d4e4e2b1-c182-42f9-9d60-b12f0fd7f977@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b9010f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=IrbkRpuHRcUsFRyD9lEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2MyBTYWx0ZWRfX+lEvIRgSxbuT
 dc8v0hbafrrdRTrIfNFUEN1seIShILBfhmU3bif8HQ2dzh8vXnW1dNT9dvf1OE3ArmNUztWIDjc
 wGAJdWQZ7c1b8k77BUGSYAQFsOhd7UWieQPcC1fvSY9JM6ofeF7qZIi/Kib0FKAF3oHwuZNXXPq
 zoT+jY+QLUOHklgKqc4CqfqdUInZPrXxXPqKhgaZC5OhCAYyN/PDrl741EbDogzmlu0rPY9OTe7
 Ugx5eAwV6Rlt5xSDbwTWqJGSVnMqniNI2cSrfRKimBxW1LkokSeQfe1sgu5KidKDk1Mb/rrfEqB
 LIfH/PqplLyrjLKyIZjntWJro4qd0/1EEgtKxqBfR5GzfQyVeCTeqmT7EnLSt07zbClVpfDZirA
 tPn5qC1nEqFGX80dbj6FjxMA3faR31LXbroV0EUJbMsyJnXuJNoKNCb4rE8yEV7hJlAjmv9t/yn
 yNiMgisOKD84vzqYQYQ==
X-Proofpoint-ORIG-GUID: qMeUYaHt_21H8tCqESSgUm_fK-14k9OM
X-Proofpoint-GUID: qMeUYaHt_21H8tCqESSgUm_fK-14k9OM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_002153_664981_F5C6E047 
X-CRM114-Status: GOOD (  28.85  )
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


On 3/11/2026 8:55 AM, Ruidong Tian wrote:
>
>
> 在 2026/3/9 21:28, Umang Chheda 写道:
>> Hello Ruidong Tain,
>>
>> On 1/22/2026 3:16 PM, Ruidong Tian wrote:
>>> Motivation: Reliability in Modern Data Centers
>>> =================================================
>>> In modern data centers, proactive maintenance is essential for achieving high
>>> service availability. The practice of using Corrected Errors (CE) to predict
>>> impending Uncorrected Errors (UE) is already widely deployed at scale across
>>> the industry, like Alibaba[2], Tencent[4], Intel[1], AMD[2]. By analyzing CE
>>> telemetry, operators can identify failing hardware and perform migrations
>>> before catastrophic failures occur.
>>>
>>> Problem: Inefficient CE Collection on ARM
>>> ==========================================
>>> Currently, ARM-based systems primarily rely on "Firmware-First" error
>>> handling (e.g., via GHES). This path is inherently heavy-weight. To avoid
>>> significant performance overhead, firmware is often configured with high
>>> thresholds—reporting to the OS only after thousands of CEs have occurred.
>>> If the threshold is set lower, the high frequency of errors leads to
>>> excessive and costly context switching between the OS and firmware.
>>> Consequently, ARM platforms currently lack an efficient mechanism to collect
>>> the granular CE data required for high-fidelity error prediction.
>>>
>>> Solution: Kernel-First Handling via AEST
>>> ===========================================
>>> Other architectures have long utilized "Kernel-First" approaches for
>>> efficient CE collection: Intel provides CMCI (Corrected Machine Check
>>> Interrupt), and AMD has recently introduced similar CE interrupt support[5].
>>>
>>> On the ARM architecture, hardware already provides the necessary RAS
>>> Extensions[6], and the ACPI AEST specification[0] defines a standardized way for
>>> the OS to discover these error source registers. This series implements
>>> AEST support, enabling the kernel to:
>>>
>>>   - Discover error sources directly via ACPI tables.
>>>   - Handle CE notifications via direct interrupts.
>>>   - Bypass firmware overhead to collect every CE or use low-latency thresholds.
>>>
>>> This implementation provides the missing link for efficient RAS telemetry
>>> on ARM, bringing it to parity with other enterprise architectures.
>>
>> Thanks for posting this series enabling kernel-first handling for the Armv8 RAS extensions.
>>
>> We noticed the current implementation targets ACPI-based server platforms. For embedded/SoC systems, Device Tree is often the primary firmware description.
>> Do you have any plans to add DT-based support for the same flow? If not, do you see any blockers to extending this series to support DT
>> (e.g., DT bindings + discovery/registration path analogous to the ACPI plumbing) ?
>> If DT support is in-scope, We would be happy to align on the expected approach and help with review/development/testing for DT-based platforms.
>
> Hi Umang,
>
> Thanks for the reply.
>
> Adding Device Tree support should be easy. We just need a patch similar to "ACPI/AEST: Parse the AEST table" to fill the DT table into struct acpi_aest_node (might need renaming) and struct aest_hnode. The driver part requires minimal changes. 
>
> However, I'm not very familiar with DT and lack DT engineering support, so I would need some guidance on these DT-related questions:
>
> - Is there a specification that outlines the reporting     requirements for RAS extension information that is similar to AEST? 

Currently there is no spec/bindings defined for DT based systems. Based on discussions on earlier posted patch [1]  - expectation from maintainers
was to have DT bindings aligned to and equivalent to the AEST spec. Based on this expectation - we plan to propose DT bindings - which are  aligned
to AEST spec.

[1] Re: [PATCH 1/2] dt-bindings: edac: Add DT bindings for Kryo EDAC - James Morse <https://lore.kernel.org/linux-edac/312fc8b8-7019-0c74-6a92-c6740cab5dad@arm.com/>

> - How should the DT be designed?
>
Same as above - plan to align DT bindings equivalent to AEST spec.

> - How can I develop QEMU and modify DT files for debugging, etc.? 

We can share the steps for this for DT based system in this thread.


>
> I would be happy to adjust the patchset to meet the needs of both parties if you are prepared to invest the necessary effort（DT-related）. In reality, I believe that just a little modification is required. 

Thanks, Yes - we are open to contribute in extending this patch series to support DT based systems as well.

[...]


Thanks,
Umang

>
>>
>>>
>>
>>
>>
>

