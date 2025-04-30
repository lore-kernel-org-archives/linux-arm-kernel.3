Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374BEC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tdw8tH4FhSz345Xupp3UnovvlZsLVACqjoY1xoiC/XI=; b=1IQCvmp6H9V9BlxCnOvuR9A5lA
	skRbyA+zOmCTeAnudJ8ujmWKncgJY2CM1iGYEgyxYT71IfdLpH4kCbgxYPSmFQAC7/S3bOdIAPLx+
	CZ5ILJLiXVPcio2lj/EsnnTJ9ZeBh79uHYptxk++xo9X3XHIRD0rlN9BiUvXQK23l2N3m4Wgn7y6e
	7wYqaAGWPl6HximkFpaqC33E3tISbqV1DfP8/M2XXlkrTCb2RwPg5l5kk9vVQntVq9aqE/Sw/xNWB
	KiWfgftYxlPWn56scc3NXbSs22iyetxVde54cuRjpZU98MFEGZ+yhkrMeSVdAcdCzXgw+8g/bPSFX
	/ZYq1Faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3fs-0000000CLk6-2oE8;
	Wed, 30 Apr 2025 09:24:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3c1-0000000CL1K-467A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:20:19 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746004815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tdw8tH4FhSz345Xupp3UnovvlZsLVACqjoY1xoiC/XI=;
	b=TlV2k7HjEyUtI111dsE8HdMprDL8k8ChNFqGvZZgGQg5RSs1dNwn7D4/yRXcTOMXqFWVjF
	gXX4LZhlK6lfTIwtqQzamEYSHqrpaVHq+4I6YdtXGUsJ2OH4+H/95dnj2v934vCKX05Ysr
	X1NziDjXAgXJ8NJ4dtRiBiQU5nKZrptXTxeP7oJyQX+81UArqmE1KwIcM6OARtKfCwbvWi
	vBCQVB56SyH7vz9DJ7ldbVmhpe6HJikB5gdRK7aiYgDwdJXHB25aQTkjACsDRcjZaW659p
	VEGypwiZ1x1CTyb5kvWdlDustiZnSZe6jxDQZVoNQOxJzp1RUr91g+bj+A/tNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746004815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tdw8tH4FhSz345Xupp3UnovvlZsLVACqjoY1xoiC/XI=;
	b=6o6yeKl2GNoHSR63/A4JZRNlkRy1NlvQuK+afR0NPgbHOONIBm3YfS26FUtfSM91EYAB1L
	7KYJ8WToW5yI3sBg==
Date: Wed, 30 Apr 2025 11:20:13 +0200
Subject: [PATCH v2 1/2] arm64: vdso: Work around invalid absolute
 relocations from GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-vdso-absolute-reloc-v2-1-5efcc3bc4b26@linutronix.de>
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
In-Reply-To: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004814; l=1869;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wPiVAyb4i0INmlrU5d1yJoYnmvXNkJvqm5DWeZRgR8w=;
 b=OjSnD9IkRXm7nMcxWypWAcqqSkKe9ShzBQuKcW5bcMFfpvC3AHuQDqr8Masw4P8vEGYwKl1sd
 t1dW5bq6bkUCHEYe4JaHZmqp51QRvnIBf/DI/VUZn6OGmSayc6j8mUj
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_022018_153711_2E5F4493 
X-CRM114-Status: GOOD (  10.91  )
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

All vDSO code needs to be completely position independent.
Symbol references are marked as hidden so the compiler emits
PC-relative relocations.
However GCC emits absolute relocations for symbol-relative references with
an offset >= 64KiB. After recent refactorings in the vDSO code this is the
case in __arch_get_vdso_u_timens_data() with a page size of 64KiB.

Work around the issue by preventing the optimizer from seeing the offsets.

Reported-by: Jan Stancek <jstancek@redhat.com>
Closes: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
Fixes: 83a2a6b8cfc5 ("vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 92a2b59a9f3df4d20feb483e6d8ebd1d813b7932..3322c7047d84fecae316a2904f1adec0cb458f6f 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -99,6 +99,19 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return res;
 }
 
+#if IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB)
+static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
+{
+	const struct vdso_time_data *ret = &vdso_u_time_data;
+
+	/* Work around invalid absolute relocations */
+	OPTIMIZER_HIDE_VAR(ret);
+
+	return ret;
+}
+#define __arch_get_vdso_u_time_data __arch_get_vdso_u_time_data
+#endif /* IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB) */
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */

-- 
2.49.0


