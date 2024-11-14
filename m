Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CCCD6A222
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PyBn26mUePqthY9XrpQhwn7miJxqIZLoeEl6nlPcolo=; b=wRaZZ0tsNGDRtR7lTHnfidJSWT
	u6rKKy+TL+z24HhHmqtgY3oQ8n9IijOURmmpW5LEQbx4xAyQlRtE1cYybIQJfkylVGPxWVo9a+sWd
	CuvDmCUSa6LNH7VLh0jdLvAYpvF099ttr9wxB7qrGFQT08Icnz4gOoQS//ZQPgm7PdWBwtEaXnM1p
	lDtOQPoHd+ApQ+UkEQIUFYqOaaCKjy2WHS4/9sk566UiDYJFmkXmX9bFOg5uvdVkuCjmsyE9+O/X/
	LZt0Fc8bknYP+Z3C/hOYQ4AHDNsLDd2iXCKDqWJnweDzgOs/koYF1oWKOFImEJ5w7omZJ+7Q3Kax+
	1BFccZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdlc-00000000LPt-48bZ;
	Thu, 14 Nov 2024 17:36:28 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdkg-00000000LJ3-3XKI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:35:32 +0000
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a7447028bcso4760975ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 09:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731605729; x=1732210529;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PyBn26mUePqthY9XrpQhwn7miJxqIZLoeEl6nlPcolo=;
        b=qQg1dhCDI8iYNTV90fz0XaLBciFkZjU9NTVZAA9isKz9T/8U14AUvrz0BWS7nX0OHq
         jLidCkQSSTyU2YAN/EdODaOvytaAk1/INlOKMcsXc5yQu1IQC7vzJjnpKkNf5UebZ1/W
         rEWGn5RFTXM13si4JBfEHzM13Y+XUKM1IImbs3pg+3c6u3pw8sLw46dRkZIv+Lcsjcrx
         m3NTczQNzPajUJG47wI+FOccgQOA9PHSRU7zBG6GVxlDUJZyjblbLIIPzmVjY55Z5xu2
         grw7pEBe1V1knyI3XfRKOZG00RS8Of3ErUqCBptKiMDVpSlIf5SLap58XjMYvU1k/mCo
         OcUA==
X-Forwarded-Encrypted: i=1; AJvYcCXCaui1rkF0qP31hKGvF5QleZPLHzvWXw8w45uU52QML+srRkh8eouG2ap+yGfuxnP3t8xOVGT9MsvmimCx12UN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4jZAcDRrQi5l/8N3nymDI20SoHwgAYrOsJXBA9PsJW6V6lp8w
	1dDZULre0SHXH4u2n//q0fujr/G8Lvv50KcJTxDXu90hnvPPKdN1hFpwz5jlBbAGeBnRTDjJmmP
	zQI24DwxFHvJ294OB3OPVspSt3AilOuZLiJu7RLBxBjOx25w8IXNSpdY=
X-Google-Smtp-Source: AGHT+IGArfQl0h1dH8qLIGSN+m5H0UpJUvpQ7t2lE3lgEmpmzkn62NzkZK3va21oObzriu4b26lvMeqFvzxzKH2wLjKKv0K7GlhR
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2181:b0:3a6:f349:71e6 with SMTP id
 e9e14a558f8ab-3a71fec44f3mr31321115ab.22.1731605728729; Thu, 14 Nov 2024
 09:35:28 -0800 (PST)
Date: Thu, 14 Nov 2024 09:35:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673634e0.050a0220.1324f8.009d.GAE@google.com>
Subject: [syzbot] [kvmarm?] WARNING in kvm_handle_mmio_return
From: syzbot <syzbot+4727d10d6a805738b0f2@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_093530_886733_BEAE82D5 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

Hello,

syzbot found the following issue on:

HEAD commit:    2d5404caa8c7 Linux 6.12-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1393335f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a0d77fb8077b4744
dashboard link: https://syzkaller.appspot.com/bug?extid=4727d10d6a805738b0f2
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1793335f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144ff4e8580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-2d5404ca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9fafeb95420d/vmlinux-2d5404ca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/498f7a357ea2/Image-2d5404ca.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4727d10d6a805738b0f2@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 3270 at arch/arm64/include/asm/kvm_emulate.h:536 kvm_handle_mmio_return+0x1b4/0x1f4 arch/arm64/kvm/mmio.c:99
Modules linked in:
CPU: 0 UID: 0 PID: 3270 Comm: syz-executor447 Not tainted 6.12.0-rc7-syzkaller #0
Hardware name: linux,dummy-virt (DT)
pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : kvm_incr_pc arch/arm64/include/asm/kvm_emulate.h:536 [inline]
pc : kvm_handle_mmio_return+0x1b4/0x1f4 arch/arm64/kvm/mmio.c:118
lr : kvm_arch_vcpu_ioctl_run+0x1ac/0x854 arch/arm64/kvm/arm.c:1135
sp : ffff800088e33ab0
x29: ffff800088e33ab0 x28: f6f0000005b35b40 x27: 0000000000000000
x26: 0000000000000000 x25: fbf00000073d8048 x24: fbf00000073d8000
x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000000
x20: f3f000000664a000 x19: fbf00000073d8000 x18: ffffffffffffffff
x17: 0000000000000000 x16: 0000000000000000 x15: ffff800088e33aa0
x14: ffff800088e33d88 x13: ffff800088e33d4a x12: 6d766b3a65646f6e
x11: 0000000000000000 x10: 0000000000000078 x9 : 000000000000000c
x8 : ffff800088e33d98 x7 : 0000000000000000 x6 : 0000000000005452
x5 : 0000000000000005 x4 : f0f00000060bd300 x3 : f6f0000005b35b40
x2 : 0000000000000000 x1 : 0000000093c18046 x0 : 0000000000000001
Call trace:
 kvm_handle_mmio_return+0x1b4/0x1f4 arch/arm64/kvm/mmio.c:99
 kvm_arch_vcpu_ioctl_run+0x1ac/0x854 arch/arm64/kvm/arm.c:1135
 kvm_vcpu_ioctl+0x294/0xa04 virt/kvm/kvm_main.c:4475
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0xac/0xf0 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x48/0x110 arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x1c/0x28 arch/arm64/kernel/syscall.c:151
 el0_svc+0x30/0xdc arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x100/0x12c arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x19c/0x1a0 arch/arm64/kernel/entry.S:598
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

