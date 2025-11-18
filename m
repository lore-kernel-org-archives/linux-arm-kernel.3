Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620BFCEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZF6D1TfH8JuPuDc3tnEaueOaSNKrGkLTfLM+n6CeqE=; b=LKMH3Hx3tVhV/S/vXRAUdkonQi
	6mawUIQJ9aGEAfwYVWHcqb1GB8JxQK5Yvi8+g9XUAOWC7mfysoYOwE5ILAV2dMnIOc0+9lSwxCopA
	kTB2fbBKUzIl6gcryXtV30MR6lmfwb9yU0BTT5mM7ZI5jM7wJnBHBVP7W6VaCRX5oJuuwptHXHv+y
	zmvMmPK1tTo+XE0FSmrYUSJIBE3HcXo4qVWukTMPEZpGOpdyy+mOm4pjZprtK6fBzE4l2BFDbSEWv
	CLgMz4pN5hLyLDbO4EvX61+J8vUgqKzuSGZowj4+FKdMXgHS40q/mr9dXC87ITK2M3kK+FH9gX16P
	6F2pXM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoK-0000000HFkg-2Xoc;
	Tue, 18 Nov 2025 02:51:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoH-0000000HFgR-3MSO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:51:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2957850c63bso51534625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 18:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434273; x=1764039073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZF6D1TfH8JuPuDc3tnEaueOaSNKrGkLTfLM+n6CeqE=;
        b=EG6o3QwB512njv8Aq9DJ4x2CMSB2gfvKjjBTenMg3DpfqKClXFD8oWOfV7ZpI3rbU0
         MDDPwbq8R5mePcb01bgKxfsJFpW2Vo8pDkVBIzCD2arnOVPxZKJr8Uj6LPrUAcCJ9ERN
         zZM1Nb2lQ5TAFIktlkzUI19J72EQc4I2mk8E/1wa5N/qdwNIm+tu6tGhwBUh7ZkyAkSs
         egDpkflspf0ExN0/8N3Wahgh4hpFkqWY3nTPeeUmQbjq39O8Oi1FS3eNfbh8bmsG36lJ
         C3e+b6JbBpV2p0ULImqzYmA1WvhvPRIZ7IdlGDgxGfBwy7HYxA+g2kJ9WSvCN0NYEXoP
         oKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434273; x=1764039073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZF6D1TfH8JuPuDc3tnEaueOaSNKrGkLTfLM+n6CeqE=;
        b=vSvL43Ltm8mtAynLZdTFhKC+Laq9Xyykcc4oTFM8bqdtm9XRRiIWIGz8CrDLDEPBBi
         DKhSVtKx5Fn+nX7sk1RkhB3vYCzblBab1eZNjv7nd3WSOLt+3H4oqPPIGTUL+UQfXfNp
         L0a4Jm4nQO3LbP5eLjJNyqqysjFRidBFGXczCW0AWigPHZE3cPBruJXHzjmPRteMq/Qy
         O9fwPY6BwiQZQ9lPN7O9pOGattZ3iciQuICgWKSEOwTNorixnh7UU8Om+OSHWC4EpJjB
         tJQs5mlv8/sUoCiCbTyFkedtTh42/U79bob5ASvYhYmPeeW6khnlJSUw/FUb6KafZ4G/
         2ZOw==
X-Forwarded-Encrypted: i=1; AJvYcCVm1+2G+QKT8XSsZv4iAGNEUxFDbh/Pr6t01ktogUWYfgA6G3G/lykgdPQHC0Q5+fM77lQcip5hgsSAu3wrPxee@lists.infradead.org
X-Gm-Message-State: AOJu0YwS5DyVerCoP7JxFLOuG9baQFKObnor5IKUCiW2ekpVufBSXUIe
	zkd4bgF2RiV3Fnjajy9qmkEm/s2lvX0oKWnEZOFhZPI3GK4BYmDrcE3jlDLzbRhTa3o=
