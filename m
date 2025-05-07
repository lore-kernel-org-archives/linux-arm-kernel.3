Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC9EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5nQ6TR6aiKBeffDEy4PqW+LaWc3J9ohAONyKi28DJc=; b=jZrmHTmjrbAzSd62g7V2kihFzp
	8WCjQvwN0MrsudLwjZgY7x/hoa0nIYbX/14sSQpIWYqWFxswnM2hN1+H0zrn5jz5ePBMuGQ1lYYY8
	22/EY9ukgs989J6FQGMCPFzwnqXi37p1eRGENxeE7Jbg9jc7lF+XWwLLEEdxi57gheEtEbmckCkt2
	uysFarqykxAXkYhULCw/Wd+QgugeAsX6e094gyQpdZEdeY6YQP0+WeLdlShpY6Z7hze+evAUfZR4T
	ztjyhUCSdp+UTr2w0ugDXMQ7ZrbseAF6Jb8tbA5jZWIui79/8p9QLhMHY1/kZGNkPgzFGKisvqorN
	JEXu7hsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjVC-0000000GU5q-1OUt;
	Wed, 07 May 2025 18:28:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjJd-0000000GRsK-3sdo;
	Wed, 07 May 2025 18:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 359C15C5F3F;
	Wed,  7 May 2025 18:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB66C4CEE2;
	Wed,  7 May 2025 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746641781;
	bh=JBC57/AJ4s9wnqVrwmV7BOpA+2zHUnfcHWTkMgWl8NU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7UcDZXdXjx3KZ0l3mLTB+csre7VN6l1usVAnFYpDApDPAm06prvBdEhlADnkW6qA
	 6Ct662+QPW0P+8F0Oa58tF6i9aT/9MCvBj/FBr6/uU/vhZiR6R4zBCfysEenLCqUrE
	 6tHqabUzR/N/LG6jfquCv4eWd3RJ/h4rXkS1TFORy7r97wCz0ABguF/eGnXxW8zxIz
	 ljfxv6OYRJ3vkc045YYhxP1/yI3w0ca03pTUHUMVgH8UIKM6xE/RhL/CRvTjpi4qn3
	 JyQH3je+lX/JEdGO+Fm75JCf/UdhCxfXNlzSyJ5TaUdz+qFXxrtWxAwoV/tmvZGTYw
	 KMyTgtIMShNuw==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 8/8] configs/hardening: Enable CONFIG_INIT_ON_FREE_DEFAULT_ON
Date: Wed,  7 May 2025 11:16:14 -0700
Message-Id: <20250507181615.1947159-8-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507180852.work.231-kees@kernel.org>
References: <20250507180852.work.231-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=kees@kernel.org; h=from:subject; bh=JBC57/AJ4s9wnqVrwmV7BOpA+2zHUnfcHWTkMgWl8NU=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnSi3OdD7t0n7oULsejGJ/+9MQm/geGMg9cz00Vqajg/ sTnY3e9o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCJToxkZNsxfvyhx39Nzpiyy k1d9mfdaZ2I4d4Fed23ppfk+FmvT+Bn+V65ZP6cwRVHDaFl+g9uJIPvmT50TbXLDqlrmpn0pTfX nBAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_111622_008187_73C751E9 
X-CRM114-Status: UNSURE (   8.51  )
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

To reduce stale data lifetimes, enable CONFIG_INIT_ON_FREE_DEFAULT_ON as
well. This matches the addition of CONFIG_STACKLEAK=y, which is doing
similar for stack memory.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: <linux-hardening@vger.kernel.org>
---
 kernel/configs/hardening.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index 3da00926b4eb..7d92a740e490 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -60,6 +60,9 @@ CONFIG_LIST_HARDENED=y
 # Initialize all heap variables to zero on allocation.
 CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
 
+# Initialize all heap variables to zero on free to reduce stale data lifetime.
+CONFIG_INIT_ON_FREE_DEFAULT_ON=y
+
 # Initialize all stack variables to zero on function entry.
 CONFIG_INIT_STACK_ALL_ZERO=y
 
-- 
2.34.1


