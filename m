Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5314606D832
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwxNAM3z;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=atWTpB42
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SU1M25qINQgNOKxrAiXC/3CTD8Pd/ZEYEU3LyG62jic=; b=nwxNAM3zOXqPWx
	Np7BycGZ+hfx6g6vIbZJsX80HWuUicBS8MsqrrDHXaMfBtqqS22eYPhWyJdQzo2VmqO9DVW0tYIno
	iyVuQa4oiWz96pzrIIQE8MffFNEvo59hDDRg1MEnbTEnAAgBYIq+j7hc9m5DJO73Y6cRINt24zR/y
	zXT47JFAH2FKGADRaz1ov4EtpljGpZSt2IfcersU+gFvJ5GTWNFA7FwUpYSXGpQj83CyPeh9a5YU1
	EhFkFyir29YVXENg+xeZCrxQ/kdtfgKiExPeyAzHyl/9vlR+riISd38zZsRqC8UUm2Ck0iHXwCHkX
	wy/0BovHVjzQhEOb54gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3kL-0000000AVrp-3Sh3;
	Thu, 05 Nov 2026 20:07:41 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3jS-0000000AVNO-3uXD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=SU1M25qINQgNOKxrAiXC/3CTD8Pd/ZEYEU3LyG62jic=; t=1793909206; x=2109269206; 
	b=atWTpB42xM/xcbIcE0gFCs7mwgi2nRs6bGuKxXZ51Onn2DSvNpxiwQLlYwImn6aPhAIXtOg9A0X
	UHqRjxZX13b719WhwDg+dteaCxBBCU/MXB8Z1z39S7/aZP1VZzsrnmkWFMi8VbLbobqU6iwkzyQ0Z
	K6E0RcVOh8amzpkcTj1n0oiWZMSU7+UPZtdNMPAOyujnGMZz1DgQYFsRY0VCGKe0lOgFu05obCWVU
	9XSgRqJ9xqcvjh7o0lZMxdrHk198F80UOfRo3WWJD78aTwHeU7nhb1oFx8ZN03Yn1cKrbrLTCmMy7
	zdqfgatgZ0B+NvQoXZtnKPj0d2F1RLg52kMg==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP3jO-003hS1-H1; Thu, 05 Nov 2026 21:06:42 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 05 Nov 2026 17:05:46 -0300
Subject: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall
 entries
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
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
X-CRM114-CacheID: sfid-20261105_120656_869597_38EDB6BA 
X-CRM114-Status: GOOD (  10.40  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some architectures need special entry points for some syscalls (like
clone3). The current approach is, instead of having a special name like
arch_syscall, to name if as __syscall. This is enough to different the
common entry point to the architecture specific entry point.

Change alpha special syscall entries to do the same. This makes easier to
join the syscall tables. Leave alpha_syscall_zero because this syscall only
exists in alpha anyway.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
Changes from v7:
- Fix __clone3 entry
---
 arch/alpha/kernel/entry.S              | 8 ++++----
 arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 790389a15c3c..25d05f45512d 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -729,9 +729,9 @@ ret_from_kernel_thread:
 
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
@@ -746,7 +746,7 @@ alpha_\name:
 	ldq	$26, 56($sp)
 	lda	$sp, SWITCH_STACK_SIZE($sp)
 	ret
-.end	alpha_\name
+.end	__sys_\name
 .endm
 
 fork_like fork
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 8fc4701a6328..59eb066a40bf 100644
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
+545	common	clone3				__sys__clone3
 546	common	close_range			sys_close_range
 547	common	openat2				sys_openat2
 548	common	pidfd_getfd			sys_pidfd_getfd

-- 
2.56.0


