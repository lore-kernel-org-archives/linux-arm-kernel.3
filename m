Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C810FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 05:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZYs4PdDssFQWEmrDvKTFbTZUVJpYWm3vSQBh2J9Vlg=; b=5G9Wu6ROsZgW36HGQh9Uef25H8
	9elPjx0vgKBFzP2Bvw2daIj3mlmjRMdldkQ+OdOiMmEaMmotiRvH2HItcG4nBPztIHnXcWrXa3+EN
	rSisyqa9sU8iRBzUb+BEIUEN2k0rz9AYotJxhuqq4VYVZPY74FkdUuVGNMXgiF87SYvsey+vs/KNa
	RFuL00voTePzCKavK2NivnZ1ggmTitwje1NyUn/JTQMebKhx4f5MW/YtWODVbv9Tv4Q+jsSHilkPK
	i4WNKuJb7I83A5D+3v5gL7dZtazPDhJRUEhHLVLvRcRdCexyc+ebFK2Lez+rNZ53SB9P9AkkOkBJ8
	hc3g3DlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21Ox-00000002lyw-2oRH;
	Tue, 08 Apr 2025 05:21:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21NC-00000002ljp-0lLZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 05:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744089584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZYs4PdDssFQWEmrDvKTFbTZUVJpYWm3vSQBh2J9Vlg=;
	b=WgcFEs0jI9uOOb2RI5mUkuoqJ7NOjP7wQGJOJq8UKhTlxkdCMW3Q6Hai2TaXpVYd9bb2ZF
	jaBRCCPid8yhUJnZwVHHSjIPlTWPMPKnlFc8HfiKcVj7ZeIM63U4lJeamPBs/BJCPxlxdn
	FrCbJ4yZVEr/DiBx1TCp3B8aa5Nk/c8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-Qov6uHd8NNWv9YsxxqmTjw-1; Tue, 08 Apr 2025 01:19:43 -0400
X-MC-Unique: Qov6uHd8NNWv9YsxxqmTjw-1
X-Mimecast-MFC-AGG-ID: Qov6uHd8NNWv9YsxxqmTjw_1744089582
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225505d1ca5so43746475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 22:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744089582; x=1744694382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZYs4PdDssFQWEmrDvKTFbTZUVJpYWm3vSQBh2J9Vlg=;
        b=Qh3N/Bjqmeav3cUmYHO0nNCkqd7W/NPDzkHCk6IPG+bxOezojDHd6JI7r3Lbt+xXuM
         mzlYxziBtCA0c6ItjkgK6Clq0HN5sIi9kgu9doLHa1bESQHEZunpsDLsQnf1o2v0Rhuk
         9N6cy7EqAJtrlg3smTbR9b2EipZ34Eq7V8KCKgTv11PflwkZu+Uj8w37oMFGVvBc7yzW
         1tmAfEUyTHpuaQbO6osXoYaHfDZK+9vIErnV4joSZzxS1K77S8DKhX8NBNMnCU0k0U5L
         y9RU2+roNNSqZisy7rx0i7PP7krIBCVR0wBmfusWhD9Dwrq4immMbHll/hTP/3nUdfUJ
         BARg==
X-Forwarded-Encrypted: i=1; AJvYcCXHgFJJaU+0/1JbBLLGdETGJABjnOHnQO/c7nnCPMpGNks1pPGQNFHF6QoXsBmPZTELmRf2L1ZjB1g659DBNcD7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhom9LaiPLZQb9GPy38SqswGDRzq63hte3SOn+mfY3qde6cWdY
	4tFwIOWZoYESoU7XMDXO1dkMYAlLaeIIs7quy8vYjQ4dEj6MDm2rYGccikbtSw8od9VHHMRHaRB
	74liKgDDQZUWdXa1EQoM4Weu7hZL0/yM46dl2IU2ng2ZyADMU/2Hu2+HsXOMT3Mj+Dog0QreE
X-Gm-Gg: ASbGncstALEoa2oVwJhAdIY+o4Abcut+ZIRjmhBqkeoYCM8Uuhj+Cje/FeEiGON6v0k
	CVby6oDHmdL7jw5ojbdp6IEZKc/WSMEDzJAppArOumouSn046H7QJvkWY5pT+hSM4ofl/4b8qvJ
	uihlasCfQLSOany4sp0oRp1L1h4OX16i62hNBX3aN4fvOPmICjGmqdBmavNuOCggIOcO/iGLpr0
	EEe3KcsISislbiexSPryXh5q+3kJR/xx39xos7IvlnT5lDKlAQ3EjNaESduQAeuIXGW0REEHcXW
	CBZrs14pGA5yl0Ie
