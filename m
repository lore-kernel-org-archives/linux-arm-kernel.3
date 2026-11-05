Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1672606EE87
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Khwn7a2N;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=XmFwDud7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5/O6S5F6K46OQur9n0bT3iNtLUJrm6oFeJA2UzjFbHs=; b=Khwn7a2Ni8GYqy
	SBQtzxXd34pJzAR53sthb0p9oULmYpbgW81tC0Sn2x5LRMOfuLSewyMel8EtywEPUaSf0N15OVx6m
	Z/kL86IEnkp80AIWS1jO0ajKiGxFJid51ty/DNsNFN5c1XOvdykzna/kI4KGKe5XSLgoTyuB2G6DS
	r6JC39EC5S77lBjFvdmpcfgp4Mg3Jo66j8NEhAh0Nd6NYMq+cUP5ofIU0w1YCcmbCRwJ3Iatb32jx
	JstZFxLSO/KQDJNuCBHTb27FV1XlDY2NPBoFd2XykgfQzXszztuJv2n9Deq8Cab60kKpyr/iVflvO
	7zsIbgwN3wqKZRPQmeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3kM-0000000AVtc-1Zhb;
	Thu, 05 Nov 2026 20:07:42 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3jd-0000000AVOj-2rkC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=5/O6S5F6K46OQur9n0bT3iNtLUJrm6oFeJA2UzjFbHs=; t=1793909217; x=2109269217; 
	b=XmFwDud7PAcKo6+F1yRmmSx0wrKzmk8/lCf2e4FI2N1TMqdWYFV2xKU2XBjI3sFz1IxAIlz+DH2
	+PUOrBZTtgTYk178dJO0CTaLDGB1Ibw6awDPduoTbe7iLj0A0ClBTaIgI0WkEJ0nObfeO4OQ/dRJU
	QxECSn/zQdxRH+6JZ8ODIBthcCDahRtf6qlpDvhaCJVOwhqn7AxDHgj/k3zubscU1UL8xPGP1WEvq
	r/YaN6gu7XPxXpX8kY+GVsfrz4cQhkQYl7sokVDYg/ej9D9MuIuIPO1qYdl1c8WLnSE/XjtcyrMnF
	iIl6cj2WvPv1BlGuZuO+xhyxW/u6KoP9LQyw==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP3jY-003hS1-O5; Thu, 05 Nov 2026 21:06:52 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 05 Nov 2026 17:05:49 -0300
Subject: [PATCH v9 14/15] arm: Reorganize syscall table and separated the
 ABIs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-tonyk-syscall_table-v9-14-8d1275885d9c@igalia.com>
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
X-CRM114-CacheID: sfid-20261105_120657_914861_614F6934 
X-CRM114-Status: GOOD (  12.40  )
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

arm has three ABIs: EABI, OABI and OABI with compat (OABIC). Those ABIs
shares almost every syscall, but have a few exceptions: some syscalls only
have an entry point for OABI/C (e.g. sys_alarm), and some syscalls have a
special entry point for OABIC (e.g. sys_oabi_pwrite64).

Currently, the syscall table uses the compat column to specify when such
OABI syscall needs an OABIC entry point. However, this makes tricky to move
arm to use the common syscall table: arm doesn't use the compat entry
points for time64 (e.g. compat_sys_pselect6_time64) and rely on the normal
entry point (e.g. sys_pselect6). Given that the build system will generate
the same __SYSCALL_WITH_COMPAT() macro for the whole table, this would
create inconsistency where some syscalls would point to the wrong entry.

To avoid this problem and prepare the architecture to move to the common
table, separate explicitly the ABIs in the local syscall table and drop all
entries for the compat column. Make sure that __SYSCALL_WITH_COMPAT()
always points to the native option.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
This patch was tested comparing the results of `$ strings
arch/arm/kernel/entry-common.o` before and after this patch.
---
 arch/arm/kernel/entry-common.S |  4 +-
 arch/arm/tools/Makefile        |  1 +
 arch/arm/tools/syscall.tbl     | 83 ++++++++++++++++++++++++++++++++----------
 3 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 88336a1292bb..088317cee039 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -456,8 +456,8 @@ ENDPROC(sys_oabi_readahead)
  */
 	syscall_table_start sys_oabi_call_table
 #undef __SYSCALL_WITH_COMPAT
-#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
-#include <calls-oabi.S>
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
+#include <calls-oabic.S>
 	syscall_table_end sys_oabi_call_table
 
 #endif
diff --git a/arch/arm/tools/Makefile b/arch/arm/tools/Makefile
index 28b6da8ac5f6..cde235b382bd 100644
--- a/arch/arm/tools/Makefile
+++ b/arch/arm/tools/Makefile
@@ -14,6 +14,7 @@ systbl := $(srctree)/scripts/syscalltbl.sh
 syscall := $(src)/syscall.tbl
 
 gen-y := $(gen)/calls-oabi.S
