Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F764C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 05:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08d10QPRbou7mD/4AaojdjLjtx5I6e0q1cXfeY1kUxQ=; b=xuFQrzrWWIFsw1EMmV8pkV2Ond
	mozVFZ7yQsVxBCzUfGUtIpZIMy4xNC0kcgVDBQX0XjFKObUf6WMDw1/1QkGgcGcLM52jBJufrkQyY
	pzSf8l1kR9aLAsE5Sh0CgJ0CRR2liL2POg6e08U7tjDpiiECAwJtPLC7yfi59UuCWoCGchuqPuKly
	eD7+rxs8HICKhEhzf12+cZHClTUixdY/C1J/Fmiu5tSfRq8CnPpHX65CsIX9Qe2o7MQ3rBYaORGXB
	W11Dz/xn8lhhm45t/wFG6wgr/sKngTY/AB4+PZRPKkrqKJ2ADvJM/vkOBtWN/sRyv81hqdBrcYyGv
	nuSzFdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u219J-00000002kJL-28CU;
	Tue, 08 Apr 2025 05:05:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u217W-00000002k42-1ikW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 05:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744088613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08d10QPRbou7mD/4AaojdjLjtx5I6e0q1cXfeY1kUxQ=;
	b=Cdi+hkKlHZy8aegy/ODLPEFAi2buC3w7dAPVdObwD3fF7B/mcG/6xSrLiGuVhEDkKe4B8U
	5l/6bIJgHJDZ1voFQhWYNRPT5mH1bvx8UN7eO6zfJKGOwIIC2dcfqpejotwsdZl7Z9YeQj
	70RERuscdYqkZA5A1Ve9F506pYtpaXk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-MZs2Smp0McKAOKp0YPrTKQ-1; Tue, 08 Apr 2025 01:03:29 -0400
X-MC-Unique: MZs2Smp0McKAOKp0YPrTKQ-1
X-Mimecast-MFC-AGG-ID: MZs2Smp0McKAOKp0YPrTKQ_1744088609
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242f3fd213so38685285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 22:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088608; x=1744693408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08d10QPRbou7mD/4AaojdjLjtx5I6e0q1cXfeY1kUxQ=;
        b=V70U+MXe05Q5b8egamzJfEEuy0iS1e5UrtXGSsOXT9Pkvq1EFa7FwCjPZ2co3Yl7IO
         AxSJgvmWZ7WWesVRuIMgPCZRYAX1eIMG4WKuidGhiAytdFcag+zY0+MgAjyjbZxTcs0j
         hLJjj1G6g0AviRZaPJ4p678hGA3FnW4yEt204COz0eGIYO4gb9Jo+UtvRhWi9u1r5rfm
         VkFPRrph6/QzB4UxaWvsxcpUnFRtpAJfxp/XDYaUfFU4Q14yRL7uisYGkUHE61Sik5rP
         H/uE+BpaOTOk4EMSZLfyeSFJT0TheEJ4rql4el7hUC2G02I0ymWCXIIqNYmHUp/x8B9G
         GOGg==
X-Forwarded-Encrypted: i=1; AJvYcCUbnIUPiW9XV7gtjI0rmwmlB8wgdq8vf4V6LE9QF4ytgoghB8KS5pYVZbKQguON+rrcR2cVFWUTY5xD2sBtGUSo@lists.infradead.org
X-Gm-Message-State: AOJu0YyxwOi6J27c9jkZOBEPUYjBrThyensatEJy3LpIdruhqibzHzYH
	hf0tCVwLnE56jkft+7sQ/ImHjR8xc8KNkYDxl6UHjDgX9zMiw/0bvJsAvsTni+GIfGT4fraHy+i
	a4IDbbxpwajcxSv75QKzYImIjiZD0Zn9eX904TotA08rmEMe4GuLE67UTPVe9Rdux1bStxBG6
X-Gm-Gg: ASbGncspip11W3gSEzEys3e2LLSuLnfjXN5maLaXx3pmAtXJ589lCKlCpLKQi0ULPyE
	ChTDtilq/wdbHCwdaTf32URefoJAqE9wy0TLgPTRP1i8cHulLxANXIHUHJcPCKn4L66bu2G83gc
	yfuurdZMHLINSXYHkcWURaZKZpxEDU24AtDHx4bQWQOkTqwx+soQfJkFqZDObqx9X3XMYeWvNsc
	8b223++0AyxHVpb5ftr4BnZBmT4JiF+epsf4aDUGJHbqalrG63If14wIMWmGx1czT5y1pD0WqSD
	RnyvehaOPK0q3hwE
X-Received: by 2002:a17:902:ccce:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22a8a04593emr212605265ad.7.1744088608516;
        Mon, 07 Apr 2025 22:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGML8JrfPQSGP1sTXgAJbLiBC79RWpQvktKvDF6YE82nc5K0KhNIo0FYjrqKNMDpWPDe5wEjg==
X-Received: by 2002:a17:902:ccce:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22a8a04593emr212604925ad.7.1744088608147;
        Mon, 07 Apr 2025 22:03:28 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c01b7sm90355785ad.96.2025.04.07.22.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:03:27 -0700 (PDT)
