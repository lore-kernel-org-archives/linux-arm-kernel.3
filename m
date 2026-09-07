Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A61C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Vm/rPIhq5YIWOXLps0PsHxDuttmcCSuI9fizFVIntA=; b=Rs2pG6ATrOHiP4k2tXHwIheKtE
	Gk+EUwWOK9c4a//WAwQmf5xKtd3pYnwMFcKH937qvYRhDchzrTgjYrMRTjF7Swrz1plE3BuB95Xwl
	cm471o0as1hiWosAEuufqKD4lDEhWB/sC9/HDuXSo8rYdKsRfDIqpLFKZnwJ10fQ/LOyQHeZ6jPtH
	ypjp4ppgULiXENJNzZlPjVZsWLUt33nfp2UAgyGO8WMseo0tlmpSGzUSx/1ccMRuYBQE+WF8024IX
	oxtgCKJY+ChHjyMKpXJmmYZqRdn81kj9C7d5yKOQEX40ZyRFmi+rTB+EikjSaPpJUOvvEz98sLvI5
	F0/1jMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W9D-00000006QhJ-2XuU;
	Mon, 07 Sep 2026 10:00:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W9B-00000006QfQ-2zwo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 915ED1476;
	Mon,  7 Sep 2026 03:00:10 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 805B03F7B4;
	Mon,  7 Sep 2026 03:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788775214; bh=3REQ5jWF12CkaqiVLtnquClwniilkFTh6i4V9X/W8Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0NNnupVWVetQC/vx9RJ9UwpkUGwpzRnsMh/ZRIvgHt+mOk9nl819dKIE+ZvGQhUy
	 BQply/fsvQkQWNz+OxKAzFYILQkAcFFFc62hn3afjNrGmhfiyPdqPrmw4a1knt1Oo8
	 +EeUQ0bCZdi67lxEO0ZhxGXTqxCelNU1w59Qv6Js=
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
Subject: [PATCH v17 5/7] firmware: arm_rmm: Activate the RMM
Date: Mon,  7 Sep 2026 10:59:39 +0100
Message-ID: <20260907095942.1140734-6-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907095942.1140734-1-suzuki.poulose@arm.com>
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_030017_795269_55C89176 
X-CRM114-Status: GOOD (  14.30  )
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
Changes since v16:
 * Split into a new patch
---
 drivers/firmware/arm_rmm/rmi.c | 17 +++++++++++++++--
 include/linux/arm-rmi-cmds.h   | 11 +++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index 42c973c3a98bb..d969c8738efde 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -641,7 +641,8 @@ static int rmi_configure(void)
 
 static int __init arm64_init_rmi(void)
 {
-	int ret;
+	int ret = 0;
+	struct rmi_sro_state *sro = NULL;
 
 	/* Continue without realm support if we can't agree on a version */
 	ret = rmi_check_version();
@@ -656,7 +657,19 @@ static int __init arm64_init_rmi(void)
 	if (ret)
 		return ret;
 
-	return 0;
+	/* Activate the RMM */
+	sro = kmalloc_obj(*sro);
+	if (!sro)
+		return -ENOMEM;
+
+	ret = rmi_rmm_activate(sro);
+	if (ret) {
+		pr_err("RMM activate failed\n");
+		ret = ret < 0 ? ret : -ENXIO;
+	}
+
+	kfree(sro);
+	return ret;
 }
 
 /*
diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
index fed0f3421895d..dea7c7004d35f 100644
--- a/include/linux/arm-rmi-cmds.h
+++ b/include/linux/arm-rmi-cmds.h
@@ -64,6 +64,17 @@ static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
 	return res.a0;
 }
 
+/**
+ * rmi_rmm_activate() - Activate the RMM
+ * @sro: Preallocated SRO context to be used
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rmm_activate(struct rmi_sro_state *sro)
+{
+	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
+}
+
 /**
  * rmi_features() - Read feature register
  * @index: Feature register index
-- 
2.43.0


