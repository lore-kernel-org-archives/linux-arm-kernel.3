Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A27CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWkOyJ5AcV33EEWNye1AG75lZoiCez1+DCGpMn2n8h0=; b=tkPwg679M0mCE61OlmXaMIFVa9
	viaX1wAWmNy6oba5+jzz3MoT4xP5VlBxuIeLdg0IJr9LHZ0abB0CTLVkG4aoPsiiMResYWKpikDzQ
	wvRXI3db1KS4Zbza1J7dU8iSCmlWFI2f/lXO/8SxxPv1YJLQ2J+8curPj6k8AKD46vPDQTNvZYfUp
	p7PxrPKjoYSA6mBZcfwFi16Rj3jFrCL1Z0PbY9GCsy0Tr0xvUocFdH5eq60XlhINgFA0meujfJ6kI
	+sxja9UhQv1j7OG+DlKZgoGeO2Hm/E6xu4Tcn80ACrcDC3vJRm2Uw0+899PO4d5WG6xENkiU2/cB0
	yZ8zzVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObWC-0000000GcER-3DuQ;
	Thu, 27 Nov 2025 12:54:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObWB-0000000GcCX-0tAo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Nov 2025 12:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=fWkOyJ5AcV33EEWNye1AG75lZoiCez1+DCGpMn2n8h0=; b=BjNOpvCjnjFrGF+/nh95Cax5FA
	R8kKXIKHfnYW9hiqQUZNYQxRt7/Wg7EmJkxWGd5cezKqe2VimYrtMhu44A23DiPSNTutI9GX6NDOc
	No60hd7YB/wPQEqBCGYYk/22I0U2IwfdJp/JQBJ3+ctA0qDyvEf9L3D02GrQnZpKgVjoRoInK2ppK
	AfWgWKzFv3f5WS2JAvIIb7F0yVbhyxOQ2amfJGdkQRb3MlqIRyfHgFXr8pfLOLKWiPYZWJpTdKNLg
	93gPHfj2W00EhwR4gZDF7G5a+C2F5hX9FbtkBzrdANKX/hbFOvGpJcfgyZAm4/GF6Sjdmm6BquEIo
	SVh3G0AQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaeL-0000000A6OG-3eJX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:59:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-298250d7769so6055555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248057; x=1764852857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWkOyJ5AcV33EEWNye1AG75lZoiCez1+DCGpMn2n8h0=;
        b=PLKD+fqbTAB/pT71uz4lS3Db86JwkoVk0jvdfkv0k0URFBf3Px12vrljRyzJw6oy5b
         R9SMnIYPTrVcWC0diZF9fi5cS+5PMWFwgUQ1953YDDI6k3W5sg8Uv5k+UEQkf0WnvyQN
         pXEpOV2q5ZA5BS75qiRt2adOlU3U8+hNUBWB3/hfeT3pt7Qt+QUPu5PcpF3ArcLzLZTi
         xBrky9BdJkyNDvTJRiJ6IgZqoHlZWcDKlskDN5vxdOG6vt1HA8nnjKP644yj0H4a9Tzf
         kIbiTWsdWejlOWqBUBPN6ZnZlGXRI+Q7JoV/GfPH+cxRSIbs/puLMoWdp1o981T1oTUS
         xDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248057; x=1764852857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWkOyJ5AcV33EEWNye1AG75lZoiCez1+DCGpMn2n8h0=;
        b=Jy7XjhSDRfWLvUtqb2OWuml2suc6EhJPwVQ3BBAjGDrfm3BZ9Tr5lmw8O8lhvM7aCy
         ql+zlkoz9B1GIG6+CrVhDdI7vAbMWNVoVZPdG7Emnp8sNabvvzo9JNOSEWCBhYFEhQxH
         3x9l2TOV5IXZjfGaOBbiSVkI0HL5yY4DEFXSOJ3i6ulMKuLgePHWFieKsL0doUagRJTu
         pOmqEe3AERkJmp0zxQJrTo8Uo6mxDyuTk3Un25b6AAzGE+OJ+2zOYq76qXG2IQRc245q
         +wWOV0FhgOA4ocD93GWxuxOso5pjMCYpavAUc9TdP9uAOQgKl4DfSZwUuzfUr5LYhLty
         T1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOYX2qbRgqabGF9LPcqKaRNySuLhmbUGVLSqhdqoTeBKEPjJuL2OrQP15vlePdydUySHLFe5qkPPE4ec1htUP1@lists.infradead.org
X-Gm-Message-State: AOJu0YyqWzV80lBaHaK4+91/R2ptV+yQu7EVduVi+FjYMlUad8pVxxvY
	B0VvqxVO1wVR5VidcOgdzEXIIq+k1IrrpOz08rCGNmhMLH2eRSegiSzOWdwbDjUxXCY=
X-Gm-Gg: ASbGncvwwg9x6aL/iHtNZY0QJN2ArfHRcd2TyePVXzQttIZ13LWeZ0hkCx9QpMugXdV
	x3pb88k/yBLrnOQ+uYhhNlG3tpqcfUAokZtYiag1am7hcriUiS6CCdicJttxw4X3vT1/dmmJgxR
	I2O+CR8bOo/+LwfedOX74bYuLBBLnBoh50s/hzgHk5Ck95kJBfv0roAcStYHN3utHp+1Ng2C3HV
	WWXoKB5azBqxjsg5cccPiF6kFaGI2xdNTc2JmfNRuq3IjHikL2pF5wnVt9zONX3pIopBkXimN5D
	2qXl1BREkGpYDb+fc2TZ79oT7plqofgRshhDYU4f2gjoQDhyMZ/ic7YcD3Cp2AluIqU1iQg1OPs
	HoJ+iqcHeXLToQOPVJQDeJKDknhLRl5SAhsudj5Th9KvSEfyiTCm8uQLdHG4sNLDlQkgXxez5dQ
	hin2O9XDJJpULNSPIXQJM0AoHps6YzqAnccSsmCcWgJhOC
X-Google-Smtp-Source: AGHT+IHfDsQKz8tAmdnpj9oG+MYaFIwY7KvVCZ53LvFxGr4u9uSgj1+YFJnBx9PPYOIc/+SZwAFzqw==
X-Received: by 2002:a17:903:292:b0:298:43f4:cc4b with SMTP id d9443c01a7336-29b6c50c632mr250127435ad.26.1764248056650;
        Thu, 27 Nov 2025 04:54:16 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.54.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:54:16 -0800 (PST)
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
Subject: [PATCH v3 7/8] riscv: smp: kgdb: use NMI for CPU roundup
Date: Thu, 27 Nov 2025 20:53:04 +0800
Message-Id: <20251127125305.89961-8-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_115905_651501_CCED0E33 
X-CRM114-Status: GOOD (  11.18  )
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

Use NMI for kgdb CPU roundup if RISC-V SSE NMI is available.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 5 ++++-
 drivers/firmware/riscv/riscv_sse_nmi.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 6d9a67c2c2a6e..84436e348b6ea 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -368,7 +368,10 @@ void kgdb_roundup_cpus(void)
 		if (cpu == this_cpu)
 			continue;
 
-		send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		if (!nmi_support())
+			send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		else
+			send_nmi_single(cpu, LOCAL_NMI_KGDB);
 	}
 }
 #endif
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index a138d6bdbc0d1..85aa65f31943b 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
@@ -61,6 +62,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
 	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
+	NMI_HANDLE(LOCAL_NMI_KGDB, kgdb_nmicallback, cpu, regs);
 
 	atomic_andnot(type, this_cpu_ptr(&local_nmi));
 
-- 
2.39.5