+gen-y := $(gen)/calls-oabic.S
 gen-y += $(gen)/calls-eabi.S
 kapi-hdrs-y := $(kapi)/unistd-nr.h
 kapi-hdrs-y += $(kapi)/mach-types.h
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index 55717ed32c27..944f11030ab4 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -26,6 +26,7 @@
 11	common	execve			sys_execve
 12	common	chdir			sys_chdir
 13	oabi	time			sys_time32
+13	oabic	time			sys_time32
 14	common	mknod			sys_mknod
 15	common	chmod			sys_chmod
 16	common	lchown			sys_lchown16
@@ -35,14 +36,18 @@
 20	common	getpid			sys_getpid
 21	common	mount			sys_mount
 22	oabi	umount			sys_oldumount
+22	oabic	umount			sys_oldumount
 23	common	setuid			sys_setuid16
 24	common	getuid			sys_getuid16
 25	oabi	stime			sys_stime32
+25	oabic	stime			sys_stime32
 26	common	ptrace			sys_ptrace
 27	oabi	alarm			sys_alarm
+27	oabic	alarm			sys_alarm
 # 28 was sys_fstat
 29	common	pause			sys_pause
 30	oabi	utime			sys_utime32
+30	oabic	utime			sys_utime32
 # 31 was sys_stty
 # 32 was sys_gtty
 33	common	access			sys_access
@@ -90,12 +95,14 @@
 75	common	setrlimit		sys_setrlimit
 # Back compat 2GB limited rlimit
 76	oabi	getrlimit		sys_old_getrlimit
+76	oabic	getrlimit		sys_old_getrlimit
 77	common	getrusage		sys_getrusage
 78	common	gettimeofday		sys_gettimeofday
 79	common	settimeofday		sys_settimeofday
 80	common	getgroups		sys_getgroups16
 81	common	setgroups		sys_setgroups16
 82	oabi	select			sys_old_select
+82	oabic	select			sys_old_select
 83	common	symlink			sys_symlink
 # 84 was sys_lstat
 85	common	readlink		sys_readlink
@@ -103,7 +110,9 @@
 87	common	swapon			sys_swapon
 88	common	reboot			sys_reboot
 89	oabi	readdir			sys_old_readdir
+89	oabic	readdir			sys_old_readdir
 90	oabi	mmap			sys_old_mmap
+90	oabic	mmap			sys_old_mmap
 91	common	munmap			sys_munmap
 92	common	truncate		sys_truncate
 93	common	ftruncate		sys_ftruncate
@@ -115,7 +124,8 @@
 99	common	statfs			sys_statfs
 100	common	fstatfs			sys_fstatfs
 # 101 was sys_ioperm
-102	oabi	socketcall		sys_socketcall		sys_oabi_socketcall
+102	oabi	socketcall		sys_socketcall
+102	oabic	socketcall		sys_oabi_socketcall
 103	common	syslog			sys_syslog
 104	common	setitimer		sys_setitimer
 105	common	getitimer		sys_getitimer
@@ -131,7 +141,8 @@
 114	common	wait4			sys_wait4
 115	common	swapoff			sys_swapoff
 116	common	sysinfo			sys_sysinfo
-117	oabi	ipc			sys_ipc			sys_oabi_ipc
+117	oabi	ipc			sys_ipc
+117	oabic	ipc			sys_oabi_ipc
 118	common	fsync			sys_fsync
 119	common	sigreturn		sys_sigreturn_wrapper
 120	common	clone			sys_clone
@@ -194,8 +205,12 @@
 177	common	rt_sigtimedwait		sys_rt_sigtimedwait_time32
 178	common	rt_sigqueueinfo		sys_rt_sigqueueinfo
 179	common	rt_sigsuspend		sys_rt_sigsuspend
-180	common	pread64			sys_pread64		sys_oabi_pread64
-181	common	pwrite64		sys_pwrite64		sys_oabi_pwrite64
+180	eabi	pread64			sys_pread64
+180	oabi	pread64			sys_pread64
+180	oabic	pread64			sys_oabi_pread64
+181	eabi	pwrite64		sys_pwrite64
+181	oabi	pwrite64		sys_pwrite64
+181	oabic	pwrite64		sys_oabi_pwrite64
 182	common	chown			sys_chown16
 183	common	getcwd			sys_getcwd
 184	common	capget			sys_capget
@@ -208,11 +223,21 @@
 # SuS compliant getrlimit
 191	common	ugetrlimit		sys_getrlimit
 192	common	mmap2			sys_mmap2
-193	common	truncate64		sys_truncate64		sys_oabi_truncate64
-194	common	ftruncate64		sys_ftruncate64		sys_oabi_ftruncate64
-195	common	stat64			sys_stat64		sys_oabi_stat64
-196	common	lstat64			sys_lstat64		sys_oabi_lstat64
-197	common	fstat64			sys_fstat64		sys_oabi_fstat64
+193	eabi	truncate64		sys_truncate64
+193	oabi	truncate64		sys_truncate64
+193	oabic	truncate64		sys_oabi_truncate64
+194	eabi	ftruncate64		sys_ftruncate64
+194	oabi	ftruncate64		sys_ftruncate64
+194	oabic	ftruncate64		sys_oabi_ftruncate64
+195	eabi	stat64			sys_stat64
+195	oabi	stat64			sys_stat64
+195	oabic	stat64			sys_oabi_stat64
+196	eabi	lstat64			sys_lstat64
+196	oabi	lstat64			sys_lstat64
+196	oabic	lstat64			sys_oabi_lstat64
+197	eabi	fstat64			sys_fstat64
+197	oabi	fstat64			sys_fstat64
+197	oabic	fstat64			sys_oabi_fstat64
 198	common	lchown32		sys_lchown
 199	common	getuid32		sys_getuid
 200	common	getgid32		sys_getgid
