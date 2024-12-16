Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEABFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tH3QBbIq+Oz3UUmj0lw02AcvLXxTPOgWHp9+Xspxbik=; b=b0XMOxPx76MpGV5A3OBX0dHX8h
	hDhBA/bvS+atUav04O76tk4MnocSjKVlfM3/QzqFG1GB21IQaUsIek8LKxm3yd0edojPj5Qjp1Uqc
	mWrEXXuXSYmM4ycWYEooozC+z7ED0AA9jsGVv+JeaZy+h9KbNHWLooSRN8HlCo8YT5TqjZKsIvS8A
	ugqXutyXk0Zh8lxAzl92YH8Xw1sAXaOmDNHWdCZMLgqDuphRgZyNZEX2/vAEstpRvOG9cmJ+VBiyh
	io6hWmzuQN8VlWzeYfnX7GDuDAzabc5pqxPsyiN6ZmxGnRAThoM9e4ZzqWxS6xolzW9RSGa4tMtNI
	AHGYDSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7Zg-00000009YyO-040E;
	Mon, 16 Dec 2024 09:39:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7Ya-00000009Ynb-1Y4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:38:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728ea1e0bdbso2825269b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734341907; x=1734946707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH3QBbIq+Oz3UUmj0lw02AcvLXxTPOgWHp9+Xspxbik=;
        b=yFRlMwk1J31Lcw+0/he4XRfYEU/mazB08adTug98bs2x6RTyi+8LoZX70YH7DXbtiy
         UsFy7BdH4ZyvjU87ZB6bah7Bi4Lj84LrSrpCNwW5pgi2KDfQKV+fiXbxBnn1bQmZoXO2
         zxqBP1nbldtk7l4w/sYSuy9APCy3Wb3eJU/uPZGKUi3gfOG54X2M4uBTxWSCwO5ZDzp+
         FqsPUdbDf3L8VCAJq9ZFhzINLMEHBmjPPgdcfM8dIdMWac3sNizVqavULxEBvJ8+Oe0y
         iBDRZD5HuMKnEOFdtPQ1ahLUK4wcAwZUtN72iDtCyLpe6lh0/Cp4zAbyrfjNr7JnMgfD
         3pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734341907; x=1734946707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tH3QBbIq+Oz3UUmj0lw02AcvLXxTPOgWHp9+Xspxbik=;
        b=HtoKoPXY2/gq7sxyONg/nhbuk1NLtbFo32izwdXtVeWuBFIWELkCGAZekwlDJxfR7K
         6lYpFahAMMS0ogunjA0yxcKJDrnnrUZ4gxqOaHxJXmphH56eeAD2QKscy0vK5ND+fGhh
         tJx6D9q9HsLh70igjChHX00USzfHKsv638UvAgEG3IDdaV6qMmWXsOWnN5zfUhiFyx3W
         4G8+hH0hdBHf7beQDscnbl5S8sJd2cyLxfOz7M+uocAac9aJd7p3jp/D4wJZupIOtdsz
         T/Eqr4SWhb2Mdxe5vV3UM1FRxxuyxhCpYIb1igqB11oKBq4d/xa80XFL7us5//NZJawK
         sy6g==
X-Forwarded-Encrypted: i=1; AJvYcCUOD/AjFmmXkQRxk84wl1nRG0sVCr0ksoy2NaI3g6hmWK+n6UCbjo1JZ2Z2QHF/opvgdMT5dONbBvuyAa+0GSq0@lists.infradead.org
X-Gm-Message-State: AOJu0YzHtPcJYnYh1i+hAff4n8dJquPm5T+IiJ1f+TntmYcrqrTiopZf
	G2ulian/B1g3GU/+j314O+XsyfJjGw/OGnkI5H8+NMFVwR/aG+F0OZLP5aWwGBFHR3FHC3uKGgf
	zbKTcXQ42Xet0OV6Dhg9mxwLOul5iDTwPi8QCOr16K64SzzzdlWO4
X-Gm-Gg: ASbGnct+Exsp4oHvf8dyW6bhSSMnhTqhYtP9CskbMw+nHdBdMWnXK6WqiG19VVUY97M
	3jIKU1TAh180K8BEUDqnq3U6aJBHbB7nQRuMEIcfFEIiw6NcaK2S+x+2Ho5EiKkdidYwo
X-Google-Smtp-Source: AGHT+IGTB5sJUwQljcH3S5XL+OOeiabxzJ/8JQxqL7sZAHgT5dvELbfZeFL8O7lW9m6UCh29vDeERfH397eAur7NOuQ=
X-Received: by 2002:a17:90b:3c02:b0:2ee:5958:86d with SMTP id
 98e67ed59e1d1-2f28fb6764amr17469580a91.9.1734341906491; Mon, 16 Dec 2024
 01:38:26 -0800 (PST)
MIME-Version: 1.0
References: <675aa352.050a0220.1ac542.0018.GAE@google.com> <867c80ro2w.wl-maz@kernel.org>
In-Reply-To: <867c80ro2w.wl-maz@kernel.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 16 Dec 2024 11:38:15 +0200
Message-ID: <CANp29Y6Eu47CvtuKfS7qKqXVcVf7mvVoP7XQstryb_ooakCpcA@mail.gmail.com>
Subject: Re: [syzbot] [kvmarm?] BUG: unable to handle kernel paging request in __hwasan_check_x0_ADDR
To: Marc Zyngier <maz@kernel.org>
Cc: syzbot <syzbot+67a9ec5b1706e0184581@syzkaller.appspotmail.com>, 
	catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_013828_428757_8A26B9CD 
X-CRM114-Status: GOOD (  23.34  )
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

