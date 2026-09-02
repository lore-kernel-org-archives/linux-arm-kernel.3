Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4774C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U+aXXTqCSMT4v6m94l8wWsE7+DIKM+xtaz3ODxXPycs=; b=W2krnJZLpq2iCiryb8kpgwknus
	tyxxIh9jFpxLjDptmvhrBVGaBEQmQMd2ggtXuIiBSpc0lnw0knJEUbfMyAcnrp1JQKC3TCD9Szo87
	tVRvXT6YMtracrpJbB5Ot5sTbs9ryZ5XxIv89g0iPBEIhJ0Am80LjkB3z0EA2v+aGrRfqeQ7vg0px
	RI180pJsk5oZivjBHmifdaiAH2tmiiGR3WJu34HLvsn0tz3rabmfNSIwV+JFqet3G74FyHBcpIh2U
	RK3e9oc4ST8hYPz0VELc+9ovhibWZuj8r9p43XsJ3++BqE/tP22IhzekztlfveVXH58I784EFg2iV
	4GKZ/D0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mCT-0000000EytH-10jU;
	Wed, 02 Sep 2026 14:44:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mCR-0000000Eys8-0DGK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788360264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U+aXXTqCSMT4v6m94l8wWsE7+DIKM+xtaz3ODxXPycs=;
	b=OPc8C055kuplxa+fuRyqdE6IxmE7jc1jn2utjDSTpM9QLSqzuOfwfkBiFv64P/KM2pqzSY
	yw3SNlCHKiu5DXIl4cl0EB0aiiHuxm1Ze605KSI7w4Mmmk8uo57T3qZOOuXXN1xfW/BzXw
	tB02YNARJmD9pXZx/LyrOVXStJ5H5Pg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-iOdmff8TMlenYO4gBNmrnQ-1; Wed,
 02 Sep 2026 10:44:19 -0400
X-MC-Unique: iOdmff8TMlenYO4gBNmrnQ-1
X-Mimecast-MFC-AGG-ID: iOdmff8TMlenYO4gBNmrnQ_1788360253
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9DB891945CB6;
	Wed,  2 Sep 2026 14:44:09 +0000 (UTC)
Received: from wsxc.redhat.com (unknown [10.96.134.11])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 070E21800641;
	Wed,  2 Sep 2026 14:43:53 +0000 (UTC)
From: Ricardo Robaina <rrobaina@redhat.com>
To: audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	bpf@vger.kernel.org
Cc: paul@paul-moore.com,
	eparis@redhat.com,
	sgrubb@redhat.com,
	oleg@redhat.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	monstr@monstr.eu,
	tsbogend@alpha.franken.de,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: [PATCH v2 00/13] audit: log all six syscall arguments in the SYSCALL record
Date: Wed,  2 Sep 2026 11:43:33 -0300
Message-ID: <cover.1788351089.git.rrobaina@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: IjCSUmWt4PZxDem-m40xo94klzM5zESis-sJSf769BY_1788360253
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_074427_157146_E6A761C1 
X-CRM114-Status: UNSURE (   9.82  )
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

The SYSCALL record currently logs only four of the six syscall
arguments (a0-a3), silently discarding the remaining two. This
leads to the need for auxiliary records when audit-relevant
data lands in the 5th or 6th argument of a syscall.

This series extends the SYSCALL record to log all six arguments,
by adding arguments a4 and a5 inline within the existing record.

The audit testsuite runs successfully:

 # make test
 make -C tests test
 Running as   user    root
        with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
        on   system  Fedora

 amcast_joinpart/test ................. ok
 backlog_wait_time_actual_reset/test .. ok
 bpf/test ............................. ok
 coredump/test ........................ ok
 exec_execve/test ..................... ok
 exec_name/test ....................... ok
 fanotify/test ........................ ok
 field_compare/test ................... ok
 file_create/test ..................... ok
 file_delete/test ..................... ok
 file_permission/test ................. ok
 file_rename/test ..................... ok
 filter_device/test ................... ok
 filter_exclude/test .................. ok
 filter_exit/test ..................... ok
 filter_inode/test .................... ok
 filter_saddr_fam/test ................ ok
 filter_sessionid/test ................ ok
 io_uring/test ........................ ok
 login_tty/test ....................... ok
 lost_reset/test ...................... ok
 netfilter_pkt/test ................... ok
 signal/test .......................... ok
 syscalls_file/test ................... ok
 syscall_module/test .................. ok
 syscall_socketcall/test .............. ok
 time_change/test ..................... ok
 user_msg/test ........................ ok
 All tests successful.
 Result: PASS

Changes in v2:
 - Rework the core change per Will Deacon's suggestion: instead of
   plumbing all six arguments through every architecture's syscall
   entry path, __audit_syscall_entry() now takes a struct pt_regs *
   and retrieves the arguments itself via syscall_get_arguments().
 - Per-arch patches now simply pass regs instead of the individual
   argument registers.
 - Fetch the arguments directly into context->argv, dropping the
   temporary array.

Ricardo Robaina (13):
  audit: log all six syscall arguments in the SYSCALL record
  alpha: pass pt_regs to audit_syscall_entry()
  arm: pass pt_regs to audit_syscall_entry()
  arm64: pass pt_regs to audit_syscall_entry()
  csky: pass pt_regs to audit_syscall_entry()
  microblaze: pass pt_regs to audit_syscall_entry()
  mips: pass pt_regs to audit_syscall_entry()
  openrisc: pass pt_regs to audit_syscall_entry()
  parisc: pass pt_regs to audit_syscall_entry()
  sh: pass pt_regs to audit_syscall_entry()
  sparc64: pass pt_regs to audit_syscall_entry()
  um: pass pt_regs to audit_syscall_entry()
  xtensa: pass pt_regs to audit_syscall_entry()

 arch/alpha/kernel/ptrace.c      |  3 +--
 arch/arm/kernel/ptrace.c        |  3 +--
 arch/arm64/kernel/ptrace.c      |  3 +--
 arch/csky/kernel/ptrace.c       |  2 +-
 arch/microblaze/kernel/ptrace.c |  2 +-
 arch/mips/kernel/ptrace.c       |  4 +---
 arch/openrisc/kernel/ptrace.c   |  3 +--
 arch/parisc/kernel/ptrace.c     |  9 ++-------
 arch/sh/kernel/ptrace_32.c      |  3 +--
 arch/sparc/kernel/ptrace_64.c   |  4 +---
 arch/um/kernel/ptrace.c         |  6 +-----
 arch/xtensa/kernel/ptrace.c     |  4 +---
 include/linux/audit.h           | 13 ++++---------
 include/uapi/linux/audit.h      |  2 ++
 kernel/audit.h                  |  2 +-
 kernel/auditfilter.c            |  2 ++
 kernel/auditsc.c                | 19 ++++++++-----------
 kernel/entry/syscall-common.c   |  4 +---
 18 files changed, 31 insertions(+), 57 deletions(-)

-- 
2.55.0


