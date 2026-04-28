Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F65BFF887B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53LdlVfc1JITwnGaSkGjQK/JBFo/MZ2TyZqJlCa5DKU=; b=2y5nAeVNkyXp0n3XKAyJDZu+4d
	w8QMDTmDiA1kIngb9mC9Tqnji4US1VgtaQunKiRwCaZjVptkPnUs0QD8LyMc+/sBPbb7fHSaElfNO
	uezzkXy9R90mx/vTX/UuWn2hQZRHxxw5Yxt+tYBEyErpwj8Vkk+8MdPgXg0sR/FFc7etHUQQA6rDp
	SN9OUxnVap+/yENhBvY8pKd2cgRIZXXD09JFR50AqvybEhlmmFmBnWMIHDgP8yF2/T/8dEM07D3Bn
	NSn5fIOFqJJ7S4p+C6G+dPJfUz36YOUK0OWrDiZaPty2PSoij1cxfzypUyugID5EG75WDywgfpo6Y
	9yrAimrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnG2-000000025LY-10ci;
	Tue, 28 Apr 2026 18:34:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFu-000000025GQ-42Az
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6B4D44429;
	Tue, 28 Apr 2026 18:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA669C2BCC7;
	Tue, 28 Apr 2026 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401238;
	bh=ZtF8wUA98yxBhzg89vYttX0W+hwz45ZUK1h4OgYNLN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oEhnX1O5jl/aul4uv/eVhhCvSnj/eOI2cDb7FvDALf5eo9lh7O8KsK23esyn3IYbs
	 7tAFWHRsWUOlCfdd9WlLjFUnB2VmldEOVFQRAlGKeuHjb8lFEMCjZsFhzZVzwCL54c
	 rpsIA+ypLsAEcG58uN6eqQtfZ5bkpDnV0Ozx0UEgVUCn4Lj2VmozY1sQehnEZknJq8
	 o7xVax4bxCNiTg9MXNqqv8rYPA/jy7btYadnPdb4zpeYDqZ0hEjOC4kvkpNDoHSQgG
	 eynluTeStbtAW0MoPmRZoRW1wEtHrKyrc7TDOzvr5Z4niMp3XbywEGEcjTLuGv5c76
	 ZImonFAyyb5sg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:32 +0100
Subject: [PATCH v2 08/11] firmware: arm_ffa: Validate framework
 notification message layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-8-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113359_029003_FBAA51A6 
X-CRM114-Status: GOOD (  12.64  )
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

Framework notifications carry an indirect message in the shared RX
buffer. Validate the reported offset and size before using them, reject
zero-length payloads, and ensure that any non-header payload starts at
the UUID field rather than in the middle of the message header.

Use the validated offset and size values for both kmemdup() and the UUID
parsing path so malformed firmware data cannot drive an out-of-bounds
read or an oversized allocation.

Fixes: 285a5ea0f542 ("firmware: arm_ffa: Add support for handling framework notifications")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 18bcbd161805..4944aa6b815f 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1489,21 +1489,35 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 	int notify_id = 0, target;
 	struct ffa_indirect_msg_hdr *msg;
 	struct notifier_cb_info *cb_info = NULL;
+	size_t min_offset = offsetof(struct ffa_indirect_msg_hdr, uuid);
 
 	/* Only one framework notification defined and supported for now */
 	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
 		return;
 
 	scoped_guard(mutex, &drv_info->rx_lock) {
+		u32 offset, size;
+
 		msg = drv_info->rx_buffer;
-		buf = kmemdup((void *)msg + msg->offset, msg->size, GFP_KERNEL);
+		offset = msg->offset;
+		size = msg->size;
+
+		if (!size || (offset != min_offset && offset < sizeof(*msg)) ||
+		    offset > drv_info->rxtx_bufsz ||
+		    size > drv_info->rxtx_bufsz - offset) {
+			pr_err("invalid framework notification message\n");
+			ffa_rx_release();
+			return;
+		}
+
+		buf = kmemdup((void *)msg + offset, size, GFP_KERNEL);
 		if (!buf) {
 			ffa_rx_release();
 			return;
 		}
 
 		target = SENDER_ID(msg->send_recv_id);
-		if (msg->offset >= sizeof(*msg))
+		if (offset >= sizeof(*msg))
 			uuid_copy(&uuid, &msg->uuid);
 		else
 			uuid_copy(&uuid, &uuid_null);

-- 
2.43.0


