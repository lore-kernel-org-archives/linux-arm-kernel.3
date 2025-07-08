Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E0CC83030
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax6+BKNoIU4nlE4o/M0DY3mjWVVS7uAEF/4sgSSsAJM=; b=KE127HUJnOQaNsWGMwPE7plX1I
	7R4JXG0BHJm3pxmc+uEajorPLM9DLt7L6gALzaT4PQ1HZiLFmcmXr1DVVl3WXuctkutiBQpX8G/1m
	AHRoXhfFengcRFkFTcWgqDmgqQIWgJdiJkHLVKn4k5HYtC9DC1LnVp3ivezcca5SH1I8ppV24E+3l
	b4qNWdiHHyv6bVUkRIsNMTW/vgyn56oWJNuRJoDnVcTW9yE1s6z+cat4MZaY8BlYNapXqnng44HSB
	hPeAbMcapGO7Dt+2bJ7RCDcRJ1sNlvCzUxRNk/2TOc8f0xT21Gz1IDVLG+JQdygIov4wQaWspElYT
	ubDVtCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvtE-00000003qM3-1Izx;
	Tue, 08 Jul 2025 00:08:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvqt-00000003qBf-163J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 00:06:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74af4af04fdso3678877b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 17:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1751933186; x=1752537986; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ax6+BKNoIU4nlE4o/M0DY3mjWVVS7uAEF/4sgSSsAJM=;
        b=vzMyXr4ChzE2K3zoap0L+BQcMcfHfps4yVw0IarRrrHhwc9r7wkTY9q3+6OAK0BAfY
         gMmTKUNbcy2X9En5isq0dwONIdViCuaNyz8oMR07Gq8nYEqce5BH04s1lNMAKmFuOLPI
         vDWYCFhLHAe+M8pXbpaYYmcHiNS7cJGSHaoKF1RASFsNrG+UUdx09AVyqVhqs4kYX0dS
         +cxIabzNnb26DoyONRH8JXSqVx2FSQbr6/UbZNxlBWZ4NfJkF0OvpYBa8HHtyftdybdG
         cj3lZUV6FMsQwxvm8uGKuy6FCyWPY/tYVBn8FaZQTEiwZ4L3KeUuba/gVDexQi68OzLr
         chYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751933186; x=1752537986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ax6+BKNoIU4nlE4o/M0DY3mjWVVS7uAEF/4sgSSsAJM=;
        b=UdY/vDi3ilPdwvK1A07iX3o0E8DdYQfYB/bE94pXcZZJb85+4/MvnF2FhvWOO6oxWf
         ruMem6n3TUV9Cn2XENTCaslhozs1EDv+l5unboyVQlKV75h0LHGQBccdds68gntk88jr
         b0sYxpnoRc6WVKMrmaQjCKAK9vSwTgitjeChXF5dBh71SasEDppg52NKWtIQuGRB1aop
         chsBH+jdIUq8mQYb0kemvsd64omea6Bz/0oTfxlJUEGRD2Vv80EgFPjvKn9+6tWiQBkb
         XSZiGr3GB6C4XuljS9HGZFEfYSEfPVzbQeQcV8GiL7AHhkWhmKLLRCvSD4Jln/z/skha
         MciA==
X-Forwarded-Encrypted: i=1; AJvYcCW4QX9L3bUT1sidbLeFAHSqdBZ6QW+J8NnS6Emz8Z7WJJIeGIcKDhT95ZDerApKmMI+7FBVXH1l6NHX+OKnbHFH@lists.infradead.org
X-Gm-Message-State: AOJu0YxggVDKsVQ47CzzYFz8D23QP5qbPWb3TESB6omNOtbiAqDVI0fl
	mS1e7Ub9L8DFA7ogL6cHOoyVdThwE1itUhJdXYFblwUlr0XdPc11aq3uw1uSg5mUL5s=
X-Gm-Gg: ASbGncvEUDzr/UApeghtHUfinuligX7WTwIY3Xk1hn0Z8Rlz1Dti/aUzMekIUJpb5Mt
	mR5hGgVfyhyZxTjc1j1181tOrD8vs5gYMCmVnm8mol8rQwKv/SXb4f/uz0wtSnE2Zf9MrRctBpi
	X3ZqM79lep8LE/LcUYUpdovgskrgSrDKtgt+eByA1c0Red8dh+butizMH6zfYWTIAU0UFkyJqGo
	EzSRCqR3rA+ROs913tRAKjkm+vkyx15H2qspVJc4tdo41am7UIQR1iow89zaMx1+J/dJwt2lE7x
	Fom9RvMX09P5iqIMnoC4ZJJidIJu39z6zVZE1oW1+1rZDVUpHsMQI7yegbhga0TXKqoOLnlL6RK
	x
