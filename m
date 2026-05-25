Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96901CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 06:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKzbzsmYYSmbqPFZ4+On8kOHavD4IAbzLAjB1X3xbfQ=; b=xj+HvEOuaSOKCtqBbzB0lXt26b
	0NnFsg/2uiVr0ZvU0xyAEQe6C0hm/VEBuMJXv2pCj3zoeicTjePVdFoNyuLHfLW7mfgCc3YlxaI7s
	rTwFRw1a7xxCVztxMB0ie6VmLN3H8rgcWAP3C4HtUlRlLfe+lGNmdvTCyJ8KvIsb0FlXB86Qzr/Uc
	0DTBASOCNp9ITGOPA+RcP5PWOAmUzCRI44oInKjKTu3jyHDRo8bZLyHkrhB021bFbYjOhvncvnAN7
	YNnhdnam5j2i02B+n+vt7GWZWbe4GNMBAyNlW7QwBoiTqqMqONmlhBoOrFB6nCUQz8bpTQkxj6WQL
	r8VnFAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPHM-0000000GToz-04Qm;
	Mon, 25 May 2026 06:59:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPHI-0000000GTo7-14qH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 06:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779692345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKzbzsmYYSmbqPFZ4+On8kOHavD4IAbzLAjB1X3xbfQ=;
	b=h+gwy6LeaZgMUiQgBYTJMtYqCpctvTCM3fvGi69pJzaYyY1eYj3kKOaEZSzrg1HpqbpQyX
	inM3CVHSmCtrAHaipCvbDEsaDgpBooITPcRKmywLuxAzuRmH9Gq+/yjBMBv6L0+zE3cASo
	KhvWc/k2Yq7HwyrzS4REQFBxNQ49+DM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-voawvYFMNXGv-sQ9YMOoeQ-1; Mon, 25 May 2026 02:59:01 -0400
X-MC-Unique: voawvYFMNXGv-sQ9YMOoeQ-1
X-Mimecast-MFC-AGG-ID: voawvYFMNXGv-sQ9YMOoeQ_1779692340
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365faf6006dso9173381a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 23:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692340; x=1780297140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKzbzsmYYSmbqPFZ4+On8kOHavD4IAbzLAjB1X3xbfQ=;
        b=psoYdATYDOJFCcN7QHlic1t49NkXgWI/RI1UXxV/5ZpCEfWEDkccaUKqeF+4M9dAmS
         /7x/Kl7FLzWBB0I730RQVbVvtRFmNSJGWHRH53mb79NnfoWyBxTyviz/vbBFr8ybiTDV
         SYwE+2rSeZfdncQ+AuDcf0ST0hZM4k0WiGsJGkecVYviyCRidQd/T8a4w7G5W+xHhp9I
         6eVcgSJHHKTAirXP2AEhTekyWfbFL25F8XKQ+Cx3LYgLMas7PGLHZ2LNgkAYqyvdVvZ4
         juSbxXdK78z/UWxgtOSL3xZTDSTnmgWEua8CkyPpJS8r5WZH7+1Z6TEisYeNhoJlQUOf
         GHSg==
X-Forwarded-Encrypted: i=1; AFNElJ9znaBnx/RSRnJJSyYIH5JWZqsfI5nZskkE2B3xPh8wLfmaXNis1cgBaUUrjws1Sj0AO01Gjo+VGgQOZqEYlVXv@lists.infradead.org
X-Gm-Message-State: AOJu0YyZfd4hZSBiip1iBvjwOjxTJ4QphGdtu2ZHfDS8e0t/F3RcTKc8
	zdmJNYSid0awc3AvQSL32tL55R3mtkCzwrj6gD5qI3UNkNrV9WmUtsDu6mLUCPcxqf2DxVf2LdU
	CL43DZ6Gtj3NLxkxVNgMryJhPYQYvDuELFn2K0mqgNgaflneQo9U/ZLn5c0E9y06YzAWaP4bNHp
	k2
X-Gm-Gg: Acq92OEPhCcnu1X9bqxOd9FVehvuw9Pn8KBMz1i1WGY/s458LA1wNzKgpQZT8MDQz10
	Gu7qb+KU+LxDWnFPkNMrRORLyq+ll4lL8uF/lniD05IwWoXVltrmGpXW1P9k+1EEXYykwRrqSLM
	7Winx2oXeNkKmz58tMmon9UYRxpiHyEXjNsG7coOmyzKaYAfUTrrGW8OnXmYEXjrCg2iHuDDCIT
	2e1te0k05+mQwpYzbtusYW5ySmGid9rcsp3NfG6y3B7eOlA/ngM+lRuRYtO+TD5nZWmCJHcaRoX
	Z627RI1sjmBzdeuGLmFCUFkI218EwnL2MP3fdM3HHKwk63mFwf2bDoav/NWBqsxAHxgMZZtYvwh
	nEzXFuR+sdikyGwnGH3BNFVhzQmlHGp4TN3aoKZqs8LHZa0C8tmwbUt+BoYbp0ENo
X-Received: by 2002:a17:90b:264a:b0:36a:dd29:d7f5 with SMTP id 98e67ed59e1d1-36add29da45mr2445587a91.15.1779692340193;
        Sun, 24 May 2026 23:59:00 -0700 (PDT)
