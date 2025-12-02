Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B762CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2pzYRorisSisxlDJNer6ex+ZcnztGHqOYP9A9brMAE=; b=Bi2Sl9gABDcc+LPSnZRVuoYs+7
	ZCwnp9lQWtTN/4Mjel9gN1uy0d0jZV/sBC9bUvSCfE/im0W3D0V90NhoOkTHZL80Q7ZXggYRbBooN
	3J2UiXokX9+SZc0ZiHoOokvo67cZKXIQBrY7NJaEze/4QiMnqGJPML0bORXRrQPnxRwqYZzknEApJ
	BZ5LvYhfljbbu0IzVP9/RJVH8MtSFpmrdA3cP7QWdRuYI8c+evw6jqd8QHq1v3lXuh51TOOBUHLyG
	M4Eqg6BaA2J7hLkRONm5hmxz/pKCOKrdS4kvpK8Aebkmz98OorasUhEY+moWtlgUHmZMiFy3uwECe
	4ddUNM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMye-00000005B0T-2kq1;
	Tue, 02 Dec 2025 09:47:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMyd-00000005B0L-1HH8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B275F60178
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 09:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689F5C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764668838;
	bh=5ggDXftwdZr/kTsZyKDnWSz0DzTJCd6ukt2EAH5tghM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oOR3NCVkUTKcZLzCQnKS9AfOiHWKsuRHm7IMmfCXKfG8+HAIt56xeLD37GepkuFQ5
	 6nYritOMIXdmKMXvtCku0B/KGA7VLY9aAQxNItEfwrBfBVBoimql8LavhO5aKbcSLk
	 8nPny2D8HJ7tNMXkhS9WqUjcIw9zg95n4RXIew0tmJ7t9fN6l4tcV6eeNlAvmc1Mzx
	 vFvNVkVv6UtTGgBUuC/loXp/spc4ovFU5u916QiwkG15tQZMQq1RerMPFrCLInlUF4
	 jLf4r5ZccL0c/h6PHWlXc5Ga8D70hJ4V3Hq9kVmmODwewqH3H/k+80AWbjDpV46gpx
	 xRtJIGC5SF7Mw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5943b62c47dso111897e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:47:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkIfu11JP7KsaZjIpW7kn7GEKZomRKglGWFJDWzrJnJ8RYTx0gTzU3Yho0l6c3r5rgHqi0TyuQuz+enHArh0lI@lists.infradead.org
X-Gm-Message-State: AOJu0YwdLEwSzYY/7bxRNrcS/jEF8CXK/S4BtUD2knWQU7SCB3tseCXs
	5TrG0DYRlLE2ukx7CNcmpkDL9q18oSEfX6ssgFocBi80RIGGOww2pupvV4eK2nvW8YCrKEKEUWr
	5hwRIZHbVrjfH8mGFvCHzLj5TQyzAHvA=
X-Google-Smtp-Source: AGHT+IHt+dLC0PQ/Cdu+pC9RBnvFwH7KuKgNQh4NNTHSUTzn9hzUskV3Z4v5k5DuB6/FecC6kDqHzAlpDCFJyoBoYVU=
X-Received: by 2002:a05:6512:1154:b0:595:7876:7b78 with SMTP id
 2adb3069b0e04-596a3eac7edmr14275988e87.15.1764668836817; Tue, 02 Dec 2025
 01:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20251127105958.2427758-1-ryan.roberts@arm.com>
 <20251127105958.2427758-3-ryan.roberts@arm.com> <CAMj1kXFY1RXk8T4f46bkm_sr0nJfBoO+ii68JK4+CsRiDwKdCg@mail.gmail.com>
 <9097505d-b18b-4f85-a02c-7f2865ad8bca@arm.com> <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
 <aS6ylpLIyDZOvBDB@J2N7QTR9R3>
In-Reply-To: <aS6ylpLIyDZOvBDB@J2N7QTR9R3>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 2 Dec 2025 10:47:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG=HDVso1xc6TGgSrBpV3Sq2YQLdPKg2dw5z9qdrbdWBw@mail.gmail.com>
X-Gm-Features: AWmQ_blCgBuasVYCdeSRmkAklRBD9CiSjWrO_9R_rpE8NZAt2_O4xueJjWI6XLM
Message-ID: <CAMj1kXG=HDVso1xc6TGgSrBpV3Sq2YQLdPKg2dw5z9qdrbdWBw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across arches
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>, 
	Ard Biesheuvel <ardb+git@google.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jeremy Linton <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 2 Dec 2025 at 10:35, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Tue, Dec 02, 2025 at 10:15:22AM +0100, Ard Biesheuvel wrote:
> > On Mon, 1 Dec 2025 at 19:20, Ryan Roberts <ryan.roberts@arm.com> wrote:
> > > On 28/11/2025 11:01, Ard Biesheuvel wrote:
> > > > On Thu, 27 Nov 2025 at 12:00, Ryan Roberts <ryan.roberts@arm.com> wrote:
> > > >> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> > > >> index 089b1432f7e6..83c7e6710f6d 100644
> > > >> --- a/include/linux/randomize_kstack.h
> > > >> +++ b/include/linux/randomize_kstack.h
> > > >> @@ -6,6 +6,7 @@
> > > >>  #include <linux/kernel.h>
> > > >>  #include <linux/jump_label.h>
> > > >>  #include <linux/percpu-defs.h>
> > > >> +#include <linux/prandom.h>
> > > >>
> > > >>  DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> > > >>                          randomize_kstack_offset);
> > > >> @@ -45,9 +46,13 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> > > >>  #define KSTACK_OFFSET_MAX(x)   ((x) & 0b1111111100)
> > > >>  #endif
> > > >>
> > > >> +static __always_inline u32 get_update_kstack_offset(void)
> > > >> +{
> > > >> +       return prandom_u32_state(&current->kstack_rnd_state);
> > >
> > > I've got bot warnings because this is being called from noinstr code. I guess
> > > the best option is to just move add_random_kstack_offset() to after
> > > instrumentation is enabled for the affected arches.
> >
> > Just put instrumentation_begin()/instrumentation_end() around the call
> > to prandom_u32_state() - that seems to be the common approach for
> > punching holes into the 'noinstr' validation.
>
> That silences the warning, but isn't necessarily safe, so please DO NOT
> do that blindly.

Oops - sorry about that.

> The instrumentation_{begin,end}() annotations are only
> supposed to be used when we know by construction that instrumentation is
> safe.
>
> Generally, if you can move this to after instrumentation is already
> enabled, that should be safe, and so that'd be the better approach.
>
> Ryan, can you share those warnings (e.g. link to those reports)?
>
> IIUC only x86 has noinstr validation, and from a quick scan, I expect
> you see warnings from:
>
> * do_syscall_64()
> * do_int80_syscall_32()
> * __do_fast_syscall_32()
>
> For all of these, it is not safe to call instrumentable code before the
> calls to {syscall_,}enter_from_user_mode{,_prepare}(). You'll need to
> move the stack rnadomization after the existing instrumentation_begin()
> calls.
>
> We'll need to go check the other architectures similarly.
>

Given that prandom_u32_state() does a fairly straight-forward mangle
of 4 32-bit words, might it be better to make that __always_inline
itself?

