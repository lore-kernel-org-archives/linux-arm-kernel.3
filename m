Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672BFC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=; b=d8dJxQp+EfadUBK3EXTqVrjxQA
	6cm7np5px0l5FLs0nIZt2s7trD/dEJSQ9SLTT8AXTrCb7f2Rn45BSKLO86wNbyigMC5OPxJsrfBBL
	6avf2yW6Z60NqmyBgj0rifiv5CvHMYVF3GKe9QNMgTx8fcbcYrbjzliWgVODtTAYw6mAxniVoAJxs
	Q1H7f3PX+kT+FKmm4NMIrWAvamSJqoP+TgI+d6rSfXacmGw0AniHVDiq+eHATYO0/ZhWQTZPMImZF
	OzaQUKmD5poY4XQzf9RWYprqjfCwBdHNvAOs5plkVWqDs4/oVbPXw3/shN92MHIEZQiI4EfswuRsg
	1dWvvc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c1e-00000001rkD-0mry;
	Mon, 21 Sep 2026 11:17:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c1Z-00000001rg4-3n4W
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=; b=mbx8D/19XyVnzPrDNB+c9LJatA
	9I5chB6kdkAZMd6nSwWa+81jkb68jebSLhO3ehoHYuQ636Mc/plX6X49tdKxObHIdGCcX8SbX2MFI
	MXITM1vekqLWoDhhLb/Pnt58Wk2i1K1cZG3+/oanZm/RADUSOF+EXWrtqKaKbWGZ9GqZUwI5IcE9X
	UDZ8aZvSnulYgOHSSUT1y6ROGat6TYLjC3ZrX97QR+0vnmTUv4GYhqQQU30N+raM+XYCM2kquWjaP
	ikVVcBOvKclEa7oG3E24iWmCw+2wWdQVxi5AauPwqJbRVOZM1vmvRsaxQezTdbqtb2/E1jbb2JS0I
	KPFY/eSg==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8c10-0000000CBRL-043A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:17:05 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f6so17550995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989411; x=1790594211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=;
        b=aJQBYr3Tuwj0J7AdjRot141xUBXL2X0Y8GD+X0lUujdNNQ3ix19TN5V91vDkhJMA4S
         I2HMdv9wrOTkETtwXymhpnHYv15hID3xKPc76S0qvhIu4rui/9nzitUf3QMAXCaqzFAP
         vz46UvpPFpH/04HeKUEmgN7MriYNzoT/BFupOVYHwX1gTKjrHHxDvPce51hz3AEbVMHq
         +m59NqE4L6MRk6pulQt7ruV5CWkJXR4YvumiYrSp2j70OGqwC78XUkTsDWRpraZFIXwS
         JnJwP5Vbsb/KRqale4v0YGq3ZZ72tcuMwGkv74dSgQwOHywh+rc53FlImVN65kbol+/P
         ovZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989411; x=1790594211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=;
        b=PSvaDqwuMe8a1K222WIT79HVF1TW6qGKL88+P+O5cXd9F4/IexlUYiYPkRh6usrMdu
         5tk0nZ1mNPVeJE0pRqSfPK5LT1fsjStSq3Tjj4K64ZsYEZEHzxTUkJfcT9fBmRy+ZPgE
         MhqwhOpt0QbNhGkwuALsSN/zqeq1yxiIbJau8lnGZ4xb72rGr9y4c7ahqh2ng/dUgZmh
         8qV1n2t3vNBib9sVeiCEgw1xWmNOF6VJu2YLfmawRfkiPM6WYRMXj93ghzNSLIrr7MRb
         zax0cn/aNn1h/eYJAcDh5JLPY+ER+TRQwARKF1IP/+Gcqiw+tE/1wZ+EhdVCL2OhxC/3
         6rpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6gNaqg6UreaPWgqg8ooSX5Q0SFOzQQ33d87L5AuEZYi8SG4qiXDaCStKCvNzm51C4nadXTuxPGQUuNRko7VMR@lists.infradead.org
X-Gm-Message-State: AFuF++mEXLlRs+v9Ysf9Q0m2y6TwwRRkub+kHCveVI4PYpjYcapQGx/B
	iiF9aiHh/Y4VYqaTTZSFHb6wIf/9PYYsb3obm+bYkjV+3wLxA4pcYKfF4Qt7w88w8XY=
