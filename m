Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EB1F483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9CUPvPqmkALquwn3kP/A/dGd5HZtJJQeBn1Jn3L+v0=; b=3pzFSUo3ftfXr6yxQKy4sCsBKn
	+BmBWCyzvOfNghxfxOa6vSaBv+/tx826k1ngVoDgZRwGGzIpLRZrbrNsihUyWh6qEIYIkU4ahkRXX
	CzkpqieImDMQRXMpOh2psrQhCCrWkCIGEBrO4/t7v6+X/X46cdtO1EgrwEmVsTzIJAAmNs4fKfBan
	5N6hKs1agOxgVdOY75KvOfBB7NWqO/uqcfIaBg8mHsgD10bpT9RtfdDK7X1ghwkggB4YiMzrq7MBx
	IZA5lAZ2Hj49ILpT9khnqS3ZUdWU1Wc6OLb+HEp03OnFZ3uirVk4mTe7gMyRl8VGd9Jnytm9+fMhJ
	w5v6xjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTb-0000000HH6I-0WRC;
	Mon, 23 Mar 2026 17:54:07 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTX-0000000HH4e-3aPK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:54:05 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-417371eeb0bso13016216fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774288442; x=1774893242; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9CUPvPqmkALquwn3kP/A/dGd5HZtJJQeBn1Jn3L+v0=;
        b=FxfgMDWX4xM690EIqS4fTCc4iRb0/iicYLief4BYxu+efDOsxP8urL8VX1ZrpLyTAT
         tI8NL1ZIT0YDq7vJYQYXOxcLouQJT7hidSew6xlRnhgyfuVq3RqxatoMLmd4HqZexk0B
         JKwBnh/q/eGMIMop7QNIunvPM56KkIIze4icpWVUPGBbDugkipAIF817GusTy5ySPpLA
         5e0QZK6Mx3PqLO6HmTUiiXhSPnvcjWhSj/1LVTxrmAC50aXNjE1+h7Rs/iyb6wRMwezV
         Fo47tjBAm9rK778Tz3LpvgrpGeaqesSUoFZLWge6azb/ydu6wm0ZPPU1TiP0w76cduoE
         rFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288442; x=1774893242;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9CUPvPqmkALquwn3kP/A/dGd5HZtJJQeBn1Jn3L+v0=;
        b=Abd3bZEBwIAIdytDTlQyrKEj7EjTatJdmZJw1LqW1t8hdEVf585C8PT56V0rkywpQM
         BRNFV7JsxUdB4GxLMtTQeDaCngvLDu67nZmIGuG5rnvxtya82KRLGEWDSLJznBOnU+1k
         v5JAFnT5xTt7rbd5e1LORKgxBTK6ivscOrOQKqiY7i23WChmgf/Z1D2S+tvuAchzPdym
         L8x+X9cDIHPs8j9zO2/g5sqFHqwBeAAshl/r8TPl8Cs0dKo85DxKh5HsIC/uvuSJVM3c
         1KLKuHb4wtCkkYHxWoYdw6kEoMf8RKqC0472NsKDdsKZu8qzkYdPIO+hKjvIht5zbpB/
         ysyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYLD652vi6p3wnd319CsxmYNpQD0ZhUmi16yJd96Pzi6Z5GnFkM3PSzfHs4z9O2jgsMSLuLue5ve8W3si8fwnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzNUjzsvo4V4EQNQ3HAqIOeMKD5zTyxcXjLbGhBuDpgZ1X7ox2T
	HgYuKnaUpXOPRvB5dhSq0vDEKxSF7nuZV32MrEPMuyi7daCotAzupsYDObYQW4zshh9iigrEC26
	jkGBcqg==
X-Received: from jabjy12.prod.google.com ([2002:a05:6638:a30c:b0:5d4:6f13:358c])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a4a:e904:0:b0:67b:d1cc:db3b
 with SMTP id 006d021491bc7-67c22bb5ed4mr10163213eaf.15.1774288441712; Mon, 23
 Mar 2026 10:54:01 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:53:36 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260323175340.3361311-1-avagin@google.com>
