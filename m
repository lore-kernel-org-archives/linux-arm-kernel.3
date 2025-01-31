Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E073EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4e1w0UiwzvS/VaZk95hJLBSvLj/pgI4SOYUrT2uJ/A=; b=u9x557Ol7qcxxOcS5P8wnjMov9
	KuOfSlqnHp+qjwNyE3S1gPXRgH4WE5A6A4EHZ/c4UPhfD2DsA4nOidzuJUrkyPtp0Dr+luXGE0C+9
	EbitknIaJWORuJeyDNxlrR2pTo9D7qSTpUD206MnAjwLAeL7pbBPuD6w8ugiYsWHYrah0i2F687Y/
	fTbzgS8y9gTRzBvr24yM1Fgteg4/hdvJXcLTOKjz9Qj8Eiv2aZTjBoppLtUlu/rjaSTN4YF2frlof
	s1NEJbL95tctQEN+vMz6l0kV0LO9NdPsAJI7wiZIRQG8lc57mOSQAgdeQXh77Hcf/X1ts/3Gk93kI
	RK1VLubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpNA-0000000AWlb-0rVc;
	Fri, 31 Jan 2025 11:39:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp9A-0000000ATpA-3NmK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BAA3FEC;
	Fri, 31 Jan 2025 03:25:42 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB23D3F63F;
	Fri, 31 Jan 2025 03:25:15 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:10 +0000
Subject: [PATCH v2 10/18] firmware: arm_ffa: Add support for passing UUID
 in FFA_MSG_SEND2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-10-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=Zj2TkPNqsSsa5DJ2pfRSYerk4zU4yhZyjFL52P7Ncog=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQKXoFWtleYV0WN6Euu77keN8tM7DdVu/7Z
 ISUrF9h052JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mH7zD/4387ZIYz9YjJT4e7WGpbXh/Y3Pz6EFuvhCwZTbqZH5JYwGEgbu6SZnugGnjd0L20Rnlo/
 ZcWxfYWHy6j8m3urj1cczv6nw7yagMVL8YUGC34f9ZDC8u77kvwgUw4UQDOgo4H1yxxJFDlhDwD
 b/3dvPCzKaxwb9tyOtsgKEdxMbD3EJ4d9Rhma9Kqko9BZk2RyhNG6ewzp7VdOxv4fGWA2RwjbFE
 4LOnWyhpvjwUjLdT+96HsTJvXUprCmmPOZM3SMyLF1amYKG0KupF3W44MTbP62o4Ukox2taRues
 x8CFbUNR3nav/3Ozr7PCO7rEDplTS1bwyQtwdEgWUM32i+EaHft0SvNu8AYdwJD9R4KA7yquGfM
 fRf/uUiEnHdc3Xeex2ONaWaGdeR7YBW/c6NKXpbH4ElW0x0625y29/2c+I0PNMIQdaeJN0YXpeP
 n5iZsCfxh8IBHe7OEWTi9fcB1ALsw+Qn6mcd3Xs4IY0AUhxPKD+g/oWPFjrhPbuZtqu5W0nCv0N
 7oTlM61I2LJPeUtxqN0mlWlDU2AfNqVqZHDUvX1we6RxwfPq4C7DATD0a/BMQrR7OUR/u+lNh/Q
 6jBuDpGLzlYsCmS/fqu95HWmfqypzg47lwH4zkOdaew3hnt7CMNY76u5Ta343jRWJ4u1ZaA0G6+
 ARJiK7NSKFaNNNg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032516_941234_CE63E7FF 
X-CRM114-Status: GOOD (  11.48  )
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

FF-A v1.2 introduces UUID field in partition message header used in
FFA_MSG_SEND2 to enable partitions/endpoints exposing multiple UUIDs.

Add the support for passing UUID in FFA_MSG_SEND2.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 7 ++++---
 include/linux/arm_ffa.h           | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 1df1c28978a5e70c31d5136e43033635c515e261..cbe0fe5f22bd8c60f3070f5e45d8722e3c9c23c8 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -484,9 +484,9 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32bit,
 	return -EINVAL;
 }
 
-static int ffa_msg_send2(u16 src_id, u16 dst_id, void *buf, size_t sz)
+static int ffa_msg_send2(struct ffa_device *dev, u16 src_id, void *buf, size_t sz)
 {
-	u32 src_dst_ids = PACK_TARGET_INFO(src_id, dst_id);
+	u32 src_dst_ids = PACK_TARGET_INFO(src_id, dev->vm_id);
 	struct ffa_indirect_msg_hdr *msg;
 	ffa_value_t ret;
 	int retval = 0;
@@ -502,6 +502,7 @@ static int ffa_msg_send2(u16 src_id, u16 dst_id, void *buf, size_t sz)
 	msg->offset = sizeof(*msg);
 	msg->send_recv_id = src_dst_ids;
 	msg->size = sz;
+	uuid_copy(&msg->uuid, &dev->uuid);
 	memcpy((u8 *)msg + msg->offset, buf, sz);
 
 	/* flags = 0, sender VMID = 0 works for both physical/virtual NS */
@@ -1054,7 +1055,7 @@ static int ffa_sync_send_receive(struct ffa_device *dev,
 
 static int ffa_indirect_msg_send(struct ffa_device *dev, void *buf, size_t sz)
 {
-	return ffa_msg_send2(drv_info->vm_id, dev->vm_id, buf, sz);
+	return ffa_msg_send2(dev, drv_info->vm_id, buf, sz);
 }
 
 static int ffa_sync_send_receive2(struct ffa_device *dev,
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 761ea8fe3bb6080c893a5eb365358b62d6a4f3ff..bd78deeff284e2f46d42cfc7af218f4a0f3d1478 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -282,6 +282,7 @@ struct ffa_indirect_msg_hdr {
 	u32 offset;
 	u32 send_recv_id;
 	u32 size;
+	uuid_t uuid;
 };
 
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP}2 which pass data via registers */

-- 
2.34.1


