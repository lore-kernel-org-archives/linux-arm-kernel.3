Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E6EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQMAbQUj8iCcX00cmVzvirLL3hMuCmxUKzghu3Z1kbA=; b=kAHnIA5BHwEA8Mti+BDjgdpxaJ
	csGSl8kha11lREV2ppuH39RusDv2aoQuu2fIeY+L4KDQzNambcYtcgIEt+D6SJfw4lNU7KNXAPB9y
	VJRtdsK9DkLykFW6nySLCZqwvOFG3xf7eMHYVMEBxtxHdUEtm2YJqOQUh0YNznIBvnfvSGnTm4zXO
	MTPKlro0C1YOS4UVlW5gpPjebvRMks8iHEWbFMlvoa3RG3DxALJ3R86XSvWBezNYr9W+QAS0UmXMQ
	wo/VXK+z7V/lkveCbxlDXGj3W1cWsbmxIrQVHmmunZ1Z1niM7pFpT0A/HyJ2ao2t7ZNMmqc8eSYrP
	YvUxOOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Pn-000000059GA-25p2;
	Mon, 17 Feb 2025 15:52:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3DY-000000055XP-0kOp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17C5D1A2D;
	Mon, 17 Feb 2025 07:39:51 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3300B3F6A8;
	Mon, 17 Feb 2025 07:39:31 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:44 +0000
Subject: [PATCH v3 03/19] firmware: arm_ffa: Align sync_send_receive{,2}
 function prototypes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-3-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=4qW9fLAIK65nMpnh87qvF4rVxzPnc+20rA4dvUSmnYQ=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gu7Puq8FsTi5lz416LENDreOz5v7OyPXVSe
 MAvVyPesJqJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLgAKCRAAQbq8MX7i
 mBQ8D/9FoTUxJ10mqJW1QCCvDw2zaRD1zNKIp8ptdL/m8gxImTzVuSy29Sx/P8Tzucs35KikIAL
 04W/Szqr9qtUH6pOi/YogCoA0LNWWamvHMqYGRYhqUu76kXiCJAlTyqFUTQDsMjJvlf1m0OJs6h
 JpLTGnQmtZyJNtHnMJrf7W36A8BbOzAovF0GKnXh9i3dF0nUwJTCHkjuOZCSJMGbejP8YKOEnQt
 Mktk1heaOCihOMCMaFHcELOrIoDXxfjqzPKwY/OUp31JvqJLW5sMeNQl5fBQxdyjrcSiUotHXIi
 nRCqBO9s7MkABh3zvDm1mLizXFXxy2pL+oem86tURZB5S25a77M2uj8jhwib5T01v5GuM3NDJ6Q
 6Bboj+FsqBM7/eCDMvi/ABAd3bQYMnkq0MgE0BBTPivns35h5VCj+BSmehsMGo0YtEh48SyqKu7
 b9nCvpts/PdC8GBtN08vvRwx/fR5sqs2BwbeeM6HakuItUlpVUNAhdFjFQC+8Q3YQZf613OBEzj
 qlOCU6B4rg1Gva9fOIeGfrxzrklfAbof8dkxsjoL5LUcV5lszWUZenIGw5462iomCioEltvjhtK
 DZl3R8EhNzsstvnZ0M43TFmDVZbF9eVzzIMoniXg76j9m2mRkJqFCS/M5TiJwpH+0tWS7DmQFej
 7mS7Dv9alPgfS1Q==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073932_347534_8362DA97 
X-CRM114-Status: GOOD (  10.09  )
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

Currently ffa_sync_send_receive2() takes UUID as a separate parameter
instead of using the one available in ffa_device structure.

Change the prototype of ffa_sync_send_receive2() to align with the
ffa_sync_send_receive() and use ffa_device->uuid.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++--
 include/linux/arm_ffa.h           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15612168cdf0ef94022e00c08677b5..037e0d684994fd30971f40bf139367d1e45c1bf0 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1018,14 +1018,14 @@ static int ffa_indirect_msg_send(struct ffa_device *dev, void *buf, size_t sz)
 	return ffa_msg_send2(drv_info->vm_id, dev->vm_id, buf, sz);
 }
 
-static int ffa_sync_send_receive2(struct ffa_device *dev, const uuid_t *uuid,
+static int ffa_sync_send_receive2(struct ffa_device *dev,
 				  struct ffa_send_direct_data2 *data)
 {
 	if (!drv_info->msg_direct_req2_supp)
 		return -EOPNOTSUPP;
 
 	return ffa_msg_send_direct_req2(drv_info->vm_id, dev->vm_id,
-					uuid, data);
+					&dev->uuid, data);
 }
 
 static int ffa_memory_share(struct ffa_mem_ops_args *args)
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index abd0208f0f74c15ef4ee4c81de81eb7800a0eb1d..e8b8ae8b192ab11d5550c16fd33fa9d192b07f67 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -439,7 +439,7 @@ struct ffa_msg_ops {
 	int (*sync_send_receive)(struct ffa_device *dev,
 				 struct ffa_send_direct_data *data);
 	int (*indirect_send)(struct ffa_device *dev, void *buf, size_t sz);
-	int (*sync_send_receive2)(struct ffa_device *dev, const uuid_t *uuid,
+	int (*sync_send_receive2)(struct ffa_device *dev,
 				  struct ffa_send_direct_data2 *data);
 };
 

-- 
2.34.1


