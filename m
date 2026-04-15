Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D7EFA0C37
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 06:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6HjAjcgcE6PNwReVnTSdYqGCc9ebXbnfh6z+tasmI8=; b=3qEPTu0mhkPKCHA5tdWWAJZOCj
	wVBrgxXLpKO/q7bHL6BKfoB2YPjPPZtfxzQJp5OjawvWm9LMN3hYGlKGcEZGn0tWzM7Oc5sX1HAee
	+UL0Xk901njiYHyexYCYe4hqds7SP/yMOMzdEuG34qEZ6UyzzbXIltjW9Rb0SpF+t3ZlLDL3ix8r8
	rANZ9k5cCREiRIEG+Gf4ME45wWuLdbFkecXDX6r0RrATL3yxvNynxraZxT1nWqvZ2IJn25dcAGutV
	R+Yh5GQf0uIl4vwNAn4mukcXfJ5VQ3DZJ2qXjQm1nutjIjpOb8BjkenruMfFLfgmEu95vOmlKY0mB
	jhMemIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCtyI-00000000fTI-2ooI;
	Wed, 15 Apr 2026 06:43:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCtyG-00000000fSr-102T;
	Wed, 15 Apr 2026 06:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7742F403A8;
	Wed, 15 Apr 2026 06:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC3EC19424;
	Wed, 15 Apr 2026 06:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776235411;
	bh=3l4dmsvsnQyxf5GbIefFkBoRTtzYmP3a/BJez1WWJU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NmG1V1Qh8X51h9yFFz/RGI1o84gKp7RHsiOopESELjzBD3f9G2epzFGKqLdlrBBvM
	 85BRNDv9YgePWTAd/mWHoOfcVqkZ9t54hSGyPy5okYzBxuCsVMlJue+y2wSJhbVhIb
	 lb1DnIaWF178QVSBg4jx+V4/OFjaBNwtpoh3Tr4lJfjGJizmbNJlvTEiLyH2ILDjm+
	 9pOpGMDHM1wUUHlqTgOAicNu6S/pI86hh/KXo0HpBVSU8mvpdrsn1yE6nfT23v28aD
	 LJpZNPtQ4Ce9RQkXbclJOLPdj0XzY6SczhKB/CIS9XrbEQGTKPU35O7cIRgQtYcfwt
	 Wv24vurrRB4xg==
Message-ID: <0758843e-8f75-4c82-b9c0-25fab502e62f@kernel.org>
Date: Wed, 15 Apr 2026 08:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
References: <20260410120044.031381086@kernel.org>
 <20260410120318.045532623@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_234332_339072_0246AB49 
X-CRM114-Status: GOOD (  14.60  )
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



Le 10/04/2026 à 14:19, Thomas Gleixner a écrit :
> Most architectures define cycles_t as unsigned long execpt:
> 
>   - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.
> 
>   - parisc and mips define it as unsigned int
> 
>     parisc has no real reason to do so as there are only a few usage sites
>     which either expand it to a 64-bit value or utilize only the lower
>     32bits.
> 
>     mips has no real requirement either.
> 
> Move the typedef to types.h and provide a config switch to enforce the
> 64-bit type for x86.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   arch/Kconfig                       |    4 ++++
>   arch/alpha/include/asm/timex.h     |    3 ---
>   arch/arm/include/asm/timex.h       |    1 -
>   arch/loongarch/include/asm/timex.h |    2 --
>   arch/m68k/include/asm/timex.h      |    2 --
>   arch/mips/include/asm/timex.h      |    2 --
>   arch/nios2/include/asm/timex.h     |    2 --
>   arch/parisc/include/asm/timex.h    |    2 --
>   arch/powerpc/include/asm/timex.h   |    4 +---
>   arch/riscv/include/asm/timex.h     |    2 --
>   arch/s390/include/asm/timex.h      |    2 --
>   arch/sparc/include/asm/timex_64.h  |    1 -
>   arch/x86/Kconfig                   |    1 +
>   arch/x86/include/asm/tsc.h         |    2 --
>   include/asm-generic/timex.h        |    1 -
>   include/linux/types.h              |    6 ++++++
>   16 files changed, 12 insertions(+), 25 deletions(-)
> 
> --- a/arch/powerpc/include/asm/timex.h
> +++ b/arch/powerpc/include/asm/timex.h
> @@ -11,9 +11,7 @@
>   #include <asm/cputable.h>
>   #include <asm/vdso/timebase.h>
>   
> -typedef unsigned long cycles_t;
> -
> -static inline cycles_t get_cycles(void)
> +ostatic inline cycles_t get_cycles(void)

What is 'ostatic' ?

>   {
>   	return mftb();
>   }