X-Gm-Gg: ASbGnctJxXZP/j4szf31J4auVOrDgHADsyWILA5/DUWFuvP491EOiS0S2VOaJ2bx7+g
	N7jEvav/8Vu/6Qf5+60v9jTunvTJioJTx6xFKDEQDVENRJyotdTZv+3GqFKXkYI1z4YvghuKnCk
	kKUkMlKMh9zrIEVlOyFAy+kMSZfz4EnUCZhVJiYOezEmdvQb7xzx5fa0r2GrXbeSLTW3sTrSCmT
	UvvGmH9jrr7OXsLUvKmFCrzXcNL+xBHKXGasZmjoumP8LE15A55mpzrZMNsHAFiMukmhTonCZ8C
	hvy9wnCuDAP1GrWXI+NEJiMR2jFbd/Uhzj3EBlZsgks96MmYhvQyKRRiCNuMPxKqpU5KoGQgVXk
	Y/KgyBkqeZS76wZE/TY49ryGKyktJUxkww0TMkWNIuyLcgjLBry+ljKetnG69OXkIR2kMehdZqq
	Tp7rNlx4cXr4BBRI74FLbZ4feXlMFOm0Jl2AaKtESNppc8
X-Google-Smtp-Source: AGHT+IFnh6sQLklp1JcCHBWGK8mewKb6UL9Nrbhv3tBeBHg/njYdxNQEi6GUf8dQSrAUDBQig6m8+g==
X-Received: by 2002:a17:903:2447:b0:24b:1585:6350 with SMTP id d9443c01a7336-299f5513a84mr18079715ad.11.1763434272809;
        Mon, 17 Nov 2025 18:51:12 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:12 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 5/8] riscv: smp: retry CPU stop with NMI if IPI fails
Date: Tue, 18 Nov 2025 10:50:12 +0800
Message-Id: <20251118025015.42491-6-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185113_902696_2A879B49 
X-CRM114-Status: GOOD (  15.03  )
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

Retry CPU stop with NMI when IPI fails and RISC-V SSE NMI is supported,
borrowed the code implementation from arm64.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/smp.h           |  2 ++
 arch/riscv/kernel/smp.c                | 23 +++++++++++++++++++----
 drivers/firmware/riscv/riscv_sse_nmi.c |  1 +
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index f53f1f0e7aa9e..e01ea962adfc4 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -63,6 +63,8 @@ static inline void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 }
 #endif
 
+void cpu_stop(void);
+
 /* Secondary hart entry */
 asmlinkage void smp_callin(void);
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 07ccc28f52172..aa1cfc344a2c6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -69,7 +69,7 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 	return -ENOENT;
 }
 
-static void ipi_stop(void)
+void cpu_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
 	while (1)
@@ -127,7 +127,7 @@ static irqreturn_t handle_IPI(int irq, void *data)
 		generic_smp_call_function_interrupt();
 		break;
 	case IPI_CPU_STOP:
-		ipi_stop();
+		cpu_stop();
 		break;
 	case IPI_CPU_CRASH_STOP:
 		cpu_crash_stop(cpu, get_irq_regs());
@@ -250,10 +250,9 @@ void tick_broadcast(const struct cpumask *mask)
 void smp_send_stop(void)
 {
 	unsigned long timeout;
+	cpumask_t mask;
 
 	if (num_online_cpus() > 1) {
-		cpumask_t mask;
-
 		cpumask_copy(&mask, cpu_online_mask);
 		cpumask_clear_cpu(smp_processor_id(), &mask);
 
@@ -267,6 +266,22 @@ void smp_send_stop(void)
 	while (num_online_cpus() > 1 && timeout--)
 		udelay(1);
 
+	/*
+	 * If CPUs are still online, try an NMI. There's no excuse for this to
+	 * be slow, so we only give them an extra 10 ms to respond.
+	 */
+	if (num_other_online_cpus()) {
+		smp_rmb();
+		cpumask_copy(&mask, cpu_online_mask);
+		cpumask_clear_cpu(smp_processor_id(), &mask);
+		pr_info("SMP: retry stop with NMI for CPUs %*pbl\n",
+			cpumask_pr_args(&mask));
+		send_nmi_mask(&mask, LOCAL_NMI_STOP);
+		timeout = USEC_PER_MSEC * 10;
+		while (num_other_online_cpus() && timeout--)
+			udelay(1);
+	}
+
 	if (num_online_cpus() > 1)
 		pr_warn("SMP: failed to stop secondary CPUs %*pbl\n",
 			   cpumask_pr_args(cpu_online_mask));
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index e4c20dce40f9a..0ff0bda53608a 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -55,6 +55,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	unsigned int cpu = smp_processor_id();
 
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
+	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
 
 	atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);
 
-- 
2.39.5


