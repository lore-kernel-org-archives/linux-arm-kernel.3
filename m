Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41129CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzLbMenZtftH89T106gmsuJ+uofhbnsg1l+2Ng0lErU=; b=ssTtAdKj/WYqDenNlHDRiBtv4v
	TOwRnS921FEOh3b3/Edv2eKhZOTPVFY/C0joOrM1zqmf3WMSj/ekO78xqDw2QBeNU/gqyg0g+shIv
	96bg+23bykF/MvexfNZcJtqgP1NpOI4BqPclynBMEfiRBxjZTfjH+4yATGwss+yH780ATWvkT5kEE
	tRwIv+z4Packj173NoeotVPbnObiFG+FNr2/1OUgSss4b8xAFC3WJIY/GoG4rfaxqNOVM6T1a4nxB
	gwFvgtig3K2vdxD3NqRd70R4HErn/qETx0VF9eUkl45sGn57GoRRJ8cGvhPEvh8x22iH6oMTZs/5q
	56pI4P9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuQa-0000000CsvE-3ZCq;
	Wed, 17 Sep 2025 15:50:40 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuQX-0000000Csse-1mHF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:50:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRjGc51W3z9sxb;
	Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id semPCKf2cGPh; Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRjGc3ltzz9sxZ;
	Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 699538B76C;
	Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sLjYwSuYZXNq; Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 38E3E8B767;
	Wed, 17 Sep 2025 17:23:40 +0200 (CEST)
Message-ID: <c4a281c7-e225-418f-95c3-8fa91073a6b4@csgroup.eu>
Date: Wed, 17 Sep 2025 17:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
 <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
 <20250917171207-1fad0416-7543-481c-a998-5881fab1714e@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250917171207-1fad0416-7543-481c-a998-5881fab1714e@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_085037_619284_9154F4EB 
X-CRM114-Status: GOOD (  14.72  )
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



Le 17/09/2025 à 17:21, Thomas Weißschuh a écrit :
> On Wed, Sep 17, 2025 at 04:41:49PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 17/09/2025 à 16:00, Thomas Weißschuh a écrit :
>>> The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
>>> asm/feature-fixups.h. Currently these headers are included transitively,
>>> but that transitive inclusion is about to go away.
>>
>> Hum ...
>>
>> That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make
>> POWER10 and later use pause_short in cpu_relax loops")
>>
>> In theory, vdso/ headers shouldn't include any headers outside of vdso/
> 
> I am aware. But this is the dependency as it exists today and I don't really
> want to make this series larger than it already is. This is by far not the
> only such layering violation in the vDSO headers. I have some patches prepared...
> 
>>> Explicitly include the headers.
>>>
>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>> ---
>>>    arch/powerpc/include/asm/vdso/processor.h | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
>>> index 80d13207c5688d73954822aede2bbe2d0e05c054..42b64903bdf47cc5bd571fc3b5caed45e6358cb9 100644
>>> --- a/arch/powerpc/include/asm/vdso/processor.h
>>> +++ b/arch/powerpc/include/asm/vdso/processor.h
>>> @@ -4,6 +4,9 @@
>>>    #ifndef __ASSEMBLY__
>>
>> __ASSEMBLY__ is replaced by __ASSEMBLER__ in powerpc-next in commit
>> 74db6cc331b0 ("powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi
>> headers")
> 
> Ack. I'll have to rebase this series after -rc1 in any case. Right now I am
> hoping to collect some Acks.
> 
>>> +#include <asm/cputable.h>
>>> +#include <asm/feature-fixups.h>
>>> +
>>>    /* Macros for adjusting thread priority (hardware multi-threading) */
>>>    #ifdef CONFIG_PPC64
>>>    #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")
>>>
>>


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>



