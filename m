Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0FBFDEE29
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcCWF0lwyos/qXBUh8mRkS5XG81ixP4/I4TLe67iMcc=; b=PgwT3xVGx9i9Jz8RuMf4etAuBp
	7lFd+iv+KvrD/4qvgQ8hkl2r0jSwKcSo+FgJ9JojKKO+GIDHh1U6c3B9SAAWNLYFP1S7yr1/o9Ws9
	ikVPMC7nYQOAja5lRvFle3/nnKn/+EyWAWRhrOk54VwhUNKWLXHGgnt/76IkVjAFwi9JE0pxW7VDl
	Q/cBa22zZNRE/bpWqINJJEkcxOmYQ9Oa/BpCT8JR90UDquCh3KDUBRB2goICgHYP5rK3Yj4LVsatU
	8bgcEIlCShJwnTVYV9N5snDgonhEyJXLe0saENBQZfsMIlIFoA/jDSxi8m0bnePnzfw06nkWU3D8k
	/1/writA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmR-0000000C2PM-45uS;
	Thu, 23 Apr 2026 17:23:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmM-0000000C2Kz-0BcW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE57C43310;
	Thu, 23 Apr 2026 17:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F15C2BCAF;
	Thu, 23 Apr 2026 17:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965033;
	bh=+yGV+FJC4L0WAgipLE4zNhiVdIllPsS497DhNi03mkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jvAXMPNdhyz1hMYVHgljosCvAFReQtMoiJT5kDmXgq105o6ti/nBOefIXzqggW7FN
	 I/0RvheNAJsDv6s7JIE1lSELYKQ5gkGMPDNMIIX8YbDxCXt4HIq/5k/lzHJ6KYHGFe
	 29VzVvwZgK/l2W94wG/LBS5vGhG9k3e3NzGNmLc8XOu10h16yo3X9AmyQYUJBz/bRM
	 qEJZfELjtApvBHtMS7s1rFjh0zxU61MNKVKZj7SmWJYSn9PfmAGLUUdPfyQ3T9qZUi
	 dgN7gADfkZ+Pu0mJ3ZTsKjgHCO8JLUUVkTBphsAesnAIUT0cM4uIk/3+39jBGgW23r
	 WBYrqQ4JVtPsw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 23 Apr 2026 18:22:54 +0100
Subject: [PATCH 4/8] firmware: arm_ffa: Fix Rx buffer release in fwk
 notification handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-ffa_fixes-v1-4-61189661affe@kernel.org>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
In-Reply-To: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_102354_118228_1566FF46 
X-CRM114-Status: GOOD (  12.69  )
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

Refactor handle_fwk_notif_callbacks() so that all exit paths funnel
through a single FFA_RX_RELEASE call. While doing that, use scoped_guard()
for the Rx buffer lock and keep the message parsing under the lock scope.

This makes the Rx buffer release explicit for the kmemdup() failure path
and for the early exit when the framework notification bit is not set.

This will ensure the Rx buffer is always release in the framework
notification handler.

Fixes: 285a5ea0f542 ("firmware: arm_ffa: Add support for handling framework notifications")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 4dec7ca52f8c..764cb1226182 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1472,25 +1472,21 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 
 	/* Only one framework notification defined and supported for now */
 	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
-		return;
+		goto release_rx;
 
-	mutex_lock(&drv_info->rx_lock);
+	scoped_guard(mutex, &drv_info->rx_lock) {
+		msg = drv_info->rx_buffer;
+		buf = kmemdup((void *)msg + msg->offset, msg->size, GFP_KERNEL);
+		if (!buf)
+			goto release_rx;
 
-	msg = drv_info->rx_buffer;
-	buf = kmemdup((void *)msg + msg->offset, msg->size, GFP_KERNEL);
-	if (!buf) {
-		mutex_unlock(&drv_info->rx_lock);
-		return;
+		target = SENDER_ID(msg->send_recv_id);
+		if (msg->offset >= sizeof(*msg))
+			uuid_copy(&uuid, &msg->uuid);
+		else
+			uuid_copy(&uuid, &uuid_null);
 	}
 
-	target = SENDER_ID(msg->send_recv_id);
-	if (msg->offset >= sizeof(*msg))
-		uuid_copy(&uuid, &msg->uuid);
-	else
-		uuid_copy(&uuid, &uuid_null);
-
-	mutex_unlock(&drv_info->rx_lock);
-
 	ffa_rx_release();
 
 	read_lock(&drv_info->notify_lock);
@@ -1500,6 +1496,11 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 	if (cb_info && cb_info->fwk_cb)
 		cb_info->fwk_cb(notify_id, cb_info->cb_data, buf);
 	kfree(buf);
+
+	return;
+
+release_rx:
+	ffa_rx_release();
 }
 
 static void notif_get_and_handle(void *cb_data)

-- 
2.43.0


