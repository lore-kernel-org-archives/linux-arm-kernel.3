Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB15AC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUrWyqVmnKFt3e8RhkrZ2j3Y0i3O/ft05oQJMh6wlj4=; b=4KRzx6ZtMWe/JtmGw+A0N6zARe
	ISDBzrvyLE0NMfdhWuqM8hZUp9XqbApWCYXu5eRLiPQ2UsiZEYHio6l3X383bCejtjFg8fBuQanDh
	XHgD+BbKdGFXh/DoO8yIusr3zGgFafZTzVclHnT2K8wjioCCT9VnAsTF57kMSnx4MrHP519dnHG6P
	w2+90IvwHWaRPCNeKmjH243OmogBE6PZDgDVdu7yfyJAlYV3jJOTCZ6hYu9nDRA+kF8JDR7KjDc1B
	6KrIAQetVCuxZZkDrifxaYCrO4JiRb+p+k7lnA+T74Z7WJpRZzn7Oew9W3y3IGqz0jxdw9nWCqBC4
	sH+b+CiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARgU-0000000FOe6-1eu7;
	Sat, 26 Sep 2026 12:39:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARgS-0000000FOdv-3uny;
	Sat, 26 Sep 2026 12:39:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2188E44079;
	Sat, 26 Sep 2026 12:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CFA1F000FF;
	Sat, 26 Sep 2026 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426355;
	bh=xUrWyqVmnKFt3e8RhkrZ2j3Y0i3O/ft05oQJMh6wlj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mqO5QHmRcMSYwDEgOPDLIZcr6jr2YfLZFqWA7XF/GlNNvRhVaLD2MqTlse+KUluEL
	 xzQtAcTaB0AUUAyhyXub2Dl1sDoMhQBVGpEqYPhOFnxMIeHAfILAjiNHt5KASH4zgE
	 9rM1gY9zZsC843JVDcJ/evpaUDkxxUnTOWMufD7S2+kem/c2g2lrgfyGSMRjpNUarx
	 z5QFeWBKFuAmXjti4J2zAENqDWuza+nvxNd9M8lkcQxgEaFZWFlweuEwmQoJ24uygc
	 ZwThu0B4gX8MvLQqagGgOMSxUH5JZWmq/Uwr7kjbGCVNI+MI7sGEzKwfcBn23nv76b
	 a+d3+QTbcxiZg==
Date: Sat, 26 Sep 2026 13:39:06 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260926123906.GB1486962@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com>
 <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
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

On Sat, Sep 26, 2026 at 12:55:34PM +0200, Christophe Leroy (CS GROUP) wrote:
> Le 26/09/2026 à 12:02, Jason A. Donenfeld a écrit :
> > Apparently not on RISCV, which is what prompted this patch in the first
> > place. So I suspect Nathan's v2 here is the way to go.
> 
> 
> Don't you have -fno-builtin on RISCV like we have on powerpc ?
> 
> Or is it clang that is missing this option ?

Yes, clang has -fno-builtin but as I mention in the commit message, that
may not always stop the compiler from generating calls to memset(),
which it is allowed to do even with -ffreestanding (which implies
-fno-builtin) per GCC's documentation. -fno-builtin with GCC < 14 just
happens to avoid generating memset() for memset_inline() in all of my
tests, hence why I went with this approach as suggested by Jason.

-- 
Cheers,
Nathan

