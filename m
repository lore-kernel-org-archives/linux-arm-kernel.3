Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37899CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uH9ncuVNWrmpKccRdCmFgVg8gN7Sa+FrJMkcgErOzbI=; b=bznwrgk0+LabqZ
	huCT/7QFqICpXdtvbGwMzfZpROPiquGqqzXaUvLlk3HlcEMxRKOHz6tBDsl32T5EGBpX+wJw411tR
	u+Bff4cTe6JJ3IvBjvUKSUWizyNryuxJc83dTJe0FM35hvi7WOiH2NuBRaeUuvv0GVoIy1r0PdFXC
	mhJsw4ZogIIXSG5mjdUXFZfDPi2KbAdJ2lnXmspiTnNpZuT2VFYaPDCCWjumF+c5U3+tATpJUpVPh
	Bb+bogKT8CrGlBVEOnjaeAZWjxaQ5EwnneM78rJ/jDgTN+xD9rDbo8mhaEBKCnyK9CHbNUAdul5AT
	NzwgExTBrB8M1cEbJedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qlj-00000005Pu4-2bIW;
	Thu, 16 Oct 2025 16:23:59 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qlg-00000005Psu-3sgL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:23:58 +0000
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-430c6b6ce73so2405325ab.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 09:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631835; x=1761236635;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uH9ncuVNWrmpKccRdCmFgVg8gN7Sa+FrJMkcgErOzbI=;
        b=SsWc0rzrK+UcHVY8W7Cui4hFC0xYgrKr7Gp7QiCQQvvPLt1Rk8C3wMZDmWDr2uuC5a
         ikLUNR8nlE1uu3wsYz/KIT8ARaYbKHkM5TNIOnsAH+HSsip18ECbo10h+ziYKOYMV3BG
         UAhbg8XOtNlUouOChukYDfnXHA0nLGaREuwGyvF2eChP0dj05qoVWJq4T/8Ax5+XyAWd
         9LdGPdarQEKqOMSUMhR7FY4xqSflbQ2Bg15ena/aWKjHuPtK6zPL9YVYAJpaS1czpVIb
         P9Enzdhyb9tcXO9FJwjhuk5jIIevLhKYOBnBrxCAK1wpayv922cy9lae2PUaqRP1VXit
         rsRg==
X-Forwarded-Encrypted: i=1; AJvYcCXAZBD2pqlw+mLDeVi6B+ie13/Z/baD0cBoc4ubKuCAvImGpgmB4w7L/mXZoYYIgWD9n+pn0vx37Qu2UZ/WJXvg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4rXHTVcY71Vbc5G+ncWrPMnwzxSq1Z4dX7pwBzZZL8nCuRic
	l+EZ1zZLkb11MhCM0cErXwsBsSGnkJkUZOXTBlIMfk7khZdt1y6oEslj/fCjdc2rlXgPmOT4Sye
	GbPKx+Fh6UIrx+XLIqfQ/V+g/hCVDCLoe6yHU0BzARM9frQ/36RVsnlwvr60=
X-Google-Smtp-Source: AGHT+IF0mVeBbeh6pgt7i0/MkOWl7EBWMggnxuS/B6V6XUo6s2UTse3jty2HFSlMCH44YjluTZGifEjNeS3+6UR8CA7xp8eCe2kH
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148d:b0:430:b167:3604 with SMTP id
 e9e14a558f8ab-430c5209bafmr12878615ab.4.1760631834789; Thu, 16 Oct 2025
 09:23:54 -0700 (PDT)
Date: Thu, 16 Oct 2025 09:23:54 -0700
In-Reply-To: <20251016112704.179280-1-yintirui@huawei.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f11c1a.050a0220.91a22.0411.GAE@google.com>
Subject: [syzbot ci] Re: mm: add huge pfnmap support for remap_pfn_range()
From: syzbot ci <syzbot+ci290b7e46a3349a6e@syzkaller.appspotmail.com>
To: abrestic@rivosinc.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anshuman.khandual@arm.com, aou@eecs.berkeley.edu, apopple@nvidia.com, 
	ardb@kernel.org, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	catalin.marinas@arm.com, chenjun102@huawei.com, david@redhat.com, 
	dev.jain@arm.com, liam.howlett@oracle.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, luxu.kernel@bytedance.com, mhocko@suse.com, 
	npache@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	rppt@kernel.org, ryan.roberts@arm.com, samuel.holland@sifive.com, 
	surenb@google.com, vbabka@suse.cz, wangkefeng.wang@huawei.com, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yintirui@huawei.com, yongxuan.wang@sifive.com, ziy@nvidia.com
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_092356_966077_21A1DB23 
X-CRM114-Status: UNSURE (   8.52  )
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

syzbot ci has tested the following series

[v2] mm: add huge pfnmap support for remap_pfn_range()
https://lore.kernel.org/all/20251016112704.179280-1-yintirui@huawei.com
* [PATCH RFC 1/2] pgtable: add pte_clrhuge() implementation for arm64 and riscv
* [PATCH RFC 2/2] mm: add PMD-level huge page support for remap_pfn_range()

and found the following issue:
stack segment fault in pgtable_trans_huge_withdraw

