Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54E3C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srr0VBZQwN4yXqvwN4Xth0EZBYASL+7tLcIViL1r650=; b=TTJdNzXnCogNmArPiaJOhdj2jX
	NihfkfByRYXoI4758KpUivveaZO1ZLQjcqNkVrb56W3nk+cqjyFqUds3MH4IygXjDPZdyNv4pOb97
	8okCYkqd483pRJ730TXzZPlBD/2ZCVp4jgUzLIU8HLsYvJlplVykNWvepE7iSU6IPXmD+GGty3XT3
	ZHzNz+rXkomhlrs1bG8ZXfDbKtJP9JRG/5fl5Z36ac/Jqhgc02QPnJKZhhL+6rN8v+r/Avs+HCMWb
	J4fbnHPotVnkMm2d2+YhQ0IAhwEQLkLRqesMPMyXjG2VTwhN668ii3qTGwpEHhoczCUCnyz+QjsII
	QFDREJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJhz-0000000Cnx2-2BY3;
	Thu, 20 Mar 2025 17:29:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJdu-0000000CnMh-01Ar
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:25:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-391342fc0b5so933134f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742491516; x=1743096316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Srr0VBZQwN4yXqvwN4Xth0EZBYASL+7tLcIViL1r650=;
        b=NfXunj4BU95+6lTpoLKV3Z3DKWJqCH0ywB3FkVdR9SmzWQ5QK1ohrPrs96+6s9jAqm
         WLDFd46pzohcBtlecz3ybA3UNsQUJQHohjPxe7QOZi7KIIySIntiYvbS9yNUxyooDDk1
         LelhPk778tlCwTPHrC7wewMQfwVD6Ll+m5NRsMj/dLgTrQz6B7FJBIoqiRNE94u6ccBv
         7wXjVHfQSPEzqXusod0mI271veSz9RFgT7r9ExuAMG8i5Dvk7U22EPLXU+LMU60x+yFA
         3vqAYkUg6kU49nexJmLOm3F6ktsOBwAbdMK5ecmOQd+iOASduIQIz2GS7XgGCayS0XDn
         iv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491516; x=1743096316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Srr0VBZQwN4yXqvwN4Xth0EZBYASL+7tLcIViL1r650=;
        b=RFkwAZFwYgJUm5nrS8Hzk4vwDPZjZlHJ4A2gsJK3oFVfAhZKtxmz25a/waC2deS8K2
         4NOk7NxpHBPIHg1cTgBm6kDisXs34RagTPXSY1itVASBd02UFepH6HVq+6Jiq2/a05LP
         z8ShYHc11zVBV+8PpzBeWnSJ2hyOMjD8qXNBc112UkWEjCXLzBzcsJu88P1T4OFp3i8u
         aGzf7AYxv8oQH/LbUPTjQ3iKxkmI8zXuRFMz5xha1s0xL/o8ducVH3yo9S1Avhuozxxh
         UufZnXPsMpOZv/o9ItLGrXxe2AxF0GQf89EHMZkr8AMjxri3nIy/by3OXA6NSDIwzmmA
         xF1g==
X-Forwarded-Encrypted: i=1; AJvYcCXD1zJDVmMFySggZQvTGi2fAtD2sMkgic8oRx2qfjc8e2Ty+r3OPVrGv/VYb3BK02qOv7fxrnXhliyl+xnPB7cI@lists.infradead.org
X-Gm-Message-State: AOJu0YzXp1bfPjxTsaswgFb3wAMTwU5DJyrzBG72bohs+KsZw0SRL+Fc
	XxU70HqiIgHn+PrCKWWIgcYTl65Pu4nf9dX5ZTeHP0J/+VeUQO6HHKP06lhM9vfluz0MVGCGUYM
	7d5Dodihj1KvOlbpiFnkQCG6WUgI=
X-Gm-Gg: ASbGnctcpjHwJsr48wvUhuiMFJWj6BbZcOB9NeSkqFS0FP7CXbqArlOK4GI2fGmDRy4
	Rz7QlDMCbSpLLK4vdHJ3Kid+Xj1GyDAYf3BQX+qbnguLMSPLhMHIlYdRHhGlCpuxsRA0fPHkNn6
	v02MFNe+yFYURUJc5L7wG4SMbYXV4=
