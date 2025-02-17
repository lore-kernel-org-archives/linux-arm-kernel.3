Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8196DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feOWQiVTfcgj6k9SopBCC1ZQ3AfHJw5e9aA+GLfs3SQ=; b=Y3tEO8iejp+1CUEYH8BBz5KSvM
	oeatZpBZvChctDUCAa1avU8Evz50iScaOFxplH4yaPThaH56fDB3v/r/p8QV55oIt42JruAGQ/orG
	nNDVqRdFFjiOo+ww23OvYEbS2BdwA2jxmc/RTWeRFpruZ1gj5Tq1RuXUZ4FgJToVcM8myiQFSaW7z
	xy7XaYW/0ylISXEKPrSe/G1AD+yQxsUt8QuLiznwYOLujzVSQQE8EzSsvqrHt0o+6Akr2WCMrhwmk
	oIsDijWxCF/IdNCj2usJ1QdCMPeIsak3OlBhAqRw5H0iPr5zdh9cTYF2EtrrCeCtvt7ZvkLfi9Lsl
	cvgQ4kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3OM-000000058rG-37FP;
	Mon, 17 Feb 2025 15:50:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3DX-000000055Wl-1FXV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10D8B176C;
	Mon, 17 Feb 2025 07:39:50 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C96B3F6A8;
	Mon, 17 Feb 2025 07:39:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:43 +0000
Subject: [PATCH v3 02/19] firmware: arm_ffa: Replace UUID buffer to
 standard UUID format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-2-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=41/PckYdXDOTJF8iWlnuSJNwd8OQjt77Kk+5Anq6r5U=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gujyDHIKZMNG7950DZexKR3aYwMRvLGf/k2
 G9mgUW16smJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLgAKCRAAQbq8MX7i
 mHZ/D/wNF9tM7wzyNXUygi+AGta04YEYaQ9RmT6Vh64PQoapjffroFoi2W0QDJXXUqepbb0ErNE
 JzO6MLjbqRP6H4Q+cWQNZ9Fl31BbbIUpwiqMTyeDir/1dkSrSQ840i9DdBaSzVmrcZPs+vJ2BFN
 YjTqjoUcjZgvySN61u6M2duPKrARh02IPJ9WJMadGipV6vGW/sTzX5zKBkW8noYZT7TayLrNrV4
 8czN/yo359zKxTqAIcoUJTenDgEJ0ubrEBtpnvpdbwm2AOniqlqJ4nkNd9dVZn2ox/CwL8mu71V
 re2GamEvkh2pRLD4+/4wdzmO6uMwReOSxsfNUiR/hb069YcwVF45gpoQeyOGDWrDLfY/vb+Gzfx
 u5WbcDoMBQ+fkO88uM2OVn7bAw7QUNVFZZYqbRAb81GyqSgYa7yG/0Zoi5/WzzCvA6xFji0w0lA
 pRqsrZRRLNBe9bMp2BM+pWz658nenMeXjZ2vhciYYZgKmov7jkTO4kN/PYS8pryqZNCe0OdEN9E
 +FGeSUk7MVr+RpWXSefHEU1WDThFV5hHUgjXQ4db+nOFCm/dk1IUU2+P83NujIVDo4jMrragsFJ
 m6jNPesiCF5ho35L2AQhYY7/QyzFSSPymBMEkcrEcfzWpS8nw/woTXdnus6N6JlxkoCqEhvXTx4
 +AR8N6sI/Z+ixXA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073931_383206_14609182 
X-CRM114-Status: GOOD (  11.64  )
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

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
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


