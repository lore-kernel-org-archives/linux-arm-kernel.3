Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B8CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMiALHE9ZtMDlRYnEWbPjR9QkB1WaBzQow07VG3sqRA=; b=KVFtVAhoXu/eiduVCnNJIo/C8d
	q2vhlxfE4fUYs6BbTMwR+f3TiG977GTw0ANCTzriDCLKjAPMMDoWYqroZQQefh+WVYo8KwCjOVWa8
	FtnCrfSViGr7PS+blodlDTbrS3bWxWws57GHQGajPOPhVWbV7ofsCbJkA9HI2AnnkGOcuQUw1o5yk
	FIhQf27TSDSeon/TYTDUQDzW2wTpfU7LqbzHE3DAwwC7cMZKIOSUpsW9+bjeoBL6PNdgQHEyUFj01
	ENpQYW10LhbLrUVLOt7KbiCXHvFXDHhasbhMy3typMPTw0QQj319tSNkc6uH8atDE7+m3N5uoSU6b
	Ajx950nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hb8-00000008Wwv-1uTy;
	Thu, 03 Apr 2025 10:14:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H9y-00000008Rmf-06aJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 09:46:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69CCA68424;
	Thu,  3 Apr 2025 09:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC1FC4CEE8;
	Thu,  3 Apr 2025 09:46:50 +0000 (UTC)
Date: Thu, 3 Apr 2025 10:46:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] string: Add load_unaligned_zeropad() code path to
 sized_strscpy()
Message-ID: <Z-5ZCP5qw2Lcs9pA@arm.com>
References: <20250329000338.1031289-1-pcc@google.com>
 <20250329000338.1031289-2-pcc@google.com>
 <Z-2ZwThH-7rkQW86@arm.com>
 <CAMn1gO55tC78BpD+KuFgygg1Of57pr16O4BvKsUsrpo830-jEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMn1gO55tC78BpD+KuFgygg1Of57pr16O4BvKsUsrpo830-jEw@mail.gmail.com>
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

On Wed, Apr 02, 2025 at 05:08:51PM -0700, Peter Collingbourne wrote:
> On Wed, Apr 2, 2025 at 1:10 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Fri, Mar 28, 2025 at 05:03:36PM -0700, Peter Collingbourne wrote:
> > > diff --git a/lib/string.c b/lib/string.c
> > > index eb4486ed40d25..b632c71df1a50 100644
> > > --- a/lib/string.c
> > > +++ b/lib/string.c
> > > @@ -119,6 +119,7 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
> > >       if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
> > >               return -E2BIG;
> > >
> > > +#ifndef CONFIG_DCACHE_WORD_ACCESS
> > >  #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> > >       /*
> > >        * If src is unaligned, don't cross a page boundary,
> > > @@ -133,12 +134,14 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
> > >       /* If src or dest is unaligned, don't do word-at-a-time. */
> > >       if (((long) dest | (long) src) & (sizeof(long) - 1))
> > >               max = 0;
> > > +#endif
> > >  #endif
> > >
> > >       /*
> > > -      * read_word_at_a_time() below may read uninitialized bytes after the
> > > -      * trailing zero and use them in comparisons. Disable this optimization
> > > -      * under KMSAN to prevent false positive reports.
> > > +      * load_unaligned_zeropad() or read_word_at_a_time() below may read
> > > +      * uninitialized bytes after the trailing zero and use them in
> > > +      * comparisons. Disable this optimization under KMSAN to prevent
> > > +      * false positive reports.
> > >        */
> > >       if (IS_ENABLED(CONFIG_KMSAN))
> > >               max = 0;
> > > @@ -146,7 +149,11 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
> > >       while (max >= sizeof(unsigned long)) {
> > >               unsigned long c, data;
> > >
> > > +#ifdef CONFIG_DCACHE_WORD_ACCESS
> > > +             c = load_unaligned_zeropad(src+res);
> > > +#else
> > >               c = read_word_at_a_time(src+res);
> > > +#endif
> > >               if (has_zero(c, &data, &constants)) {
> > >                       data = prep_zero_mask(c, data, &constants);
> > >                       data = create_zero_mask(data);
> >
> > Kees mentioned the scenario where this crosses the page boundary and we
> > pad the source with zeros. It's probably fine but there are 70+ cases
> > where the strscpy() return value is checked, I only looked at a couple.
> 
> The return value is the same with/without the patch, it's the number
> of bytes copied before the null terminator (i.e. not including the
> extra nulls now written).

I was thinking of the -E2BIG return but you are right, the patch
wouldn't change this. If, for example, you read 8 bytes across a page
boundary and it faults, load_unaligned_zeropad() returns fewer
characters copied, implying the source was null-terminated.
read_word_at_a_time(), OTOH, panics in the next
byte-at-a-time loop. But it wouldn't return -E2BIG either, so it doesn't
matter for the caller.

> > Could we at least preserve the behaviour with regards to page boundaries
> > and keep the existing 'max' limiting logic? If I read the code
> > correctly, a fall back to reading one byte at a time from an unmapped
> > page would panic. We also get this behaviour if src[0] is reading from
> > an invalid address, though for arm64 the panic would be in
> > ex_handler_load_unaligned_zeropad() when count >= 8.
> 
> So do you think that the code should continue to panic if the source
> string is unterminated because of a page boundary? I don't have a
> strong opinion but maybe that's something that we should only do if
> some error checking option is turned on?

It's mostly about keeping the current behaviour w.r.t. page boundaries.
Not a strong opinion either. The change would be to not read across page
boundaries.

> > Reading across tag granule (but not across page boundary) and causing a
> > tag check fault would result in padding but we can live with this and
> > only architectures that do MTE-style tag checking would get the new
> > behaviour.
> 
> By "padding" do you mean the extra (up to sizeof(unsigned long)) nulls
> now written to the destination?

No, I meant the padding of the source when a fault occurs. The write to
the destination would only be a single '\0' byte. It's the destination
safe termination vs. panic above.

> > What I haven't checked is whether a tag check fault in
> > ex_handler_load_unaligned_zeropad() would confuse the KASAN logic for
> > MTE (it would be a second tag check fault while processing the first).
> > At a quick look, it seems ok but it might be worth checking.
> 
> Yes, that works, and I added a test case for that in v5. The stack
> trace looks like this:

Thanks for checking.

-- 
Catalin

