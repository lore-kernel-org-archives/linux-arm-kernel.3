Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C13CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6XuGQXKuiUD+U0xIxQ1k+D7Wg0u6Dei0thWKgZYwRg=; b=Cb6OlEjbr1JuMS29lxKdTDbM5K
	yn6lIJ5zSHDF5dHU9ewlCM+NnWbTsg/ZVXbHxevFjm/f7W8kBp14JMl1ZhGwgspbdcvSmRcQdww7/
	J9619AXDrdP5kqyIXfv3rx1HmckHQ6FUeaQvGqInnBIwVJRvScb1JJvacv1jCFAwdqMvq63GH5sQS
	0oWM+vGhII7LbpehtMQu99+ZCi5V0UiYOLoL+5zGY14cBoels1dJWMuY07J7F7Kw1jTXGk0oJQBcj
	VgZhixDTMhDZKSYr6r1Bt0p2PicF6SuXxD9hKAzUVmEIEc1Sw6kQ8UpB8e5uuJeFYQnc5iuqkBBkj
	TSspJNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0NZ-000000014m6-3scb;
	Wed, 13 May 2026 03:35:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mt-000000013rb-4Bev
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A87AF444AD;
	Wed, 13 May 2026 03:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02842C2BCFC;
	Wed, 13 May 2026 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643283;
	bh=YLQATZuaSnhkkzf9eNAaMViHdYeqnWtOoiB9QIjH1E8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CTWc4f4xlExzoEq65yIQKtV+ICaRbk2wTx/GfaqnnWlOQayhR49FihvTkMA/gPDLW
	 8S55+o1kmVbXMVuV7/JtZ4i2DnXpnEBHAuP9NAbqX7kI4ankoTrgmxwjlnlzYWbO5T
	 CTmG0fp4oml6/1T+KNbmNWrIu/UQWciXeyO39X3oEDZ54dk5GhhB3AEEM+ZQoG2yqa
	 4LJWPwvACu78sd3oCUH2Ogat4xozo9Jlci41wUZuZM+2wbYuy5yI8dCglfbOFRXzKo
	 Lh4yCeT5V4Cv+OOwGRxhSau6XQgU95Qii7FufQfJ/TbIHoump0sIfJ9vcgNP5Imqdb
	 WviVX4N9n+cbA==
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
Date: Tue, 12 May 2026 20:33:55 -0700
Message-ID: <3bf3cee43039fc4da84e83d0891a92e25f40f00f.1778642121.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203444_071665_1E6514DD 
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


