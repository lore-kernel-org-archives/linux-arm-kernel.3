Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E081C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dsI3FWnSdEYgjERCfNUu6yJHUxlHlUWLYDZY8BqrW8=; b=ii2vqyyy/CfRR7
	axJ68KnYNBHkbTnEUQdPeeoTxKuIy1YwL/lA3tQC22YkngolS/VIfSEuQ/gCmpf3SFJhBbg7W6UdR
	oFMVM0Cdwex+THc6P+syhIS5SEF4HOkWfsOunUzwZhGnDrEhtcmXQGv2UBNAOTfz9Cesn2JLLV6tw
	SlmS3mAsIC4QEFh1fd3sxaz+HhwSy5c7veezHIw/dLhZFngiFqKaxOo/XmFMtXdh30nLumqFYG4bo
	GCXD4aWzXSqKYvnD/hjPm/HCC9n3RhstkNl5vazGwfBW5Fz0duxB7c5V528rKT6dLPhXJHz5s8v7A
	zXw9XmQZuN/xbOOSOYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FiI-0000000BSGh-0OIX;
	Wed, 09 Sep 2026 10:39:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FiE-0000000BSFJ-41xc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:39:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7A71691;
	Wed,  9 Sep 2026 03:39:26 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B84BF3F528;
	Wed,  9 Sep 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788950369; bh=vNI2Ak4htqKNBE48KOxpfdiqt1p3zXAgNTQmXitTXb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hyq5DsKW2ovGYbyYSuSgXxM7/0DFNyHt0tkHaZUn1P42F6DTssmR2zu+UmXGnjyxl
	 g0u8bMryXOQC/RB15nqHOjxbaOjIgeeqwSc27qk4hNHsOcQ1rj/S8W/WWhzz4IXTIk
	 YHg3VQKIcZ7mR+ckUQebn0vhHMZvYBc/vD45QHVw=
Message-ID: <40954731-a235-4877-b615-7a3f66f1b039@arm.com>
Date: Wed, 9 Sep 2026 11:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp
 into SP_EL0
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20260907164247.17223-1-will@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_033931_103744_95C1729E 
X-CRM114-Status: GOOD (  23.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Will,

On 9/7/26 17:42, Will Deacon wrote:
> Hi everyone,
> 
> This series is a bit of a complicated juggling act that, on its own,
> doesn't achieve an awful lot. However, it lays the ground work for
> sizing the kernel stack at runtime, e.g. via a cmdline option or even
> potentially on a per-task basis and so I would like to work towards
> getting it merged independently.
> 
> The series is based on v7.3-rc1 and structured as follows:
> 
>   * The first 9 patches move the 'current' task pointer from SP_EL0
>     to TPIDRRO_EL0.
> 
>   * The following 8 patches point the newly-freed SP_EL0 at the overflow
>     stack and switch to it explicitly when we detect a kernel stack
>     overflow.
> 
>   * The final 4 patches turn everything on its head, so that the
>     overflow stack and kernel stack are swapped, with the former now
>     residing in SP_EL1 and the latter in SP_EL0.
> 
> At the end of all that, when we take an exception from EL1, we are
> immediately transitioned to the overflow stack (now renamed "exception
> stack") and can push registers right away. This also means that using
> SPINTMASK to control NMI masking becomes a possibility, although
> speaking to Mark, Vladimir and Ada, they all seem to prefer ALLINT.
> 
> Mostafa will soon post a follow-up series that allows the kernel stack
> size to be specified on the kernel cmdline, which we are hoping to use
> to configure an 8k stack size in Android. I will be talking more about
> all of this at LPC in the Memory Management MC:
> 
>   https://lpc.events/event/20/contributions/2419/
> 
> Cheers,
> 
> Will
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mostafa Saleh <smostafa@google.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> 
I gave it a try and I observe splat:

Unable to handle kernel execute from non-executable memory at virtual address ffff000970e81148
Mem abort info:
  ESR = 0x000000008600000f
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x0f: level 3 permission fault
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008129f000
[ffff000970e81148] pgd=0000000000000000, p4d=18000009f1dff403, pud=18000009f1079403, pmd=18000009f0ef1403, pte=00e80009f0e81707
Internal error: Oops: 000000008600000f [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc2-7fb054f87+ #3627 PREEMPT(lazy) 
Hardware name: Generated (DT)
pstate: 1634023c9 (nZCv DAIF +ALLINT +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : 0xffff000970e81148
lr : 0xffff000970e81148
sp : ffff000970e81150
x29: ffff800080f85fc0 x28: 0000000000000001 x27: 0000000000002000
x26: 0000000000000000 x25: 00000000000000c0 x24: 0000000040000023
x23: ffff800080c0e1d8 x22: 00000000000003c0 x21: ffff800080b58300
x20: cfa2800080b58300 x19: 00000000200003c0 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000028
x14: 0000000000000000 x13: ffff8000814f3ac0 x12: ffff8008efcac000
x11: b2000c3eb474d99d x10: 0000000000000008 x9 : 0000000000001000
x8 : ffff800080010800 x7 : 055001f2b5503510 x6 : 0000000001310000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800081502d80
x2 : 0000000000000802 x1 : ffff000800106a70 x0 : 0000000000000001
Call trace:
 0xffff000970e81148 (P)
Code: 00000000 00000000 00000000 00000000 (00000002) 
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x0,00000000,034bfc7d,ff728b42,7ffce667
Memory Limit: none
---[ end Kernel panic - not syncing: Oops: Fatal exception ]---

I suspect it is related to power management, since it can be triggered
with the sleep command, though I haven't debugged it. I noticed that
Sashiko has reported issues related to suspend/resume, so if you
provide fixups for the relevant commits, I can give them another
try. Otherwise, I'll wait for v2 :)

Cheers
Vladimir

