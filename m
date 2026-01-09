Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF12D232FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gw1T6NAb6pFc9kh0Lb8Qk8uoHDdU63opjMEO4YOEio=; b=5FYIKHflIQOL+G7EIoe5AgP+UE
	I70Q/r2SsRu2oCBRdBOv0vquPFtTZfTlcHV8/DwfHUnTxEcjuBPvvuVz66gbFf4QthCVr7wQFxfOB
	YNAe6HzJAuC4OSjhJ+aWGwt4b7cHIJAjzFzA1F3yoseHQ6xGHPV67q1CcdlhDE4A13XSAddlFhSu2
	fm1Wcub6JGa1e0xhjyORTKcQQ0r1yT5s5UojFIo0T1DplNEslERswQXuqX4FT4FM+D0f7Z3BRFA5O
	f1UWOrR12A1dI+galsf/uCP8fgnRLRif7I2+84N2XgwYhNTvWCBWfSDutAO66RYjZbaY3roubuc9L
	HcDPLmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Tg-00000001ygU-3rmx;
	Fri, 09 Jan 2026 09:08:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Tf-00000001yfq-3KtU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B236016D
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12A1C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767949694;
	bh=goiI1ZxyIEI3mcfeHTSEAz7enxjoJAjvK6SpyVAMJNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WIGhG3sgki+KEoz1vXOR2kR3tB1EB73l3CF5edZGAclsEhVnW+MFWjTMXqfV7GEI6
	 zQgT4YjabyJ7LWa0lp7M6x6hfaA8DQNCTQN1NNYT+o3fm+w2JaH0NLp6PEIx3bf1q1
	 TzO5jLn7lUUx5vFHwxyMbeTKV0azO209foiogdr0ZA5CoY0r4o64woui0oxNWJLL20
	 HYsni/IYgPj253gmaaKlTFuIDAiebwcY1Cx6bE0IzDPaAr+W4Ihox47gg0cM/Npeev
	 rhL2V31+zMVTkjz233e1ZBCunhubLUJiaYIL2QcP5QJ56aXMlRzVsvhA666bTqMHu8
	 vvLYrbMRF3uYw==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so2494977a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:08:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQKjGw50pDr7LFUacluiOP5VDL2jJId3hF/eA/0DHtuU//4E2LJC5NKVVwJZJxyF/nzqkSJPu7pBoWy8gY/uD4@lists.infradead.org
X-Gm-Message-State: AOJu0YzfQKU2Y8PKp4meb4oUgBDqy5l3o8q48VZwlxKNL/kod6XrpvYB
	CYPJusGhLxkao0oJZW94x8r41x2CgZsujr2aiqJPcGtagQn1GsQdoswEPKk2m8g/SROQcPRD0U7
	TNM4sdyzuJtS/ca0RFAlm4NFckfR9Iqg=
X-Google-Smtp-Source: AGHT+IFcD0rfNOJ4GvG+wPYTAWMVc/s2zy/BvRbkZK4bJO5tmt19sPbsMOldrWreI07DtS/l8EUtweFn+GaepdyG9dA=
X-Received: by 2002:a17:90b:3a8d:b0:34a:adf1:677d with SMTP id
 98e67ed59e1d1-34f68b64d7cmr8233808a91.9.1767949694052; Fri, 09 Jan 2026
 01:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20260105051311.1607207-1-ebiggers@kernel.org> <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
 <20260108202618.GA2687@sol> <20260109012712.GA730896@google.com>
