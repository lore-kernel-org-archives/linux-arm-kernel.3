Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52212CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zObupp2RNNSad7qtEOjDivWbCOf0SPd1ZigUY4Jp2hs=; b=LmPpGVYPYbkgDQx/qoSOb2NKBT
	F/G0BNV7XlMBeE9iSSKyUo9w4wTj8gHp/J+/UVCe/gAYXop9put0DvEfG4QlvQg5268djjhMfsJoR
	XtPWY2XXzTTcUzAlMIwWgWcnBoAJ3vO2/HKepkV/27uA1m6d2fBX3heFAOZ5A7PdETH5QD+gO9oN8
	uAl7scSMivmOx2FGaf+5rqn9CamUhJ/nhrc/GkWCyAdoJy4ocp5qxBBrq5FeVOATs3DAMbuj9rTYx
	3OFGiSBTW99A9VtFXApIIpln0kFZWIqADriXUDSOmioV0fXraXZC+RheELZQk/m44YUdCcI3bqHvn
	e5KfXZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEe1-00000008bRT-0OYv;
	Thu, 01 Oct 2026 11:08:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEdy-00000008bPZ-1qfY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:08:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11699497;
	Thu,  1 Oct 2026 04:08:02 -0700 (PDT)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC83B3F86F;
	Thu,  1 Oct 2026 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790852885; bh=IbyIhRdAEyhpQjWEVXWjjx2CVaRvxMBjRy4Q02Hak+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SWdw0XunzW2EjZ+o5+edmWpFPGdsvLCmQkI9UtqXwT63EO0D4lqBNbglche4Lkgee
	 CUMNbPyAhI3rKNWxML7M/0u7CgcMOh+AGTBtodQUlHL1Y8RWaQbBOMVO8vSKsQiwIY
	 PgTCg32d9DSH5QDUgz7wlyXX9bUkcQ2QdsQU+Mbo=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [RFC 08/12] efi/arm: Check return value of init_new_context()
Date: Thu,  1 Oct 2026 12:06:51 +0100
Message-ID: <20261001110655.461473-9-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_040806_533903_42EB5A56 
X-CRM114-Status: GOOD (  10.17  )
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

init_new_context() will soon be able to return an error. Check for
errors before continuing.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 drivers/firmware/efi/arm-runtime.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 3167cab62014..7ef29cd0bfb7 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -55,7 +55,8 @@ static bool __init efi_virtmap_init(void)
 
 	efi_mm.pgd = pgd_alloc(&efi_mm);
 	mm_init_cpumask(&efi_mm);
-	init_new_context(NULL, &efi_mm);
+	if (init_new_context(NULL, &efi_mm))
+		return false;
 
 	for_each_efi_memory_desc(md) {
 		phys_addr_t phys = md->phys_addr;
-- 
2.43.0


