Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA9CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSbVykyxPA1Ak1+UZA29XQ5dRWm8q2Ix3XL0eI9qU18=; b=WmSLsurrMluf2mjFcrYZl3y0hA
	khReLfWqsGBFvWC7nq90OiJDRHhIYiQV83BYB7M0p5lFdGMeQx8nb/J8K2FJqoKXNd6Lz69UKVo8D
	ICP58gKrPIfBHjIhMl09qAMGixMvbugD+Df/+qR9att5wgs0JUDFGSHEU92zuUELxOgO1nd6vUNdZ
	/jolRJVx/ZoFMBOgupAGpSFvAJsKdybQEg5G9YeNYaKx9lOfRaeJ33439hQjuoObmZseZNzG3FmrI
	bOw7JMKjDJaM/13NFii/NdlKgr5r95MYZ7nQNkmZ25YlDJcgNa9OFBuPxWHUQliyCO1nfHmMgl4LZ
	b02O3EKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDK1-00000006e9g-42zo;
	Fri, 09 Oct 2026 16:19:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDJw-00000006e9I-2IMJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:19:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59C366053E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 16:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81A91F00893
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 16:19:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=BEfk20/m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1791562781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSbVykyxPA1Ak1+UZA29XQ5dRWm8q2Ix3XL0eI9qU18=;
	b=BEfk20/mmhSM7K4GuxxwwQST5KciEM8fdl+aFd3izBlSXbzuDtDE4Y31KXnWCYojuz1gPK
	oCm7BtkJQotmaTyhqE99wKxgD21y1qsJX/jykmh4KZ1275Mbg1v0IW1Mwm3ReCYpaWw5DS
	pq2p7Y/S/vipz95dcaSfSRYrBuz22sA=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 9b78aba1 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-arm-kernel@lists.infradead.org>;
	Fri, 9 Oct 2026 16:19:40 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c247f6687dcso1640766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhopsORtI8O61bcqvDezYehSXlGS1w/ljJY8yaJhHErLIecMp3TJ7tCEOQ/gAHvKUkcjAXQ6M5j4PQKHU5BSZH@lists.infradead.org
X-Gm-Message-State: AFq9FYK2UvAo2KowwF9vkMs/jQnhn6rwQAtxklW8jTMdjTsODc6orFEz
	AJBcdxEegqfLPp2KMHsEWCjbE+wgWEXocO260wUsXu3L0zqouNkd9qbsTgeRlUmZ4R32tws6Io1
	42tSp825AeSN18BmCbEuzuKWsHMZYglY=
X-Received: by 2002:a17:906:dc8e:b0:c2e:4488:b8a3 with SMTP id
 a640c23a62f3a-c31aa0850bamr241726766b.33.1791562779151; Fri, 09 Oct 2026
 09:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261009125354.315476-1-ebiggers@kernel.org> <20261009125354.315476-3-ebiggers@kernel.org>
