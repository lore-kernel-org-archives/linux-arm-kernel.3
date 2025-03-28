Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2258C36005
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 03:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7C8z55+T8oYS2KV30NvrF9v2VMjdBS5RbEDCZuaYTo=; b=FvbJlKU1NYKiuub0w4anguPEls
	Kg/c2yo3WX/8IWPtbBSVS9y0aYkm2H03lCOusaV7j0fn2l0fglogJFUCjSdedYi3roRSoui9qRGID
	PD5O/nan93jkA28OlYVLvMdmK9KEyfO/iF+mVHIH+DnIUmEyWAckemBiP0ah94hXYWme5krpEuX9r
	zg1QaGREE/h67kLMwqRMXZ890tog58IP0WixAUhl5XJK3V/6at0AQ5oaT0X+wZAjWWGiByv3P6mZm
	mBbwYjPksaVJ25DGbfQ2xPtc/aNhGK4x1e/3NxQQUFzQadLjg4JZevs4vDl6ccwomR2vE3RHbt4OE
	xOtq6WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty0L3-0000000CUnx-3bgl;
	Fri, 28 Mar 2025 03:24:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty0J1-0000000CUcc-0jrL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 03:22:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3995ff6b066so885176f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 20:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743132169; x=1743736969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7C8z55+T8oYS2KV30NvrF9v2VMjdBS5RbEDCZuaYTo=;
        b=KbW60OHaUXNogOYj2tukO04VjE1C6cwr0eHI6nkz6fYfGcFU3g+6UmAccrA5w0hrsw
         Y3Jr64QnM096f0759toj1nG7fG7KlvuFLRvmepdTovAyjcxe1I1NzxXR4oXoxG4ecDhe
         RLVx9w+K960GXozSvjEN8/faAkAQPVKUgqAO2A3xcbB8qb6hHbK0EvBWEbuq/5G3AfDV
         r76otlv6c0iv1wuBg9jOgHUWqLjvyPVah1Vd+NmVhnLqMRbusvMMtsUFoCruSgC0gkWX
         T2j3RGZeIFYrrcmdOVg9kzzA32bJlVxpUm+jw1svBPG7/k7cAEYASneUrSgWPLkHX8ZP
         9ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743132169; x=1743736969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7C8z55+T8oYS2KV30NvrF9v2VMjdBS5RbEDCZuaYTo=;
        b=PLROiTC/frmzn+zT/teK+szJ+IEj8Tps/JPZRwI6NUM6efOf0E5sYb4ZbccLDMgQoS
         y0SYAKjjYLsfCdm87fLNagSbDTb8kNp3zmvaCf+6ZrPbARjbO21Mvai2X/StvPYnByAF
         HVCGFHmhilY0RLAlasEXQ1IB20LHB79afTYUe/FOxQ+0lXXhxYdXCjeesJUE3+CmkR+Y
         F87LCvl3BggSt26/cBxo+2yYPdCYvwduGGvfRNZgp9cWpFswqyq9dvt+lRWRgjOp+kSN
         VP/7QoiZuiOw7hwR1oOaoOnFyqLaDHFoS8g1InlzGufQTs2gzuOGe57a+pKVZs/h+5+K
         cRrw==
X-Forwarded-Encrypted: i=1; AJvYcCXn9j+cR5xf15bOw9vIbhupYQcZtV4Xf2fPkx0hyuos2mwTDtQGWYuGQ5EKfTOkB5EqulpOW7VbVO01k17E8nLB@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ1zV9uRSDTKuPjqS03Bxu/vMK9NYoLJTJ9DhAGwXC7/z1A8Q0
	df1ARfKrR59ojwAmcEm2T6mZIg5JPuc7qecEzhwT3NmgkNu3xI6AIn/zPB63WjnAyLR0fiVPCL/
	1Kd1Lq7bMzn/sm71WdXjNr4I4L44=
