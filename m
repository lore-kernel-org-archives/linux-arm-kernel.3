Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4659F8FA84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AKVnTheodda82en/9exNMRlZ0A5yNXj4CXRj8lXBAx4=; b=l84mQbPLlOjYzeXkUMHVEwaGlU
	DfCuVQvrNZtUJ9k0EI1lNW96VTigLKeXMEMPjJVvLhyhwaAEPl5K9im+dnBa1fN379M7T5Rxew5aN
	j2zg8m0Pij4QEfkSi04NPOaLHmFqXpeaWTR5Zdym59erg52HWmPHufEtgWUMaXDQZsqU3MC1/SWJW
	FHt4Bs1btSUy/odc+/QbsUElZf5pNqR+LnCrQwwN1A5onaI0WYZvvOxsdGGzfTKDS72Pw74ZiFKKW
	UEVsGHpysXqQHn1JBZc/LWmsCF2t0+OFi1CgusR2kXsCbd12hkQ4TjlQ9VVB5wRPXc8xFyMHyt4lC
	3CwWzGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCHq-00000008khh-3qNu;
	Tue, 21 Apr 2026 14:41:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCHn-00000008khE-0PwE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776782469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AKVnTheodda82en/9exNMRlZ0A5yNXj4CXRj8lXBAx4=;
	b=PuCrO1B+vqA92+K0gzkwUbIXy6LINv0++LFQd5nGwYIfXLMRDFRckoTMK9WDKXb55v2crc
	livjFvf/3I4psbob207/E21SYygevGCBjjdfdxWEbBRPWxjy5xpIO/UjUVRsRdHFq/cz4G
	FZ4iSCg7hK4BAZ3SH72Wgv11lgXiSsE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-RfVSJj5ZP82U9vXvE1AdwA-1; Tue,
 21 Apr 2026 10:41:04 -0400
X-MC-Unique: RfVSJj5ZP82U9vXvE1AdwA-1
X-Mimecast-MFC-AGG-ID: RfVSJj5ZP82U9vXvE1AdwA_1776782463
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E66519560AB;
	Tue, 21 Apr 2026 14:41:03 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.49.140])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85BB11956095;
	Tue, 21 Apr 2026 14:41:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] smccc: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Tue, 21 Apr 2026 16:40:58 +0200
Message-ID: <20260421144058.561186-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: f2PUbm87nIfyEpvDBzpdjzJg2z1l8DwHAbjE5OtBSqA_1776782463
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_074111_335624_76D1DA16 
X-CRM114-Status: GOOD (  14.44  )
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

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier patch series of mine
 to ease reviewing

 include/linux/arm-smccc.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 50b47eba7d015..96d7a61055a70 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -8,7 +8,7 @@
 #include <linux/args.h>
 #include <linux/init.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <linux/uuid.h>
 #endif
 
@@ -302,7 +302,7 @@
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/linkage.h>
 #include <linux/types.h>
@@ -353,7 +353,7 @@ s32 arm_smccc_get_soc_id_version(void);
  */
 s32 arm_smccc_get_soc_id_revision(void);
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Returns whether a specific hypervisor UUID is advertised for the
@@ -402,7 +402,7 @@ static inline u32 smccc_uuid_to_reg(const uuid_t *uuid, int reg)
 	return val;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /**
  * struct arm_smccc_res - Result from SMC/HVC call
@@ -750,5 +750,5 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 	})
 #endif /*CONFIG_ARM64*/
 
-#endif /*__ASSEMBLY__*/
+#endif /*__ASSEMBLER__*/
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.53.0


