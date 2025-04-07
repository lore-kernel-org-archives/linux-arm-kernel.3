Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF95C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHsKAAS4xn/E3BE2tcKx5LKhY9hfcmn910IVFbLatwo=; b=a94Z0GOWNAC+X6Jj1tfVr5qosD
	+r7cMO8iheXG1fVZkXZJWUZh7+mSgPWUv44o0XQpEbthWuboXV2Ww8NurdjlNjePILOyuCy2PV7W6
	s4liLN/++MYET9WW0d+Ps9ctUnzPUC+DIySGeqg85t78BQY3VgqwgFICM4iq87UKpPHGZb4CeUD8D
	FfS++o2AigJ6DBmRpq3D+7wTbIjg+IdsQkdAuB5k7VhFDTIT32ktwBxPxDAVV3Mitthez/cbV/mAV
	gY3hvw7L8/+4KTSAeoRJbAjowYYNAEVAqhupYtL52JTMSELIrc5BHtAY4hzwcsm/n1CA0OY2VfJ0R
	qrUhZcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1j87-0000000HGBF-1NxA;
	Mon, 07 Apr 2025 09:50:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iz4-0000000HEGa-1Pwr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:41:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4F57A4867C;
	Mon,  7 Apr 2025 09:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8CDC4CEEE;
	Mon,  7 Apr 2025 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744018897;
	bh=VwzxAZgsRybA0F2IDNYCLluyflBkB+VWLGkimMGzLx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dV3U946eMOm6wdNY//ORQidKNfD6+720aVfe5fmXsvQQXzscsW1aXUi38et3haz15
	 lm/XsBfnz+TpcumI/6XVgq9IPEdze6PGUJJAbdLFIyha0+djkIcWylatZcgTMrBOqT
	 HpAS8uTlwNdTx4/9l67XiA+Xn4YW0qyQFoMa9Q1G/7TDWdMrKrPZTlMDJb3Mwy9u02
	 gVc3yKnpH3FRV4pjhcPP4v+zndz2Fa0jqrwl5k4dfbEge4CUhl6kgsP4l3l9Jq+fhY
	 jCriA1cjNVHdG3LU4uva6VoMwfx6bumqqh8MVu/sYkMfCvy297c1stgUA4IaO8a1Fb
	 2VaY5yyST2Wew==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 2/4] raid6: skip avx512 checks
Date: Mon,  7 Apr 2025 11:41:14 +0200
Message-Id: <20250407094116.1339199-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094116.1339199-1-arnd@kernel.org>
References: <20250407094116.1339199-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_024138_511653_0FC0C5F6 
X-CRM114-Status: GOOD (  13.05  )
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

From: Arnd Bergmann <arnd@arndb.de>

It is no longer necessary to check for CONFIG_AS_AVX512, since the minimum
assembler version is now from binutils-2.30 and this always supports it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/raid6/algos.c        | 6 ------
 lib/raid6/avx512.c       | 4 ----
 lib/raid6/recov_avx512.c | 6 ------
 lib/raid6/test/Makefile  | 3 ---
 4 files changed, 19 deletions(-)

diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index cd2e88ee1f14..dfd3f800ac9b 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -28,10 +28,8 @@ EXPORT_SYMBOL_GPL(raid6_call);
 
 const struct raid6_calls * const raid6_algos[] = {
 #if defined(__i386__) && !defined(__arch_um__)
-#ifdef CONFIG_AS_AVX512
 	&raid6_avx512x2,
 	&raid6_avx512x1,
-#endif
 	&raid6_avx2x2,
 	&raid6_avx2x1,
 	&raid6_sse2x2,
@@ -42,11 +40,9 @@ const struct raid6_calls * const raid6_algos[] = {
 	&raid6_mmxx1,
 #endif
 #if defined(__x86_64__) && !defined(__arch_um__)
-#ifdef CONFIG_AS_AVX512
 	&raid6_avx512x4,
 	&raid6_avx512x2,
 	&raid6_avx512x1,
-#endif
 	&raid6_avx2x4,
 	&raid6_avx2x2,
 	&raid6_avx2x1,
@@ -96,9 +92,7 @@ EXPORT_SYMBOL_GPL(raid6_datap_recov);
 
 const struct raid6_recov_calls *const raid6_recov_algos[] = {
 #ifdef CONFIG_X86
-#ifdef CONFIG_AS_AVX512
 	&raid6_recov_avx512,
-#endif
 	&raid6_recov_avx2,
 	&raid6_recov_ssse3,
 #endif
diff --git a/lib/raid6/avx512.c b/lib/raid6/avx512.c
index 9c3e822e1adf..009bd0adeebf 100644
--- a/lib/raid6/avx512.c
+++ b/lib/raid6/avx512.c
@@ -17,8 +17,6 @@
  *
  */
 
-#ifdef CONFIG_AS_AVX512
-
 #include <linux/raid/pq.h>
 #include "x86.h"
 
@@ -560,5 +558,3 @@ const struct raid6_calls raid6_avx512x4 = {
 	.priority = 2		/* Prefer AVX512 over priority 1 (SSE2 and others) */
 };
 #endif
-
-#endif /* CONFIG_AS_AVX512 */
diff --git a/lib/raid6/recov_avx512.c b/lib/raid6/recov_avx512.c
index fd9e15bf3f30..310c715db313 100644
--- a/lib/raid6/recov_avx512.c
+++ b/lib/raid6/recov_avx512.c
@@ -6,8 +6,6 @@
  * Author: Megha Dey <megha.dey@linux.intel.com>
  */
 
-#ifdef CONFIG_AS_AVX512
-
 #include <linux/raid/pq.h>
 #include "x86.h"
 
@@ -377,7 +375,3 @@ const struct raid6_recov_calls raid6_recov_avx512 = {
 #endif
 	.priority = 3,
 };
-
-#else
-#warning "your version of binutils lacks AVX512 support"
-#endif
diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
index 2abe0076a636..8f2dd2210ba8 100644
--- a/lib/raid6/test/Makefile
+++ b/lib/raid6/test/Makefile
@@ -54,9 +54,6 @@ endif
 ifeq ($(IS_X86),yes)
         OBJS   += mmx.o sse1.o sse2.o avx2.o recov_ssse3.o recov_avx2.o avx512.o recov_avx512.o
         CFLAGS += -DCONFIG_X86
-        CFLAGS += $(shell echo "vpmovm2b %k1, %zmm5" |          \
-                    gcc -c -x assembler - >/dev/null 2>&1 &&    \
-                    rm ./-.o && echo -DCONFIG_AS_AVX512=1)
 else ifeq ($(HAS_NEON),yes)
         OBJS   += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
         CFLAGS += -DCONFIG_KERNEL_MODE_NEON=1
-- 
2.39.5


