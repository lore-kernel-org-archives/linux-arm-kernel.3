Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABFACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ivhia2P31L3ei0jVhnnZos8lhDkPjPtGSI3kUzzKNKg=; b=FKTSlO6HDhroMUicyL977KHkE8
	Mpx30iTEfiR0oIp4iSMw48i+qVAfxg+EZcC08y0AuwbNPZKUVX6uVWILXcmYkdOE37l5SkSCC1+i1
	aoVgeQQhwOdc4UWAZARnOQHIH1DR5wa5yUyXFSETp0s61uc7wxp0xBd9jP64nkfsIx2MdeAP4xP6L
	gPAZGzYXaX9MUgmv2FDv8oRl9maaA70XSaiQ80pHRyzROukTKOS1HQA0msDKvSV2QMxSY12Xu7O1O
	0tvXFzDE9s0opyCUmYr4pQ5crjOG4yP6C/QeXB0+igrdGBLXzuwZnJ2jPGp/Xv1fthtmYtmaRdK2w
	pnYOtfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAs1-0000000BGYo-2myr;
	Tue, 04 Nov 2025 06:50:21 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArx-0000000BGWe-3r8w;
	Tue, 04 Nov 2025 06:50:20 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0zGM0Zbtz9sSh;
	Tue,  4 Nov 2025 07:35:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4w3aEv5EITr; Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0zGL6PZFz9sSg;
	Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C4D928B76C;
	Tue,  4 Nov 2025 07:35:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fs4pJqTtKSTf; Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C60B08B763;
	Tue,  4 Nov 2025 07:35:04 +0100 (CET)
Message-ID: <e0795f90-1030-4954-aefc-be137e9db49e@csgroup.eu>
Date: Tue, 4 Nov 2025 07:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083700.573016505@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225019_068600_794CF9F7 
X-CRM114-Status: GOOD (  13.26  )
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
> This is a follow up on the V4 feedback:
> 
>     https://lore.kernel.org/20251022102427.400699796@linutronix.de
> 
> Changes vs. V4:
> 
>    - Rename get/put_user_masked() to get/put_user_inline()
> 
>    - Remove the futex helpers. Keep the inline get/put for now as it needs
>      more testing whether they are really valuable.
> 
>    - Picked up tags
> 
> The series is based on v6.18-rc1 and also available from git:
> 
>      git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/scoped
> 

move_addr_to_user() in net/socket.c and put_cmsg() in net/core/scm.c 
should be converted as well

Christophe

> Thanks,
> 
> 	tglx
> ---
> Thomas Gleixner (12):
>        ARM: uaccess: Implement missing __get_user_asm_dword()
>        uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
>        x86/uaccess: Use unsafe wrappers for ASM GOTO
>        powerpc/uaccess: Use unsafe wrappers for ASM GOTO
>        riscv/uaccess: Use unsafe wrappers for ASM GOTO
>        s390/uaccess: Use unsafe wrappers for ASM GOTO
>        uaccess: Provide scoped user access regions
>        uaccess: Provide put/get_user_inline()
>        coccinelle: misc: Add scoped_masked_$MODE_access() checker script
>        futex: Convert to get/put_user_inline()
>        x86/futex: Convert to scoped user access
>        select: Convert to scoped user access
> 
>   arch/arm/include/asm/uaccess.h               |   26 ++
>   arch/powerpc/include/asm/uaccess.h           |    8
>   arch/riscv/include/asm/uaccess.h             |    8
>   arch/s390/include/asm/uaccess.h              |    4
>   arch/x86/include/asm/futex.h                 |   75 ++----
>   arch/x86/include/asm/uaccess.h               |   12 -
>   fs/select.c                                  |   12 -
>   include/linux/uaccess.h                      |  314 ++++++++++++++++++++++++++-
>   kernel/futex/core.c                          |    4
>   kernel/futex/futex.h                         |   58 ----
>   scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
>   11 files changed, 501 insertions(+), 128 deletions(-)
> 


