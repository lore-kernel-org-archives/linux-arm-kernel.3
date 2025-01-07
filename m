Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2187E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w4owW7rFGgngEtY8J365asAFIY4hLvAsEH7uazMVB4=; b=HygBXDttd7ALdtHR+/0WiHbmM2
	LD1RlqgB+Ta403hqlOQhNeQia24k0Intn3G0uWb27SX8Wta6PKQZknfyxDNbGUA4TKr+nuDiP+9yA
	LC0EKW3VByrRiCjDpoxCz3xXgGzQJ/LlgisSmTnS5w6I1Ht0svs6YTM254YCRErbv8ud/7X9o0dhB
	gqFi7tbaGTpzejpbtnwW+iFg+PaCi8Kxir+gBLIS6rn6TbZSfIEpmeaEAJjRzpW6HmRrqmJT+RE3I
	AgXlAOuL6RYGsMLxUSvzvJxMREV3m/YA/2DKDW16mfawD81YZRrSjud8cx8PR9KAG9zpEPXeKJWgJ
	5cpkZMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6ht-00000004JUn-0p1x;
	Tue, 07 Jan 2025 10:21:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6AA-00000004CE0-1urw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:46:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43616c12d72so24265625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736243172; x=1736847972; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9w4owW7rFGgngEtY8J365asAFIY4hLvAsEH7uazMVB4=;
        b=UqBPowNPNEZu3e/9tkjnEgXGsn+i5V1G2aeU+9W71jfHY4/sEPHEZy5CHjQnfA4mva
         OewA0RX0UG2ojT7jB6JBJRh9Eb9s3OV1LthWcdqYkHBm09WFoMf4j5c8IsNVpSMtYLem
         qHZpAZC7c3oqQAqkPZJLkgmmljzyFFnb0O2FKOHGHUHfpMNB2Z9zAJ6RewGaEiZi4IOF
         Abc/e3M8C4OA9vDO/7hz5taBwHM1aUBS4yCB6S1HtQS6jMM66/VOoY205/SMkB31qbL8
         NA/lCpMKQQe0f98soU6MpyPzDLk/aZQZ3AKK4QoZpezPsW4/mtXE4OgV2ldDLLME76fv
         2sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736243172; x=1736847972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9w4owW7rFGgngEtY8J365asAFIY4hLvAsEH7uazMVB4=;
        b=JnuffZMuRudzNg3LbviFNnKBClBDiTEQKa1pfTroClHsjxQ7Tp8zHQMwVwX6x8Q2c+
         I1sXY4Z4W9lYfcyuYrr97nYbNgO/JI0DY/mv+Yye4gZjpZpWKIhNf99Tj5QX0kbG8yzb
         PqWjK5MlMELA8PHxnsg1CsL+kHOS1NDryCJaZjMaTUV1hziDFj06x18Lw1CctOxZ2Gdc
         zKLmLUI+5jKXSO0y0glo7fxTe143uJ/1hCb+3bgI4sFwzHH5Cu6yha4K2m3B/dAAQ6a+
         DIYHnkrC9/4yQwqA3M7dd2K6MtMLhxXjQBi0Rxf3tb3rE7gHUcytj9SAMCrgLSnXywLz
         1oWw==
X-Forwarded-Encrypted: i=1; AJvYcCW88a1MGVLDwHI8gnToAlZq0E6XgyiXQEBcRqEVxSuQJgikbPLkqp5hl04a9vhED1XpRkTNNZxJQm16ONnOe/3w@lists.infradead.org
X-Gm-Message-State: AOJu0YxGbFEt+4h1QWEOr7skVC0QA8M/6XZQ2NWKMwtBpzY5lvBP083W
	rbkN2Ime2FGi2n5+2r4IE69+B0YBSas+AdTNhTJ7lBriXpDMW+JpJANld1RduWVyuQv03imimzV
	k65AnNnAol9U89iSCtQvkiD7U3Sk=
X-Gm-Gg: ASbGncvXgjViADiguH8ZLG/kYR9mkmvWR4BCl7OR+tBfPzXEgQkylT5Tx0q6Lkw6dk2
	+XHpEdmfi/loWnRSWJNkpgkw7kt1emAZF/pdTbaM=
