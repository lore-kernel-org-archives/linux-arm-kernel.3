Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CC0E63F1C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ3rRaBtgDo34CiHTAoGJ75xyh2mchJExm9ydDgm07U=; b=eDus4HZ6qJaigOpD23qfrTohPE
	zYONNa/n0KsBn20gpmJsjoryFG1CfDKhNP1FckTtnxlvzY4rKpxGfDNFSSVcZJxxRhh+Gi/4WOWYK
	NaP8hW84kZhiwXe4r0nvkLR40L8WmmNZfhglySaz0NPve8izVj+mjmYh0H9VHn32MZvbv3DNBQQP3
	uf9DurQUnHVkSrWHcv6X1ZYC9Qjlk9rYW1M5qpaQ1GwGt7A/fHkOkcPP5IBmpUqoV3uTCv6kP9PBq
	YQSqzDG44GtlI91hQpvrcAzS1Wlg+B1Z0lMYe21hnjnkR8g/1awMV7vquGuHZ4R4GO8ZfvIUePDZI
	K41HVp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkqS-00000005izF-3Sf5;
	Sun, 15 Feb 2026 22:44:04 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkqP-00000005iyt-2gY9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:44:03 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1270adc5121so3414800c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 14:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771195440; cv=none;
        d=google.com; s=arc-20240605;
        b=O6Nrk1oxXqSbYwI4aHRJ6mNtFJJhAPiXjH26aIUpJo/HptPiFO9j3PVwhoEjClydyd
         qBRMbwnSPKX344BDDd2pgeShX4jEpF/o4P7ObwOm84OCtoWDM+zTOz05vBithVVg7vZZ
         LoEs8r+MP2nTpHKz7RSv9RqG+jj1agzPN0/wr3xInYDTfqTcRg3A8fyrYaMMXKm+V0u/
         rh6WwvembZLgJXhoSzD3Sk5nXmLWVCaWkkROA6dkfH+WBc4rqhmanvHg7ejbiqDwvaSd
         54UaM5k/DZe1xxNQAU2bcSPkboHtHYnLZi6K2yn9Wc9NAYOhcwG0QyxaCi+L+7SyJOqi
         DjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DQ3rRaBtgDo34CiHTAoGJ75xyh2mchJExm9ydDgm07U=;
        fh=O4GXqw2izqf//6aj78j3G4XPWg0C71fOrhrzV4CBOaE=;
        b=XU88KCpWwUoN2PBj9Yyx6WUCnswZ5pWuoF3sOcu0vG+CZlLtWJCc8amHe4hiTX5Loo
         t1hj1TPaHAr/TfcFDBuyIjhBZ1EhH0AY7yt3X1IcQBBGWos/jWqVwaplIO7afRFmlFuZ
         OnGWR0xS6eMX8DjI76cPXMxaikKBGFP7hNYGG25/wNc/TH8wV/raTF/9GuwsJh0Iev6O
         uvEXn877Pi6QoJ/dIDgj+RtV4nUJNTSs4tKfMtvcUYMm9lq4jSIH0HkkJ8dpoDjl6sFa
         sZM7z/iprXuu6YzJ2t/LQhNj1ejhp51fHlpaGHdaIVjeLZFlLGS9Y1/qaN+5QsElrixo
         sraA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771195440; x=1771800240; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ3rRaBtgDo34CiHTAoGJ75xyh2mchJExm9ydDgm07U=;
        b=2sznmowKV805Gh23AH4g+tLtH0J0ChAT0/adGwCYj1ooVVqp9PfZ7bjPVzNeUnBvOn
         sGbhSja/E07nQY1XblFdFsuumwVORNQPI/LC+5ERXv1A2/6cZK1A6gXPDakgMgnifI2G
         GKOvFEm3Qea/lKzbWOaKtaZEBCJ4DN0EgTr5oqPmJCGbI5mdGZx0/x2PLVHVKgXBP8+A
         aaw1yqhJSwykKVj/HCYrxYxTylPI3HmlisxIz5bAgUBkqrzRVIHOleFNWsWNldfdRGHZ
         H58X1074ZzC0ew9IIQnT6Zu7zIU1kiLh9eVuPIezy81pHZuIRepnaZbHl88UMEiz1RWs
         DbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771195440; x=1771800240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ3rRaBtgDo34CiHTAoGJ75xyh2mchJExm9ydDgm07U=;
        b=JaYU6zxaBGN+8ykj17360qhKaP8XI3zqcauDOzGissOs6vLBh/d46NhYC9KEKDvRRt
         RqRYSa0LsOAveWS3525aikoMyRs7gahBPuAWQFCkiRNCJGiodtIFFLlbzMdvuyKys62z
         2dwCsc8joLyDdTi0fnqU6Gjvo/+Ta0MDMDbajULt7ajgWItlbfeHllE1IYL8Nf+zK1Of
         1vx3x7kzjmniOEwGpMy/bAjDzMJ1JaLNu0RncYYzlqEzi2ctbwUhBp/gX9dHPYU3Hon8
         239MnMvkLK3aUc26s9oEhnOxcnmTeW/u4VTL2FSORVmf1iERqQnadUUsdqKDyUyPwleW
         o7PA==
