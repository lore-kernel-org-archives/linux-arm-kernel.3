Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF396C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS5txPMa8dcMMZaluUjmTNiCxS+esxKMHPUrHUieImQ=; b=NJS68XrOsr2AKcRUwvnadDkPrI
	0z67JdgUT+95jnmE/bN8/o0dzYsDXW7SG0AuZ0n7f1cnTHPY9K0ASTTWOIOWvI1+5Jjecqxn+zqeh
	MdDGNkv7PfEZQ48cg1QxY7HQxYyF9RZZ1rsyB1H/HoTNBxomW2fav8renfAZVS+pUhGCndnqLAyHo
	vUKxI03aKcIglGHTUM48ra6w5MLPFJtAy8kOtBhXpwD/XXBu+glU84FElg/eW3feOeA1uKG0/WOp/
	uypWcKFmFgMw0N1AeF/AV7a+xsgPIS3lz8LRhxfVNCW7z5cSatlY8fl0Z35JlQbOHKdAo5ZWdJNBx
	Cubn2xLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63Kb-000000031dj-3Cgk;
	Mon, 14 Sep 2026 09:50:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63KW-000000031ct-1cm2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789379427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS5txPMa8dcMMZaluUjmTNiCxS+esxKMHPUrHUieImQ=;
	b=WOgK2rBBsCwXzuM+61k5wROi6+AgbIZNnUKILLJggzhjimbqQfsMwgdCtNfKvr1EqgykwZ
	1zXx8nSL4ZrzYcFDQVnL8MHYGy1cNEAnR2EaE0118GjdhW9ao3SofxnUDOF6yOMQFUiVrK
	RiEQmDYAkZ/QmAMIEedpHhFCf9XtlIo=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-1WJvEprJMuC8pbSJm6rlKg-1; Mon, 14 Sep 2026 05:50:25 -0400
X-MC-Unique: 1WJvEprJMuC8pbSJm6rlKg-1
X-Mimecast-MFC-AGG-ID: 1WJvEprJMuC8pbSJm6rlKg_1789379424
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc132709c76so4091547a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379424; x=1789984224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS5txPMa8dcMMZaluUjmTNiCxS+esxKMHPUrHUieImQ=;
        b=UUtjIgY8/7ACBw+OWHYzRt+rL6JCgfWj+fcOXdeHA0HDA2vIq+NumrSqLKZYo0aEPL
         f3E+dKsBJID0Y4trVJsr01BaHPxvpI0zGGyiRlkhZoMNcrJxX87B/FJcS27wSaLzy3RC
         7Y2sVoo6GdgfqSg02q7xtPpyI+uc+J3RRMIJFPvbofr44XNQBPhAZMiViu75YesC/vWS
         Tmhq8XKQUH3T1qy1R3uZckeCBqlEqINyVTfBx3bO8yU6aN3/G/ukDcOi5QBfQLuJQb4T
         hdzRjrEFAoG39hUKi4/AECyzO2aYAdoIEQ1LFDh2RRHZVTS+9jmXVhANkqscDUn1gPgv
         q3oA==
X-Forwarded-Encrypted: i=1; AKwUvBwaW1KDNESaEat8pRrD1LXFttdXQiKllLsqjZRQOpS0lVop21D/ciHQlQ1QK0+pOof/g4TsNk3Vuar9ax+PXc70@lists.infradead.org
X-Gm-Message-State: AFuF++m6KMjVwk+56Baax3CaQLFfo5t4ScSawrPZ6exuTexqs7IS5Wwp
	+DTpGkqtppfsmCSqVR0K3XU3qdt773BhdD7SpJAZJx938/s5KljUwtj40mvPTg5bnWV/QAGP2eb
	X5KyF7xW6EK3JyXwPpshWYBViUOj7yJ4StUKiyINRHET1Rd4BnCc3EgJI6ACnPUn+/AlMVq5KdM
	CB
X-Gm-Gg: AYBFou2XxJkBEcSx6gHnnERLp9gaueBKLamE1O8KppdXDOQLY/ONGhI6zjLlOChNZp2
	DJhP6Qs1CXneSnq60wIED1/q2+hv7QgApb94Sps8Gt2E4SnV49R9Mgjt8On6bUzAavqpwTYwOYj
	eMRrF5V4bbcHYSu1O48rbD8v2bM2sTF+ndWUFKIzTvt26EeGWLzNGYaAVLEssHC8bzUuMMkomV9
	BbtEcAQ12kYkoGXy0TtSmoHjM7Cm6BfksgsDbS2ehT/z1SmL5hCdAX0R6CyUihZyaR0tV4dKbu1
	trNzgcQz1+UY2bih69CiPvD8L6oZ70lRO0sUUTynfz7kZX0RNdv4Cs4OaoiG2cFO5jsE15YnRHQ
	XKJ7CssQih/JHLtmKVuQXj+TqnYBuKtyRblk6ASZeAg==