X-Gm-Gg: AYBFou3vZDm++vzj7TBQy7BpQIwddyRSjOUKHY4tiygh09R+Fb7gAtpX166x8NtdCwH
	HGftmhpP4z14aswA/swGFzHmDmZPcrU1xV9mfttwmdBPGf/ujFkANgiLIvQHNSaxivMSQSObx9b
	53IJKRU7JC4Q/mNVmH70xCWP+lM356D2wqXOLOYy/viiAjbBXFtH93DLRhi+IADelaCTGvpGRwy
	DQG12ENifIpCHEsbtVGBHHqRZINS+QtWSqUb63L+hof9NnOeKyr7fZdx7SDzW5YiEtgW4AgVV5l
	oVhM8kMXII15x97QPp9Aayj1loTvQUw9DIfcmC3EtBl08MIhKGK4dgM2awaxi0XyMh63LJsB29b
	oE1u7vw2hsgZwZ1PiCoT+BbDi4SKbHVUBKhX5DBohtGX39td2J3PcWVvwWSiOoHOo0JyxOhxffc
	4Ig50CvSvR4NTPfhX+7crZVpc6JD4PtcMKFVI13YWV3QIlg1TrterOXarq1CNjgMzhSR2ixGSmw
	JB2H0CihvU2xBPmjF5qP9iInQbeWWIEoy6+lKUd7hbUsQ==
X-Received: by 2002:a17:902:d2cb:b0:2df:45f7:6386 with SMTP id d9443c01a7336-2df45f76498mr38924045ad.15.1789989410710;
        Mon, 21 Sep 2026 04:16:50 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.16.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:16:50 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 RESEND 3/9] riscv: sse: mask events during shutdown and kexec
Date: Mon, 21 Sep 2026 19:15:00 +0800
Message-ID: <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121702_366412_32AE9793 
X-CRM114-Status: GOOD (  19.50  )
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

SSE delivery is independent of normal S-mode interrupts. Firmware may also
retain an event registration until Linux explicitly unregisters it. A hart
must therefore stop accepting SSE events before Linux stops servicing the
registered handler.

Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
and crash shutdown paths. This prevents firmware from entering Linux-owned
handler state after the corresponding CPU or kernel context is no longer
valid.

A crash kernel cannot identify or take ownership of registrations
inherited from the crashed kernel. Reject a later normal kexec while such
SSE state may still exist, rather than transferring unknown firmware state
to another kernel.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
 arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
 arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 738df176ff6f..24e7affae70b 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -14,10 +14,13 @@
 #include <asm/set_memory.h>	/* For set_memory_x() */
 #include <linux/compiler.h>	/* For unreachable() */
 #include <linux/cpu.h>		/* For cpu_down() */
+#include <linux/crash_dump.h>
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+#include <asm/sse.h>
+
 /*
  * machine_kexec_prepare - Initialize kexec
  *
@@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
 	unsigned int control_code_buffer_sz = 0;
 	int i = 0;
 
+	/* A crash kernel cannot tear down registrations inherited from firmware. */
+	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
+	    riscv_sse_available()) {
+		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Find the Flattened Device Tree and save its physical address */
 	for (i = 0; i < image->nr_segments; i++) {
 		if (image->segment[i].memsz <= sizeof(fdt))
@@ -127,6 +137,7 @@ void
 machine_crash_shutdown(struct pt_regs *regs)
 {
 	local_irq_disable();
+	riscv_sse_mask_current_hart();
 
 	/* shutdown non-crashing cpus */
 	crash_smp_send_stop();
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 14eb08a6db85..fdab37e7ae52 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -6,6 +6,20 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
+
+#include <asm/sse.h>
+
+#ifndef CONFIG_SMP
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+#endif
 
 static void __noreturn default_power_off(void)
 {
@@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	riscv_sse_mask_current_hart();
+
 	/*
 	 * UpdateCapsule() depends on the system being reset via ResetSystem().
 	 */
@@ -30,12 +46,14 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
 
 void machine_power_off(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..7f0d4e7332f1 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -23,10 +23,13 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/nmi.h>
+#include <linux/panic.h>
 
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
 
 enum ipi_message_type {
 	IPI_RESCHEDULE,
@@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 	return -ENOENT;
 }
 
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+
 static void ipi_stop(void)
 {
+	riscv_sse_mask_current_hart();
 	set_cpu_online(smp_processor_id(), false);
 	while (1)
 		wait_for_interrupt();
@@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
+	riscv_sse_mask_current_hart();
 	crash_save_cpu(regs, cpu);
 
 	atomic_dec(&waiting_for_crash_ipi);
@@ -254,6 +268,8 @@ void smp_send_stop(void)
 {
 	unsigned long timeout;
 
+	riscv_sse_mask_current_hart();
+
 	if (num_online_cpus() > 1) {
 		cpumask_t mask;
 
@@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
 		return;
 
 	cpus_stopped = 1;
+	riscv_sse_mask_current_hart();
 
 	/*
 	 * If this cpu is the only one alive at this point in time, online or
-- 
2.50.1 (Apple Git-155)


