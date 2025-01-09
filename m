Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EFAE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8mSLMBktMbzDleBxc69wxcwOxXrMut2APraWinG8Yc=; b=UkeKiYyKEA5UFsrBq50j2mHwUH
	UpPKvWwTxY24W5IL/wk//udWFfEvkhiuCmS1ybTxmMlmexGKtD2W4qv4P8kf+UKPYfXVdK9kjhRM3
	zL3K6KZ1M42YB9ExoS77yhjK5DbyjYfJ5ytzqrRY+nSFQlvEOCejSNqDRamUfY4VqT6RiD9Y8Q9mG
	w8IUjBNcKIJPe3ShB/V1JAScO2nfziz3u5n9d43qrF9jFwCr1ac4oOzEGWSl0N0CVQuxZ+vh76aum
	NP23os/1eqlxPCVWRFbF25FzzgxZ5oQtvk2pcWOnLMPbUps6GFCbrQs5ztDB0h2NSXX7QLvQk9w/9
	M3DHdtqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvos-0000000Cl3l-35Re;
	Thu, 09 Jan 2025 16:55:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvne-0000000Ckqb-21yI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:54:28 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A74E0C003ACE;
	Thu,  9 Jan 2025 08:54:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A74E0C003ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1736441663;
	bh=gDEC6eC+hE/3rES1P+/GSapucTV+adxfwsIx2MfNOTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GafJDr1M7LLL8Re1WOBG//t/CK5O5LXkj23wghl1l1b2R3G0f2PhuavAuM1HotAKR
	 nEgGHP2iSD8mzeWz7oP7acYTGpe3VPk3voOV6b/h3DgwjQbZ+JvXYu+bJmEuAVazrj
	 ud2oKTCWavkpWEmmikeDeoyTHRAWFohBeAmh1Xuc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 3F51018041CAC6;
	Thu,  9 Jan 2025 08:54:23 -0800 (PST)
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
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: mm: account for hotplug memory when randomizing the linear region
Date: Thu,  9 Jan 2025 08:54:17 -0800
Message-ID: <20250109165419.1623683-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_085426_799703_F85F1C6D 
X-CRM114-Status: GOOD (  18.18  )
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
index 80cc79760e8e..09c219aa9d78 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -401,15 +401,18 @@ void __init arm64_memblock_init(void)
 
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


