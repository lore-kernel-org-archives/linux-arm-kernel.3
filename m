Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9509FE9B377
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaZCmNHBBezygKlMXEhqhmCZ8CD3x/AWabkqujMLwpY=; b=mTRVYgLJzc9JIzgg4BvTH5PUyk
	IpEn22PrGhfERlq98qS/DIMBei88p5mF7DASnvE7cD9UMDupQV0Yq1Lvfk8TafGVw+KoK1Q0v3STa
	dJJMzpc/+xfsFYE2X3TOBh+pdAmU7VosRiH4LCGFrsXthV9fXejTVy/Hmrq8klKte4ZiC40wgBf3y
	cdLh2x7HjPhV95jlmdgiLPmWmiOJKbCeWt5Z1mAy1LDEmr6xfe+B0mYecEGfLJyFU8Qe+s/yju3fL
	j6fofy4ucqlJaXaW+v+mtdZJHnV86wkaFOuheI7Xse1tN6VNd5jbw+eaiqB179OOrfjuZG3ksUddU
	ldhYcWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2sS-0000000D3PS-32pI;
	Mon, 02 Mar 2026 13:00:00 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2sQ-0000000D3Oa-0X8B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:59:59 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-389ff6e5885so7192551fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772456395; cv=none;
        d=google.com; s=arc-20240605;
        b=MGX9t+OHJZVYoeqCHaEfIYV1dY1cGW34w4A6nHt6hBRJPXOZSeQfg5Z2YqoST1G+NP
         jTY/LLIfwgHGqpznX+V8XV3bMdsjmT7PdM1C6IrWjyKmlW4jRzzk8vNJ5l6nLGAPYvOz
         pUjF4zrM3nH7Kfi7dLxiwHzM6bYYhGTzOcqhLjrFdy7wK7yW0SXBAPM6NICJv8L+fTU2
         P+r5epCjxiJ1/F1rUWaap9EVld8lVPox2gtMu8KhrrrG3n8E07D74/HDr/pDFvJuCxUr
         BzwqWdhKrOccnQjjpOuk8goaFISMvrA2L32I1XzNTgZg1UVYB5xxBbVjHggtlhHEKon3
         89gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gaZCmNHBBezygKlMXEhqhmCZ8CD3x/AWabkqujMLwpY=;
        fh=bhq6bafF6xVaRr1I0nkDIDYAK3OW2Meb2GzvwpsAgh8=;
        b=e4F/w0PA/y7iwiSEry7d0xkjq67fJ5yEXhfTX+wlWOi+Vu8fq1FOukEQZd3vioj4d/
         yN0UONyOCf/I+jRIBxnUnpK/IJ8yWPBxx4qDdEiikZePs9PaZc/GcNZR9lx7ei/M1O2u
         T3BaHrih7UJtq1knt4hnDPeChI9/Vt6vllSFgE6DOfqZhFzFuMhdwQAolWQyWmw4DsJs
         EdVoJzPAvxM31VFkN/m2gXB5KIM9YDBT9qOwLEHFOmPEtYpsBbNv3lef/UvH0dhxpj5y
         q1jp1NU8itEOHgUpjYQNzDV0XDSqeaLy6/fawGME3OOVQPvmzrlCcUXDvcbEIxSaDiEs
         AROw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772456395; x=1773061195; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaZCmNHBBezygKlMXEhqhmCZ8CD3x/AWabkqujMLwpY=;
        b=tWkYUsgk8sDrZd0yYk6IjKcAjG9tueaG18/jEZcF5oAnl2kzvBAfsAUskcfUfHiiLu
         OjmIpQrZQQg4MoNv51PAErFt9ThyPzwVI6ctUPXWWtyntcxYdxDuhzI18PS4T1gAebdw
         Ty/y+kRGkofYJ8pjeFFiYruXSaCeY5hruEzK/MIL7WwF3eGulehv+8ujivwFhsbzVq9A
         ureb0nhVLRW9yql1fK2QDGH5VJCVnU7JVsIqVh3SN6QgNQXSu0tLXpURmfiGbxrfEF+I
         R8Ze/lKCHwuNiDEt6jK7zAfljAaKJakY5PDiQ1AToAu0t7LyEBFZFaVDas7VTplSy2QK
         cFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456395; x=1773061195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaZCmNHBBezygKlMXEhqhmCZ8CD3x/AWabkqujMLwpY=;
        b=pyeZxQXNRvPjWMB0V0uqRNb8+WnShYW9w12Q/M0bPbyDCZlhE99DGmUIIiPAQraNGb
         NCIOVlLItpxKN4Eh3pr+d0+zkSlHyS/sSGpEOuspm1zhzPBQyVxTWuC/CjhGIvC24dvH
         GE4P3QlL00UJAktNeBlgj75I0aDS3VZZkzBuI+4FU+J6yEPBcloHH+K8MHtpDvOSzM/+
         lTNuO80DDXWSfAqR5Y68OJEleB70Ob/Om9q7O0a7uJAeHxT2Rzhk1caG6VUz5FBFjWM5
         LiKxKwDr+QKfEU9xo7TZrB2m+fUph4zu4rlcn1vhsa8Go1iN06hrKOY/FJgzFzCIfI9O
         +8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGDJom0dqphmVCgtgSaHeGFAELpe+aRODAKXjsvi/KwhSVniE/+n9sPup+6HtvaCrFSqoStVYoAns7A5VU5Bza@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg/m4D7O3++ywuOrLN0VUFrBG33IukNOsPr9y8QgUQGLZwLOiK
	BYVzIoA5Lnsfm/USqSMm7aGTjuGB/8SKGbo+xmor7i2G76tSC5VTW4ZIe0jItiSYmqn/QDjNjLu
	Xk5YJxubLDHKFpWziZ01yF1hhyihDxnh6jSx96WT1
