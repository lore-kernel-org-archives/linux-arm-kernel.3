Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A885FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qfd55FSLErCuOEYBbiuxOFRZJJSUfmhwjEDICp6k+4=; b=gpL0rVfrKNhEajNWfYiMwjs5ND
	PEU8Scxqc4KZY88RVooXQB5jmZeV7JFPk9c70SxcpkZL2Ps0ZypxQEB+4GgssHzKYQ555wCUP9B5Y
	eQYvnazmQWoIel0Ti40BqRR6pji/wNBOeTscXtfN2V5rCMjxOV05wY/PVJi6Ewt48zUcUJsvdPSoY
	3nxjQW3GsaRSSiybUgvVxjh7qP3KOUOqJLFDg7+W6h/A5wBE2AQ1ZrtLCKYKkVDkZnk8HqW8dnUnv
	KbkQPH9bLaRQQSDerML6jtpb2sLbNQActvZR/gdrHPcadQpJzAPLUCiZi+X5RsYYrWklFPUd75lwr
	3QfvJKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnG1-000000025Kv-3ga4;
	Tue, 28 Apr 2026 18:34:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFt-000000025Ft-3Pik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87EAF43F05;
	Tue, 28 Apr 2026 18:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE107C2BCB3;
	Tue, 28 Apr 2026 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401237;
	bh=eNiNzrXTttjfdrO7y5bhY8rTyrVCsaLHM+IpsjVfBiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dt1zG7Sgb1C2R/yc+aiUzhiemV9UezXjVvGza8bdQAKqo71o1H84zPi67I1SvlRBE
	 K17s7XmcN0a4ITjUfFpgZmGazXRhwcubjkyKd1emVJwyXkEsutKi6ke46IYD5PA7Wd
	 7K3OSYqXfd/vA1UVpeymM+mm+noT2EhMrx5qU3rjllbtd1ofF6VONPVFEboWRhsLtf
	 1NFSUOLEK/AecomFx4tS6sOdot4XwyU6dYfdjgKkWaxzdR3ZRzBJy4bKMOzyZQEGFA
	 dVEfkNPCyUfvBHjRIAx27029DX8vx73blxNQBxT6aGTDTpbIV1Uae+ZMQdu6GV4kaR
	 jBlVwYvOsyqZA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:31 +0100
Subject: [PATCH v2 07/11] firmware: arm_ffa: Keep framework RX release
 under lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-7-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113357_889119_3FE479B2 
X-CRM114-Status: GOOD (  11.90  )
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

The framework notification handler drops rx_lock before issuing
FFA_RX_RELEASE, leaving a window where another RX-buffer user can
start a new FF-A transaction before ownership has actually been
returned to firmware.

Move the FFA_RX_RELEASE calls so they execute while rx_lock is still
held on both the kmemdup() failure path and the normal success path.
While doing that, switch the handler to scoped_guard() to keep the
critical section explicit.

Fixes: 285a5ea0f542 ("firmware: arm_ffa: Add support for handling framework notifications")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index ed502486eb35..18bcbd161805 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1494,25 +1494,22 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
 		return;
 
-	mutex_lock(&drv_info->rx_lock);
+	scoped_guard(mutex, &drv_info->rx_lock) {
+		msg = drv_info->rx_buffer;
+		buf = kmemdup((void *)msg + msg->offset, msg->size, GFP_KERNEL);
+		if (!buf) {
+			ffa_rx_release();
+			return;
+		}
 
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
+		ffa_rx_release();
 	}
 
-	target = SENDER_ID(msg->send_recv_id);
-	if (msg->offset >= sizeof(*msg))
-		uuid_copy(&uuid, &msg->uuid);
-	else
-		uuid_copy(&uuid, &uuid_null);
-
-	mutex_unlock(&drv_info->rx_lock);
-
-	ffa_rx_release();
-
 	read_lock(&drv_info->notify_lock);
 	cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, target, &uuid);
 	read_unlock(&drv_info->notify_lock);

-- 
2.43.0


