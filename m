Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A86DC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MAFw1hksH4hBe8O936uvTNwJh1WrybPOdWARRA6K2w=; b=qVySK5asra0c9UcDRMeAtCH7b8
	nv4JtEbY0NlFqqZpzhotDJKnEcBXQ1TbCktYbAB9ayaHFdHpr9BNZEKL702ZAiJ+2BKEIjLp2ZV3C
	xCgsZ0BGjXKY8RN6O6xBqmcYHfdMv2OSaN6+5cAeeir9NCIKjFEQzvGy/NXKV5Y+lrP8ZMjw2H/NL
	WTxvF5Qo4JvR2+4i/6fbiY1Id6WG30deJV7AjolZt7Bf6i3ZQa6KFFSeWT0CadRb6mIBrLEJEVcUB
	mSSw5SbWYd9p75xTYEtwbMoLky4nJ8MDNOFi+VKQ9SinyJAdDY/NXmCbC+KPe1bPUe/9plEM/jQLh
	oSF54kVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud0ZE-0000000DwAB-1isl;
	Sat, 19 Jul 2025 05:57:04 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud0Wk-0000000Dw3u-35rR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 05:54:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-31ca042d3b8so2323734a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 22:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1752904469; x=1753509269; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5MAFw1hksH4hBe8O936uvTNwJh1WrybPOdWARRA6K2w=;
        b=fQNKd3Mw1roij5eewv8i6cyiE+BrvFNnkJ4c1XIFVI9p3LG7fOmYFZ/dARXzqvcyyl
         QTmjYp8Bp1a5he4e/YoQ7OCZWwUQTKykRATUESF+QsopFi60vy6JZugkVgRR8SmgplFw
         moyETguv7FJ+KE2vRy+PHhYov03JMguIdGMmzFWoClU76F2ZYKqk9ATt0JsaRjxycLvV
         IHoGa8kRCP3N6I3jFmsxx4S49IYFlG+nP80zVtW4b5Yd0ujagHCX1FWmmPFhmFzumvGb
         9EAx0zz5r3127tnUFV8XUoGZxIWkm+ke7bp8VxIs6JZMK43PI+IjlyfuVq3fCUZkSeVQ
         6z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752904469; x=1753509269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MAFw1hksH4hBe8O936uvTNwJh1WrybPOdWARRA6K2w=;
        b=FG5gsVmuESN5CcLNGqJXGrdRXzqa12EFZaQMEZrP/laGo4G4qV+a2qTXqh1fM0mgSH
         wX0JSc69W7ppe5J7eDO4YmTKyhfGhO+tNe5IxJ9w1AmjTZPvjQdxcf89vLkxLNfnwROy
         xOWVKly4ibbAbeZbDGHP8bYZ8zdcFziZ9ZWH0upIv/OaeAbSTs6b7nH6VMXMrDnTFnaj
         UnNsVCTCoSJtQetI1BpMoj40vbsErL88HXfWa2PzZmAYyRqzlZ1jaYBV3UsOwNDAF/K+
         NWtdIy4AeyQAuDHI5Hahuiv2Nkil0QcSR2KxWx7vYjtIpFSgpbGmIbgY1d2909w2gu8I
         bhhA==
X-Forwarded-Encrypted: i=1; AJvYcCXbKgGIsJwvrt2HzfXP7AEXGSaPgZWEVKTdNjAtoeLHe2dE1Nb5M89xiiIq+F6FXsfHCBdi0bydcoDqNvQb1Vyv@lists.infradead.org
X-Gm-Message-State: AOJu0YwduzXRDyPj6VOTQGeHZDDowYjK+GwfjZ3gwfvBbSBTFWHiogGP
	EwjT1otHVPPczWADNQGtwN3dxpijK/8t8NbqLo5CJ1dawEE3mq/QqeFvGnwI7Q5vfds=
X-Gm-Gg: ASbGncuvTHw3D94BUtbCe51Nku0oP+nriNCZx7K3MONphH6hRwq/GvKDyc5w0zpUDeQ
	yYi+Oipy4b1niCr94r9eiPVXk/LPNXYFXVj+QiUnGVDnKJvwkax3G8vzyJeitwIccQSH+hCLee3
	Zg3YNzN5VuV8ymx6QYws3igB3qKVkPRRzWJqvzWIPVulaoYaCIgxDX1VA7EzP4g8AXPxenkB7Rj
	XNu7rh5dc61/0Xz8r7GLJGT4+fOPTYPV+Odr7rm396OkJtqnVQ7Pdxe8rn3RVJLRkiFOQVPBV69
	0xdMmEuRvmWgWtRaiVaaFyQtTLLULbgIajlPgBvH+HX8VuCgbnNrV8KNrmS6Gi09MIarspTcVfu
	+HELrJ7HIuIJmKsM5qsYANz733lAz5j6OkXyv/mO+CyJbpyx2dFBAmM4QWF1LUmm6kftMzgDQ64
	mkDbrrE3YsMY13ndFeNuyN5Sji3A8=
