Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555A7C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA+RTkJw0c+YR5D/QOgVdwP7zOXPBjoexPBxZtSIN04=; b=UW6krMKVdtRUdN3ACZWI4OP9Rf
	3YkcCLBjYhc+FBioAmanCb4KWqu+FCC23Uhdpi1ghRSEt5WVZ9DDP8UVgXciy/4OGABTlSWLjghsx
	vORTtEa0k7qw34vXCxA+g0Bjj8Rjqi+zhGcRFe8jd5gO1ZEKQND/RRKxOg2VcsrVKSrAXHsI35oKI
	eWAKzswYHUU1VVU3KQzH6M0apHYTPt30a6IcU3WvJ0INFjIkI+MhXoUE+Rt3YdfXOqT4W4/JRqZk5
	QStNnFuIPIRgkUle5vDxDzrAG7bqZlmMwkoRrrv6Q6eaGIR+aXUeU3Cnpc4hpaIgOPzXKnm9TGula
	Lqco8l8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAGm-3N9P;
	Wed, 09 Sep 2026 08:51:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1d-0000000BAAY-2zau;
	Wed, 09 Sep 2026 08:51:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xA+RTkJw0c+YR5D/QOgVdwP7zOXPBjoexPBxZtSIN04=;
	b=0kGifJU3jsfalQ0vMhT6JP3VlLln+gnd6PviOfid9vcMQ9ZfVjh3S6K46Y6RtuwYgfkQp7
	U4VEARgjQz2y9zWVKUibcuXAcE4/PVf+skeugVCZcIXp33PQ8GX5qYE7ku4QLgIfpJBaji
	sLjL1tWFCu3bZuuADFD0AYDYIBKL+YSk5Sd24lEO1Nytg0HcECLj3N5LEdCgUAxJDjDadI
	shB1V9Vpyv5V5KUelf38XITDATgyYew3seTijVNyKcdWbgfUgXsa+82TRsDxxr0nyLUmvP
	r6AikYXfmAecxzddK5q6ximEIZie8JHXo3dmv5t+53uTJxmbJPD0s9zaa2sZWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xA+RTkJw0c+YR5D/QOgVdwP7zOXPBjoexPBxZtSIN04=;
	b=/tT31v/MG34PF8rBM384dyABDZOrzGB9ykwPSqEtaNtwaktWD7oMFoQcgvhlIia89klS87
	FLxDjTW4EyLOtgDQ==
Date: Wed, 09 Sep 2026 10:51:14 +0200
Subject: [PATCH 01/15] vdso: Move the kernel-side time update helpers to a
 new header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-1-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=4673;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ndsrVtodOF2PT/OV0JmJocFYtm0oQ/AhLbzcTA5NPJU=;
 b=QFJMpel8Oem89wFMEyNNwMRhARMWVEaTGpbIuOv/+f6g6Odsm+x6tVkjIXNr1SYGYi7XBz3Ut
 icWBswwhaH5CKn3oECTYcx8kCso8VGVsVWamVOR7it7ieJAfv7qrCB4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015125_982310_76415B40 
X-CRM114-Status: GOOD (  18.51  )
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

The vdso/ header namespace is meant for symbols which are usable from
vDSO userspace code. However vdso_update_begin() and vdso_update_end()
are only usable from the kernel.

Move them into a new header in the linux/ namespace. Also rename them to
make clear that they are only for time-related data.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 MAINTAINERS               |  1 +
 arch/s390/kernel/time.c   |  5 +++--
 include/linux/vdso_time.h |  8 ++++++++
 include/vdso/vsyscall.h   |  3 ---
 kernel/time/vsyscall.c    | 13 +++++++------
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..562ace172594 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11066,6 +11066,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
 F:	include/asm-generic/vdso/vsyscall.h
 F:	include/linux/vdso_datastore.h