X-Received: by 2002:a17:90b:264a:b0:36a:dd29:d7f5 with SMTP id 98e67ed59e1d1-36add29da45mr2445545a91.15.1779692339628;
        Sun, 24 May 2026 23:58:59 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6ec5a287sm4863571a91.0.2026.05.24.23.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 23:58:59 -0700 (PDT)
Message-ID: <3a0f6277-2b68-45db-a07f-16a177b0586d@redhat.com>
Date: Mon, 25 May 2026 16:58:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/44] arm64: RMI: Check for RMI support at init
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-7-steven.price@arm.com>
 <ee494ecd-8979-40f2-896e-82137abbf440@redhat.com>
 <78425c0d-86c5-457f-b171-a4c8dd3acb7d@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <78425c0d-86c5-457f-b171-a4c8dd3acb7d@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MMJ7fpfo5p_qtw5vG2v5lt5puYmkmZMW1sNy0MsxOds_1779692340
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_235908_375817_4AC02E0D 
X-CRM114-Status: GOOD (  27.50  )
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

Hi Steve,

On 5/22/26 1:49 AM, Steven Price wrote:
> On 21/05/2026 01:39, Gavin Shan wrote:
>> On 5/13/26 11:17 PM, Steven Price wrote:
>>> Query the RMI version number and check if it is a compatible version.
>>> The first two feature registers are read and exposed for future code to
>>> use.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> v14:
>>>    * This moves the basic RMI setup into the 'kernel' directory. This is
>>>      because RMI will be used for some features outside of KVM so should
>>>      be available even if KVM isn't compiled in.
>>> ---
>>>    arch/arm64/include/asm/rmi_cmds.h |  3 ++
>>>    arch/arm64/kernel/Makefile        |  2 +-
>>>    arch/arm64/kernel/cpufeature.c    |  1 +
>>>    arch/arm64/kernel/rmi.c           | 65 +++++++++++++++++++++++++++++++
>>>    4 files changed, 70 insertions(+), 1 deletion(-)
>>>    create mode 100644 arch/arm64/kernel/rmi.c
>>>
>>
>> [...]
>>
>>> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
>>> new file mode 100644
>>> index 000000000000..99c1ccc35c11
>>> --- /dev/null
>>> +++ b/arch/arm64/kernel/rmi.c
>>> @@ -0,0 +1,65 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2023-2025 ARM Ltd.
>>> + */
>>> +
>>> +#include <linux/memblock.h>
>>> +
>>> +#include <asm/rmi_cmds.h>
>>> +
>>> +unsigned long rmm_feat_reg0;
>>> +unsigned long rmm_feat_reg1;
>>> +
>>> +static int rmi_check_version(void)
>>> +{
>>> +    struct arm_smccc_res res;
>>> +    unsigned short version_major, version_minor;
>>> +    unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>>> +                             RMI_ABI_MINOR_VERSION);
>>> +    unsigned long aa64pfr0 =
>>> read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
>>> +
>>> +    /* If RME isn't supported, then RMI can't be */
>>> +    if (cpuid_feature_extract_unsigned_field(aa64pfr0,
>>> ID_AA64PFR0_EL1_RME_SHIFT) == 0)
>>> +        return -ENXIO;
>>> +
>>> +    arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
>>> +
>>> +    if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>>> +        return -ENXIO;
>>> +
>>> +    version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
>>> +    version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
>>> +
>>> +    if (res.a0 != RMI_SUCCESS) {
>>> +        unsigned short high_version_major, high_version_minor;
>>> +
>>> +        high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
>>> +        high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
>>> +
>>> +        pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
>>> +               version_major, version_minor,
>>> +               high_version_major, high_version_minor,
>>> +               RMI_ABI_MAJOR_VERSION,
>>> +               RMI_ABI_MINOR_VERSION);
>>> +        return -ENXIO;
>>> +    }
>>> +
>>> +    pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __init arm64_init_rmi(void)
>>> +{
>>> +    /* Continue without realm support if we can't agree on a version */
>>> +    if (rmi_check_version())
>>> +        return 0;
>>
>> Is this still a valid point that we have to return zero on errors returned
>> from rmi_check_version() or other other function calls like rmi_features()?
>> arm64_init_rmi() is triggered by subsys_initcall() where the return value
>> needs to indicate success or failure. It's fine to return error code from
>> arm64_init_rmi() in the path.
> 
> Hmm, I guess now this is moved to arm64 code this indeed doesn't need
> to. Within a module I believe an error return can fail the module loading.
> 
> I'm not sure it really makes much difference though - if this
> initialisation fails then it's not really an error - it just means the
> feature is unavailable.
> 

I think the return value would be consistent to the value of 'arm64_rmi_is_available'.
'arm64_rmi_is_available' is true when zero is returned, otherwise, 'arm64_rmi_is_available'
is false.

With the consistency between the return value and 'arm64_rmi_is_available', users are
able to know the value of 'arm64_rmi_is_available' through kernel parameter 'initcall_debug'.
With the kernel parameter, the initcalls including arm64_init_rmi() are traced and its
return value is outputted in the traced messages, seeing do_trace_initcall_start().

> Thanks,
> Steve
> 
>>> +
>>> +    if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
>>> +        return 0;
>>> +    if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
>>> +        return 0;
>>> +
>>> +    return 0;
>>> +}
>>> +subsys_initcall(arm64_init_rmi);
>>

Thanks,
Gavin


