Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A6FEE4E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q8LuITVldGOlUNrpSliupPOmyqk5VihC4Ea6iAcEmgE=; b=ENwb2YGWCHBHDo5AmNq1KNH8xC
	K53LFVv27DZIBeTB9YTKbv/K0+3XggVUFq/0nC9UmEtvuXqiyrkMy1+KnRequZjnkYWI4/pAJYGHF
	Art59pUTXKZzYsIyxoe/+DBlIJXVx1GE6J2AWr8197rTSM7dfLVSlxUSsh3ERdC6tpvkZa2Zn+oU4
	SbaIy06ioNPFIePGY8+Hz9G/t7KNMSbFznu/MlG/xwPOSF6dQ2Pgr66Gij0H0yNFjyZC7guVZgr2Q
	TcE3c/RGXh+ExpQnMat2rEPuO6i40kr3VdFuV6JV0v4ieTgMw7x4PnpTyWhKizfxsNko9ZiEOLDGk
	17Uo4nRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIm9-00000009nzU-2Qo7;
	Sat, 28 Feb 2026 11:46:25 +0000
Received: from mail-oo1-f71.google.com ([209.85.161.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIm7-00000009nzC-2zDd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:46:25 +0000
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679deba5e9fso28472164eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 03:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772279181; x=1772883981;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8LuITVldGOlUNrpSliupPOmyqk5VihC4Ea6iAcEmgE=;
        b=GB30/YfgAWdcy0zkAGbFKW8KLuBYYJLhmuB6uL5ltpm/WGLripeCeiTKje5xxfQnhk
         7giezE7vWDTC2352uKjsUfpgveI2VwzInJhL81VkQX829R3Matv43K4et7qZO/95OrIn
         JAuR3UfvAeubhJh50MXEHBV1M2qdNt9WFnX7fFQCjIZ8nmYjjWG1u18+Z7OQihYvyzSg
         HubWKP3W1jW5+4oXH5xiQjcqciMipHkeAy6CPJzavcWoWDDt7/Z6RpKPnmsGbmY98MYI
         hqv7/eBLxDj2ygke2tIYg16UBF2g+kP9JKwYhYTDfHPfQOKhBEF1Vwzs1mNwUMBM90Z5
         JCcg==
X-Forwarded-Encrypted: i=1; AJvYcCWhsFA9BTypZmQwyfe8igToegJL6G9lIfBLDyeZsrdU2WI9YExm7YdDk2uafWAIioW+PuXRcEprYb4UloAekDeB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp2gtMf0IQcE+ImqZob1DffmPdlD2JdQLCDvp6229sTWuB+mWS
	9blrmCB3rKqyCkiZulUx8yfug3klw+hEBDl1y4sDI6QfoHY34k1gsI9QB/fntIu/ZWsepfyl/wk
	zWgfBOUynx6KFurAVOKRzk1L5Qe0bmzZ3qTVrxNOP1tCZB0WgD5SPLkLrM6o=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2913:b0:679:e7b2:9fb8 with SMTP id
 006d021491bc7-679fadb8af6mr4205368eaf.14.1772279180960; Sat, 28 Feb 2026
 03:46:20 -0800 (PST)
Date: Sat, 28 Feb 2026 03:46:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a2d58c.050a0220.3a55be.003b.GAE@google.com>
Subject: [syzbot] [kvmarm?] [kvm?] BUG: unable to handle kernel paging request
 in kvm_vgic_destroy
From: syzbot <syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_034623_779576_04760102 
X-CRM114-Status: UNSURE (   7.65  )
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

HEAD commit:    6316366129d2 Merge branch kvm-arm64/misc-6.20 into kvmarm-..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=15e59c4a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=148fc9aa8e041d0a
dashboard link: https://syzkaller.appspot.com/bug?extid=f6a46b038fc243ac0175
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13182006580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173900ba580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-63163661.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1018400deda3/vmlinux-63163661.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fb8a8bb5d8a4/Image-63163661.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com

 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x230 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x120/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x5c/0x238 arch/arm64/kernel/entry-common.c:724
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:743
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
Unable to handle kernel paging request at virtual address ffef800000000000
KASAN: maybe wild-memory-access in range [0xff00000000000000-0xff0000000000000f]
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ffef800000000000] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 3651 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 01402009 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : kvm_vgic_dist_destroy arch/arm64/kvm/vgic/vgic-init.c:445 [inline]
pc : kvm_vgic_destroy+0x2d4/0x624 arch/arm64/kvm/vgic/vgic-init.c:518
lr : kvm_vgic_dist_destroy arch/arm64/kvm/vgic/vgic-init.c:444 [inline]
lr : kvm_vgic_destroy+0x290/0x624 arch/arm64/kvm/vgic/vgic-init.c:518
sp : ffff80008e647b90
x29: ffff80008e647ba0 x28: 0000000000000005 x27: cdf00000200a52d8
x26: cdf00000200a4db0 x25: 00000000000000cd x24: cdf00000200a4d8c
x23: 00000000000000cd x22: 00000000000000cd x21: cdf00000200a4ad0
x20: efff800000000000 x19: cdf00000200a4000 x18: 00000000030f4b63
x17: 0000000000000031 x16: 0000000000000000 x15: ffff800088209a68
x14: ffffffffffffffff x13: 0000000000000028 x12: 5df000001795c1f0
x11: ffff800088209a68 x10: 0000000000ff0100 x9 : 0ff0000000000000
x8 : 0000000000000000 x7 : ffff80008672f958 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000002
x2 : 0000000000000008 x1 : 0000000000000000 x0 : 0000000000000007
Call trace:
 kvm_vgic_dist_destroy arch/arm64/kvm/vgic/vgic-init.c:445 [inline] (P)
 kvm_vgic_destroy+0x2d4/0x624 arch/arm64/kvm/vgic/vgic-init.c:518 (P)
 kvm_arch_destroy_vm+0x88/0x138 arch/arm64/kvm/arm.c:299
 kvm_destroy_vm virt/kvm/kvm_main.c:1317 [inline]
 kvm_put_kvm+0x778/0xbe0 virt/kvm/kvm_main.c:1354
 kvm_vm_release+0x58/0x78 virt/kvm/kvm_main.c:1377
 __fput+0x4ac/0x978 fs/file_table.c:468
 ____fput+0x20/0x58 fs/file_table.c:496
 task_work_run+0x1b8/0x250 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:44 [inline]
 exit_to_user_mode_loop+0x110/0x188 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 exit_to_user_mode_prepare_legacy include/linux/irq-entry-common.h:242 [inline]
 arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:81 [inline]
 el0_svc+0x17c/0x238 arch/arm64/kernel/entry-common.c:725
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:743
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
Code: 54000420 b2481c28 d344fd09 d378fc28 (38696a89) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	54000420 	b.eq	0x84  // b.none
   4:	b2481c28 	orr	x8, x1, #0xff00000000000000
   8:	d344fd09 	lsr	x9, x8, #4
   c:	d378fc28 	lsr	x8, x1, #56
* 10:	38696a89 	ldrb	w9, [x20, x9] <-- trapping instruction


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

