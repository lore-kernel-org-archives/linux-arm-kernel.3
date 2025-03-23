Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED327C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzGPF+jAuoVNNvZKw8AOUI3kCWKHyeZTsTlWTjdMBUs=; b=q9XjnkSIhOeVD2qncOQSoK98f5
	zUz6i+1RwilhyEQG7HI4UFqRPFxoLjVVi/pemyUd/9gM+dcSMtxjU/HD0WV6Un95PtE/4OrtKFNq1
	BE+RgZGEMBqGk/M16AeTOX+zRNN2+bhgpsNLS9j6n7tqcbuB64Y9+AgUHYSUvdExItRc0NGX1rVfG
	fDLdlvd7cWq6G7DPygDuGqjZLvtvsMeObHMTC5M9jSrQNhUahmKOvAjNmo4odqRPxfHKLeTe0QREv
	up+4A1afTGfO+YxsbqmGRUpyhndbGtzrHoCg512fzFFt5C4WNGTq+5dyzh13XLNCYWtXYkGXAW6eS
	ZpEf9HxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twNOC-00000001QBb-2vNO;
	Sun, 23 Mar 2025 15:37:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twNMX-00000001Q47-1Lo3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 15:35:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B9735C5D4C
	for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D92C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742744142;
	bh=2N2/cZq9PK/1OD9D7rI0owgZtoMseqZwZPwvsoNCvXg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YzmqxlQZ/kTC9/X6Nbi0GB4G6dV1X5hxISwkHmhgwt+ADGF1rsm2my+JKh4mm7gTO
	 +Wi+rZl6qtd7joIEhSO4JjncVE0ybEAvVK7JCS4uu6Boqvk1pR24pn6AMMZ15HCWIh
	 rKE/PGJWjn9J9RMSeQa2SpYcm0g9hTT/wjdQG2e/2NDeKmx1GP1KD2uen16RiKiwFV
	 JozAfd8P1mxnh01D1tCnXGKy3+fJZSk8nD3yn9ulQ4y6XbpS33orG9bW0i6oV4A5Vr
	 Pf23igPbAiWHiFXd2YZjJAiwLavwGSqTFn703gDMtMv/2QePdOgR+mET98nJCNPmOG
	 uweKQUDjq2hMA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so36957531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 08:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8JuyAw4baiEupydmXpxVZVoO4g2pWyKqoHLbC6uUTzGXcI8EE2Rw03MJOSVXNlHJk1mrllBN0HpU8M0GgR9Fr@lists.infradead.org
X-Gm-Message-State: AOJu0YwYgjU94CPXE+qBawQigyB/tekqOh6PFhzfn2SHuTL3xVwxO8sp
	zVhdFeUHeCplXrNtb+Pef+lAW3WRogQaRPZce/fHpDgnIw14yJAjfaqXxtRl7P17wRxfS7jX6BJ
	gK5KLEt+bHqsya3/ZoH1PwkKTSEI=
X-Google-Smtp-Source: AGHT+IFLcZeXGkTxlRz0UlNugKaJuCUYhZIJxwtZuNGOXiFAM7FV0N99brYUCnXNyXzlAo8JVSr/VCRroadSoUTiddY=
X-Received: by 2002:a2e:be85:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-30d7e2ba306mr36637601fa.26.1742744140424; Sun, 23 Mar 2025
 08:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241202012056.209768-1-ebiggers@kernel.org> <20241202012056.209768-9-ebiggers@kernel.org>
 <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net>
In-Reply-To: <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 23 Mar 2025 16:35:29 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
X-Gm-Features: AQ5f1JoDr3TNnxKgMP4guUoXVQFse2BD4z6mD7wYVwiWtnHwnC7PDo4J2TBYgEQ
Message-ID: <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] lib/crc_kunit.c: add KUnit test suite for CRC
 library functions
To: Guenter Roeck <linux@roeck-us.net>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>, Vinicius Peixoto <vpeixoto@lkcamp.dev>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_083545_476888_91A884FE 
X-CRM114-Status: GOOD (  24.63  )
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

