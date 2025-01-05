Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D39FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQWaM+PChHtbUOdo7doKQVaopQbSfa6dRRaSoCLd/Gc=; b=McjIS02GbZkXIc8WpektnwrE3I
	GLIgrHfCSEeLC7vVVgum+btBXQDGVo5A95UuQfGiospHCMY9cpXQwDxN6YVUnl3K31UyDyuy1Hyqr
	tqNluG6xQeSNiXPPqLM4t75JAdEsgpDazH6yn7pxtjN256zJnD3zX9N9Z44oEcqhorz6HzIavxm3X
	OQ0Yk35j6QDSWVdsNayy6fCTJOlE+JsWO+rRkhPl7W3nmMU9On6xaSyjlpWNuwDslZh3nIyTg3E3g
	Qk7LlTGbtLGMyMtLrWWUmdwEoUqSzV63Iwq18D6HjVitT0tlAehU8S1vVVhdh1nd+vNg/HXevo5Gd
	fXkGycIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tURvF-0000000GwTB-3naK;
	Sun, 05 Jan 2025 14:48:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tURu4-0000000GwNW-2Mk6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 14:46:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43616bf3358so21181805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 06:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736088414; x=1736693214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQWaM+PChHtbUOdo7doKQVaopQbSfa6dRRaSoCLd/Gc=;
        b=c+fGdGNdyZYxnDbeKb1X2U5wZTJFifPwf3k736QjibplWnWgxKd/UgAFOamhHvi6rJ
         cAkTMKmaUaCqqW52Oz8iOqe+FQSRB3D4PWNe9Uol7bR6qXAs3jAU84TRyHUIT3lFVeLI
         K1MRXXVbYykBYGNAl2aiPwreDIOFwR/VqTlD85Q7cmjTxI8eWQcolYKDkoVgrFXzasJP
         RFOzdRp/8MBhR+/MHJQiJVUosCNSnKObV3f1q8SSVWNb60/wyElF9RN+OMhjLgmNZ9pi
         tCJDWIuw3o2bgBnCn+UNWaZTzrRBxzjvRu9VghjUz0zV/mt6bmut9BJIfkoMDNWoqhFO
         OTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736088414; x=1736693214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQWaM+PChHtbUOdo7doKQVaopQbSfa6dRRaSoCLd/Gc=;
        b=bU9/VQ6Nr+H2xU/dqbECf7nDQLym1K9UQT9/dnSdTNWtl08rmRtPRYNajoVZmtbFbn
         nrFra6avc+4wnTIDbGkDaIRDxi0v5XtynoOfemjknKqnqep0ZCjWRg7RcBN6XgPQ2P+i
         SSVrAMTh0KSUtqZhrq87j6/f5y3GCzctIslg3ENvDJEht25Ez+8qv3kNvW6OrSzKP9hH
         lk+QfJSUVBMQEDZz6DftU2vwM+bWDDGLpEBk/oVD6rlhTe5+c0A/ghCBkV5mL/GSuVr9
         jZ348tQxrfsqxGMxFnT86yDIinqJbpCGFd2vZdHftu+KVhU0ni/SibtIyNc9I58UlaFy
         tT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbp+yulNdR1LkuHjTcoJNZThyKxxSM9Xk7ooKMc/Yp7M7vofdB5F/HOnYK+4NUjbrYW2s/9Bp/cfzfJNOMguxi@lists.infradead.org
X-Gm-Message-State: AOJu0YwpV9svtsONQM/xoGe6Lc0jTsxnB1OZBZlK+eUa74dQ9ExHHYt8
	ZuMC5VTHPImtVad8vlMe0ehQNV3zCiWu+NcRNEoS1jaFW1sno+EuwjNp3cLz5zf5cd/+OtaVVLu
	MDNVnVf0UkQ6xttI8TEatvGAjkiPZ66X7
X-Gm-Gg: ASbGncsQcueixygmrmOUHo6C07mMBdgBYK7islprdjwjHQBBqBJyCXg2/diCnp0Qme2
	E6AGoNfAq/1X6sYA+H8qCqbSGQ0aDWJR0HJTFrl4=
X-Google-Smtp-Source: AGHT+IFRWJtMBXvKcYj1qoQVOlfnh+QijGnb7aioi+rpAS3P+MtWp+60aF7rN2Zll+mbhNisv0S/pthAg0xk3dl6LUk=
X-Received: by 2002:a05:600c:4e8e:b0:434:f9c1:a5b1 with SMTP id
 5b1f17b1804b1-43668642576mr193205435e9.3.1736088413987; Sun, 05 Jan 2025
 06:46:53 -0800 (PST)
MIME-Version: 1.0
References: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
 <20250103161637.GA3921@willie-the-truck>
In-Reply-To: <20250103161637.GA3921@willie-the-truck>
From: Itai Handler <itai.handler@gmail.com>
Date: Sun, 5 Jan 2025 16:46:42 +0200
Message-ID: <CAFpOueQa2EOSC7=5xsWU85B0FG8xsDoqk7btMQCEV7wBdT1GQw@mail.gmail.com>
Subject: Re: Issues with kexec on arm64
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	mark.rutland@arm.com, ardb@kernel.org, usamaarif642@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_064656_607094_F59F152A 
X-CRM114-Status: GOOD (  28.70  )
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

On Fri, Jan 3, 2025 at 6:16=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Dec 24, 2024 at 01:36:41PM +0200, Itai Handler wrote:
> > [Sorry about my previous e-mail on this subject. It got corrupted.
> > Please ignore it.]
> >
> > Hello,
> >
> > I'm encountering kernel panics / system hangs when attempting to
> > kexec a vmlinux file on arm64 architecture.
> >
> > It happens both on qemu and on real hardware.
> >
> > These issues occur on all kernels from v4.19 to the latest mainline.
>
> I think other folks have been using kexec on arm64, so something smells
> fishy here. Is the issue intermittent?

No, it isn't intermittent. It's very easy to reproduce the panics/hangs.
At most we need to perform two recursive kexec attempts of the vmlinux file=
.
In v6.6, using the configuration I supplied (config.sh), a single kexec
attempt is sufficient to demonstrate the issue. In that case a panic occurs
on the first kexec attempt. In newer versions I mostly see hangs but someti=
mes
panics as well.
Please note that the configuration I supplied sets CONFIG_ARM64_64K_PAGES=
=3Dy.
But I saw issues also with 4K pages, but in that case only when enabling so=
me
debug options (KASAN, SCHED_DEBUG, KCSAN).Also please note that kexec with =
the
Image file (instead of the vmlinux file) seems to work properly, without an=
y
issue.

>
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
>
> So this explodes because we find a page-table entry at the pmd level
> that we don't like the look of:
>
>   - It's not a block entry
>   - It's not all zeroes
>   - It's also not a table
>
> Sadly, the actual value is clobbered by the time we take the BUG():
>
>    0:   f9400300        ldr     x0, [x24]
>    4:   92400400        and     x0, x0, #0x3
>    8:   f1000c1f        cmp     x0, #0x3
>    c:   54000060        b.eq    0x18  // b.none
>   10:*  d4210000        brk     #0x800          <-- trapping instruction
>
> Maybe dumping 'pmd_val(pmd)' before we crash would be instructive? Maybe
> it's a pointer...

I dumped the bad pmd (on v6.6).
It's always the same value: 128000017901ca60.

>
> > I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
> > ("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.
>
> Hmm. I wonder if the rodata section isn't being loaded properly? Can you
> add some traces to check that, please?

Could you advise which traces are needed and how to add them?

Thanks,
Itai Handler

