Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF1DC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCJHkSKvs9WkF0SCXF3/yTxme32TtLWPl/7JBYetjjQ=; b=vOy1LRBPOyoyRpBJBI/RBzsReR
	9xU4mO4n8ZSAhTWyfZoVh+1GGPyZfsuP1B07N32uXRBbKfDQ+ht0MEL8HsFnO0of8UmTWP3mGNmk0
	EhU3W1888ITBlzRiRHbGlOrZJqGpMYUEqWEUigR0GiHIdW6V2GRCbEfZIZWdzWn1DImKXB6vcTvq/
	lXyFzdFEzMzXhbPKn1d0ymWMvnq+E9R5lhIVDEBya22ex1S8YiK7S+GviIaK87zvGBjlE3xXZQqtL
	4E094Cog2r4pn2TEg9lamQWie5Z7PoAZtMYnj/Z1QWZHW5BJ4fLtei+z5F92dv9l9VBUo60IoKO9n
	vUuDl9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7LB-00000009Zk4-2RRi;
	Tue, 06 May 2025 01:43:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4an-00000008rWV-2oeF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B49C44A254;
	Mon,  5 May 2025 22:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1CDC4CEED;
	Mon,  5 May 2025 22:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485241;
	bh=1kVFBF5Km5WKizSO08Xy/7gQngJUmOZ7T0h0aO7IcfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XwVPSBbrS5iHpSCgCBsWYBGWuOCDuV+WMKCO+RkG0fSXAn1Oi8yxAk29QdwlfcVW9
	 bI1qfi876PJLfqLINrqaChkuBR2u5CgDeSF3UAmRItuJa5bzQX/PS8E5GFEHhGydCZ
	 NCV0c5ZBmWM/h5dd56nI0+T78k7bcpCe96GzpIGCTqY7bYs8XE0uO4HifYpiYweMFf
	 MMuIvB3sIHJKJbA8EyjgP+gUk2jj/Bfrg1Go9uypmFm8hGYFpkB5zw6ceNxCUD+LzJ
	 t6vQ7K3AL0OCX+YpBPCTV2Ubm9YLw9X7MO53Lewa2bOAMSxgI+Zm4SSU2gulIirAc+
	 wzwZKTSLKDzeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Sasha Levin <sashal@kernel.org>,
	j@jannau.net,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 230/486] soc: apple: rtkit: Implement OSLog buffers properly
Date: Mon,  5 May 2025 18:35:06 -0400
Message-Id: <20250505223922.2682012-230-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154721_742114_ED5A9396 
X-CRM114-Status: GOOD (  15.96  )
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

From: Hector Martin <marcan@marcan.st>

[ Upstream commit a06398687065e0c334dc5fc4d2778b5b87292e43 ]

Apparently nobody can figure out where the old logic came from, but it
seems like it has never been actually used on any supported firmware to
this day. OSLog buffers were apparently never requested.

But starting with 13.3, we actually need this implemented properly for
MTP (and later AOP) to work, so let's actually do that.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Link: https://lore.kernel.org/r/20250226-apple-soc-misc-v2-2-c3ec37f9021b@svenpeter.dev
Signed-off-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/apple/rtkit-internal.h |  1 +
 drivers/soc/apple/rtkit.c          | 56 ++++++++++++++++++------------
 2 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
index 27c9fa745fd52..b8d5244678f01 100644
--- a/drivers/soc/apple/rtkit-internal.h
+++ b/drivers/soc/apple/rtkit-internal.h
@@ -44,6 +44,7 @@ struct apple_rtkit {
 
 	struct apple_rtkit_shmem ioreport_buffer;
 	struct apple_rtkit_shmem crashlog_buffer;
+	struct apple_rtkit_shmem oslog_buffer;
 
 	struct apple_rtkit_shmem syslog_buffer;
 	char *syslog_msg_buffer;
diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 00d59a81db88b..45ccbe2cbcd63 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -66,8 +66,9 @@ enum {
 #define APPLE_RTKIT_SYSLOG_MSG_SIZE  GENMASK_ULL(31, 24)
 
 #define APPLE_RTKIT_OSLOG_TYPE GENMASK_ULL(63, 56)
-#define APPLE_RTKIT_OSLOG_INIT	1
-#define APPLE_RTKIT_OSLOG_ACK	3
+#define APPLE_RTKIT_OSLOG_BUFFER_REQUEST 1
+#define APPLE_RTKIT_OSLOG_SIZE GENMASK_ULL(55, 36)
+#define APPLE_RTKIT_OSLOG_IOVA GENMASK_ULL(35, 0)
 
 #define APPLE_RTKIT_MIN_SUPPORTED_VERSION 11
 #define APPLE_RTKIT_MAX_SUPPORTED_VERSION 12
@@ -251,15 +252,21 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
 					    struct apple_rtkit_shmem *buffer,
 					    u8 ep, u64 msg)
 {
-	size_t n_4kpages = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg);
 	u64 reply;
 	int err;
 
+	/* The different size vs. IOVA shifts look odd but are indeed correct this way */
+	if (ep == APPLE_RTKIT_EP_OSLOG) {
+		buffer->size = FIELD_GET(APPLE_RTKIT_OSLOG_SIZE, msg);
+		buffer->iova = FIELD_GET(APPLE_RTKIT_OSLOG_IOVA, msg) << 12;
+	} else {
+		buffer->size = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg) << 12;
+		buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
+	}
+
 	buffer->buffer = NULL;
 	buffer->iomem = NULL;
 	buffer->is_mapped = false;
