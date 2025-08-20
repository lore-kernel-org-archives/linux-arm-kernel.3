Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C1ECA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SLF8njMGx+hMY0EzSzRQAV2g0lPdEnnpMoXSDXffQc=; b=F/yPm46G92vi2CBJyuHelS/6yC
	CLRoZdAaZJpPY1FxKZsxaNq6qtBtmQAYzwkACuNjM99PPbxClHMfjeubQR8sZv/C+K+FDsORIDI/c
	SX9HCwz01f1nLPTEUGYbGMCamRWJcGLDatuUmlfcbkGgvpqvXdbj076+ydTTWFrpwnxrjr4XEn/RS
	+PTXp871ZUGXYbMuPqAU0z6UEH54PdDOWGMDBltjMcNV2g4Ri0HKclS97UiR9+s43oSWX+yKtzwnr
	8jB81yKFTiNnxYZ17lpP7m1otbBHVyn8nvh7tGUV+uSMRWdt2anseGOHMwJ2jUILU3J1H42k0UAyE
	Ay9siv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogwp-0000000DOHU-37uK;
	Wed, 20 Aug 2025 11:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog7Q-0000000DApW-3SKA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 10:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4SLF8njMGx+hMY0EzSzRQAV2g0lPdEnnpMoXSDXffQc=; b=HeaNlbVGm0x9lEQBMLkYA/YtG7
	eDc3JvviGz+QYG0QB8agvDhzgevCp2tgHo5hiz1JScTidxFGDtWoQaOU5A/3EkEDUnvTjOs5Y5HOR
	aCpoz8OO9BOtOxzLDMNf1Ssweh+6oIYj4+jl+bBJschWvuBIMnfEApAzESwR3M7+/ME8rxWiyXo2d
	2omYVAPPXfF0yjf09Vn9FK1J+RmQe93bMcwAbkl0VuqAkF6mrewuobmoB69DSZZV4WYJY/l6b0QMf
	Z946rgWb+P+zVta6pC0pbh41hsG2K/HTdZwY9VLTMSb5EeIlK4J2UzeVzRDc3I2/58hXnPrCTUQAD
	cHV8vpow==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog7O-00000000IKg-0Ii6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:32:35 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c6N3p27HCz6L5wF;
	Wed, 20 Aug 2025 18:29:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 36A9A1402DA;
	Wed, 20 Aug 2025 18:32:29 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Aug 2025 12:32:28 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
CC: Yicong Yang <yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>
Subject: [PATCH v3 5/8] arm64: Select GENERIC_CPU_CACHE_MAINTENANCE and ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Date: Wed, 20 Aug 2025 11:29:47 +0100
Message-ID: <20250820102950.175065-6-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_113234_220024_7A2D3ED0 
X-CRM114-Status: GOOD (  10.62  )
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

Ensure the hooks that the generic cache maintenance framework uses are
available on ARM64 by selecting ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.

The generic CPU cache maintenance framework provides a way to register
drivers for devices implementing the underlying support for
cpu_cache_has_invalidate_memregion().

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..15bf429b3f59 100644
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
@@ -146,6 +147,7 @@ config ARM64
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_CLOCKEVENTS_BROADCAST
 	select GENERIC_CPU_AUTOPROBE
+	select GENERIC_CPU_CACHE_MAINTENANCE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
-- 
2.48.1