Hi Marc,

Thanks for looking into the report!
Let's tell syzbot about the fixing commit you mentioned:

#syz fix: KVM: arm64: vgic-v3: Sanitise guest writes to GICR_INVLPIR

Syzbot will close the issue once the commit reaches the fuzzed tree.


--=20
Aleksandr

On Mon, Dec 16, 2024 at 11:09=E2=80=AFAM 'Marc Zyngier' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Thu, 12 Dec 2024 08:48:18 +0000,
> syzbot <syzbot+67a9ec5b1706e0184581@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    5db899a34f75 Merge remote-tracking branch 'kernel/kvmar=
m/n..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kv=
marm.git fuzzme
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D16db78f8580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dfde68ab6d6c=
8c8ab
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D67a9ec5b1706e=
0184581
> > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for D=
ebian) 2.40
> > userspace arch: arm64
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > Downloadable assets:
> > disk image (non-bootable): https://storage.googleapis.com/syzbot-assets=
/384ffdcca292/non_bootable_disk-5db899a3.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/4938b757ff4a/vmli=
nux-5db899a3.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/936938b47987=
/Image-5db899a3.gz.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+67a9ec5b1706e0184581@syzkaller.appspotmail.com
> >
> > Unable to handle kernel paging request at virtual address efff800000000=
137
> > KASAN: probably user-memory-access in range [0x0000000000001370-0x00000=
0000000137f]
> > Mem abort info:
> >   ESR =3D 0x0000000096000005
> >   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >   SET =3D 0, FnV =3D 0
> >   EA =3D 0, S1PTW =3D 0
> >   FSC =3D 0x05: level 1 translation fault
> > Data abort info:
> >   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
> >   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> >   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > swapper pgtable: 4k pages, 52-bit VAs, pgdp=3D0000000044a53000
> > [efff800000000137] pgd=3D1000000049992003, p4d=3D1000000049993003, pud=
=3D0000000000000000
> > Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> > Modules linked in:
> > CPU: 0 UID: 0 PID: 6560 Comm: syz.2.929 Not tainted 6.12.0-rc7-syzkalle=
r-g5db899a34f75 #0
> > Hardware name: linux,dummy-virt (DT)
> > pstate: 80402009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : __hwasan_check_x0_67043363+0x4/0x30
> > lr : vgic_get_irq+0x7c/0x3d4 arch/arm64/kvm/vgic/vgic.c:93
> > sp : ffff80008c597650
> > x29: ffff80008c597660 x28: 00000000000000e0 x27: 0000000000000004
> > x26: 0000000000000002 x25: ffff800083a7fe20 x24: 16f0000014accd90
> > x23: 16f0000014acb9a0 x22: 0000000000000000 x21: a9ff80008c583000
> > x20: 0000000000000001 x19: efff800000000000 x18: 0000000000000005
> > x17: 0000000000000000 x16: 0000000000000137 x15: 0000000000000000
> > x14: 0000000000000002 x13: 0000000000000003 x12: 70f000000a33ba80
> > x11: 0000000000080000 x10: 0000000000001378 x9 : efff800000000000
> > x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000001
> > x5 : ffff80008c597858 x4 : ffff8000800f2b38 x3 : ffff8000800f7a00
> > x2 : 0000000000000001 x1 : 0000000000000001 x0 : 0000000000001378
> > Call trace:
> >  __hwasan_check_x0_67043363+0x4/0x30
> >  vgic_mmio_write_invlpi+0xb0/0x174 arch/arm64/kvm/vgic/vgic-mmio-v3.c:5=
46
> >  dispatch_mmio_write+0x2a4/0x308
> >  kvm_iodevice_write include/kvm/iodev.h:54 [inline]
> >  __kvm_io_bus_write+0x290/0x340 virt/kvm/kvm_main.c:5852
> >  kvm_io_bus_write+0x100/0x1bc virt/kvm/kvm_main.c:5877
> >  io_mem_abort+0x4b8/0x7a0 arch/arm64/kvm/mmio.c:204
> >  kvm_handle_guest_abort+0xb4c/0x1c64 arch/arm64/kvm/mmu.c:1880
> >  handle_trap_exceptions arch/arm64/kvm/handle_exit.c:351 [inline]
> >  handle_exit+0x1a0/0x274 arch/arm64/kvm/handle_exit.c:381
> >  kvm_arch_vcpu_ioctl_run+0xbc0/0x15b0 arch/arm64/kvm/arm.c:1279
> >  kvm_vcpu_ioctl+0x660/0xf78 virt/kvm/kvm_main.c:4475
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:907 [inline]
> >  __se_sys_ioctl fs/ioctl.c:893 [inline]
> >  __arm64_sys_ioctl+0x108/0x184 fs/ioctl.c:893
> >  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >  invoke_syscall+0x78/0x1b8 arch/arm64/kernel/syscall.c:49
> >  el0_svc_common+0xe8/0x1b0 arch/arm64/kernel/syscall.c:132
> >  do_el0_svc+0x40/0x50 arch/arm64/kernel/syscall.c:151
> >  el0_svc+0x54/0x14c arch/arm64/kernel/entry-common.c:712
> >  el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
> >  el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> > Code: a90efbfd d2800441 143a3ed3 9344dc10 (38706930)
>
> This seems to be something that is already handled by d561491ba927c
> ("KVM: arm64: vgic-v3: Sanitise guest writes to GICR_INVLPIR"), which
> made it into 6.13-rc1.
>
> The branch you are using doesn't seem to contain that particular
> commit. I have now updated it to -rc3, which should plug that issue.
>
> Let me know if it keeps appearing.
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/867c80ro2w.wl-maz%40kernel.org.