X-Google-Smtp-Source: AGHT+IHQab0Vlg4d7ntyP05rnfHQwduuTL0UOsc7WcslcclhxqnvwNr+R8+/2tFQx+TVn4STJVdhZA==
X-Received: by 2002:a05:6a20:a883:b0:218:2b6e:711f with SMTP id adf61e73a8af0-22b61497d82mr747733637.14.1751933185948;
        Mon, 07 Jul 2025 17:06:25 -0700 (PDT)
Received: from [10.10.1.14] ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38fc4380c7sm7253955a12.51.2025.07.07.17.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 17:06:25 -0700 (PDT)
Message-ID: <3b10fa81-bfdd-4325-a330-c79df2e21621@immunant.com>
Date: Mon, 7 Jul 2025 17:06:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] KVM: arm64: Use SMCCC 1.2 for FF-A initialization
 and in host handler
To: Marc Zyngier <maz@kernel.org>, perlarsen@google.com
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com,
 arve@android.com, ayrton@google.com, qperret@google.com,
 sebastianene@google.com, qwandor@google.com
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-2-995afc3d385e@google.com>
 <8634bdbgaz.wl-maz@kernel.org>
Content-Language: en-US
From: Per Larsen <perl@immunant.com>
In-Reply-To: <8634bdbgaz.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_170627_545779_8C6C7E54 
X-CRM114-Status: GOOD (  31.81  )
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