@@ -236,11 +261,15 @@
 218	common	pivot_root		sys_pivot_root
 219	common	mincore			sys_mincore
 220	common	madvise			sys_madvise
-221	common	fcntl64			sys_fcntl64		sys_oabi_fcntl64
+221	oabi	fcntl64			sys_fcntl64
+221	eabi	fcntl64			sys_fcntl64
+221	oabic	fcntl64			sys_oabi_fcntl64
 # 222 for tux
 # 223 is unused
 224	common	gettid			sys_gettid
-225	common	readahead		sys_readahead		sys_oabi_readahead
+225	oabi	readahead		sys_readahead
+225	eabi	readahead		sys_readahead
+225	oabic	readahead		sys_oabi_readahead
 226	common	setxattr		sys_setxattr
 227	common	lsetxattr		sys_lsetxattr
 228	common	fsetxattr		sys_fsetxattr
@@ -266,7 +295,9 @@
 248	common	exit_group		sys_exit_group
 249	common	lookup_dcookie		sys_ni_syscall
 250	common	epoll_create		sys_epoll_create
-251	common	epoll_ctl		sys_epoll_ctl		sys_oabi_epoll_ctl
+251	oabi	epoll_ctl		sys_epoll_ctl
+251	eabi	epoll_ctl		sys_epoll_ctl
+251	oabic	epoll_ctl		sys_oabi_epoll_ctl
 252	common	epoll_wait		sys_epoll_wait
 253	common	remap_file_pages	sys_remap_file_pages
 # 254 for set_thread_area
@@ -297,23 +328,33 @@
 279	common	mq_getsetattr		sys_mq_getsetattr
 280	common	waitid			sys_waitid
 281	common	socket			sys_socket
-282	common	bind			sys_bind		sys_oabi_bind
-283	common	connect			sys_connect		sys_oabi_connect
+282	eabi	bind			sys_bind
+282	oabi	bind			sys_bind
+282	oabic	bind			sys_oabi_bind
+283	eabi	connect			sys_connect
+283	oabi	connect			sys_connect
+283	oabic	connect			sys_oabi_connect
 284	common	listen			sys_listen
 285	common	accept			sys_accept
 286	common	getsockname		sys_getsockname
 287	common	getpeername		sys_getpeername
 288	common	socketpair		sys_socketpair
 289	common	send			sys_send
-290	common	sendto			sys_sendto		sys_oabi_sendto
+290	eabi	sendto			sys_sendto
+290	oabi	sendto			sys_sendto
+290	oabic	sendto			sys_oabi_sendto
 291	common	recv			sys_recv
 292	common	recvfrom		sys_recvfrom
 293	common	shutdown		sys_shutdown
 294	common	setsockopt		sys_setsockopt
 295	common	getsockopt		sys_getsockopt
-296	common	sendmsg			sys_sendmsg		sys_oabi_sendmsg
+296	eabi	sendmsg			sys_sendmsg
+296	oabi	sendmsg			sys_sendmsg
+296	oabic	sendmsg			sys_oabi_sendmsg
 297	common	recvmsg			sys_recvmsg
-298	common	semop			sys_semop		sys_oabi_semop
+298	eabi	semop			sys_semop
+298	oabi	semop			sys_semop
+298	oabic	semop			sys_oabi_semop
 299	common	semget			sys_semget
 300	common	semctl			sys_old_semctl
 301	common	msgsnd			sys_msgsnd
@@ -327,7 +368,9 @@
 309	common	add_key			sys_add_key
 310	common	request_key		sys_request_key
 311	common	keyctl			sys_keyctl
-312	common	semtimedop		sys_semtimedop_time32	sys_oabi_semtimedop
+312	eabi	semtimedop		sys_semtimedop_time32
+312	oabi	semtimedop		sys_semtimedop_time32
+312	oabic	semtimedop		sys_oabi_semtimedop
 313	common	vserver
 314	common	ioprio_set		sys_ioprio_set
 315	common	ioprio_get		sys_ioprio_get
@@ -342,7 +385,9 @@
 324	common	mknodat			sys_mknodat
 325	common	fchownat		sys_fchownat
 326	common	futimesat		sys_futimesat_time32
-327	common	fstatat64		sys_fstatat64		sys_oabi_fstatat64
+327	eabi	fstatat64		sys_fstatat64
+327	oabi	fstatat64		sys_fstatat64
+327	oabic	fstatat64		sys_oabi_fstatat64
 328	common	unlinkat		sys_unlinkat
 329	common	renameat		sys_renameat
 330	common	linkat			sys_linkat

-- 
2.56.0


