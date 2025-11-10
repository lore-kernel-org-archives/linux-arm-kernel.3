Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DD6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydarknLy+9iVW5tB17QkQCCCj/+D/y5ukZdkJQE0nr0=; b=SfHHPg78q1mERQZBJ+npmH6dVB
	HEAlDjDqsDFYuLNjU7lm1ezu21GkD8sFrtHVNEQ+vy/GDYhHYWX0j0qPKAcaaOkobpOy84zWtoxBe
	6BuoJMr9gMa2aPQWXINnLP108OozvHv/el5ilwcik5bpDCkxEG47nEsa2RSJFLE5ZyUHG83pVYK80
	mBveyCfr86DiuBILo2B6sl28GhJrToadtXUVVrSzCiCPFOih3bK6JlrA/ZsXj/4l7mfmYEnVWIpzH
	GLcOsZ1FKTnVnosN8ZnYgzybEYJ3+a2eAxdtiVa8WrbrE2EPoNWWiVwgNHmnQ2Ih2iq2k9f41sRUh
	TdCmhkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUBN-00000005jZq-2hJM;
	Mon, 10 Nov 2025 15:51:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUBL-00000005jZT-34Iq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29A6042B73
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07675C19424
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762789910;
	bh=GSFlX0y3gsnIwhRYANOlx9NAjCA/sGqwGHm+2KMpqBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HCXPz7ossZ0zuvqkkEq2/bx0oozCwXUUv6ulGyg2OOn/xJsU2/66w1yscTMbMrOWc
	 UXjWfS21Ztm1KIHjdNd6/jRgiIKaAwKhQGdBjEhQgN6kvGVDguSdsDY6jPwgVsuiny
	 u+Bmtb25SxDj8HbyN8vUwElH+9t//TDZZnAdsPbuvcBplOsm2S6c1i+c4Z/dXWpfJu
	 XhhmUdR2nYHN2TvKhRr57DvrgB5fFcPk1RVb3xLln6+yRTlRY3B/eFM1ySs9w9zAcm
	 ie1Pg29gNyABY7fUPYj0NZ18OLc5nRaENeUm0rLPwd5LG1CMKEcbHCLvk+kj7D7Y7a
	 yVsUIwOzU6EDQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5943f39bf9dso2836230e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 07:51:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzrGg0oxqRRgyqBxGUKjMAsomTOmbgGcpNWk22POoKfTGTyYhtx70i1MWIE2OLLS7/rx2FLSRy7Lsb6yZMj7Tq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6IOKLYK10DxMFPveoGcEKzfwGX6fnie1ZeYdFQjDAipDEMyRG
	HHZNlSuO0xxoLiucIfbTecZnn2JzUiH/Hin71M6YXeNaagqay+IVEhpNf1LItjp4HlGoWvx6XhN
	xL4xOg24RWLqRWeFzQMlPOhqshY8wwTE=
X-Google-Smtp-Source: AGHT+IFXuPtKwkkkVh2oaEjkAj6BoMkJvY6oWI0baW4Ym5w1O2+M/t+LwpzAkaGKMejiWXgBe1nKuDFew8RPK+mVPWM=
X-Received: by 2002:a05:6512:1321:b0:592:fc99:5a40 with SMTP id
 2adb3069b0e04-59459992b04mr3246687e87.6.1762789908213; Mon, 10 Nov 2025
 07:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20251109234726.638437-1-ebiggers@kernel.org>
In-Reply-To: <20251109234726.638437-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 10 Nov 2025 16:51:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEve+1uPcdECLeyD_N-prXvbe7jhOYoNO66S1eaxg-JNg@mail.gmail.com>
X-Gm-Features: AWmQ_bkZy1tCqLQPs6sUKods1yGx8M4ndxZup1PcnhLiXuTBiAPxNGcqnJd6tS4
Message-ID: <CAMj1kXEve+1uPcdECLeyD_N-prXvbe7jhOYoNO66S1eaxg-JNg@mail.gmail.com>
Subject: Re: [PATCH 0/9] POLYVAL library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_075151_816335_E7E8E624 
X-CRM114-Status: GOOD (  15.64  )
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

On Mon, 10 Nov 2025 at 00:49, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is targeting libcrypto-next.  It can also be retrieved from:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git polyval-lib-v1
>
> This series migrates the POLYVAL code to lib/crypto/.  It turns out that
> just like Poly1305, the library is a much better fit for it.
>
> This series also replaces the generic implementation of POLYVAL with a
> much better one.
>
> Notably, this series improves the performance of HCTR2, since it
> eliminates unnecessary overhead that was being incurred by accessing
> POLYVAL via the crypto_shash API.  I see a 45% increase in throughput
> with 64-byte messages, 53% with 128-byte, or 6% with 4096-byte.
>
> It also eliminates the need to explicitly enable the optimized POLYVAL
> code, as it's now enabled automatically when HCTR2 support is enabled.
>
> Eric Biggers (9):
>   crypto: polyval - Rename conflicting functions
>   lib/crypto: polyval: Add POLYVAL library
>   lib/crypto: tests: Add KUnit tests for POLYVAL
>   lib/crypto: arm64/polyval: Migrate optimized code into library
>   lib/crypto: x86/polyval: Migrate optimized code into library
>   crypto: hctr2 - Convert to use POLYVAL library
>   crypto: polyval - Remove the polyval crypto_shash
>   crypto: testmgr - Remove polyval tests
>   fscrypt: Drop obsolete recommendation to enable optimized POLYVAL
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

