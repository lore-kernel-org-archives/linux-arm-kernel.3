Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23079C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Llpo7dgERhb0cpJFa90lKu2LCfaqFaqyO+bj0pWKKDc=; b=yEJH3TEQjV8SXtCCsOeuYmXj35
	6SiLHdwIILtJqSohqNdabo1q2qnc5aFiNE4tUDrpKif83CBQWgQxkrvgod9+/Qgtq0VMiyJ/QMIlj
	cIo7Af4965kL2bszixdgncsLINec4KU+4nlxEcY9n7fG0+LSsE0xEIFG9p/BMbB8KVuNmJrOIdJhR
	TIXXl6EXuMEwVpKM7EuBYy9z/3tOrQJnEL95k9FgkvEqf7Ei6XMzIF24DvmDVdAisGunrWSuNwKdw
	IsC3dVl7wPyo591ixNvPyzqVSIbEIV5bgmPN+NuVZHDsmXgCTNqLkctvFMF6HtloZVKXx0ni2HWQj
	ryocW4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1TM-0000000G32l-2T7w;
	Fri, 14 Feb 2025 19:35:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1Rr-0000000G2lr-3lq7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 19:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04A0DA42BCF;
	Fri, 14 Feb 2025 19:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373B0C4CED1;
	Fri, 14 Feb 2025 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739561642;
	bh=CKl2EjbG0ELi5S1ZKbHAQc1rq0HGkpxGF4N4RdLKqvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fuj7Bn2kcQmMxqPwhTbYHuB1Ns/qrQ64TiXnLfUhCbSLRweoEB7M+TcBmIQX0d+Iv
	 81TlVLC4l4Wbz1szemM9E19vqnOqY2Sj2MoNkoDWtm4bJBuVR3aXNi+YIcb5NCniYN
	 /WKkGAA8OhIL7eIMotQ2QIWAh5cxMoKDKJg0STu1xOqkO/HWgKZLOJJRm+/hxF1UeY
	 ee5pnJst8fkjdBLBmUqIv+g6F1A0CE373Xc5g10n5ZkbYLIVD3ldtFF5QwyxsIsP6s
	 t6YSDtoW9QIW93Zq08gVfBSsAPD4+x9TQMPUcTTYiGPIMYnI67A72KDC105HHLcJla
	 QgtNABJFzhtYg==
Date: Fri, 14 Feb 2025 11:34:00 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250214193400.j4hp45jlufihv5eh@jpoimboe>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org>
 <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe>
 <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_113403_998360_6912C59C 
X-CRM114-Status: GOOD (  13.50  )
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

On Fri, Feb 14, 2025 at 09:51:41AM -0800, Song Liu wrote:
> > Ignorant arm64 question: is the module's text further away from slab
> > memory than vmlinux text, thus requiring a different instruction (or
> > GOT/TOC) to access memory further away in the address space?
> 
> It appears to me the module text is very close to vmlinux text:
> 
> vmlinux: ffff8000800b4b68 T copy_process
> module: ffff80007b0f06d0 t copy_process [livepatch_always_inline_special_static]

Hm... the only other thing I can think of is that the klp relas might be
wrong somewhere.  If you share patched.o and .ko files from the same
build I could take a look.

BTW, I realized the wrong function size shown in the WARNING stack trace
is probably just due to a kallsyms quirk.  It calculates a symbol's size
by subtracting its start address from the next symbol's start address.
It doesn't actually use the ELF symbol size.  So the next symbol after
copy_process() in the loaded module's address space might just be far
away.

That kallsyms issue has caused other headaches.  It really needs to be
fixed to use the actual ELF symbol size.

-- 
Josh