+F:	include/linux/vdso_time.h
 F:	include/vdso/
 F:	kernel/time/namespace_vdso.c
 F:	kernel/time/vsyscall.c
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 2b989bebd220..161628f6906f 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -39,6 +39,7 @@
 #include <linux/gfp.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
+#include <linux/vdso_time.h>
 #include <vdso/vsyscall.h>
 #include <vdso/clocksource.h>
 #include <vdso/helpers.h>
@@ -527,7 +528,7 @@ static int stp_sync_clock(void *data)
 			cpu_relax();
 		rc = 0;
 		if (stp_info.todoff || stp_info.tmd != 2) {
-			flags = vdso_update_begin();
+			flags = vdso_time_update_begin();
 			rc = chsc_sstpc(stp_page, STP_OP_SYNC, 0,
 					&clock_delta);
 			if (rc == 0) {
@@ -537,7 +538,7 @@ static int stp_sync_clock(void *data)
 				if (rc == 0 && stp_info.tmd != 2)
 					rc = -EAGAIN;
 			}
-			vdso_update_end(flags);
+			vdso_time_update_end(flags);
 		}
 		sync->in_sync = rc ? -EAGAIN : 1;
 		xchg(&first, 0);
diff --git a/include/linux/vdso_time.h b/include/linux/vdso_time.h
new file mode 100644
index 000000000000..6d81ee3a3c9c
--- /dev/null
+++ b/include/linux/vdso_time.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_VDSO_TIME_H
+#define _LINUX_VDSO_TIME_H
+
+unsigned long vdso_time_update_begin(void);
+void vdso_time_update_end(unsigned long flags);
+
+#endif /* _LINUX_VDSO_TIME_H */
diff --git a/include/vdso/vsyscall.h b/include/vdso/vsyscall.h
index c5c2a2c07857..29dd4e097220 100644
--- a/include/vdso/vsyscall.h
+++ b/include/vdso/vsyscall.h
@@ -6,9 +6,6 @@
 
 #include <asm/vdso/vsyscall.h>
 
-unsigned long vdso_update_begin(void);
-void vdso_update_end(unsigned long flags);
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __VDSO_VSYSCALL_H */
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index aa59919b8f2c..12e205d86e7f 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -9,6 +9,7 @@
 
 #include <linux/hrtimer.h>
 #include <linux/timekeeper_internal.h>
+#include <linux/vdso_time.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
@@ -177,7 +178,7 @@ void vdso_time_update_aux(struct timekeeper *tk)
 #endif
 
 /**
- * vdso_update_begin - Start of a VDSO update section
+ * vdso_time_update_begin - Start of a VDSO update section
  *
  * Allows architecture code to safely update the architecture specific VDSO
  * data. Disables interrupts, acquires timekeeper lock to serialize against
@@ -188,7 +189,7 @@ void vdso_time_update_aux(struct timekeeper *tk)
  * Returns: Saved interrupt flags which need to be handed in to
  * vdso_update_end().
  */
-unsigned long vdso_update_begin(void)
+unsigned long vdso_time_update_begin(void)
 {
 	struct vdso_time_data *vdata = vdso_k_time_data;
 	unsigned long flags = timekeeper_lock_irqsave();
@@ -198,14 +199,14 @@ unsigned long vdso_update_begin(void)
 }
 
 /**
- * vdso_update_end - End of a VDSO update section
- * @flags:	Interrupt flags as returned from vdso_update_begin()
+ * vdso_time_update_end - End of a VDSO update section
+ * @flags:	Interrupt flags as returned from vdso_time_update_begin()
  *
- * Pairs with vdso_update_begin(). Marks vdso data consistent, invokes data
+ * Pairs with vdso_time_update_begin(). Marks vdso data consistent, invokes data
  * synchronization if the architecture requires it, drops timekeeper lock
  * and restores interrupt flags.
  */
-void vdso_update_end(unsigned long flags)
+void vdso_time_update_end(unsigned long flags)
 {
 	struct vdso_time_data *vdata = vdso_k_time_data;
 

-- 
2.55.0


