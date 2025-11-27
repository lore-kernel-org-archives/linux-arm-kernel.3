Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C460D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn2qLDcM5Q0Hk7ii9P/KQYaMCaCobwGUqniWS6mOX/s=; b=M0blGHieb8tcvXqwpHosuTjA6B
	y2DQ3rWop9Fyjfpofyn5Oq547DbzHBHMxpQh+sPLBk9fZEI0zewSURj6aCbq2e+fC09G4IoSIPcnz
	ZV27vbFxv76hTpgnDsMoh/boCL0MupJFXqKLpeZR0qSj+zCOkAZyJhZ1o/A6eoDCArOrvUtzdB53Y
	1kc80ITF2Eg3LftI16TCI5oGLqWnuzUn92i10PCXxYDt/t6lX69M2pmvvMDqOxA+xWdrx4XztTNCr
	0Uv9Zb+h7lEbGytOgAae5NFmrbDT3bqsVtQUnwLod9wFWyuqyOcoluAraUXObX2RpDUeFy/DFutGD
	r/Acbvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObW0-0000000Gc4m-3pYQ;
	Thu, 27 Nov 2025 12:54:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVy-0000000Gc2H-0281
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:54:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-297d4a56f97so12211655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248065; x=1764852865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn2qLDcM5Q0Hk7ii9P/KQYaMCaCobwGUqniWS6mOX/s=;
        b=lIbatvoVpHYdPxLeEcFxg4lX3SCiIGFbJtkvb9O+Y3hcAbFI+WAt+C6onv9OwKiMnu
         HR3F7Ny4aJk03J1McIV5XfsI7sGiHDQUBWcrp3Q7kAvAHw+ZX6hKeU+xiu5IiWEBcMeo
         TDmIrF1/7xrC0DVR2UmeJXY5W+JW+UqQEjJHogRtnZoc7VVvJeP/iqMHdCoAxpAyF3y3
         tv+qhyiDIfuOXKOfCT03+pn+kq7by0WkOSnd+ggPw2MYWnz9i9LPakFB/RcdXIg7WgJz
         AYhi/I+d7RMdxUhUp3PseBdqbdF8AT2WaYk4jmuAjgIyXWB8G7zAeAmfNkydZFy7k0GN
         EUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248065; x=1764852865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cn2qLDcM5Q0Hk7ii9P/KQYaMCaCobwGUqniWS6mOX/s=;
        b=VE0Ihdp+yqi/PmHFLSoUoKOW2bmW558ckVGwvg07R4G+ewboJFPnsgkX1jT3wgLAVh
         qZ02nBtV6uJKtKJF6O9aai9sYX7E6J40mkzHD6vkRwNHXnvJ7DrURdbGj9jecymOG9Z1
         IYslwhdrrTfRoush4j/bbgNoiQBRDfgC5XMgN8YAT+DuZ1kb6LBjk2V1sDLvtEWl9IxT
         bhb4S7jvE5WQOtsfSv4O/7jvZPegZeLK1ysGuGhLPZ3mnFtz9kJ3qVkab7TJv1FbYWAR
         pXVrRvJI2ilJoWUbZFL2RH6fNrUpslwbdh/4exHp628zRcpXtWbsUjlutaKRhJnQpcCC
         FWjA==
X-Forwarded-Encrypted: i=1; AJvYcCWDgz4WtBfP+NXeuRnL/pEIHO+mNFD7lEwd6dgZlVHtHJ5c5uNB90b3Ybldi3TDKVCHSoJThgaHBpQjRBNiD6Ju@lists.infradead.org
X-Gm-Message-State: AOJu0YyBldqv4wNAstbO3HjytFXgW6sPJVT0cWOntcErloTxiVwEfX76
	83l5T+RGR/2lgwnAzDQ11U8nWlWedKh43rZV0P4s7Zjlu9uVpLQ3gfYYRwCwfSo7Z2SJ10MC3rB
	iEw7IWxc=
X-Gm-Gg: ASbGncu+KO8C+SC0hPYzxH9ic79V1UYEAD8KCv8WdEA7+Wgk7dmwe8B+v9nFYW1P+kw
	iAjVX06nG3P50Or4/pQys+MCWqProuCeznsM/9mnWVQKSCN+Bb09RycafnYK9+wU92qDFxsuMaT
	2wRgDllH/gTOr0sYQIeHZDDthOZExj0L+HsAZrwIELquCerYheXfsV0CIA2gPAvgb2wmZVZTaEz
	NIsM3cDoLol4VoIK6+rYI6+1tnGddSkkFXNBzZx+4txF+vyB04fmuPIFbDKz7PkJ9kyULSa1tws
	17/0vLKyI8JfuQDTzFLTEVbMZrChScmsZX/XG1+Id8S8nAQyx0lGZA5oayv8PhGpMg/2AAXnTwZ
	gRJ0XgpcYynn+mIiwXVYrQt+JxQa+ac1SJk0sSw4n2xeJuEJ8FLr3TWSRdonVMUfke+jgODIuwT
	SLIRe5x5FFgcfg1AFTdPYtm2wdYotvQ6kwap1M+apGeItP
