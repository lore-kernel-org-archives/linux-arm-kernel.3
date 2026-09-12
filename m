Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DDFC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQV5Vfy4A2GyXUIjNr6Obdf19gVUHdsQEgheAovA9Zo=; b=ool+D0XI3wyAHyOq0tEopZ5Asr
	ka8Iza0LLsUJ57f9n8fodIPAPgcYpMX7oimuT8vLAuZL6EDp4Ym/0+jJEFOEaom7Rq4QvyOv1s8OJ
	cjxbolA8rGBKKWSMBYnQYbr8o/3H/CyBPjw4xrx/5glmPh8H431eEFpduYDq6RwpDr4qmFtLTAFWk
	iWfkWhQjbemxwls6pNOJDgjrJKNWM2i1EAQ9mrBI3XUEt5FMi5W7eKQEAGN2SxpgzN0CfkIZAbfkG
	rPs3Lha6HTjN3a182xd8eEXUYUC8igoepeUzUTwskjFj76VfW5LxAOxIHueGdOTJCJRRRi879doO7
	qo29NwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5JER-00000000hff-3341;
	Sat, 12 Sep 2026 08:37:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5JEL-00000000hal-0Nkv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 08:37:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C591713;
	Sat, 12 Sep 2026 01:36:56 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8FFE03F7B4;
	Sat, 12 Sep 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789202220; bh=GjkCl1rRW7deuJHjwHozpX3OphQOimiRmcFSba0i5JA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jIKI18y4TRh5WEcxO3W2cqoEVHu0yXk9ZcbJ4vvk1jxmzn6MqUTsfuPGLy4UwQgEZ
	 psCeT8GFGA8Jxa4zw5RvRdaSQD/5CrF7z4KKWb1W0vNweKMfjkKlPpQifL0FmDH1Tl
	 yFHjlKSwU2NBA5n/++dVeSiEFf81GEW48KA/6CYs=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v18 5/7] firmware: arm_rmm: Activate the RMM
Date: Sat, 12 Sep 2026 09:36:08 +0100
Message-ID: <20260912083611.2513845-6-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912083611.2513845-1-suzuki.poulose@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_013701_179565_DB04EF96 
X-CRM114-Status: GOOD (  13.10  )
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

From: Steven Price <steven.price@arm.com>

Activate the RMM after the basic configuration. This is a memory transferring,
stateful operation.

Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v17:
 * Inline RMM_ACTIVATE command and remove the definitions from arm-rmi-cmds.h
 * Use scope-based cleanup to free sro object
Changes since v16:
 * Split into a new patch
---
 drivers/firmware/arm_rmm/rmi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index 4f9898ece7547..ecc89e91d264d 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -762,6 +762,7 @@ static int rmi_configure(void)
 static int __init arm64_init_rmi(void)
 {
 	int ret;
+	struct rmi_sro_state *sro __free(kfree) = NULL;
 
 	/* Continue without realm support if we can't agree on a version */
 	ret = rmi_check_version();
@@ -776,7 +777,18 @@ static int __init arm64_init_rmi(void)
 	if (ret)
 		return ret;
 
-	return 0;
+	/* Activate the RMM */
+	sro = kmalloc_obj(*sro);
+	if (!sro)
+		return -ENOMEM;
+
+	ret = rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
+	if (ret) {
+		pr_err("RMM activate failed\n");
+		ret = ret < 0 ? ret : -ENXIO;
+	}
+
+	return ret;
 }
 
 /*
-- 
2.43.0


