Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D6DC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M5UXze5ARMASnHW0DMs+U94NSouTokoB+K8E72tD5u8=; b=STxkqYPnYvjfUcnrgHbLZf85LW
	9WrFEmFcdOLCqP74dEXEK1MF5U4AeE/+mqUYD8iX8dDqYe8I8bFEKFTSGT92OVe7Oq6g+H1mbWmQV
	ZtA3RQMbahCi9e31DlH3Abmn0tD/ELE+AT3dp3m/mpMxNVMF9ydysFTzVaQgdCb4dTIA7S3JMD++R
	dv9S0ccwJvxZSPgYwJGKNkcYR2nT1Qk5vNSpZ6PsP6mCaGsCPjL2acRLVpW/L15xDPP4XcS6rf09r
	JG9bUz+NoNbWrg8JrDP7k4BUBMpdxSDzwmP2YGkimzz86MXqW9bWMaZBcYn2xCOPIzZr92haQkbTp
	5RKUEVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIrq-00000002UBp-0zzY;
	Tue, 04 Aug 2026 17:23:54 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIrm-00000002UAH-2Poh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:23:52 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785864223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M5UXze5ARMASnHW0DMs+U94NSouTokoB+K8E72tD5u8=;
	b=Q+AgpakCP/bdeBvONoVu3oyREQlYxGbbzUDk+8E+iqqDOABmC/+O0b2nz0m0VyKwqBb5WY
	sT3gZDCPB6jMLNOrJauwTdD52BGoyE2J2+qJDTLm8NT91J3DteptZlPXjMYuWawrRFGf3W
	EQNlCUG1UsdDvVS1omoKjWhXISNo6ZE=
Date: Tue, 04 Aug 2026 19:23:15 +0200
Subject: [PATCH v3] arch: arm64: add early_param idle=<wfi|yield|nop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTQ7CIBAF4Ks0rMUA5Se68h7GBaWDxdjSQCU2T
 e8u1I2JxuWbvPlmFhQhOIjoWC0oQHLR+SGHelch0+nhCti1OSNGmCSKCKxDL3ke3gGPOugeG6a
 sIaBAE4Hy2hjAuudGni/vHB/NDcxUnNLoXJx8mLebiZbeHz5RTLHigjN+sFzV9mTmBkJ+zsd9C
 wmVG4l9KJT+UFhWiG6kkoJpXosvZV3XFxDJLlgNAQAA
X-Change-ID: 20260705-arm64-idle-param-c27fc0e7ea05
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_102350_865243_0147CCE1 
X-CRM114-Status: GOOD (  20.20  )
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

Overriding the idle mechanism might be useful for debugging and performance
testing. Add a cmdline parameter for it, similar to the existing idle=
parameter already present for the x86 and ppc architectures.

It is also useful on platforms where the WFI instruction misbehaves,
such as Apple Silicon SoCs. Generally, a misbehaving instruction should
be treated as an erratum and patched using the alternatives framework.
However, in the Apple Silicon case we need more flexibility because it is
difficult to detect whether the erratum applies. For example, Linux VMs
inside macOS have the same MIDR and may even seem like they're running
in EL2 in the case of NV, but should continue using WFI (it's trapped and
handled correctly by the hypervisor there). Thus, we prefer to
let the m1n1 bootloader add the idle=nop parameter[1].

Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v3:
- Make the param only affect the default idle loop.
  The changes to the delay function have been removed, and the idle.h header is no longer needed.
- Link to v2: https://patch.msgid.link/20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev

Changes in v2:
- Applied suggestions by Anshuman Khandual (Thanks!)
- Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
---
 Documentation/admin-guide/kernel-parameters.txt | 23 ++++++++++++++++++
 arch/arm64/kernel/idle.c                        | 32 +++++++++++++++++++++++--
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b2d7d3540ded..d7f5471edf8f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2239,6 +2239,29 @@ Kernel parameters
 
 			idle=nomwait: Disable mwait for CPU C-states
 
+			[ARM64,EARLY]
+			Format: idle=wfi, idle=yield, idle=nop
+
+			idle=wfi: Use the WFI (Wait For Interrupt) hint
+			instruction in the idle loop. This is the default and
+			allows the CPU to enter a low-power state until an
+			interrupt arrives.
+
+			idle=yield: Use the YIELD hint instruction instead of
+			WFI. CPUs supporting simultaneous multi-threading (SMT),
+			can continue executing another thread when the current
+			thread reaches the idle loop. This will make the CPUs
+			eat more power, but may be useful to get slightly better
+			performance in some applications, since the CPUs will
+			not enter a low-power state.
+
+			idle=nop: Do not execute any idle instruction in the
+			idle loop. This is useful on platforms where WFI
+			misbehaves, leading to system instability or loss of CPU
+			state. This will make the CPUs eat more power, but may
+			give slightly better performance in some applications,
+			since the CPUs will not enter a low-power state.
+
 	idxd.sva=	[HW]
 			Format: <bool>
 			Allow force disabling of Shared Virtual Memory (SVA)
diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
index 05cfb347ec26..42c5543f9589 100644
--- a/arch/arm64/kernel/idle.c
+++ b/arch/arm64/kernel/idle.c
@@ -11,6 +11,29 @@
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
+enum {
+    ARM64_IDLE_WFI,
+    ARM64_IDLE_YIELD,
+    ARM64_IDLE_NOP,
+} idle = ARM64_IDLE_WFI;
+
+static int __init setup_idle(char *arg)
+{
+	if (!arg)
+		return -1;
+	else if (!strcmp(arg, "wfi"))
+		idle = ARM64_IDLE_WFI;
+	else if (!strcmp(arg, "yield"))
+		idle = ARM64_IDLE_YIELD;
+	else if (!strcmp(arg, "nop"))
+		idle = ARM64_IDLE_NOP;
+	else
+		return -1;
+
+	return 0;
+}
+early_param("idle", setup_idle);
+
 /*
  *	cpu_do_idle()
  *
@@ -26,8 +49,13 @@ void __cpuidle cpu_do_idle(void)
 
 	arm_cpuidle_save_irq_context(&context);
 
-	dsb(sy);
-	wfi();
+	if (likely(idle == ARM64_IDLE_WFI)) {
+		dsb(sy);
+		wfi();
+	} else if (idle == ARM64_IDLE_YIELD) {
+		dsb(sy);
+		asm volatile("yield" ::: "memory");
+	}
 
 	arm_cpuidle_restore_irq_context(&context);
 }

---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260705-arm64-idle-param-c27fc0e7ea05

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


