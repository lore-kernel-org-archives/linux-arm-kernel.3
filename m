Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F927CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+jTpL/HthRsBGxB3Q2ZvpHSHqmwjwHrkZeOIM2209Q=; b=RU8aYm/a1OM46nEhQRLbJPYG4a
	VLfknB6UkjT1ADdNZu3rVGbXYfkCeyYfmBbUC5oeHojoUW5dO7vb3fl6HORA8DH7XzjSTRgqZZn9N
	n1rpxvIo/fLVx5rioae7T2wo3ev+KO+RpqCJGAAEAZjmLVGtOX2sQ9X3zj9lUWGq1cJbsex6zF3WT
	PycHbdWbO2Ct5qPoQ6LqND4wWvvDbmfMijcwdNVYRYaffsLPY0RTLu9BhMZSHxi2oIZAZEXfnyG2g
	ihRQpQsoYfGxB/sK6/Qj/qkzkQOZXzmpUobzY29sLZreEkqIT5ZPNymGcm+wp7lo7rLnXySupq8p4
	NqkCfuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVk-0000000Gbpf-1b9N;
	Thu, 27 Nov 2025 12:54:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVg-0000000Gbl5-3kcE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:54:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-298144fb9bcso8621195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248048; x=1764852848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+jTpL/HthRsBGxB3Q2ZvpHSHqmwjwHrkZeOIM2209Q=;
        b=MfeUI89dSCKTolRl5bAgYeBnpgNpfj/t6buj55EonQXI+6XDrG26tuaAPzSUsk/cKX
         v+uPAk8fEPUdBMedmBxtI77XGjqm1lGg2g0sIZo3OIHkTl68n1VHbMhJ9mdjo0E83DZn
         geSid/fw7KGPRq9XUVZO6urPOQeh3yAu2X318d2GsH26krL3kBduKwcjPs5A/vBTtxB1
         rddxH1pENGSES/zEx8fXC4/2jEE1r8+RckkG5O2SI5F2EBePU3wdTZkjeZfIUHsyAR0Q
         4oLqopRxg0/ufkCOpUz5HZIhc2FNuGrCLgObw4jf/3evch/d+4NnCIbukaAKFvANEoUJ
         tw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248048; x=1764852848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+jTpL/HthRsBGxB3Q2ZvpHSHqmwjwHrkZeOIM2209Q=;
        b=CXtGj4lp1fGPr7/oW3sc9q2n/7kbOt0L73FNZRC/fSMBTyY3Z6iOmmj/fX5Zp+6ClL
         ZXc6hAgdx/pNS6agDSGF9VS100HaX1e6vuWgoMp88Z2poDX9KPXnw5gd0KWmVO4ogFUF
         d0rA4Afy2gZmhL3dPP5NAlU/aV6bHDQ4aDa34ZabSwJXlhQMazj6uAMzUlIFJGnuktBB
         db9E76U6l5wISxadjS9847yj0CwOuKuS4LDDIH9u1w6Vad+C/C8sNPTrSWvfxBtL8hvw
         3QxgPkottIasfShsRmoNlCI7EyGFQh2ZljW/J/Or5bTxM8MHUHTqCAx4yI9Xkx2wPFUv
         SyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo4qrgAb2NR4NJdbFDDwIL1leX/e0shtAW8+iYSGtstb63lvPvnbfTf5SOSFzWNMUxNOqwgTIhAS/4Ua5eqZiw@lists.infradead.org
X-Gm-Message-State: AOJu0YzSlF2oatfMyQ/Q8HemA2kKG+AfidfEnIwFon/EDwSy3b3SBoXl
	B2hJ7At+vFxQahofS2MlWOsT0e8twDpUwiWqkpd8e0MAAvtZ04/R2vvIEw2ZEFLxe1A=
X-Gm-Gg: ASbGncsKNyxCMYWo/JmRwhtYkfD2UaulIMFE+G2ab+2ALh1QjN+nPrDUvPAeSLU/IRj
	fBL1aR8zsXhLh+ht6l3LRPbo0rQSgprJnoIxG4nFBlP48DklDdFHJizioOAZ5/qRNjRvbnJX+v1
	szZCcAs6JO2vxl/nk8lxSV3xsfayqiyBq/LbxEJZKMzrdljfQRYxBfpooFAX++ZQBCEW+5OShOs
	1pFjnj3h5jqsDBqHSiY51e1FcdKfOVPP4Vm+BtwEKECknz2GO8HIbkpt97qu+NYOzLThiW0Xcjs
	QUm1RoneKyMRId8rQYvHGpCA7JgaMEXCg42U6w/7cqTrvYtG0SKmBMDh1xKjXTqQ6zY0Yn/aSb2
	jIHwhSYYKhaq2dY3vXvETLYBR6R5s8OeWt4YB/K4tSa5Xw77DKMMhfiZO70nypmWIJhZedgAoRV
	ATBQs5Z7RSCkdHYRTA8tg2MpV1x1m2GM49gTLrN3iIBwyd
X-Google-Smtp-Source: AGHT+IG7drzon1SEfVMmYQlVlllrpZTrqpn/kBxmqkQQMT6P+x5y8+0dsVV7yCSCC0f84pvUbVhN3A==
X-Received: by 2002:a17:903:2412:b0:297:f0a8:e84c with SMTP id d9443c01a7336-29bab1d73ebmr115182445ad.52.1764248048104;
        Thu, 27 Nov 2025 04:54:08 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.54.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:54:07 -0800 (PST)
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
Subject: [PATCH v3 6/8] riscv: smp: use NMI for backtrace
Date: Thu, 27 Nov 2025 20:53:03 +0800
Message-Id: <20251127125305.89961-7-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045408_959921_40449F24 
X-CRM114-Status: GOOD (  11.15  )
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

Use NMI instead of IPI for backtrace if RISC-V SSE NMI is supported.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 12 +++++++++++-
 drivers/firmware/riscv/riscv_sse_nmi.c |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index bca95ec0b0f74..6d9a67c2c2a6e 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -342,9 +342,19 @@ static void riscv_backtrace_ipi(cpumask_t *mask)
 	send_ipi_mask(mask, IPI_CPU_BACKTRACE);
 }
 
+static void riscv_backtrace_nmi(cpumask_t *mask)
+{
+	send_nmi_mask(mask, LOCAL_NMI_BACKTRACE);
+}
+
 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 {
-	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, riscv_backtrace_ipi);
+	if (!nmi_support())
+		nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
+					      riscv_backtrace_ipi);
+	else
+		nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
+					      riscv_backtrace_nmi);
 }
 
 #ifdef CONFIG_KGDB
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 02e2de2bb70f7..a138d6bdbc0d1 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
 
@@ -59,6 +60,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
+	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
 
 	atomic_andnot(type, this_cpu_ptr(&local_nmi));
 
-- 
2.39.5


