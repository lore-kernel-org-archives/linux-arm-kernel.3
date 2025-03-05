Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED78CC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 00:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+nZIdJ+GUg9TiIWa5Z45oEZwDdDHGq5zn5aUSYMnu4=; b=odeoRwTU47cdeoHEgVWmpanLiO
	a9Vf6rPDYxL3xqu7XnyMymrqBlT9h7Jt0NOnSoiPwXLF1J3di0bNBOvVKsqWRgJMiH9z3WbyZjHAg
	eji0NcvN3WvBTmV64yffY5QZFGZw0sbIhNGqBd2Cl5r5hvLk94cPHcAUgvWEVoQxWf9RZCCLra5Gz
	cWR8bP1gYa29KpmnGqIUxpRHQnCRin0/hM3VImWmeoTor1zzmI+xkh3UgqWSusCIwo6VgQCBcN3kR
	OhAgvdnldXqFsPAwsiJ7Bm65MlU3Y8C29gP3D66uWwOiyjNR9hfpxODbdBjEkKqrq9Py1qnA107f/
	DOjbWFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcSO-00000006bxw-0T9h;
	Wed, 05 Mar 2025 00:17:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcQn-00000006be3-0iM6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 00:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741133772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+nZIdJ+GUg9TiIWa5Z45oEZwDdDHGq5zn5aUSYMnu4=;
	b=b1TB9YDtXw6fCDL0gQgkuZ6cSez8JSsDghJBo9uqn4vAA6Z6Pf8VayPQnoBdw/cQbxPVFX
	QuzT+47tUnyGbmZq9Tx1PaSqO8JwthFsP7HGXB6QbTDJ0KdN0WAlqDnuzVFEvp0xXgapLL
	7ZU2iJPMKbOLxSeAVWAyqEbLwJ1ApZo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-TaFM4QujN_euwmWOVXX-0Q-1; Tue, 04 Mar 2025 19:16:06 -0500
X-MC-Unique: TaFM4QujN_euwmWOVXX-0Q-1
X-Mimecast-MFC-AGG-ID: TaFM4QujN_euwmWOVXX-0Q_1741133765
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22379c2e96aso24681915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 16:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133765; x=1741738565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+nZIdJ+GUg9TiIWa5Z45oEZwDdDHGq5zn5aUSYMnu4=;
        b=lQba6edDcDBBqEqYGrxXtf6sAEZ9O7KSOEBiKdRGsSpY5dOAZsN7I+t6sVjubtI0GS
         k1H+cF56ldA6aAL7XLkaDiPKkSBq0Fmdv8hPSVQSVje1Pyx4kJuerZG9ZNPhwaC+ZPUZ
         PowwNME9jlf08dTg/zm5mkPN5cvuY296F9UHeWCFt2lnRtGLrbLPxHKdirKtwA0oU5I5
         m2FmzmFBMAQ/SdrvgTCzAAuR+YHxCWI4ZN4CMDk6iHfTi7qmqVbAqvZRMy4VA5pOseda
         pu0wFFM9A26+zoiuVfX7PVMum/EvSx33SIpdeBngztnOqvcWTKrIB6mjmLngOFW37+fi
         Buzg==
X-Forwarded-Encrypted: i=1; AJvYcCWSJRnM/WbtyTTbCgsGoaNRgEkVFt8NADlrDAjPV6aWtIwj31003aSgUkazHCqPT/xnULZT7smM2Izy8+6ADBa4@lists.infradead.org
X-Gm-Message-State: AOJu0YwMs9MrLyccVhI7bmeh8PRsHE2iuAgp8EZ/sdrAmbO7edO7BiDq
	pUpOnAA145cckhj1JJSM8sRj6PgWuD7q+6xPa4PwZf9qRqQKbMKpnI59UCyEWIksKC5AXVAXpIC
	13dOhzI5m5Y2tDE4rFdGptcG6IwR9Mu9QQehU54MlU5ytYwHju4Ohv/amFPpXR5s/CNyYo1qO
X-Gm-Gg: ASbGnctgV068Gb5yefvF9qbkVN8ZGvOa8H4/vBGvAtUYy2ZWcWKPGVv4/CA+otVCWey
	oM1sTAgjCY7uPJjT7x8kWh7RSlJcV4JhnkKwn/oDed0kDWcIuEzgqd7/JaenyF0xzswjPFchqQx
	UlpzP/AsCzirT4A9cyO7Avni2pxKsotgObZqJAkVSKH0NnCLsdOqpy8mqDGL+ho8IV36L02Pmja
	fSQ3HcwsqdDb5kkZGwmFtnqN7EAECfV3I8KNnOpm+b4x19eoDtNR2rKTxKanP3YnUatsFhNFkqH
	+etzzh3MjQalZ0w=
X-Received: by 2002:a05:6a00:b42:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73682b73e82mr1248269b3a.9.1741133764822;
        Tue, 04 Mar 2025 16:16:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtbldcyedC0VzElSl5L414yZHuxZ/AzfRFOHxkoXbZKPjFlAxwXPjGCGBZbMPisg2mcwac1Q==
