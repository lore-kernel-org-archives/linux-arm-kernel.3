Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC77CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9Oh42yLjcQJ7y4ZfW/BobTIW+tMtYU6hx//43sSG+s=; b=HTHYmRFmVdMDzZHaNzDUxYPuWt
	LDP+jyqThA5lTYvCQ8v4s2gxZkUJnz018a6BDcjvim8MTwNk+opQVmR8osgG/78PiO0A+qv0AvVID
	qLD1Zr6hT40x3IeXZU6UJznZMdGfWSnDjnI0LBSIEpEnNt96kM5JKsmqSvYWgNcO9sHz0iBcsFH1x
	t6QAh1MmFTWVPUodOoh1hDOMjPs+ogb3kVW9i+XbN4/a6DCyxDMf8hKqJs39RHIY4LruT+NWxn7WU
	87mf70oP0lTyCJ8Bjka1NhDpCjp0N1qm+pcnZ1TpxAZubSygSw6HoYkEAU5ixmsU2NQpa3hXMEyPR
	spj6leNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDC-00000004rCY-3rqI;
	Tue, 09 Sep 2025 06:52:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvkSW-00000002kpZ-2OU0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 22:35:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC5EF2F9D;
	Mon,  8 Sep 2025 15:35:27 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B88E03F694;
	Mon,  8 Sep 2025 15:35:34 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	sami.mujawar@arm.com,
	sudeep.holla@arm.com,
	steven.price@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 2/3] arm64: Enable EFI secret area Securityfs support
Date: Mon,  8 Sep 2025 23:35:18 +0100
Message-ID: <20250908223519.1759020-3-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908223519.1759020-1-suzuki.poulose@arm.com>
References: <20250908223519.1759020-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_153536_643028_B04A6E50 
X-CRM114-Status: GOOD (  10.16  )
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

Enable EFI COCO secrets support. Provide the ioremap_encrypted() support required
by the driver.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Sami Mujawar <sami.mujawar@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/io.h          | 4 ++++
 drivers/virt/coco/efi_secret/Kconfig | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 82276282a3c7..83e03abbb2ca 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -274,6 +274,10 @@ int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
 #define ioremap_np(addr, size)	\
 	ioremap_prot((addr), (size), __pgprot(PROT_DEVICE_nGnRnE))
 
+
+#define ioremap_encrypted(addr, size)	\
+	ioremap_prot((addr), (size), PAGE_KERNEL)
+
 /*
  * io{read,write}{16,32,64}be() macros
  */
diff --git a/drivers/virt/coco/efi_secret/Kconfig b/drivers/virt/coco/efi_secret/Kconfig
index 4404d198f3b2..94d88e5da707 100644
--- a/drivers/virt/coco/efi_secret/Kconfig
+++ b/drivers/virt/coco/efi_secret/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config EFI_SECRET
 	tristate "EFI secret area securityfs support"
-	depends on EFI && X86_64
+	depends on EFI && (X86_64 || ARM64)
 	select EFI_COCO_SECRET
 	select SECURITYFS
 	help
-- 
2.43.0


