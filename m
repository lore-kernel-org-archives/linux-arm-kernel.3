Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1A3CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ub+joKWJDAfsvLrnMb0mGFn8U6flakDwqgSsOBFKpo=; b=VXLghMy2wB9mDnNxpB/Xhkwbvv
	9muAEg93BlpfcAwabScRuSYOe62DeVQrjA0Prnb12PBVCxs77ZYWmjoNDIs9HrcFdWH8ppcQG0kkC
	NSiBKdpXON5y426EJAnbTnFPRYOj56yqDrKj7j9Aemg421vbey809fqpPR7cuaLpnevOHdBKOFps3
	dc/bCKLGoz7Ziwx6WTX5iO5lizP8HaTnO9PM+x8PwH2R3qq3IEvMylFF0okMvV7UWCT+kHB2tGRVT
	9aK6FdjMFDGXDG0+7fGeus4gGBXXiptMJmVEx6VysR7DVPGgkRvEV1za+3+w2eVHDaUKlC2ze+sVM
	VmLDrFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1heg-00000007HMA-1gNV;
	Thu, 25 Sep 2025 08:48:46 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hec-00000007HHA-3FMb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:48:45 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-77f207d0891so757920b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758790122; x=1759394922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ub+joKWJDAfsvLrnMb0mGFn8U6flakDwqgSsOBFKpo=;
        b=hTpPumyHXXC4QOydA58LkYQDav1Hi/0QDP2zDBEPc5BcvfSEVOEo4zJDYFj1BFEgyj
         2eOz2RuhT1fTbI6QyWv+namA63Fz6zXZQ8En80uQH1jKduPONWj5RqOXLYsCmUcWghQw
         RdNNPBBkd3CStS8Yn7+HUQTJSQklesMX67ZeAg9SiJdSUoyrq406aCPGx524mSzCRnc2
         dmnKqegARemCG4eEY5M1T1BBxFkLrRYM9ef+XJJSZKRkjfuct9iFhI4jMX+DIUfbzoKi
         qt3HeAfP7Eo/2xAkf8o8aWZs4PjKp5rpj09KqU8k68K+/m40EYKxO3HeM89vxV8O7KE9
         1m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790122; x=1759394922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ub+joKWJDAfsvLrnMb0mGFn8U6flakDwqgSsOBFKpo=;
        b=lOREaXvenVAzUIir19yRa5h9FRAWRWXQh7damY38h0E+yiXl7h827Um8Gdk7+mB8XN
         DYlWWNRMtEir1zoAHgvEFskYNliyqvI4BSfzLe7e4I/vlgLLAVhEntA0FRXhTNkCaus7
         CswcEa+ZXceoB1UdtupG77OlSdCn1Y130RmpX73PxBX7z4fMMR2HGWYogE/OdxAtRJms
         wCo/nsdFPNsJ8eqwg5uogXrkh1XiQTzjQW2OHCYatBDetF7DIbf82yTXX4Qs+bYlN3XK
         yWUDYSo46NyA+sjTLHTACqqwzTYuAYd8VCo3sDGt7lJ5polHUZS/23j3/YfvY5g+mP+b
         DP2w==
X-Forwarded-Encrypted: i=1; AJvYcCUEEnAj3ivDiFbqqzUHQoQJDGadvSZrcQaIs7Qw+aqzR7i0RlucMWBM2jXzVv0X6pKYjqpNe2MDOVD76CwMTwNT@lists.infradead.org
X-Gm-Message-State: AOJu0YwptexLvZ7ObrybzJ3pkOueZrxAsbziJHCJT2jB76HYlDAPiIkI
	zkc5SspNWtFmtMiww0kUH5fFVqoCnBGxL0KHM68cDrIeQoyGytA5Lrr3mqGAZSahZxw=
X-Gm-Gg: ASbGncv0RLzXkX77+GXTPsMAywDsuMeqTVzrVd3IyDpypkmxEMpL/aasUKEqBG1FC0W
	J2WCk6xeY4BkpDbGehKE6KIyv5xYBkazqoOIVaUCoZGjCNiFIk9dYvfgNx1iN9Vb3L/ZMyFHTaD
	d+faZRbOyKiHDO9gAOk5Clov6jwyyknL6VzxgmlF8BbxwRaqeg4svYYAm7vV6x+d3w5fe0hv8KY
	MA+Z2rdNFzY34/XwR0gNVkL3ziUZh5/wHFubdSa6mWot2APFhvhJUoLDzupmzitjU58nlfZCoy2
	W6kkrc2y8Jbyxs+ZcNbVk4l8Zj5PCFZ97sSkK+l5Ozpd6sejDGsRIxDRuudroYrPMh1wwig7jC4
	x8VFEKlUU/AMTScs1VSOzNuo1hdhmaw5w0sW9lpGO1IadXMW3Vm9FoHxYZq6I
X-Google-Smtp-Source: AGHT+IEGSkHjuRa7OGjamv0g/2mmAckOVuB2U/CUDAe2j089bjTc0cZKoTa5Cf1LNp+M5twG0RcAdQ==
X-Received: by 2002:a05:6a20:a127:b0:220:10e5:825d with SMTP id adf61e73a8af0-2e7bfc1d570mr3624129637.8.1758790121907;
        Thu, 25 Sep 2025 01:48:41 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023ec6aasm1321867b3a.46.2025.09.25.01.48.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Sep 2025 01:48:41 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Thu, 25 Sep 2025 16:48:06 +0800
Message-Id: <20250925084806.89715-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250925084806.89715-1-cuiyunhui@bytedance.com>
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_014842_831711_DEC13F5B 
X-CRM114-Status: GOOD (  11.81  )
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

Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig           |  3 +++
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index badbb2b366946..bb4e8c5a18717 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,9 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index c852f64a50221..0c7c5924687c9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -22,6 +22,7 @@
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
 #include <linux/workqueue.h>
+#include <linux/nmi.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
@@ -1192,6 +1193,13 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
 }
 #endif
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
+bool arch_perf_nmi_is_available(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_PMU_SBI_SSE);
+}
+#endif
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1618,6 +1626,8 @@ static int __init pmu_sbi_devinit(void)
 	/* Notify legacy implementation that SBI pmu is available*/
 	riscv_pmu_legacy_skip_init();
 
+	lockup_detector_retry_init();
+
 	return ret;
 }
 device_initcall(pmu_sbi_devinit)
-- 
2.39.5