On Sat, 22 Mar 2025 at 15:33, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Sun, Dec 01, 2024 at 05:20:52PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Add a KUnit test suite for the crc16, crc_t10dif, crc32_le, crc32_be,
> > crc32c, and crc64_be library functions.  It avoids code duplication by
> > sharing most logic among all CRC variants.  The test suite includes:
> >
> > - Differential fuzz test of each CRC function against a simple
> >   bit-at-a-time reference implementation.
> > - Test for CRC combination, when implemented by a CRC variant.
> > - Optional benchmark of each CRC function with various data lengths.
> >
> > This is intended as a replacement for crc32test and crc16_kunit, as well
> > as a new test for CRC variants which didn't previously have a test.
> >
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> > Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> ...
> > +
> > +             nosimd = rand32() % 8 == 0;
> > +
> > +             /*
> > +              * Compute the CRC, and verify that it equals the CRC computed
> > +              * by a simple bit-at-a-time reference implementation.
> > +              */
> > +             expected_crc = crc_ref(v, init_crc, &test_buffer[offset], len);
> > +             if (nosimd)
> > +                     local_irq_disable();
> > +             actual_crc = v->func(init_crc, &test_buffer[offset], len);
> > +             if (nosimd)
> > +                     local_irq_enable();
>
> This triggers a traceback on some arm systems.
>
> [    7.810000]     ok 2 crc16_benchmark # SKIP not enabled
> [    7.810000] ------------[ cut here ]------------
> [    7.810000] WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
> [    7.810000] Modules linked in:
> [    7.810000] CPU: 0 UID: 0 PID: 1145 Comm: kunit_try_catch Tainted: G                 N 6.14.0-rc7-00196-g88d324e69ea9 #1
> [    7.810000] Tainted: [N]=TEST
> [    7.810000] Hardware name: NPCM7XX Chip family
> [    7.810000] Call trace:
> [    7.810000]  unwind_backtrace from show_stack+0x10/0x14
> [    7.810000]  show_stack from dump_stack_lvl+0x7c/0xac
> [    7.810000]  dump_stack_lvl from __warn+0x7c/0x1b8
> [    7.810000]  __warn from warn_slowpath_fmt+0x19c/0x1a4
> [    7.810000]  warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
> [    7.810000]  __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
> [    7.810000]  crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
> [    7.810000]  crc_t10dif_wrapper from crc_main_test+0x178/0x360
> [    7.810000]  crc_main_test from kunit_try_run_case+0x78/0x1e0
> [    7.810000]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
> [    7.810000]  kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
> [    7.810000]  kthread from ret_from_fork+0x14/0x28
> [    7.810000] Exception stack(0xe3651fb0 to 0xe3651ff8)
> [    7.810000] 1fa0:                                     00000000 00000000 00000000 00000000
> [    7.810000] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    7.810000] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    7.810000] irq event stamp: 29
> [    7.810000] hardirqs last  enabled at (27): [<c037875c>] __local_bh_enable_ip+0xb4/0x194
> [    7.810000] hardirqs last disabled at (28): [<c0b09684>] crc_main_test+0x2e4/0x360
> [    7.810000] softirqs last  enabled at (26): [<c032a3ac>] kernel_neon_end+0x0/0x1c
> [    7.810000] softirqs last disabled at (29): [<c032a3c8>] kernel_neon_begin+0x0/0x70
> [    7.810000] ---[ end trace 0000000000000000 ]---
> [    8.050000]     # crc_t10dif_test: pass:1 fail:0 skip:0 total:1
>
> kernel_neon_end() calls local_bh_enable() which apparently conflicts with
> the local_irq_disable() in above code.
>

This seems to be an oversight on my part. Can you try the below please?

diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
index 82191dbd7e78..56ddbd3c4997 100644
--- a/arch/arm/include/asm/simd.h
+++ b/arch/arm/include/asm/simd.h
@@ -4,5 +4,6 @@

 static __must_check inline bool may_use_simd(void)
 {
-       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq();
+       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+              !in_hardirq() && !irqs_disabled();
 }

However, this test code also appears to assume that SIMD is forbidden
on any architecture when IRQs are disabled, but this not guaranteed.