X-Received: by 2002:a05:6a20:7f9c:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3db4052063emr3632227637.13.1789379424390;
        Mon, 14 Sep 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f9c:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3db4052063emr3632178637.13.1789379423970;
        Mon, 14 Sep 2026 02:50:23 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4efc398sm30439434eec.19.2026.09.14.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:50:23 -0700 (PDT)
Message-ID: <25706923-8e9c-4785-a80d-b138478ad374@redhat.com>
Date: Mon, 14 Sep 2026 19:50:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-5-suzuki.poulose@arm.com>
 <f00d01d1-8df0-4865-8e52-c85171cf4ca5@redhat.com>
 <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bCachzVUp8c3sU-xXyviDIo_-1iPN8VO5XE5XUyk6uo_1789379424
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_025028_501736_4B682DC6 
X-CRM114-Status: GOOD (  20.81  )
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

Hi Suzuki,

On 9/14/26 4:22 PM, Suzuki K Poulose wrote: 
> On 14/09/2026 06:04, Gavin Shan wrote:
>> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>>> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
>>> means that an SMC can return with an operation still in progress. The
>>> host is expected to continue the operation until it reaches a conclusion
>>> (either success or failure). During this process the RMM can request
>>> additional memory ('donate') or hand memory back to the host
>>> ('reclaim'). The host can request an in progress operation is cancelled,
>>> but still continue the operation until it has completed (otherwise the
>>> incomplete operation may cause future RMM operations to fail).
>>>
>>> The SRO is tracked using a struct rmi_sro_state object which keeps track
>>> of any memory which has been allocated but not yet consumed by the RMM
>>> or reclaimed from the RMM. This allows the memory to be reused in a
>>> future request within the same operation. It will also permit an
>>> operation to be done in a context where memory allocation may be
>>> difficult (e.g. atomic context) with the option to abort the operation
>>> and retry the memory allocation outside of the atomic context. The
>>> memory stored in the struct rmi_sro_state object can then be reused on
>>> the subsequent attempt.
>>>
>>> Wrappers for SRO RMI commands are also provided here because they depend
>>> on the rmi_sro_execute() implementation added by this patch.
>>> Delegate/undelegate handles are also added here because they now use the
>>> SRO/stateful command infrastructure and are also used for the memory
>>> DONATE/RECLAIM flows.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

scripts/checkpatch.pl recommends s/Co-Developed-by/Co-developed-by, the same
format issue exists in other patches and please double check.

>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> 
> 
>>> ---
>>>   drivers/firmware/arm_rmm/rmi.c | 586 +++++++++++++++++++++++++++++++++
>>>   include/linux/arm-rmi-cmds.h   |  41 +++
>>>   2 files changed, 627 insertions(+)
>>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>> index 5b0e342ce3d58..4f9898ece7547 100644
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c

[...]

>>> +
>>> +static void rmi_op_continue(unsigned long sro_handle, unsigned long flags,
>>> +                struct arm_smccc_1_2_regs *out_regs)
>>> +{
>>> +    *out_regs = (struct arm_smccc_1_2_regs) {
>>> +        SMC_RMI_OP_CONTINUE, sro_handle, flags
>>> +    };
>>> +
>>> +    rmi_smccc_invoke(out_regs);
>>> +}
>>> +
>>
>> The pattern 'regs' is used in some of the 'struct arm_smccc_1_2_regs' arguments
>> or variables in this series, which is incosistent to the existing patterns which
>> is either 'args' or 'res' by searching the source files using 'git grep arm_smccc_1_2_regs'.
>> So I would suggest we have the fixed the pattern 'args' :-)
> 
> 
> I would prefer to keep it "regs" as, unlike the smccc_1_1 calls, we
> pass "arm_smccc_1_2_regs" for both arguments and results. In this case
> we are using a single structure, so, to avoid the confusion, I
> intentionally used regs
> 

It's fine to keep "regs" pattern, then the only place using "args" is
rmi_smccc_invoke(). I think the variable or argument names in rmi_smccc_invoke()
can be improved there to use "regs" pattern. With this, we have the unified
pattern "regs".

static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *pregs)
{
         struct arm_smccc_1_2_regs regs = *pregs;
		:
}

Thanks,
Gavin