X-Gm-Gg: ASbGnct40q/f7uUyw2PA1yILExpjsb70I5RBMYkxrzw/UWFMlKgmgH/lxbSv/8At/mm
	GNlBlwhrISYb0np2cBGSoADbaJ4TMOgJHDuOG7KUeCb0H9YzvMcJSITA8yNHeITHarkHzsn3XkO
	mmcqeeTSYNil4q3Sot0FNopub7KSHg
X-Google-Smtp-Source: AGHT+IHVqJ00wvtvQwj5eSUkJyD/Qm8KBYe23yrQxTy9l1qjtGvOpEvI62C4RjCoDOOLaZM92/M93nihjWAGw7b+r8o=
X-Received: by 2002:a05:6000:40e0:b0:391:4189:d28d with SMTP id
 ffacd0b85a97d-39ad176dea8mr5129848f8f.34.1743132168612; Thu, 27 Mar 2025
 20:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250325015617.23455-1-pcc@google.com> <20250325015617.23455-3-pcc@google.com>
In-Reply-To: <20250325015617.23455-3-pcc@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 28 Mar 2025 04:22:37 +0100
X-Gm-Features: AQ5f1JrJXWzo2O7BIgaxbbGefH-hJc8YZYbR3ERisHcev8zGo0XarIRgt3wr42U
Message-ID: <CA+fCnZe+KzyBOBPsJonEhDV-5ZH57QPfTCREawXiwvpTcspNug@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kasan: Add strscpy() test to trigger tag fault on arm64
To: Peter Collingbourne <pcc@google.com>
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
X-CRM114-CacheID: sfid-20250327_202251_215877_BB0CA512 
X-CRM114-Status: GOOD (  26.29  )
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

On Tue, Mar 25, 2025 at 2:56=E2=80=AFAM Peter Collingbourne <pcc@google.com=
> wrote:
>
> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> When we invoke strscpy() with a maximum size of N bytes, it assumes
> that:
> - It can always read N bytes from the source.
> - It always write N bytes (zero-padded) to the destination.
>
> On aarch64 with Memory Tagging Extension enabled if we pass an N that is
> bigger then the source buffer, it triggers an MTE fault.
>
> Implement a KASAN KUnit test that triggers the issue with the current
> implementation of read_word_at_a_time() on aarch64 with MTE enabled.

I think the wording here is confusing, makes it sound like the issue
is not fixed.

> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Co-developed-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/If88e396b9e7c058c1a4b5a252=
274120e77b1898a
> ---
> v3:
> - simplify test case
>
> v2:
> - rebased
> - fixed test failure
>
>  mm/kasan/kasan_test_c.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
> index 59d673400085f..b69f66b7eda1d 100644
> --- a/mm/kasan/kasan_test_c.c
> +++ b/mm/kasan/kasan_test_c.c
> @@ -1570,6 +1570,7 @@ static void kasan_memcmp(struct kunit *test)
>  static void kasan_strings(struct kunit *test)
>  {
>         char *ptr;
> +       char *src;
>         size_t size =3D 24;
>
>         /*
> @@ -1581,6 +1582,18 @@ static void kasan_strings(struct kunit *test)
>         ptr =3D kmalloc(size, GFP_KERNEL | __GFP_ZERO);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>
> +       src =3D kmalloc(KASAN_GRANULE_SIZE, GFP_KERNEL | __GFP_ZERO);
> +       strscpy(src, "f0cacc1a0000000", KASAN_GRANULE_SIZE);
> +
> +       /*

Please also extend the comment here to say something like: "Make sure
that strscpy() does not trigger KASAN if it overreads into poisoned
memory".

> +        * The expected size does not include the terminator '\0'
> +        * so it is (KASAN_GRANULE_SIZE - 2) =3D=3D
> +        * KASAN_GRANULE_SIZE - ("initial removed character" + "\0").
> +        */
> +       KUNIT_EXPECT_EQ(test, KASAN_GRANULE_SIZE - 2,
> +                       strscpy(ptr, src + 1, KASAN_GRANULE_SIZE));
> +
> +       kfree(src);
>         kfree(ptr);
>
>         /*
> --
> 2.49.0.395.g12beb8f557-goog
>

The code looks much better!

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