X-Forwarded-Encrypted: i=1; AJvYcCU/YT2jKMWYWgedH3HBLJD1WUM60SV5rzYWwXQxuYymX34EaM2AddVwj/HxbUhhgJPt5QTgc+rjuRdVH53TM9Zg@lists.infradead.org
X-Gm-Message-State: AOJu0YyqFLmpJ/HKWZdWvFcdXSfAI7iymnMUr4cWeden7YkJsi0pfPTF
	4QT8lcD8+0O2QPInqLIyjXj6DXwdCJE1vsWQcNY9fNWNfTP6++teKkREQbqOQFoQ/27v7jm0QP+
	L8+HbnURcrUzk44U+LpI1NmMj800z8SNIXg0pzSFM
X-Gm-Gg: AZuq6aJ6YI9pwTj1fO+WpPToEpqRGyUpybDTFzgdylAqlDsYbWGpGkm9b/Vzx9eneAJ
	5GO4M8wezp6Z0gzbHDEzfUYG9nCmFUzQEmcqRt5kfAl8LDLhfQ5lCl9rt3WgSTcCKLwgKsv0pPU
	TDKO879Q2wW6hwXdhFRzYEAAhuYEOqMGu+WW/1obPUhQXRxOK/WeMGjPjBNF6kkUU2ftNMBKaWY
	4DAzhr+NwMB2MYgFhfEuUC6wKvEev41PkhaDSU3IUyCi0ghX5HIJoXEs1jzIwqbUicVFct0NTD+
	pbg65XEDqSA/7mAWD1wZBWLLWIwCnK4+cNkI1Ek=
X-Received: by 2002:a05:7022:a91:b0:119:e56b:98ba with SMTP id
 a92af1059eb24-1273ae7fc16mr4205375c88.33.1771195439998; Sun, 15 Feb 2026
 14:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin>
In-Reply-To: <20260215221656.68b2fc1d@pumpkin>
From: Marco Elver <elver@google.com>
Date: Sun, 15 Feb 2026 23:43:23 +0100
X-Gm-Features: AaiRm50d6YTpHKKBiQ4mtNRHtPJdcnhrxF0-oPOmS5yiyJGTDd92Ajz2-UQXuHY
Message-ID: <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_144401_759980_33CF9E0F 
X-CRM114-Status: GOOD (  56.72  )
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

