Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E4CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abfUfSyO0Ovqz60dSjdmWlKLDKX9WWl1WsL2R6WWMKY=; b=VseietXy1s9sbNcGfHpEkdfGc3
	1/UN67u/1KZEA5UrdB+tN63HPY7zLAkswKkMgfwIx1bdsSzb0V43pVrgRBZiflVSpaFsXqKlYBq2g
	xDZHGu6ywbTGNT9QC0tragHO/Um+U3AOvPBQ1NJoc6RSefRqEHK1sYmenuugg/bzkOHZnJi8sIpwf
	EfnhrDHY9ZHNLt5WKzSZAmduHz61k7QLgmsNNOSfKTLi4Vv+uXTMiJMqfS92/neD5hviQsKxyiSOL
	h+7uY4xdsm+IUZJFmqeCDhJslpJWGGZckMVmaSiyFKQD1o8LwMLxSkn6SnyczOzHqiFO6FFnLvmwJ
	JNrkDO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpBe-0000000AUUq-3qVX;
	Fri, 31 Jan 2025 11:27:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp93-0000000ATo5-1P0z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D07481007;
	Fri, 31 Jan 2025 03:25:33 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB21C3F63F;
	Fri, 31 Jan 2025 03:25:07 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:02 +0000
Subject: [PATCH v2 02/18] firmware: arm_ffa: Replace UUID buffer to
 standard UUID format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-2-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=an0T8BaHmmjnOIWFrg0XcNclda/TDCEpL5ml8sjKwio=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPvsTuXlYTc75Eg3d1Qp62BX2OhJ9rXBo1N
 ddU03iBR4OJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mIpVEACLNNX/8+chGpqM9MPBuCAooVDzcLaWm3lQnrrmEwQ+PbGHAqdrGo+tDKF7W3eklxpVXK7
 QAZvGsVXzkVbIdYQzRkn8N76ysNopUkNIC9fhVYfDCjNpxi1QazaeusfyskztdqRGURwP4wDnJt
 zDA6skVjvdoOiBDHRWvkdZ/7lXu/EL4QPDvyusVYiK9LCUOUEpZGaVYI13+IWGbqtstufisPX/F
 rFQgM9iKwPiAJ1EFxc1xkauvDcHaiwt+f6FvWW+xq4TrXg1+DcYV3OdxxWzQGSnSFIl+5UHSTg4
 0z3Tu4jeS8hysbBtN4Baih0/BNBQVrsgf287rYs+VxaUHnQSQUmS7oqtCBwj8lMf2POxbh32g+W
 02+z0tsk4nnLIOs2fcYwUm+O0Q1/ANrkwteaX0AHJuS+PbDvnFJJYalYwC/auIO0gBFh1u2sof4
 LbGiZRBiaVo0Kc2uEMXGd+GuqCykagTct9ZQQlD/E53ihlO0a/5vY2ghCYDjFHoJhUfwltAKLfV
 g0fUt0OZ6OtOWOt2215nBo9lM5zgXeY1RNwph/jfD7KWUHRfQQTtCLX1JCaJo6dhUsTmJ8FJxze
 tujiPj20cDuAGsCbQO45fcnRath7xuX5D/wtFSEnyLVvp84IP3o4dqb7cz+PiKS7Ujy6tAzugpP
 WdXWHUZHAJ2ooxw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032509_420584_35BEB709 
X-CRM114-Status: GOOD (  11.55  )
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

Currently ffa_partition_info structure holds the UUID in the format
compatible with the firmware interface. However, most of the functions
in the FF-A core driver deals directly with uuid_t type.

Replace UUID buffer to standard UUID format in the ffa_partition_info
structure.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/bus.c | 4 +---
 include/linux/arm_ffa.h        | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 52b1f09209a0e51e321cd23a69aa7e4c4daa8dd1..a90e2faa990219574ff20b8f573dbb7ca76137d9 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -192,7 +192,6 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 		    const struct ffa_ops *ops)
 {
 	int id, ret;
-	uuid_t uuid;
 	struct device *dev;
 	struct ffa_device *ffa_dev;
 
@@ -218,8 +217,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	ffa_dev->vm_id = part_info->id;
 	ffa_dev->properties = part_info->properties;
 	ffa_dev->ops = ops;
-	import_uuid(&uuid, (u8 *)part_info->uuid);
-	uuid_copy(&ffa_dev->uuid, &uuid);
+	uuid_copy(&ffa_dev->uuid, &part_info->uuid);
 
 	ret = device_register(&ffa_dev->dev);
 	if (ret) {
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 74169dd0f65948b05991732358855cdc31b54adb..abd0208f0f74c15ef4ee4c81de81eb7800a0eb1d 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -238,7 +238,7 @@ struct ffa_partition_info {
 /* partition runs in the AArch64 execution state. */
 #define FFA_PARTITION_AARCH64_EXEC	BIT(8)
 	u32 properties;
-	u32 uuid[4];
+	uuid_t uuid;
 };
 
 static inline

-- 
2.34.1


