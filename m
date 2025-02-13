Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=444+3PpVJ6Rc/5DNNSc7b25gv9MUrtliSbbzsT/wTXw=; b=TyPVZB4mqiQpMJxwb1bQMC/NwK
	mn4UkmXrEQXF4pRYyUYWUeOmgNx4Ex+SnKTLZjVIbTDNiNCi/gQXuM6vnq8ico8lj7Uk1gYc7FrIn
	odkNoPoR+vDPU3aBm/2cz9L3aLqkmpcBZ+U0OG3tS4RL1uG31NinWn7f2y0NXi/lNaOHn4iFaBfgd
	uiioty7jh9N4rlann5JUh9eThXG+t6g/TCUgG67xJ9eVdb05vcIZ889rN3HtQcxqx81Xvelrt8fKD
	IlaXfVghWA8INHFszqFy6GjgeHr8bmq1P47NBNvDdNZKU8ePHVjOM700PoCuOG2tOF2KxJ+V0tVTo
	Em6ZsYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWCI-0000000Abo4-2M1e;
	Thu, 13 Feb 2025 10:11:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWAr-0000000AbUE-0TyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F7BDA41FEF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8EFC4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739441423;
	bh=42FVAKglSdA4GCM9HFlOhDKZOpyrLuyiIonz/DiE3L8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QduZ+V/DRRjp2YWO++Ujfw3lygiGvik5JyzHxwkbzuCCpkjDQA2xTe9472qCN+Nmm
	 g8UPJBRO1x11HRM2ivIE8CcqfDWwXrogX25VnK26nn9dKYYSxVlODPp0HlmILK/i/p
	 ILEi1lvFLnbPFZ1RBFxCyUR9zSS2JVm7RVMD5EUeUO5vRTsL2pHLncYcwgGow9yA1I
	 mYmv3jE4woQi5p93XX32ny0y8aYTG6xUG+cNojoNuN4gr//3nWs+4xcMdeJ3iK/26I
	 8RMuhd8w68G4+i9xGt3TiXQciFWBB6LoanAcebArn+JtR6Jr1P+7tTOJogzdZMgjnR
	 bu3Pc5MrK9oNg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543d8badc30so761801e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:10:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP5mvg0b0DzO08Y2s76gi9xAPBtpEFbbzPy4e6itQE9yLF2KNtDDyddb2eQT/iwejgQMOXaOcmOXHQMSiPWQi8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wObkn5KUnMP2r0i0HIPlYGRLbm+twLDkM8z2kWB20/rOZZQb
	ywiWhCuKXwiAWVSSahvhvrFTbrBVWBNOy199/4mzFHgnzh9AbUoO+GFifWI6Yvwq4qjL+wua9GB
	tPhB3gGRjvcu/fG1WRMW9n7wuzLo=
X-Google-Smtp-Source: AGHT+IHR+xr20cYmx6lgB9lVJM3c3+XAiEna+ZFlbjgJt6DHiy1GJEpnHOR+KpKMxfjEGw7dyQYgQ9iz1/SKleqfvSQ=
X-Received: by 2002:a05:6512:159b:b0:545:4d1:64c0 with SMTP id
 2adb3069b0e04-5451dd9e2admr736305e87.27.1739441421532; Thu, 13 Feb 2025
 02:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20250212154718.44255-1-ebiggers@kernel.org> <Z61yZjslWKmDGE_t@gondor.apana.org.au>
In-Reply-To: <Z61yZjslWKmDGE_t@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Feb 2025 11:10:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE+K4XbmxkXwzj9tHE2DP_A5pKLPPFv6+Fa=CtH8rD24Q@mail.gmail.com>
X-Gm-Features: AWEUYZkVud9S7L-5xo9HDDz6-H1l2qn4wDw7iDL4qi7FjFF8ciQmJoIc0opMONg
Message-ID: <CAMj1kXE+K4XbmxkXwzj9tHE2DP_A5pKLPPFv6+Fa=CtH8rD24Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250213_021025_314197_90CD6B88 
X-CRM114-Status: GOOD (  25.64  )
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

On Thu, 13 Feb 2025 at 05:17, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Wed, Feb 12, 2025 at 07:47:11AM -0800, Eric Biggers wrote:
> > [ This patchset keeps getting rejected by Herbert, who prefers a
> >   complex, buggy, and slow alternative that shoehorns CPU-based hashing
> >   into the asynchronous hash API which is designed for off-CPU offload:
> >   https://lore.kernel.org/linux-crypto/cover.1730021644.git.herbert@gondor.apana.org.au/
> >   This patchset is a much better way to do it though, and I've already
> >   been maintaining it downstream as it would not be reasonable to go the
> >   asynchronous hash route instead.  Let me know if there are any
> >   objections to me taking this patchset through the fsverity tree, or at
> >   least patches 1-5 as the dm-verity patches could go in separately. ]
>
> Yes I object.  While I very much like this idea of parallel hashing
> that you're introducing, shoehorning it into shash is restricting
> this to storage-based users.
>
> Networking is equally able to benefit from paralell hashing, and
> parallel crypto (in particular, AEAD) in general.  In fact, both
> TLS and IPsec can benefit directly from bulk submission instead
> of the current scheme where a single packet is processed at a time.
>
> But thanks for the reminder and I will be posting my patches
> soon.
>

I have to second Eric here, simply because his work has been ready to
go for a year now, while you keep rejecting it on the basis that
you're creating something better, and the only thing you have managed
to produce in the meantime didn't even work.

I strongly urge you to accept Eric's work, and if your approach is
really superior, it should be fairly easy making that point with
working code once you get around to producing it, and we can switch
over the users then.

The increased flexibility you claim your approach will have does not
mesh with my understanding of where the opportunities for improvement
are: CPU-based SHA can be tightly interleaved at the instruction level
to have a performance gain of almost 2x. Designing a more flexible
ahash based multibuffer API that can still take advantage of this to
the same extent is not straight-forward, and you going off and cooking
up something by yourself for months at a time does not inspire
confidence that this will converge any time soon, if at all.

Also, your network use case is fairly theoretical, whereas the
fsverity and dm-verity code runs on 100s of millions of mobile phones
in the field, so sacrificing any performance of the latter to serve
the former seems misguided to me.

So could you please remove yourself from the critical path here, and
merge this while we wait for your better alternative to materialize?

Thanks,
Ard.

