Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5131C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32rKyVueiaI6C9W/X0LdWDqFBehAcF9QrZeOUIZ334Q=; b=heAD4lwbquYBZmC3YzswTHwBPu
	5+4fCLQek9ltcIuwcWRgxTS7xJEWVYGhLSIddqacn/bXrcldrgrx1k0KQqY4k7ZyUyNe22yAv5zp6
	XKOXtXIw0TZ+pcOjnNWfGtTSnfWGcTSYY1k4rk0Ry9wTnO+4VDs+VPG7RvI0PqElwysODUA/tKIPN
	Lr40KAIicoagYQWdv6DWqYVdYn7Y/l34Pqi+ZG34cdGmAlyXKJVYeN/HphQug+c9U6smGCMCCHHYm
	53WuDYMye3JsLHprE6gUwcYa/lzDD23NjSSMAZXCr7sbFrBP7z6mCntEN/jmZAg+ml7fIZFW+8Mbi
	tpupKdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Loz-0000000CxfI-0Lb2;
	Thu, 17 Sep 2026 23:47:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Lom-0000000CxXp-47pQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 23:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=32rKyVueiaI6C9W/X0LdWDqFBehAcF9QrZeOUIZ334Q=; b=BXVDXWBEKtlnQMbrJeGNmqFLBb
	c+Pbxwwx4ooiNGuyqsy5XxSOJA1S6iZP4plju1AWC4YXgpdTV9+Fyf5lbUn6cFdJYqqjdIgvdyq2J
	vy0/yqKzV6wmmbWNVEYcbWE7tW4T2GTzYFrNZDEOyNpN7Ysb/hwewOx0CZFAE5NHpRKoASf7rUr8C
	rnrTecS7VQV0r2a5rhnytT206fsjXbZjMePoskCYr/iUYmUNE+x4NTs0S5QsdE3hQQ2LqZVBM5nI7
	10VJprgrC3S4eV405QGHVycr8ReaISOR1IITwksN88S1Hu8+iIJU1/6CmJLsy1lczvzndDch7M0kC
	GtDq4qpA==;
Received: from fanzine2.igalia.com ([213.97.179.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Lok-00000009Ofe-0s1Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 23:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=32rKyVueiaI6C9W/X0LdWDqFBehAcF9QrZeOUIZ334Q=; b=EHi2eVj2e0YVhdXQUZdVC7YHq+
	Q5THvsr0cBRRgTZdQjD+mgxESEAoI9VWXFTDq52dFqNNvbktoakeIyff+xlhpQYQmlzkWrHJeJZn+
	bn7lKTHrTzAsHAuW/pmH5Jb6Rgb5cnTVngVeIXqzDp94ZKjPjBsK8arD0g/RaWHjgZeR5kxpEW/wu
	WLNJkuscjJpt/X9tMa+lGhPtarcLdJhM840/ZkMSL9hzIqng7hBy1eJd/3+/aZfwzW73rgsiusk6c
	EggfhUfSZsqQ32eWXYMT9c8iHyT/kfm9f4D+QARiGjibsiPhQApgjQCckADhAM2MozYI3wUVIT593
	8saawVTw==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x7Loe-003hU7-IE; Fri, 18 Sep 2026 01:46:56 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 17 Sep 2026 20:46:15 -0300
Subject: [PATCH v7 12/13] alpha: Remove alpha_ prefix from custom syscall
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_004702_432933_6DFF0AA7 
X-CRM114-Status: GOOD (  10.00  )
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

Some architectures need special entry points for some syscalls (like
clone3). The current approach is, instead of having a special name like
arch_syscall, to name if as __syscall. This is enough to different the
common entry point to the architecture specific entry point.

Change alpha special syscall entries to do the same. This makes easier to
join the syscall tables. Leave alpha_syscall_zero because this syscall only
exists in alpha anyway.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/alpha/kernel/entry.S              | 8 ++++----
 arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 9f2608de2544..8a85fcf117cb 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -879,9 +879,9 @@ ret_from_kernel_thread:
 
 .macro	fork_like name
 	.align	4
-	.globl	alpha_\name
-	.ent	alpha_\name
-alpha_\name:
+	.globl	__sys_\name
+	.ent	__sys_\name
+__sys_\name:
 	.prologue 0
 	bsr	$1, do_switch_stack
 	// NB: if anyone adds preemption, this block will need to be protected
@@ -896,7 +896,7 @@ alpha_\name:
 	ldq	$26, 56($sp)
 	lda	$sp, SWITCH_STACK_SIZE($sp)
 	ret
-.end	alpha_\name
+.end	__sys_\name
 .endm
 
 fork_like fork
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 8fc4701a6328..a41276634923 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -9,7 +9,7 @@
 #
 0	common	osf_syscall			alpha_syscall_zero
 1	common	exit				sys_exit
-2	common	fork				alpha_fork
+2	common	fork				__sys_fork
 3	common	read				sys_read
 4	common	write				sys_write
 5	common	osf_old_open			sys_ni_syscall
@@ -72,7 +72,7 @@
 63	common	getpgrp				sys_getpgrp
 64	common	getpagesize			sys_getpagesize
 65	common	osf_mremap			sys_ni_syscall
-66	common	vfork				alpha_vfork
+66	common	vfork				__sys_vfork
 67	common	stat				sys_newstat
 68	common	lstat				sys_newlstat
 69	common	osf_sbrk			sys_ni_syscall
@@ -242,7 +242,7 @@
 309	common	get_kernel_syms			sys_ni_syscall
 310	common	syslog				sys_syslog
 311	common	reboot				sys_reboot
-312	common	clone				alpha_clone
+312	common	clone				__sys_clone
 313	common	uselib				sys_uselib
 314	common	mlock				sys_mlock
 315	common	munlock				sys_munlock
@@ -474,7 +474,7 @@
 542	common	fsmount				sys_fsmount
 543	common	fspick				sys_fspick
 544	common	pidfd_open			sys_pidfd_open
-545	common	clone3				alpha_clone3
+545	common	clone3				__clone3
 546	common	close_range			sys_close_range
 547	common	openat2				sys_openat2
 548	common	pidfd_getfd			sys_pidfd_getfd

-- 
2.55.0