-	buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
-	buffer->size = n_4kpages << 12;
 
 	dev_dbg(rtk->dev, "RTKit: buffer request for 0x%zx bytes at %pad\n",
 		buffer->size, &buffer->iova);
@@ -284,11 +291,21 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
 	}
 
 	if (!buffer->is_mapped) {
-		reply = FIELD_PREP(APPLE_RTKIT_SYSLOG_TYPE,
-				   APPLE_RTKIT_BUFFER_REQUEST);
-		reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_SIZE, n_4kpages);
-		reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_IOVA,
-				    buffer->iova);
+		/* oslog uses different fields and needs a shifted IOVA instead of size */
+		if (ep == APPLE_RTKIT_EP_OSLOG) {
+			reply = FIELD_PREP(APPLE_RTKIT_OSLOG_TYPE,
+					   APPLE_RTKIT_OSLOG_BUFFER_REQUEST);
+			reply |= FIELD_PREP(APPLE_RTKIT_OSLOG_SIZE, buffer->size);
+			reply |= FIELD_PREP(APPLE_RTKIT_OSLOG_IOVA,
+					    buffer->iova >> 12);
+		} else {
+			reply = FIELD_PREP(APPLE_RTKIT_SYSLOG_TYPE,
+					   APPLE_RTKIT_BUFFER_REQUEST);
+			reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_SIZE,
+					    buffer->size >> 12);
+			reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_IOVA,
+					    buffer->iova);
+		}
 		apple_rtkit_send_message(rtk, ep, reply, NULL, false);
 	}
 
@@ -482,25 +499,18 @@ static void apple_rtkit_syslog_rx(struct apple_rtkit *rtk, u64 msg)
 	}
 }
 
-static void apple_rtkit_oslog_rx_init(struct apple_rtkit *rtk, u64 msg)
-{
-	u64 ack;
-
-	dev_dbg(rtk->dev, "RTKit: oslog init: msg: 0x%llx\n", msg);
-	ack = FIELD_PREP(APPLE_RTKIT_OSLOG_TYPE, APPLE_RTKIT_OSLOG_ACK);
-	apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_OSLOG, ack, NULL, false);
-}
-
 static void apple_rtkit_oslog_rx(struct apple_rtkit *rtk, u64 msg)
 {
 	u8 type = FIELD_GET(APPLE_RTKIT_OSLOG_TYPE, msg);
 
 	switch (type) {
-	case APPLE_RTKIT_OSLOG_INIT:
-		apple_rtkit_oslog_rx_init(rtk, msg);
+	case APPLE_RTKIT_OSLOG_BUFFER_REQUEST:
+		apple_rtkit_common_rx_get_buffer(rtk, &rtk->oslog_buffer,
+						 APPLE_RTKIT_EP_OSLOG, msg);
 		break;
 	default:
-		dev_warn(rtk->dev, "RTKit: Unknown oslog message: %llx\n", msg);
+		dev_warn(rtk->dev, "RTKit: Unknown oslog message: %llx\n",
+			 msg);
 	}
 }
 
@@ -710,6 +720,7 @@ int apple_rtkit_reinit(struct apple_rtkit *rtk)
 
 	apple_rtkit_free_buffer(rtk, &rtk->ioreport_buffer);
 	apple_rtkit_free_buffer(rtk, &rtk->crashlog_buffer);
+	apple_rtkit_free_buffer(rtk, &rtk->oslog_buffer);
 	apple_rtkit_free_buffer(rtk, &rtk->syslog_buffer);
 
 	kfree(rtk->syslog_msg_buffer);
@@ -890,6 +901,7 @@ void apple_rtkit_free(struct apple_rtkit *rtk)
 
 	apple_rtkit_free_buffer(rtk, &rtk->ioreport_buffer);
 	apple_rtkit_free_buffer(rtk, &rtk->crashlog_buffer);
+	apple_rtkit_free_buffer(rtk, &rtk->oslog_buffer);
 	apple_rtkit_free_buffer(rtk, &rtk->syslog_buffer);
 
 	kfree(rtk->syslog_msg_buffer);
-- 
2.39.5


