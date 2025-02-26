Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A96C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8zKP2hcDp7gg5TGoAjEuRkXHEuh7Rq/cw2eQj8sL+c=; b=x2AYF/g8g4YO90VSS8T9CoulV+
	KPLUUxCRO9SIMrlz9cBW2qLqx2pYkmBcdymc2dZuzsOV7Du5fjTKHq8NUtuwHBTQbWLPlK/6/YJLC
	CQh9jWjFtg9ElVXaHKXK5ZIJv5WSdOSGQp3wcTgU9YuQRarbhiHc1YMx7gOckmVv37wco9J44Feh9
	scG5DmFASvydQ2yiZenggD84woh2bEhKNn1tnT3SBJSC/xIqaqtkZd6oV4Ld6VK0MPkod6qe7OU//
	zGKt0S2NguFeI25td/NWNqZFgUrBm1VqHI//7P7xwompFDREKmkDsViGiFI01cJoSx2cm0d+H8SsC
	XUQDhChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQh2-00000005giW-06bQ;
	Wed, 26 Feb 2025 23:19:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQWU-00000005exR-1nkt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:09:04 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 68385210EAD0;
	Wed, 26 Feb 2025 15:08:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 68385210EAD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740611339;
	bh=D8zKP2hcDp7gg5TGoAjEuRkXHEuh7Rq/cw2eQj8sL+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnIwE4+ikDrarKkipwcw+0csfp/M/FetsQIzxMPtogFCK1p1AF0Hm2zvT/3br57k6
	 A2XLT4j7ii/XpT6MGPkeXLJOkzp61rOGODm0R/hkkhAsRkOv6CuhTqij8ZFgj8R9fy
	 /GpaJGzjiw4xEyM/CH+Ld7sJxdgPz6AlI4q8zPZg=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com,
	stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	muislam@microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v5 08/10] x86: hyperv: Add mshv_handler irq handler and setup function
Date: Wed, 26 Feb 2025 15:08:02 -0800
Message-Id: <1740611284-27506-9-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_150902_569790_F781126E 
X-CRM114-Status: UNSURE (   9.50  )
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

This will handle SYNIC interrupts such as intercepts, doorbells, and
scheduling messages intended for the mshv driver.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Wei Liu <wei.liu@kernel.org>
Reviewed-by: Tianyu Lan <tiala@microsoft.com>
---
 arch/x86/kernel/cpu/mshyperv.c | 9 +++++++++
 drivers/hv/hv_common.c         | 5 +++++
 include/asm-generic/mshyperv.h | 1 +
 3 files changed, 15 insertions(+)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 0116d0e96ef9..616e9a5d77b4 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -107,6 +107,7 @@ void hv_set_msr(unsigned int reg, u64 value)
 }
 EXPORT_SYMBOL_GPL(hv_set_msr);
 
+static void (*mshv_handler)(void);
 static void (*vmbus_handler)(void);
 static void (*hv_stimer0_handler)(void);
 static void (*hv_kexec_handler)(void);
@@ -117,6 +118,9 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
 	inc_irq_stat(irq_hv_callback_count);
+	if (mshv_handler)
+		mshv_handler();
+
 	if (vmbus_handler)
 		vmbus_handler();
 
@@ -126,6 +130,11 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
 	set_irq_regs(old_regs);
 }
 
+void hv_setup_mshv_handler(void (*handler)(void))
+{
+	mshv_handler = handler;
+}
+
 void hv_setup_vmbus_handler(void (*handler)(void))
 {
 	vmbus_handler = handler;
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 2763cb6d3678..f5a07fd9a03b 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -677,6 +677,11 @@ void __weak hv_remove_vmbus_handler(void)
 }
 EXPORT_SYMBOL_GPL(hv_remove_vmbus_handler);
 
+void __weak hv_setup_mshv_handler(void (*handler)(void))
+{
+}
+EXPORT_SYMBOL_GPL(hv_setup_mshv_handler);
+
 void __weak hv_setup_kexec_handler(void (*handler)(void))
 {
 }
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 1f46d19a16aa..a05f12e63ccd 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -208,6 +208,7 @@ void hv_setup_kexec_handler(void (*handler)(void));
 void hv_remove_kexec_handler(void);
 void hv_setup_crash_handler(void (*handler)(struct pt_regs *regs));
 void hv_remove_crash_handler(void);
+void hv_setup_mshv_handler(void (*handler)(void));
 
 extern int vmbus_interrupt;
 extern int vmbus_irq;
-- 
2.34.1


