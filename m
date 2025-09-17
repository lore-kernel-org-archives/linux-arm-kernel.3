Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A25CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr9HShFLWAZ0zqoQZZFJXZn5UK/pFrU9i8C6/j59RAk=; b=wSgJ481J/FIZdkURn6HL2m1IQB
	nfwe5q6ARdrFsEJyD23+ILW2x/48DFo9g1c6mokVadHrqryzr089URLtUvI++a5lqHl4vEmPbKBQ3
	g6L8aoJVHptQs7AOooyx+opXuqlH2z/YK/HjsSr2wVqMjKht06JojTcWMG3rOtWN1fygSk0nnJ2Te
	G632zmdZtKUUwuTX7WSdCiM5zx9m3Vh3PDqYuEVIoC0N7eE/d7phHTdtMDOXYBDTeTv3pW6QbWTyE
	3Tfosc0u1IrOwfXAFj0Cshe9KPX8Pj+pG6vw8GfqGZRkKqyzMUJlp5UoJ1n+mL3q82H7PN8wjwPt7
	S3CNg44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytUT-0000000CP9E-0vNa;
	Wed, 17 Sep 2025 14:50:37 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytUR-0000000CP7C-0uWu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:50:36 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRhL8185Cz9sxm;
	Wed, 17 Sep 2025 16:41:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JixBRAxvbto3; Wed, 17 Sep 2025 16:41:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRhL76yxbz9sxl;
	Wed, 17 Sep 2025 16:41:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D0FA18B76C;
	Wed, 17 Sep 2025 16:41:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id VStNY412crOA; Wed, 17 Sep 2025 16:41:51 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 452048B767;
	Wed, 17 Sep 2025 16:41:50 +0200 (CEST)
Message-ID: <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
Date: Wed, 17 Sep 2025 16:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
 Shannon Nelson <sln@onemain.com>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_075035_416372_10DF4AF7 
X-CRM114-Status: GOOD (  13.04  )
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



Le 17/09/2025 à 16:00, Thomas Weißschuh a écrit :
> The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
> asm/feature-fixups.h. Currently these headers are included transitively,
> but that transitive inclusion is about to go away.

Hum ...

That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make 
POWER10 and later use pause_short in cpu_relax loops")

In theory, vdso/ headers shouldn't include any headers outside of vdso/


> 
> Explicitly include the headers.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/powerpc/include/asm/vdso/processor.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
> index 80d13207c5688d73954822aede2bbe2d0e05c054..42b64903bdf47cc5bd571fc3b5caed45e6358cb9 100644
> --- a/arch/powerpc/include/asm/vdso/processor.h
> +++ b/arch/powerpc/include/asm/vdso/processor.h
> @@ -4,6 +4,9 @@
>   
>   #ifndef __ASSEMBLY__

__ASSEMBLY__ is replaced by __ASSEMBLER__ in powerpc-next in commit 
74db6cc331b0 ("powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in 
non-uapi headers")

>   
> +#include <asm/cputable.h>
> +#include <asm/feature-fixups.h>
> +
>   /* Macros for adjusting thread priority (hardware multi-threading) */
>   #ifdef CONFIG_PPC64
>   #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")
> 


