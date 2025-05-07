Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ECBC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BspcMuvBrNbRChwbfJfiH+xXBVeCAdFjM5ETHUBIXVs=; b=vcIxpnOwP26yx23p/ax8A+5e/R
	IoTAichmdcvWap1BNereIr3fkGQci5kGt3+TbVBy+SqDkWCiotr/X6RkFLiEywedp9k8iqlgsI96p
	N0D+wPF5am00TCzM8CG7o8piFe/oUbqzogFOk90bgwnRXWNHvXGv4Crwxlrm+aB0flcDIVTRmYL5d
	sHFy/eqhEEcq91C5Fnet6nN4R6acsTWxCLc12jHbjJAYMCwYcXHG+CaQYPiAkjthvcF9NYABtRUx3
	dW7w8gdYZ07/0ZnjiM2EoE9XcZceizjjztcjdh1YAvsIvmWCUKlvWXdd8t4RnSbroRWKOGS3O0mP6
	j/a6KaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjZ3-0000000GUuo-3isK;
	Wed, 07 May 2025 18:32:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjJe-0000000GRsL-0HUh;
	Wed, 07 May 2025 18:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C18D5C5F57;
	Wed,  7 May 2025 18:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B73C4AF09;
	Wed,  7 May 2025 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746641781;
	bh=voDf6H+5x8ZJ+QNvLaKxp1ngBKm9HW1NaIJiF5gitL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Galm7MFzgJLnAO40Xck5MAyECjLHydu6iGER9PypizD509zMeOB/4tfpj2XjlmQbB
	 4sJSSWPSoYH2FAb4h4V4vRe/L+lulz2GTN4v/Qam2C9/DeU1Bc8Uzld3CWYqu8eTHE
	 ir4Pl2cYuXKEoHsR2jmnso75ptgZHUGanjNsz9duDft9vH/aJOHXDvqz/1SMQ0iyPU
	 VZ9BQLpS2AN4I80976dcubo05dYAgXIT3H4E5hXAHvFZ//fta2lERW7Te6m4xgSwyy
	 s1ccWzl/5WcaoZIMRaGu2tuqeIfrQ9EmgUOzjHXkyfA7J+ftgXLoofKE0fbhmo7/Np
	 xSnh6mmNFLhLw==
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
Subject: [PATCH 7/8] configs/hardening: Enable CONFIG_STACKLEAK
Date: Wed,  7 May 2025 11:16:13 -0700
Message-Id: <20250507181615.1947159-7-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507180852.work.231-kees@kernel.org>
References: <20250507180852.work.231-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=kees@kernel.org; h=from:subject; bh=voDf6H+5x8ZJ+QNvLaKxp1ngBKm9HW1NaIJiF5gitL0=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnSi3NndCfFZfNKLYsNrJ26vcOTL89ba72XzNPJVjs9u S6YOVh0lLIwiHExyIopsgTZuce5eLxtD3efqwgzh5UJZAgDF6cATKTsBiNDx94c+e3PfryMY4kJ m5dxOLHrbdTcm/xLJ6UelLZ+09L/heG/q46Tus+VBTWHLX+eee7NGPv0yjELoStvXEK7Fl3oXvG DBQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_111622_200080_81E8DBD0 
X-CRM114-Status: UNSURE (   8.14  )
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

Since we can wipe the stack with both Clang and GCC plugins, enable this
for the "hardening.config" for wider testing.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: <linux-hardening@vger.kernel.org>
---
 kernel/configs/hardening.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index dd7c32fb5ac1..3da00926b4eb 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -63,6 +63,9 @@ CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
 # Initialize all stack variables to zero on function entry.
 CONFIG_INIT_STACK_ALL_ZERO=y
 
+# Wipe kernel stack after syscall completion to reduce stale data lifetime.
+CONFIG_STACKLEAK=y
+
 # Wipe RAM at reboot via EFI. For more details, see:
 # https://trustedcomputinggroup.org/resource/pc-client-work-group-platform-reset-attack-mitigation-specification/
 # https://bugzilla.redhat.com/show_bug.cgi?id=1532058
-- 
2.34.1


