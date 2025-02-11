Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E3CC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K2PhGXiwtStqYCjcm40EkOiEETfXthr8C7sGbtb4GB8=; b=ysYMcXdazAbSCg0DBH9xnNu5eu
	qsrFoZ+02545q2/SstPkicRkZ95dEGr8vdZNpBxcg9UE7SelyE/YMVtWbsrFrkILkZACJ3QQokUPb
	mZBx0LlV5eK1ZcX5Jb1He/PwfTmcRA1ti9u4ojxMyTDP/zkhc3+G7GVCXlUhKMJBSzUCWoOgkmGS+
	WlJ339gLkkOvAYrdFfSgqp9Gay9Fz9GGIEHDkLjyOMCOEUvpNZD1FrenCQLIN2VqqmCCIecVhMvr3
	uDNtZ1JAc3kp5Z0r3a4Fl5VDeqji1ktCe+SxVCAsm89OI/QW/9Cln9FFI6PZdv4PVMkU/aPem4sBR
	EivA44qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuaV-00000004mjQ-2VCs;
	Tue, 11 Feb 2025 18:02:23 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuY7-00000004mLy-3gs2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:59:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739296792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K2PhGXiwtStqYCjcm40EkOiEETfXthr8C7sGbtb4GB8=;
	b=PzSnSzCaVuNGetsX0o2fDzCsGE8F7yqo+iKPBxpMqC7xhY1NPm5PtsvA+kqvdgPTgXD3fD
	RAkIZWft6B4osZpHIs/BLhJWJy53WYtrNeOiCMcV4fuG43w853CgM3DcE3m20dIt9bNegI
	ScrNTl5dDR22PVne47royC6W3KywD6hfqzO44RPSS7A9a1Rl8aHR6QOoFYMwdhpf99QbzY
	LyTtiuCibP8A2Os4BpEl5Y/GTqetXSvZtFJfT5kQkMV+cpyzCoLBhpgX5bC+lFJSs/VkDT
	z6K/CUv8Q/g20Ti/25CrhKwmx8/CdikwHEql1fBbDYUOZfvOpP4lUMaOP3i4NA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 12:59:44 -0500
Subject: [PATCH] soc: apple: rtkit: Check & log more failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-rtkit-more-logging-v1-1-93334e9c1c77@rosenzweig.io>
X-B4-Tracking: v=1; b=H4sIAA+Qq2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ND3aKS7MwS3dz8olTdnPz09My8dF1zy+SkpKRUI8PU1FQloMaCotS
 0zAqwodGxtbUAZVmi8GQAAAA=
X-Change-ID: 20250211-rtkit-more-logging-79cbbbe21eee
To: Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4147; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=a9qAM//3ptsLIAwPktL4UIoeDeVyl/yRaYAY2sOTCIM=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq5AWtR1CyqDvp60CNnJA/EMbjYudSzf3Yk8k6
 ECS5lrq/eqJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uQFgAKCRD+/lBaCvVY
 DcXIEACN9+AIOYd+j81n1VusjwjWoLMSLUWBpu5TcZPhuXDy3wbTYfPrFVsD6CGvOaF/LSZdLex
 J04pELymqBm4d12uP1wMCKq+6UAerkJV0rwDmA/wCOSsWgaVbVl6G8le8y9X0ZeBI1VuYszNbKM
 zaGk6gLz4APfsZWYoH5l6JaOnjyosUFPjJxBJN3NCZgAEVu5oXBeI/pqyKp5BHYwcZEjj90Ofr9
 ICe35C9b6czn0JOiv+Lr/p85RjajSUmt77LDrSrKS6Xg4NnxlFa5sPvZDYsKx3aekhxzAcgIOQ9
 ZB2X/ozY1Ia8QipJqUwbJY8/9Oy054ld+ZJJBEE+xf3kEHZtgbDZDFyZRsNeAFEZyzLPTpm9rzx
 u1h8SdhF8CqeQZe+Hm9+44beleFqDISaNz9R7a6JMGQD9J8P0g5DDBZHwBxwbOrPJsnu79caj+8
 /5XU8hbTlT9csHNHGIOmjQn6S+rLM1cccZoxy9zqtAT6d0h5qlq67WeIjf/+9UhgUXpq6HWIWyU
 zGDQAUpaXvERwFN9DWCpjd+iOPaC9oQyweUzs2NGbd7QDofCvipIzSUggRipVUSGptFAYogFDvH
 OnZKO1bTy4QNNtOuJtk2A6N/nlhjOLhBBdKut8F0rwfaZ/jkq13cveD9bUF9zSwfho3SLNWvWux
 3A1fxjFe2SP47Vw==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_095956_700937_BEE20730 
