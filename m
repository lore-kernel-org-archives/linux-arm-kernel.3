Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66A8C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pZZpnp9Ii94lfQediVbtRB1HCrD5s3KchpIbsJ2tbsA=; b=D9o9YDhCE8GStXfbjgKYj2GdEH
	HfMVPLsbR3wN6OkAYs8cZhXJVD/HfhlFRrv3sFIWbixuaX4GZfcOs52aToaTEKg3Pzhcu8WMNqstI
	wfJoNq3ofMY3nx+7tQ7eNEhkEezj2oPVZWS3KCxd9eyPfeB8Se+QLbXVmp5Wl8w5PTNRvsWEjTKNi
	o0llkWwaHxtJXN7xCQXco0b2CHRS1m1/ge/2GSUqKRgOtnCasqptlQZrShSmgR/T5XWannRS/3m5Y
	fCTt90aLP1qVblhucZpdLGzkrYlZ3bRB7RpsUHMPKhZfh2HswGWMzraC4bH65UoRFCJJCnY7IA+bu
	Xn/xnmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9105-00000005cDo-36ix;
	Tue, 22 Sep 2026 13:57:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9103-00000005cD8-0tTE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:57:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-488615e6cfcso369269f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790085452; x=1790690252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZZpnp9Ii94lfQediVbtRB1HCrD5s3KchpIbsJ2tbsA=;
        b=Cdg4TGZGmh8g2hHxO+RHxpgj8X8SIYXyegxuP5k+PlNeMKDupG8YiK6G27A97v33nz
         3SotjT4HDdTL4EpHJU0ekxzqR8SwgtkihOQjvaOPzdaHAilyw3mYxHb2VU53YkNkrNwb
         HNsTiE3ZmvJSoe2YL6Nt6KX5wxWGjOKmu+twTgionJlFiGcus/mf42saZ22QtWTR3hnO
         9uGRgDywWv+t5k6ijwUNHRNzmkx3WgX53OuYmQeIgre6lQBnTW0ojn0Y8ILIPfweHzRn
         Yl8wgny0OHDuuKG8wTQhIGP1KPyYpNg3wWwuu+JhXHHLjkI4qTzef3rYqnA1L6KCur6U
         1XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085452; x=1790690252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZZpnp9Ii94lfQediVbtRB1HCrD5s3KchpIbsJ2tbsA=;
        b=Jk7a3WLLBo40KCiWkmq2vyif7NiHICAieLCg1nDhSabo8Z2gm0y+RvB82xU5uQku8z
         pHhyo6xBJhNE362UdXO56Qx/BDTYT425nI1QVMVjVj2mwa3am0x5aIeHsFBbroXvo5xe
         pRBkSuz6CyAD2xIfov//WU1hOIzDuM6n8sMBviPFyVAZTQ54+6lVGJx/jU+/O/Mlr7eU
         SNBHha94nvHqO7ykiL9WJSXPMd0hvxWYttCDXkeXWSlAhB8TdA/Z/ctSbdO+LyArJHui
         c6qp1C7FCU/FgtDzeQFaWl+zuJO2bF1jmVzbgAy8UR5PUkNRBAek/TSKmQyemGrEM+sZ
         349Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvu2rq46UoKn/xO+irhSXjIaglMvHg/fCx/aFPzjF2q3p13WUvod3B1G/WG/TLiQSSFBeTp6KCo+Og1UGwXWoz@lists.infradead.org
X-Gm-Message-State: AFuF++llR6y4g3J5TGqKqkFo2pCTr3Sq7LQ4oCyIemkp0lJ31CI70LYy
	MnBtL+e6Gmu+tVupEO/w3rpb4N86dC+mmEw66PA0gMjoHieEvyi0Et6z0M4YNYpD0kfW4N9lUHs
	Ws0mUl+Q=
