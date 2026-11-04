Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A98606C907
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vf+3HG+O;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWzULmrt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GsqPd9yuC2PsOW0H0PijQr4TTTCuUbGyah10LVhsDfU=; b=Vf+3HG+O13cC3x
	lCofbYS5s/raFeFVYvqmSaWdbSazOopjsKQdE5Sa2QM/7cnJbYgY+9904BSnrk+MuqJncvjhr/WNE
	EQ7dztVn82FsOEbt7jvQmKClX3z6ZY9dVsNShw/TZPchq3hMvGKYx9OCxdLuJLBKpgdQUEWs0bUAG
	/hEoK4Cf0mN4SIRa6sai7MeOOsCBGwY8COUPLMK1FXRAP65VFdyeIPgMVWl2kX7MQb+PLgnfAxoCJ
	bUM3gfmdxy1SJYItCs599gQuI8tnccRY8+ju2BLoHZb1gn+IT0mdesYIoug6fihNWRp8tk98H13s3
	VmERk2YJxNbBpNTFS8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOias-000000072Rz-00Eh;
	Wed, 04 Nov 2026 21:32:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiao-000000072Qb-3r26
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6081860F00;
	Wed,  4 Nov 2026 21:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CB11F00A17;
	Wed,  4 Nov 2026 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827946;
	bh=GsqPd9yuC2PsOW0H0PijQr4TTTCuUbGyah10LVhsDfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XWzULmrtLrJnLcHbYkw6KlymBhAbzmqFYRr2hTtUkN/HDJxlkQo3xbfNn8vlNcY30
	 fSF5VwAYiSagzp5DUfkD9WUrWD2HhP4shNFANPXeCLOCyLUsIv7FIBPAKfjzHOld7n
	 AcjROIZQMqcwzJlMjst+rO8EbDFQfaV19rHwbchHXSepMe1V1wGDT205aIXjjpyW1x
	 OUKybCb+w46nr/tY+mP9PWJjGaLBaK9gXAqkgNApmpF8A1j07c+wZFGcEIJgSd8OCQ
	 2cbCrdj+XTomhjrGO8uEoTI4pmbJ0BqZFWUh1FY72ADU7qv8w30+0hwjzxDT5fsPVJ
	 YXK4YVNTzs8/g==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:18 +0100
Subject: [PATCH 02/16] ARM: configs: u8500: Update scheduling and
 accounting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-2-451d0537d49b@kernel.org>
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

Select full dynticks and preemption, enable task accounting, and use
the menu CPU idle governor. Drop the ondemand CPU frequency governor
in favor of the default governor.

Enable pressure stall information so userspace can monitor CPU, memory
and I/O contention.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 0614445fdfe4..61cf076526eb 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -1,6 +1,15 @@
 CONFIG_SYSVIPC=y
-CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_PSI=y
+CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_U8500=y
@@ -11,9 +20,9 @@ CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CMDLINE="root=/dev/ram0 console=ttyAMA2,115200n8"
 CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_MENU=y
 CONFIG_ARM_U8500_CPUIDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y

-- 
2.56.0