X-Received: by 2002:a17:902:f610:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22a8a06b429mr204562395ad.23.1744089582310;
        Mon, 07 Apr 2025 22:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHON1uwm7bR+2w9kanWBPOGcZHKNZxG2Wp+hjgiN2PniqOi1+L2J3B1ic75+U0mQ/IeetE7VA==
X-Received: by 2002:a17:902:f610:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22a8a06b429mr204562115ad.23.1744089581919;
        Mon, 07 Apr 2025 22:19:41 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229786608d1sm91213655ad.120.2025.04.07.22.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:19:41 -0700 (PDT)
Message-ID: <b76ffc1c-32e1-4bf6-916a-41af9378fb4b@redhat.com>
Date: Tue, 8 Apr 2025 15:19:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 28/45] arm64: rme: support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-29-steven.price@arm.com>
 <12b5ba41-4b1e-4876-9796-d1d6bb344015@redhat.com>
 <54f1fbb1-4fa1-4b09-bbac-3afcbb7ec478@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <54f1fbb1-4fa1-4b09-bbac-3afcbb7ec478@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W9dInJ5obdLglD4zakohNmaFfTeahOpL-0yErPXYmRg_1744089582
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_221946_297114_BF693AE1 
X-CRM114-Status: GOOD (  26.87  )
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
> On 04/03/2025 06:01, Gavin Shan wrote:
>> On 2/14/25 2:14 AM, Steven Price wrote:
>>> From: Joey Gouly <joey.gouly@arm.com>
>>>
>>> Forward RSI_HOST_CALLS to KVM's HVC handler.
>>>
>>> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v4:
>>>    * Setting GPRS is now done by kvm_rec_enter() rather than
>>>      rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>>>      enter/exit). This fixes a bug where the registers set by user space
>>>      were being ignored.
>>> ---
>>>    arch/arm64/kvm/rme-exit.c | 22 ++++++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
>>> index c785005f821f..4f7602aa3c6c 100644
>>> --- a/arch/arm64/kvm/rme-exit.c
>>> +++ b/arch/arm64/kvm/rme-exit.c
>>> @@ -107,6 +107,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu
>>> *vcpu)
>>>        return -EFAULT;
>>>    }
>>>    +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
>>> +{
>>> +    int ret, i;
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu->stat.hvc_exit_stat++;
>>> +
>>> +    for (i = 0; i < REC_RUN_GPRS; i++)
>>> +        vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
>>> +
>>> +    ret = kvm_smccc_call_handler(vcpu);
>>> +
>>> +    if (ret < 0) {
>>> +        vcpu_set_reg(vcpu, 0, ~0UL);
>>> +        ret = 1;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>
>> I don't understand how a negative error can be returned from
>> kvm_smccc_call_handler().
> 
> I don't believe it really can. However kvm_smccc_call_handler() calls
> kvm_psci_call() and that has a documentation block which states:
> 
>   * This function returns: > 0 (success), 0 (success but exit to user
>   * space), and < 0 (errors)
>   *
>   * Errors:
>   * -EINVAL: Unrecognized PSCI function
> 
> But I can't actually see code which returns the negative value...
> 

I think the comments for kvm_psci_call() aren't correct since its return value
can't be negative after 7e484d2785e2 ("KVM: arm64: Return NOT_SUPPORTED to guest
for unknown PSCI version"). The comments should have been adjusted in that commit.

Please take a look on 37c8e4947947 ("KVM: arm64: Let errors from SMCCC emulation
to reach userspace"). Similarly, the block of code to set GPR0 to ~0ULL when negative
error is returned from kvm_smccc_call_handler() in this patch needs to be dropped.

>> Besides, SMCCC_RET_NOT_SUPPORTED has been set to GPR[0 - 3] if the
>> request can't be
>> supported. Why we need to set GPR[0] to ~0UL, which corresponds to
>> SMCCC_RET_NOT_SUPPORTED
>> if I'm correct. I guess change log or a comment to explain the questions
>> would be
>> nice.
> 
> I'll add a comment explaining we don't expect negative codes. And I'll
> expand ~0UL to SMCCC_RET_NOT_SUPPORTED which is what it should be.
> 

Please refer to the above reply. The block of code needs to be dropped.

> Thanks,
> Steve
> 
>>>    static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>>>    {
>>>        struct realm_rec *rec = &vcpu->arch.rec;
>>> @@ -168,6 +188,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int
>>> rec_run_ret)
>>>            return rec_exit_psci(vcpu);
>>>        case RMI_EXIT_RIPAS_CHANGE:
>>>            return rec_exit_ripas_change(vcpu);
>>> +    case RMI_EXIT_HOST_CALL:
>>> +        return rec_exit_host_call(vcpu);
>>>        }
>>>          kvm_pr_unimpl("Unsupported exit reason: %u\n",
>>

Thanks,
Gavin


