Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD21C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhakconhrGu2oZYTr+VE77hBjiLRqXZ4OFKpCDCtIwM=; b=z0djSebuZYteI5V7MH7izC2K+9
	3/rrUlX5Bg3TNr3R/K0L0zGiOKfFOxPrpdHvXZQ/MBAtycuvMvGJ5koguUfCy0PXjZ6Kdi2d5sjvk
	+7b9zbZKhKRTmIlESalFj7zStNbF5GsKlqIjriKvsJaP7PIhRM4diyXPr6JWGPtPXteK6vsjNAiFo
	cdf2TBQ+f/bXDWKKfmdirwdii556R5uh7ToRP8tsY8yKY4r+AerChAYt2Pmh1o4Y1saD2086zuqJc
	hYX6Y3dSr6JASLvf3qEK0hzLxzvO0yKLvGWSleSON9z2mP0QzBGIrgmdCEuvtk4mcH4OZSq3jkaxQ
	dBVtOmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOt6-0000000FDsD-0nmQ;
	Sat, 26 Sep 2026 09:40:08 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOt3-0000000FDqi-0bt3;
	Sat, 26 Sep 2026 09:40:07 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4hsMx95lHWz1sPSD;
	Sat, 26 Sep 2026 11:39:57 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4hsMx35nYKz1sPRy;
	Sat, 26 Sep 2026 11:39:51 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4hsMx319yNz1qqlR;
	Sat, 26 Sep 2026 11:39:51 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id r0-zxGatOHrc; Sat, 26 Sep 2026 11:39:43 +0200 (CEST)
X-Auth-Info: wFe88JiXbDxEAWB88fOER1RGk4p+sTXtzQeYAh7Q9amIwrx952rztx0YkIPQk3RO
Received: from tiger (aftr-82-135-83-101.dynamic.mnet-online.de [82.135.83.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 26 Sep 2026 11:39:43 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>,  Thomas Gleixner <tglx@kernel.org>,
  Theodore Ts'o <tytso@mit.edu>,  "Jason A. Donenfeld" <Jason@zx2c4.com>,
  Vincenzo Frascino <vincenzo.frascino@arm.com>,  Nick Desaulniers
 <ndesaulniers@google.com>,  Bill Wendling <morbo@google.com>,  Justin
 Stitt <justinstitt@google.com>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Mark Rutland
 <mark.rutland@arm.com>,  Huacai Chen <chenhuacai@kernel.org>,  WANG Xuerui
 <kernel@xen0n.name>,  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,  Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Heiko Carstens
 <hca@linux.ibm.com>,  Vasily Gorbik <gor@linux.ibm.com>,  Alexander
 Gordeev <agordeev@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Sven Schnelle <svens@linux.ibm.com>,  Ingo
 Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  "H. Peter Anvin" <hpa@zytor.com>,
  x86@kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  loongarch@lists.linux.dev,
  linuxppc-dev@lists.ozlabs.org,  linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org,  llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
In-Reply-To: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
Date: Sat, 26 Sep 2026 11:39:43 +0200
Message-ID: <87zex4ic68.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_024005_337116_99B29611 
X-CRM114-Status: GOOD (  10.07  )
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

On Sep 25 2026, Nathan Chancellor wrote:

> +#if __has_builtin(__builtin_memset_inline)
> +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
> +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> +#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
> +#else
> +static inline void *memset_inline(void *dst, int value, size_t size)
> +{
> +	char *d = dst;
> +
> +	while (size--)
> +		*d++ = value;
> +
> +	return d;
> +}
> +#endif
> +

memset actually returns the original pointer, not the incremented one.
Nothing uses the return value of memset_inline here, but it is
confusing.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

