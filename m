Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C5D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lKgckezM;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=HJIAi/Wl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yNbuuc7ThMlt79T0UHc6c2gYE5BOeK1088M/tFwNgc4=; b=lKgckezMCcagza
	Q1y7bvXef0B4RJwV+oxt2n4tl+DWDCVoYaMvX8ruY3jPXvi7xvnnkAUNxyw6F10eNytiRlvRUgUSu
	0T5hR/mRjRm861SLoDdGlTVj5HxLzvVT009FNJoC4Pn7KDy25G8Nnmljx3BqXgQHYl0Ymm/PoZZyl
	0ejeWNo9FVPLBG5Kh8vg29zoe4X9jcgcA4kCgfxcuA1gQ1mT5o44j8h98mq4s9TRdIIbaDBjX32Qd
	VPIlAxZ55gmE03bj5BJUOemmDXgqm5Ul4HMJxvsuLrxKKIYGH6Wi/81vuOfDKbnuxENphxecq2uSs
	1vWdqOKCGpyNaXNDH/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3jO-0000000AVHw-3wgO;
	Thu, 05 Nov 2026 20:06:42 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3j8-0000000AV9m-2o5A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=yNbuuc7ThMlt79T0UHc6c2gYE5BOeK1088M/tFwNgc4=; t=1793909186; x=2109269186; 
	b=HJIAi/WlmUDekg/Y09aUc3jIiaUclYIw/y+lpLH3+PLJylRPtyGPbPDoZKCgMC8U42yNdnyMsKe
	Xt5XlPOL5qdNr/DZwIACaoQpZ3dSElpwtCtbD+1Dj1t/2udnvYw/sVYcemgcitsI1gfgllcXmT8VU
	2VvMWD7OR4/OvJTFB/5AqXwkW947j+Thiq4Myq4vcy6wtW3TespF1OMcO3QPhLAsfl9n7N7G4ACLs
	vQF55VZT/MhAEea7sIdkxa0MZqGuIGh43YSC5AyY9qI+wfkDEcl5JJKcPand+IlKVi9zegJpoUEzL
	KMQyj/01pYUA8IKWj5KGk1SBcqTJWe3cK8AQ==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP3j3-003hS1-VE; Thu, 05 Nov 2026 21:06:22 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 05 Nov 2026 17:05:40 -0300
Subject: [PATCH v9 05/15] sparc: Use the common syscall table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-tonyk-syscall_table-v9-5-8d1275885d9c@igalia.com>
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
X-CRM114-CacheID: sfid-20261105_120626_769208_D689B7C7 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

Remove some of the duplicated code by using the common syscall number
table.

The generated files are not exactly the same as before, but they have no
functional changes:

 - syscall_table_32.h would generated lines like the following
   __SYSCALL_WITH_COMPAT(422, sys_futex, sys_futex), which is equivalent to
   __SYSCALL(422, sys_futex)

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/sparc/kernel/syscalls/Makefile    | 12 ++++--
 arch/sparc/kernel/syscalls/syscall.tbl | 69 ----------------------------------
 2 files changed, 8 insertions(+), 73 deletions(-)

diff --git a/arch/sparc/kernel/syscalls/Makefile b/arch/sparc/kernel/syscalls/Makefile
index 8440c16dfb22..35ea0834aef3 100644
--- a/arch/sparc/kernel/syscalls/Makefile
+++ b/arch/sparc/kernel/syscalls/Makefile
@@ -5,19 +5,23 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
+syscalltbl_common := $(srctree)/scripts/syscall_common.tbl
 syshdr := $(srctree)/scripts/syscallhdr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
+abis := __clone3,common
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --abis common,$* $< $@
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --abis $(abis),$* \
+		   --common-tbl $(syscalltbl_common) $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis common,$* $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis),$* \
+		   --common-tbl $(syscalltbl_common) $< $@
 
-$(uapi)/unistd_%.h: $(syscall) $(syshdr) FORCE
+$(uapi)/unistd_%.h: $(syscall) $(syscalltbl_common) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(kapi)/syscall_table_%.h: $(syscall) $(systbl) FORCE
+$(kapi)/syscall_table_%.h: $(syscall) $(syscalltbl_common) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_32.h unistd_64.h
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 5b9fe0e8140f..5f407da6b9da 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -449,72 +449,3 @@
 400	common	msgsnd			sys_msgsnd			compat_sys_msgsnd
 401	common	msgrcv			sys_msgrcv			compat_sys_msgrcv
 402	common	msgctl			sys_msgctl			compat_sys_msgctl
