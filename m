Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848F3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQOwCdOEDFs2yQBWOu5zJe4VLula9k1JKawABGnhRRk=; b=J6nSzSDA8Ozn8VMzh0GAHL4Ulo
	MVIG0xXm8Qiz1W01Sp69EHrYrx+OiOcmQdNFbcwh/amvFK9AqS3HSw2IQ9W0fNeSaAq+n3l1Y5N5C
	jorkUp77boSbwUQoXJohSDLYGkwnF9G0wECue75TeGcrltjl+Le9dgkLYd2bwGqaM1QQ83vMosld2
	PjcX5q1DhqUyUaQ+fQTsLWKbTk2rZI0BFsOHNDoGK5feucmxBoot7gXV3aOHMNQ4iB8IzSaVxTpPW
	7Ays35KAgI/hJBoK+KHWBy4dpdPuxbeSC5FizDfuyEJsPFSXBz4r1fD9eAtBvIlZINrfMwyyr6Jgp
	FBBZg7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCv8-0000000GgeW-1FHV;
	Wed, 12 Aug 2026 17:39:18 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCv1-0000000GgZE-1saS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=PQOwCdOEDFs2yQBWOu5zJe4VLula9k1JKawABGnhRRk=; b=WQWWTqKXyF3/sk3RF8/eKPrOIP
	Lm1+dAFfdLwQpCquiAcxpdxkwK7k96jpQOxacaDWohPHWTCV318t6dMEJ3+3/xkv0TZzrozTAdTHZ
	DjR2sZi5SD1D44gO3CLmxXEA+zEzxIWM0lfORsxJ2GBykaD1jTbXRB/fN5yjn+xFYT0DGtfw01O62
	ABuX/EKKfjIgrdNis+wZzjnuau4xXGd2Zy/1hOrWwIHsdGuaCe0PgM/WZDyUO6x37Y99M+DH8KzoJ
	mql9la1QRXnjzwsfmMdbuKkjlijtG6y3NgnicHFb1A1i7BLHfSPFwE3z7Y6v9WtJG4Fv/PbYZqW9b
	Vm95Wx1w==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wuCuu-000FR2-E5; Wed, 12 Aug 2026 19:39:04 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 14:38:35 -0300
Subject: [PATCH v5 04/13] arm: Use the common syscall table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v5-4-3d383927c609@igalia.com>
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
X-CRM114-CacheID: sfid-20260812_103911_493466_813E7558 
X-CRM114-Status: UNSURE (   7.05  )
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
 arch/arm/tools/Makefile    | 10 +++++--
 arch/arm/tools/syscall.tbl | 68 ----------------------------------------------
 2 files changed, 7 insertions(+), 71 deletions(-)

diff --git a/arch/arm/tools/Makefile b/arch/arm/tools/Makefile
index 28b6da8ac5f6..fd73bf6db3bf 100644
--- a/arch/arm/tools/Makefile
+++ b/arch/arm/tools/Makefile
@@ -12,6 +12,8 @@ syshdr := $(srctree)/scripts/syscallhdr.sh
 sysnr := $(src)/syscallnr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
 syscall := $(src)/syscall.tbl
+syscalltbl_common := $(srctree)/scripts/syscall_common.tbl
+abis := common,clone3,32
 
 gen-y := $(gen)/calls-oabi.S
 gen-y += $(gen)/calls-eabi.S
@@ -38,11 +40,13 @@ $(kapi)/mach-types.h: $(src)/gen-mach-types $(src)/mach-types FORCE
 	$(call if_changed,gen_mach)
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --abis common,$* \
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --abis $(abis),$* \
+		   --common-tbl $(syscalltbl_common) \
 		   --offset __NR_SYSCALL_BASE $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis common,$* $< $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis),$* \
+		   --common-tbl $(syscalltbl_common) $< $@
 
 quiet_cmd_sysnr  = SYSNR   $@
       cmd_sysnr  = $(CONFIG_SHELL) $(sysnr) $< $@
@@ -50,7 +54,7 @@ quiet_cmd_sysnr  = SYSNR   $@
 $(uapi)/unistd-%.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(kapi)/unistd-nr.h: $(syscall) $(sysnr) FORCE
+$(kapi)/unistd-nr.h: $(syscalltbl_common) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
 $(gen)/calls-%.S: $(syscall) $(systbl) FORCE
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index 94351e22bfcf..d5bc0e7adf2f 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -418,71 +418,3 @@
 400	common	migrate_pages		sys_migrate_pages
 401	common	kexec_file_load		sys_kexec_file_load
 # 402 is unused
-403	common	clock_gettime64			sys_clock_gettime
-404	common	clock_settime64			sys_clock_settime
-405	common	clock_adjtime64			sys_clock_adjtime
-406	common	clock_getres_time64		sys_clock_getres
-407	common	clock_nanosleep_time64		sys_clock_nanosleep
-408	common	timer_gettime64			sys_timer_gettime
-409	common	timer_settime64			sys_timer_settime
-410	common	timerfd_gettime64		sys_timerfd_gettime
-411	common	timerfd_settime64		sys_timerfd_settime
-412	common	utimensat_time64		sys_utimensat
-413	common	pselect6_time64			sys_pselect6
-414	common	ppoll_time64			sys_ppoll
-416	common	io_pgetevents_time64		sys_io_pgetevents
-417	common	recvmmsg_time64			sys_recvmmsg
-418	common	mq_timedsend_time64		sys_mq_timedsend
-419	common	mq_timedreceive_time64		sys_mq_timedreceive
-420	common	semtimedop_time64		sys_semtimedop
-421	common	rt_sigtimedwait_time64		sys_rt_sigtimedwait
-422	common	futex_time64			sys_futex
-423	common	sched_rr_get_interval_time64	sys_sched_rr_get_interval
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
-435	common	clone3				sys_clone3
-436	common	close_range			sys_close_range
-437	common	openat2				sys_openat2
-438	common	pidfd_getfd			sys_pidfd_getfd
-439	common	faccessat2			sys_faccessat2
-440	common	process_madvise			sys_process_madvise
-441	common	epoll_pwait2			sys_epoll_pwait2
-442	common	mount_setattr			sys_mount_setattr
-443	common	quotactl_fd			sys_quotactl_fd
-444	common	landlock_create_ruleset		sys_landlock_create_ruleset
-445	common	landlock_add_rule		sys_landlock_add_rule
-446	common	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
-448	common	process_mrelease		sys_process_mrelease
-449	common	futex_waitv			sys_futex_waitv
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
-462	common	mseal				sys_mseal
-463	common	setxattrat			sys_setxattrat
-464	common	getxattrat			sys_getxattrat
-465	common	listxattrat			sys_listxattrat
-466	common	removexattrat			sys_removexattrat
-467	common	open_tree_attr			sys_open_tree_attr
-468	common	file_getattr			sys_file_getattr
-469	common	file_setattr			sys_file_setattr
-470	common	listns				sys_listns
-471	common	rseq_slice_yield		sys_rseq_slice_yield

-- 
2.55.0