X-Google-Smtp-Source: AGHT+IEU23PnPZsgS3wKiyuLpWpCtHViFuyHtcOJbAZx59MVGnZCC7mkqviUqy9gs43LyhQgdvSC6lqW7rWmlarBOzQ=
X-Received: by 2002:a05:600c:3b18:b0:434:ff85:dd77 with SMTP id
 5b1f17b1804b1-436686431e0mr218844175e9.3.1736243171993; Tue, 07 Jan 2025
 01:46:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
 <Z3vidU68gtR9Neih@J2N7QTR9R3>
In-Reply-To: <Z3vidU68gtR9Neih@J2N7QTR9R3>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 7 Jan 2025 11:46:01 +0200
X-Gm-Features: AbW1kvZOVP4ih6YQ54necZLfgFC62KIVTnuV_on-vasVzKr5Zo315QjH5M5wVco
Message-ID: <CAFpOueR32hZj5=fnSQqwD7zitkaeGkzj9W_D1RW5q72RLxkmgg@mail.gmail.com>
Subject: Re: Issues with kexec on arm64
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_014614_493930_6A838654 
X-CRM114-Status: GOOD (  25.91  )
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

On Mon, Jan 6, 2025 at 4:02=E2=80=AFPM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Tue, Dec 24, 2024 at 01:36:41PM +0200, Itai Handler wrote:
> > [Sorry about my previous e-mail on this subject. It got corrupted.
> > Please ignore it.]
> >
> > Hello,
>
> Hi,
>
> >
> > I'm encountering kernel panics / system hangs when attempting to
> > kexec a vmlinux file on arm64 architecture.
> >
> > It happens both on qemu and on real hardware.
> >
> > These issues occur on all kernels from v4.19 to the latest mainline.
> > A sample panic output looks as follows:
> >   kernel BUG at arch/arm64/mm/mmu.c:217!
> >   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
> >   CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
> >   Hardware name: linux,dummy-virt (DT)
> >   pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >   pc : __create_pgd_mapping+0xe8/0x3b0
> >   lr : __create_pgd_mapping+0x44/0x3b0
> >   sp : fffffe00804d3c20
> >   x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
> >   x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
> >   x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
> >   x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
> >   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> >   x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
> >   x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
> >   x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
> >   x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
> >   x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
> >   Call trace:
> >    __create_pgd_mapping+0xe8/0x3b0
> >    map_kernel_segment+0x74/0xb0
> >    paging_init+0xec/0x4f8
> >    setup_arch+0x234/0x52c
> >    start_kernel+0x64/0x500
> >    __primary_switched+0xb4/0xbc
> >   Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
> >   ---[ end trace 0000000000000000 ]---
> >   Kernel panic - not syncing: Oops - BUG: Fatal exception
> >
> > I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
> > ("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.
> >
> > I also reconstructed the full call trace (by adding "noinline" to the
> > relevant functions):
> >   alloc_init_cont_pte+0x6c/0x1e0
> >   init_pmd+0x154/0x1c8
> >   alloc_init_cont_pmd+0x11c/0x174
> >   alloc_init_pud+0xc4/0x148
> >   __create_pgd_mapping+0xa8/0x130
> >   map_kernel_segment+0xc8/0x168
> >   map_kernel+0x98/0x1a8
> >   paging_init+0x7c/0x418
> >   setup_arch+0x224/0x570
> >   start_kernel+0x5c/0x4f0
> >
>
> Does your system have GICv3 and an ITS? If so, and assuming you're not
> using EFI to boot in the first place, what *might* be happening here is
> that the GIC is still using property/pending tables allocated bye the
> first kernel, and after that memory gets reallocated, the GIC writes
> back and corrupts that memory. That would be very sensitive to memory
> layout, which could explain why the bisect leads to something that
> changes that.
>
> We have a solution for that with EFI (where we can use a configuration
> table to indicate that the memory is in use), but we don't currently
> have a solution in the absence of EFI, and we should probably forbid
> kexec in that case...
>
> Mark.
>

Hi Mark,

No, both the real hardware and the qemu VM do not have GICv3.
They both have GICv2.
Is kexec supported with GICv2 (assuming I'm not using EFI to boot)?

Thanks,
Itai Handler

