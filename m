Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D922C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqICM7uyVMGkK7SLU64r2+T/eRW2AwS+gh4wbVwSSF0=; b=qLiZf4nK151KpHCmSLh1+maI3J
	Ttyad6XbLSjYtT7pRhf/SQqw3oILmuP1ney2K6zYtU830UJiwdiT4WF2G8zDcpcROtkcks6AhiYrV
	WyJJCa2pVRNsFos14Gm3unS66+PJWvxk8JMzpx/FvJuwA6GxWYD1mWgzQqzytxyeNYweIDn9u1uO6
	HrlMTyPAi39XqUc9ixHbSJ33Fy5rHtd1SBj8tcpjldCxFjbH7rXhneQ3xaTTkE07B9sPvGFqvrPs5
	A1+oLqimIs7WFn1CTgoGhkeHraAiJILsMDklbI1Uf/wITHg5xfd1+r31Sf1r6oRI1clzYQ3Y5SeIl
	xV2ygvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mgw-0000000A4st-2TdC;
	Tue, 29 Apr 2025 15:16:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kVM-00000009hQ4-2OHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:56:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqICM7uyVMGkK7SLU64r2+T/eRW2AwS+gh4wbVwSSF0=;
	b=wvbJc/ArYz1G3ydNa8bWB5oxdrBWIlXYZSgO5X9Ef/NZ/950vJu5OrkYd/A/NNcEzE20S9
	xnRyfqMC6SP75SeayKrFJGFzrpBqJUd4fM6zsL0sx0ahPVVz5BiqK3jb2MEWMvKTgN27au
	qMXB3ezK1iYtPMy86rAfi7D+4rZJfVzLizWvo6Td3F926mGM08G9MeObGhQZqwit9poywc
	zva3wxdcQIpxMLDa7VymSbfgKkcO9+xRi2Zh0T8xqDt2pcLygWAV177uJZOrsR5d+lNaVr
	AIcmNla/V7Cs+TTs4Uh4BGtaElBi+e4nJv2U/3pibo8bTdVTYHs0cN3cRI38xQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqICM7uyVMGkK7SLU64r2+T/eRW2AwS+gh4wbVwSSF0=;
	b=f+nwILJsoAH1P+BArqTVCbZ0crHGk6dErfsx4KHdfW7CTMl/agpQXI0EkV9JZLWJGvVvSV
	ea2j/wKDDehz+pBw==
Date: Tue, 29 Apr 2025 14:55:36 +0200
Subject: [PATCH 1/2] arm64: vdso: Work around invalid absolute relocations
 from GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-vdso-absolute-reloc-v1-1-987a0afd10b5@linutronix.de>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
In-Reply-To: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931364; l=1838;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=INK9Od3tUzX/v4E46BjhJMmtIlN+Zo0XqWPW2JYr1OI=;
 b=5ulHzGKF8eFCCLAu6Yp7Cqqk1q0uP93WsZLqtT+NWoE32DIh15DiO4tlLvTLbzAIl1hroMJFj
 yiovnOdkrEtDrIZnMX0N/vkD6WmdCNt1E1kYrlSvz+ove/PIVfAnVfb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_055608_757776_3636072A 
X-CRM114-Status: GOOD (  11.06  )
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
Symbol references are marked as hidden so the compiler is forced to emit
PC-relative relocations.
However GCC emits absolute relocations for symbol-relative references with
an offset >= 64KiB. This is the case in __arch_get_vdso_u_timens_data()
with a page size of 64KiB.

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


