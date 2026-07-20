Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A66C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:Message-id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rpvkHatc5venoF9j9L6XoNX8JdOk4x19jKiLt8qwkGg=; b=G00CBd+gMf2M8uu2JPXMEvixHV
	7BP2PLk4uLWcYW8J1eeugoWEQd7yOeZ6gSveK2nT0GwAM+IlFmJJAOx18JfxKVwbw7S9OX4cwpHY1
	d3iQXc4i6r/7brZC0um1iI5L2RKeJBbbPqmHWEs+YcRBedvTwNOli5/2WRUZr/QxgnVpzCn15v6+m
	gA3y+frmJNJi+4HI+rCTm81Fqdld+C5phy+sTC0IQVobAOD2ls4NiXXIEl7SLlg3g75UyPKtdFDn4
	CtKZtM5vjvlLCM0S8LYzRK5hFF6uFLpL4U13fIoRU9NT/bcnq6BURKnp6xZK4WDuQ9AHhAZdnPdIi
	brefcKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlogO-00000006ueY-0SXn;
	Mon, 20 Jul 2026 14:09:24 +0000
Received: from vib-mx01.apple.com ([17.132.96.0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlogK-00000006uYP-0qDB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:09:21 +0000
Received: from am11p01nt-mtap01.apple.com
 (am11p01nt-mtap01.ise.apple.com [100.85.69.146]) by vb11p01nt-mxp01.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TIH02LQT8NGQQ00@vb11p01nt-mxp01.apple.com> for
 linux-arm-kernel@lists.infradead.org; Mon, 20 Jul 2026 14:09:17 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version : subject
 : to; s=20180706; bh=rpvkHatc5venoF9j9L6XoNX8JdOk4x19jKiLt8qwkGg=;
 b=s5Dn55UoMmTP/XSzcCqKoFDU27jZJDMKcRoIaw0yOCcD4zfZwtybrM5EV0UEgkd0UUa5
 qj05K/cVWKQ2ne4l22SABHOoBnNwxUriDuPLMO6lBsY4CZJCbfhGR9YUwmvtR6CCpTdS
 oEq/IJhF5lcxSGloZfAna1t88+bG3JA9qFmln7fw0GQpXQTzEgILpFQ9diww+y5ZmmzQ
 Oa/wCtNI1wKRL3MVSdVg6CJUOP6IgEEO/8kIfwyUNFZ+H92qAI3fywRwWLK5SxA5+TRH
 p+CHJ34mqrGLG7ax6VgfkBYyBAnsyf20X/sxZ1ZTNYJ1k0kRkE4ygeTqfeXnSDFoQ2E5 /Q==
Received: from am11p01nt-relayp03.apple.com
 (am11p01nt-relayp03.ise.apple.com [100.85.69.150])
 by am11p01nt-mtap01.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TIH1W79N8IV1210@am11p01nt-mtap01.apple.com>; Mon,
 20 Jul 2026 14:06:32 +0000 (GMT)
Received: from process_milters-daemon.am11p01nt-relayp03.apple.com by
 am11p01nt-relayp03.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) id <0TIH2D2008A70P00@am11p01nt-relayp03.apple.com>; Mon,
 20 Jul 2026 14:06:31 +0000 (GMT)
X-Va-A: 
X-Va-T-CD: ce4f70dc1a2240fbd24f73b1a9e97a59
X-Va-E-CD: 8ade7adb67953b6c8d3e3cec0ec7a4d5
X-Va-R-CD: 4aecd6208650d7300b2b78998d1f3b9e
X-Va-ID: b321d080-9dd8-46af-ae81-ccd23a3de1a4
X-Va-CD: 0
X-V-A: 
X-V-T-CD: ce4f70dc1a2240fbd24f73b1a9e97a59
X-V-E-CD: 8ade7adb67953b6c8d3e3cec0ec7a4d5
X-V-R-CD: 4aecd6208650d7300b2b78998d1f3b9e
X-V-ID: bddfdfeb-f8f1-4386-bb63-476d01f6b7b2
X-V-CD: 0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
Received: from amanp-m5d.apple.com (unknown [10.106.6.90])
 by am11p01nt-relayp03.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTP id <0TIH2COZ18IVW310@am11p01nt-relayp03.apple.com>; Mon,
 20 Jul 2026 14:06:31 +0000 (GMT)
From: Aman Priyadarshi <amanp@apple.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: Jason@zx2c4.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Aman Priyadarshi <amanp@apple.com>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] arm64: archrandom: avoid trapping ID register read in
 __cpu_has_rng()
