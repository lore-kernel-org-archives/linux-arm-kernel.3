Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEEFE6F094
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UnW1anc6pr/tyiih44WqyFteYhZhigDYAds7CEfJQ4=; b=c7f1Hv8dsTtONzFLgXRMr4oyDw
	i6cZJMee45GgYpjRJbPdoVlGqz7R8voCev9q1OMcZW62WNFtLsut8BSB8SJ/1NAaRkQ1biibw45CX
	Y2Fc/fqCY7HwuxyCeTAR+1enH6pCnNqON69LWe0ki5paT4zxKEF4hMpLmAMVUFW/OdpbhLSaE23W7
	S2nEE4k71vyMyny7W5nAmyrpKSuHBtscKUUBBIi0WqNJKPRSf2kwVEs3f19eWbhqymIutj2qZSUza
	Krl+6YsBk8PGcgEk2b/KSDh/8nA6xTt7XshexyZ+AydnXwnHWEfsx1uxR8zcuf1cuaIAxDZSJ+FRS
	DXB6K1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39a-0000000FaiS-11EL;
	Tue, 23 Dec 2025 14:14:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39V-0000000Fagm-2hM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:14:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a09757004cso63672245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766499257; x=1767104057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UnW1anc6pr/tyiih44WqyFteYhZhigDYAds7CEfJQ4=;
        b=g9Azvn6GodztUB+2p0jNuyXJ6wTOMjFOX0fYTjciFQq1KaH+Ym+/WxR7k9WYaUmvjP
         H+Uz8U5YwmOhdusCGEillf1Vprxu8ulps5d4FN4xw5u5QtiCLoY5diGWpMc8qWfN+SeU
         HdnyYT7pk60qyVJ5cDJnbeczr9qL4G0V4Pvlk9iVaB8z2GqDooylqYa/UB3hg6yhW0tR
         6kWcT7BozV5Mc2IN1W1E1eJtfG4AF0Rcfaz1j9+4pXPWeQfJZ979vdS20JUqZGMrP6mi
         d3NgfpQQx6LExtwhBdzYflV4R9IShnz3NMyd7+CQoLVJ0Vj8ojJf4ZMbIGK/js1ZXKRy
         gohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499257; x=1767104057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4UnW1anc6pr/tyiih44WqyFteYhZhigDYAds7CEfJQ4=;
        b=fNrJ2BEtY9sqD87vhduFWwuH69Csq5l9LYuwN1GwP+NfB/oqwzlEhY3esk11gS6F35
         t1DMrNjXaRnCnJ3hbQgR4daQySMl9X4MzvWmOBpoWBwmd65p7E+ccOwhkVz9sarbpB7Q
         se9skTmccMwmgs+DeHqIP6DHQKK40K9rvw8YwBId0ON/AUt12cbdsrNLw++EBda76SjZ
         JePd21sQPKfPFp9AOdumbMjNw6MFXnmaRZ9mkOH2y6ADXI8bXIMxIEz0dTCyDbZEF01W
         Gd0m38B9X/C0NUKEAoToPpsVfzjuWFgcktKqWoeZobGBXaVHCUOTFvgvecvXESmuZiHF
         osvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU9Gds7GqOR87ZJUYTlGvyvMbdNlGRJbHxyluXyjS6//oZlpEOQ70KcYn0hqt6EpU06ZofZJU7Swj9NivpTeit@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg1A6eSBYO0xyIe8ISd6sJ/yafKMO618dkEqW0eMabdmokQQn6
	nUpE9o+cseJja24N2vp1oF5+ENDXKcCY1yHCzkopCEx530olJxuybcNd
X-Gm-Gg: AY/fxX54DF9aUAp+6He2euAaFTxi8smKX0qutXcKu71J/RlxLotliaq/EyubKD7loa4
	U3dyn69Mf1sG3SIosnFOoZbdllke+70lIt6ZsHic1LK5ZoO3M5k0tKHbOu5MNH+epevFDA0tIW8
	k3R+SsfEhStycPkQEBRWhhXi/ijRxeQzEy5HtXPX/a7SUiERFSnMrIEd9z6M0VuDQ9o/GSBvr+7
	drO3F5AxlBufdv/zsAdyrYackp8jV2vNJtp1n3EwohBA/vAvs3Ma4IcaLxAacuEe3JBOjQwAkEG
	gPdDVPpvPukz9xjeu3sYzBIkLaaBVODnYQOH8Jl/4+KYM+YMsgmQY6fbsxpo2QMgpI4kIHzEL82
	eZhHPNYst51L72kdqZcNI0ro/BGCHpahrV7oDzFeWONd4inRywfRv+yRNQZBcH3g8s0i3ouR11Q
	ijIXBo4rdmLCJx
