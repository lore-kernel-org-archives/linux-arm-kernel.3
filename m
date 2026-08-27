Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFF3C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPT+2vRdKkdSbvju/IJdFlPYzIgiEi/Qaixo4uyGCsk=; b=ReU9Zi1TLrK4JkOgrIX+HB952i
	E5UThWlHCECK3UwnlPxIEmV1BlNqD8dmk2zKHPtfeibXdJRoppErYFslS5QpR3pZKt9Q1otJTXwdA
	CThismcTnNTK8X91TehAnrXHLbTPkpaQI9dmFNV7hWcC/CVwjjfVXYo/iBS56a1cTVIydICoKRL35
	jcLXifsRL2kYB/DouJrdkTNZQCqvsu/UHW/43byjRSsP7doL++ZfShda2AC7tZCeq0gNFb1+HZjuW
	Uvo+/4F7a61wocNi3FoG/1S3hTNEMWAQrtIkX+PI2IxWG0rt8yvXhQaOSNszK1N9Jj4iFhDxXjctD
	f+lX3mmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHJ-00000004VmG-0Pfz;
	Thu, 27 Aug 2026 17:52:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHC-00000004Vgj-32wN;
	Thu, 27 Aug 2026 17:52:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C51F2165C;
	Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFB0F3F7D8;
	Thu, 27 Aug 2026 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1787853149; bh=3Lo+ZdElb1bhCszSyr1ciTzcKatyHt00pcCO0obh9Hk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=LLVXzCCVqihttZUVw5hf327N6NQF/8OTgVqmkRTWAKwtW7JaJNRd34Dmfeb89URQY
	 SFvbiIJ41kOlYkwg6d2BlBms8vwwU1klpZ1EkH3E618IMsvMTHTUDoTHcVPSrjx5Ns
	 UPBGKX1xHk57nyAWP2hBKL9tmsqr2otVNnrPAcSU=
Message-ID: <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
Date: Thu, 27 Aug 2026 12:52:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
From: Bill Roberts <bill.roberts@foss.arm.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org
Cc: dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com,
 debug@rivosinc.com, broonie@kernel.org
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
Content-Language: en-US
In-Reply-To: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105238_517845_16C01375 
X-CRM114-Status: GOOD (  13.42  )
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

On 8/27/26 12:15 PM, Bill Roberts wrote:

Sorry resend, wrong outgoing mail server in my client so it got mangled, 
this one should be proper...

Howdy folks,

If you haven't seen, I have been floating some patches to bring x86-64 
shadow stack controls over to prctl, and it's generally straight forward.
The larger motivation, is that I am doing all of this so we can place 
LSM controls on shadow stack manipulations. For x86 will we need to hook
the old and new implementations.

I have noticed some semantic differences between the arches. Given this 
example of current thread state, current thread locking state and the
new features requested, as shown below:

unsigned long locked = 0x2; // Kernel Task State -> LOCK WRITE
unsigned long cur_val = 0x3; // Kernel Task State -> WRITE and 
SHADOWSTACK ENABLED
unsigned long new_val = 0x0; // Userspace Feature Change via syscall -> 
DISABLE

| x86-64 | risc-v | arm64 |
| ---------- | -------- | --------- |
| Works  | Fails  | Fails     |

Besides the locking difference, I have also noticed a few other issues 
noted below:

Risc-v:
- shouldn't reject all bits in locking, it supports shadow stack.
- shouldn't return EINVAL on locking checks

See the code snippets for these below:

if (is_shstk_locked(t))
                 return -EINVAL;

int arch_lock_shadow_stack_status(struct task_struct *task,
                                   unsigned long arg)
{
         /* If shtstk not supported or not enabled on task, nothing to 
lock here */
         if (!is_user_shstk_enabled() ||
             !is_shstk_enabled(task) || arg != 0)
                 return -EINVAL;

         set_shstk_lock(task, true);

         return 0;
}

arm64:
1. Locking failures return -EBUSY vs -EPERM, I spoke with Mark (on CC) 
he seemed OK with this,

I would like to find a way to rectify this so userspace has a common API.

I am proposing and have questions over the following:
1. What should the behavior be if you had write locked and disable the 
shadow stack?
   - I can argue both ways here, -EPERM or success. I think I and most 
arches lead to failure.
2. riscv should check that the low bit is set in locking not just that 
its 0, it should be 1
3. riscv should return -EPERM vs -EINVAL
4. x86 locking state should fail

If we can all agree on item 1, that locked bits check can be refactored 
and shared in one of
two ways:
1. within prctl itself, before the arch hook is called, we would need 
helpers per-arch to extract the thread features and lock bits
2. as a helper where folks just pass the unsigned long of the bits to 
get the result

Thanks everyone


