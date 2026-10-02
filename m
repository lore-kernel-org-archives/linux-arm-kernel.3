Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D501CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKu1k8kGP5SDfYzTUe6BEg1Rh9OEx1S7cLJzvwkIo8E=; b=Ea4tmmWA7OM7ItGocxGmrj5XUW
	091gVuNvvXdhYuXydaqUc7Egg8vUO3rnQMKNS0LYWMVxMbhi37/9jadngNrEeGxxjL3/+Qux1oB38
	zCy+dXCaNO1RHVP6jclcFZDmjGAj5H0Wt+7ot5vPcn2qomsDlCZtHB52Lwr8lwlajp5KDchj8GIvH
	CsMr4D6GlxCnMl1s+8Ppbrnn7D5ePqOhhTeIl1VzLkGO0TLGgK96/v28Fpmfd0Uj6pSygcPi+Eqn2
	1GJtAz/JPRrfI9JRcmrGftJfpq0WgXFr8DIztIRWCvNu/9AeMIB95LdW+zrr8BW48PbmV/dgeuW73
	OMF0xR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb2D-0000000BPrD-1i09;
	Fri, 02 Oct 2026 11:02:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb2C-0000000BPqi-0tgN;
	Fri, 02 Oct 2026 11:02:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE73841234;
	Fri,  2 Oct 2026 11:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0031F000FF;
	Fri,  2 Oct 2026 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938955;
	bh=hKu1k8kGP5SDfYzTUe6BEg1Rh9OEx1S7cLJzvwkIo8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fSA8KOPcMfD4nTuoQwZ65dnTEvIIcs8MuGlPn8Fs/+3fC7NLGpsaO+RpN1IgsIBZu
	 AUxBtepWGjjVI3M99anax4EK04p2VnA9VIFZGzrlLQlbKdH3xKIuLyNNV+nBS2gK+K
	 5MooxFs6WNfBX0ph/LCjwbFGsD5J8aN8q3nq6gL6dt66NTeVQTiBN3PJLVIx5KOpvx
	 kE87mNLRWpd4R0tmXsVbWwfvfFM0lYN5bAuwZWdHMhEK58ZB7SZ2YSx28z9+Nwg3HW
	 ESud0bA/Itaq1CPRhVc11wMDE18rRr2PF7dQo3epBifa0/5Uf6eMwX7MZUn8/gFQ9j
	 MDkdSwxtvaqxw==
Message-ID: <c39d7d50-e527-4a72-a89f-da4a9ac3cc97@kernel.org>
Date: Fri, 2 Oct 2026 13:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Nathan Chancellor <nathan@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <179093852073.149722.832232613857480812.b4-ty@kernel.org>
 <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 02/10/2026 à 12:58, Jason A. Donenfeld a écrit :
> On Fri, Oct 2, 2026 at 12:57 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
>>
>>
>> On Fri, 25 Sep 2026 22:46:32 +0100, Nathan Chancellor wrote:
>>> After a recent change in LLVM [1], builds with the random vDSO
>>> implementation, such as PowerPC and RISC-V, fail when checking the vDSO:
>>>
>>>    arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>>>    arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
>>>
>>> memset() is now generated when zeroing params->reserved for some builds
>>> because LLVM has an optimization (now run in more instances) that can
>>> recognize at compile time when it is assigning a static value to a
>>> contiguous area of memory and turn that into a call to memset(). Both
>>> clang and GCC assume memset() is always available [2].
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] random: vDSO: Avoid call to memset() when zeroing reserved in __cvdso_getrandom_data()
>>        (no commit info)
> 
> That's not for you to apply. I'm sending this through my random tree,
> along with a handful of other things I need to fix. But I wanted to
> let this cook a bit more. I can add your reviewed-by line, though.

Sorry I messed up with 'b4 ty', I do not intent to take this patch in my 
tree.

