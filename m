Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BE1C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woi6xHIfPsARY6TAraovKfAogTZcwZGDkQDkJXYsi7M=; b=LS1fqxvrzsxGQDJysU6h3lNBN1
	5b4nivZVvm/d1SF6+Wc4RIIc7psRYKUjLhZ+Jl0HjXeuOjj9FEVXVbGepwjncEN9yVtQnM0QuvZ9C
	N9yE2pTtkD2APMbWm74bWqNpkAJoVi289BR0Y7ZUCSYq5XRc2Ov4RTQR/iXi4/AkGsokAuJL5knIo
	c0GoJExZMMtJ6K8G/Qhw5KFYACjNiyUHZLNLW3sSmRx6gYsAeD+gIfh9H5ZTzk239wMqOYKy99tEU
	wHRb/r8bFIiYU7c8JP28NwKf/Z5jWSBKOON1/DUkaLd3Yf6sDCoAqH7S/li3zw2/adUljzJrSdP0F
	mfdx/zvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NbN-00000008URj-1285;
	Wed, 23 Sep 2026 14:05:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NbL-00000008UQu-3ryg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:05:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F6EF60210;
	Wed, 23 Sep 2026 14:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696381F00898;
	Wed, 23 Sep 2026 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172335;
	bh=woi6xHIfPsARY6TAraovKfAogTZcwZGDkQDkJXYsi7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HR6Q90vPfYQYUBbKLL/si7wucgPhWMcqErv9Tj3pv1VgVq1cTUokE+larAwdj46xE
	 M2SWCuUcSFSRSK6e3PubTLFkrnkfI7DXa+Orr2/9WquTJODWOcY6kBJ1i9gNllRvKV
	 NNHsR0nE07Nj1fSQd6zFvRl3CJH1bVsNwi1rpkA4W40iGVMerxL8i597mi+45zbvke
	 uzCl9hSYGcQZjznFowvizfS+Pm8bW+xP4wfinbpGFyTVCjJnhrT7v96Pn/9cLyj6gv
	 tZ3yzy++kqdrhbORi3EhyAXJEDznOaTQ62UYR265+65YrG/Xhq11tcxVkoIAlCO8/K
	 Si0QUVv7nnkAA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v13 8/8] coco: guest: arm64: Remove dummy CCA platform device
Date: Wed, 23 Sep 2026 19:34:05 +0530
Message-ID: <20260923140405.1111554-9-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
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

The SMCCC firmware driver now creates the arm_smccc bus and instantiates
the CCA RSI device once the RSI ABI is discovered. The arm64-specific
arm-cca-dev platform device stub is therefore no longer needed.

Userspace now has /sys/firmware/cca/realm_guest as a dedicated CCA Realm
guest indicator. Remove the dummy arm-cca-dev registration.

Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/arm_rmm/rsi.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 29eeb90ffc6b..0fcc4e33bd92 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -7,7 +7,6 @@
 #include <linux/memblock.h>
 #include <linux/psci.h>
 #include <linux/swiotlb.h>
-#include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
@@ -216,18 +215,3 @@ static int __init realm_sysfs_init(void)
 	return ret;
 }
 device_initcall(realm_sysfs_init);
-
-static struct platform_device rsi_dev = {
-	.name = "arm-cca-dev",
-	.id = PLATFORM_DEVID_NONE
-};
-
-static int __init arm64_create_dummy_rsi_dev(void)
-{
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
-
-arch_initcall(arm64_create_dummy_rsi_dev)
-- 
2.43.0


