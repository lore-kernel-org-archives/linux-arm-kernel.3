Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A757CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ktfjcf1VaoQQvTZkflNkd5LOSRp4Bliy+Ze+vhLB+8=; b=rbqGvi8qZSA6xXWzXSrHe81nS6
	dCeiRSi9RuUqOnR8+ua4/nC7kC4S82/1wCOI1NP0f/ipr+HTn6jn146nsvdJcinns2cTrIaTcbyCC
	PIqiVcCzbasyVMcrsS/jb6Lj2E+U4cViOyOyDBOD5Cz9WOKp4L36WZlqpo27C9oiwsR2BQxaOKoU+
	YsnzpEHQ75hGyWx/hv8WICU2+Gm0tvebMFHpFLP8jRr2avi34EybZqoYRwme3Iv1GQVh7NUbwHNny
	xfT0NvQhsYU78QG6/zNPyL8B/H/uLlpSzlrnI6Za5Tu28V5yh2/Ao5N5sreHiKgbAkde40KBoNzt3
	mioVfwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoX-0000000HFrm-3m4D;
	Tue, 18 Nov 2025 02:51:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoQ-0000000HFm0-2uX8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:51:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29812589890so64019955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 18:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434282; x=1764039082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ktfjcf1VaoQQvTZkflNkd5LOSRp4Bliy+Ze+vhLB+8=;
        b=Fegay5JcSLgWLq9fYsw/sVv4cZ9fEk4V4pJxJ+4dxqUBU1VR2T25X+4zZGLn/132mA
         EWFS/OmrOCNy6VH+4MXfTkFIpOv/3YyCmqlYtpNMTwJ6hx01k8g3/hSoc39s7ybyVudr
         gsMZYNx6FQrbEum3hcZ7f+tzhuKdbRUdBdXbjPUe6sNCLC6x3FqJXKGOAYtey48bSv2g
         IsUKZIsNaJ1xdKhodUaDN0td+IlP0CgjrT5yIbGzLxPOoTbNuBxa2Hm018RTOMuRrN/l
         SuHtRR2RX0kz1KPixSonRurxr5WWbc/AMge2V2TWKy7KSoYgMZ2lQdye+sXwEiMZfE2X
         VCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434282; x=1764039082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Ktfjcf1VaoQQvTZkflNkd5LOSRp4Bliy+Ze+vhLB+8=;
        b=MSc5IyIWJ1LqJiB+eXfal5nrnWoLAMAZ2UGq19szr3JOvrBaTyzsl0NQUPlLSyZQqf
         X6NljNYNFvedXkijpgWKY+t+ByiuQsQCxgWp0Ef/LyGy5z8bKOyZIlZBi6zlN9OKVw2X
         5axEUY6WdouxTi7pxrpZr1vBi7PKzuFpK2IdXCwU/+qIBSsxHbz60EDt4zy07CfigET1
         SJnNsAxCtDcAYU0CyhW8LxZ6HUEufwgOU0TxgHDlsGTEtKg1f8thcM6i9uRG0UlbStc6
         igLhtYf+Skc3c9MD3cw+T7GaRxuKZOmbU4iq07KgEdpHjl50Qp5ZbEAc69PX+x55cOSp
         Oyyg==
X-Forwarded-Encrypted: i=1; AJvYcCUsz3YkJLPmrAXhdmnpPZ0qOeD+VbLwVpuRi5fsqduSfB+WgWU+bIJlpXH6r7YKsMFkpxKJ0cf8bEGIqKGfUMb+@lists.infradead.org
X-Gm-Message-State: AOJu0YyBEloVMMdJxPgBnlh5No10ghCGP6P0DCBGp7COsHTTALriUmSK
	zcty2VJJQMiJzE3JrKbr5JS1ygLUG9uH7Iur9vkYm4ME5nw5rbnr4oP54JRQ5h8ch8A=
X-Gm-Gg: ASbGncurfnSjk6sW8jjeybljEOzriqmeLNc6qo4JlAsVZqqQck49J3uXUvsi3PQj+nU
	//CCom4elXnB5q3Sn1mfyjkEt8HpYXovHFig50V5DrcQHZQ7DCgFnWghswro8DWZBSztLIXlM8V
	Kh3BtVlqOZMXPiDi+qyuoXjntBFrDnL7IbV2kmcmwnmS8CDmV/rWghR0phWn800xboCiyfA7GwM
	doAdU6u4iPsP2EUUqFPcGQAT98opg8EDzB3kWCr97ajEg3wYCg97ApJKnhjhndxJ2R5aBSaOvOj
	oukFwPrUKWsmKeEPlLYSepvcIqBd72+LK/ZjfT2VHWPZ2WwLa+HKuoGXM+0M2HJTJJptaOqeozG
	C0L1dle5oEICVhHCoYzDxLYNftP7/GiIXfwlvkMXUPL2LodbPHJx8bcwzjDGabE3y5UBv2R4FE5
	sgbZhQ0S68Zy0JCyy+WMk6ytPCkeY6Nu1G90G3CI27UbKI
X-Google-Smtp-Source: AGHT+IGdT725im4HB0Isy/71zroaDxOZnDLP188E5pE1tBPP1s1RRQVrXvWNbLyW04IPhqkov5keHw==
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr161110795ad.55.1763434281922;
        Mon, 17 Nov 2025 18:51:21 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:21 -0800 (PST)
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
Subject: [PATCH v2 6/8] riscv: smp: use NMI for backtrace
Date: Tue, 18 Nov 2025 10:50:13 +0800
Message-Id: <20251118025015.42491-7-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185123_718867_7928F79A 
X-CRM114-Status: GOOD (  11.43  )
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
index aa1cfc344a2c6..26083fe0a5df6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -356,9 +356,19 @@ static void riscv_backtrace_ipi(cpumask_t *mask)
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
index 0ff0bda53608a..cac940b7e8773 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
 
@@ -56,6 +57,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
+	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
 
 	atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);
 
-- 
2.39.5


