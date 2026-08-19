Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D659C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 04:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3lN00sDqq9naUBVfFMsgE1oQH5Kl3jtgudvWaOQ+PI=; b=W2mX4ywNK+l6nLUH26Z6fJLHBs
	1KC3VjURUk3DUUZ18xMP38e28KvX/YmcZDhP+wigrPgz8Y6WN9TwEly9v7gTtSv6O/gTHA0C+LMBP
	A/mgBvWXJwLbsqCl3LpleNxjvO4fvI0zi8nEpJrU7UAFHn9vvKCaB84aF5WCmrcwQfJe42Sg8+aI8
	oC3Y1hC0Y+J1eiBLbWVuZyxW7YEJDmBHAy8rjD+Sj5RfBS0j3ZTjuctxKa26CEJiJt/hZl+wN52bE
	NlwtODwA9iUhQ8j7BhaCbUr5zKEh8imB+dLWT0hKQ/GY9Rocpap2BzlEa9meKb4D5kNGAcENa3+KZ
	qB3zJFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYMK-00000008znP-124T;
	Wed, 19 Aug 2026 04:57:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYMI-00000008zmz-0xqb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 04:57:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49557167508so5946505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 21:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787115420; x=1787720220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3lN00sDqq9naUBVfFMsgE1oQH5Kl3jtgudvWaOQ+PI=;
        b=fm0leYvOFPB4/AG8o9F8uEN/16aKHQOZ1pOQDhfwqAbzM2BMQ7Qro3nz0fa/FgGpXS
         anyDYP461rWdyLzoanpy3kmczSiVx4Cd/HWeL0eYobVR7tipL75xoIxRS3nJ05TsnBmw
         XnWiRP2i+0sRY96lpBpFa66+RQ63X5CFZ+05fPkLe7ZSKZjU8zj8qGEtuODERB+Z/rXh
         kcF0Y1GUMsF7SFX870NIs6v9fn1/TcrfYEXt8Q4kfCuQp5s0Izp2WpYzf/Vc/jAZCE66
         BzHooe7O8xL2SUVGt+GWcikYmMWX2JChRf3rh+slkqIj7ulOLVdUm2sqBI5SUbswVz0R
         Wd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787115420; x=1787720220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3lN00sDqq9naUBVfFMsgE1oQH5Kl3jtgudvWaOQ+PI=;
        b=h8a6nbwm+86nXP5ugykez1t3CJOqgVwD2Rp1mBQHTfHrRvk4odUqdH9SADxBBhEuWY
         FLgdWQaI0wbNgl18FtcPcj83tdaPw9j24GJ2oclVNzYzoHk+r0L2mKAJ5wu9b1m0IXMm
         jB0zuTe1Ugq/9HCbtG4Ht+mlwGF97zJ9LHYMmDq+QqywSLl4HIoYjJvZCJ42Fl+VaLs5
         W0wNUIqoJs7C/bnn3E+7u3l5gD5yC8M+62zUhecQBjboi5iQMGm0Vu7xTHS4pfy6vtiS
         Sy/5PDP12fIvxXNBxZh9aFsHt6Cj32q/9F9YLwMIar3Vg3vUy8F3IUNIfz8wBAP/DOVY
         TIhw==
X-Forwarded-Encrypted: i=1; AHgh+RplUbQbviKmiFWaUrM9GbRPl8dw1sAZdXDFLwq5KiAcThVRQIUvtiphQ/dBY8OiXn36yKVvfs6GQWYFRb8ijW25@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv/eODFt/EVAkw0l5/bHa8Mp94rMedE6HvP20XF4oVfKRlRns8
	1mdOd9BPByVQiBviMWw1n6kczOGWeS8m4BplpkYBF9Q/HclKX4pFA4Xk
X-Gm-Gg: AR+sD101ston4k2Go3tLWRKUmq+XbxpRI4VwSjCpqjsHpRuNAfTTaeHhbDYURkloOiF
	kJIl6tmwYuPrvnPyVK1E9e/d4X+Sa/lTfVm5WTunDsUgIfevOwI5iQAZwGaQ5NQkziLujnnynFv
	Z4Dsw2RlNji21wu61X6rHSsaF9Xz1FEuGHAFcHsFYRFiikHjJ9cUS2dAViD9+ZbvFbRsgfLxfai
	aS5JWTUfwCsg54gUoI9NMw63hJEVlBCQxQXOXEKbcTzIMhFNT6qXRbVuK8wLEuTulC8/XpgipTM
	0haKdpXQixfleuYSEElMWA+xDvospiySNnAdAngEGVxDJ18krC6ZzlEatkG4UdZ7XKneuqo0aS/
	0HmQStjnoiSaSQSqAtb6th1y1DsONf4UhBs+MpI6T87mmhnquZM5RZbcrCZuxzi9FmJcZLQPSPU
	ve+5QtYVl6K6srByfS9OHnEf9pnqEtXUju1xP8D5e/WVz0ocOOZBD8+kHqXaxfeAcoyszTBnI7A
	zlp7fYMQYMh2g6EwB3didplj0HGNyA4X4nSI+00GfZMdbscg3NObCdW2Ix8okhloX8afG2VGrgi
	5LCybTHLbicbXv7cxJ7euyJ9jtTPNSnz89ziWsrWyKkL41dzmMZwWQF4usS7E/uQtgVkBA==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499aa20c7b1mr26475385e9.15.1787115419664;
        Tue, 18 Aug 2026 21:56:59 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9def415sm24471045e9.2.2026.08.18.21.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 21:56:58 -0700 (PDT)
