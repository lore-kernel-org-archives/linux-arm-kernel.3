Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7489CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7V9tDU1/1HvxNDMubJQEDTw1e7DsKqdrgyUA9jJ09E=; b=Goy6dEbh+A/QbHpzAy6XiPpjtL
	MlCtUwScR24y9whM7RKrvooc5hxL/e1r66FjOl/bdQ2nLuTesh5PAsaOLiz/GQiUH8p0OrmvjdArj
	+w9bCzX5095pbR7Vh2VdljRJ7RgTiaA+3jUHLi1mL7FYxwS+f3bLTR5x9gSf0wcCW4Y/9Hze0TKpj
	wM5eIdwZHXE52OE8V6GgtBP8tAeE18kJhP70vGFNz/0K+2hhspNGj0RJy8IwqHl5K5DsvnI7w7A9K
	lLc6/2VghJrtBATB9h2gJmAkswf4MLKEE3PdHftBUx5B5CotKDo3EnfRLxJaqeFA0I8Vp21Uh5bUK
	rDbdntTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCU2-0000000FjHB-0xag;
	Tue, 05 May 2026 09:54:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCTy-0000000FjEk-47th
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:54:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730B02936;
	Tue,  5 May 2026 02:54:20 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69B913F836;
	Tue,  5 May 2026 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777974865; bh=4nvhu4KAJ7LtpMJY0gVvOuCsbzZGn/1A4ku8YNtiEaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FXdmqVg0kNK0cAin2OYhyQqWd8VwTfkngKBLCMskRN2gyzf3RJ+xeiof/NVsfvkT8
	 ZNqhtZTJU1kx5Cmk56yDdgmon5C+VSHFrDes2B19O9lBz+CrHalxT5FH/MUZdSvtLp
	 07d8SFQSfMTNWwDEnF2EgLYSwOxuOhf/xgNu50oY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: jarkko@kernel.org,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 3/3] security: integrity: call load_uefi_certs() at late_initcall_sync
Date: Tue,  5 May 2026 10:54:09 +0100
Message-Id: <20260505095409.1948371-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505095409.1948371-1-yeoreum.yun@arm.com>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_025427_077382_265BD714 
X-CRM114-Status: GOOD (  11.84  )
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

In the arm64 pKVM environment, all FF-A requests fail until the FF-A
driver is initialized, as the FF-A version is not negotiated with the
hypervisor beforehand.

When FF-A is built-in and pKVM is enabled, pKVM
finalises its initialization at the device_initcall_sync level,
while the FF-A driver is initialized later at the late_initcall stage
via deferred probe.

When the EFI variable service runs with StandaloneMm, it uses
FFA_DIRECT_MSG to access EFI variables. As a result,
load_uefi_certs() always fails in this environment.

To address this issue, defer load_uefi_certs() to the
late_initcall_sync level.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 security/integrity/platform_certs/load_uefi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index c0d6948446c3..cc2b879df5b6 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -235,4 +235,4 @@ static int __init load_uefi_certs(void)
 
 	return rc;
 }
-late_initcall(load_uefi_certs);
+late_initcall_sync(load_uefi_certs);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


