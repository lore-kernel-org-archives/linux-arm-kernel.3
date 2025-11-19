Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA21CF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f04PodMEzpJEwINLmjO/HFgtVYr9kSJcraZDsnWnz/8=; b=JYVsTDTRb1D5uXR/ID2kYKaCa6
	6pKqCGTDxY44qwgCKZPcfjG4Thshy6H0Epme35Ug4DwXtU6stbSiEJzFJGJL2rm8TT0clGuISRFJF
	RmanRR2UKpXrRJW7KS2CPWkEuW9W3gVbE7BfCHikQBWh7fjwHCojJWhKH0jvAHV/diZMYwFxZQxLf
	bjvxY9kx0/QvMbyVuKY0Ec32BBy3EOlh+rvj9Cl/UzHfMt3xWd0M/c60096ViRRHBe9uLnkIG2Nz/
	5g+CBGoKUtps5Otm6aLtNfO31GoM2wP2yGhiW1SzYiY/Db1gvI9lgiUczyNr17hoxfp0SFIUFvjlS
	OllQo0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnYa-00000004tFM-1b1P;
	Wed, 19 Nov 2025 19:09:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnYZ-00000004tDg-1YoW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C8DF60017;
	Wed, 19 Nov 2025 19:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97564C4CEF5;
	Wed, 19 Nov 2025 19:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763579369;
	bh=m/iEeMo6XQiw9/Dx9eONf5PKKCUoFowTGyoe2SjIzd4=;
	h=From:To:Cc:Subject:Date:From;
	b=P5am+x7g9L2pCMnLeMn5JjMvCZrQReRu6Y6E4L3Tx1hurLH9I7mKdNuQSRHr9peBE
	 mjlM2TX2rm5pGraV8ocafSLZwFHsUv/yYAHNhr6hmTJk7ukpmU9KAX4bXWGhkm13oB
	 DWVBPuiH9ydL7bKkp+/y9E+riJgOPAjHXLuB8exofl2cCkwTZLEO72BEP9DpH2Ew/l
	 okqzcJ+KbYy9QHlYbg4foP1b1W5ur53q/uS63gvkqglgRa1QrKOo43DXssf96/5fo0
	 BkDBgdU6sZq8HiVUyspWEfg06YPa0lPEwGuO09vPi3FVQnnu/CHvrVRSLnPdmqvvFt
	 MzT0zthjNxmHA==
From: Conor Dooley <conor@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64, lib: make ARM64 select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
Date: Wed, 19 Nov 2025 19:08:27 +0000
Message-ID: <20251119-zippy-distinct-1e2a7da7b69b@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3012; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YAGnfvTEuxQMcQ2392J834Z3DvqWo8GwePPM6woMlH0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlyoqsmuZ9KDPNhq83Pnxff9XHJr5wtql++hWZ9vKjWE daoNFG4o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZUMjIMNNAtmiDeWbZzSeN Gw5eEgm6zFs+5+4KL6u/18W884/tDGdkuM4mdC377u2CNpElnNVF2bHnLx07cXPOqQMCfKc3+6z qYwQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

Randy pointed out that the newly added GENERIC_CPU_CACHE_MAINTENANCE
was unusual, in that it selected an ARCH_HAS_... option, unlikely
anything else in lib/Kconfig. Switch things around, so that arm64
selects ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION and then
GENERIC_CPU_CACHE_MAINENANCE will in turn be automatically enabled.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Catalin, you voiced a take on this already apparently that lead to the
current implementation so I'd like an ack from you or Will here.
My comment on the original thread, in response to Randy saying it was
backwards, that accompanied the diff was:
 Maybe it is backwards, but I feel like this way is more logical. ARM64
 has memregion invalidation only because this generic approach is
 enabled, so the arch selects what it needs to get the support.
 Alternatively, something like (diff was here) implies (to me at least)
 that arm64 has memregion invalidation as an architectural feature and
 that the GENERIC_CPU_CACHE_MAINTENANCE option is a just common
 cross-arch code, like generic entry etc, rather than being the option
 gating the drivers that provide the feature in the first place.
Ultimately, the .config produced is the same either way, just depends on
what impression you want to give in the arch Kconfig, which might not
really be a big deal, just semantics. Either way, I'd like an ack :)

Cheers,
Conor.

CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Will Deacon <will@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/arm64/Kconfig | 2 +-
 lib/Kconfig        | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5f7f63d24931..75b2507f7eb2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -21,6 +21,7 @@ config ARM64
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CC_PLATFORM
+	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -146,7 +147,6 @@ config ARM64
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_CLOCKEVENTS_BROADCAST
 	select GENERIC_CPU_AUTOPROBE
-	select GENERIC_CPU_CACHE_MAINTENANCE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
diff --git a/lib/Kconfig b/lib/Kconfig
index 09aec4a1e13f..ac223e627bc5 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
 	bool
 
 config GENERIC_CPU_CACHE_MAINTENANCE
-	bool
-	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
+	def_bool y
+	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
+	depends on ARM64
 
 config ARCH_HAS_MEMREMAP_COMPAT_ALIGN
 	bool
-- 
2.51.0


