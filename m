Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0431C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 03:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmeIBIrovCZu0zm7zk1FJ57d7hjR3UrOOt26bU7uTfU=; b=Z57cAr1NGMvyfzadMxtdbQh7qX
	uKwD4bRtRMpkFLbN62sZ/Y2hZx/N9JcHo0IEsAusyLQs0ttNMas/uGqRfZ6HSwi+qXQ3Y+vP6Lijd
	VxYMJM+NTXWmzlpvplMjI4S7S1lLa4gCJGByVpDtcHF8LRr4F3EuhXJGpz3K8t7+mRS5phTIgJ6lX
	ZDmM6dmvW6jcuYLBpfmiZVehQL0F3ic+c6b40eP6LCbHjwaPPNgW5RjvHDqL3f9Z280W+Cwo6jd+f
	zVREwJeoTXbSkIpL/jeLlqdFBVkxmcdZ0FvfxLJj4JtMSxl5Nf9I0RmRTGLECwdEab6VvCIEnLPQw
	yT82wjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQdvW-00000002AUh-0Sax;
	Sun, 15 Jun 2025 03:20:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQdtE-00000002AMx-0Kjp;
	Sun, 15 Jun 2025 03:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6CD044A48;
	Sun, 15 Jun 2025 03:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34907C4CEED;
	Sun, 15 Jun 2025 03:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749957514;
	bh=QyNmeeqe/QCejIB1o+4hWQjoOtCd19AfCElA8Pxgmf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPYTBuCd7X45YU//pkrHZijODUDPe4eBXgOI24hNeaiz4dbjbb/3k5BQs1Xc6Fr2G
	 1SUuS34Vh6YlA3y4WIOmnc4WfVDp48/8YLKBe6aqQhXOnefPSHjIKv2Q/Z3IVnq3Hb
	 /sbJrNGZlRTYza+Mt9gtQEwDcX0tW6FwYwQK3fWqyZEOw58reqeyiqce64xdk3csvB
	 T1sYLtQc6KtNQoM975rjkVarhrrjsKE/VcsUDyELJ/EoeWCL4NAn8Q+rcrYDoz6k3b
	 pZWCNS2I90e08jz9scf576cleOvu8Rx8hgtaV7hycc5/OzK21YtwWT4NF2/+EHEREh
	 UnZExOsX46Q9A==
Date: Sat, 14 Jun 2025 20:18:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
Message-ID: <20250615031807.GA81869@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <aEvmmr0huGGd2Psv@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEvmmr0huGGd2Psv@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_201836_160613_C20075F9 
X-CRM114-Status: GOOD (  20.15  )
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

On Fri, Jun 13, 2025 at 04:51:38PM +0800, Herbert Xu wrote:
> On Thu, Jun 12, 2025 at 10:54:39PM -0700, Eric Biggers wrote:
> >
> > Actually, crypto_ahash::base::fb is initialized if CRYPTO_ALG_NEED_FALLBACK,
> > which many of the drivers already set.  Then crypto_ahash_update() calls
> > ahash_do_req_chain() if the algorithm does *not* have
> > CRYPTO_AHASH_ALG_BLOCK_ONLY set.  Which then exports the driver's custom state
> > and tries to import it into the fallback.
> > 
> > As far as I can tell, it's just broken for most of the existing drivers.
> 
> This fallback path is only meant to be used for drivers that have
> been converted.  But you're right there is a check missing in there.
> 
> Thanks,
> 
> ---8<---
> Ensure that drivers that have not been converted to the ahash API
> do not use the ahash_request_set_virt fallback path as they cannot
> use the software fallback.
> 
> Reported-by: Eric Biggers <ebiggers@kernel.org>
> Fixes: 9d7a0ab1c753 ("crypto: ahash - Handle partial blocks in API")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Okay.  Out of curiosity I decided to actually test the Qualcomm Crypto Engine
driver on a development board that has a Qualcomm SoC, using latest mainline.

