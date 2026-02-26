Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EEEFCE078
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hKnjbv3BL565dFjMkZ/BcbOnxBMvs6z5ncDkkB7tgA=; b=jjKdw/hWdFNwkx3fapJ7G0xvBH
	g9rZ5TbujRcE4afiPFEBSv+ewKaurwqP+bAJCOVoaukq7huI4aWxcaOBQQCaWEe/e6vhnVito0AIt
	DeumVv4Y/s3LA8kxV/Yjgs1P9hc3L/ZuCUuTNsh8fPM81yT67uattSTAySwVYDDJ/KNBvM0/XAcMi
	i9Xx6u1HmOvhG/kXl09cdQU8pjF2sbRFjMzteUwCr49/KxoDSoT2wJ9F9TsWqV58QACT0RmT0TCnn
	kXY08+iYCv3+5XEWrBxcLcizC0IouPhVjaffX/TVIkSjZ7OsEt/IfpQUe33UmdZfpX2tiDDluc3aJ
	wy7xtXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbAk-00000006BXF-2B4R;
	Thu, 26 Feb 2026 13:12:54 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbAi-00000006BWC-0caN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:12:53 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56753dc51baso367715e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 05:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111570; x=1772716370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hKnjbv3BL565dFjMkZ/BcbOnxBMvs6z5ncDkkB7tgA=;
        b=rdqb16bqsaw/2pPIvOHhJs6RKV3bEgD2La5/Nn+jMLlLa9+ianAX77WJnAmjLMeGCT
         nDY0Ve86GcxqUvgA6CwYoX1mbVZjRkHnUZYbl3qNg+ddLGbdqB6JOTH2wkhFeg/nygrS
         9x0f52Ux4yJbFV3GH+ZTcv4ReCIlTM17ACUwWT+WhcV/AVc+nCv7xH6GkAvwsZV9UgW2
         I4nSs7JCNv6FNDz6LXpmHRaTXaG0C4wiq2oJIvPHvyzP0gllSI/L0Jify2jMMzXUw5Nt
         SZkx5qjBRaEdoS6/yjgpSLyFlZ2qfIOMMrptegZ4NHEUSCGvli83VrVeG3lJrSjNQz3v
         VljA==
X-Forwarded-Encrypted: i=1; AJvYcCWDpaTFiKTAO8tNBrw/M0nzbu7xT8gWEtGmPZirqAYZEo4qaLdC6DdvRmh4QqyAJiZDFitmDW9yHoUUrXlXbwK7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ykukT6r9nJppruqgJW4GZ4f6z2Z61STU6ymfOgYP3ExuAyae
	7ZBiZsQS7X1xOTggt48wYXulZM0ns8N35vYZ1/RQ0Alcr4fdI7tjTxW0tQ0HoMe4
X-Gm-Gg: ATEYQzzigF3i8epsxRqSR6eg4M/jYnA7YcWu+JN87M+qHugDxkjcdAegJpMWrfD7i9n
	4L+7YUpT5aNGm3mC8sow8HBLpxokYS0fL44qOnZNjWR7snF+w/QdukP38pD8sTd7cgAFMtvQA98
	5ysKHtH12y2mBPdrjMuEOu49qxHfqQn75002HqKzxh6Xn8Hreq6ASb2Dq2ZXM4Aq+8JDTfVemtr
	bpZOFsFDcP6A9QZqLkkiC/HL+QvC2uIs2vyUjP4Mp/9xECQHsIf6ouwv8fy+uYROcKxW09eKus7
	cc5ss4r6OihGZSfWq8HjYex+TXfQrAHG1Zm4bJ7yIBDbSaHCrUtXe3YEPrHpQasYIxUuOAvBgB2
	in93feibxfuKkMYhMYKBdT8eKeq4fzzLZyX+dYnntCVjl7hOX11RTIYtpfLci3dJNUGlqYDUA3f
	uUzjIMVJt9R4ynps/igrZ5/jBCcnRUZM6vEai1vanNhTEzNiH8o/BhMvtnvwiV
X-Received: by 2002:a05:6122:3224:b0:56a:9841:efd4 with SMTP id 71dfb90a1353d-56a9841f361mr647493e0c.1.1772111570039;
        Thu, 26 Feb 2026 05:12:50 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9229a4d4sm2354666e0c.19.2026.02.26.05.12.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:12:49 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5fdecf79484so172365137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 05:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA0WWc+fPEbrauB0Sdx+K/jelDKFP/TRSPhAk510j3cDrBrZK/L8G4eICT2ayS28bpdA4qtkKjWjK0AjCSkRVx@lists.infradead.org
X-Received: by 2002:a05:6102:c4b:b0:5f1:4fc3:855d with SMTP id
 ada2fe7eead31-5feb311d364mr7291638137.38.1772111569094; Thu, 26 Feb 2026
 05:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20251211011846.8179-1-ebiggers@kernel.org> <20251211011846.8179-3-ebiggers@kernel.org>
In-Reply-To: <20251211011846.8179-3-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 14:12:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFRQZXCKJBOBDJtpENvpVO39AxGMUFWVQdM6xKTpnYYw@mail.gmail.com>
X-Gm-Features: AaiRm52VYzvaWsbmGKoOT8WKSlc9iNIE8yX77bG4Rzm2pI7VadASzUVGgBSmV4w
Message-ID: <CAMuHMdVFRQZXCKJBOBDJtpENvpVO39AxGMUFWVQdM6xKTpnYYw@mail.gmail.com>
Subject: Re: [PATCH 02/12] lib/crypto: tests: Add KUnit tests for NH
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_051252_192351_548A5FEC 
X-CRM114-Status: GOOD (  22.24  )
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

Hi Eric,

On Thu, 11 Dec 2025 at 02:25, Eric Biggers <ebiggers@kernel.org> wrote:
> Add some simple KUnit tests for the nh() function.
>
> These replace the test coverage which will be lost by removing the
> nhpoly1305 crypto_shash.
>
> Note that the NH code also continues to be tested indirectly as well,
> via the tests for the "adiantum(xchacha12,aes)" crypto_skcipher.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Thanks for your patch, which is now commit 7246fe6cd64475d8
("lib/crypto: tests: Add KUnit tests for NH") in v7.0-rc1.

> --- a/lib/crypto/tests/Kconfig
> +++ b/lib/crypto/tests/Kconfig
> @@ -45,10 +45,18 @@ config CRYPTO_LIB_MLDSA_KUNIT_TEST
>         select CRYPTO_LIB_BENCHMARK_VISIBLE
>         select CRYPTO_LIB_MLDSA
>         help
>           KUnit tests for the ML-DSA digital signature algorithm.
>
> +config CRYPTO_LIB_NH_KUNIT_TEST
> +       tristate "KUnit tests for NH" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
> +       select CRYPTO_LIB_NH

This select means that enabling KUNIT_ALL_TESTS also enables
extra functionality, which may not be desirable in a production system.
Fortunately CRYPTO_LIB_NH is tristate, so in the modular case the
extra functionality is a module, too, and not part of the running
system by default.  Unfortunately CRYPTO_LIB_NH is invisible, so this
cannot just be changed from "select" to "depends on".

> +       help
> +         KUnit tests for the NH almost-universal hash function.
> +
>  config CRYPTO_LIB_POLY1305_KUNIT_TEST
>         tristate "KUnit tests for Poly1305" if !KUNIT_ALL_TESTS
>         depends on KUNIT
>         default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
>         select CRYPTO_LIB_BENCHMARK_VISIBLE

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

