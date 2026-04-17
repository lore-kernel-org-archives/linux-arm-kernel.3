Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4159F8E49F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W98Lhi1GA1EF9zAl30DXr0KXM6lc0EyRSy4t/Q/PoKo=; b=s1y5MNpTlqyVzuZs4oP5N+T9AX
	jjBa7U4F/sv32i7ktbpG/oT6bUoF5M2qhgNTf8FMqPwQuw3CaqLG0o7iZBREcwqPJiYkIB9GF0+BB
	2gIea/xTm5v+lHLnBqJRLk6uau38oH2ioAIu+4tSWRrAL4cM80SdUwoDzLI6jQ9D+gfxE+1WGQHki
	C0LbSLhMem5NqF27aNn0L1n+utMREIQydhsj0u8Z1627wQbphasQ9hNpyRYFxY7qyCLkvYXjClDfi
	pMeK4F2IjMunBqbs2mIozbL8nRqTkMp+T1Bo7QT2qAhA8+ovlVuU3IFiDEJ9DQM0sgUJGe5+utWx8
	TODfLbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnSG-00000004LNS-2VWR;
	Fri, 17 Apr 2026 17:58:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnSD-00000004LMi-3v5H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 17:58:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A706726BC;
	Fri, 17 Apr 2026 10:58:02 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04E383F7D8;
	Fri, 17 Apr 2026 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776448688; bh=Xthb3ehGwSqNy98ZkV5hx2XQVIYeOUNZ+zk/mPHeVxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RzCt12xaQIVpIK57/JmZuLaQSf7X8Bn2amg1WbgDOQvm6hJwOQ+GETwKwN/IvCLlP
	 LwL/uUXAEXohJSGUhfUd3dweBChjvRK6rld0iEamfNRRB3292kPiIFdztya0QK8SJs
	 x7KtkjQnfkuTjSXc8H0yC4Ok34Qyp4MnzUYyi3lk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	sudeep.holla@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 1/4] security: ima: move ima_init into late_initcall_sync
Date: Fri, 17 Apr 2026 18:57:56 +0100
Message-Id: <20260417175759.3191279-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417175759.3191279-1-yeoreum.yun@arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_105810_048413_FE6A3ADC 
X-CRM114-Status: GOOD (  17.09  )
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

To generate the boot_aggregate log in the IMA subsystem with TPM PCR values,
the TPM driver must be built as built-in and
must be probed before the IMA subsystem is initialized.

However, when the TPM device operates over the FF-A protocol using
the CRB interface, probing fails and returns -EPROBE_DEFER if
the tpm_crb_ffa device — an FF-A device that provides the communication
interface to the tpm_crb driver — has not yet been probed.

To ensure the TPM device operating over the FF-A protocol with
the CRB interface is probed before IMA initialization,
the following conditions must be met:

   1. The corresponding ffa_device must be registered,
      which is done via ffa_init().

   2. The tpm_crb_driver must successfully probe this device via
      tpm_crb_ffa_init().

   3. The tpm_crb driver using CRB over FF-A can then
      be probed successfully. (See crb_acpi_add() and
      tpm_crb_ffa_init() for reference.)

Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
all registered with device_initcall, which means crb_acpi_driver_init() may
be invoked before ffa_init() and tpm_crb_ffa_init() are completed.

When this occurs, probing the TPM device is deferred.
However, the deferred probe can happen after the IMA subsystem
has already been initialized, since IMA initialization is performed
during late_initcall, and deferred_probe_initcall() is performed
at the same level.

To resolve this, move ima_init() into late_inicall_sync level
so that let IMA not miss TPM PCR value when generating boot_aggregate
log though TPM device presents in the system.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/linux/lsm_hooks.h         |  2 ++
 security/integrity/ima/ima_main.c |  2 +-
 security/lsm_init.c               | 13 +++++++++++--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index d48bf0ad26f4..88fe105b7f00 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -166,6 +166,7 @@ enum lsm_order {
  * @initcall_fs: LSM callback for fs_initcall setup, optional
  * @initcall_device: LSM callback for device_initcall() setup, optional
  * @initcall_late: LSM callback for late_initcall() setup, optional
+ * @initcall_late_sync: LSM callback for late_initcall_sync() setup, optional
  */
 struct lsm_info {
 	const struct lsm_id *id;
@@ -181,6 +182,7 @@ struct lsm_info {
 	int (*initcall_fs)(void);
 	int (*initcall_device)(void);
 	int (*initcall_late)(void);
+	int (*initcall_late_sync)(void);
 };

 #define DEFINE_LSM(lsm)							\
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 1d6229b156fb..ace280fa3212 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -1320,5 +1320,5 @@ DEFINE_LSM(ima) = {
 	.order = LSM_ORDER_LAST,
 	.blobs = &ima_blob_sizes,
 	/* Start IMA after the TPM is available */
-	.initcall_late = init_ima,
+	.initcall_late_sync = init_ima,
 };
diff --git a/security/lsm_init.c b/security/lsm_init.c
index 573e2a7250c4..4e5c59beb82a 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -547,13 +547,22 @@ device_initcall(security_initcall_device);
  * security_initcall_late - Run the LSM late initcalls
  */
 static int __init security_initcall_late(void)
+{
+	return lsm_initcall(late);
+}
+late_initcall(security_initcall_late);
+
+/**
+ * security_initcall_late_sync - Run the LSM late initcalls sync
+ */
+static int __init security_initcall_late_sync(void)
 {
 	int rc;

-	rc = lsm_initcall(late);
+	rc = lsm_initcall(late_sync);
 	lsm_pr_dbg("all enabled LSMs fully activated\n");
 	call_blocking_lsm_notifier(LSM_STARTED_ALL, NULL);

 	return rc;
 }
-late_initcall(security_initcall_late);
+late_initcall_sync(security_initcall_late_sync);
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