Date: Wed, 19 Aug 2026 06:56:56 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Message-ID: <aoU2ezSYVbOw0hun@gmail.com>
References: <20260817000231.21311-1-kmehltretter@gmail.com>
 <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
 <aoPKzPb9YUVULlXG@gmail.com>
 <e3c463a1-81ae-4bef-b65b-fea1a4eda5bc@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3c463a1-81ae-4bef-b65b-fea1a4eda5bc@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_215702_304125_A7CA6B58 
X-CRM114-Status: GOOD (  27.01  )
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

On Tue, Aug 18, 2026 at 09:31:14AM +0100, Arnd Bergmann wrote:
> On Tue, Aug 18, 2026, at 05:22, Karl Mehltretter wrote:
> > On Mon, Aug 17, 2026 at 11:15:33AM +0100, Arnd Bergmann wrote:
> <
> > The 4 GiB wraparound case is possible with a rather unusual arm64
> > kernel configuration, and correctly handling an individual word
> > crossing the boundary would require byte accesses. That seems too
> > contrived to justify the extra complexity here.
> 
> I don't understand, what is special about the configuration?
> Isn't this exactly the case you were trying to address with
> the compat_ptr() hack?
> 

Your first reply also made me realize my patch was too complicated
for the original bug.

I now used:

  CONFIG_EXPERT=y
  CONFIG_ARM64_64K_PAGES=y
  CONFIG_COMPAT=y
  CONFIG_KUSER_HELPERS=y
  CONFIG_COMPAT_ALIGNMENT_FIXUPS=y
  CONFIG_DEFAULT_MMAP_MIN_ADDR=0

With 64K pages and KUSER_HELPERS, compat TASK_SIZE is 4 GiB. The last
64K is the kuser mapping. The test maps the first 64K at zero, so memory
exists on both sides of the wrap.

This does not work with the normal 4K-page config because the top page is
outside the compat user space. EXPERT is needed for COMPAT with 64K
pages.

On native ARM32, the kernel is mapped at the top of the address space.
Userspace cannot reach the 4 GiB wrap.

I tested three versions:

  v1:  with u32 addresses and compat_ptr() (this patch)
  v1+: v1 plus byte reads for a word crossing 4 GiB
  v2:  only make nr_regs unsigned long (as you suggested)

The results on the Pi 400 were:

                                          v1       v1+      v2
  ordinary decrementing LDMDB             PASS     PASS     PASS
  hardware LDR at 0xfffffffd              PASS     PASS     PASS
  hardware LDRD at 0xfffffffc             PASS     PASS     PASS
  emulated LDRD word straddles 4 GiB      SIGBUS   PASS     SIGBUS
  emulated LDMIA word straddles 4 GiB     SIGBUS   PASS     SIGBUS
  emulated LDMDB underflow and straddle   SIGBUS   PASS     SIGBUS
  LDRD post-index writeback wrap          PASS     PASS     PASS

QEMU gives the same results.

The hardware LDR test does not use compat_alignment.c. The Cortex-A72
runs the LDR at 0xfffffffd directly. It reads 0xfffffffd, 0xfffffffe,
0xffffffff and zero successfully.

For example, LDMDB with two registers and a base of 5 starts at:

  5 - 8 modulo 2^32 = 0xfffffffd

v1 calculates this address. v2 calculates 0xfffffffffffffffd instead.

compat_ptr() fixes the start address, but not the whole access. A
get_user(u32) at 0xfffffffd still tries to read four continuous bytes up
to 0x100000000, so access_ok() rejects it.

This is why v1 also gets SIGBUS. It has the correct start address, but
still uses one get_user(u32). v1+ reads the four bytes separately and
wraps the last byte to zero.

The LDRD at 0xfffffffc wraps between its two words. But it is 4-byte
aligned and runs directly, so it does not test the alignment handler.

Any multiword access going through the handler is not 4-byte aligned. If
it crosses 4 GiB, at least one u32 access also crosses it. So v1 gets the
address calculation right, but get_user(u32) or put_user(u32) still
fails.

I am not sure who would use an unaligned multiword access wrapping
at 4 GiB and expect the compat alignment handler to fix it.

v2 still keeps the normal fixup path. Successful fixups are counted by
the perf alignment-faults event. If a fixup fails, the task gets SIGBUS
and the normal arm64 fault logging can report it.

So v2 is enough for the original decrementing LDM/STM bug. v1 does not
add a working wrap case by itself. I think the small v2 fix makes more
sense. v1+ would be the theoretically complete version for AArch32 wrap
handling...

Am I getting this right now, or am I still missing a case?

Karl

