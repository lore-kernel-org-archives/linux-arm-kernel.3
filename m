Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD52C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 02:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5O8FFjA3hcgQ8XDHydtzreoc5IOsI1FD+LSzQZJbGkI=; b=cX8/3JscnGOTuFEnXpzLsyYo+T
	pV2QlPS2Rq58bsYkMup8HxI1CY7usauR3BQYOvWmMYdOLLi+4H8Fe8T6HtRBaE//1Zw7v3aORguSx
	505gMO2Ckr01Kg1rrzphsTvadNTGqRCsR3RzZa66w33c5VhFHhcbn2fr5Oi+kwUnpKcdQDG3PYwiB
	gI+OIT4As+fZa7AZ3fKzV3DggZRcU5mW/pu3OcczZj36561JHyEF1S9/Ugu7ueTICZjApuLBecww0
	Pe/Sk8cbKZMMX8MIAGpmE2PugojEbkzpxAQiCZ7OP1xdwPGxpNmcWcdE7UB8A0rS8Nb1diJHFpCQU
	biN6pp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvSMU-0000000DiDg-2ZX6;
	Fri, 21 Mar 2025 02:43:54 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvSKk-0000000Di3D-08dv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 02:42:09 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so5434a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 19:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742524923; x=1743129723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O8FFjA3hcgQ8XDHydtzreoc5IOsI1FD+LSzQZJbGkI=;
        b=pHnxm55TTbDyqiI8Wpr2AzhkeO8oK5nq6TF42z1pXqUeFqZ7AIlL7vM0CkvnM+U4wK
         H+yoQGAhFAeXX4jGRVK4PWC14XWRTY+nEyH6hqXY/gsyargQj+3xeCvKZveUFGrw+8y3
         iDBtBaBjQXLch8eV11iuAsmWA30Aba3jRYQQbhO9+tf95/M8rQoLBlWEF5KxatYxOadp
         sX0oRQ/vGFF/0xvRZ1iglFUU/ZUo7chet3swb9fIBZQVxg015p0E6jU7Pe36EMjR7sTW
         3pajTsOuHMIE92UNVShxZ3lCy66T2q+W+DAlwzCGEqZ4Y9VQTQRLasaJTtLqvzdHchEI
         cN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742524923; x=1743129723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O8FFjA3hcgQ8XDHydtzreoc5IOsI1FD+LSzQZJbGkI=;
        b=j4sYknxDgDEQpTsEzbpw6fuz2O+4ylIGVXxLQ/PT5MkVrdnRTedrHUJiT1LyQj9346
         ctjwSJzNBreCkTdzLfYtGw/EuKhcB/UiYUuUZpkKDt8FZrles6UNHExYACn3xHC6PTjE
         QT4s3YWhC+alkCJhpJSK9JJ9e11gpikIE47dyDY1xyQitfemriYp7MYsJlC1iR46fCYG
         YtdyXtJIKj77eLvGK4Ud6nPzmdPjTQUms9H3B/RmRQ+xgaOTVU4fUsdLJSjnN80qnkB0
         vJDQpy9JQwIcK3QZNPLSaJ3kBLESHt2aPETuaqjT6iy0E9VcbA6FFoS87q/yyrwjwH/n
         Xh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6STj7Xb8BA5+JJQJWlk7qHy7hnjBp3xqVndUE2AoR+8Yx5/PP8KM0nwPv+i914eulm3Zw91CyePN53aYzpLrY@lists.infradead.org
X-Gm-Message-State: AOJu0YwkNrXbNLxg+4zCg9LIRBp0CJmzOGucsjSKKlcIsD+3Ld9PbyPf
	ZeSESJIt26X7JFVgqhQR/YDl43nBecCxRPFHEbUy6DxCxz0mmA1yihWHAXoPBx3flf5dw5ivtjN
	EjX4dRgW6R7DL4qsc6+2qXCHwhw6Z6b2cAe7J
X-Gm-Gg: ASbGncuZOpFfrqSrS7njhtJH5glx/mdSjYlYKcQ7zrHLa/TEsv/FR7dqL2FanjXA3cJ
	r5ZOq6QlEzt6DhP9s1hDAwh9zoZ6LonAhVbFI2lx5pffu0VsRU+3B6GdXqFzZYPtWlmIu87qtXw
	L+HpRUbG+XphnaRkZG1rtNX3nQPoScSkF5FP+G/Jzh9L2vUjlZZbm8OPk=
X-Google-Smtp-Source: AGHT+IHOXKmMdZDx/zHgype/m05qi/GswNz7l+pOv7uCTCxdggJGQMw2FvJ3qLXemOkS/xcOSlApQYGzrEpAGMI2DMk=
X-Received: by 2002:a50:d607:0:b0:5e5:be08:c07d with SMTP id
 4fb4d7f45d1cf-5ebcfee3421mr30310a12.7.1742524923099; Thu, 20 Mar 2025
 19:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250318214035.481950-1-pcc@google.com> <20250318214035.481950-3-pcc@google.com>
 <CA+fCnZfG79JmGG9rj7KbE=9yX-EM4e8CXDSm5F9=YEmgyX5v3w@mail.gmail.com>