Even with your patch applied, it overflows the stack when running the crypto
self-tests, apparently due to crypto/ahash.c calling into itself recursively:

    [    9.230887] Insufficient stack space to handle exception!
    [    9.230889] ESR: 0x0000000096000047 -- DABT (current EL)
    [    9.230891] FAR: 0xffff800084927fe0
    [    9.230891] Task stack:     [0xffff800084928000..0xffff80008492c000]
    [    9.230893] IRQ stack:      [0xffff800080030000..0xffff800080034000]
    [    9.230894] Overflow stack: [0xffff000a72dd2100..0xffff000a72dd3100]
    [    9.230896] CPU: 6 UID: 0 PID: 747 Comm: cryptomgr_test Tainted: G S                  6.16.0-rc1-00237-g84ffcd88616f #7 PREEMPT 
    [    9.230900] Tainted: [S]=CPU_OUT_OF_SPEC
    [    9.230901] Hardware name: Qualcomm Technologies, Inc. SM8650 HDK (DT)
    [    9.230901] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
    [    9.230903] pc : qce_ahash_update+0x4/0x1f4
    [    9.230910] lr : ahash_do_req_chain+0xb4/0x19c
    [    9.230915] sp : ffff800084928030
    [    9.230915] x29: ffff8000849281a0 x28: 0000000000000003 x27: 0000000000000001
    [    9.230918] x26: ffff0008022d8060 x25: ffff000800a33500 x24: ffff80008492b8d8
    [    9.230920] x23: ffff80008492b918 x22: 0000000000000400 x21: ffff000800a33510
    [    9.230922] x20: ffff000800b62030 x19: ffff00080122d400 x18: 00000000ffffffff
    [    9.230923] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
    [    9.230925] x14: 0000000000000001 x13: 0000000000000000 x12: 0000000000000000
    [    9.230927] x11: eee1c132902c61e2 x10: 0000000000000063 x9 : 0000000000000000
    [    9.230928] x8 : 0000000000000062 x7 : a54ff53a3c6ef372 x6 : 0000000000000400
    [    9.230930] x5 : fefefefefefefefe x4 : ffff000800a33510 x3 : 0000000000000000
    [    9.230931] x2 : ffff000805d76900 x1 : ffffcea2349738cc x0 : ffff00080122d400
    [    9.230933] Kernel panic - not syncing: kernel stack overflow
    [    9.230934] CPU: 6 UID: 0 PID: 747 Comm: cryptomgr_test Tainted: G S                  6.16.0-rc1-00237-g84ffcd88616f #7 PREEMPT 
    [    9.230936] Tainted: [S]=CPU_OUT_OF_SPEC
    [    9.230937] Hardware name: Qualcomm Technologies, Inc. SM8650 HDK (DT)
    [    9.230938] Call trace:
    [    9.230939]  show_stack+0x18/0x24 (C)
    [    9.230943]  dump_stack_lvl+0x60/0x80
    [    9.230947]  dump_stack+0x18/0x24
    [    9.230949]  panic+0x168/0x360
    [    9.230952]  add_taint+0x0/0xbc
    [    9.230955]  panic_bad_stack+0x108/0x120
    [    9.230958]  handle_bad_stack+0x34/0x40
    [    9.230962]  __bad_stack+0x80/0x84
    [    9.230963]  qce_ahash_update+0x4/0x1f4 (P)
    [    9.230965]  crypto_ahash_update+0x17c/0x18c
    [    9.230967]  crypto_ahash_finup+0x184/0x1e4
    [    9.230969]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230970]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230972]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230973]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230974]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230976]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230977]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230979]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230980]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230981]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230983]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230984]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230986]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230988]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230989]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230991]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230993]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230995]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230996]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230998]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.230999]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.231001]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.231002]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.231004]  crypto_ahash_finup+0x1ac/0x1e4
    [    9.231005]  crypto_ahash_finup+0x1ac/0x1e4

    [the above line repeated a few hundred times more...]

    [    9.231571]  test_ahash_vec_cfg+0x508/0x8f8
    [    9.231573]  test_hash_vec+0xb8/0x21c
    [    9.231575]  __alg_test_hash+0x144/0x2e0
    [    9.231577]  alg_test_hash+0xc0/0x178
    [    9.231578]  alg_test+0x148/0x5ec
    [    9.231579]  cryptomgr_test+0x24/0x40
    [    9.231581]  kthread+0x12c/0x204
    [    9.231583]  ret_from_fork+0x10/0x20
    [    9.231587] SMP: stopping secondary CPUs
    [    9.240072] Kernel Offset: 0x4ea1b2a80000 from 0xffff800080000000
    [    9.240073] PHYS_OFFSET: 0xfff1000080000000
    [    9.240074] CPU features: 0x6000,000001c0,62130cb1,357e7667
    [    9.240075] Memory Limit: none
    [   11.373410] ---[ end Kernel panic - not syncing: kernel stack overflow ]---

After disabling the crypto self-tests, I was then able to run a benchmark of
SHA-256 hashing 4096-byte messages, which fortunately didn't encounter the
recursion bug.  I got the following results:

    ARMv8 crypto extensions: 1864 MB/s
    Generic C code: 358 MB/s
    Qualcomm Crypto Engine: 55 MB/s

So just to clarify, you believe that asynchronous hash drivers like the Qualcomm
Crypto Engine one are useful, and the changes that you're requiring to the
CPU-based code are to support these drivers?

- Eric

