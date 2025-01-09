Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F9EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4+j3aAuysyJMS77Wa6AcpualkU8jFRxYHdyL+QUwlaY=; b=BqbkCiB8pWDznzhOBk6gO+eloq
	tliTty1bhLt3Z3mtcCYSzIiLkKbV9XjVg9y/xMVVnphzgVr003j0AxClGRF0FOHol8mKAgjJCTYcK
	3cKSWoHnlqhQRotl6AUlsfCQx3PaVWFknShqCcL61x/14GYbyTmARCWLA4RUBebpcVw4jIApjYyPd
	IGCp1JLS+WcAsLije/JLh1JzzDpRG7TwQPGCvrWIIgpTwJkI5AzFx6zhvdtzrloMH3Ug5OC98C6ZB
	GbrCRcrCm2Oaqc1+Z2n5V+9iBuN2/u8APlUvtmWfe7NC/KU6fEbV3l8sgvoZ/BA1AB9LAvQXCKUbn
	lgfme29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvq4-0000000ClNA-1S9q;
	Thu, 09 Jan 2025 16:56:56 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvne-0000000CkqZ-22DW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:54:28 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CE6ACC0000E8;
	Thu,  9 Jan 2025 08:54:22 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CE6ACC0000E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1736441662;
	bh=SUejWQaCCQ6UOnlEIF8Y+gc/yElELSYPKQtYJBlFtf4=;
	h=From:To:Cc:Subject:Date:From;
	b=kV7xB6JJuMPSScCf/QhQbMLjsitXPYL4hv+kABwyIm1cbIjg6l+/kb1Vd092YWPb8
	 Vu+vKfwY8tJ3QhT8fb20fa/174LzSo4n2E8OaYlJYXBOg7gX+BRfolIyu+RnbqNDcp
	 5yqNNviGmgn9Xoq8WBKv7s81grk41SYj0QZypt/s=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 63D2418041CAC6;
	Thu,  9 Jan 2025 08:54:22 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: stable@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Petr Tesarik <ptesarik@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH stable 5.4] arm64: mm: account for hotplug memory when randomizing the linear region
Date: Thu,  9 Jan 2025 08:54:16 -0800
Message-ID: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_085426_799725_70605D08 
X-CRM114-Status: GOOD (  17.19  )
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

From: Ard Biesheuvel <ardb@kernel.org>

commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream

As a hardening measure, we currently randomize the placement of
physical memory inside the linear region when KASLR is in effect.
Since the random offset at which to place the available physical
memory inside the linear region is chosen early at boot, it is
based on the memblock description of memory, which does not cover
hotplug memory. The consequence of this is that the randomization
offset may be chosen such that any hotplugged memory located above
memblock_end_of_DRAM() that appears later is pushed off the end of
the linear region, where it cannot be accessed.

So let's limit this randomization of the linear region to ensure
that this can no longer happen, by using the CPU's addressable PA
range instead. As it is guaranteed that no hotpluggable memory will
appear that falls outside of that range, we can safely put this PA
range sized window anywhere in the linear region.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/mm/init.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index cbcac03c0e0d..a6034645d6f7 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -392,15 +392,18 @@ void __init arm64_memblock_init(void)
 
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
 		extern u16 memstart_offset_seed;
-		u64 range = linear_region_size -
-			    (memblock_end_of_DRAM() - memblock_start_of_DRAM());
+		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
+		int parange = cpuid_feature_extract_unsigned_field(
+					mmfr0, ID_AA64MMFR0_PARANGE_SHIFT);
+		s64 range = linear_region_size -
+			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
 
 		/*
 		 * If the size of the linear region exceeds, by a sufficient
-		 * margin, the size of the region that the available physical
-		 * memory spans, randomize the linear region as well.
+		 * margin, the size of the region that the physical memory can
+		 * span, randomize the linear region as well.
 		 */
-		if (memstart_offset_seed > 0 && range >= ARM64_MEMSTART_ALIGN) {
+		if (memstart_offset_seed > 0 && range >= (s64)ARM64_MEMSTART_ALIGN) {
 			range /= ARM64_MEMSTART_ALIGN;
 			memstart_addr -= ARM64_MEMSTART_ALIGN *
 					 ((range * memstart_offset_seed) >> 16);
-- 
2.43.0