On Sun, 15 Feb 2026 at 23:16, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Sun, 15 Feb 2026 22:55:44 +0100
> Marco Elver <elver@google.com> wrote:
>
> > On Fri, 6 Feb 2026 at 19:26, David Laight <david.laight.linux@gmail.com> wrote:
> > > On Fri, 6 Feb 2026 16:09:35 +0100
> > > Marco Elver <elver@google.com> wrote:
> > >
> > > >  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
> > > > >
> > > > > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> > > > > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > > > > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > > > > [...]
> > > > > > > > > > What does GCC do with this? :/
> > > > > > > > >
> > > > > > > > > GCC currently doesn't see it, LTO is clang only.
> > > > > > > >
> > > > > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > > > > chains, so I really want to maintain the option to enable this path for
> > > > > > > > GCC in case we run into problems caused by other optimisations in future.
> > > > > > >
> > > > > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > > > > does not drop qualifiers:
> > > > > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > > > > >
> > > > > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > > > > __typeof_unqual__.
> > > > > > >
> > > > > > > I really don't see another way forward; there's no other good way to
> > > > > > > solve this issue. I would advise against pessimizing new compilers and
> > > > > > > features because maybe one day we might still want to enable this
> > > > > > > version of READ_ONCE() for GCC 8-10.
> > > > > > >
> > > > > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > > > > years ago!
> > > > > >
> > > > > > There is, from this thread:
> > > > > >
> > > > > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > > > > >
> > > > > > another trick to strip qualifiers:
> > > > > >
> > > > > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > > > >
> > > > > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > > > > raise the minimum from 8 to 8.4 (IMO).
> > > >
> > > > That looks like an interesting option.
> > > >
> > > > > That sounds reasonable to me but I'm not usually the one to push back
> > > > > on raising the minimum compiler version!
> > > > >
> > > > > > But yes; in general I think it is fine to have 'old' compilers generate
> > > > > > suboptimal code.
> > > > >
> > > > > I'm absolutely fine with the codegen being terrible for ancient
> > > > > toolchains as long as it's correct.
> > > >
> > > > From that discussion a month ago and this one, it seems we need
> > > > something to fix __unqual_scalar_typeof().
> > > >
> > > > What's the way forward?
> > > >
> > > > 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> > > > for old compilers with the better unqual_non_array hack?
> > > >
> > > > 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> > > > __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> > > > issues for new compilers. Doesn't fix not dropping 'const' for old
> > > > compilers for non-scalar types, and requires localized workarounds
> > > > (like this patch here).
> > > >
> > > > Either way we need a fix for this arm64 LTO version to fix the
> > > > context-analysis "see through" the inline asm (how this patch series
> > > > started).
> > > >
> > > > Option #1 needs a lot more due-diligence and testing that it all works
> > > > for all compilers and configs (opening Pandora's Box :-)). For option
> > > > #2 we just need these patches here to at least fix the acute issue
> > > > with this arm64 LTO version.
> > >
> > > Option 3.
> > >
> > > Look are where/why they are used and change the code to do it differently.
> > > Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
> > > (I posted a patch that nuked that one not long ago - used sizeof instead.)
> > >
> > > The one in minmax_array (in minmax.h) is particularly pointless.
> > > The value 'suffers' integer promotion as soon as it is used, nothing
> > > wrong with 'auto _x = x + 0' there.
> > > That will work elsewhere.
> >
> > Agreed that getting rid of __unqual_scalar_typeof() in favor of 'auto'
> > where possible is the way to go.
> >
> > Unfortunately I spent the last week occasionally glancing at this
> > arm64 READ_ONCE problem, and could not come up with something that
> > avoids using typeof_unqual() or __unqual_scalar_typeof(). I'm inclined
> > to go with the unqual_non_array hack, but not make this available as a
> > macro for general use - we have too many of these horrid macros, don't
> > want to add more to this hack pile.
>
> Agreed, having to do such things inside what are already horrid 'functions'
> is one thing, but when they get used in 'normal' code it is silly.
>
> Have you checked whether sizes other than 1, 2, 4 and 8 are ever used?
> There aren't any in an x86-64 allmodconfig build and it used to be an error.
> Even if there are handful, having to use a different define wouldn't
> really be an issue.
> Removing that support would make READ_ONCE() easier to write/understand
> and (hopefully) compile faster - there is a measurable cost for the
> 'size check' in the x86-64 build, the arm LTO expansion must be significant.

I found e.g. xen_get_runstate_snapshot_cpu_delta() uses the >8 byte
case via __READ_ONCE(). READ_ONCE() itself is already restricted to <=
8 bytes (due to that static assert), but that itself uses the
__READ_ONCE() helper which these patches were touching.

We could invert the game: have READ_ONCE() which just deals with <= 8
bytes. And __READ_ONCE() which uses READ_ONCE() if <= 8 bytes, and the
non-atomic case if >8 bytes. However, I fear the static size check
won't go away because the asm-generic version of __READ_ONCE() happily
works on any type (it's just a volatile cast+deref) - I don't know how
we'd enforce the size limit otherwise.