X-Gm-Gg: ATEYQzwE6UN98fa1RGBYMIP8jyLx4Ccvqd/Snu3B0rK8qUp4QSYfeiXK8q7+DO7zXgc
	tiXpzPV8DEtB5Tb6U5fMeidq6sqWo0S1/dm3QPr54SdMZRAfXKjkVrQ2X4UyIUh3/52Kpd8xSx5
	rSTc8kPpVttCHKBCWY/nT71xqY0Qb+NU7R9zR11DZoMf34Skwxyq67HKBEo7e8VEnbpN8xj3ljG
	jPMbMJGvUYCquXQykLJuWY9jQKdM05RiUD+T3geqeI5BMDp31AD2L0Ow+6f5A2XM+Rf3C62dNqQ
	WyeWzOgWKUsFuEP2pZrLXnzu81OwA1Nb3XfIQg==
X-Received: by 2002:a2e:a608:0:b0:387:b72:816a with SMTP id
 38308e7fff4ca-389f1d73836mr80891401fa.3.1772456394493; Mon, 02 Mar 2026
 04:59:54 -0800 (PST)
MIME-Version: 1.0
References: <69a2d58c.050a0220.3a55be.003b.GAE@google.com> <874in0ex49.wl-maz@kernel.org>
In-Reply-To: <874in0ex49.wl-maz@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 2 Mar 2026 13:59:41 +0100
X-Gm-Features: AaiRm50VAo0HdWE3pXUzISRFilQBQfPRuh86gosA2aI8t8AALdoEJnWYNg6PsM4
Message-ID: <CACT4Y+bbQ3qfoy0kuXgTk5H2k=Wrg2t0Ghhc6U6fT-28ter7iA@mail.gmail.com>
Subject: Re: [syzbot] [kvmarm?] [kvm?] BUG: unable to handle kernel paging
 request in kvm_vgic_destroy
To: Marc Zyngier <maz@kernel.org>
Cc: syzbot <syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com>, 
	syzkaller@googlegroups.com, catalin.marinas@arm.com, joey.gouly@arm.com, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	oupton@kernel.org, suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_045958_261086_C38432BF 
X-CRM114-Status: GOOD (  19.66  )
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

