Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01978C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdQRW/qsOjsl74n1Uu9KiA8MuCaSk++sPpMp+B+N+ZQ=; b=YLXI5zo0+aIyVA1e+SMM3DpNZT
	6fXrE0/1BYGEQLakjKC9o0zo+LC6+Bifyb0DRbctxtu5DkFUyfEwQQRNyHbD2SYnkjwcwLVlEpPcZ
	W6BmRloJ1Ta6kzUFw6s1GWH7gNJOH5JyVgdPpzHkijFvKV5n6mI7mycqhbNba3ppw7NO6aPmHrjun
	GVye+EMcS7P7JrEdxxFN7tfWj0VAVS1R1gcJ/F8dyg+d5sh0Kf/nAZpnrkn/3OLkdDTYlY2ioFmB0
	9Hp0lHUWZW9A7ByZuWpZItZ9T7wcfU8eesSYDVxYdcmlLotjPFtXUbILpl7rA5dKhB/OX2jA0GoNU
	64qPwL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yEo-000000057ul-3xJx;
	Tue, 22 Sep 2026 11:00:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yEm-000000057ti-1Cig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:00:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057741595;
	Tue, 22 Sep 2026 04:00:32 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64E783F9A2;
	Tue, 22 Sep 2026 04:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790074835; bh=9hciyAhz0WwacDALWLd9IzVjEpylwiiwTbJGqlvKAJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=isDDhEt86/4Wh22uhoiYOkOOk+3ucMs/WNXUuu8qcfBv8JTKCxHYxkgTjxS6+Yhxe
	 HhJJl6okrRtmRR9mbGhqH4fzmKyl7u/WYinPs8fj4BIBTV9yYfW6GsArI3w/eMBzqI
	 YJv1JxNJ1JSzBAPulVSodZQUQePdIUS/Q4Fd5J3Y=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-kselftest@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	broonie@kernel.org,
	usama.anjum@arm.com,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [PATCH 1/2] kselftest/arm64/mte: Introduce MTE safe memory accessors
Date: Tue, 22 Sep 2026 11:59:58 +0100
Message-Id: <20260922105959.129380-2-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260922105959.129380-1-vladimir.murzin@arm.com>
References: <20260922105959.129380-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_040036_403049_C069B8CF 
X-CRM114-Status: GOOD (  10.23  )
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

The MTE selftests assume that they can skip (expected) MTE faults by
advancing the PC by 4 in mte_default_handler(), but this is not
generally safe, as the faults are triggered from arbitrary library
functions (e.g. memset() and memcpy()). For instance, memset() could
be implemented as simple as:

  mov	x3, x0       // copy pointer
  add	x4, x0, x2   // calculate end
loop:
  strb	w1, [x3], #1 // faulting access
  cmp	x3, x4
  b.ne	loop
  ret

which leads to an infinite loop since X3 could not be updated.

Or, it could be having advanced implementation (FEAT_MOPS):

  mov	x3, x0         // copy pointer
  setp	[x3]!, x2!, x1 // prologue
  setm	[x3]!, x2!, x1 // main
  sete	[x3]!, x2!, x1 // epilogue
  ret

with faulting access at prologue advancing PC to main could lead to
infinite loop due to main could be triggering unaligned access fault
which kernel fixing up by advancing PC back to prologue.

Instead of relying on arbitrary implementations of library functions
introduce helpers to perform the faulting accesses, where those faults
can safely be handled.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 .../selftests/arm64/mte/mte_common_util.h     |  4 ++
 .../testing/selftests/arm64/mte/mte_helper.S  | 44 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index 250d671329a5..547ec5659f78 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -64,6 +64,10 @@ void mte_restore_setup(void);
 int mte_switch_mode(int mte_option, unsigned long incl_mask, bool stonly);
 void mte_initialize_current_context(int mode, uintptr_t ptr, ssize_t range);
 
+/* Safe memory access functions */
+void *memset_safe(void *s, int c, size_t n);
+void *memcpy_safe(void *dest, const void *src, size_t n);
+
 /* Common utility functions */
 int create_temp_file(void);
 
diff --git a/tools/testing/selftests/arm64/mte/mte_helper.S b/tools/testing/selftests/arm64/mte/mte_helper.S
index a55dbbc56ed1..eb62abfa1eb4 100644
--- a/tools/testing/selftests/arm64/mte/mte_helper.S
+++ b/tools/testing/selftests/arm64/mte/mte_helper.S
@@ -128,3 +128,47 @@ ENTRY(mte_get_pstate_tco)
 	ubfx	x0, x0, #MT_PSTATE_TCO_SHIFT, #1
 	ret
 ENDPROC(mte_get_pstate_tco)
+
+/*
+ * memset_safe: Fill memory with a constant byte
+ * Input:
+ *		x0 - destination pointer
+ *		x1 - constant byte
+ *		x2 - number of bytes to fill
+ * Return:
+ *		x0 - original destination pointer
+ */
+ENTRY(memset_safe)
+	cbz	x2, 2f
+	add	x4, x2, x0
+	mov	x3, x0
+1:
+	strb	w1, [x3]
+	add	x3, x3, #0x1
+	cmp	x3, x4
+	b.ne	1b
+2:
+	ret
+ENDPROC(memset_safe)
+
+/*
+ * memcpy_safe: Copy memory area
+ * Input:
+ *		x0 - destination pointer
+ *		x1 - source pointer
+ *		x2 - number of bytes to copy
+ * Return:
+ *		x0 - destination pointer
+ */
+ENTRY(memcpy_safe)
+	cbz	x2, 2f
+	mov	x3, #0x0
+1:
+	ldrb	w4, [x1, x3]
+	strb	w4, [x0, x3]
+	add	x3, x3, #0x1
+	cmp	x3, x2
+	b.ne	1b
+2:
+	ret
+ENDPROC(memcpy_safe)
-- 
2.34.1


