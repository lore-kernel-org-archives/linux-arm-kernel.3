Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44532CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 00:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=; b=InXBxnvL/EaFOrcFmXiE/NQx15
	s5JA4OBGBb3EDEF8VETB0RBA+uRCfEg8k8NebDpdWyGXZ/N8HQsIwGCEmzGTF6kdC6KaxocXjF9XD
	K775IrvFCR39CumWJcN7Uxj6DY9Dc26kRBgKXlJOo5VJp7tqi+Zwf2jhDmcoxOLh7hjqyiX2p62Vk
	+BuP8emr59bSPaaJpkrCCW4ljTQRQCD/3+HXaRCxbSV1eREVjW9RGPBn08b5tgYT+7+4ArP0gBt+k
	Sqft/DCHqCSl7gHjwOcrzRLCAdOKRR5KNG7iIWA6g5gmFytaqt+RGi0zXGtFRMQpzIDsMzzmEGWlb
	aWJCC+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQOw-0000000HLPx-1YsW;
	Thu, 28 Aug 2025 00:22:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5t-0000000HIDQ-26mF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 00:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=; b=T4heNtxzH5dGQb61mCWzjx9ndg
	cnaGk7tDCRhkAR20TDxM0iJUlxTpWAdgnO/vgVG3WMrvwbc68cL2qKOzCv/AvKsn/slfl0ZnVg+vb
	6F2qyjkN01OLpCaqibEsg54FymtTQz4S9IIC6IVBedh4pjC007cGvE5NRjttwfEwMRveGO2AP9n8w
	Imh+N6o1AW4yAS4V86BToUirOX+FGKFhx6fCSVWBBeuLpSfxo5/1tLbgcuIgEz91yFmzTodWdegJZ
	IqdRfl4vtTpkgPVILlht8NkoLIFxmkwQUKs9wwMx6gGpXhMKK0f6zstBiiiK5at6kdKqfVvPFJlLR
	Hy9eBmDA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5p-0000000Fhow-22tu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:20 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-327b00af618so64749a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339335; x=1756944135; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=;
        b=FCqRi2sVZQvLvILjHF4/S0OSuocQe6dYKEQWRuUx8RbxZL9uSU2lZ7EQMHGnAwq0oI
         bwtMctphX3sq0IvtLf2y65HMTB0PW6dDV2YNLSIKRQIGzzncNX6q887oIkJmm7UQWk7j
         bRNk98FKdrtwmLLnoJEaovWuwNCy3oiiLWn3VmSPMTydJBBY8LH7zyimMSAKNq06CxcY
         kREb+yV/5FiNK2kVoW7LZ1/VVspxAG6+4Mp+4cQH0r+jo4mcO/Uq4dqFbuM86viE9aaf
         zP9P+51A5MiUhK8swewvt5ZJfwnehs8YFMk99lHPj9ouYPubuHTR75tmwmE/rKjK20O1
         oI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339335; x=1756944135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=;
        b=XeTr/Lqoo4Naag/9HDYEDm6CwKpB4kigZmGOIUFnUZBlUEwKSbQsHK5ekgPiv68KD4
         QrCavTyTAi4Fp60FcPtZQOs2t+5+XcljOGhJVqukfi2BN+WQSv/E+TK8nVI3c1O8TzNg
         i0sQw2w2XgkQfFEv6lwtBgvF+BXSdP4+A+/tBfO8stoYyHEfh/frHcw0pzPw0pnFR3Rd
         jI8nTqYPMt8y4+UcR3hAjVYMRTjagCmnRHd4tTJRXA95Kpt2tIqoVrG+9np7reQfi0x4
         65Ahh5O41fo/QZGMLl1SmdQ2QZFulaDDGYjLq6y667NKSN4njjLDDP4sng8Uy+khDDpE
         7ljw==