X-Google-Smtp-Source: AGHT+IEAZqTGZJVNP2wrNdlYDnUqTCKW3NgeNK+bqQtAShTypNyKnPlwOxZ/5vWOPg+U1HVeecPksQ==
X-Received: by 2002:a17:902:e890:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-29b6c574f95mr278040245ad.38.1764248065275;
        Thu, 27 Nov 2025 04:54:25 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.54.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:54:24 -0800 (PST)
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
Subject: [PATCH v3 8/8] drivers: firmware: riscv: add unknown nmi support
Date: Thu, 27 Nov 2025 20:53:05 +0800
Message-Id: <20251127125305.89961-9-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045426_076834_5525B9EA 
X-CRM114-Status: GOOD (  15.21  )
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

Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
event. When the system becomes unresponsive, unknown_nmi_handler()
can be manually triggered, which in turn invokes nmi_panic() to
collect vmcore for root cause analysis.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/sbi.h           |  1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 68 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 874cc1d7603a5..52d3fdf2d4cc1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -486,6 +486,7 @@ enum sbi_sse_attr_id {
 #define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
 #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
 #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
 
 #define SBI_SSE_EVENT_PLATFORM		BIT(14)
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 85aa65f31943b..d98015d1cb893 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -7,6 +7,7 @@
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
+#include <linux/sysctl.h>
 
 #include <asm/irq_regs.h>
 #include <asm/sbi.h>
@@ -16,7 +17,10 @@
 	do { if (type & (mask)) func(__VA_ARGS__); } while (0)
 
 static bool nmi_available;
+static int unknown_nmi_panic;
 static struct sse_event *local_nmi_evt;
+static struct sse_event *unknown_nmi_evt;
+static struct ctl_table_header *unknown_nmi_sysctl_header;
 static DEFINE_PER_CPU(atomic_t, local_nmi) = ATOMIC_INIT(LOCAL_NMI_NONE);
 
 bool nmi_support(void)
@@ -52,6 +56,35 @@ void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
 		send_nmi_single(cpu, type);
 }
 
+static int __init setup_unknown_nmi_panic(char *str)
+{
+	unknown_nmi_panic = 1;
+	return 1;
+}
+__setup("unknown_nmi_panic", setup_unknown_nmi_panic);
+
+static const struct ctl_table unknown_nmi_table[] = {
+	{
+		.procname       = "unknown_nmi_panic",
+		.data           = &unknown_nmi_panic,
+		.maxlen         = sizeof(bool),
+		.mode           = 0644,
+		.proc_handler   = proc_dobool,
+	},
+};
+
+static int unknown_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
+
+	if (unknown_nmi_panic)
+		nmi_panic(regs, "NMI: Not continuing");
+
+	pr_emerg("Dazed and confused, but trying to continue\n");
+
+	return 0;
+}
+
 static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 {
 	enum local_nmi_type type;
@@ -69,6 +102,35 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	return 0;
 }
 
+static int unknown_nmi_init(void)
+{
+	int ret;
+
+	unknown_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI, 0,
+					     unknown_nmi_handler, NULL);
+	if (IS_ERR(unknown_nmi_evt))
+		return PTR_ERR(unknown_nmi_evt);
+
+	ret = sse_event_enable(unknown_nmi_evt);
+	if (ret)
+		goto err_unregister;
+
+	unknown_nmi_sysctl_header = register_sysctl("kernel", unknown_nmi_table);
+	if (!unknown_nmi_sysctl_header) {
+		ret = -ENOMEM;
+		goto err_disable;
+	}
+
+	pr_info("Using SSE for unknown NMI event delivery\n");
+	return 0;
+
+err_disable:
+	sse_event_disable(unknown_nmi_evt);
+err_unregister:
+	sse_event_unregister(unknown_nmi_evt);
+	return ret;
+}
+
 static int __init local_nmi_init(void)
 {
 	int ret;
@@ -101,6 +163,12 @@ static int __init sse_nmi_init(void)
 
 	WRITE_ONCE(nmi_available, true);
 
+	ret = unknown_nmi_init();
+	if (ret) {
+		pr_err("Unknown_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.39.5


