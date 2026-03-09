Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C02EFCD77
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUCWKhTa7EOpHE/mW6VCeQHSBgGwi3T4hXafRQ71YmI=; b=N9ufpHMLeqbw3R47g/d0cT2RUf
	Syd7oIx/uwQ9RYPkuLmPeYTeNWymBVAjbSwOLZeCxiAIrBKswxR2N6RHm4NhrDcwXwJO/IkDRSo8z
	Lqd8nHdhUxyNiOuezmbWjXMySOMy7boJ8R2xTIuyzT84ikZK5G1x1T8UPHuSWLgYS3kwz1Xqf2aqW
	s5AAK7qxghHqcX01lW2mjaL5Yp+5J3m/iQkkmYfXz34cNIVpzJhy8Wus3bcnmKPaBdestaLxjPWQj
	yNvU8IgfdkhhXVO9hccx91Nb5j0kG5RMQ1ZOXJXgHR4h9/QGg7wETp46Xrc9dsWAfOHpU1OcLQh7P
	4SJv9hwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXUa-000000072wL-40R8;
	Mon, 09 Mar 2026 10:05:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXUZ-000000072vZ-0As8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:05:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8130340A06;
	Mon,  9 Mar 2026 10:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D72C4CEF7;
	Mon,  9 Mar 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773050738;
	bh=C/zPRRsYTBI8Qp8SK8L/HdVnrLbMCEtXVMtLu+bv/Ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5TTbvDhdKkkIIebpGB2cvg1VfJRLrHhJ8LT2UlCzDeI7R7L2RV2PgKstpFjDfRA4
	 ofcnLr55pDiyURX/MM1tjBl13RwxYN+t5DWAieNpxU0mmEdSrHxcRcZMAm1ygh9VYp
	 UoJhvdEPMcephwyaKi/2fCzFzLioDV8Ayifltu5b608OjCjvbbPwJg3PXICHkhcTuK
	 zxpktAzjm2ve3ouzUenlicK+7U0jW4yO+O/CmzcNv48S+yZzJqxIi1McgBCI5Vpnr4
	 g7iWwYZ/gz9b+lYpyRxyf+cQ4gKZpbvz8iddP5uAOAvqLwqQimlaQHUi/0c8LRnpqS
	 C/pIrSnnSHZSg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 2/2] coco: guest: arm64: Drop dummy RSI platform device stub
Date: Mon,  9 Mar 2026 15:35:07 +0530
Message-ID: <20260309100507.2303361-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309100507.2303361-1-aneesh.kumar@kernel.org>
References: <20260309100507.2303361-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030539_096718_5D88595C 
X-CRM114-Status: GOOD (  10.87  )
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

The SMCCC firmware driver now creates the `arm-smccc` platform device
and also creates the CCA auxiliary devices once the RSI ABI is
discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
helper redundant. Remove the arm-cca-dev platform device registration
and let the SMCCC probe manage the RSI device.

systemd match on platform:arm-cca-dev for confidential vm detection [1].
Losing the platform device registration can break that. Keeping this
removal in its own change makes it easy to revert if that regression
blocks the rollout.

[1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/kernel/rsi.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 5d711942e543..1b716d18b80e 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -158,18 +158,3 @@ void __init arm64_rsi_init(void)
 
 	static_branch_enable(&rsi_present);
 }
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