X-Forwarded-Encrypted: i=1; AJvYcCUIOh1dS/qvSbZ5MhopR16/5czoCdxVh4h+itQKjz87IVbnnTEZKG5ZSyy7/JIU/ATnMN0YsYyDWRpT3Qmw9M3i@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy245pYRh3B4OhLhdjh/PQrgyza+xTltzM7YNfPk9vakm9YeT9
	Y1Ya8KsoZ67qRrIneU1SQYxpztInoEnC7BSWLQq4dErYsP6AdTecZzVkr8uvwNRgllUhAjtdf7T
	6bCo1ZQ==
X-Google-Smtp-Source: AGHT+IHTwHRJ1LtJUNLrZJovplfjTJdtHnbpa9Rw0OlaHYLIVyGS/gJ8LisaniBrYJHJcn/KzpZqw55zABU=
X-Received: from pjbsc11.prod.google.com ([2002:a17:90b:510b:b0:321:c36d:1b8a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3941:b0:327:b01c:4fd4
 with SMTP id 98e67ed59e1d1-327b01c52bcmr306189a91.2.1756339334767; Wed, 27
 Aug 2025 17:02:14 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:56 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-8-seanjc@google.com>
Subject: [PATCH v2 7/7] Drivers: hv: Use "entry virt" APIs to do work before
 returning to lower VTL
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010218_161709_E263F7AC 
X-CRM114-Status: GOOD (  15.70  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use the kernel's common "entry virt" APIs to handle pending work prior to
returning to a lower VTL.  Drop the now-defunct common MSHV helper for
doing work as the VTL driver was the last user.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/Kconfig         |  1 +
 drivers/hv/mshv.h          |  2 --
 drivers/hv/mshv_common.c   | 22 ----------------------
 drivers/hv/mshv_vtl_main.c | 11 +++--------
 4 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 894037afcbf9..b00b2b3fe3db 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -85,6 +85,7 @@ config MSHV_VTL
 	# Therefore, do not attempt to access or modify MTRRs here.
 	depends on !MTRR
 	select CPUMASK_OFFSTACK
+	select VIRT_XFER_TO_GUEST_WORK
 	default n
 	help
 	  Select this option to enable Hyper-V VTL driver support.
diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index 0340a67acd0a..d4813df92b9c 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -25,6 +25,4 @@ int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
-int mshv_do_pre_guest_mode_work(ulong th_flags);
-
 #endif /* _MSHV_H */
diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index eb3df3e296bb..aa2be51979fd 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -138,25 +138,3 @@ int hv_call_get_partition_property(u64 partition_id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hv_call_get_partition_property);
-
-/*
- * Handle any pre-processing before going into the guest mode on this cpu, most
- * notably call schedule(). Must be invoked with both preemption and
- * interrupts enabled.
- *
- * Returns: 0 on success, -errno on error.
- */
-int mshv_do_pre_guest_mode_work(ulong th_flags)
-{
-	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
-		return -EINTR;
-
-	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
-		schedule();
-
-	if (th_flags & _TIF_NOTIFY_RESUME)
-		resume_user_mode_work(NULL);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 4ca13c54c0a0..1eabed16aab9 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -8,6 +8,7 @@
  *   Naman Jain <namjain@linux.microsoft.com>
  */
 
+#include <linux/entry-virt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/miscdevice.h>
@@ -727,22 +728,16 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 {
 	preempt_disable();
 	for (;;) {
-		const unsigned long VTL0_WORK = _TIF_SIGPENDING | _TIF_NEED_RESCHED |
-						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL |
-						_TIF_NEED_RESCHED_LAZY;
-		unsigned long ti_work;
 		unsigned long irq_flags;
 		struct hv_vp_assist_page *hvp;
 		int ret;
 
-		ti_work = READ_ONCE(current_thread_info()->flags);
-		if (unlikely(ti_work & VTL0_WORK)) {
+		if (__xfer_to_guest_mode_work_pending()) {
 			preempt_enable();
-			ret = mshv_do_pre_guest_mode_work(ti_work);
+			ret = xfer_to_guest_mode_handle_work();
 			if (ret)
 				return ret;
 			preempt_disable();
-			continue;
 		}
 
 		local_irq_save(irq_flags);
-- 
2.51.0.268.g9569e192d0-goog