X-CRM114-Status: GOOD (  11.51  )
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

From: Asahi Lina <lina@asahilina.net>

Check and log the following failures:

* regular messages
* management messages
* failed buffer requests

This helps debugging.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Originally multiple commits by Asahi Lina, squashed here and
checkpatch.pl warn fixed.
---
 drivers/soc/apple/rtkit.c | 44 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index e6d940292c9fbdfc4cd42020e89aca2662c5cdce..f8077a1ec3a42265eb9565a0ea1ca6a4cf7e79dc 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -97,12 +97,19 @@ bool apple_rtkit_is_crashed(struct apple_rtkit *rtk)
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_is_crashed);
 
-static void apple_rtkit_management_send(struct apple_rtkit *rtk, u8 type,
+static int apple_rtkit_management_send(struct apple_rtkit *rtk, u8 type,
 					u64 msg)
 {
+	int ret;
+
 	msg &= ~APPLE_RTKIT_MGMT_TYPE;
 	msg |= FIELD_PREP(APPLE_RTKIT_MGMT_TYPE, type);
-	apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_MGMT, msg, NULL, false);
+	ret = apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_MGMT, msg, NULL, false);
+
+	if (ret)
+		dev_err(rtk->dev, "RTKit: Failed to send management message: %d\n", ret);
+
+	return ret;
 }
 
 static void apple_rtkit_management_rx_hello(struct apple_rtkit *rtk, u64 msg)
@@ -295,6 +302,9 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
 	return 0;
 
 error:
+	dev_err(rtk->dev, "RTKit: failed buffer request for 0x%zx bytes (%d)\n",
+		buffer->size, err);
+
 	buffer->buffer = NULL;
 	buffer->iomem = NULL;
 	buffer->iova = 0;
@@ -588,11 +598,18 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
 		.msg1 = ep,
 	};
 
-	if (rtk->crashed)
+	if (rtk->crashed) {
+		dev_warn(rtk->dev,
+			 "RTKit: Device is crashed, cannot send message\n");
 		return -EINVAL;
+	}
+
 	if (ep >= APPLE_RTKIT_APP_ENDPOINT_START &&
-	    !apple_rtkit_is_running(rtk))
+	    !apple_rtkit_is_running(rtk)) {
+		dev_warn(rtk->dev,
+			 "RTKit: Endpoint 0x%02x is not running, cannot send message\n", ep);
 		return -EINVAL;
+	}
 
 	/*
 	 * The message will be sent with a MMIO write. We need the barrier
@@ -742,8 +759,10 @@ static int apple_rtkit_set_ap_power_state(struct apple_rtkit *rtk,
 	reinit_completion(&rtk->ap_pwr_ack_completion);
 
 	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, state);
-	apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_AP_PWR_STATE,
-				    msg);
+	ret = apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_AP_PWR_STATE,
+					  msg);
+	if (ret)
+		return ret;
 
 	ret = apple_rtkit_wait_for_completion(&rtk->ap_pwr_ack_completion);
 	if (ret)
@@ -763,8 +782,10 @@ static int apple_rtkit_set_iop_power_state(struct apple_rtkit *rtk,
 	reinit_completion(&rtk->iop_pwr_ack_completion);
 
 	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, state);
-	apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STATE,
-				    msg);
+	ret = apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STATE,
+					  msg);
+	if (ret)
+		return ret;
 
 	ret = apple_rtkit_wait_for_completion(&rtk->iop_pwr_ack_completion);
 	if (ret)
@@ -865,6 +886,7 @@ EXPORT_SYMBOL_GPL(apple_rtkit_quiesce);
 int apple_rtkit_wake(struct apple_rtkit *rtk)
 {
 	u64 msg;
+	int ret;
 
 	if (apple_rtkit_is_running(rtk))
 		return -EINVAL;
@@ -876,8 +898,10 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
 	 * will wait for the completion anyway.
 	 */
 	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_ON);
-	apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STATE,
-				    msg);
+	ret = apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STATE,
+					  msg);
+	if (ret)
+		return ret;
 
 	return apple_rtkit_boot(rtk);
 }

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-rtkit-more-logging-79cbbbe21eee

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>