X-Received: by 2002:a05:6a00:b42:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73682b73e82mr1248225b3a.9.1741133764350;
        Tue, 04 Mar 2025 16:16:04 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363a0f88bfsm7109144b3a.24.2025.03.04.16.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 16:16:03 -0800 (PST)
Message-ID: <1e1aa766-c358-4a4f-918e-f0044fe499fe@redhat.com>
Date: Wed, 5 Mar 2025 10:15:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/45] arm64: RME: Add wrappers for RMI calls
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-6-steven.price@arm.com>
 <8f08b96b-8219-4d51-8f46-bc367bbf2031@redhat.com>
 <59f84354-e890-48c8-ba06-87dda471f364@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <59f84354-e890-48c8-ba06-87dda471f364@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fTzPIiic6Z85RcTMzjc3xaghJCvTawOfaSofRjnpAQs_1741133765
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_161613_280937_70FC86FC 
X-CRM114-Status: GOOD (  22.80  )
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

On 3/4/25 1:05 AM, Steven Price wrote:
> On 03/03/2025 03:42, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> The wrappers make the call sites easier to read and deal with the
>>> boiler plate of handling the error codes from the RMM.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes from v5:
>>>    * Further improve comments
>>> Changes from v4:
>>>    * Improve comments
>>> Changes from v2:
>>>    * Make output arguments optional.
>>>    * Mask RIPAS value rmi_rtt_read_entry()
>>>    * Drop unused rmi_rtt_get_phys()
>>> ---
>>>    arch/arm64/include/asm/rmi_cmds.h | 508 ++++++++++++++++++++++++++++++
>>>    1 file changed, 508 insertions(+)
>>>    create mode 100644 arch/arm64/include/asm/rmi_cmds.h
>>>
>>
>> With the following nitpicks addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
> Thanks, there were a couple of other pages and params_ptr references
> that I've updated to granules and just 'params' too now. With hindsight
> conflating pages and granules in the earlier versions of this series was
> a big mistake ;)
> 

Yeah, that was because the assumption was the page size and granule size are
equal(4KB), but they're still different things. With the intention to support
ARM CCA on host with non-aligned page sizes (16KB/64KB), we have to differentiate
granule/page.

Ideally, the granule is only visible to RMI calls and their helpers. An new memory
allocator seems inevitable so that the allocated pages can be distributed on requests
by various RMI helpers in granule. It means the allocator is the line to separate page
and granule :)

Thanks,
Gavin

> Steve
> 
>>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/
>>> asm/rmi_cmds.h
>>> new file mode 100644
>>> index 000000000000..043b7ff278ee
>>> --- /dev/null
>>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>>> @@ -0,0 +1,508 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2023 ARM Ltd.
>>> + */
>>> +
>>> +#ifndef __ASM_RMI_CMDS_H
>>> +#define __ASM_RMI_CMDS_H
>>> +
>>
>> [...]
>>
>>> +
>>> +/**
>>> + * rmi_rec_aux_count() - Get number of auxiliary granules required
>>> + * @rd: PA of the RD
>>> + * @aux_count: Number of pages written to this pointer
>>                    ^^^^^^^^^^^^^^^
>>                    Number of granules
>>> + *
>>> + * A REC may require extra auxiliary pages to be delegated for the
>>> RMM to
>>                                          ^^^^^
>>                                          granules
>>
>>> + * store metadata (not visible to the normal world) in. This function
>>> provides
>>> + * the number of pages that are required.
>>                      ^^^^^
>>                      granules
>>> + *
>>> + * Return: RMI return code
>>> + */
>>> +static inline int rmi_rec_aux_count(unsigned long rd, unsigned long
>>> *aux_count)
>>> +{
>>> +    struct arm_smccc_res res;
>>> +
>>> +    arm_smccc_1_1_invoke(SMC_RMI_REC_AUX_COUNT, rd, &res);
>>> +
>>> +    if (aux_count)
>>> +        *aux_count = res.a1;
>>> +    return res.a0;
>>> +}
>>> +
>>> +/**
>>> + * rmi_rec_create() - Create a REC
>>> + * @rd: PA of the RD
>>> + * @rec: PA of the target REC
>>> + * @params_ptr: PA of REC parameters
>>> + *
>>> + * Create a REC using the parameters specified in the struct
>>> rec_params pointed
>>> + * to by @params_ptr.
>>> + *
>>> + * Return: RMI return code
>>> + */
>>> +static inline int rmi_rec_create(unsigned long rd, unsigned long rec,
>>> +                 unsigned long params_ptr)
>>> +{
>>> +    struct arm_smccc_res res;
>>> +
>>> +    arm_smccc_1_1_invoke(SMC_RMI_REC_CREATE, rd, rec, params_ptr, &res);
>>> +
>>> +    return res.a0;
>>> +}
>>> +
>>
>> 'params_ptr' may be renamed to 'params'.
>>
>>
>> [...]
>>> +#endif /* __ASM_RMI_CMDS_H */
>>
>> Thanks,
>> Gavin
>>
> 


