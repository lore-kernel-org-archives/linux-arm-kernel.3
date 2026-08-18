Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D06C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbplVkHgGYVeclYwcMZL8ms81hMZjXWcaep67+GqB4M=; b=D2ZpauQ62KddbHQITdJqgTtsHX
	3vkJXkCBwWVoKwjwCSibGEYNyeuZPJzsKp9QjYBJNKtgx89EG+rYIq+qIcuhuNjsQhGXc13z87vTb
	VoeFXVK7ADLyrwAR++jbgElnqRjNsU9y5XT8eJx5QmFbwf7jV6m+wPNRoUrn52HsC/KHUIf11kJZo
	+TnhB+YS/mNilQJk9sS4DNQIfHNJVZM0m1MxFc7qL3svmCkdhrGlrwjs/5bvYAa8krDpABuybVFrd
	8KQ2HjX+PFM/IPubUL+5johmvNSbDGpTaK0Ln/x/v+TVRfTOQotx5ffa2IRD3QDEEmiUTKvXEobPN
	tkEPDriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKYi-000000087rW-3zeL;
	Tue, 18 Aug 2026 14:12:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKYZ-000000087gV-3L8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:12:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D16B019F6;
	Tue, 18 Aug 2026 07:12:42 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18F7D3F85F;
	Tue, 18 Aug 2026 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062366; bh=iuHkFnsaX/6Wt0s3WtH1IONd8/3ory872W49q7NS7GI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P2m3rdwpn8gldKYtBm8KL2r4oRsqWcL6F4o9V4G1tHbB9srkk9vFA0BAp6B/ip/Bf
	 DhMaQ6Xxpn03eOKwneq4rpz1kt+g3ozd9u+VJVAa0N1WDaGpub4I3T6nYdFSt9Gy87
	 3AS/bnhvOioX+O6k5Rh1LreS5iCGqFFulLtL87RQ=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 18 Aug 2026 15:08:59 +0100
Subject: [PATCH RFC v9 17/25] arm64: kpkeys: Support KPKEYS_CTX_PGTABLES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-kpkeys-v9-17-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
In-Reply-To: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062276; l=1174;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=iuHkFnsaX/6Wt0s3WtH1IONd8/3ory872W49q7NS7GI=;
 b=gQpjqvXD2ZEiIo5C/DaU185kZh9RB40StHJQpTmYLw+oVULaoiCKxWBhlNqsVRUbfAHBBpWZ5
 ky64mKf7BofAZgocHn4n2s+Xwk7Tk0745d4hmHnkcMMlGVjYgkG/UC+
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071248_687639_5C560FD1 
X-CRM114-Status: GOOD (  12.10  )
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

Enable RW access to KPKEYS_PKEY_PGTABLES (used to map page table
pages) if switching to KPKEYS_CTX_PGTABLES, otherwise only grant RO
access.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index 284039e9a244..00e7e5956794 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -12,7 +12,8 @@
  * Equivalent to por_set_kpkeys_context(0, KPKEYS_CTX_DEFAULT), but can also be
  * used in assembly.
  */
-#define POR_EL1_INIT	POR_ELx_PERM_PREP(0, POE_RWX)
+#define POR_EL1_INIT	(POR_ELx_PERM_PREP(0, POE_RWX) | \
+			 POR_ELx_PERM_PREP(KPKEYS_PKEY_PGTABLES, POE_R))
 
 #ifndef __ASSEMBLY__
 
@@ -33,6 +34,8 @@ static inline bool arch_supports_kpkeys_early(void)
 static inline u64 por_set_kpkeys_context(u64 por, enum kpkeys_ctx ctx)
 {
 	por = por_elx_set_pkey_perms(por, 0, POE_RWX);
+	por = por_elx_set_pkey_perms(por, KPKEYS_PKEY_PGTABLES,
+				     ctx == KPKEYS_CTX_PGTABLES ? POE_RW : POE_R);
 
 	return por;
 }

-- 
2.51.2