X-Google-Smtp-Source: AGHT+IHCc53v26luZ+3auDSa3AlQsLD2YSn5E27WHQPltbbGQM4XExZHehktEvDZXNxnbr8xXYLk8g==
X-Received: by 2002:a17:902:d2d1:b0:2a0:980a:4f0b with SMTP id d9443c01a7336-2a2f2a4f5b8mr158871395ad.40.1766499256696;
        Tue, 23 Dec 2025 06:14:16 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm126783015ad.81.2025.12.23.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:14:16 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 23 Dec 2025 22:13:42 +0800
Subject: [PATCH 1/3] soc: apple: rtkit: Support verison-specific app
 endpoint start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-rtkit-v10-v1-1-12b4783d6403@gmail.com>
References: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
In-Reply-To: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5874; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iA1+3eI9x9rFDwZEUdABu0BB3ZKzLtixecDcPV1pc4k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpSqOzN2tQKzsUw2m7820RCzQBBs74PBwhQ8M9v
 PL/E3wUhK6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaUqjswAKCRABygi3psUI
 JGp5EACRQ+fMw0heugAjIZvRb3eUUcNAShJr9X/qNDFmbFv2l7wZBBHCp4MpGUbZEAa/XnnJFO6
 ejFKoRXs8TRdAj5svnR3rR/kIc18G21CqZ0sb3AZVppOs/2P45lVWmoteAzPCWTuizKZPGYHVM8
 NGPXnAMrCFgUiYvwr92siK/bmNsDSJl6tsYQHZy4rP0XWBaHB1ohJs8cm4DztF7qOfznul1QjLs
 Ro/qVpynQUFk4vpAYU6HyWE5+oHSseKnq4lWZQaMIo1BvGcPSfjQSV0uDnmU7TrNDfLu7TJQThb
 yqa7F/N63FXuZP/WtmEW580ei7raxRAAbQpWcUMMjP9VrdwKOo0PHbRiB6oxYwOvLOHr800Lxxe
 B3nheHhepRzKSWOf9mTo49/usNb9V/2VuKEnT/S+akugYHynY4e9aH3QBzBLjoYCSr5r36UfQYX
 qJIHARrVLiQNPttTjOJ/YaoUJTXLBch/VyMlnPfM63RRrO+p49IyTqy7TMXtxhIjzoP3B+PKSkw
 s3H05dbRICtN82erOxVTHLG54GzFXaE+o2yy5n56CKU7yeb8udlpz+7VrCR9h2DV5R4qL0tQkUO
 Z23SR1dWKWMfzY1/oIvz28q7yraGFEO4EEmOMkeNp+pd2WnIYiSFONCcYEqTEFS9zg5eN9HQDxX
 C8mq67DQT0IRk6Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_061417_708342_64F287FC 
X-CRM114-Status: GOOD (  17.82  )
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

Support for protocol versions where app endpoints starts at a
different endpoint number will be added. Consumer drivers will also
need to be modified to have them to work with such protocol
versions.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-internal.h |  3 ++-
 drivers/soc/apple/rtkit.c          | 42 +++++++++++++++++++++++++++-----------
 include/linux/soc/apple/rtkit.h    | 10 +++++++++
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
index b8d5244678f0100b72173fa9aca80bf9db1b4e5e..52ef7a202120eb8a56c149179389741ec0f5e358 100644
--- a/drivers/soc/apple/rtkit-internal.h
+++ b/drivers/soc/apple/rtkit-internal.h
@@ -19,7 +19,7 @@
 #include <linux/workqueue.h>
 #include "mailbox.h"
 
-#define APPLE_RTKIT_APP_ENDPOINT_START 0x20
+#define APPLE_RTKIT_APP_ENDPOINT_START_V11 0x20
 #define APPLE_RTKIT_MAX_ENDPOINTS 0x100
 
 struct apple_rtkit {
@@ -35,6 +35,7 @@ struct apple_rtkit {
 
 	int boot_result;
 	int version;
+	u8 app_ep_start;
 
 	unsigned int iop_power_state;
 	unsigned int ap_power_state;
diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..716d6a3e6eefd82d919467e39d68245c5c0d137c 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -140,6 +140,8 @@ static void apple_rtkit_management_rx_hello(struct apple_rtkit *rtk, u64 msg)
 		 want_ver);
 	rtk->version = want_ver;
 
+	rtk->app_ep_start = APPLE_RTKIT_APP_ENDPOINT_START_V11;
+
 	reply = FIELD_PREP(APPLE_RTKIT_MGMT_HELLO_MINVER, want_ver);
 	reply |= FIELD_PREP(APPLE_RTKIT_MGMT_HELLO_MAXVER, want_ver);
 	apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_HELLO_REPLY, reply);
@@ -179,7 +181,7 @@ static void apple_rtkit_management_rx_epmap(struct apple_rtkit *rtk, u64 msg)
 	if (!(msg & APPLE_RTKIT_MGMT_EPMAP_LAST))
 		return;
 
