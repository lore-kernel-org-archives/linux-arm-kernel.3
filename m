Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B14C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlTZo2YHN4mUSlk4pxkhvoD5faV7hXNmgVvajUQvWZ4=; b=vVaQKVu/zgK6u/JHdQ+KMUO1O2
	P8Yz0t0CkMp5OdKzeC6w4MFE4j+VcDxTzC80iQw6/lIZ2gH3XrOE/gSP48Os4dInac7pYw++T1BqL
	5VOg1A9kXWuoV8N8dnP25mwxBI79zKyth1MOrDHBaqu5nqrrzK+yBMaogaiLNGMFaqduDuRr+G1bL
	cVl0Lv18uqS6PR/cO4P+nlaxtYG+fdVUw+n/4BDXD8ogEFkBqTTnyzXmUOEKwtHrEV0NKlprBF6l0
	tyM8SAmxPBr/PHsnG/brZ/pteqYeGp5/1E6ENJDfY/MaeAUrfUxnjhX1iXVxoWr6ofZoexSL3K87F
	W+Jagc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucY5x-0000000BJDd-1b99;
	Thu, 17 Jul 2025 23:32:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXyc-0000000BGru-1aYb;
	Thu, 17 Jul 2025 23:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6880161406;
	Thu, 17 Jul 2025 23:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E8FC19421;
	Thu, 17 Jul 2025 23:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752794720;
	bh=snrRkduazq+CuYpLqIIgLSyyFGO/4xQDvfJjkALfmd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NS7X/XTwq0SYtDmR92m6RT7w73OtZDj9VgWVVNVGKgedVVsfxXRvHZI9COauTBcNx
	 IJf8CoQ1ueF1UtsRpdaFdWjynKTuJMR7iOQ9dB5eXAoAKeEzLgmcrAYOMHhNhBuTFa
	 5L0IXxGJyWd/qnua1I3g1OrwQj49Kwe8UWc5GvvBBsfFg5fReai2QocNn2cQh6TSBb
	 DrdqpyazzU7lmZjFR0owNeQOna8O13p08uyB8LWCY4vmB6q6B0dWRv1mSb1aqKPkBf
	 HSq833cbvEh+Brue9gGKbgfS+iuAfT82TyUA3HF2JfEkEDQXirKBuf9wcMrILU5Y7z
	 a9/YWz+eqqRzg==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Oza Pawandeep <quic_poza@quicinc.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 06/13] arm64: Handle KCOV __init vs inline mismatches
Date: Thu, 17 Jul 2025 16:25:11 -0700
Message-Id: <20250717232519.2984886-6-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717231756.make.423-kees@kernel.org>
References: <20250717231756.make.423-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=kees@kernel.org; h=from:subject; bh=snrRkduazq+CuYpLqIIgLSyyFGO/4xQDvfJjkALfmd4=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmVbdEzXlcsa9p/3vH4wcBunn0Xzgqe/i2/fPcJtzdM2 +dtv7RXoKOUhUGMi0FWTJElyM49zsXjbXu4+1xFmDmsTCBDGLg4BWAiJpcZ/meVLTv9o6vkxY3d a25FeUnp7579w2v1S82fR+ZrWufbpk9lZHhUJ9F5q+Oy06z3YoGri0MTin/7rdDVqX0tLvSAqbR 2Lx8A
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

When KCOV is enabled all functions get instrumented, unless
the __no_sanitize_coverage attribute is used. To prepare for
__no_sanitize_coverage being applied to __init functions, we
have to handle differences in how GCC's inline optimizations get
resolved. For arm64 this requires forcing one function to be inline
with __always_inline.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: James Morse <james.morse@arm.com>
Cc: Oza Pawandeep <quic_poza@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 arch/arm64/include/asm/acpi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index a407f9cd549e..c07a58b96329 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -150,7 +150,7 @@ acpi_set_mailbox_entry(int cpu, struct acpi_madt_generic_interrupt *processor)
 {}
 #endif
 
-static inline const char *acpi_get_enable_method(int cpu)
+static __always_inline const char *acpi_get_enable_method(int cpu)
 {
 	if (acpi_psci_present())
 		return "psci";
-- 
2.34.1