On 7/3/25 5:38 AM, Marc Zyngier wrote:
> On Tue, 01 Jul 2025 23:06:35 +0100,
> Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org> wrote:
>>
>> From: Per Larsen <perlarsen@google.com>
>>
>> SMCCC 1.1 and prior allows four registers to be sent back as a result
>> of an FF-A interface. SMCCC 1.2 increases the number of results that can
>> be sent back to 8 and 16 for 32-bit and 64-bit SMC/HVCs respectively.
>>
>> FF-A 1.0 references SMCCC 1.2 (reference [4] on page xi) and FF-A 1.2
>> explicitly requires SMCCC 1.2 so it should be safe to use this version
>> unconditionally. Moreover, it is simpler to implement FF-A features
>> without having to worry about compatibility with SMCCC 1.1 and older.
>>
>> Update the FF-A initialization and host handler code to use SMCCC 1.2.
>>
>> Signed-off-by: Per Larsen <perlarsen@google.com>
>> ---
>>   arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>>   arch/arm64/kvm/hyp/nvhe/ffa.c    | 193 +++++++++++++++++++++++++--------------
>>   2 files changed, 125 insertions(+), 69 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
>> index a76522d63c3e630795db5972a99abc3d24bc5e26..f859a8fb41a25effea1edd977bef889423153399 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
>> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
>> @@ -27,6 +27,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
>>   	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
>>   hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
>>   	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
>> +hyp-obj-y += ../../../kernel/smccc-call.o
>>   hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
>>   hyp-obj-y += $(lib-objs)
>>   
>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> index 2c199d40811efb5bfae199c4a67d8ae3d9307357..65d241ba32403d014b43cc4ef4d5bf9693813809 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> @@ -71,36 +71,68 @@ static u32 hyp_ffa_version;
>>   static bool has_version_negotiated;
>>   static hyp_spinlock_t version_lock;
>>   
>> -static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
>> +static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
>>   {
>> -	*res = (struct arm_smccc_res) {
>> +	*res = (struct arm_smccc_1_2_regs) {
>>   		.a0	= FFA_ERROR,
>>   		.a2	= ffa_errno,
>>   	};
>>   }
>>   
>> -static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int ret, u64 prop)
>> +static void ffa_to_smccc_res_prop(struct arm_smccc_1_2_regs *res, int ret, u64 prop)
>>   {
>>   	if (ret == FFA_RET_SUCCESS) {
>> -		*res = (struct arm_smccc_res) { .a0 = FFA_SUCCESS,
>> -						.a2 = prop };
>> +		*res = (struct arm_smccc_1_2_regs) { .a0 = FFA_SUCCESS,
>> +						      .a2 = prop };
>>   	} else {
>>   		ffa_to_smccc_error(res, ret);
>>   	}
>>   }
>>   
>> -static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
>> +static void ffa_to_smccc_res(struct arm_smccc_1_2_regs *res, int ret)
>>   {
>>   	ffa_to_smccc_res_prop(res, ret, 0);
>>   }
>>   
>>   static void ffa_set_retval(struct kvm_cpu_context *ctxt,
>> -			   struct arm_smccc_res *res)
>> +			   struct arm_smccc_1_2_regs *res)
>>   {
>> +	DECLARE_REG(u64, func_id, ctxt, 0);
>>   	cpu_reg(ctxt, 0) = res->a0;
>>   	cpu_reg(ctxt, 1) = res->a1;
>>   	cpu_reg(ctxt, 2) = res->a2;
>>   	cpu_reg(ctxt, 3) = res->a3;
>> +	cpu_reg(ctxt, 4) = res->a4;
>> +	cpu_reg(ctxt, 5) = res->a5;
>> +	cpu_reg(ctxt, 6) = res->a6;
>> +	cpu_reg(ctxt, 7) = res->a7;
> 
>  From DEN0028G 2.6:
> 
> <quote>
> Registers W4-W7 must be preserved unless they contain results, as
> specified in the function definition.
> </quote>
> 
> On what grounds can you blindly change these registers?
 From DEN0077A 1.2 Section 11.2: Reserved parameter convention

<quote>
Unused parameter registers in FF-A ABIs are reserved for future use by 
the Framework.

[...]

The caller is expected to write zeroes to these registers. The callee 
ignores the values in these registers.
</quote>

My read is that, as long as we are writing zeroes into reserved 
registers (which I believe we are), we comply with DEN0026G 2.6.>
>> +
>> +	/*
>> +	 * DEN0028C 2.6: SMC32/HVC32 call from aarch64 must preserve x8-x30.
>> +	 *
>> +	 * The most straightforward approach is to look at the function ID
>> +	 * sent by the caller. However, the caller could send FFA_MSG_WAIT
>> +	 * which is a 32-bit interface but the reply could very well be 64-bit
>> +	 * such as FFA_FN64_MSG_SEND_DIRECT_REQ or FFA_MSG_SEND_DIRECT_REQ2.
>> +	 *
>> +	 * Instead, we could look at the function ID in the response (a0) but
>> +	 * that doesn't work either as FFA_VERSION responses put the version
>> +	 * number (or error code) in w0.
>> +	 *
>> +	 * Set x8-x17 iff response contains 64-bit function ID in a0.
>> +	 */
>> +	if (func_id != FFA_VERSION && ARM_SMCCC_IS_64(res->a0)) {
>> +		cpu_reg(ctxt, 8) = res->a8;
>> +		cpu_reg(ctxt, 9) = res->a9;
>> +		cpu_reg(ctxt, 10) = res->a10;
>> +		cpu_reg(ctxt, 11) = res->a11;
>> +		cpu_reg(ctxt, 12) = res->a12;
>> +		cpu_reg(ctxt, 13) = res->a13;
>> +		cpu_reg(ctxt, 14) = res->a14;
>> +		cpu_reg(ctxt, 15) = res->a15;
>> +		cpu_reg(ctxt, 16) = res->a16;
>> +		cpu_reg(ctxt, 17) = res->a17;
>> +	}
>>   }
> 
> I don't see how that can ever work.
> 
> Irrespective of how FFA_MSG_WAIT actually works (and I couldn't find
> anything in the spec that supports the above), the requester will
> fully expect its registers to be preserved based on the initial
> function type, and that alone. No ifs, no buts.
> 
> If what you describe can happen (please provide a convincing example),
> then the spec is doomed.

DEN0077A 1.2 Section 8.2 (Runtime Model for FFA_RUN) and 8.3 (Runtime 
Model for Direct request ABIs) contains Figures 8.1 and 8.2. Each figure 
shows transitions between states "waiting", "blocked", "running", and 
"preempted". Key to my understanding is that the waiting state in Figure 
8.1 and Figure 8.2 is the exact same state. This appears to be the case 
per Section 4.10.

So we have to consider the ways to get in and out of the waiting state 
by joining the state machines in Figures 8.1 and 8.2. Figure 8.1 has an 
edge between "running" and "waiting" caused by FFA_MSG_WAIT. Figure 8.2 
has an edge between "waiting" and "running" caused by a "Direct request 
ABI".

Direct request ABIs include FFA_MSG_SEND_DIRECT_REQ2 which is why the 
FF-A 1.2 spec, in my read, permits the response to a 32-bit FFA_MSG_WAIT 
call can be a 64-bit FFA_MSG_SEND_DIRECT_REQ2 reply.

The Trusty TEE OS calls FFA_MSG_WAIT here: 
https://cs.android.com/android/platform/superproject/main/+/main:trusty/kernel/lib/sm/sm.c;l=844?q=sm.c&ss=android 
and anticipates a direct request ABI as one of the potential replies.

Thanks,
Per

PS: I'm replying from perl@immunant.com as I cannot use 
perlarsen@google.com to send replies to review comments.



