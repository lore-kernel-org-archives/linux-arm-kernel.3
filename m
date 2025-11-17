Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC7FCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEtX665z2JlcdgBBbipKuUMwN9cWh1oLTf7JBBzxWic=; b=K76swyKJqM8/X0GQUQC/MnP/bb
	hI+Rfcispy6Oq9b8bMGjUDVQhjeD+vHF/wEdJIUDHROx1jvQZ07+NdvN1ZlL4yHivbfpDsGaVp/8c
	r2javu79VHwCdVPcSwFofJyodtk+4G7o8SZHqNU5xBqfFm9kFh0utUFL+dT2LC5mZcUsl5j3lExri
	OyFxOHusL3OM8bwKETSXkbWapAhbpr2nM3Ye6kgeftaFSqWfJMJ+84XWF0G3UDU5UVKOABCT3mCWO
	6HQit9DY/MTYS5x657bfG3tzJDNQMdAc/fG7N2cUvW/HVafP6Q02jgfI4amYiHq4yeV54fwOlcUGA
	zR/PAXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwpJ-0000000Fugq-2Tio;
	Mon, 17 Nov 2025 10:51:17 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwpG-0000000FugF-2ebl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:51:15 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d94K32LZZzJ46dd;
	Mon, 17 Nov 2025 18:50:31 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id C455E14011A;
	Mon, 17 Nov 2025 18:51:11 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 17 Nov 2025 10:51:10 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Drew Fustini
	<fustini@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <james.morse@arm.com>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH v6 6/7] cache: Make top level Kconfig menu a boolean dependent on RISCV
Date: Mon, 17 Nov 2025 10:47:59 +0000
Message-ID: <20251117104800.2041329-7-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251117104800.2041329-1-Jonathan.Cameron@huawei.com>
References: <20251117104800.2041329-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_025114_952733_7FE5718B 
X-CRM114-Status: GOOD (  14.64  )
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

The next patch will add a new type of cache maintenance driver responsible
for flushing deeper than is necessary for non coherent DMA (current
use case of drivers/cache drivers), as needed when performing operations
such as memory hotplug and security unlocking of persistent memory. The two
types of operation are similar enough to share a drivers/cache directory
and MAINTAINERS but are otherwise currently unrelated.

To avoid confusion have two separate menus. Each has dependencies that are
implemented by making them boolean symbols, here CACHEMAINT_FOR_DMA
which is dependent on RISCV as all driver are currently for platforms of
that architecture. Set new symbol default to y to avoid breaking existing
configs. This has no affect on actual code built, just visibility of the
menu.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v6: New patch as suggested by Arnd.
---
 drivers/cache/Kconfig | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index db51386c663a..59a79df4c0ce 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -1,9 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
-menu "Cache Drivers"
+
+menuconfig CACHEMAINT_FOR_DMA
+	bool "Cache management for noncoherent DMA"
+	depends on RISCV
+	default y
+	help
+	  These drivers implement support for noncoherent DMA master devices
+	  on platforms that lack the standard CPU interfaces for this.
+
+if CACHEMAINT_FOR_DMA
 
 config AX45MP_L2_CACHE
 	bool "Andes Technology AX45MP L2 Cache controller"
-	depends on RISCV
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
 	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
@@ -16,7 +24,6 @@ config SIFIVE_CCACHE
 
 config STARFIVE_STARLINK_CACHE
 	bool "StarFive StarLink Cache controller"
-	depends on RISCV
 	depends on ARCH_STARFIVE
 	depends on 64BIT
 	select RISCV_DMA_NONCOHERENT
@@ -24,4 +31,4 @@ config STARFIVE_STARLINK_CACHE
 	help
 	  Support for the StarLink cache controller IP from StarFive.
 
-endmenu
+endif #CACHEMAINT_FOR_DMA
-- 
2.48.1