Subject: [PATCH 0/4 v5] exec: inherit HWCAPs from the parent process
From: Andrei Vagin <avagin@google.com>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Cyrill Gorcunov <gorcunov@gmail.com>, 
	Mike Rapoport <rppt@kernel.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, criu@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Chen Ridong <chenridong@huawei.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Eric Biederman <ebiederm@xmission.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Michal Koutny <mkoutny@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_105403_933882_D0467C23 
X-CRM114-Status: GOOD (  15.93  )
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

This patch series introduces a mechanism to inherit hardware capabilities
(AT_HWCAP, AT_HWCAP2, etc.) from a parent process when they have been
modified via prctl.

To support C/R operations (snapshots, live migration) in heterogeneous
clusters, we must ensure that processes utilize CPU features available
on all potential target nodes. To solve this, we need to advertise a
common feature set across the cluster.

Initially, a cgroup-based approach was considered, but it was decided
that inheriting HWCAPs from a parent process that has set its own
auxiliary vector via prctl is a simpler and more flexible solution.

This implementation adds a new mm flag MMF_USER_HWCAP, which is set when the
auxiliary vector is modified via prctl(PR_SET_MM_AUXV). When execve() is
called, if the current process has MMF_USER_HWCAP set, the HWCAP values are
extracted from the current auxiliary vector and inherited by the new process.

The first patch fixes AUXV size calculation for ELF_HWCAP3 and ELF_HWCAP4
in binfmt_elf_fdpic and updates AT_VECTOR_SIZE_BASE.

The second patch implements the core inheritance logic in execve().

The third patch adds a selftest to verify that HWCAPs are correctly
inherited across execve().

v5:
 -  Fix reading of HWCAPs from auxiliary vectors of compat processes.
 -  Defer HWCAP masking until ELF table creation (create_elf_tables)
    to handle compat process correctly.
 -  arm64: Disable HWCAP inheritance on architecture switch (e.g.,
    AArch64 to AArch32) by clearing MMF_USER_HWCAP, as HWCAP bits have
    completely different meanings across these architectures.

v4: minor fixes based on feedback from the previous version.
v3: synchronize saved_auxv access with arg_lock

v1: https://lkml.org/lkml/2025/12/5/65
v2: https://lkml.org/lkml/2026/1/8/219
v3: https://lkml.org/lkml/2026/2/9/1233
v4: https://lkml.org/lkml/2026/2/17/963

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Chen Ridong <chenridong@huawei.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Michal Koutny <mkoutny@suse.com>
Cc: Cyrill Gorcunov <gorcunov@gmail.com>

Andrei Vagin (4):
  exec: inherit HWCAPs from the parent process
  arm64: elf: clear MMF_USER_HWCAP on architecture switch
  mm: synchronize saved_auxv access with arg_lock
  selftests/exec: add test for HWCAP inheritance

 arch/arm64/include/asm/elf.h                 |  12 ++-
 fs/binfmt_elf.c                              |  13 ++-
 fs/binfmt_elf_fdpic.c                        |  13 ++-
 fs/exec.c                                    |  54 ++++++++++
 fs/proc/base.c                               |  12 ++-
 include/linux/binfmts.h                      |  11 ++
 include/linux/mm_types.h                     |   3 +-
 kernel/fork.c                                |   8 ++
 kernel/sys.c                                 |  30 +++---
 tools/testing/selftests/exec/.gitignore      |   1 +
 tools/testing/selftests/exec/Makefile        |   1 +
 tools/testing/selftests/exec/hwcap_inherit.c | 105 +++++++++++++++++++
 12 files changed, 234 insertions(+), 29 deletions(-)
 create mode 100644 tools/testing/selftests/exec/hwcap_inherit.c

-- 
2.53.0.959.g497ff81fa9-goog