-403	32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
-404	32	clock_settime64			sys_clock_settime		sys_clock_settime
-405	32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
-406	32	clock_getres_time64		sys_clock_getres		sys_clock_getres
-407	32	clock_nanosleep_time64		sys_clock_nanosleep		sys_clock_nanosleep
-408	32	timer_gettime64			sys_timer_gettime		sys_timer_gettime
-409	32	timer_settime64			sys_timer_settime		sys_timer_settime
-410	32	timerfd_gettime64		sys_timerfd_gettime		sys_timerfd_gettime
-411	32	timerfd_settime64		sys_timerfd_settime		sys_timerfd_settime
-412	32	utimensat_time64		sys_utimensat			sys_utimensat
-413	32	pselect6_time64			sys_pselect6			compat_sys_pselect6_time64
-414	32	ppoll_time64			sys_ppoll			compat_sys_ppoll_time64
-416	32	io_pgetevents_time64		sys_io_pgetevents		compat_sys_io_pgetevents_time64
-417	32	recvmmsg_time64			sys_recvmmsg			compat_sys_recvmmsg_time64
-418	32	mq_timedsend_time64		sys_mq_timedsend		sys_mq_timedsend
-419	32	mq_timedreceive_time64		sys_mq_timedreceive		sys_mq_timedreceive
-420	32	semtimedop_time64		sys_semtimedop			sys_semtimedop
-421	32	rt_sigtimedwait_time64		sys_rt_sigtimedwait		compat_sys_rt_sigtimedwait_time64
-422	32	futex_time64			sys_futex			sys_futex
-423	32	sched_rr_get_interval_time64	sys_sched_rr_get_interval	sys_sched_rr_get_interval
-424	common	pidfd_send_signal		sys_pidfd_send_signal
-425	common	io_uring_setup			sys_io_uring_setup
-426	common	io_uring_enter			sys_io_uring_enter
-427	common	io_uring_register		sys_io_uring_register
-428	common	open_tree			sys_open_tree
-429	common	move_mount			sys_move_mount
-430	common	fsopen				sys_fsopen
-431	common	fsconfig			sys_fsconfig
-432	common	fsmount				sys_fsmount
-433	common	fspick				sys_fspick
-434	common	pidfd_open			sys_pidfd_open
-435	common	clone3				__sys_clone3
-436	common	close_range			sys_close_range
-437	common	openat2			sys_openat2
-438	common	pidfd_getfd			sys_pidfd_getfd
-439	common	faccessat2			sys_faccessat2
-440	common	process_madvise			sys_process_madvise
-441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
-442	common	mount_setattr			sys_mount_setattr
-443	common	quotactl_fd			sys_quotactl_fd
-444	common	landlock_create_ruleset		sys_landlock_create_ruleset
-445	common	landlock_add_rule		sys_landlock_add_rule
-446	common	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	common	process_mrelease		sys_process_mrelease
-449	common  futex_waitv                     sys_futex_waitv
-450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-451	common	cachestat			sys_cachestat
-452	common	fchmodat2			sys_fchmodat2
-453	common	map_shadow_stack		sys_map_shadow_stack
-454	common	futex_wake			sys_futex_wake
-455	common	futex_wait			sys_futex_wait
-456	common	futex_requeue			sys_futex_requeue
-457	common	statmount			sys_statmount
-458	common	listmount			sys_listmount
-459	common	lsm_get_self_attr		sys_lsm_get_self_attr
-460	common	lsm_set_self_attr		sys_lsm_set_self_attr
-461	common	lsm_list_modules		sys_lsm_list_modules
-462	common	mseal 				sys_mseal
-463	common	setxattrat			sys_setxattrat
-464	common	getxattrat			sys_getxattrat
-465	common	listxattrat			sys_listxattrat
-466	common	removexattrat			sys_removexattrat
-467	common	open_tree_attr			sys_open_tree_attr
-468	common	file_getattr			sys_file_getattr
-469	common	file_setattr			sys_file_setattr
-470	common	listns				sys_listns
-471	common	rseq_slice_yield		sys_rseq_slice_yield
-472	common	fchroot				sys_fchroot

-- 
2.56.0