X-Google-Smtp-Source: AGHT+IHbGxKbQYCFuWIhUZcVJczLm09+fIRHtWAIdQXRdJS6TuroZiuhT9dXX9oyzczviIbaRcswg6Yl68ThvI97uCA=
X-Received: by 2002:a05:6000:21c6:b0:385:d7f9:f157 with SMTP id
 ffacd0b85a97d-3997f9375admr249521f8f.36.1742491515474; Thu, 20 Mar 2025
 10:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250318214035.481950-1-pcc@google.com> <20250318214035.481950-3-pcc@google.com>
In-Reply-To: <20250318214035.481950-3-pcc@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Mar 2025 18:25:04 +0100
X-Gm-Features: AQ5f1Jokd8HHitZidj6J_qrj1ibwtVddlmZs6GFQ40Nq--4p2Wt3mzW0XeogKWQ
Message-ID: <CA+fCnZfG79JmGG9rj7KbE=9yX-EM4e8CXDSm5F9=YEmgyX5v3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kasan: Add strscpy() test to trigger tag fault on arm64
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
X-CRM114-CacheID: sfid-20250320_102518_043077_3A06CA84 
X-CRM114-Status: GOOD (  28.38  )
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

On Tue, Mar 18, 2025 at 10:41=E2=80=AFPM Peter Collingbourne <pcc@google.co=
m> wrote:
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
>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Co-developed-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/If88e396b9e7c058c1a4b5a252=
274120e77b1898a
> ---
> v2:
> - rebased
> - fixed test failure
>
>  mm/kasan/kasan_test_c.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
> index 59d673400085f..c4bb3ee497b54 100644
> --- a/mm/kasan/kasan_test_c.c
> +++ b/mm/kasan/kasan_test_c.c
> @@ -1570,7 +1570,9 @@ static void kasan_memcmp(struct kunit *test)
>  static void kasan_strings(struct kunit *test)
>  {
>         char *ptr;
> -       size_t size =3D 24;
> +       char *src, *src2;
> +       u8 tag;
> +       size_t size =3D 2 * KASAN_GRANULE_SIZE;
>
>         /*
>          * str* functions are not instrumented with CONFIG_AMD_MEM_ENCRYP=
T.
> @@ -1581,6 +1583,33 @@ static void kasan_strings(struct kunit *test)
>         ptr =3D kmalloc(size, GFP_KERNEL | __GFP_ZERO);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>
> +       src =3D kmalloc(size, GFP_KERNEL | __GFP_ZERO);
> +       strscpy(src, "f0cacc1a00000000f0cacc1a00000000", size);
> +
> +       tag =3D get_tag(src);
> +
> +       src2 =3D src + KASAN_GRANULE_SIZE;
> +
> +       /*
> +        * Shorten string and poison the granule after it so that the una=
ligned
> +        * read in strscpy() triggers a tag mismatch.
> +        */
> +       src[KASAN_GRANULE_SIZE - 1] =3D '\0';
> +       kasan_poison(src2, KASAN_GRANULE_SIZE, tag + 1, false);
> +
> +       /*
> +        * The expected size does not include the terminator '\0'
> +        * so it is (KASAN_GRANULE_SIZE - 2) =3D=3D
> +        * KASAN_GRANULE_SIZE - ("initial removed character" + "\0").
> +        */
> +       KUNIT_EXPECT_EQ(test, KASAN_GRANULE_SIZE - 2,
> +                       strscpy(ptr, src + 1, size));
> +
> +       /* Undo operations above. */
> +       src[KASAN_GRANULE_SIZE - 1] =3D '0';
> +       kasan_poison(src2, KASAN_GRANULE_SIZE, tag, false);
> +
> +       kfree(src);

I have trouble understanding what this code is doing...

So the goal is to call strcpy with such an address, that the first 8
bytes (partially) cover 2 granules, one accessible and the other is
not?

If so, can we not do something like:

src =3D kmalloc(KASAN_GRANULE_SIZE, GFP_KERNEL | __GFP_ZERO);
strscpy(src, "aabbcceeddeeffg\0", size);
strscpy(ptr, src + KASAN_GRANULE_SIZE - 2, sizeof(unsigned long));

Otherwise, this code needs more explanatory comments and it's probably
better to move it out to a helper function.

>         kfree(ptr);
>
>         /*
> --
> 2.49.0.395.g12beb8f557-goog
>

