Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6E1C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 21:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8kjW1mgVYNAmXTDHsHgs1H1Tp7aKYu9ZJKgbwnVZzM=; b=rHCOhUPRgbLb69fhe/T0+VnOJ6
	wIjS91VfysIFxBT5dcrNWacVCE5cjh/T939epv47Fnr/PVHDji3nWjMv7BFvCubpaJRofTJ/Uu3RT
	6pR2gjceKAESJrh5LdG3sOEKdpjOF+ou8TJBG7J1lPWqcdw6PSOXpSdmULyFpR8fld/fDpZF7gwSM
	N++LjR9B5bd9BChoIdUAKK3t2z7OjAWFJzvX3RuADZ/Xv9Gmf7ITieH3D2J3uEfA4kBHZw9Wbxgzm
	73n+o/P2JQEpV18jfQ6YdIFMe9dw2qSqjXLigzI/xyAysFBm1TzzkXDRAx/IctJoRAlKYkpsT3w1p
	plbkOKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxX9O-0000000E51b-33mo;
	Fri, 21 Aug 2026 21:51:46 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxX9B-0000000E4us-49Ta
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 21:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=K8kjW1mgVYNAmXTDHsHgs1H1Tp7aKYu9ZJKgbwnVZzM=; b=TKnRsP7X7H3y02V8UmAz/WwPpX
	17JcJivtbx3NC0va4VyxWitpgKW+kMDqCzPtRPqFYWvYeie9iGjDZlcpGvnc9zqViX1oJGBwigeHs
	jd4L9fl6LfFgCsrDRat6oMjVtoSEbkn8Nq2cQsfX6YVHj7nKkDOfJvrmams4QxJTcpiGKEBkjkzXI
	kfZRWdWIr526DFvhIc59RkmYQS99MmY3ur5po5gty6L2EOHv/DHK96ExuDseYJHjw9ZVDmVwO8lV5
	5sQA8o8xorERN+kLqu621OLVlHzpUx5JFzLU966W6LnwX3FnPCF3fPBIz3otBVnMjRs86MqV744r0
	m7Zh95eQ==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wxX8j-007ErF-G8; Fri, 21 Aug 2026 23:51:05 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 21 Aug 2026 18:50:44 -0300
Subject: [PATCH v8 3/4] arm64: vdso32: Bring vdso32-offsets.h back
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-tonyk-robust_arm-v8-3-077707b6f1c7@igalia.com>
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
In-Reply-To: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
 Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_145134_347318_E26B8CDA 
X-CRM114-Status: GOOD (  10.54  )
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

Commit c7767f5c43df ("arm64: vdso32: Remove unused vdso32-offsets.h")
removed vdso32-offsets.h because it was empty and therefore useless.

With the introduction of __vdso_futex_robust_try_unlock(), there is the
need to expose offsets again.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/arm64/Makefile               | 2 +-
 arch/arm64/include/asm/vdso.h     | 3 +++
 arch/arm64/kernel/vdso32/Makefile | 8 ++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..265716644193 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -211,7 +211,7 @@ vdso_prepare: prepare0
 	include/generated/vdso-offsets.h arch/arm64/kernel/vdso/vdso.so
 ifdef CONFIG_COMPAT_VDSO
 	$(Q)$(MAKE) $(build)=arch/arm64/kernel/vdso32 \
-	arch/arm64/kernel/vdso32/vdso.so
+	include/generated/vdso32-offsets.h arch/arm64/kernel/vdso32/vdso.so
 endif
 endif
 
diff --git a/arch/arm64/include/asm/vdso.h b/arch/arm64/include/asm/vdso.h
index 232b46969088..43a214b93524 100644
--- a/arch/arm64/include/asm/vdso.h
+++ b/arch/arm64/include/asm/vdso.h
@@ -10,6 +10,9 @@
 #ifndef __ASSEMBLER__
 
 #include <generated/vdso-offsets.h>
+#ifdef CONFIG_COMPAT_VDSO
+#include <generated/vdso32-offsets.h>
+#endif
 
 #define VDSO_SYMBOL(base, name)						   \
 ({									   \
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index bea3675fa668..4bd60f059f4a 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -135,6 +135,14 @@ $(c-obj-vdso-gettimeofday): %.o: %.c FORCE
 $(asm-obj-vdso): %.o: %.S FORCE
 	$(call if_changed_dep,vdsoas)
 
+# Generate VDSO offsets using helper script
+gen-vdsosym := $(src)/../vdso/gen_vdso_offsets.sh
+quiet_cmd_vdsosym = VDSOSYM $@
+      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
+
+include/generated/vdso32-offsets.h: $(obj)/vdso32.so.dbg FORCE
+	$(call if_changed,vdsosym)
+
 # Actual build commands
 quiet_cmd_vdsold_and_vdso_check = LD32    $@
       cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check)

-- 
2.55.0


