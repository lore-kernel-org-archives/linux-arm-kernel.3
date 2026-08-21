Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEABC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQd8YnirXzo/05vCBWaK5j7dOswPV7dn2KgbQ3nhodY=; b=dfQ2xLPq6RrHkORWOpTqFJ7JW5
	D/ozVaqMG3d6q2j844By7WAUBIPvwqs0euwtQoRCSGCnflFKRctjnn+QAyQ56VQ6PoCD+O6CP44xS
	MmTOHJcLvBX4l0q55JsskyR5qU53dcO8e5CHDo8mBXNNEcWdF36iIYAu6jU5Pyw633z29rHBFeepR
	lGWPaRQAZ1Jn39E7KVrpYw+1UAp9LCYk10VW4+Wa2Ov16cUIxUIF6ockfi2lweHUehU8hExtIf7Cy
	cyM0LulBU9AvraNipEtQetOw8O1LDqfIoS+aleDdXA40gLNXgz0RkpPx9bEDsyVruRX/H35gmuljl
	hD4onZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPoq-0000000DUOZ-4A3a;
	Fri, 21 Aug 2026 14:02:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPop-0000000DUO6-1v8q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:02:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-495437bb891so5461835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320921; x=1787925721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQd8YnirXzo/05vCBWaK5j7dOswPV7dn2KgbQ3nhodY=;
        b=klSRW/IEOT5D6kkufOZLZw+gMK/Xbb2GonBXXBszEbW6QYMJSOtk1XhxSZ+L9uI481
         NLERVNSisu3GG4OrJfZJvssQ2kxpJ54RAeZCw2+vvnOI3Du42oyUp1fQd7kxWO89AMM5
         YC+4+yi5Jaxb6JG1JVt9MALWYkZLBt04/qfcNcyYLWE6TfJ6p6jlugOJuxSvq1X7IAb8
         QIaupOEQR09cjPzeqCjAUOBjkpHgjgegdphTlDjuCxaMbeuZlVkkgkKGH3ABcfpKThlV
         CRX3sYY/zFAnxJPUL/EspuOv3JmGdMh0XhqPZIveh3AOpEuxV0LgbV7z+Io6pppqv/3i
         xFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320921; x=1787925721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQd8YnirXzo/05vCBWaK5j7dOswPV7dn2KgbQ3nhodY=;
        b=KEvVEfYaTLLFG2aROFuNxN///EDlWwi7oMsf2UGdQUGmL0b3wARR6v2ukRSNkLm2k7
         YIa95eJmLAa+/PlKnQ7NXhZdmRwDc+BjQYpZYuxTvrUQ6cA+kXJlpAHBGymjuaQ8NWeC
         m74lZNIKKwmBSynhK7jnJIffGxtUUOGcWSUnhSt/F8yJD1hKsGhj9kQVZWc1u4Pnztb0
         sA9ulsYGjMpuFAY4SucXC6s5mbDVlZKrlNYWcqOIpwyco0M5oS5MfvONydnEoUjvHwm8
         5WKHnBykORZPwf0KxUqr/+v0G90pfH3zJoWK1+FDbZx+v6UlrZO4pdULDc//Yopr5j/l
         9sEA==
X-Forwarded-Encrypted: i=1; AHgh+RraluYm/igHHPTndview04WZ9RQNDD6yBdCAZ+3LeEN6jXearF7gL4jzq26xyn6GyVwj4O8FJVRpUOHVS9Zsc6Y@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/Q9sc/qkJ/+PlCyWz+Zrc6qLvmkHUxxSou+iO8Yyxww07edN
	ARdzAGz3eTYycKzh3m6PTuoyGSRDKALM+joHlHDrhtxEW1jPdxSkaW3Q
X-Gm-Gg: AR+sD10ILIDYfz1ctDzu8jGF1tpUX9BuMbBqFC+5+8zrxCPxdjE5w6o+nllDAkwFIzs
	X9YvFdaZOTvsQwq3hRBgp13kkD2T6D9+7pcEvJqtOM5yBUzYFIDvgaSTmjry4txaPOxZpMEU/ox
	PSdh/1LfeE+sj10JjL9OLPsiCrVfdnk4vs9sT4nzSVRk78WfPMLvZ8VfOL+OIKV30sM+EhOdExM
	EaGUWHrwKVAXWtvl6yyh04hV6zCek6KpAG6b2KEkmI/JI3Yv3Dkro3rqQ9k2fs1a0PcGy5JUCje
	zsefz6di+6K4Q9eoS74OC0U8674sppanlYQbClQfhS+b2ruDyKerdmPoNpE2/hv/svvgsZ3WvzX
	XDr+T/fqTD6N9xzOWsFQilRT0cz4kQh1ooGlaTyNujfeUrxzzrXqz+iNy/Hi6mcQ9aDGWWNGs3k
	vwR7xGSjGzk7Hnhz3yMsGuTRVJAjYbg+GO/EzrjKx9zzNpBPl+N8RppyRDb73c2h33R8ex9U0c9
	UM7
X-Received: by 2002:a05:600c:1912:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499b9182141mr59968525e9.4.1787320921200;
        Fri, 21 Aug 2026 07:02:01 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.3.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90f8b4fsm34103715e9.9.2026.08.21.07.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 07:02:00 -0700 (PDT)
Message-ID: <6270fea8-aa08-48ca-ab1e-ab0ada105ded@gmail.com>
Date: Fri, 21 Aug 2026 15:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com>
 <amc8zlGxegNKHxIY@google.com>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <amc8zlGxegNKHxIY@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_070203_519528_F0C15B63 
X-CRM114-Status: GOOD (  17.39  )
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

Hi Vincent,

On 27/07/2026 12:11 pm, Vincent Donnefort wrote:
>> +	unsigned long		*page_size;
> 
> It looks a bit odd in that struct.
> 
> Also, transparent_hugepage_adjust() modifies pfn and gfn. So perhaps it'd be
> better to introduce a struct kvm_s2_fault_mapping that can be used to get what
> has actually been mapped in kvm_s2_fault_map()?
> 

Yeah that's much nicer I'll do that thanks for the suggestion!

>> +	if (vcpu_is_protected(vcpu))
>> +		return -EOPNOTSUPP;
> 
> It could just call pkvm_mem_abort() when the VM is protected?
> 

I see, I don't have a setup to test this properly myself, so at the
moment I left the protected vm's out and don't advertise the capability,
if there's a usecase happy to look at it as a follow-up.

>> +	/*
>> +	 * pKVM stage-2 mappings aren't directly walkable from the host; let
>> +	 * the fault path handle both new and existing mappings.
>> +	 */
> 
> pKVM has a host interval-tree where we keep track of what has been mapped and at
> what level. This tree is also protected with the mmu_lock.
> 

Thanks, that sounds better. I'll have a look at moving to that for v6 then.

-- 
Thanks,
Jack