X-Google-Smtp-Source: AGHT+IHA4ElNc5+YCunjXEAwqNpAKoUCVte5EKyMqMBM9+3Z43HkX9cWDPqipqHYDun8x/JIX6UYAQ==
X-Received: by 2002:a17:90b:5244:b0:312:db8:dbd2 with SMTP id 98e67ed59e1d1-31c9e75b9bcmr19779516a91.19.1752904469406;
        Fri, 18 Jul 2025 22:54:29 -0700 (PDT)
Received: from ?IPV6:2605:a601:a778:5100:80e3:c2d2:8a77:af5c? ([2605:a601:a778:5100:80e3:c2d2:8a77:af5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4b20sm22529185ad.121.2025.07.18.22.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 22:54:28 -0700 (PDT)
Message-ID: <67cc6766-6493-4171-a6b1-2a105c3e6ff5@immunant.com>
Date: Fri, 18 Jul 2025 22:54:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] KVM: arm64: Use SMCCC 1.2 for FF-A initialization
 and in host handler
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, perlarsen@google.com,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, ahomescu@google.com,
 armellel@google.com, arve@android.com, ayrton@google.com,
 qperret@google.com, sebastianene@google.com, qwandor@google.com
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-2-995afc3d385e@google.com>
 <8634bdbgaz.wl-maz@kernel.org>
 <3b10fa81-bfdd-4325-a330-c79df2e21621@immunant.com>
 <aHpOClH1k-3NhI_y@willie-the-truck>
Content-Language: en-US
From: Per Larsen <perl@immunant.com>
In-Reply-To: <aHpOClH1k-3NhI_y@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_225431_024769_EDFF26BA 
X-CRM114-Status: GOOD (  34.24  )
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

On 7/18/25 6:37 AM, Will Deacon wrote:
> On Mon, Jul 07, 2025 at 05:06:23PM -0700, Per Larsen wrote:
>> On 7/3/25 5:38 AM, Marc Zyngier wrote:
>>> On Tue, 01 Jul 2025 23:06:35 +0100,
>>> Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org> wrote:
>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
>>>> index 2c199d40811efb5bfae199c4a67d8ae3d9307357..65d241ba32403d014b43cc4ef4d5bf9693813809 100644
>>>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
>>>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
>>>> @@ -71,36 +71,68 @@ static u32 hyp_ffa_version;
>>>>    static bool has_version_negotiated;
>>>>    static hyp_spinlock_t version_lock;
>>>> -static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
>>>> +static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
>>>>    {
>>>> -	*res = (struct arm_smccc_res) {
>>>> +	*res = (struct arm_smccc_1_2_regs) {
>>>>    		.a0	= FFA_ERROR,
>>>>    		.a2	= ffa_errno,
>>>>    	};
>>>>    }
>>>> -static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int ret, u64 prop)
>>>> +static void ffa_to_smccc_res_prop(struct arm_smccc_1_2_regs *res, int ret, u64 prop)
>>>>    {
>>>>    	if (ret == FFA_RET_SUCCESS) {
>>>> -		*res = (struct arm_smccc_res) { .a0 = FFA_SUCCESS,
>>>> -						.a2 = prop };
>>>> +		*res = (struct arm_smccc_1_2_regs) { .a0 = FFA_SUCCESS,
>>>> +						      .a2 = prop };
>>>>    	} else {
>>>>    		ffa_to_smccc_error(res, ret);
>>>>    	}
>>>>    }
>>>> -static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
>>>> +static void ffa_to_smccc_res(struct arm_smccc_1_2_regs *res, int ret)
>>>>    {
>>>>    	ffa_to_smccc_res_prop(res, ret, 0);
>>>>    }
>>>>    static void ffa_set_retval(struct kvm_cpu_context *ctxt,
>>>> -			   struct arm_smccc_res *res)
>>>> +			   struct arm_smccc_1_2_regs *res)
>>>>    {
>>>> +	DECLARE_REG(u64, func_id, ctxt, 0);
>>>>    	cpu_reg(ctxt, 0) = res->a0;
>>>>    	cpu_reg(ctxt, 1) = res->a1;
>>>>    	cpu_reg(ctxt, 2) = res->a2;
>>>>    	cpu_reg(ctxt, 3) = res->a3;
>>>> +	cpu_reg(ctxt, 4) = res->a4;
>>>> +	cpu_reg(ctxt, 5) = res->a5;
>>>> +	cpu_reg(ctxt, 6) = res->a6;
>>>> +	cpu_reg(ctxt, 7) = res->a7;
>>>
>>>   From DEN0028G 2.6:
>>>
>>> <quote>
>>> Registers W4-W7 must be preserved unless they contain results, as
>>> specified in the function definition.
>>> </quote>
>>>
>>> On what grounds can you blindly change these registers?
>>  From DEN0077A 1.2 Section 11.2: Reserved parameter convention
>>
>> <quote>
>> Unused parameter registers in FF-A ABIs are reserved for future use by the
>> Framework.
>>
>> [...]
>>
>> The caller is expected to write zeroes to these registers. The callee
>> ignores the values in these registers.
>> </quote>
>>
>> My read is that, as long as we are writing zeroes into reserved registers
>> (which I believe we are), we comply with DEN0026G 2.6.>
> 
> Right, the specs make this far more difficult to decipher than necessary
> but I think SMCCC defers to the definition of the specific call being
> made and then FF-A is basically saying that unused argument registers
> are always zeroed.
> 
> Rather than have the EL2 proxy treat each call differently based on the
> used argument registers, we can rely on EL3 doing the right thing and
> blindly copy everything back, which is what you've done. So I think
> that's ok.
> 
>>>> +
>>>> +	/*
>>>> +	 * DEN0028C 2.6: SMC32/HVC32 call from aarch64 must preserve x8-x30.
>>>> +	 *
>>>> +	 * The most straightforward approach is to look at the function ID
>>>> +	 * sent by the caller. However, the caller could send FFA_MSG_WAIT
>>>> +	 * which is a 32-bit interface but the reply could very well be 64-bit
>>>> +	 * such as FFA_FN64_MSG_SEND_DIRECT_REQ or FFA_MSG_SEND_DIRECT_REQ2.
>>>> +	 *
>>>> +	 * Instead, we could look at the function ID in the response (a0) but
>>>> +	 * that doesn't work either as FFA_VERSION responses put the version
>>>> +	 * number (or error code) in w0.
>>>> +	 *
>>>> +	 * Set x8-x17 iff response contains 64-bit function ID in a0.
>>>> +	 */
>>>> +	if (func_id != FFA_VERSION && ARM_SMCCC_IS_64(res->a0)) {
>>>> +		cpu_reg(ctxt, 8) = res->a8;
>>>> +		cpu_reg(ctxt, 9) = res->a9;
>>>> +		cpu_reg(ctxt, 10) = res->a10;
>>>> +		cpu_reg(ctxt, 11) = res->a11;
>>>> +		cpu_reg(ctxt, 12) = res->a12;
>>>> +		cpu_reg(ctxt, 13) = res->a13;
>>>> +		cpu_reg(ctxt, 14) = res->a14;
>>>> +		cpu_reg(ctxt, 15) = res->a15;
>>>> +		cpu_reg(ctxt, 16) = res->a16;
>>>> +		cpu_reg(ctxt, 17) = res->a17;
>>>> +	}
>>>>    }
>>>
>>> I don't see how that can ever work.
>>>
>>> Irrespective of how FFA_MSG_WAIT actually works (and I couldn't find
>>> anything in the spec that supports the above), the requester will
>>> fully expect its registers to be preserved based on the initial
>>> function type, and that alone. No ifs, no buts.
>>>
>>> If what you describe can happen (please provide a convincing example),
>>> then the spec is doomed.
>>
>> DEN0077A 1.2 Section 8.2 (Runtime Model for FFA_RUN) and 8.3 (Runtime Model
>> for Direct request ABIs) contains Figures 8.1 and 8.2. Each figure shows
>> transitions between states "waiting", "blocked", "running", and "preempted".
>> Key to my understanding is that the waiting state in Figure 8.1 and Figure
>> 8.2 is the exact same state. This appears to be the case per Section 4.10.
>>
>> So we have to consider the ways to get in and out of the waiting state by
>> joining the state machines in Figures 8.1 and 8.2. Figure 8.1 has an edge
>> between "running" and "waiting" caused by FFA_MSG_WAIT. Figure 8.2 has an
>> edge between "waiting" and "running" caused by a "Direct request ABI".
>>
>> Direct request ABIs include FFA_MSG_SEND_DIRECT_REQ2 which is why the FF-A
>> 1.2 spec, in my read, permits the response to a 32-bit FFA_MSG_WAIT call can
>> be a 64-bit FFA_MSG_SEND_DIRECT_REQ2 reply.
> 
> That seems bonkers to me and I agree with Marc's assessment above. The
> SMCCC is crystal clear that a caller using the SM32/HVC32 calling
> convention can rely on x8-x30 (as well as the stack pointers) being
> preserved. If FF-A has a problem with that then it needs to be fixed
> there and not bodged in Linux.
Ack. Patchset v8 addresses Marc's feedback by using the func_id detect 
SMC64 instead.>
> Setting that aside, I'm still not sure I follow this part of your check:
> 
> 	if (... && ARM_SMCCC_IS_64(res->a0))
> 
> won't res->a0 contain something like FFA_SUCCESS? The FFA spec states:
> 
>    FFA_SUCCESS64, is used only if any result register encodes a 64-bit
>    parameter.
> 
> which doesn't really seem related to whether or not the initial call
> was using SMC32 or SMC64. What am I missing?I agree that we cannot use res->a0 to distinguish SMC32/SMC64 for the 
reason you stated.

