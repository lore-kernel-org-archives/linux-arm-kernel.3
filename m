Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7851DC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYak8X6Q13HPsC1Bl6EKAXDPRPCrDDw0VT53ybVmYVg=; b=KhuiQ9GzeKsk9LGL1zj33iiqfq
	bgaGZGAGWJqQlwcBcNnbnCyg+Nl+GbqY9dIFtExhDHmyzodzKgqHMcPPZtcjbL4cDf2G+2jst9PTM
	xuADH3WiHFD8Ru2tJhgOloRxH/jpJydSq1I94ixOvVUY6ZeWhi+0BtjuQEymyTrXObhLi7owPnY8h
	xCwv9y5bLLBUafwrGv4WfR/gr0sqQA6skRnEy5Kby/UUb2djuGf1J1zWrPGT66WvCesjzpLg+IxAl
	l634M45OwAky1l72ikFQDiXT7DdwG0ePsAKY+aR2bEK0QnGfp30nKgrbC7N2w636idtSqN0uFqXjZ
	K57Jj+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpKb-0000000AWOX-4Aif;
	Fri, 31 Jan 2025 11:37:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp98-0000000ATpA-3APR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3C3FFEC;
	Fri, 31 Jan 2025 03:25:39 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF05F3F63F;
	Fri, 31 Jan 2025 03:25:13 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:08 +0000
Subject: [PATCH v2 08/18] firmware: arm_ffa: Unregister the FF-A devices
 when cleaning up the partitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-8-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=UyvgBew/9tfLcZTn4CJGNUBHLEV5T/tT9Fwl0cys6ss=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQqaN7Qz/8kQqhg3bwymtxpJ4DdZKymS/ur
 Pi9HREHP2eJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mH9oD/sFu8KvmYaFZMVNEp29ZDpfdQ0JBLAKchZ3shUPhvssBGWtHRIx4r19b687HlskCqk5tSR
 UIlNF8yoxe9G2fWwC2jzo1HoCv4DWfUV7m6l5eewG2eX/ocG3TyPjSYW3wbKEgn12sByyDuTKcu
 KMFGBVWApYmLKcvjRvzl69kI8537oWPh+vgNx++fklElrklytUUn4mFan4n4jQyVmkSlXTZkVsu
 S9bbRmCV4cB0iVijF3ccOtbBMSrYn6sI7Afmsn3Bb9zgsmJb1gij/dXeqvYXDA/Mj1gq7ECZqax
 TbTwRxnIYPA0kMK7KceHgwgHQ7XaiwNhXCCgjKlRAv14dbDHvdZ1E0Av/7x9OMV1lKcykIiSIvr
 gx/qQcPKn4CI/oOxzlIgKX7aHgGehj1eedhpeGtoh7m8HPIdzMsgPeTs8zeW2eaJFojfyxrQDxD
 mhJ43qrYVZjQtvrsxxRMWtbTqBLK2yu2+c2ya25fQfrv2Bo0rJr0v2oqu5rKi+2/YCeEERoXjLl
 hLBK5tMkyF0yJ7neDJyku737wkaAdfzI0IteFDkrcAOEyoGXOKSUHEl5UWyUYbtvYn7YiYYiTrs
 3wd/u/mgQz+iYK1+Yv2WU1wg3lSALjVbWCprvhmdjjB7Y1WmL1ZSBS/yy9QEgjFoqXYS6ps9/Qu
 75K+EWIzwqCn5Pg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032514_893464_B01F6351 
X-CRM114-Status: GOOD (  13.12  )
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

Both the FF-A core and the bus were in a single module before the
commit 18c250bd7ed0 ("firmware: arm_ffa: Split bus and driver into distinct modules").

The arm_ffa_bus_exit() takes care of unregistering all the FF-A devices.
Now that there are 2 distinct modules, if the core driver is unloaded and
reloaded, it will end up adding duplicate FF-A devices as the previously
registered devices weren't unregistered when we cleaned up the modules.

Fix the same by unregistering all the FF-A devices on the FF-A bus during
the cleaning up of the partitions and hence the cleanup of the module.

Fixes: 18c250bd7ed0 ("firmware: arm_ffa: Split bus and driver into distinct modules")
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/bus.c    | 3 ++-
 drivers/firmware/arm_ffa/driver.c | 7 ++++---
 include/linux/arm_ffa.h           | 3 +++
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index a90e2faa990219574ff20b8f573dbb7ca76137d9..98118823cf84969480fc25c937881f9b773a38c2 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -160,11 +160,12 @@ static int __ffa_devices_unregister(struct device *dev, void *data)
 	return 0;
 }
 
-static void ffa_devices_unregister(void)
+void ffa_devices_unregister(void)
 {
 	bus_for_each_dev(&ffa_bus_type, NULL, NULL,
 			 __ffa_devices_unregister);
 }
+EXPORT_SYMBOL_GPL(ffa_devices_unregister);
 
 bool ffa_device_is_valid(struct ffa_device *ffa_dev)
 {
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 54777055d54f5bf2dba1128e6a91bd1c0ece04fc..1df1c28978a5e70c31d5136e43033635c515e261 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1495,10 +1495,8 @@ static int ffa_setup_partitions(void)
 
 	/* Allocate for the host */
 	ret = ffa_xa_add_partition_info(drv_info->vm_id);
-	if (ret) {
-		/* Already registered devices are freed on bus_exit */
+	if (ret)
 		ffa_partitions_cleanup();
-	}
 
 	return ret;
 }
@@ -1508,6 +1506,9 @@ static void ffa_partitions_cleanup(void)
 	struct ffa_dev_part_info *info;
 	unsigned long idx;
 
+	/* Clean up/free all registered devices */
+	ffa_devices_unregister();
+
 	xa_for_each(&drv_info->partition_info, idx, info) {
 		xa_erase(&drv_info->partition_info, idx);
 		kfree(info);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e8b8ae8b192ab11d5550c16fd33fa9d192b07f67..ca2ad5b0ac4309052d55dcf546d29423bbd40a67 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -176,6 +176,7 @@ void ffa_device_unregister(struct ffa_device *ffa_dev);
 int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
 			const char *mod_name);
 void ffa_driver_unregister(struct ffa_driver *driver);
+void ffa_devices_unregister(void);
 bool ffa_device_is_valid(struct ffa_device *ffa_dev);
 
 #else
@@ -188,6 +189,8 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 
 static inline void ffa_device_unregister(struct ffa_device *dev) {}
 
+static inline void ffa_devices_unregister(void) {}
+
 static inline int
 ffa_driver_register(struct ffa_driver *driver, struct module *owner,
 		    const char *mod_name)

-- 
2.34.1


