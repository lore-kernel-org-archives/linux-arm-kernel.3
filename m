Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4852F54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WkF+G7ZLDGMYZ75yYOuw4BX1yBIExkP4Fuqn3Z2McIw=; b=ENhYvoqzIdvOT9MuSrQOPEKOPO
	Kwkd5OBv7TjB5CVlIv2HL4cBrR2yv2+R18gTzii9syk7wGqLHsZXalMwxkMydEVgTC3KKr+9EAT0F
	k9RNO195h8BTpYvDlOEIeyHeoT2Y2nS0phmfQ9OI5zXQap6xNjfWOU3d635gFLSepv2f7mxDzs/Nt
	ll2w5wqazN8nr8oMYz5bNB+V3n9oLz3iycBvSKnBTl6R4+VC8Du9U4Pa5MUmtd5TCeoVtV2Xii/ea
	a07F/GLa3yBnjIVyVRwc2Nd1YHfZkEhrsmv0/HVv3cJGZdo8hktg4GfxX0gyTJjooyeBBPgKB4e5T
	Xq5s6BDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54QD-00000001s7z-1Tc8;
	Tue, 24 Mar 2026 16:16:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54QA-00000001s4Z-3QRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:15:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-487035181a7so23176455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368957; x=1774973757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkF+G7ZLDGMYZ75yYOuw4BX1yBIExkP4Fuqn3Z2McIw=;
        b=aStIYDwXuHDCtT3fChAjiofQLJTnDoP4vvaRnfqzuhycIik7ULw9uQ0h6dQGRwAgmf
         y1td+9o/NvHQO9LJeXnnJla21w6GvLbk3BGdFfyjBB0BrNwTBwhOxZ0U5+aRsRO2+2dv
         Q1EkgX0NJrxGSAcGL0jMatxi7S2R8sn0Rb77inAVwsvCBdWHBRpN0eAXi6xvfRHy5GQh
         Jlui9tquqGl7KoKjNd3lPwpj7CEERJvyTBDRVx5dtVNtPHNHEnkpzgxKYnTVbSDl+5m7
         Fozm6NcU73gtK2WxmgUX+45CZeqSHyFCVEooHFc2M6kPiodEP2Zcsb+rxM+fgCumpUTa
         2NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368957; x=1774973757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkF+G7ZLDGMYZ75yYOuw4BX1yBIExkP4Fuqn3Z2McIw=;
        b=gjus8I2NgUE58abaTy19xjiIUkxAKZtQEdEO6EcX1hS+P0xdOaKfdyXHUFMboF2VHd
         +Hz76zFYHYgrscLSzj4uKTvNu89TiiGa5a3QFl8k0saMf4i3GIo9EJ+bRyNl9u1U6pE5
         7OVK4rMzoa1Y4fkYDGC2T09KH9n8Lc4RLa+4hAjYqPAN1l0bWFXKpp1ibr4bV4bxVWGQ
         Yw+80bgdqQPIusw9ApW5VX8AFGuWkmhT7d5NId87Wbr6l4x8w0dKLESMnlx0fzApiApQ
         YyE7CCZX5aKCpUwlNxrNkFwytGbimCZS3w9fzUQWZCVzzC6y2A+VhswvN+NCdqln/caL
         tB6g==
X-Forwarded-Encrypted: i=1; AJvYcCUfnVTQwq7fud/56+7sv1OJo2nhLUM7PwUnO5+jBKTt3lm4eMIjbwMAzeWVud8Tp0OZ8f4+/eaSDc/niQFqkjUm@lists.infradead.org
X-Gm-Message-State: AOJu0YxeJKsnRcej+iqmNDgTdskZ85PN9fokx52jflnMQAWJomIZMiAX
	PY3xF4KWgHwbLH3KyaVaopOsGLmerQL2zoX+zNZzBqBLJNq9QPTIso0J
X-Gm-Gg: ATEYQzzdLxmxV7mDKgtSUvnT2BCXQ5JT8EEc2omJ/4hxwYXTDvj0JJLF/I32pjWhdpQ
	Ye8F7BUdjtygbRcZM1Qm/kYmEG+z7U1/2KJs5xFPwtqpIuJSTz9ZXoGMvO/8RMWjKlRO5WE3z7b
	gSS2Wnv89seE6lFX2JOuzCk6jRoqmUOtsZvqF0FIgnJSgkyEcIg5Q06jadXiV8KquMcaXlKPWcF
	l8S2buXCuCN/tJoHJqIvr1l5Iwu6ZhUVjd4w7KRJPitJzMmKJhUlGdki+fImsxU3rlVsFBVBvHd
	gBqXlhlwhkuAfrBhw0wpgvRrfDcqRLdVrXhvTePTdJWGWQbyRSLwc9q37yVQdehXf6hS7CtxzzG
	28Yyk+42fLYEK9U3E7rvDFRPkz5ie79l3SHsW+T7+WZnsb1kDvyTBni/7LS4Q01XQh0HZIEaMal
	Aver6I69gMR2DRchQfnceVmVv3x2bMp1/Ame/8aq9LOJGx3sYaepJAZbBQ
X-Received: by 2002:a05:600c:4685:b0:485:17a7:ba0d with SMTP id 5b1f17b1804b1-4871606cbcemr5072595e9.32.1774368956585;
        Tue, 24 Mar 2026 09:15:56 -0700 (PDT)
Received: from osama.. ([41.46.242.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f173csm70721775e9.2.2026.03.24.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:15:56 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: panic if IRQ shadow call stack allocation fails
Date: Tue, 24 Mar 2026 17:15:41 +0100
Message-ID: <20260324161545.5441-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_091558_887332_2E4C20D3 
X-CRM114-Status: GOOD (  12.52  )
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

scs_alloc() can return NULL when vmalloc fails. init_irq_scs() previously
stored that NULL in per-cpu irq_shadow_call_stack_ptr, which IRQ entry
would then use under CONFIG_SHADOW_CALL_STACK. Match other SCS setup paths
(e.g. SDEI) by failing explicitly instead of continuing with a NULL
pointer.

Mark init_irq_scs() __init since it is only called from init_IRQ().

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kernel/irq.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 15dedb385b9e..b32ed7ef8e00 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
+#include <linux/kernel.h>
 #include <linux/kprobes.h>
 #include <linux/memory.h>
 #include <linux/scs.h>
@@ -32,23 +33,26 @@ DEFINE_PER_CPU(struct nmi_ctx, nmi_contexts);
 
 DEFINE_PER_CPU(unsigned long *, irq_stack_ptr);
 
-
 DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 DEFINE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 #endif
 
-static void init_irq_scs(void)
+static void __init init_irq_scs(void)
 {
 	int cpu;
+	void *s;
 
 	if (!scs_is_enabled())
 		return;
 
-	for_each_possible_cpu(cpu)
-		per_cpu(irq_shadow_call_stack_ptr, cpu) =
-			scs_alloc(early_cpu_to_node(cpu));
+	for_each_possible_cpu(cpu) {
+		s = scs_alloc(early_cpu_to_node(cpu));
+		if (!s)
+			panic("irq: Failed to allocate shadow call stack\n");
+		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
+	}
 }
 
 static void __init init_irq_stacks(void)
-- 
2.43.0


