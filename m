Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8E5C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 18:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Let4Q3el9jM1Xi0HwmGhei27/6Q/PCmg+tofSw5IIg=; b=qEKeSM9Br+1xGMI7pza176lN2c
	dymNGVllV+sIHFO/f2RqGpdaNe/zSZnK3zdkh+cT8anjI2rKUZ8aQNlVBkLr7b0kic2yk0R6kMKKG
	pbeOIhf0jwkwRilc/0mSglxcrEIIcEUFodl937fgVpCt7KAQmOJ0QumMAOVAlyMM54DHyONA+LAV7
	ccw+t53iZkdYWiuLFLU9+owoanI8fTeoly8YP20M0lVnW1AVnFCekXBYaK5lPXyev4RenaLRInBDp
	3VIuvQDXm+hg0yLk0sxIvk56svydFTJKq1+MEQiGHsJJ9zdy7lB3fgJB+HgyUir8kKoXTq71L21xU
	t8GrAFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twPuj-00000001Zwa-39VH;
	Sun, 23 Mar 2025 18:19:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twPt2-00000001Zkx-2y23
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 18:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2B5343892
	for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 18:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92B7C4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742753847;
	bh=DnwlcnrmTvJn4x6Jhu4lPS5Jhc5VMN4fOZX67Zowe28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aOA/7NhtL5afDUxB+Zhh+QBnY+LwpQJbqtjSH6/f0XKI9u9yHS8Fy6dZOGSGOBDNF
	 Yo7o8R4WnRz3l9p/NdlRFPj5rCCzvDr7BSyHE2zABYhWGBbsYGCg3fFo3QgFJxIptJ
	 qGtyvOPq+jpo8Za7Ta5jL8YhzOt+K0JyPYIICFlTcmq/Wpj09RtsURrtf5atD7v9Gs
	 SBeOElN9wucBbLZI2M2JpI2QYkbM4EUeFPaE3LBQm54IPWgvKnLJ1jSVoWX+aMelBf
	 g/YJzRe3VkQ9c+cbty53T19yVHaBjH61CmhXB+p0Wf9DE7+gClaACxKKt0cwGXIX2p
	 lE9e5dA4IxG/Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54954fa61c8so3845358e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 11:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2xVQxUAF/K9u75MgUCgaPLCGmU6WXxLGfviPbXIetfizOS5e2sizS65ijhbLVyHwEMkJZH0YLrL2XV5wXI46j@lists.infradead.org
X-Gm-Message-State: AOJu0YyPdrxQdbSPR6NyZKz/0as8Xk0KY2u1N3PXE6tkMUIS4rQbeCoz
	0fjjH6hcfQ7FSVXydML4Hp2hAZpuQ1zocPI1I8SNbu5ZabM86yL+Q/rzyl8dawoc6vQcqWNOu85
	hMhyFN4rdt83q+YyKQG6KHXH26fo=
X-Google-Smtp-Source: AGHT+IETHfg8ib2tQB5DP02LtHyjTXmPdsydvih0XDlfjgyQtoziDZQMtCctILBs1DwoARqUA+qqI6epKDqy+wlyiFE=
X-Received: by 2002:a05:6512:1598:b0:549:5769:6ad8 with SMTP id
 2adb3069b0e04-54ad6470a7dmr3513782e87.4.1742753846190; Sun, 23 Mar 2025
 11:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241202012056.209768-1-ebiggers@kernel.org> <20241202012056.209768-9-ebiggers@kernel.org>
 <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net> <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
 <20250323171243.GA852@quark.localdomain>
In-Reply-To: <20250323171243.GA852@quark.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 23 Mar 2025 19:17:14 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGMtpMuiJqwWVuWDhRrb-dXC30Fj0vu0vU=O6-gGR0FWg@mail.gmail.com>
X-Gm-Features: AQ5f1Jq9h71nypQ2vOBZhli703EaGsNLFv7huy-pmiN-c5U6P8ctOyu2HMEj9rU
Message-ID: <CAMj1kXGMtpMuiJqwWVuWDhRrb-dXC30Fj0vu0vU=O6-gGR0FWg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] lib/crc_kunit.c: add KUnit test suite for CRC
 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>, Vinicius Peixoto <vpeixoto@lkcamp.dev>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_111728_785969_8908C053 
X-CRM114-Status: GOOD (  41.12  )
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

