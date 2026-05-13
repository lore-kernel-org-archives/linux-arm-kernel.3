Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0500ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6XuGQXKuiUD+U0xIxQ1k+D7Wg0u6Dei0thWKgZYwRg=; b=FsKLnssfcknkPCv+FfeAKamH6f
	Fvphy3B9MdqN44cQ+Xe/YJN2lsvJ5yz7ZsFyueZAcWhVlBNru8KkUEbdoxAfRD7vUjc3DDFKwFwei
	a+YM0kkSSW74hgOnt2HfP7V1pWdpzHmiv3ru5y1R5pwfuK9YPHmVvvaqnxkjIb7tI3RRXhm5AcZJf
	7XPT7GN7g/IJ3b4qq6SkTnFiDL5Ref6p80kzC1NL+YXF/JTy0M8QkRr09h/jZbuZXtB87GhlqzgUM
	wB6ePFVVvQkvrDTXV84Ylkucq7cys/JLyMdSmxSG9o3Kho8u3i4Zd1PA5Leg9HvjvX0U/7Kgoift7
	tTbJF5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Nw-000000015Tx-0y0x;
	Wed, 13 May 2026 03:35:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N8-000000014E6-36LG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0B084452D;
	Wed, 13 May 2026 03:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E43C2BCC9;
	Wed, 13 May 2026 03:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643298;
	bh=YLQATZuaSnhkkzf9eNAaMViHdYeqnWtOoiB9QIjH1E8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=srR52N72ajUS/qt0gfNhYQ2ypWHNM39KZV/y9QyU/Tbh9AewWSuInrKg1fY0AqSkq
	 bGFDCFvmtRYPpmTGDhZ79tmiUbXa1gAPhewu7765XOpGqRWIGtpUnz+AZZTeZxkQ//
	 aKVf1U6Iq02t1j3k4JpsHZvx0MZ+OAa6pnWil+kljhiX7RrhVJkT1DTAhaGzXhtngs
	 RhRvPcmm48852UA7rhOaOqZec1cX10IReoOqfMrliWxX0Jyzj1yqFPqqv62qxyToTB
	 DZH5OeCYUqYw79i2SpwLkdrqf/tZRN7aQEEmQpwdmkmTpyE4sKR3OHymVHXVoFvC2i
	 xYgYZw1nGVRtQ==
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
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 21/21] klp-build: Add arm64 syscall patching macro
Date: Tue, 12 May 2026 20:34:17 -0700
Message-ID: <3bf3cee43039fc4da84e83d0891a92e25f40f00f.1778642121.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203458_799243_D9EC6385 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20260513033417.IxkYK2RnAFRcGLwF3WQr5BbYi187ceo6CuzsFzcyjWI@z>

Add arm64 support for KLP_SYSCALL_DEFINEx(), mirroring the arm64
__SYSCALL_DEFINEx() pattern from arch/arm64/include/asm/syscall_wrapper.h.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/livepatch_helpers.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/livepatch_helpers.h b/include/linux/livepatch_helpers.h
index 99d68d0773fa8..4b647b83865f9 100644
--- a/include/linux/livepatch_helpers.h
+++ b/include/linux/livepatch_helpers.h
@@ -72,6 +72,25 @@
 	}								\
 	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
+#elif defined(CONFIG_ARM64)
+
+#define __KLP_SYSCALL_DEFINEx(x, name, ...)				\
+	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
+	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
+	asmlinkage long __arm64_sys##name(const struct pt_regs *regs);	\
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
2.53.0


