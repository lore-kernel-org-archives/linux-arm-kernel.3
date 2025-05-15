Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA1BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m+zxlnUKxt+MxgepQaSuKi9cGwLsvC3qdkFYAQ72HS4=; b=3VZmXpE0s1OzFijUeQU1+VkPAK
	bBDWgdD2t6Bl7KPQS2Y0Anuf+DulM989iHlWWxB+WThoDGda4+7ZDH8RwC+1wHwIEbEVQeJUd0tGH
	AUdm9UDYmsWulzxO7LJ1ZG6gvHRYqz2KbXSyP2U4TINNz9LCR0Fl27rK//0u69tq2+GBbVG7duS4K
	RxpHs2P0At3NxrXICCRP7A5wZUKbQkJUQQfC4iK31V8/lvhlFL2rtyjdhiPBtMPC49BFQPGh3zvIi
	OK9CXiQyQl5tJJjCqWszXB8BlwI2jx1pj7MerJWtRuY8FoXPdKZa9YJIMmB3j/HzbJg4JqKlfsxjT
	6StqxU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFQih-0000000H1An-3VxX;
	Thu, 15 May 2025 05:01:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFQgh-0000000H13u-0VOj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 04:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747285159; x=1778821159;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=4VztJ67csbNOom2wQRi838Nreo1zmt+wKbfXF4TmClk=;
  b=bPSf5B74O1Gq0NJr7rUeTZyRNBkPUxy3zxkr45B7GwPn5smVM89UvnvW
   piHkhRoZ5plWkf/KNBkFAXSEUm6uXmCafBlY+GYxpUiEA1VWWkDizfpZJ
   Vqq0VcMC0nivijjMvvRVuBvbJrw6ozqjPYJvar0WrWysajP/OcQXaonNI
   XKs5KWVu4MqUp4jOke7x/88HWu5w13mNzZEcSVGXlZjcy80nwvYLd8CAh
   cCfKdZWRV3Eh02ikx/q8Lh02wMgoC3s078nazUg+Ea1a5jybq8kQrDsiA
   AnqIYQt53ltmT55FmDp39BHdQHsc/aRW2JzpVBKQt5GMRm5FoBedKKeXF
   Q==;
X-CSE-ConnectionGUID: 7SwAsoW3S9q8TSOD2TSkbQ==
X-CSE-MsgGUID: /cROPzdaS3GrzU0lo4VFRA==
X-IronPort-AV: E=Sophos;i="6.15,290,1739862000"; 
   d="scan'208";a="42133405"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 May 2025 21:59:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 14 May 2025 21:58:35 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 14 May 2025 21:58:33 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Thu, 15 May 2025 10:28:25 +0530
Subject: [PATCH] counter: microchip-tcb-capture: Add watch validation
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-counter-tcb-v1-1-e547061ed80f@microchip.com>
X-B4-Tracking: v=1; b=H4sIAHB0JWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0NT3eT80ryS1CLdkuQk3SSzxFRDSxNTI0ODJCWgjoKi1LTMCrBp0bG
 1tQCOvc6/XQAAAA==
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747285110; l=2402;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=4VztJ67csbNOom2wQRi838Nreo1zmt+wKbfXF4TmClk=;
 b=q187hDCueE1QScVAwflXU6hvqLkWRU76EQZbtHTo2ZyqL/Jz2tvk9VZo07bPwp1m6foSk0EPM
 GrIMjrDG8boByfWV3iwXTyloEioJwZqmBA2HCtGB3WZBboYKjAGn1gx
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_215919_440555_3E3DC8D4 
X-CRM114-Status: GOOD (  12.31  )
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

Introduce a watch validation callback to restrict supported event and
channel combinations. This allows userspace to receive notifications only
for valid event types and sources. Specifically, enable the following
supported events on channels RA, RB, and RC:

  - COUNTER_EVENT_CAPTURE
  - COUNTER_EVENT_CHANGE_OF_STATE
  - COUNTER_EVENT_OVERFLOW
  - COUNTER_EVENT_THRESHOLD

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/counter/microchip-tcb-capture.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 1de3c50b9804..179ff5595143 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -337,6 +337,27 @@ static struct counter_comp mchp_tc_count_ext[] = {
 	COUNTER_COMP_COMPARE(mchp_tc_count_compare_read, mchp_tc_count_compare_write),
 };
 
+static int mchp_tc_watch_validate(struct counter_device *counter,
+				  const struct counter_watch *watch)
+{
+	switch (watch->channel) {
+	case COUNTER_MCHP_EVCHN_RA:
+	case COUNTER_MCHP_EVCHN_RB:
+	case COUNTER_MCHP_EVCHN_RC:
+		switch (watch->event) {
+		case COUNTER_EVENT_CAPTURE:
+		case COUNTER_EVENT_CHANGE_OF_STATE:
+		case COUNTER_EVENT_OVERFLOW:
+		case COUNTER_EVENT_THRESHOLD:
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -351,12 +372,13 @@ static struct counter_count mchp_tc_counts[] = {
 };
 
 static const struct counter_ops mchp_tc_ops = {
-	.signal_read    = mchp_tc_count_signal_read,
+	.action_read    = mchp_tc_count_action_read,
+	.action_write   = mchp_tc_count_action_write,
 	.count_read     = mchp_tc_count_read,
 	.function_read  = mchp_tc_count_function_read,
 	.function_write = mchp_tc_count_function_write,
-	.action_read    = mchp_tc_count_action_read,
-	.action_write   = mchp_tc_count_action_write
+	.signal_read    = mchp_tc_count_signal_read,
+	.watch_validate = mchp_tc_watch_validate,
 };
 
 static const struct atmel_tcb_config tcb_rm9200_config = {

---
base-commit: 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
change-id: 20250515-counter-tcb-b6ae1945210b

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


