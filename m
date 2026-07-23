Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B8C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvSUMavq8PFW/OSv2aVzociNmjIbe8Sv07PyzopQ6kY=; b=FuZMrqk8ZgiJnYcIjspbc2TqkZ
	zqMBJbCb+l0Jvj4kfDNReVP7SomgxRCZHOiQVVpn4fnBQB5ILQKzxm4MPkZaOu5CEIC/uN9Mm//cf
	IVj6bBTryrosUiYrtUYPXW59mIQpXFMG5AJKb8MsMfb5C22vlgc/58YGIaHvYYOcmd/aLwQ2OSvN1
	zoDmVGYsHawArh7F0wmmFUYl8jZ1u5uSq3zoQUPaGPPxGWf3bZEkt2jC94xRKc3ZBN6kia1rrp9hi
	Lff97gTWowyCMd5dC+eIASVKv7nomcbryQiCfgq8dNu8fpWZ3i+n2Gk04MceyY51LwnN5Ad5MVvuo
	r7aUrYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlG9-0000000DPJp-3JXl;
	Thu, 23 Jul 2026 04:42:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlG1-0000000DPHY-24Ga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:42:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B40A216F2;
	Wed, 22 Jul 2026 21:41:59 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C86B73F86F;
	Wed, 22 Jul 2026 21:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784781723; bh=eY/6iqp9IL9GIS2WDh8gELz7wLUZf8YIxM9V02D5JYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8q8YEzdsK+kwe9P2+KpDxu3VWkqLvczZOGQg2dNf3/kXTOaufsaDQhSAJayXKmEc
	 QKZLuLi9pewTSbn1Li8kT6XV/4ktmz+DJEbBJZRtBqSm5yM8FM7ZzjeKzqsfGXB57B
	 9kC7y6KW54XdullBAZxxyUSUuJyQHA9ig4CBUpFE=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v4 2/6] arm64: cputype: Add C1-Nano definitions
Date: Thu, 23 Jul 2026 10:10:29 +0530
Message-ID: <20260723044034.2983651-3-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723044034.2983651-1-linu.cherian@arm.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214205_594318_C9810834 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Add cputype definitions for C1-Nano.

The definition can be found in C1-Nano TRM,
https://developer.arm.com/documentation/107753/0002
as part of MIDR_EL1 bit descriptions.

This is going to be used in the bbml3 support list.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index e41fae46426b..1fa29616e586 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -100,6 +100,7 @@
 #define ARM_CPU_PART_CORTEX_A720AE	0xD89
 #define ARM_CPU_PART_C1_ULTRA		0xD8C
 #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
+#define ARM_CPU_PART_C1_NANO		0xD8A
 #define ARM_CPU_PART_C1_PRO		0xD8B
 #define ARM_CPU_PART_C1_PREMIUM		0xD90
 
@@ -195,6 +196,7 @@
 #define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
 #define MIDR_C1_ULTRA MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_ULTRA)
 #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
+#define MIDR_C1_NANO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_NANO)
 #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_C1_PREMIUM MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PREMIUM)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
-- 
2.43.0


