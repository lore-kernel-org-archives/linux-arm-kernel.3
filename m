Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3017B606C90A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uANKpaSJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GzYWxiVX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jmg3VVcQRBOpzkm+kBTnaHidA62wKjB/O+jc/9Ug0MQ=; b=uANKpaSJSGGzuD
	UXxsZj0TCqRRnvGOxcOsBVoXWKNJ0awD3x0a6xe3Z8EqpaSaXHYnR7d2/K7pU0oNE8HNCHPUVGDQR
	LsJJCXclsxupuR31jFFvZfuy29yt61ine5r2ZV9KIi6hUmYQzhTQGNFWNYg7gswSoahb3K4Ooaltl
	u1ixwqB6TpepwOpsMVVDtbZf3sPHR/zCuH96KVa5jIE4TUvmuokok2hPZQqRHNdR0FC07+pSqE7tN
	knPzZbMRr0ulQiXCFOTYY9DIdXs4FVBMgI4/m8+w8Mo+kEzVBG4LGyWJrIcZN9egIWzs/x9XuqwV3
	SzQyk4g7lJ5lEwSW4FJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOias-000000072SY-0ZUI;
	Wed, 04 Nov 2026 21:32:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiap-000000072Qq-479P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F90360F19;
	Wed,  4 Nov 2026 21:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D611F000C1;
	Wed,  4 Nov 2026 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827947;
	bh=Jmg3VVcQRBOpzkm+kBTnaHidA62wKjB/O+jc/9Ug0MQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GzYWxiVXKn0F0YFdhNqAqFUaoZdX/iwmY/K+2H74A4UHKb/99H0U8+Bb7O7vcSXsh
	 q2vpIq8Rai24VjnEOWa6A4wCVtohBpNyRd19c4dPHjp9BYP93bLxA51KEi1I/WGogf
	 EEYcVaos0+r7hCoOrjXfNiimv19TfEtn9+uoaFI2+LQou9C0tx9g3AbpO3qagY1y4r
	 mPnI7Z4UbRmtJrRO8RyY/tmZsQBi0bd0RGS6Kw4FmRUqXXreslg5e/tezauvQBW3qt
	 NzMlQvK00H55bxGgTn/HAeeUcf6AsDP3V+w5fxHTSl/TJtBKXfb6tx6Xn8EZtXxZmJ
	 daNTOUuPttNTg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:19 +0100
Subject: [PATCH 03/16] ARM: configs: u8500: Enable control groups and
 namespaces
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-3-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Enable the memory, block, CPU and BPF control-group facilities along
with user namespaces and checkpoint/restore support.

Add POSIX message queues, the cgroup process-count controller and block
I/O throttling for distribution and container workloads.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 61cf076526eb..82941a423868 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -1,6 +1,8 @@
 CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_FULL=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -9,6 +11,18 @@ CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_PSI=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
@@ -29,6 +43,7 @@ CONFIG_NEON=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
+CONFIG_BLK_DEV_THROTTLING=y
 # CONFIG_SWAP is not set
 CONFIG_CMA=y
 CONFIG_NET=y

-- 
2.56.0


