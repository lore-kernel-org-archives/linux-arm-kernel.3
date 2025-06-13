Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C7AC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2jx2sNLNoJ0ygGTf3Y8T5QDDcxRyAG0f6aRQMfMYKs=; b=jpwzWdy9vFNk4KYyQuQjCDBWAb
	1jZhvo6iPPoIGTPniEiiBa6N3v+fIQ5Hw6kjG1b+x7rXnUlAOP7ynKjSq6qhE2dt6BZa8XLdav9q6
	u4m6WZKj8KX+kBoOlVUhsrGWaYC6+KIziUMmViMy+zsGHacefympUMbMPoFpIDKFI7CHfhcNz9CD1
	Uhw6K9Jp9TcwpUu86r4qsFz4QWWaNqCp2H8i6CSqUsUSzoFaKn+74Os+dnUS19heayZwM1b7BQS5n
	EawaHCXewkrsBZMklkB67AXEoK8vJomM8H+wtVVX2qXryOAt1bkvZPE2jJdXnNuXZoeRxmLhfq8Ea
	lqvuRZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ01B-0000000Fmav-283T;
	Fri, 13 Jun 2025 08:44:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzwf-0000000FmE3-1s7a;
	Fri, 13 Jun 2025 08:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z2jx2sNLNoJ0ygGTf3Y8T5QDDcxRyAG0f6aRQMfMYKs=; b=rQ36yDZorSY7w6v0mymR9sfvfh
	CcQUwIpKYppDnk1uAQSm0A2Q799yQMAXL9NNLdn47N9HHM1TTX/zkct6HHOz+kRFU0v9J313BSZ4H
	TFuVa7LpqbT533KNTTBfs3OpZVXhwLn0anuLlayzf4R1l8Q6PAVQKdrisWneB5Ga5pQ7e+fV05O12
	HFphSAAxRU025PdXIJqQcKlgtovHAsL6DAI+ssR7evOY75PdKD073uA5PHMprMnEzvIJChA0e4m1b
	2vmcLPNRFcbAtL5w4ZL/s3mSY464DsjOSXCwXLLmoaSTJQTjfwxdKZctgB7hM9qeRYmaX6wvcdDXq
	PLqrxOdw==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzwc-00000002vu0-1MtR;
	Fri, 13 Jun 2025 08:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=z2jx2sNLNoJ0ygGTf3Y8T5QDDcxRyAG0f6aRQMfMYKs=; b=Dqacu+sT7ilY3QllsgF/kbefo0
	GdITohgE0nQBt/EYnqx4lHQgvV4Dv6F1wIU9eQAl4ci4vNvkw5yOCf/xRMQJjk97CC1+WtFXiNmt9
	ng1hmwEm7mvHCGCLGIPB7Y0qihOstz/KTuCJv0q+xNXMeFq9dhAhp2IxaG8qNR9AHI2DHj2vAxXXY
	9q/fvfkAp4GpD+vKUtKur21el66NXn0IUE0vQ7byU41Bhod/OxxMR6yFo6zPsd6p9ujY4MfOYL0b3
	Wtj8YQibzup0USfdWJ89Ve02aoDvW+cit1BycTBi4ecJ+kNE+EJ8cz7FFwUxzo64ntpSAv/kuwscm
	zwvheCug==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPzwM-00Cs6f-1z;
	Fri, 13 Jun 2025 16:39:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jun 2025 16:39:10 +0800
Date: Fri, 13 Jun 2025 16:39:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_093926_426959_134371B1 
X-CRM114-Status: GOOD (  10.17  )
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

On Fri, Jun 13, 2025 at 09:38:11AM +0200, Ard Biesheuvel wrote:
>
> Perhaps I am just slow, but could you please explain again what the
> point is of all these changes?
> 
> Where is h/w accelerated ahash being used to the extent that it
> justifies changing all this existing code to accommodate it?

There are two separate changes.

First of all the export format is being made consistent so that
any hardware hash can switch over to a software fallback after
it has started, e.g., in the event of a memory allocation failure.

The partial block API handling on the other hand is about simplifying
the drivers so that they are less error-prone.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

