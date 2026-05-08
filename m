Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D98CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYm5HTkenCmNOalFIIeUfK2CLlalNfbosIxFnkv6chA=; b=SOxCewf0hvb0BFx5LsGx+U8at0
	hc9YVP0oY0+NCckkKkd1sZCVcBX93QV9+imuXlMhf45DRpEsn52UWU5mpBzZ5g+AWO8PEI18MpZBu
	fCq8KBSW/RoYgh2kN/8bdBDjR82YwcOHwzpuJpshj49sIfvQyU4PWHhcWcgqBY//RStmXaHAPkMmV
	BRlcPXNfSE5GPtVjk6VU/bC4xKrkZz4JHgyigABcw2TuVI4e1/bnd49WPET+AEVqYYmKuUtHwtpK6
	uRYRSpmZKkC/+JXZqoYDZR9ThdsbD/dWIStH5JDQmpmVt5BPYpNfVrEaGQomnL+oOY/n173MXntVI
	gE49dftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPd-00000007Cag-1iEx;
	Fri, 08 May 2026 17:54:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPa-00000007CZ2-2bSB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2F496024D;
	Fri,  8 May 2026 17:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642DDC2BCF4;
	Fri,  8 May 2026 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778262893;
	bh=VfeMzXxIblsKxvlWKcJteZkeQp7sM+pCydv1aje8okc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cKrb0dUEWFnriGehqYSX4zQQL9iWfQmtv8wNfJ9dbay2K3d3Ok0Om1aHk0H4g8hWv
	 tUYHMEBVI9ReomR4aPTTa0GXp5t/Rx7T+nH67Eit4m2PyHZS7gc8Ay1oVbN1KrStbf
	 i4WycSaOVP373FqPSZo4NFou7OZbOcsiWXuMVb4/DsH/+wqLHW8plnWrzd3KQqOXJQ
	 58rniNWNyais+DTMdfjAh55smCxHH1OUdXRGiXfyjSJa4e/Pj22HsQ1WFSrHCX+Wgq
	 JFKqljIM1d/aQ0lguLEUm5h+n585HfrTKIQpE3q7UiG1BdQVpywWv+NwTi5JSMizdh
	 HR/A5mOYtAYKA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 08 May 2026 18:54:17 +0100
Subject: [PATCH 3/4] firmware: arm_ffa: Set the core device as FF-A device
 parent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-b4-ffa_plat_dev-v1-3-c5a30f8cf7b8@kernel.org>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.15.2
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

Pass a parent device into ffa_device_register() and use the synthetic
arm-ffa platform device as the parent for each registered FF-A device.

This keeps the enumerated FF-A partition devices anchored below the FF-A
core device in the driver model, matching the platform-driver conversion
of the core transport.

Suggested-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/bus.c    | 3 ++-
 drivers/firmware/arm_ffa/driver.c | 5 +++--
 include/linux/arm_ffa.h           | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 9576862d89c4..e05fe0b6049c 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -190,7 +190,7 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev)
 
 struct ffa_device *
 ffa_device_register(const struct ffa_partition_info *part_info,
-		    const struct ffa_ops *ops)
+		    const struct ffa_ops *ops, struct device *parent)
 {
 	int id, ret;
 	struct device *dev;
@@ -210,6 +210,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	}
 
 	dev = &ffa_dev->dev;
+	dev->parent = parent;
 	dev->bus = &ffa_bus_type;
 	dev->release = ffa_release_device;
 	dev->dma_mask = &dev->coherent_dma_mask;
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 97ecdb5dac09..e9d7dc71c06d 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1688,7 +1688,7 @@ static int ffa_setup_host_partition(int vm_id)
 	int ret;
 
 	buf.id = vm_id;
-	ffa_dev = ffa_device_register(&buf, &ffa_drv_ops);
+	ffa_dev = ffa_device_register(&buf, &ffa_drv_ops, &ffa_pdev->dev);
 	if (!ffa_dev) {
 		pr_err("%s: failed to register host partition ID 0x%x\n",
 		       __func__, vm_id);
@@ -1758,7 +1758,8 @@ static int ffa_setup_partitions(void)
 		 * provides UUID here for each partition as part of the
 		 * discovery API and the same is passed.
 		 */
-		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops);
+		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops,
+					      &ffa_pdev->dev);
 		if (!ffa_dev) {
 			pr_err("%s: failed to register partition ID 0x%x\n",
 			       __func__, tpbuf->id);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 81e603839c4a..17eca3dfc59e 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -173,7 +173,7 @@ struct ffa_partition_info;
 #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
 struct ffa_device *
 ffa_device_register(const struct ffa_partition_info *part_info,
-		    const struct ffa_ops *ops);
+		    const struct ffa_ops *ops, struct device *parent);
 void ffa_device_unregister(struct ffa_device *ffa_dev);
 int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
 			const char *mod_name);
@@ -184,7 +184,7 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev);
 #else
 static inline struct ffa_device *
 ffa_device_register(const struct ffa_partition_info *part_info,
-		    const struct ffa_ops *ops)
+		    const struct ffa_ops *ops, struct device *parent)
 {
 	return NULL;
 }

-- 
2.43.0