In-Reply-To: <20261009125354.315476-3-ebiggers@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Oct 2026 18:19:27 +0200
X-Gmail-Original-Message-ID: <CAHmME9rZmWrNSjf4XbKr-6h5+Ej7iQSaepp0RmHS1-WQ36_f+g@mail.gmail.com>
X-Gm-Features: AclHuK_GEAmx6FM-EOUzkSaYXlDvHOBFWuOXF7ob-K-5qMrkDh3cGGSjrhMFxbI
Message-ID: <CAHmME9rZmWrNSjf4XbKr-6h5+Ej7iQSaepp0RmHS1-WQ36_f+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] lib/crypto: tests: Add Poly1305 split-update carry
 regression test
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 9, 2026 at 2:54=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> Add a test case which reproduces the bug fixed by commit f5602ce803dc
> ("lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state").
> It is written in a fairly general way, such that it should also be able
> to reproduce similar bugs in other implementations.
>
> Update the comment on test_poly1305_allones_keys_and_message() to more
> accurately describe what it does and differentiate it from the new test.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  lib/crypto/tests/poly1305_kunit.c | 97 ++++++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 9 deletions(-)
>
> diff --git a/lib/crypto/tests/poly1305_kunit.c b/lib/crypto/tests/poly130=
5_kunit.c
> index f3cb6245bc29..d065d8b6442f 100644
> --- a/lib/crypto/tests/poly1305_kunit.c
> +++ b/lib/crypto/tests/poly1305_kunit.c
> @@ -55,16 +55,17 @@ static int poly1305_suite_init(struct kunit_suite *su=
ite)
>   * - Using an all-one-bits r_key tests the key clamping.
>   * - Using an all-one-bits s_key tests carries in implementations of the
>   *   addition mod 2**128 during finalization.
> - * - Using all-one-bits message, and to a lesser extent r_key, tends to =
maximize
> - *   any intermediate accumulator values.  This increases the chance of
> - *   detecting bugs that occur only in rare cases where the accumulator =
values
> - *   get very large, for example the bug fixed by commit 678cce4019d746d=
a
> - *   ("crypto: x86/poly1305 - fix overflow during partial reduction").
> + * - Using all-one-bits message and r_key results in large values for th=
e
> + *   internal products of r_key by (accumulator + message block).  This
> + *   increases the chance of detecting bugs that occur only in rare case=
s where
> + *   the sum of these internal products is very large, for example the b=
ug fixed
> + *   by commit 678cce4019d746da ("crypto: x86/poly1305 - fix overflow du=
ring
> + *   partial reduction").
>   *
> - * Accumulator overflow bugs may be specific to particular update length=
s (in
> - * blocks) and/or particular values of the previous acculumator.  Note t=
hat the
> - * accumulator starts at 0 which gives the lowest chance of an overflow.=
  Thus,
> - * a single all-one-bits test vector may be insufficient.
> + * Bugs with the handling of large internal product sums may be specific=
 to
> + * particular update lengths (in blocks) and/or require that the accumul=
ator
> + * also have a large value.  Note that the accumulator starts at 0.  Thu=
s, a
> + * single all-one-bits test vector may be insufficient.
>   *
>   * Considering that, do the following test: continuously update a single
>   * Poly1305 context with all-one-bits data of varying lengths (0, 16, 32=
, ...,
> @@ -141,10 +142,88 @@ static void test_poly1305_reduction_edge_cases(stru=
ct kunit *test)
>         }
>  }
>
> +/*
> + * Test that Poly1305 MACs are computed correctly when r_key=3D1, s_key=
=3D0, and the
> + * message consists of all-ones blocks.
> + *
> + * With r_key=3D1 and s_key=3D0, Poly1305 degrades to the sum of the pad=
ded blocks
> + * mod 2**130 - 5, then reduced mod 2**128.  A padded all-ones block map=
s to
> + * 2**128 + (2**128 - 1) =3D 2**129 - 1.  Two such blocks sum to 2**130 =
- 2, which
> + * is congruent to 3 mod 2**130 - 5.  Thus, the expected MAC is just 3 *
> + * floor(nblocks / 2), minus 1 if nblocks is odd, then reduced mod 2**12=
8.  If
> + * nblocks =3D=3D 1 this is 2**128 - 1, otherwise it's just a small inte=
ger.
> + *
> + * Inside the Poly1305 implementation in this case, the multiplication d=
oes
> + * nothing and each block just adds 2**129 - 1 to the accumulator.  With=
out the
> + * multiplication to mix things up, this results in some interesting val=
ues
> + * being reached where the limbs are at or near their maximum values, ev=
en after
> + * (lazy) reduction.  This can reproduce bugs that happen only in such c=
ases.
> + *
> + * For example, this test case reproduces the bug fixed by commit f5602c=
e803dc
> + * ("lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state=
").
> + *
> + * However, reaching that bug required two consecutive updates: one with=
 >=3D 8
> + * blocks to cause NEON code to be used and leave the accumulator in bas=
e 2**26
> + * with its limbs in a certain pattern, then one with an odd number of b=
locks >=3D
> + * 9 to cause NEON to be used again, but first processing one block usin=
g scalar
> + * code as a special case, triggering a conversion to base 2**64 where t=
he carry
> + * into the 2**128 bit was lost.  To cover this and other similar edge c=
ases
> + * that may exist in other Poly1305 implementations, just test all possi=
ble
> + * block-aligned splits between three poly1305_update() calls.
> + */
> +static void test_poly1305_split_update_carry(struct kunit *test)
> +{
> +       static const u8 key[POLY1305_KEY_SIZE] =3D { 1 }; /* r_key=3D1, s=
_key=3D0 */
> +       /*
> +        * Use max_nblocks=3D66 so that it's a bit more than twice the AV=
X-512
> +        * threshold of 32 blocks.
> +        */
> +       const int max_nblocks =3D 66;
> +       u8 *data =3D alloc_buf(test, max_nblocks * POLY1305_BLOCK_SIZE);
> +       u8 expected_mac[POLY1305_DIGEST_SIZE];
> +       u8 actual_mac[POLY1305_DIGEST_SIZE];
> +       struct poly1305_desc_ctx ctx;
> +
> +       KUNIT_ASSERT_LE(test, 3 * (max_nblocks / 2), U8_MAX);
> +
> +       memset(data, 0xff, max_nblocks * POLY1305_BLOCK_SIZE);
> +
> +       for (int nblocks =3D 0; nblocks <=3D max_nblocks; nblocks++) {
> +               size_t len =3D nblocks * POLY1305_BLOCK_SIZE;
> +
> +               expected_mac[0] =3D 3 * (nblocks / 2) - (nblocks % 2);
> +               memset(&expected_mac[1], nblocks =3D=3D 1 ? 0xff : 0,
> +                      POLY1305_DIGEST_SIZE - 1);
> +               for (size_t part1_len =3D 0; part1_len <=3D len;
> +                    part1_len +=3D POLY1305_BLOCK_SIZE) {
> +                       for (size_t part2_len =3D 0; part2_len <=3D len -=
 part1_len;
> +                            part2_len +=3D POLY1305_BLOCK_SIZE) {
> +                               size_t part3_len =3D len - part1_len - pa=
rt2_len;
> +
> +                               poly1305_init(&ctx, key);
> +                               poly1305_update(&ctx, data, part1_len);
> +                               poly1305_update(&ctx, &data[part1_len],
> +                                               part2_len);
> +                               poly1305_update(&ctx,
> +                                               &data[part1_len + part2_l=
en],
> +                                               part3_len);
> +                               poly1305_final(&ctx, actual_mac);
> +                               KUNIT_ASSERT_MEMEQ_MSG(
> +                                       test, actual_mac, expected_mac,
> +                                       POLY1305_DIGEST_SIZE,
> +                                       "Failed with nblocks=3D%d, part1_=
len=3D%zu, part2_len=3D%zu, part3_len=3D%zu",
> +                                       nblocks, part1_len, part2_len,
> +                                       part3_len);
> +                       }
> +               }
> +       }
> +}
> +
>  static struct kunit_case poly1305_test_cases[] =3D {
>         HASH_KUNIT_CASES,
>         KUNIT_CASE(test_poly1305_allones_keys_and_message),
>         KUNIT_CASE(test_poly1305_reduction_edge_cases),
> +       KUNIT_CASE(test_poly1305_split_update_carry),
>         KUNIT_CASE(benchmark_hash),
>         {},
>  };

Oh man. I feel like we've written so many other tests that are
_almost_ this one that I feel silly we didn't catch it ourselves. In
any case, I'm glad to see this here, and somewhat generically composed
too, to check for similar bugs elsewhere.

    Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

