Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C459C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOyv4kS6IEiUR/F0Uy79/6bdOLzA/RPRpgmG1fQSlWY=; b=xb2HO9qnDhi62HLYz4AqIjgnQk
	qOEKKkkY1sg1vOsnU+L0IX6y9RTc2VkICITw1KgUUJoqD9kmsAh3ZMl1gQnu5AtV4NbFgMlteRm7Y
	3DfQVn4Dt8NecDwFU9LpeezP3+tPSTW07MSi2vKikeqRAMovYENxxdQKtl97EG/qNucyw6taAhsyt
	DvtE0m8EZZebXVvFGuXQ/H2CE3hYM4dsb5dgBjryCBAeLK1nQzJOsCyXVAQoeDb3NmgppxtricDAD
	tMv4m7KVUrGkFnFyiXEt1xNBe+MkW3HgUXPxtWYQ7Y+stjoIHeRogjylre/3szLlri6/SPR0PRwUB
	E5wu6p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsQ0-00000002kcX-2ADu;
	Sun, 15 Jun 2025 18:49:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsNm-00000002kQZ-3YXO;
	Sun, 15 Jun 2025 18:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BC534AB32;
	Sun, 15 Jun 2025 18:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA633C4CEE3;
	Sun, 15 Jun 2025 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750013226;
	bh=5b3uNryP074LRzS0e8lRw21Ibl8znCFGJk8dG32zXQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBPtFxhSJMUXxmaT/KxQ35nsgIcXL/g9ImLlDTQb++SUrhRAv5BrYEyhMzlivQTnA
	 b5r6qgTgn/HKGqJKv8iIJZIrBrbSU8quRUHzUx02dyadCT/fXANUmLE4BYuuyerOk5
	 syWDFFmKz8D7g32RagfLqYXxRSTC1HcHir74l/R1J5sHSjE1peKYYs60gZCL3eQPFb
	 cTq1v0r+DKJnH6n9ApPtKk3wepQy940tpEOG1qlya7EY3CViKAzbLFJr2wnU1AGoVG
	 WMCEPfl0m7mcUWeu5p5Yg2rrbz49hc8W2AJ7VRhT2wOOyNch3zWfyN/nLXRv7u5Cna
	 suPZqRSuvlvJQ==
Date: Sun, 15 Jun 2025 11:46:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
Message-ID: <20250615184638.GA1480@sol>
References: <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol>
 <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_114706_915477_6AC04482 
X-CRM114-Status: GOOD (  28.94  )
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

On Sun, Jun 15, 2025 at 09:22:51AM +0200, Ard Biesheuvel wrote:
> On Sun, 15 Jun 2025 at 05:18, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> ...
> > After disabling the crypto self-tests, I was then able to run a benchmark of
> > SHA-256 hashing 4096-byte messages, which fortunately didn't encounter the
> > recursion bug.  I got the following results:
> >
> >     ARMv8 crypto extensions: 1864 MB/s
> >     Generic C code: 358 MB/s
> >     Qualcomm Crypto Engine: 55 MB/s
> >
> > So just to clarify, you believe that asynchronous hash drivers like the Qualcomm
> > Crypto Engine one are useful, and the changes that you're requiring to the
> > CPU-based code are to support these drivers?
> >
> 
> And this offload engine only has one internal queue, right? Whereas
> the CPU results may be multiplied by the number of cores on the soc.
> It would still be interesting how much of this is due to latency
> rather than limited throughput but it seems highly unlikely that there
> are any message sizes large enough where QCE would catch up with the
> CPUs. (AIUI, the only use case we have in the kernel today for message
> sizes that are substantially larger than this is kTLS, but I'm not
> sure how well it works with crypto_aead compared to offload at a more
> suitable level in the networking stack, and this driver does not
> implement GCM in the first place)
> 
> On ARM socs, these offload engines usually exist primarily for the
> benefit of the verified boot implementation in mask ROM, which
> obviously needs to be minimal but doesn't have to be very fast in
> order to get past the first boot stages and hand over to software.
> Then, since the IP block is there, it's listed as a feature in the
> data sheet, even though it is not very useful when running under the
> OS.

With 1 MiB messages, I get 1913 MB/s with ARMv8 CE and 142 MB/s with QCE.

(BTW, that's single-buffer ARMv8 CE.  My two-buffer code is over 3000 MB/s.)

I then changed my benchmark code to take full advantage of the async API and
submit as many requests as the hardware can handle.  (This would be a best-case
scenario for QCE; in many real use cases this is not possible.)  Result with QCE
was 58 MB/s with 4 KiB messages or 155 MB/s for 1 MiB messages.

So yes, QCE seems to have only one queue, and even that one queue is *much*
slower than just using the CPU.  It's even slower than the generic C code.

And until I fixed it recently, the Crypto API defaulted to using QCE instead of
ARMv8 CE.

But this seems to be a common pattern among the offload engines.
I noticed a similar issue with Intel QAT, which I elaborate on in this patch:
https://lore.kernel.org/r/20250615045145.224567-1-ebiggers@kernel.org

- Eric

