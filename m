Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 23:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaXnETxdWqbmIbvIT6H5WRFYzJ05uVw7n70J2uUzaFQ=; b=waOp3m4biPYUJPUbk8l9KwEwD8
	QlBTHsADv3SuGMs4jvkL7t+CtmFhlb/LwF/+Y4JQzwCmeIwdK+uyLB846EbV7ZdLKaSg/1XnaDck+
	q+Fy/iN9o1oFca51pMMxqFb77a6L6rwtowv7PEWfpsk/Yn6m06yXVmBbmXzT7eaQEM6x/E2jkSO2c
	6DT8xOjdBEq4Hw18rUr/VeOkbVCJT+TUp6zfO0HfR6M2BTYpSjT/TIMVrvCTEU9hlaegjlc9zb/T5
	Jeif/Z6iVKHmpjpDKN1wkosAex8zooaDQOK7gCD9aVpOu5LJIcorb/TQX6NN5A9X2K3lNtrsJ8+/P
	ct3poEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYPO-0000000BNAn-2g06;
	Thu, 17 Jul 2025 23:53:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXyd-0000000BGtp-0Eig;
	Thu, 17 Jul 2025 23:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AD8D45D82;
	Thu, 17 Jul 2025 23:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75F1C2BCC6;
	Thu, 17 Jul 2025 23:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752794720;
	bh=qfrc6vYarbMRQKv1a7xZvSfoxfkNIKlLJL8wJGuWS5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TDQPJoue8FZRuS/LJrGq2GchrAASLibnSmGeRRoSUGpvH3awBC+7kUb1yyaVYH89y
	 ULfO45CeKqJRVGvpXRA0BcyHOvq/18F0odTwMODSsaKPhyZ6a5RObjGBHyzV8F/o67
	 bRdab3eThDwtbXMkLCf7OvDiOrTOIwe/+HGDzhnD0XxLPtqyR6jgFUfqETsGM1mdv+
	 bnFaNOMq8O4teU/HwNwUrtNBKmLU5MLmrmRF+Dfv34p8l9jQ3mz2PYnKIToPImVNxa
	 KM1ucd9mD0unIDTP+r5FbWZidX3EtXT5OQTFbfBDNgNkXEVraPMIWLffBOUAzwljDl
	 L3ZGqkwchCdPg==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
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
Subject: [PATCH v3 13/13] configs/hardening: Enable CONFIG_INIT_ON_FREE_DEFAULT_ON
Date: Thu, 17 Jul 2025 16:25:18 -0700
Message-Id: <20250717232519.2984886-13-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717231756.make.423-kees@kernel.org>
References: <20250717231756.make.423-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=kees@kernel.org; h=from:subject; bh=qfrc6vYarbMRQKv1a7xZvSfoxfkNIKlLJL8wJGuWS5I=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmVbbGrLRYky9XJyFyITXiqam157PKKj7mdDyYc/Xw7s uRv7WSGjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIkc62Vk+Hwt/L3Rbm1tn84l unrT0jgulm5lD+LgcnL+WfbLeJOREcN/7/17erb+Zmw+2dikfKTxS9XuurzmRR6/80+FfF6/xlG FFQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_162523_139146_3C90368D 
X-CRM114-Status: UNSURE (   8.10  )
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
index d24c2772d04d..64caaf997fc0 100644
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


