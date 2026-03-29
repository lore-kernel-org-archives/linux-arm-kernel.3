Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83ECF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ik4b/vrgf01hEAMYRECZbgp/L6/jL9CmeSXkBfaWtRM=; b=v8RJaqwknn/fYqC8aeGcoL8TU8
	dELAiEIWX7qxWnGyYHUnl4vzVD/Dq7iOnwuqyMgYkHjicZq2lDad3Xs9dZav1Ve/MDkuf3oOv/BF0
	QiMI0VEKqAXOuM12vZCeiFcJmV+31eDEuUy8Mg5/7jvQERL8ADnQ/jgzEOKcbuEL027uwS4n2BuD0
	7c0YdA8NJdPsNSUqNrN6uTN4ybZFvugPKXadSc4C4h7IzC5VCblTbV2MSZN76EIaEYKrNOVLuBSxH
	HFbX9Pzu5LKdzTWOYhiH8+EuO2WtSITQdGLxCJrlqs1rNbwH7cq4ZvkKdKyJ44II0WUpDGDkOeFgZ
	hZg1ynBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t5n-0000000A7qC-38w6;
	Sun, 29 Mar 2026 16:34:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t5g-0000000A7n5-1Jwy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:34:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E39E64456;
	Sun, 29 Mar 2026 09:34:13 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6E03F915;
	Sun, 29 Mar 2026 09:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802059; bh=Ag7HfN/sgVc3bbbOya8yLcKEKW6cVwh7BkFYxrWVnNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KF6yt0JDNsyke0Oa1S5cK9K7mw7Eus0AStDWeywFUv5oLK3U/sl+f25ABxnp62S3x
	 MZtP98hQFT/9yYJqsl5Qwtr4YkoV3cAyusfxesJ7hE6YiIg8uiJTXFT02T3ZmzNcYw
	 hoITN7LGw7e5uwhbdm1inWsspmAGVxwPsdyJ9aTE=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 02/24] firmware: arm_scmi: Reduce the scope of protocols mutex
Date: Sun, 29 Mar 2026 17:33:13 +0100
Message-ID: <20260329163337.637393-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093420_427012_B5097E57 
X-CRM114-Status: GOOD (  15.14  )
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

Currently the mutex dedicated to the protection of the list of registered
protocols is held during all the protocol initialization phase.

Such a wide locking region is not needed and causes problem when trying to
initialize notifications from within a protocol initialization routine.

Reduce the scope of the protocol mutex.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1-->v2
 - Fixed improper mixed usage of cleanup and goto constructs
---
 drivers/firmware/arm_scmi/driver.c | 50 ++++++++++++++----------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e76a3204ba4..26f192b8d7a9 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -17,6 +17,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/bitmap.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -2190,7 +2191,6 @@ static void scmi_protocol_version_initialize(struct device *dev,
  * all resources management is handled via a dedicated per-protocol devres
  * group.
  *
- * Context: Assumes to be called with @protocols_mtx already acquired.
  * Return: A reference to a freshly allocated and initialized protocol instance
  *	   or ERR_PTR on failure. On failure the @proto reference is at first
  *	   put using @scmi_protocol_put() before releasing all the devres group.
@@ -2236,8 +2236,10 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	if (ret)
 		goto clean;
 
-	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
-			GFP_KERNEL);
+	/* Finally register the initialized protocol */
+	mutex_lock(&info->protocols_mtx);
+	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1, GFP_KERNEL);
+	mutex_unlock(&info->protocols_mtx);
 	if (ret != proto->id)
 		goto clean;
 
@@ -2284,27 +2286,25 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 static struct scmi_protocol_instance * __must_check
 scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 {
-	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
+	const struct scmi_protocol *proto;
 
-	mutex_lock(&info->protocols_mtx);
-	pi = idr_find(&info->protocols, protocol_id);
-
-	if (pi) {
-		refcount_inc(&pi->users);
-	} else {
-		const struct scmi_protocol *proto;
+	scoped_guard(mutex, &info->protocols_mtx) {
+		struct scmi_protocol_instance *pi;
 
-		/* Fails if protocol not registered on bus */
-		proto = scmi_protocol_get(protocol_id, &info->version);
-		if (proto)
-			pi = scmi_alloc_init_protocol_instance(info, proto);
-		else
-			pi = ERR_PTR(-EPROBE_DEFER);
+		pi = idr_find(&info->protocols, protocol_id);
+		if (pi) {
+			refcount_inc(&pi->users);
+			return pi;
+		}
 	}
-	mutex_unlock(&info->protocols_mtx);
 
-	return pi;
+	/* Fails if protocol not registered on bus */
+	proto = scmi_protocol_get(protocol_id, &info->version);
+	if (!proto)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return scmi_alloc_init_protocol_instance(info, proto);
 }
 
 /**
@@ -2335,10 +2335,11 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
-	pi = idr_find(&info->protocols, protocol_id);
-	if (WARN_ON(!pi))
-		goto out;
+	scoped_guard(mutex, &info->protocols_mtx) {
+		pi = idr_find(&info->protocols, protocol_id);
+		if (WARN_ON(!pi))
+			return;
+	}
 
 	if (refcount_dec_and_test(&pi->users)) {
 		void *gid = pi->gid;
@@ -2357,9 +2358,6 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
-
-out:
-	mutex_unlock(&info->protocols_mtx);
 }
 
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
-- 
2.53.0


