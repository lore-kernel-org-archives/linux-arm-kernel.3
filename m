Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D035C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 13:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+vkfv19nsFG3JWWcSn0RJuwkZKQGKRg+WJmGYnaTdw=; b=I8JP7FVbS7I93dvYSl4w2kGnpr
	HCgwSc2wiXlZajctWmgTiDwe8VOzt7zVfNJWJrzrKvlwcFZQNq71ruAzOYTc1dy2h4SnXSxrkxeN6
	uiu/2iDWUD/0B5z8EJaok2l70griG48JIb46aao366tM8x0DtfSegc6aMA94UMAcLr2694oE5b5tR
	45e4zqQjG3EIWZlPS3cuRYY79sfpRCicMft5K/FhMu5AhsACt9OOvR/gDmJ/Z3Bs3WR1eGO2FAT1+
	dJTIqCIRwLl7vqC+67ICdZuvBYKia1iHRKk+ivp0v9sQm1W+/ElfL1GH8VF5YEaSl+pRe8LWwRlEU
	fCrW9T5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTKIa-00000000s86-0uZL;
	Sun, 22 Jun 2025 12:59:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTKGI-00000000rvU-3xyt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 12:57:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1811500f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Jun 2025 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750597049; x=1751201849; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+vkfv19nsFG3JWWcSn0RJuwkZKQGKRg+WJmGYnaTdw=;
        b=jl0BwUUCYC8iKXM0N+WsSMKNc77gUrNGIjayGUCBz7LI/S+6dvyWdNNQLuDatLPpTZ
         Va19x1K0xCc0Rf1RwzfuPwr9TLo/MppZC/e3CuU1OkQW4rxH0wHXUeishgpr+/OdVewt
         8FP22GE2V4sMyDlI9xmTeMZdoqkddVjcRx8dXhHw6ZUy6PqLlRulDxHSGW7BqneJoCYE
         aWRPvE+tvm4G5o9KdA0+QrdRh0wNvzpBZnY8tw9n0XlZYubk/65Ygx86ziThr3NltMTl
         mHNy+yFfaNg+mGHSL5CUnyAHjJwp2SmdrFKBlZMMovrO/roQoAyKhePTKMrVNHm7T5A0
         swVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750597049; x=1751201849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+vkfv19nsFG3JWWcSn0RJuwkZKQGKRg+WJmGYnaTdw=;
        b=FUsrtVaOsANeaObVeZs4elaocNLnAVXI0gU8ubnT2VJJn6FEc3KC947WIOG6lVjgJA
         +W9pKnToCkrkU2HoLUnUKrLx0Sm2mWAb0mq4CIpafV5Ef/q0qAwi/Eb9sDSAY+Aqr5g1
         AxPmlSXQOOCbb5HKEPwtktPOq73dCAN5Lkf2Qb8W5wVyVXIHMQK7fddcZ7Yf21c74Y4D
         hjYknafp5vMw61BLBdXln2BVVKgtkJQVw0uu+zIFvQn9B1VHt4rGbiblmIsKHjRB4rnY
         SxGdjPMqvtnvN5HDmhNmsxpyIC2IRLG0F24B1/13aSWCwcEWhU/MStLPNB9B7TAw4OOx
         EwTg==
X-Forwarded-Encrypted: i=1; AJvYcCV5xwszbzmnOsCjkIIoF0NoCWLPLQD5hMIGGGTQ3j4pQsopifh/uEB2fQD4seruo47SAwCnUgjKAyDF+Y/FOKhE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbq12kQ+o/K/Jiempez9Tlr1XVVy9XA/z43ri51YjERiszL2JJ
	gd/pCPYFHOkgx9qTNRjf6UeyGfZNMxDaXaEcH3PbMooFMQoF5Bp6kZsHgPczdilCIePBxiEHP6V
	/SvVGUwjjGf0jAlO4+37bcFXBAPWhqks=