Date: Mon, 20 Jul 2026 15:06:15 +0100
Message-id: <20260720140615.99343-1-amanp@apple.com>
X-Mailer: git-send-email 2.54.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_070920_254279_BDC5E8FF 
X-CRM114-Status: GOOD (  16.06  )
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

__cpu_has_rng() has an early-boot fallback, taken before the
ARM64_HAS_RNG alternative is patched, that calls
this_cpu_has_cap(ARM64_HAS_RNG). With SCOPE_LOCAL_CPU that resolves the
capability by reading ID_AA64ISAR0_EL1 directly from hardware via
__read_sysreg_by_encoding(), on every invocation.

Until the CRNG is seeded, crng_make_state() routes every get_random_*()
through extract_entropy(), which drains architectural entropy via
arch_get_random_seed_longs()/arch_get_random_longs() and so calls
__cpu_has_rng() several times per request. On a direct (non-EFI) boot
there is no bootloader seed, so the CRNG stays unseeded for much of
boot and essentially every early randomness consumer takes this path.

Under virtualization this is costly: the hypervisor traps guest
accesses to the ID registers (HCR_EL2.TID3), making each read a vmexit,
producing ~200k trapped ID_AA64ISAR0_EL1 reads during boot.

The register value is invariant, so read the sanitised feature register
instead. read_sanitised_ftr_reg() returns the cached value from
arm64_ftr_regs[] with no sysreg access, and hence no trap. That array
is populated by cpuinfo_store_boot_cpu() in smp_prepare_boot_cpu(),
before the first early RNG use in random_init_early(), so it is always
valid here.

With this change the trapped reads drop from ~200k to handful number of
times, and the boot time drops roughly by 6.3% in the test environment.

Fixes: 2c03e16f4499 ("random: remove early archrandom abstraction")
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Aman Priyadarshi <amanp@apple.com>
---
 arch/arm64/include/asm/archrandom.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
index 8babfbe31f95..8067e9a35641 100644
--- a/arch/arm64/include/asm/archrandom.h
+++ b/arch/arm64/include/asm/archrandom.h
@@ -61,8 +61,22 @@ static inline bool __arm64_rndrrs(unsigned long *v)
 
 static __always_inline bool __cpu_has_rng(void)
 {
-	if (unlikely(!system_capabilities_finalized() && !preemptible()))
-		return this_cpu_has_cap(ARM64_HAS_RNG);
+	if (unlikely(!system_capabilities_finalized() && !preemptible())) {
+		/*
+		 * Until the ARM64_HAS_RNG alternative is patched we can't use
+		 * the static-branch form, so consult the feature register
+		 * directly. Don't use this_cpu_has_cap() here: it reads
+		 * ID_AA64ISAR0_EL1 from hardware on every call, under
+		 * virtualization each ID register read traps to the hypervisor
+		 * (HCR_EL2.TID3) -- producing a storm of vmexits during boot.
+		 * The sanitised value is cached in memory.
+		 */
+		u64 isar0 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
+
+		return cpuid_feature_extract_unsigned_field(isar0,
+				ID_AA64ISAR0_EL1_RNDR_SHIFT) >=
+			ID_AA64ISAR0_EL1_RNDR_IMP;
+	}
 	return alternative_has_cap_unlikely(ARM64_HAS_RNG);
 }
 
-- 
2.54.0 (Apple Git-156)


