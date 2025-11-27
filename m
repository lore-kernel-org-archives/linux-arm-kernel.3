Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0D8D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWEVz8RQkOVIjQiYoeWau+DA1cwiHSk9Obrie6fKLfw=; b=ouPRBLhxir//8JwpUrP70VW2Dt
	lOkloQ7VKk4C9VxO07UHLB5RnuiYk/nCgMj+Rh7zZsYMxT4u9fjt3fVUW1u0/M4Cm/t6QIbgGdFzl
	0Sc534E9RcZnpiZrMl0hxtIQSspLHYyfRhW1cyWBvDy18+x4X5wDq5h+96VlY0HaA7Sv0B9gsmCTc
	YRRbdrmD9PvwMZ1UUICYdYHnrb+KhUF4Tuche2MggRkym85Y069bmnUxV/Rt3bKVkXWzfqizMNWCv
	e2MIQpc6cvnnN4wGfZKJ3vFa3xUENmfwlU61uZNMtdDH0xHl5nxoxeotqPy10b83ZY6rDv2qM/IxY
	43L2fnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVD-0000000GbKW-0Gtu;
	Thu, 27 Nov 2025 12:53:39 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVA-0000000GbIs-25yb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:53:37 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-bbf2c3eccc9so944507a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248016; x=1764852816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWEVz8RQkOVIjQiYoeWau+DA1cwiHSk9Obrie6fKLfw=;
        b=eaCwAPkStbTWMw/7s+N64QR3JtdH48G9sjjj8xAzuCmy8amA3ur5uxD9bbh6TKBD70
         aL0A+ZHraOV2jtWUlDGdNajuR5v9WXj5gCRr96L1cxx5Lbw9E2vBCxc3ra+NOxgEKtKb
         o+yb9TlrPuABJ9yZVSk0Xty2WZEgiD5isSOoegUo7I5512Oii6Z357BGwKkUgwXypowe
         JDcdbXuruhVgZc8HZzpl5F5q2fdwUQUsY6x6zKco0ea6z7wmWFx0j0TcP+31jEtaEsjg
         v4WI0hfBDEHpqNbX4jcAZe5eApL+5Y/7Rh9fF80Xok/qlbNURwPnc2T8y+mb+a0IORwP
         2gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248016; x=1764852816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWEVz8RQkOVIjQiYoeWau+DA1cwiHSk9Obrie6fKLfw=;
        b=k3MYaMdaR9SaGup2/UsSsachrG7dj/UqzCgVdHKekTgLwO0PQ806Exgj8M8/Uc2U21
         7eSkSYnDr/d++4VmoNr7TwW5TuGCi0FErlcgL7OJVKE3ZMBHv5tsi/cKK0ogwRJI0i5B
         vuL5C4Qo6mMtDZwD/jo6r+fE0f+z0FNBv4Keo2hnLlWHmJuQaPtvWnNXA8rZeVr2fXTr
         i/mVkaAdeK14NOphtdRu1+1JB8Ogl+EzQh+86mGwOPBWzXoCPYrqjb6k48i4PfaV+Xp9
         ccFY+PgNuuG/OzHqRQiDrAh1c/MSA8bzRn4dqcut8X9KvPleXijgxNONirOY0y8Dj9wq
         yL9w==
X-Forwarded-Encrypted: i=1; AJvYcCWxf1pYgHlKomzHyop6RqG5cUd9FXs0k7bJGpU315GbyU6vz4R/SRXatWCu19GmZcGrkdjpPYQaxoUc7/3WXlGY@lists.infradead.org
X-Gm-Message-State: AOJu0YwwTOAybw6x/liAPladbdbDK39TPV6czos8Zt0LxvKvar8GPWem
	5aWTIE02RenXSl/kLTV/vyI6Q603QsIDLDjzPsjFmns/be9H4MKd4brA8+wYrJc0VgI=
X-Gm-Gg: ASbGncuIIyCvkDZodSlktC7frvsfm4qVb5+Lxm/k18XOBOt4lBbTudG427VMXmmdUM+
	2NFEQ0f9LnvfA+zfiTf/toZOAM/be8La+jm/eNlyfoLeiEp2Tv+zvxVVrN1MPwl0E3mGE62zPdn
	pnAsMiVD1ld9N3i1+3t59rNRz323BvlqU47Rxi04MhusaICBonogsPeCaWSS4/8bWWGBkarOqRW
	FszuBtaPcJwDIeklXQzWXtGsUtOX7rX9fa87myBo5kcuEfIQRbkGBwPBpI8n17PcgMSxEMRuznz
	GKp6Aj7JjWfNuaxL2xW+rUwxlCsg7sstlAhmN9iFHQiV9t9QZqLPimk8aKonzm3jgP5k5ORs2+G
	JPFfJFbncyazgmCV6mEwByhOg1sBkP96E/PJfXEZZnmROxtibxuKpQFitUIp+QZOC2QcF3k+Qp5
	XqvgdleWJgl6g7ZvX/858e3ot3rC9oUiuGIp/n2nSNwTU1
X-Google-Smtp-Source: AGHT+IFo3oRBJLdJi4pyyDpZGbMQhtVuztEKKK6FGAEfrCPL8DYRN7thK8HfinjkzsY3+0il8FhHiQ==
X-Received: by 2002:a17:903:384f:b0:29a:4a5:d688 with SMTP id d9443c01a7336-29b5e38c2efmr326573335ad.15.1764248015652;
        Thu, 27 Nov 2025 04:53:35 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.53.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:53:35 -0800 (PST)
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
Subject: [PATCH v3 2/8] riscv: smp: move ipi_cpu_crash_stop() declaration to smp.h
Date: Thu, 27 Nov 2025 20:52:59 +0800
Message-Id: <20251127125305.89961-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045336_547843_8FF3D90D 
X-CRM114-Status: GOOD (  10.24  )
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

Move ipi_cpu_crash_stop() declaration from smp.c to smp.h to enable
external reference, and rename it to cpu_crash_stop().

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/smp.h | 9 +++++++++
 arch/riscv/kernel/smp.c      | 9 ++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 7ac80e9f22889..f53f1f0e7aa9e 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -54,6 +54,15 @@ void riscv_ipi_set_virq_range(int virq, int nr);
 /* Check other CPUs stop or not */
 bool smp_crash_stop_failed(void);
 
+#ifdef CONFIG_KEXEC_CORE
+void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
+#else
+static inline void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+{
+	unreachable();
+}
+#endif
+
 /* Secondary hart entry */
 asmlinkage void smp_callin(void);
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index e650dec448176..9dbcb9a06a96d 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -78,7 +78,7 @@ static void ipi_stop(void)
 #ifdef CONFIG_KEXEC_CORE
 static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
-static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
 	crash_save_cpu(regs, cpu);
 
@@ -94,11 +94,6 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 	for(;;)
 		wait_for_interrupt();
 }
-#else
-static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
-{
-	unreachable();
-}
 #endif
 
 static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
@@ -134,7 +129,7 @@ static irqreturn_t handle_IPI(int irq, void *data)
 		ipi_stop();
 		break;
 	case IPI_CPU_CRASH_STOP:
-		ipi_cpu_crash_stop(cpu, get_irq_regs());
+		cpu_crash_stop(cpu, get_irq_regs());
 		break;
 	case IPI_IRQ_WORK:
 		irq_work_run();
-- 
2.39.5


