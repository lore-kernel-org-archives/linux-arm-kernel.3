Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FE4C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql766kWCyJrEzgimYF7/K/mUeDpunCOGDp3konzUix0=; b=CJRpr122Du1LFGBgkgOPptyymc
	jmodfVeh6VRp9fB6lZkK7sRtJd3pPwrl4FwbRPi4KDy9iAtRLizGsrfxDH/fF7Ffd8IumNVTi+BZa
	IJ8PrhOUR1h6q+Ijy9CocgHo97ZY97pX1PzNhTLE0KpXmeJtw/Jw0bMN64MUS3qqEH6/08LxQvVIg
	BneBAI1qYljbaHKKgAlFtxm6+fBW3d65MJNNCbL8ytvGUpxNLP4+ePMhG4Y5kMi5wsycjMKEk3yii
	UQW/CY/K5ouRVeVV3ZjSZ6wKVlQ1TZodgzPYOL5A7MVMQvqbLo4hcLwr8dzpt6NGBXqd6AXWM/UkD
	lliSk8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJa-00000009mXS-3ve4;
	Sat, 08 Aug 2026 23:18:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJP-00000009mJS-46ob
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DEF360204;
	Sat,  8 Aug 2026 23:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963551F00A3E;
	Sat,  8 Aug 2026 23:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231123;
	bh=Ql766kWCyJrEzgimYF7/K/mUeDpunCOGDp3konzUix0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nq0mckAaodCqRAuEffJncChyCgw5SLKZuxiUI0nb/3BSzXXGa+y3QwmlW01DKue/A
	 BYBIxXoOfEOLAUGXpcf4t+0QnH8AnWaPZZA1uXU4G3vCVOlUUZC+W8ztZk8BpX7ogb
	 goMer3X7ppHfRcfEAeYmtU6FlzxNF9X55qfBAccXfQp24KcqOm5zLQYKzsa4axEL4b
	 6m6rGk/w3sTZAWYSQAMcj5zJQHQ2dUcfKPpOvmalU8sGiLDu6xSdorXFbFxua1SOGq
	 kI2cr1CjlR1c+VcrgtB4NUAsyzn8CGdLvU/uB3ZeXlsZU/4H+GF5BMFqn40dshD+p+
	 RqnuAUAN/RmiQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 22/22] klp-build: Add arm64 syscall patching macro
Date: Sat,  8 Aug 2026 16:17:26 -0700
Message-ID: <56e974b384ffbb3f8b424e7c69da3f702f87f2f8.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add arm64 support for KLP_SYSCALL_DEFINEx(), mirroring the arm64
__SYSCALL_DEFINEx() pattern from arch/arm64/include/asm/syscall_wrapper.h.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/livepatch_helpers.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/livepatch_helpers.h b/include/linux/livepatch_helpers.h
index 99d68d0773fa8..fe02c7b2f769e 100644
--- a/include/linux/livepatch_helpers.h
+++ b/include/linux/livepatch_helpers.h
@@ -72,6 +72,26 @@
 	}								\
 	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
+#elif defined(CONFIG_ARM64)
+
+#define __KLP_SYSCALL_DEFINEx(x, name, ...)				\
+	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
+	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
+	asmlinkage long __arm64_sys##name(const struct pt_regs *regs);	\
+	ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);		\
+	asmlinkage long __arm64_sys##name(const struct pt_regs *regs)	\
+	{								\
+		return __se_sys##name(SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));\
+	}								\
+	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
+	{								\
+		long ret = __klp_do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
+		__MAP(x,__SC_TEST,__VA_ARGS__);				\
+		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
+		return ret;						\
+	}								\
+	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
+
 #endif
 
 #endif /* _LINUX_LIVEPATCH_HELPERS_H */
-- 
2.54.0


