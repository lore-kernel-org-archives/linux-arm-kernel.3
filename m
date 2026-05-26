Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45B3CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suadXFjqUeYXYgOScGS4rRxyj1HJ35c5fal4EZbJOu8=; b=TdfR89jLDwvxu+D16Ed7OZXe2f
	RzrEPxDDGCO+qbqYjCKlCBH67fyELKjValL2vcCw5ldi6UyZaKW+bnKRkR1rDeLZBktPoElFdFvoD
	idrclF9+I36NSd5SeGUQMaf6gNfaEzeVu2JjKglq+wpOTPBAFaSLzAQgLiQMvHyrj8q1o8D0/MY/y
	Y0E60dwC3LyO4wdbbJn7iCz0x41pPIP8Vrix1KkuE1Q7KLZoUm4pRui/+vS67VykF4aYe/2n0QUBX
	hiT5AW1kOnfrtFT+3Ix4DVMA58NITgIH5l+R3xuTSBe2ZP0psibu1pz19aINz+EB5KBBccoqS9S8N
	BTx6qIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpnt-00000001lEy-3D84;
	Tue, 26 May 2026 11:18:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpnh-00000001l3c-3xdn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:18:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7300169C;
	Tue, 26 May 2026 04:18:15 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6693F7D8;
	Tue, 26 May 2026 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779794300; bh=m1lwmokEjD1HoWjx/wLPpsDySzIAvlE7LuDL4EQvvUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f2YD1wn/UgAq7EktZoIxNhGpnmsMTZu1NHXu6M0LpQzX8aM1efxJoXBHYJ+Lj2a1Q
	 rrc3NAp66I67k2y8c+DeacsqlbfE67hn9p5EBVo0zj+UYEmnOEMCqs/Pw+jhF02uFI
	 DWO0meIz5z/ys/hkYufQlSUY4Si0Gp/oJDp9qYSk=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 26 May 2026 12:16:05 +0100
Subject: [PATCH RFC v8 16/24] arm64: kpkeys: Implement
 arch_supports_kpkeys_early()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-kpkeys-v8-16-eaaacdacc67c@arm.com>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
In-Reply-To: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779794212; l=1883;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=m1lwmokEjD1HoWjx/wLPpsDySzIAvlE7LuDL4EQvvUQ=;
 b=PF9qkQuhpKVS30hRKZUdA4i0w6tAhzaz0tLGjykXAtm5KnRdCWJF/YeucL6q1dyrrK3YwJk9i
 d4zP53BkOW6DBGpZtXPjYkMVMAfDsR99jtotryWZEn1eJP79d2NbAGt
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041822_138706_79C16B57 
X-CRM114-Status: GOOD (  13.14  )
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

We need to check if the kpkeys_hardened_pgtables feature is going to
be enabled very early during boot, to decide how to set up the
linear map and how to allocate early page tables. This happens even
before boot CPU features are detected.

Implement the arch_supports_kpkeys_early() helper by directly
checking if the boot CPU supports POE, if it is called before boot
CPU features are detected. It may also be called later, in which
case we simply check the POE feature.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/cpufeature.h | 12 ++++++++++++
 arch/arm64/include/asm/kpkeys.h     |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cb..8722e9e62702 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -1078,6 +1078,18 @@ static inline bool cpu_has_lpa2(void)
 #endif
 }
 
+static inline bool cpu_has_poe(void)
+{
+	u64 mmfr3;
+
+	if (!IS_ENABLED(CONFIG_ARM64_POE))
+		return false;
+
+	mmfr3 = read_sysreg_s(SYS_ID_AA64MMFR3_EL1);
+	return cpuid_feature_extract_unsigned_field(mmfr3,
+						    ID_AA64MMFR3_EL1_S1POE_SHIFT);
+}
+
 #endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index 4dbfeb3dfcfe..fdf3ebe92810 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -21,6 +21,13 @@ static inline bool arch_supports_kpkeys(void)
 	return system_supports_poe();
 }
 
+static inline bool arch_supports_kpkeys_early(void)
+{
+	/* POE is a boot feature */
+	return boot_capabilities_finalized() ?
+		system_supports_poe() : cpu_has_poe();
+}
+
 #ifdef CONFIG_ARM64_POE
 
 static inline u64 por_set_kpkeys_context(u64 por, int ctx)

-- 
2.51.2