In-Reply-To: <CA+fCnZfG79JmGG9rj7KbE=9yX-EM4e8CXDSm5F9=YEmgyX5v3w@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Thu, 20 Mar 2025 19:41:50 -0700
X-Gm-Features: AQ5f1Jr2sdg2WCeju5nnmXrNh9jqK16Q_xv8y9FFZD-yPNesP3YY2srT1TECdII
Message-ID: <CAMn1gO4k-d+8ZwndJhF5Sudr+kWDABe+3Wq=iBhcg3tDwJ60Bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kasan: Add strscpy() test to trigger tag fault on arm64
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_194206_075856_A6A0A1F6 
X-CRM114-Status: GOOD (  32.36  )
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

On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail=
.com> wrote:
>
> On Tue, Mar 18, 2025 at 10:41=E2=80=AFPM Peter Collingbourne <pcc@google.=
com> wrote:
> >
> > From: Vincenzo Frascino <vincenzo.frascino@arm.com>
> >
> > When we invoke strscpy() with a maximum size of N bytes, it assumes
> > that:
> > - It can always read N bytes from the source.
> > - It always write N bytes (zero-padded) to the destination.
> >
> > On aarch64 with Memory Tagging Extension enabled if we pass an N that i=
s
> > bigger then the source buffer, it triggers an MTE fault.
> >
> > Implement a KASAN KUnit test that triggers the issue with the current
> > implementation of read_word_at_a_time() on aarch64 with MTE enabled.
> >
> > Cc: Will Deacon <will@kernel.org>
> > Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Co-developed-by: Peter Collingbourne <pcc@google.com>
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > Link: https://linux-review.googlesource.com/id/If88e396b9e7c058c1a4b5a2=
52274120e77b1898a
> > ---
> > v2:
> > - rebased
> > - fixed test failure
> >
> >  mm/kasan/kasan_test_c.c | 31 ++++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
> > index 59d673400085f..c4bb3ee497b54 100644
> > --- a/mm/kasan/kasan_test_c.c
> > +++ b/mm/kasan/kasan_test_c.c
> > @@ -1570,7 +1570,9 @@ static void kasan_memcmp(struct kunit *test)
> >  static void kasan_strings(struct kunit *test)
> >  {
> >         char *ptr;
> > -       size_t size =3D 24;
> > +       char *src, *src2;
> > +       u8 tag;
> > +       size_t size =3D 2 * KASAN_GRANULE_SIZE;
> >
> >         /*
> >          * str* functions are not instrumented with CONFIG_AMD_MEM_ENCR=
YPT.
> > @@ -1581,6 +1583,33 @@ static void kasan_strings(struct kunit *test)
> >         ptr =3D kmalloc(size, GFP_KERNEL | __GFP_ZERO);
> >         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
> >
> > +       src =3D kmalloc(size, GFP_KERNEL | __GFP_ZERO);
> > +       strscpy(src, "f0cacc1a00000000f0cacc1a00000000", size);
> > +
> > +       tag =3D get_tag(src);
> > +
> > +       src2 =3D src + KASAN_GRANULE_SIZE;
> > +
> > +       /*
> > +        * Shorten string and poison the granule after it so that the u=
naligned
> > +        * read in strscpy() triggers a tag mismatch.
> > +        */
> > +       src[KASAN_GRANULE_SIZE - 1] =3D '\0';
> > +       kasan_poison(src2, KASAN_GRANULE_SIZE, tag + 1, false);
> > +
> > +       /*
> > +        * The expected size does not include the terminator '\0'
> > +        * so it is (KASAN_GRANULE_SIZE - 2) =3D=3D
> > +        * KASAN_GRANULE_SIZE - ("initial removed character" + "\0").
> > +        */
> > +       KUNIT_EXPECT_EQ(test, KASAN_GRANULE_SIZE - 2,
> > +                       strscpy(ptr, src + 1, size));
> > +
> > +       /* Undo operations above. */
> > +       src[KASAN_GRANULE_SIZE - 1] =3D '0';
> > +       kasan_poison(src2, KASAN_GRANULE_SIZE, tag, false);
> > +
> > +       kfree(src);
>
> I have trouble understanding what this code is doing...
>
> So the goal is to call strcpy with such an address, that the first 8
> bytes (partially) cover 2 granules, one accessible and the other is
> not?

The first 16 bytes, but yes.

> If so, can we not do something like:
>
> src =3D kmalloc(KASAN_GRANULE_SIZE, GFP_KERNEL | __GFP_ZERO);
> strscpy(src, "aabbcceeddeeffg\0", size);
> strscpy(ptr, src + KASAN_GRANULE_SIZE - 2, sizeof(unsigned long));

Yes, something like that should work as well. Let me send a v3.

Peter

> Otherwise, this code needs more explanatory comments and it's probably
> better to move it out to a helper function.
>
> >         kfree(ptr);
> >
> >         /*
> > --
> > 2.49.0.395.g12beb8f557-goog
> >

