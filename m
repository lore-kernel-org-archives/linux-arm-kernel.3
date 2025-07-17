Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC2CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 23:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M709jLRtc2XgE706Ixh8CoyF/CdRnneMUqovlV8ji3k=; b=IHn1gZCJIVWSwxAIQDWZXYesLH
	AY6KRn/NN/zv4E7jHaqfpTmAE48FZ7V7a80oxskS7T67keivQDz1QuFMLchShe7SMsOgYqFnDqbfQ
	nuDMAQAIMSNspIhNkMZ4CDSes6ur0ybkvVKd7hlA0W5CcqXjtPbgDBOF2AcGWKevgYRHIMWQeQsET
	59cCflp1iKTw4lyKBRE4VIjS1PptR4kUD9FrhnptEu4upVrLyx9xwvH5sG8766prA6czMpgbvogbv
	JcmmsZoGLs+Dl5SrLGaoCAFMOqpO3VolURfEaZQblzNAcEP4r7jEvzisfeY9V3bZusy+PmChz4El3
	ST+grb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYRp-0000000BNQ1-2MBs;
	Thu, 17 Jul 2025 23:55:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXze-0000000BHLX-0rez;
	Thu, 17 Jul 2025 23:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M709jLRtc2XgE706Ixh8CoyF/CdRnneMUqovlV8ji3k=; b=dqeCHOoKoHMkSsuxY3XDG/ypLO
	nQwPxAgWKz/VupnM+pgsKJD639qaZQp3FwM5fPG3SSKUWE3o0tnfxNrqWvM5ycxV/Y2iyoNJPIRHs
	d6M+lqPpNZpH3X0S7XgbvT6P9Gy/1iO3h0/XTQsOrfrPZZaTq2cY0S7SRJiyMN+yLl4VUZ+iFyFra
	sajPXLPYqzNygs8945XzPn7472JAv0G/kSdfuoKeTyzp5EQBP5FXVeKvENUj3wSryG6jp5+Osb22o
	7FiS1qpQigqTfQs6IAfWiOijVORNuXCRpalVaAXrj+Fey2ydSyp6u3/K5qB1CF35qCX1yj6sif1Pn
	HJWLCHEg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXyh-0000000AN9E-1JIG;
	Thu, 17 Jul 2025 23:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5618645D4E;
	Thu, 17 Jul 2025 23:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBF8C2BCB1;
	Thu, 17 Jul 2025 23:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752794720;
	bh=2ug/lH8nh3wdYXaBdZPOL2AvIMcZUPQ6EhDC2jpITSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NteDUBwai+jItLwcpYckNP0xUiUtzclbkaFWn020YjQgwFVuyGGWrARl8Vn8ogjbU
	 HA7N6JUbwARRKiomN6gJkMEtj3ziS/fItDI81YF+wfJMRXtKK3j0GP8SF0gvhoO51X
	 oCI2fsMsgsVBz/v7awiAMsuOKmnfKRD72nOBmmxlXSV9CvjEStIWVUPEtq6gBKTXfH
	 f9qwUWBwEQ3d6FAPVDsBxaPct1USs9Cn4jw01nkaUPzrxrGxP/fXlkew24VQuyaEGH
	 PVVayYayn3gDzPIYcf1Hm8MivLp/HLHtpzhQm2HDSnwA74AgKf1aZYpvBe0CeBN0Zw
	 F8AX99YLu6fsw==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
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
	linux-arm-kernel@lists.infradead.org,
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
Subject: [PATCH v3 09/13] mips: Handle KCOV __init vs inline mismatch
Date: Thu, 17 Jul 2025 16:25:14 -0700
Message-Id: <20250717232519.2984886-9-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717231756.make.423-kees@kernel.org>
References: <20250717231756.make.423-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=kees@kernel.org; h=from:subject; bh=2ug/lH8nh3wdYXaBdZPOL2AvIMcZUPQ6EhDC2jpITSk=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmVbTEaTpwT/CqkP/gFhCj/XO54+7qYREShYs8l04cXr l6frm7XUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBEtE4b/Xqd+XFyVnrjymfWn 4Kf1C05k68rFv26yrf/i2iH18eJ2SUaGV0lMd+enHioMXSjkm7z02hWe6SLiP1bPKvlVrXb+1vx GFgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_002532_147096_16DD6C51 
X-CRM114-Status: GOOD (  10.36  )
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
resolved. For mips this requires adding the __init annotation on
init_mips_clocksource().

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: <linux-mips@vger.kernel.org>
---
 arch/mips/include/asm/time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
index e855a3611d92..5e7193b759f3 100644
--- a/arch/mips/include/asm/time.h
+++ b/arch/mips/include/asm/time.h
@@ -55,7 +55,7 @@ static inline int mips_clockevent_init(void)
  */
 extern int init_r4k_clocksource(void);
 
-static inline int init_mips_clocksource(void)
+static inline __init int init_mips_clocksource(void)
 {
 #ifdef CONFIG_CSRC_R4K
 	return init_r4k_clocksource();
-- 
2.34.1