On Sun, 23 Mar 2025 at 18:12, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sun, Mar 23, 2025 at 04:35:29PM +0100, Ard Biesheuvel wrote:
> > On Sat, 22 Mar 2025 at 15:33, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Hi,
> > >
> > > On Sun, Dec 01, 2024 at 05:20:52PM -0800, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Add a KUnit test suite for the crc16, crc_t10dif, crc32_le, crc32_be,
> > > > crc32c, and crc64_be library functions.  It avoids code duplication by
> > > > sharing most logic among all CRC variants.  The test suite includes:
> > > >
> > > > - Differential fuzz test of each CRC function against a simple
> > > >   bit-at-a-time reference implementation.
> > > > - Test for CRC combination, when implemented by a CRC variant.
> > > > - Optional benchmark of each CRC function with various data lengths.
> > > >
> > > > This is intended as a replacement for crc32test and crc16_kunit, as well
> > > > as a new test for CRC variants which didn't previously have a test.
> > > >
> > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> > > > Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > ...
> > > > +
> > > > +             nosimd = rand32() % 8 == 0;
> > > > +
> > > > +             /*
> > > > +              * Compute the CRC, and verify that it equals the CRC computed
> > > > +              * by a simple bit-at-a-time reference implementation.
> > > > +              */
> > > > +             expected_crc = crc_ref(v, init_crc, &test_buffer[offset], len);
> > > > +             if (nosimd)
> > > > +                     local_irq_disable();
> > > > +             actual_crc = v->func(init_crc, &test_buffer[offset], len);
> > > > +             if (nosimd)
> > > > +                     local_irq_enable();
> > >
> > > This triggers a traceback on some arm systems.
> > >
> > > [    7.810000]     ok 2 crc16_benchmark # SKIP not enabled
> > > [    7.810000] ------------[ cut here ]------------
> > > [    7.810000] WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
> > > [    7.810000] Modules linked in:
> > > [    7.810000] CPU: 0 UID: 0 PID: 1145 Comm: kunit_try_catch Tainted: G                 N 6.14.0-rc7-00196-g88d324e69ea9 #1
> > > [    7.810000] Tainted: [N]=TEST
> > > [    7.810000] Hardware name: NPCM7XX Chip family
> > > [    7.810000] Call trace:
> > > [    7.810000]  unwind_backtrace from show_stack+0x10/0x14
> > > [    7.810000]  show_stack from dump_stack_lvl+0x7c/0xac
> > > [    7.810000]  dump_stack_lvl from __warn+0x7c/0x1b8
> > > [    7.810000]  __warn from warn_slowpath_fmt+0x19c/0x1a4
> > > [    7.810000]  warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
> > > [    7.810000]  __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
> > > [    7.810000]  crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
> > > [    7.810000]  crc_t10dif_wrapper from crc_main_test+0x178/0x360
> > > [    7.810000]  crc_main_test from kunit_try_run_case+0x78/0x1e0
> > > [    7.810000]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
> > > [    7.810000]  kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
> > > [    7.810000]  kthread from ret_from_fork+0x14/0x28
> > > [    7.810000] Exception stack(0xe3651fb0 to 0xe3651ff8)
> > > [    7.810000] 1fa0:                                     00000000 00000000 00000000 00000000
> > > [    7.810000] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > [    7.810000] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > > [    7.810000] irq event stamp: 29
> > > [    7.810000] hardirqs last  enabled at (27): [<c037875c>] __local_bh_enable_ip+0xb4/0x194
> > > [    7.810000] hardirqs last disabled at (28): [<c0b09684>] crc_main_test+0x2e4/0x360
> > > [    7.810000] softirqs last  enabled at (26): [<c032a3ac>] kernel_neon_end+0x0/0x1c
> > > [    7.810000] softirqs last disabled at (29): [<c032a3c8>] kernel_neon_begin+0x0/0x70
> > > [    7.810000] ---[ end trace 0000000000000000 ]---
> > > [    8.050000]     # crc_t10dif_test: pass:1 fail:0 skip:0 total:1
> > >
> > > kernel_neon_end() calls local_bh_enable() which apparently conflicts with
> > > the local_irq_disable() in above code.
> > >
> >
> > This seems to be an oversight on my part. Can you try the below please?
> >
> > diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
> > index 82191dbd7e78..56ddbd3c4997 100644
> > --- a/arch/arm/include/asm/simd.h
> > +++ b/arch/arm/include/asm/simd.h
> > @@ -4,5 +4,6 @@
> >
> >  static __must_check inline bool may_use_simd(void)
> >  {
> > -       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq();
> > +       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
> > +              !in_hardirq() && !irqs_disabled();
> >  }
>
> Thanks Ard, you beat me to it.  Yes, may_use_simd() needs to be consistent with
> kernel_neon_begin().  On x86 there is a case where the equivalent function is
> expected to work when irqs_disabled(), but if there is no such case on arm this
> fix looks good.  Can you send it out as a formal patch?  Presumably for the arm
> maintainer to pick up.
>

Sure.

On other architectures, we might just turn this logic around, and only
disable softirqs when IRQs are enabled, as otherwise, there is no
need: we don't care about whether or not IRQs are disabled, only the
softirq plumbing that we need to call into does, and no softirqs can
be delivered over the back of a hard IRQ when those are disabled to
begin with.

> > However, this test code also appears to assume that SIMD is forbidden
> > on any architecture when IRQs are disabled, but this not guaranteed.
>
> Yes, to reliably test the no-SIMD code paths, I need to finish refactoring the
> crypto_simd_disabled_for_test stuff to be disentangled from the crypto subsystem
> so that crc_kunit.c can use it.  It's on my list of things to do, and I'm
> planning to get it done in 6.16.  Disabling hardirqs is just a trick to get
> there more easily on some architectures.  But as this shows it's a useful test
> to have anyway, so we'll want to keep that too.  The CRC functions need to work
> in any context, and any context that we can easily test we should do so.
>

Sounds good.