X-Gm-Gg: ASbGnctj9Ck6GGEnUCry4WlezqsibI7SCKZnFPx+crlBxyJkCFtIb3e/4HobChT47LK
	ElzibzVXxrVhD1EHX1uHiUGj1ivZ3PMVOMhlOUikwt61TBC5mIAgXAJnxJWotnx8tIVYg8OSGsC
	ldRZl8QIVdnuMnacXZUPpAAOCs9msqDfZVa/1NdyBn4HB5iA==
X-Google-Smtp-Source: AGHT+IEhsLkdHI04BQhNQneZfcWZKZUKTAWLIjCKILhfBfcByb7/8yzYOiwf7BViNIafnURgUPHjWWsstrkywtwcuG8=
X-Received: by 2002:adf:9cc4:0:b0:3a4:dbdf:7154 with SMTP id
 ffacd0b85a97d-3a6d1330d8fmr5584264f8f.54.1750597048529; Sun, 22 Jun 2025
 05:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <aFVVEgD0236LdrL6@gmail.com>
In-Reply-To: <aFVVEgD0236LdrL6@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 22 Jun 2025 14:57:16 +0200
X-Gm-Features: Ac12FXwFbIPranIr5CD7aMTRcJJTKGnL_GbrxcoA-Rg5n9d4zqqzGNtm5fJhgK8
Message-ID: <CA+fCnZfzHOFjVo43UZK8H6h3j=OHjfF13oFJvT0P-SM84Oc4qQ@mail.gmail.com>
Subject: Re: arm64: BUG: KASAN: invalid-access in arch_stack_walk
To: Breno Leitao <leitao@debian.org>
Cc: kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, song@kernel.org, 
	mark.rutland@arm.com, usamaarif642@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_055730_989693_FF4ABDC9 
X-CRM114-Status: GOOD (  16.38  )
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