Full report is available here:
https://ci.syzbot.org/series/d04c2914-0d99-4132-89d4-899e22abf904

***

stack segment fault in pgtable_trans_huge_withdraw

tree:      torvalds
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
base:      3a8660878839faadb4f1a6dd72c3179c1df56787
arch:      amd64
compiler:  Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
config:    https://ci.syzbot.org/builds/9d7864e5-ad3a-4c0d-b21d-86cfc476792e/config
C repro:   https://ci.syzbot.org/findings/b9fca361-413d-4db1-b8b2-1849cd2c50dd/c_repro
syz repro: https://ci.syzbot.org/findings/b9fca361-413d-4db1-b8b2-1849cd2c50dd/syz_repro

Oops: stack segment: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5968 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:pgtable_trans_huge_withdraw+0x115/0x310 mm/pgtable-generic.c:188
Code: c3 10 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 9d e9 13 00 48 8b 03 48 89 04 24 4c 8d 78 08 4c 89 fd 48 c1 ed 03 <42> 80 7c 2d 00 00 74 08 4c 89 ff e8 7b e9 13 00 49 8b 07 48 8d 48
RSP: 0018:ffffc90003717300 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffffea00044848d0 RCX: ffff88816c890000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffff88816db66a23 R09: 1ffff1102db6cd44
R10: dffffc0000000000 R11: ffffed102db6cd45 R12: ffff888112123000
R13: dffffc0000000000 R14: ffff888112123000 R15: 0000000000000008
FS:  000055556cb5f500(0000) GS:ffff88818e70c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000001102a4000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 zap_deposited_table mm/huge_memory.c:2169 [inline]
 zap_huge_pmd+0xa25/0xf50 mm/huge_memory.c:2197
 zap_pmd_range mm/memory.c:1926 [inline]
 zap_pud_range mm/memory.c:1975 [inline]
 zap_p4d_range mm/memory.c:1996 [inline]
 unmap_page_range+0x9fe/0x4370 mm/memory.c:2017
 unmap_single_vma mm/memory.c:2060 [inline]
 unmap_vmas+0x399/0x580 mm/memory.c:2104
 exit_mmap+0x240/0xb40 mm/mmap.c:1280
 __mmput+0x118/0x430 kernel/fork.c:1133
 copy_process+0x2910/0x3c00 kernel/fork.c:2460
 kernel_clone+0x21e/0x840 kernel/fork.c:2609
 __do_sys_clone kernel/fork.c:2750 [inline]
 __se_sys_clone kernel/fork.c:2734 [inline]
 __x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2734
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f946958eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc41c94258 EFLAGS: 00000206 ORIG_RAX: 0000000000000038
RAX: ffffffffffffffda RBX: 00007f94697e5fa0 RCX: 00007f946958eec9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000002001000
RBP: 00007f9469611f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 00007f94697e5fa0 R14: 00007f94697e5fa0 R15: 0000000000000006
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:pgtable_trans_huge_withdraw+0x115/0x310 mm/pgtable-generic.c:188
Code: c3 10 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 9d e9 13 00 48 8b 03 48 89 04 24 4c 8d 78 08 4c 89 fd 48 c1 ed 03 <42> 80 7c 2d 00 00 74 08 4c 89 ff e8 7b e9 13 00 49 8b 07 48 8d 48
RSP: 0018:ffffc90003717300 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffffea00044848d0 RCX: ffff88816c890000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffff88816db66a23 R09: 1ffff1102db6cd44
R10: dffffc0000000000 R11: ffffed102db6cd45 R12: ffff888112123000
R13: dffffc0000000000 R14: ffff888112123000 R15: 0000000000000008
FS:  000055556cb5f500(0000) GS:ffff88818e70c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000001102a4000 CR4: 00000000000006f0
----------------
Code disassembly (best guess):
   0:	c3                   	ret
   1:	10 48 89             	adc    %cl,-0x77(%rax)
   4:	d8 48 c1             	fmuls  -0x3f(%rax)
   7:	e8 03 42 80 3c       	call   0x3c80420f
   c:	28 00                	sub    %al,(%rax)
   e:	74 08                	je     0x18
  10:	48 89 df             	mov    %rbx,%rdi
  13:	e8 9d e9 13 00       	call   0x13e9b5
  18:	48 8b 03             	mov    (%rbx),%rax
  1b:	48 89 04 24          	mov    %rax,(%rsp)
  1f:	4c 8d 78 08          	lea    0x8(%rax),%r15
  23:	4c 89 fd             	mov    %r15,%rbp
  26:	48 c1 ed 03          	shr    $0x3,%rbp
* 2a:	42 80 7c 2d 00 00    	cmpb   $0x0,0x0(%rbp,%r13,1) <-- trapping instruction
  30:	74 08                	je     0x3a
  32:	4c 89 ff             	mov    %r15,%rdi
  35:	e8 7b e9 13 00       	call   0x13e9b5
  3a:	49 8b 07             	mov    (%r15),%rax
  3d:	48                   	rex.W
  3e:	8d                   	.byte 0x8d
  3f:	48                   	rex.W


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