Message-ID: <005ccfb3-b616-4723-b039-b8a3d6fb10bc@redhat.com>
Date: Tue, 8 Apr 2025 15:03:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/45] arm64: RME: Handle realm enter/exit
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
 <20250213161426.102987-18-steven.price@arm.com>
 <80983793-5df7-4828-96e8-90540e7d9183@redhat.com>
 <95c06abf-591f-4dd0-b1fd-296b0d5ae924@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <95c06abf-591f-4dd0-b1fd-296b0d5ae924@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PwEzUdPqtRrJs7_WpXYdmD0o421NbWYR5ilhlppGV4g_1744088609
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_220334_519948_305518B2 
X-CRM114-Status: GOOD (  28.23  )
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

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 01:03, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> Entering a realm is done using a SMC call to the RMM. On exit the
>>> exit-codes need to be handled slightly differently to the normal KVM
>>> path so define our own functions for realm enter/exit and hook them
>>> in if the guest is a realm guest.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v6:
>>>    * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>>>      vcpu to the error.
>>>    * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>>>      this exit type.
>>>    * Split code handling a RIPAS change triggered by the guest to the
>>>      following patch.
>>> Changes since v5:
>>>    * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>>>      change on next entry rather than immediately on the exit. This allows
>>>      the VMM to 'reject' a RIPAS change by refusing to continue
>>>      scheduling.
>>> Changes since v4:
>>>    * Rename handle_rme_exit() to handle_rec_exit()
>>>    * Move the loop to copy registers into the REC enter structure from the
>>>      to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>>>      where the handler exits to user space and user space wants to modify
>>>      the GPRS.
>>>    * Some code rearrangement in rec_exit_ripas_change().
>>> Changes since v2:
>>>    * realm_set_ipa_state() now provides an output parameter for the
>>>      top_iap that was changed. Use this to signal the VMM with the correct
>>>      range that has been transitioned.
>>>    * Adapt to previous patch changes.
>>> ---
>>>    arch/arm64/include/asm/kvm_rme.h |   3 +
>>>    arch/arm64/kvm/Makefile          |   2 +-
>>>    arch/arm64/kvm/arm.c             |  19 +++-
>>>    arch/arm64/kvm/rme-exit.c        | 171 +++++++++++++++++++++++++++++++
>>>    arch/arm64/kvm/rme.c             |  19 ++++
>>>    5 files changed, 208 insertions(+), 6 deletions(-)
>>>    create mode 100644 arch/arm64/kvm/rme-exit.c
>>>
>>
>> With below nitpicks addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>> [...]
>>
>>> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
>>> new file mode 100644
>>> index 000000000000..aae1adefe1a3
>>> --- /dev/null
>>> +++ b/arch/arm64/kvm/rme-exit.c
>>> @@ -0,0 +1,171 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2023 ARM Ltd.
>>> + */
>>> +
>>> +#include <linux/kvm_host.h>
>>> +#include <kvm/arm_hypercalls.h>
>>> +#include <kvm/arm_psci.h>
>>> +
>>> +#include <asm/rmi_smc.h>
>>> +#include <asm/kvm_emulate.h>
>>> +#include <asm/kvm_rme.h>
>>> +#include <asm/kvm_mmu.h>
>>> +
>>> +typedef int (*exit_handler_fn)(struct kvm_vcpu *vcpu);
>>> +
>>
>> Duplicated to exit_handler_fn, defined in handle_exit.c, need move the
>> definition to header file.
> 
> While I get this is duplication, I'm a little reluctant to move it to a
> header file because this is completely internal to each C file (the
> xxx_exit_handler[] arrays are both static). If either side wants to e.g.
> add an extra argument there shouldn't be a requirement to reflect that
> change in the other.
> 
> Specifically I'm wondering if we're going to ever need to pass an RMI
> return status into the rme-exit callbacks at some point.
> 

Ok, thanks for explaining it in details. In that case, I think it's fine
to keep exit_handler_fn in rme-exit.c.

>>> +static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu_err(vcpu, "Unhandled exit reason from realm (ESR: %#llx)\n",
>>> +         rec->run->exit.esr);
>>> +    return -ENXIO;
>>> +}
>>> +
>>> +static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
>>> +{
>>> +    return kvm_handle_guest_abort(vcpu);
>>> +}
>>> +
>>> +static int rec_exit_sync_iabt(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu_err(vcpu, "Unhandled instruction abort (ESR: %#llx).\n",
>>> +         rec->run->exit.esr);
>>> +    return -ENXIO;
>>> +}
>>> +
>>> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +    unsigned long esr = kvm_vcpu_get_esr(vcpu);
>>> +    int rt = kvm_vcpu_sys_get_rt(vcpu);
>>> +    bool is_write = !(esr & 1);
>>> +    int ret;
>>> +
>>> +    if (is_write)
>>> +        vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[0]);
>>> +
>>> +    ret = kvm_handle_sys_reg(vcpu);
>>> +
>>> +    if (ret >= 0 && !is_write)
>>> +        rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
>>> +
>>
>> Unncessary blank line and the conditon isn't completely correct:
>> kvm_handle_sys_reg()
>> should return 0 if the requested emulation fails, even it always returns
>> 1 for now.
> 
> It shouldn't matter, but like you say it's not technically the correct
> condition so I'll fix this up.
> 

Ok.

> Thanks,
> Steve
> 
>>      ret = kvm_handle_sys_reg(vcpu);
>>      if (ret > 0 && !is_write)
>>          rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
>>
>>> +    return ret;
>>> +}
>>> +
>>

Thanks,
Gavin


