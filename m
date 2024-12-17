Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FAFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+CROXNMQB4zsFWzTxbDDJajvghMgBuYZmlPGZXhJXg=; b=DO3OiV4K6e+B+5KtRhZCEFkPrT
	KMN+T0b79wedg5S8/44z+mM8ZcH00vdlTxPo6RsPb49bSzZ9PMHEcQDjdKOYxEYi/YIYXRM/wWoIZ
	IrfI6zYQaDlvdOOL3NyOSm7AMqtNBJPRNX2Tz9VkHbfXl2xAfTBaal9YU83t/r7G2vMObPUytrzPg
	Ady2GZER9Y4rrOGry6iTCUTyVK61bNDFf+xykt9gMwH8lBF/uOSBTpv7WSHYaWKTbHZGYo2WCEX3G
	cgRKlpSLxopVxHYt2GdZ4u7dntVFeyNyj8kJB2wIcyVuM4Gyz++cFrbTcxGo53HtTGZLuhLKJikBt
	5ZPXqnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSLk-0000000CcxJ-1eoL;
	Tue, 17 Dec 2024 07:50:36 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSJG-0000000CcaT-2Zue;
	Tue, 17 Dec 2024 07:48:04 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YC86z6Lcmz9sPd;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fC7tw8E5ccA2; Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YC86z5K7qz9rvV;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A3F418B768;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iR2VLUnfgYsc; Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 73D238B763;
	Tue, 17 Dec 2024 08:47:54 +0100 (CET)
Message-ID: <ddd4439e-6f6f-4513-a7dc-b7f01bec03dc@csgroup.eu>
Date: Tue, 17 Dec 2024 08:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/ptdump: Drop GENERIC_PTDUMP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20241217034807.2541349-1-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241217034807.2541349-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_234802_816221_B90B3F39 
X-CRM114-Status: GOOD (  20.44  )
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



Le 17/12/2024 à 04:48, Anshuman Khandual a écrit :
> GENERIC_PTDUMP does not guard any code but instead just used for platform's
> subscription into core ptdump defined under PTDUMP_CORE, which is selected.
> Instead use PTDUMP_CORE for platform subscription and drop GENERIC_PTDUMP.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.13-rc3 and has been tested on arm64, although it
> also clears build tests on impacted platforms.
> 
>   Documentation/arch/arm64/ptdump.rst       | 1 -
>   arch/arm64/Kconfig                        | 2 +-
>   arch/arm64/kvm/Kconfig                    | 3 +--
>   arch/powerpc/Kconfig                      | 2 +-
>   arch/powerpc/configs/mpc885_ads_defconfig | 1 -
>   arch/riscv/Kconfig                        | 2 +-
>   arch/s390/Kconfig                         | 2 +-
>   arch/x86/Kconfig                          | 2 +-
>   arch/x86/Kconfig.debug                    | 2 +-
>   kernel/configs/debug.config               | 1 -
>   mm/Kconfig.debug                          | 8 ++------
>   11 files changed, 9 insertions(+), 17 deletions(-)
> 

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a0ce777f9706..c716f8df10de 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -203,7 +203,7 @@ config PPC
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_PCI_IOMAP		if PCI
> -	select GENERIC_PTDUMP
> +	select PTDUMP_CORE

Please keep alphabetical order.

>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL
>   	select GENERIC_VDSO_TIME_NS

> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index 41a58536531d..b206e5a11f96 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -187,7 +187,7 @@ config DEBUG_WX
>   	bool "Warn on W+X mappings at boot"
>   	depends on ARCH_HAS_DEBUG_WX
>   	depends on MMU
> -	select PTDUMP_CORE
> +	depends on PTDUMP_CORE

This change is unclear to me. It works because all arch selecting 
ARCH_HAS_DEBUG_WX also select GENERIC_PTDUMP. For riscv it's even more 
tricking, Riscv only selects GENERIC_PTDUMP when MMU is set, so it works 
because here it also depends on MMU.

But what happens if in the future an architecture selects 
ARCH_HAS_DEBUG_WX without selecting PTDUMP_CORE ?


>   	help
>   	  Generate a warning if any W+X mappings are found at boot.
>   
> @@ -212,9 +212,6 @@ config DEBUG_WX
>   
>   	  If in doubt, say "Y".
>   
> -config GENERIC_PTDUMP
> -	bool
> -
>   config PTDUMP_CORE
>   	bool
>   
> @@ -222,8 +219,7 @@ config PTDUMP_DEBUGFS
>   	bool "Export kernel pagetable layout to userspace via debugfs"
>   	depends on DEBUG_KERNEL
>   	depends on DEBUG_FS
> -	depends on GENERIC_PTDUMP
> -	select PTDUMP_CORE
> +	depends on PTDUMP_CORE
>   	help
>   	  Say Y here if you want to show the kernel pagetable layout in a
>   	  debugfs file. This information is only useful for kernel developers