On Sat, 28 Feb 2026 at 15:55, 'Marc Zyngier' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Sat, 28 Feb 2026 11:46:20 +0000,
> syzbot <syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    6316366129d2 Merge branch kvm-arm64/misc-6.20 into kvmarm-..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15e59c4a580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=148fc9aa8e041d0a
> > dashboard link: https://syzkaller.appspot.com/bug?extid=f6a46b038fc243ac0175
> > compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> > userspace arch: arm64
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13182006580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173900ba580000
> >
> > Downloadable assets:
> > disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-63163661.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/1018400deda3/vmlinux-63163661.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/fb8a8bb5d8a4/Image-63163661.gz.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com
> >
> >  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >  invoke_syscall+0x90/0x230 arch/arm64/kernel/syscall.c:49
> >  el0_svc_common+0x120/0x2f4 arch/arm64/kernel/syscall.c:132
> >  do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
> >  el0_svc+0x5c/0x238 arch/arm64/kernel/entry-common.c:724
> >  el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:743
> >  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
> > Unable to handle kernel paging request at virtual address ffef800000000000
> > KASAN: maybe wild-memory-access in range [0xff00000000000000-0xff0000000000000f]
> > Mem abort info:
> >   ESR = 0x0000000096000004
> >   EC = 0x25: DABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> >   FSC = 0x04: level 0 translation fault
> > Data abort info:
> >   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> >   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> >   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [ffef800000000000] address between user and kernel address ranges
> > Internal error: Oops: 0000000096000004 [#1]  SMP
> > Modules linked in:
> > CPU: 0 UID: 0 PID: 3651 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT
> > Hardware name: linux,dummy-virt (DT)
> > pstate: 01402009 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > pc : kvm_vgic_dist_destroy arch/arm64/kvm/vgic/vgic-init.c:445 [inline]
> > pc : kvm_vgic_destroy+0x2d4/0x624 arch/arm64/kvm/vgic/vgic-init.c:518
> > lr : kvm_vgic_dist_destroy arch/arm64/kvm/vgic/vgic-init.c:444 [inline]
> > lr : kvm_vgic_destroy+0x290/0x624 arch/arm64/kvm/vgic/vgic-init.c:518
> > sp : ffff80008e647b90
> > x29: ffff80008e647ba0 x28: 0000000000000005 x27: cdf00000200a52d8
> > x26: cdf00000200a4db0 x25: 00000000000000cd x24: cdf00000200a4d8c
> > x23: 00000000000000cd x22: 00000000000000cd x21: cdf00000200a4ad0
> > x20: efff800000000000 x19: cdf00000200a4000 x18: 00000000030f4b63
> > x17: 0000000000000031 x16: 0000000000000000 x15: ffff800088209a68
> > x14: ffffffffffffffff x13: 0000000000000028 x12: 5df000001795c1f0
> > x11: ffff800088209a68 x10: 0000000000ff0100 x9 : 0ff0000000000000
> > x8 : 0000000000000000 x7 : ffff80008672f958 x6 : 0000000000000000
> > x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000002
> > x2 : 0000000000000008 x1 : 0000000000000000 x0 : 0000000000000007
> > Call trace:
> >  kvm_vgic_dist_destroy arch/arm64/kvm/vgic/vgic-init.c:445 [inline] (P)
> >  kvm_vgic_destroy+0x2d4/0x624 arch/arm64/kvm/vgic/vgic-init.c:518 (P)
> >  kvm_arch_destroy_vm+0x88/0x138 arch/arm64/kvm/arm.c:299
> >  kvm_destroy_vm virt/kvm/kvm_main.c:1317 [inline]
> >  kvm_put_kvm+0x778/0xbe0 virt/kvm/kvm_main.c:1354
> >  kvm_vm_release+0x58/0x78 virt/kvm/kvm_main.c:1377
> >  __fput+0x4ac/0x978 fs/file_table.c:468
> >  ____fput+0x20/0x58 fs/file_table.c:496
> >  task_work_run+0x1b8/0x250 kernel/task_work.c:233
> >  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
> >  __exit_to_user_mode_loop kernel/entry/common.c:44 [inline]
> >  exit_to_user_mode_loop+0x110/0x188 kernel/entry/common.c:75
> >  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
> >  exit_to_user_mode_prepare_legacy include/linux/irq-entry-common.h:242 [inline]
> >  arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:81 [inline]
> >  el0_svc+0x17c/0x238 arch/arm64/kernel/entry-common.c:725
> >  el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:743
> >  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
> > Code: 54000420 b2481c28 d344fd09 d378fc28 (38696a89)
> > ---[ end trace 0000000000000000 ]---
> > ----------------
> > Code disassembly (best guess):
> >    0: 54000420        b.eq    0x84  // b.none
> >    4: b2481c28        orr     x8, x1, #0xff00000000000000
> >    8: d344fd09        lsr     x9, x8, #4
> >    c: d378fc28        lsr     x8, x1, #56
> > * 10: 38696a89        ldrb    w9, [x20, x9] <-- trapping instruction
>
> Oh gawd, fault injection. Because we didn't have enough bona fide,
> directly triggerable bugs, we're tricking the kernel into generating
> more. Oh well.
>
> Thankfully, that's an easy one: vgic_allocate_private_irqs_locked()
> fails, we exit kvm_vgic_create() early, leaving dist->rd_regions
> uninitialised. kvm_vgic_dist_destroy() comes along and walks into the
> weeds.
>
> Note to the syzcaller folks: being a lazy bastard, I run the test case
> (both kernel and C reproducer) as a nested guest using kvmtool.
> kvmtool has a very simple init that doesn't mount debugfs by default.
> It'd be great if the reproducer could check that the debugfs files are
> accessible and stop if it can't configure them. I initially couldn't
> reproduce the issue because of this.

Hi Marc,

The reproducer should print at the start specifically to address this concern:

the reproducer may not work as expected: fault injection setup failed:
failed to write fault injection file

Isn't it enough?




> Anyway, that being said:
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/vgic-fixes-7.0