-	for_each_set_bit(ep, rtk->endpoints, APPLE_RTKIT_APP_ENDPOINT_START) {
+	for_each_set_bit(ep, rtk->endpoints, rtk->app_ep_start) {
 		switch (ep) {
 		/* the management endpoint is started by default */
 		case APPLE_RTKIT_EP_MGMT:
@@ -547,20 +549,21 @@ static void apple_rtkit_rx_work(struct work_struct *work)
 	case APPLE_RTKIT_EP_OSLOG:
 		apple_rtkit_oslog_rx(rtk, rtk_work->msg);
 		break;
-	case APPLE_RTKIT_APP_ENDPOINT_START ... 0xff:
-		if (rtk->ops->recv_message)
+	default:
+		if (rtk_work->ep >= rtk->app_ep_start && rtk->ops->recv_message)
 			rtk->ops->recv_message(rtk->cookie, rtk_work->ep,
 					       rtk_work->msg);
-		else
+		else if (rtk_work->ep >= rtk->app_ep_start)
 			dev_warn(
 				rtk->dev,
 				"Received unexpected message to EP%02d: %llx\n",
 				rtk_work->ep, rtk_work->msg);
+		else
+			dev_warn(
+				rtk->dev,
+				"RTKit: message to unknown endpoint %02x: %llx\n",
+				rtk_work->ep, rtk_work->msg);
 		break;
-	default:
-		dev_warn(rtk->dev,
-			 "RTKit: message to unknown endpoint %02x: %llx\n",
-			 rtk_work->ep, rtk_work->msg);
 	}
 
 	kfree(rtk_work);
@@ -585,7 +588,7 @@ static void apple_rtkit_rx(struct apple_mbox *mbox, struct apple_mbox_msg msg,
 			 "RTKit: Message to undiscovered endpoint 0x%02x\n",
 			 ep);
 
-	if (ep >= APPLE_RTKIT_APP_ENDPOINT_START &&
+	if (ep >= rtk->app_ep_start &&
 	    rtk->ops->recv_message_early &&
 	    rtk->ops->recv_message_early(rtk->cookie, ep, msg.msg0))
 		return;
@@ -615,8 +618,7 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
 		return -EINVAL;
 	}
 
-	if (ep >= APPLE_RTKIT_APP_ENDPOINT_START &&
-	    !apple_rtkit_is_running(rtk)) {
+	if (ep >= rtk->app_ep_start && !apple_rtkit_is_running(rtk)) {
 		dev_warn(rtk->dev,
 			 "RTKit: Endpoint 0x%02x is not running, cannot send message\n", ep);
 		return -EINVAL;
@@ -645,7 +647,7 @@ int apple_rtkit_start_ep(struct apple_rtkit *rtk, u8 endpoint)
 
 	if (!test_bit(endpoint, rtk->endpoints))
 		return -EINVAL;
-	if (endpoint >= APPLE_RTKIT_APP_ENDPOINT_START &&
+	if (endpoint >= rtk->app_ep_start &&
 	    !apple_rtkit_is_running(rtk))
 		return -EINVAL;
 
@@ -675,6 +677,13 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
 	rtk->cookie = cookie;
 	rtk->ops = ops;
 
+	/*
+	 * The management endpoint is required to receive the HELLO message
+	 * and infer the start of app endpoints so assume it is a system
+	 * endpoint here and update this value when HELLO is received.
+	 */
+	rtk->app_ep_start = APPLE_RTKIT_EP_CRASHLOG;
+
 	init_completion(&rtk->epmap_completion);
 	init_completion(&rtk->iop_pwr_ack_completion);
 	init_completion(&rtk->ap_pwr_ack_completion);
@@ -851,6 +860,15 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
 
+u8 apple_rtkit_app_ep_to_ep(struct apple_rtkit *rtk, u8 app_ep)
+{
+	if (!apple_rtkit_is_running(rtk))
+		return 0;
+
+	return rtk->app_ep_start + app_ep;
+}
+EXPORT_SYMBOL_GPL(apple_rtkit_app_ep_to_ep);
+
 int apple_rtkit_idle(struct apple_rtkit *rtk)
 {
 	int ret;
diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
index 736f530180179bd144cf85eb0f0bd93844d7188a..423cf1022372b124c9b2728445f85a9b3067c707 100644
--- a/include/linux/soc/apple/rtkit.h
+++ b/include/linux/soc/apple/rtkit.h
@@ -172,4 +172,14 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
  */
 int apple_rtkit_poll(struct apple_rtkit *rtk);
 
+/*
+ * Convert an endpoint number relative to start of app endpoint to an absolute
+ * endpoint number.
+ *
+ * Returns the endpoint number on success, 0 on failure.
+ *
+ * @rtk:            RTKit reference
+ */
+u8 apple_rtkit_app_ep_to_ep(struct apple_rtkit *rtk, u8 app_ep);
+
 #endif /* _LINUX_APPLE_RTKIT_H_ */

-- 
2.52.0


