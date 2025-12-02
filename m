Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CA4CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27MyM9IB5rygtJFYo9KLrsDm5+HRwBR9TV9GXXBvrhc=; b=3jCkuG7XRESNQcAnV/QvAA6c8h
	by9PeJG5Z4+2ygUjQ9mXoPvU5vEUU+e7udmvbOKVplnfsjs0XiWUNsekQWAQxUKMKvBaWQHoPVgCp
	RIh9xgI3UoZ2aXJY1HheoOx+i4UhGavYY3JBR/K7NtVkf+ZMu4ejjiaNTWYhac9gOWNe3DZA0xauh
	A6Lf2shLSETN+jhiyQ3RmAVGSkfegswUphxCHE+YCbeqdGya54c2m1yyTY7tBh3TiQ8TVy53neDG2
	r/s+L4s2BXyIG+fFD509peX+y+drqfW0WTyncEmGfGFaEirDe88dQ5UAlf2ZHjVqkO+4Qp8uJkOlF
	r925OydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMnW-000000057ll-1tuZ;
	Tue, 02 Dec 2025 09:35:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMnU-000000057lH-094j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:35:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C4CB153B;
	Tue,  2 Dec 2025 01:35:40 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96273F59E;
	Tue,  2 Dec 2025 01:35:45 -0800 (PST)
Date: Tue, 2 Dec 2025 09:35:40 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb+git@google.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across
 arches
Message-ID: <aS6ylpLIyDZOvBDB@J2N7QTR9R3>
References: <20251127105958.2427758-1-ryan.roberts@arm.com>
 <20251127105958.2427758-3-ryan.roberts@arm.com>
 <CAMj1kXFY1RXk8T4f46bkm_sr0nJfBoO+ii68JK4+CsRiDwKdCg@mail.gmail.com>
 <9097505d-b18b-4f85-a02c-7f2865ad8bca@arm.com>
 <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_013548_123131_207F9F9B 
X-CRM114-Status: GOOD (  20.83  )
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

On Tue, Dec 02, 2025 at 10:15:22AM +0100, Ard Biesheuvel wrote:
> On Mon, 1 Dec 2025 at 19:20, Ryan Roberts <ryan.roberts@arm.com> wrote:
> > On 28/11/2025 11:01, Ard Biesheuvel wrote:
> > > On Thu, 27 Nov 2025 at 12:00, Ryan Roberts <ryan.roberts@arm.com> wrote:
> > >> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> > >> index 089b1432f7e6..83c7e6710f6d 100644
> > >> --- a/include/linux/randomize_kstack.h
> > >> +++ b/include/linux/randomize_kstack.h
> > >> @@ -6,6 +6,7 @@
> > >>  #include <linux/kernel.h>
> > >>  #include <linux/jump_label.h>
> > >>  #include <linux/percpu-defs.h>
> > >> +#include <linux/prandom.h>
> > >>
> > >>  DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> > >>                          randomize_kstack_offset);
> > >> @@ -45,9 +46,13 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> > >>  #define KSTACK_OFFSET_MAX(x)   ((x) & 0b1111111100)
> > >>  #endif
> > >>
> > >> +static __always_inline u32 get_update_kstack_offset(void)
> > >> +{
> > >> +       return prandom_u32_state(&current->kstack_rnd_state);
> >
> > I've got bot warnings because this is being called from noinstr code. I guess
> > the best option is to just move add_random_kstack_offset() to after
> > instrumentation is enabled for the affected arches.
> 
> Just put instrumentation_begin()/instrumentation_end() around the call
> to prandom_u32_state() - that seems to be the common approach for
> punching holes into the 'noinstr' validation.

That silences the warning, but isn't necessarily safe, so please DO NOT
do that blindly. The instrumentation_{begin,end}() annotations are only
supposed to be used when we know by construction that instrumentation is
safe.

Generally, if you can move this to after instrumentation is already
enabled, that should be safe, and so that'd be the better approach.

Ryan, can you share those warnings (e.g. link to those reports)?

IIUC only x86 has noinstr validation, and from a quick scan, I expect
you see warnings from:

* do_syscall_64()
* do_int80_syscall_32()
* __do_fast_syscall_32()

For all of these, it is not safe to call instrumentable code before the
calls to {syscall_,}enter_from_user_mode{,_prepare}(). You'll need to
move the stack rnadomization after the existing instrumentation_begin()
calls.

We'll need to go check the other architectures similarly.

Mark.