X-Gm-Gg: AYBFou3TnnsV/MQecUM/2A+w1qULyQBMM7wFz6cFblpvuuhdJwig6vIedDgcpHxV6Mf
	FecMNF5ReFEn3P3rVpuECHaO0uY4VyJt+F6Z5TKtEFJ7d67mNsE16xDoVr6Ih4bWj2uHdqo+RJ1
	2MrMRPmm6Y/lyH8ILcT4f2gxpbzJF+3z8pTY1AGnxDGNripQeEKYe6kwIXL2pyhxumybj2a0ghk
	jxRRhz6aHRrF+pzVAtSUPY7ubBG4olP2Zhav9kcV0HlMo4iCLleokMKNnY0gq6ArI1SoZtmCXR2
	IxkAu6g/MnHD3T7DdPjSAH096TRNGr6bwaC+5vhJWvNfTuP0tEPkeVDSmkmuPufGFQMgIV5qrjY
	hqN4R6fQRVK5tm4LayCDkEWiIl0h1tjrHQQFBWaYlfwtPKJh8Uo6LWMOcN7AMXrysO37KmTqv/g
	NfiTVkRGjejg/G+CWbR4+OPjzwjPctCZMueAMdDd3vx59qL/xk/jgXNbccaeGJXxK2xhut8w==
X-Received: by 2002:a05:6000:4303:b0:487:9bb:a875 with SMTP id ffacd0b85a97d-48860f7eb5bmr4640032f8f.3.1790085452552;
        Tue, 22 Sep 2026 06:57:32 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862774543sm5865322f8f.11.2026.09.22.06.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:57:32 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH] arm64: smp: Signal EOI after handling IPI_CPU_STOP*
Date: Tue, 22 Sep 2026 16:01:09 +0200
Message-ID: <20260922140109.12780-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_065735_268351_7EEB9924 
X-CRM114-Status: GOOD (  20.27  )
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

On kdump/kexec, the boot CPU triggers an IPI_CPU_STOP (and subsequently
an IPI_CPU_STOP_NMI if the first one does not respond) to the secondary
CPUs, and the IPI handler eventually calls the firmware to shut down
each CPU. Since the IPI is never acknowledged via EOI, the interrupt
remains in an active state when the CPU goes idle.

In a virtualized environment, if the hypervisor does not reset the
interrupt state, this causes the crashkernel (with cmdline option
maxcpus > 1) to be unable to synchronize between the boot CPU and
secondary CPUs via IPI_CALL_FUNC, leading the kernel to wait indefinitely
for the CPUs to respond. This has been observed with the Hyper-V
implementation.

Both the Linux kernel and the Hyper-V firmware appear to violate the
PSCI specification:

- The PSCI spec states that the OS kernel must migrate any interrupt away
from the CPU that is about to be shut down via CPU_OFF, which by extension
implies that no active interrupts are allowed. The kernel does not
currently do this in the kdump crash path.

- The PSCI spec also states that the PSCI firmware must reset the CPU
registers to their default values when turning on a CPU via the CPU_ON
command.

Fixing this on the kernel side has the advantage of being
hypervisor-agnostic.

Signal EOI at the end of the crash handler to prevent the subsequent
crashkernel from hanging.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a117..cc7f3261fe537 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -988,6 +988,27 @@ void kgdb_roundup_cpus(void)
 }
 #endif
 
+static void ipi_eoi(int ipinr)
+{
+	unsigned int cpu = smp_processor_id();
+	struct irq_desc *desc;
+	struct irq_chip *chip;
+	struct irq_data *d;
+
+	if (ipinr >= MAX_IPI)
+		return;
+
+	desc = get_ipi_desc(cpu, ipinr);
+
+	if (desc) {
+		chip = irq_desc_get_chip(desc);
+		d = irq_desc_get_irq_data(desc);
+
+		if (chip && chip->irq_eoi)
+			chip->irq_eoi(d);
+	}
+}
+
 /*
  * Main handler for inter-processor interrupts
  */
@@ -1009,6 +1030,7 @@ static void do_handle_IPI(int ipinr)
 
 	case IPI_CPU_STOP:
 	case IPI_CPU_STOP_NMI:
+		ipi_eoi(ipinr);
 		arm64_nmi_cpu_stop(get_irq_regs(), true);
 		break;
 
-- 
2.35.3


