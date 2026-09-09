Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B57C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1u4isHAY9FR5rPW9RRCXL4X5BSB1AJKJjDnU2w1M2Q=; b=LkH/vd7oIO5jrn2LPHAs6VdLEf
	lMY4wFLo8eLF+XMxE8PAVQ0HJBTlGjhZkddalPRb8vtnMxQY/IC3r8qN9Hh/rkm6fQYr/MD0znPeK
	8CfXcfW1FFK5dReHVO50ph/8QicTdwTeKpckfPkwjnWyeFm+yPAuqA5vpLHmKi0H/ckHzdRIcndm3
	w69EfzL0vCrxZ3YblmP53NqpKV4aiRs3SvpHHbc4IOjXn6cxz7tXL3j9pv2M0cyVa+bjFBtV5th/u
	ms1vAJcNAuk22zG9Juo7Dkxwdy1LeyzNuaMrW7oVuR4a5S7E7mKQaRcMuIALCCIs89P522BP6D2bn
	hetT2U2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYn-0000000CYjL-4Af1;
	Wed, 09 Sep 2026 17:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYm-0000000CYgK-0EKP;
	Wed, 09 Sep 2026 17:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W1u4isHAY9FR5rPW9RRCXL4X5BSB1AJKJjDnU2w1M2Q=; b=RZfgcSvfKU/UbKLlEgr9nyReMU
	PYMdCxU6Ww3NM49d97yfo3ToM1HSWNpbtLQ3axynZjcqFXq9POHCvoh/FEJzMzjPBjjgISh0zYiDi
	DsqNAWHlO7RKhqCsSulAmlVOGN/FqzkAYqf7GGg/0Lu7ODlElP49acsaf4wXiuoQ8zwn8ljzBAawo
	/Nmog9ICCV6KuigtIWRh05rhAV+a9RnG1zDVI7SpD+0VJSsMBSUI3a1lvvxd8Db/MOc9bSVvV3n8Y
	AYz/xO4qtC17dauM6pFmPPMwV8+qSrY1aA5L4fS1F5IkPFtjcdl6kncNPEI5Q2QZIlS8a+ZvsyN7Y
	ve9JD+ag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4MYe-00000001WBd-1ilY;
	Wed, 09 Sep 2026 17:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60E561576;
	Wed,  9 Sep 2026 10:57:55 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B7053F528;
	Wed,  9 Sep 2026 10:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1788976679; bh=j8s/pkdPWtkxGrVAkD2rab4CbgigKfGGO1TTpT60Ytc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RPs4/Neb/y37OUPUAPtmTMK+coFcLiQBrF3yVred7gBeaz/MeVjBz12tCr7F47QPm
	 ABzvTt3YlvzFcd7TnQG0PSz8uyeNCufAq99j1K3rmmTkkA378Od8fbwEHJ6LKmH70i
	 MWzZAmfduRv183pVWxmOljB8e4xFyytHY7XinDH4=
Message-ID: <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
Date: Wed, 9 Sep 2026 12:57:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
To: Mark Brown <broonie@kernel.org>, Jesse Huang <jesse.huang@sifive.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
 dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, debug@rivosinc.com,
 andrew@sifive.com, kito.cheng@sifive.com
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_185804_864454_890E5128 
X-CRM114-Status: GOOD (  34.73  )
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

<snip> + Jesse, he is working on the glibc side + CC a few others on 
that thread as submitted on the glibc side from sifive. Sorry for the 
delay, I was away on vacation.

>> unsigned long locked = 0x2; // Kernel Task State -> LOCK WRITE
>> unsigned long cur_val = 0x3; // Kernel Task State -> WRITE and SHADOWSTACK
>> ENABLED
>> unsigned long new_val = 0x0; // Userspace Feature Change via syscall ->
>> DISABLE
>> | x86-64 | risc-v | arm64 |
>> | ---------- | -------- | --------- |
>> | Works  | Fails  | Fails     |
> I would not have expected that combination to work at all with the
> prctl() (as opposed to arch_prctl()) interface TBH, if you've locked
> write on you shouldn't be able to disable it.  The reason that works on
> x86 at the minute is that for x86 you can only change one bit at a time
> so the new value when disabling is effectively 0x2, not 0x0.
Yes, this is exactly what I am pointing out. Implementation aside, is that
the behavior we want?
>
>> I am proposing and have questions over the following:
>> 1. What should the behavior be if you had write locked and disable the
>> shadow stack?
>>    - I can argue both ways here, -EPERM or success. I think I and most arches
>> lead to failure.
> Given that RISC-V doesn't support control of writes it's moot there
> at the minute, and x86 currently uses arch_prctl() so will need an
> additional API, it seems the path of least resistance is to allow it.
> This also avoids locking writes (or pushes, for arm64) on effectively
> also locking enable which seems neater.
>
>> 2. riscv should check that the low bit is set in locking not just that its
>> 0, it should be 1
> I think for ABI compatibility RISC-V will have to continue accepting 0
> as being equivalent to locking PR_SHADOW_STACK_ENABLE (or everything,
> but it only supports that one bit right now).

TL;DR - No users, lets fix it before risc-v lands the userspace side IIUC

I can't find any libc's that support this for risc-v. It appears the glibc
patches were not merged and I commented on those patches just now
that the interface is wrong:
   - 
https://inbox.sourceware.org/libc-alpha/8a5e21d0-0628-4910-9ad8-165c829e9680@foss.arm.com/

Additionally, stress-ng does it "generically", and it would be broken on 
a riscv system:
   - 
https://sources.debian.org/src/stress-ng/0.22.00-2/stress-prctl.c?hl=1144#L1144

This is a bug and never followed the convention to begin with. So risc-v is
non-compliant to the spec and this effectively prevents the a true 
unification
of a generic prctl interface. The behavior on riscv doesn't adhere to 
there own docs:

   - 
https://cdn.kernel.org/doc/html/latest/arch/riscv/zicfiss.html#prctl-enabling

>
>> 3. riscv should return -EPERM vs -EINVAL
> If you mean for arch_lock_shadow_stack_status() I think -EINVAL is a
> sensible error code when the system or task does not support shadow
> stacks, I'm not sure we should return -EPERM at all.  On arm64 we
> support locking any bit, not just the ones that we currently know about.
> This is for future proofing, userspace can lock unknown flags.

No, I mean when setting a locked bit via prctl 
and PR_SET_SHADOW_STACK_STATUS.
Currently, the error codes for changing a locked bit:
x86: EPERM
arm64: EBUSY (Which we discussed offline about changing to EPERM)
risc-v:

>> If we can all agree on item 1, that locked bits check can be refactored and
>> shared in one of
>> two ways:
>> 1. within prctl itself, before the arch hook is called, we would need
>> helpers per-arch to extract the thread features and lock bits
>> 2. as a helper where folks just pass the unsigned long of the bits to get
>> the result
> For me option 1 seems a bit nicer, and moves more of the implementation
> into generic code which is something we should really be doing in
> general with the shadow stack support - there's a lot of cross arch
> duplication at the minute.  It has been on my list to look at this
> repitition at some point, it had been held up by the clone3() stuff but
> that seems to have died a death for now.
Agreed, it's more work, but I like it better.

