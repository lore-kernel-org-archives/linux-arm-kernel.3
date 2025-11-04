Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD03CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNuUpq5e6vkEkL9QRwI+Wdn8BwX5B5dX9u4+4qgyKns=; b=rpnAPZcIhMvDeEmG+OPRoHAAc6
	thTmqayXca2GHmrVqHFZlxRHbdAGIxB8nO1/O5pvyzLHq9z4VNvQEJvAykKiMIeKkSD/gbF7kktFX
	DTneFmtOQ2Lcjg3Jm9L6m9xk6u0/fZzojfRAg+E87JnlO5B8c2h4tqJsCouwUunOXV4ToQ1n16wzF
	G5v9r7mONh/3FIUASpwXLVydUI3EqK81O3G+8VdbaudwP4DAzYteOd2fvpRbrxcS3kNnAisyMbAe8
	mwP1Jw/aqG3ytGHZSAe46QcfFhPM0npdg004DWgRTOvDdSyRiJ2hE2c6RFHuJlrgNLJUMiJ5PqEb4
	LXdnbFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArr-0000000BGSJ-2X4F;
	Tue, 04 Nov 2025 06:50:11 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAro-0000000BGQx-4C8U;
	Tue, 04 Nov 2025 06:50:10 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0yqn4Hdvz9sSL;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvWCvtBuZZqr; Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0yqn3J6sz9sS8;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 595658B76C;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fIxXjoi-bve2; Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E3778B763;
	Tue,  4 Nov 2025 07:15:31 +0100 (CET)
Message-ID: <f8872b02-d7f5-421d-8699-5d27987c6e1f@csgroup.eu>
Date: Tue, 4 Nov 2025 07:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 04/12] powerpc/uaccess: Use unsafe wrappers for ASM
 GOTO
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.356628509@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.356628509@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225009_199027_0EFE6D2A 
X-CRM114-Status: GOOD (  14.24  )
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



Le 27/10/2025 à 09:43, Thomas Gleixner a écrit :
> ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:
> 
> bool foo(u32 __user *p, u32 val)
> {
> 	scoped_guard(pagefault)
> 		unsafe_put_user(val, p, efault);
> 	return true;
> efault:
> 	return false;
> }
> 
> It ends up leaking the pagefault disable counter in the fault path. clang
> at least fails the build.

Confirmed on powerpc:

Before the patch

000001e8 <foo>:
  1e8:	81 22 05 24 	lwz     r9,1316(r2)
  1ec:	39 29 00 01 	addi    r9,r9,1
  1f0:	91 22 05 24 	stw     r9,1316(r2)
  1f4:	90 83 00 00 	stw     r4,0(r3)
  1f8:	81 22 05 24 	lwz     r9,1316(r2)
  1fc:	38 60 00 01 	li      r3,1
  200:	39 29 ff ff 	addi    r9,r9,-1
  204:	91 22 05 24 	stw     r9,1316(r2)
  208:	4e 80 00 20 	blr
  20c:	38 60 00 00 	li      r3,0
  210:	4e 80 00 20 	blr

00000000 <__ex_table>:
         ...
                         20: R_PPC_REL32 .text+0x1f4
                         24: R_PPC_REL32 .text+0x20c

After the patch

000001e8 <foo>:
  1e8:	81 22 05 24 	lwz     r9,1316(r2)
  1ec:	39 29 00 01 	addi    r9,r9,1
  1f0:	91 22 05 24 	stw     r9,1316(r2)
  1f4:	90 83 00 00 	stw     r4,0(r3)
  1f8:	81 22 05 24 	lwz     r9,1316(r2)
  1fc:	38 60 00 01 	li      r3,1
  200:	39 29 ff ff 	addi    r9,r9,-1
  204:	91 22 05 24 	stw     r9,1316(r2)
  208:	4e 80 00 20 	blr
  20c:	81 22 05 24 	lwz     r9,1316(r2)
  210:	38 60 00 00 	li      r3,0
  214:	39 29 ff ff 	addi    r9,r9,-1
  218:	91 22 05 24 	stw     r9,1316(r2)
  21c:	4e 80 00 20 	blr

00000000 <__ex_table>:
         ...
                         20: R_PPC_REL32 .text+0x1f4
                         24: R_PPC_REL32 .text+0x20c



> 
> Rename unsafe_*_user() to arch_unsafe_*_user() which makes the generic
> uaccess header wrap it with a local label that makes both compilers emit
> correct code. Same for the kernel_nofault() variants.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   arch/powerpc/include/asm/uaccess.h |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -451,7 +451,7 @@ user_write_access_begin(const void __use
>   #define user_write_access_begin	user_write_access_begin
>   #define user_write_access_end		prevent_current_write_to_user
>   
> -#define unsafe_get_user(x, p, e) do {					\
> +#define arch_unsafe_get_user(x, p, e) do {			\
>   	__long_type(*(p)) __gu_val;				\
>   	__typeof__(*(p)) __user *__gu_addr = (p);		\
>   								\
> @@ -459,7 +459,7 @@ user_write_access_begin(const void __use
>   	(x) = (__typeof__(*(p)))__gu_val;			\
>   } while (0)
>   
> -#define unsafe_put_user(x, p, e) \
> +#define arch_unsafe_put_user(x, p, e)				\
>   	__put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
>   
>   #define unsafe_copy_from_user(d, s, l, e) \
> @@ -504,11 +504,11 @@ do {									\
>   		unsafe_put_user(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e); \
>   } while (0)
>   
> -#define __get_kernel_nofault(dst, src, type, err_label)			\
> +#define arch_get_kernel_nofault(dst, src, type, err_label)		\
>   	__get_user_size_goto(*((type *)(dst)),				\
>   		(__force type __user *)(src), sizeof(type), err_label)
>   
> -#define __put_kernel_nofault(dst, src, type, err_label)			\
> +#define arch_put_kernel_nofault(dst, src, type, err_label)		\
>   	__put_user_size_goto(*((type *)(src)),				\
>   		(__force type __user *)(dst), sizeof(type), err_label)
>   
> 


