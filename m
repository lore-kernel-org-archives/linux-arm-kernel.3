Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4166E68972
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWUORHUHOhOsCm07a+E2m37hra4OA6Pir91mNt1pQDU=; b=scD38VR7AhGA88Mz6Y1JjZfNpi
	pZJo3tS7r7Yft+1zF0Y8rm1DWTC8EIioDcB01vcBQCuM4sc2BVpirg+kZ1XxxaPpoVAfbaQrmADZS
	3OfKCA3NIVkMQWYgmDBGWiRGF0Tvi/EcZbbnVjIBd4+ttRDfHScYB6MMT14RCKmOHSECcRYgRVxiS
	BB5JHRHJXMxkQeR+x1EnSldQkxW4jxtSZkAFdzNUYCJWawEfDqtvXODl4950gtYurITs7bI3e0VTa
	kd9oBACrYkEaatO+US32YrGStoClqI/5W3+W97nvtg67kUcrNULV3xMEcc5SwkxKbYtkQ406+M//g
	DAPwWr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SNA-00000003DcQ-17ZG;
	Thu, 31 Oct 2024 10:25:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SLU-00000003DMv-1IPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:24:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D4451063;
	Thu, 31 Oct 2024 03:24:33 -0700 (PDT)
Received: from [10.44.160.105] (e126510-lin.lund.arm.com [10.44.160.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC8673F73B;
	Thu, 31 Oct 2024 03:23:58 -0700 (PDT)
Message-ID: <a3cd71dc-8d83-4c59-a56a-07ed1720473b@arm.com>
Date: Thu, 31 Oct 2024 11:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
To: Will Deacon <will@kernel.org>, Jeff Xu <jeffxu@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com,
 joey.gouly@arm.com, keith.lucas@oracle.com, pierre.langlois@arm.com,
 shuah@kernel.org, sroettger@google.com, tglx@linutronix.de,
 yury.khrustalev@arm.com, linux-kselftest@vger.kernel.org, x86@kernel.org,
 Kees Cook <keescook@chromium.org>,
 Jorge Lucangeli Obes <jorgelo@chromium.org>, Jann Horn <jannh@google.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
 <20241029144539.111155-2-kevin.brodsky@arm.com>
 <CABi2SkUTSuk_PS9==_czM=64FGWK_5DyUe5QELxiFHtPFsKaHw@mail.gmail.com>
 <20241031093355.GA7008@willie-the-truck>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241031093355.GA7008@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_032404_410686_8B28713C 
X-CRM114-Status: GOOD (  10.45  )
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

On 31/10/2024 10:33, Will Deacon wrote:
> Hi Jeff,
>
> Thanks for chiming in!
>
> On Wed, Oct 30, 2024 at 03:01:53PM -0700, Jeff Xu wrote:
>> On Tue, Oct 29, 2024 at 7:46 AM Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>> TL;DR: reset POR_EL0 to "allow all" before writing the signal frame,
>>> preventing spurious uaccess failures.
> [...]
>
>>> @@ -924,12 +982,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>>         if (!access_ok(frame, sizeof (*frame)))
>>>                 goto badframe;
>>>
>>> -       if (restore_sigframe(regs, frame))
>>> +       if (restore_sigframe(regs, frame, &ua_state))
>>>                 goto badframe;
>>>
>>>         if (restore_altstack(&frame->uc.uc_stack))
>>>                 goto badframe;
>>>
>> Do you need to move restore_altstack ahead of restore_sigframe?
>> similar as x86 change [1],
>> the discussion for this  happened  in [2] [3]
>>
>> [1] https://lore.kernel.org/lkml/20240802061318.2140081-5-aruna.ramakrishna@oracle.com/
>> [2] https://lore.kernel.org/lkml/20240425210540.3265342-1-jeffxu@chromium.org/
>> [3] https://lore.kernel.org/lkml/d0162c76c25bc8e1c876aebe8e243ff2e6862359.camel@intel.com/
>>
>>> +       restore_user_access_state(&ua_state);
> The POR isn't restored until here ^^^, so I _think_ restore_altstack()
> is fine where it is. Kevin, can you confirm, please?

Yes, that's correct, see my earlier reply [1].

- Kevin

[1]
https://lore.kernel.org/all/cd0e114d-57eb-4c90-bb6f-9abf0cc8920f@arm.com/

