Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E07DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw7jIcOsSg0tBd7gNAqEYhzUy1bQIgWLTtkuMdy3GPA=; b=kqXq4OKhio6nz4ijNXyTW+25aD
	VWkMqEOqavEdiXRfE6bw7O0VRQtEE1vBjL6ETiLU/YMRLt0yqDbt8RySi/74YKmnnSYkN3SF04CPe
	gzAz+srKzhcchsxbX/thFhiyGHzznbOzH2e3w+U/iMttCFslFr35H/XJw/ufrYPgW8P2xTRKrQ3gn
	oNnt/XkUuOgGzmH0VyJk5gTJAfDJrd+pdiAH2GopMmHs7dDCua+6d2QMJdj/wDktQ+dRufBK9DZZ+
	bfkdHezGwvhG23T7EOjSZ3KZ2FD4idcY5UigM9pPoxIPd9h/QecjmsdDGQoifnBN+UBghaly4vutr
	icBHbtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCvc-0000000GhCE-3FbN;
	Wed, 12 Aug 2026 17:39:48 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCvW-0000000Gh2n-1Aob
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=xw7jIcOsSg0tBd7gNAqEYhzUy1bQIgWLTtkuMdy3GPA=; b=JP3/SjcW4cYIiHFvmK39FYekco
	BFV5gnZDe1H68KsQRgJCoy6+n1+XRiteVypBEdMePoev1w1TlXPKUg+66AOI0A5JapTk9c82qn2aB
	lAP09cksFDK4OFjb0HZu5243s/sRJZzE7an339IC39SxIH4AxXwKOcZ78fXtdbtfoy6DwWEI++drJ
	3rVAvcjqaqCJoucjUb2md8KaAsvGjpK5jerzNQ03wknc1C2Ne9wlhOig6URP5WCyp90F4rrG59KTi
	redlI1duW7V7pEOikC3Qk0weyBSmoNoAZ2SemZJcjScwSgeEFV9CmQ5IKbA+44OGG/0l8yASFLRYq
	vYA19Q/Q==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wuCvP-000FR2-6K; Wed, 12 Aug 2026 19:39:35 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 14:38:44 -0300
Subject: [PATCH v5 13/13] alpha: Use the common syscall table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v5-13-3d383927c609@igalia.com>
References: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, parclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_103942_346761_A8C25A1C 
X-CRM114-Status: UNSURE (   7.69  )
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

Remove some of the duplicated code by using the common syscall number
table.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/alpha/kernel/syscalls/Makefile    | 10 +++++--
 arch/alpha/kernel/syscalls/syscall.tbl | 48 ----------------------------------
 arch/alpha/kernel/systbls.S            |  1 +
 3 files changed, 9 insertions(+), 50 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/syscalls/Makefile
index b265e4bc16c2..18682418327b 100644
--- a/arch/alpha/kernel/syscalls/Makefile
+++ b/arch/alpha/kernel/syscalls/Makefile
@@ -7,12 +7,18 @@ $(shell mkdir -p $(uapi) $(kapi))
 syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/scripts/syscallhdr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
+systbl_common := $(srctree)/scripts/syscall_common.tbl
+abis := common,__clone3
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr \
+		   --common-tbl $(systbl_common) --common-offset 110 \
+		   --abis $(abis) $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
+		   --common-tbl $(systbl_common) --common-offset 110 \
+		   --abis $(abis) $< $@
 
 $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 34151d1653d6..7066a3920899 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -463,51 +463,3 @@
 532	common	getppid				sys_getppid
 # all other architectures have common numbers for new syscall, alpha
 # is the exception.
-534	common	pidfd_send_signal		sys_pidfd_send_signal
-535	common	io_uring_setup			sys_io_uring_setup
-536	common	io_uring_enter			sys_io_uring_enter
-537	common	io_uring_register		sys_io_uring_register
-538	common	open_tree			sys_open_tree
-539	common	move_mount			sys_move_mount
-540	common	fsopen				sys_fsopen
-541	common	fsconfig			sys_fsconfig
-542	common	fsmount				sys_fsmount
-543	common	fspick				sys_fspick
-544	common	pidfd_open			sys_pidfd_open
-545	common	clone3				__clone3
-546	common	close_range			sys_close_range
-547	common	openat2				sys_openat2
-548	common	pidfd_getfd			sys_pidfd_getfd
-549	common	faccessat2			sys_faccessat2
-550	common	process_madvise			sys_process_madvise
-551	common	epoll_pwait2			sys_epoll_pwait2
-552	common	mount_setattr			sys_mount_setattr
-553	common	quotactl_fd			sys_quotactl_fd
-554	common	landlock_create_ruleset		sys_landlock_create_ruleset
-555	common	landlock_add_rule		sys_landlock_add_rule
-556	common	landlock_restrict_self		sys_landlock_restrict_self
-# 557 reserved for memfd_secret
-558	common	process_mrelease		sys_process_mrelease
-559	common  futex_waitv                     sys_futex_waitv
-560	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
-561	common	cachestat			sys_cachestat
-562	common	fchmodat2			sys_fchmodat2
-563	common	map_shadow_stack		sys_map_shadow_stack
-564	common	futex_wake			sys_futex_wake
-565	common	futex_wait			sys_futex_wait
-566	common	futex_requeue			sys_futex_requeue
-567	common	statmount			sys_statmount
-568	common	listmount			sys_listmount
-569	common	lsm_get_self_attr		sys_lsm_get_self_attr
-570	common	lsm_set_self_attr		sys_lsm_set_self_attr
-571	common	lsm_list_modules		sys_lsm_list_modules
-572	common  mseal				sys_mseal
-573	common	setxattrat			sys_setxattrat
-574	common	getxattrat			sys_getxattrat
-575	common	listxattrat			sys_listxattrat
-576	common	removexattrat			sys_removexattrat
-577	common	open_tree_attr			sys_open_tree_attr
-578	common	file_getattr			sys_file_getattr
-579	common	file_setattr			sys_file_setattr
-580	common	listns				sys_listns
-581	common	rseq_slice_yield		sys_rseq_slice_yield
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 68f3e4f329eb..9a67d29f7818 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -7,6 +7,7 @@
 
 #include <asm/unistd.h>
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
 #define __SYSCALL(nr, entry) .quad entry
 	.data
 	.align 3

-- 
2.55.0


