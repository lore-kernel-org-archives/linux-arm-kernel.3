Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A0DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9SzK2UEuhtJJT0GjeY2nATbMEf230d3JmnH92Hq97k=; b=hmDTfcxMgMYwyvT0/zJahKn0Zw
	U1dYXenGa7x+NLjphMZ5CfnDeq0nJ7Mb1TYGrfy2WY4PubiVl1JqwECJATpiRnx9y2tAlnjzjJvVD
	/el4R8jZzGHjJcD+2QfWJ2xS/LdDDLZ2EhRRv9WcH8pvkzddKpag+Ip+eXfUXEzNblG3P4gkGWgnq
	c7xQFkA+Wf8uz2iP3+/smZpzdm56uVRo7ONY3IhtJBleSO0h0aeOvK7d2k95rSgnHDqakalvTpwwg
	w8C0rshB7UGqhZkTz+zujs1562mWyw9q+1mfruPPkE+nlbYQ3mnO9hYQ8pT4YjjIvYPl1o8QLgl4u
	WPJl2DJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titJE-0000000EZHI-2S1s;
	Fri, 14 Feb 2025 10:52:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titHj-0000000EZ0H-3cVp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4AA6A41B36
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F861C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739530262;
	bh=6Jn8hY/sj0Vyp9Oc8m9BXlUSR+CXepQ6Dz6GoxyvGmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VRsIYOrXB4NBmaHnCnh1uRaIbgK1hXsNVaNz80MfbnD6MVpllwkX+Ak12MXoDJHcV
	 ys6MmQ9o2cpS8i3Vi7Bu3Lc0qaPCyUl/+Wehmwb+DWyODTsnbbG70xkXTu09G85ek6
	 oKOzzzEfsyiggpI64zaVrWPSzL7j2WgI8P+RDQH0vdoZuqQ/SL8X7IFVD98QPIX2up
	 Yymer9b//q1dKe/m4zomdwTDoM8rJOr3/EgutNtanp1n1AQiwty6iUdSBdjPo2XY+M
	 CQ0VKj0yNlCs2PAom9g9m52G7jyDnzJIpE1f6SMrCUf09pyfQt2/ehewrWeFXSS//H
	 GhfM6r7edJq/w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543e49a10f5so2015146e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 02:51:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXbCgCPt0CKSd32vXD+uum7KiA1a60AauJBH6cvqLPcDK4E9x8OAbE+8lZAIHfliPK3IsfEh9NYOiaKJ2f+48v@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5KPpDhBeZTKeztUjoJy0uDlGohzvS2WB0T8Erbsi4Hhq3luuj
	SZJ5R9cLBvtZ3oYozRK9CBG8ysA8Wmm8jUzg3mTXDYeug4SqmLs8daG1Wy3ymCR6X/u8sSXOXaS
	OVD66zeG/D5zujAz+ht3AggSrX5o=
X-Google-Smtp-Source: AGHT+IE51G43p8pR1toPTVSYBg68ovY9ZnGfaoNwwqJs6GgOaOCJnB/+CJEzpaQ+RZJoWPf4T1kKfJId9pTwob2I0YE=
X-Received: by 2002:a05:6512:1155:b0:545:296e:ac28 with SMTP id
 2adb3069b0e04-545296eaef4mr578053e87.24.1739530260860; Fri, 14 Feb 2025
 02:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20250212154718.44255-1-ebiggers@kernel.org> <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain> <Z66uH_aeKc7ubONg@gondor.apana.org.au>
 <20250214033518.GA2771@sol.localdomain> <Z669mxPsSpej6K6K@gondor.apana.org.au>
In-Reply-To: <Z669mxPsSpej6K6K@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Feb 2025 11:50:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHS+BaLnUSQf9uiTvXhSee=+8W1B-DY5MFHTxgpe1iMyg@mail.gmail.com>
X-Gm-Features: AWEUYZk9BVG_mnviM5EBJUUBfeH7CmJgTUXwh6dulpUSYK22Lsgwd5629FUH9e4
Message-ID: <CAMj1kXHS+BaLnUSQf9uiTvXhSee=+8W1B-DY5MFHTxgpe1iMyg@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer hashing
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev, 
	linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_025104_028572_76617C42 
X-CRM114-Status: GOOD (  18.17  )
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

On Fri, 14 Feb 2025 at 04:51, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Feb 13, 2025 at 07:35:18PM -0800, Eric Biggers wrote:
> >
> > It absolutely is designed for an obsolete form of hardware offload.  Have you
> > ever tried actually using it?  Here's how to hash a buffer of data with shash:
> >
> >       return crypto_shash_tfm_digest(tfm, data, size, out)
> >
> > ... and here's how to do it with the SHA-256 library, for what it's worth:
> >
> >       sha256(data, size, out)
> >
> > and here's how to do it with ahash:
>
> Try the new virt ahash interface, and we could easily put the
> request object on the stack for sync algorithms:
>
>         SYNC_AHASH_REQUEST_ON_STACK(req, alg);
>
>         ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL, NULL);
>         ahash_request_set_virt(req, data, out, size);
>
>         return crypto_ahash_digest(req);
>

Whatever happened to not adding infrastructure to the kernel without a user?

You keep saying how great this will all work for hypothetical cases,
and from any other contributor, we would expect to see working code
that demonstrates the advantages of the approach.

But it seems you have no interest in actually writing this networking
code, and nor has anybody else, as far as I can tell, which makes your
claims rather dubious.

IOW, even if all your claims are correct, it really makes no
difference when nobody can be bothered to take advantage of it, and we
should just go with Eric's working code.