On Fri, Jun 20, 2025 at 2:33=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> I'm encountering a KASAN warning during aarch64 boot and I am struggling
> to determine the cause. I haven't come across any reports about this on
> the mailing list so far, so I'm sharing this early in case others are
> seeing it too.
>
> This issue occurs both on Linus's upstream branch and in the 6.15 final
> release. The stack trace below is from 6.15 final. I haven't started
> bisecting yet, but that's my next step.
>
> Here are a few details about the problem:
>
> 1) it happen on my kernel boots on a aarch64 host
> 2) The lines do not match the code very well, and I am not sure why. It
>    seems it is offset by two lines. The stack is based on commit
>    0ff41df1cb26 ("Linux 6.15")
> 3) My config is at https://pastebin.com/ye46bEK9
>
>
>         [  235.831690] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         [  235.861238] BUG: KASAN: invalid-access in arch_stack_walk (arc=
h/arm64/kernel/stacktrace.c:346 arch/arm64/kernel/stacktrace.c:387)
>         [  235.887206] Write of size 96 at addr a5ff80008ae8fb80 by task =
kworker/u288:26/3666
>         [  235.918139] Pointer tag: [a5], memory tag: [00]
>         [  235.942722] Workqueue: efi_rts_wq efi_call_rts
>         [  235.942732] Call trace:
>         [  235.942734] show_stack (arch/arm64/kernel/stacktrace.c:468) (C=
)
>         [  235.942741] dump_stack_lvl (lib/dump_stack.c:123)
>         [  235.942748] print_report (mm/kasan/report.c:409 mm/kasan/repor=
t.c:521)
>         [  235.942755] kasan_report (mm/kasan/report.c:636)
>         [  235.942759] kasan_check_range (mm/kasan/sw_tags.c:85)
>         [  235.942764] memset (mm/kasan/shadow.c:53)
>         [  235.942769] arch_stack_walk (arch/arm64/kernel/stacktrace.c:34=
6 arch/arm64/kernel/stacktrace.c:387)
>         [  235.942773] return_address (arch/arm64/kernel/return_address.c=
:44)
>         [  235.942778] trace_hardirqs_off.part.0 (kernel/trace/trace_pree=
mptirq.c:95)
>         [  235.942784] trace_hardirqs_off_finish (kernel/trace/trace_pree=
mptirq.c:98)
>         [  235.942789] enter_from_kernel_mode (arch/arm64/kernel/entry-co=
mmon.c:62)
>         [  235.942794] el1_interrupt (arch/arm64/kernel/entry-common.c:55=
9 arch/arm64/kernel/entry-common.c:575)
>         [  235.942799] el1h_64_irq_handler (arch/arm64/kernel/entry-commo=
n.c:581)
>         [  235.942804] el1h_64_irq (arch/arm64/kernel/entry.S:596)
>         [  235.942809]  0x3c52ff1ecc (P)
>         [  235.942825]  0x3c52ff0ed4
>         [  235.942829]  0x3c52f902d0
>         [  235.942833]  0x3c52f953e8
>         [  235.942837] __efi_rt_asm_wrapper (arch/arm64/kernel/efi-rt-wra=
pper.S:49)
>         [  235.942843] efi_call_rts (drivers/firmware/efi/runtime-wrapper=
s.c:269)
>         [  235.942848] process_one_work (./arch/arm64/include/asm/jump_la=
bel.h:36 ./include/trace/events/workqueue.h:110 kernel/workqueue.c:3243)
>         [  235.942854] worker_thread (kernel/workqueue.c:3313 kernel/work=
queue.c:3400)
>         [  235.942858] kthread (kernel/kthread.c:464)
>         [  235.942863] ret_from_fork (arch/arm64/kernel/entry.S:863)
>
>         [  236.436924] The buggy address belongs to the virtual mapping a=
t
>         [a5ff80008ae80000, a5ff80008aea0000) created by:
>         arm64_efi_rt_init (arch/arm64/kernel/efi.c:219)
>
>         [  236.506959] The buggy address belongs to the physical page:
>         [  236.529724] page: refcount:1 mapcount:0 mapping:00000000000000=
00 index:0x0 pfn:0x12682
>         [  236.562077] flags: 0x17fffd6c0000000(node=3D0|zone=3D2|lastcpu=
pid=3D0x1ffff|kasantag=3D0x5b)
>         [  236.593722] raw: 017fffd6c0000000 0000000000000000 dead0000000=
00122 0000000000000000
>         [  236.625365] raw: 0000000000000000 0000000000000000 00000001fff=
fffff 0000000000000000
>         [  236.657004] page dumped because: kasan: bad access detected
>
>         [  236.685828] Memory state around the buggy address:
>         [  236.705390]  ffff80008ae8f900: 00 00 00 00 00 a5 a5 a5 a5 00 0=
0 00 00 00 a5 a5
>         [  236.734899]  ffff80008ae8fa00: a5 a5 a5 00 00 00 00 00 00 a5 a=
5 a5 a5 a5 00 a5
>         [  236.764409] >ffff80008ae8fb00: 00 a5 a5 a5 00 a5 a5 a5 a5 a5 a=
5 00 a5 a5 a5 00
>         [  236.793918]                                                   =
  ^
>         [  236.818810]  ffff80008ae8fc00: a7 a5 a5 a5 a5 a5 a5 a5 a5 00 a=
5 00 a5 a5 a5 a5
>         [  236.848321]  ffff80008ae8fd00: a5 a5 a5 a5 00 a5 00 a5 a5 a5 a=
5 a5 a5 a5 a5 a5
>         [  236.877828] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Looks like the memory allocated/mapped in arm64_efi_rt_init() is
tagged by __vmalloc_node(). And this memory then gets used as a
(irq-related? EFI-related?) stack. And having the SP register tagged
breaks SW_TAGS instrumentation AFAIR [1], which is likely what
produces this report.

Adding kasan_reset_tag() to arm64_efi_rt_init() should likely fix
this; similar to what we have in arch_alloc_vmap_stack(). Or should we
make arm64_efi_rt_init() just call arch_alloc_vmap_stack()?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D51fb34de2a4c8fa0f221246313700bfe3b6c586d