In-Reply-To: <20260109012712.GA730896@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 Jan 2026 10:08:02 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGQae+SWEgvZTHvoTJueScbqfei1ie_HSC9WyByOwvJUw@mail.gmail.com>
X-Gm-Features: AQt7F2ruRWMLxfzcb-WM7H3sakD6ZAGLYL1ZhftKy0m5nypWRiiegTKEJVDmsew
Message-ID: <CAMj1kXGQae+SWEgvZTHvoTJueScbqfei1ie_HSC9WyByOwvJUw@mail.gmail.com>
Subject: Re: [PATCH 00/36] AES library improvements
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	Holger Dengler <dengler@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 9 Jan 2026 at 02:27, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Jan 08, 2026 at 12:26:18PM -0800, Eric Biggers wrote:
> > On Thu, Jan 08, 2026 at 12:32:00PM +0100, Ard Biesheuvel wrote:
> > > On Mon, 5 Jan 2026 at 06:14, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > This series applies to libcrypto-next.  It can also be retrieved from:
> > > >
> > > >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
> > > >
> > > > This series makes three main improvements to the kernel's AES library:
> > > >
> > > >   1. Make it use the kernel's existing architecture-optimized AES code,
> > > >      including AES instructions, when available.  Previously, only the
> > > >      traditional crypto API gave access to the optimized AES code.
> > > >      (As a reminder, AES instructions typically make AES over 10 times
> > > >      as fast as the generic code.  They also make it constant-time.)
> > > >
> > > >   2. Support preparing an AES key for only the forward direction of the
> > > >      block cipher, using about half as much memory.  This is a helpful
> > > >      optimization for many common AES modes of operation.  It also helps
> > > >      keep structs small enough to be allocated on the stack, especially
> > > >      considering potential future library APIs for AES modes.
> > > >
> > > >   3. Replace the library's generic AES implementation with a much faster
> > > >      one that is almost as fast as "aes-generic", while still keeping
> > > >      the table size reasonably small and maintaining some constant-time
> > > >      hardening.  This allows removing "aes-generic", unifying the
> > > >      current two generic AES implementations in the kernel tree.
> > > >
> > >
> > > Architectures that support memory operands will be impacted by
> > > dropping the pre-rotated lookup tables, especially if they have few
> > > GPRs.
> > >
> > > I suspect that doesn't really matter in practice: if your pre-AESNI
> > > IA-32 workload has a bottleneck on "aes-generic", you would have
> > > probably moved it to a different machine by now. But the performance
> > > delta will likely be noticeable so it is something that deserves a
> > > mention.
> >
> > Sure.  I only claimed that the new implementation is "almost as fast" as
> > aes-generic, not "as fast".
> >
> > By the way, these are the results I get for crypto_cipher_encrypt_one()
> > and crypto_cipher_decrypt_one() (averaged together) in a loop on an i386
> > kernel patched to not use AES-NI:
> >
> >     aes-fixed-time: 77 MB/s
> >     aes-generic: 192 MB/s
> >     aes-lib: 185 MB/s
> >
> > I'm not sure how relevant these are, considering that this was collected
> > on a modern CPU, not one of the (very) old ones that would actually be
> > running i386 non-AESNI code.  But if they are even vaguely
> > representative, this suggests the new code does quite well: little
> > slowdown over aes-generic, while adding some constant-time hardening
> > (which arguably was an undeserved shortcut to not include before) and
> > also using a lot less dcache.
> >
> > At the same time, there's clearly a large speedup vs. aes-fixed-time.
> > So this will actually be a significant performance improvement on
> > systems that were using aes-fixed-time.  Many people may have been doing
> > that unintentionally, due to it being set to a higher priority than
> > aes-generic in the crypto_cipher API.
> >
> > I'll also note that the state of the art for parallelizable AES modes on
> > CPUs without AES instructions is bit-slicing with vector registers.  The
> > kernel has such code for arm and arm64, but not for x86.  If x86 without
> > AES-NI was actually important, we should be adding that.  But it seems
> > clear that x86 CPUs have moved on, and hardly anyone cares anymore.  If
> > for now we can just provide something that's almost as fast as before
> > (and maybe even a lot faster in some cases!), that seems fine.
>
> It's also worth emphasizing that there are likely to be systems that
> support AES instructions but are not using them due to the corresponding
> kconfig options (e.g. CONFIG_CRYPTO_AES_NI_INTEL) not being set to 'y'.
> As we know, missing the crypto optimization kconfig options is a common
> mistake.  This series fixes that for single-block AES.
>
> So (in addition to the aes-fixed-time case) that's another case that
> just gets faster, and where the difference between aes-generic and the
> new generic code isn't actually relevant.
>

Fair enough. Thanks for the elaboration.

