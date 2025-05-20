Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B50FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=unH8lrgN6Fg20e0dPt3Zu2ZRkEMz1gcc4z5+8e0oLq0=; b=wcE6S9ERwc/gVwHlXy13rVrG98
	17EnYv4tdhuuLdzCrPY+IsjrEOdmxLatpUoAHGXHNfaNEg3WoNrIgqa6bscd6M32Pqv9322fI6Q0w
	Dy2Kxe/ZzOEzoIhqR3GBQBp04ePG3IfgqoYKxmE0ZZ42f1PY0qER/Ph4i71wCdvxgj6HKek5DY/Qz
	wDsZTSwDoi2A8GkhifGhKViYgrcX/G8k9lo9upnKGDeF8wq8Xomnu5FN5Dz6x47JVsEHUfEqpQYXw
	fWKJSbSn1yIKD7EBXxO51tqLTOKsYdzGBTgrRCRoTfZvzgetOE0+Ca5YdvHbS90zDTcThQhgHu7ZD
	fxO/zdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOvt-0000000DMHz-2vnO;
	Tue, 20 May 2025 15:31:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOnS-0000000DJp0-3Y2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747754547; x=1779290547;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=TOckte/RXxhhtZxgfzD8giJmyAbKzFbnveOMKN1CJ7E=;
  b=MAbiLuF8X9nbRqjQBkdg8bzyesCAZ/d+iFjQzPkenfAYM8EsmXXEQS/K
   2puc8So9oEJF2XayExNioGNh6Hk9FIM+Z8kvwQSx+wVhzvcC2BDsf95g1
   YXIoqlmGdVsr1FMGe9orw2NS9PcRELI5Lm+GOEgYypcpGU56qprwUr2re
   XoGOw0GJpHzuUWW0H2s4jtz3TD54WlyhcmpyKW5crFFtjMvwWqjmcu3PL
   ncAG6bPPeKpdAtVi3b38RKX5ZTzSKGPU0ZoE9zq2ZMGsrz831gex55CRf
   BeHBNtNznXXIalrSxUfjm9aZtlQfSMKENh3DG1eAK4Zq8e/8ZHdWk5E4V
   A==;
X-CSE-ConnectionGUID: Mv3k4QTqSfuckgJwL9Kybw==
X-CSE-MsgGUID: R5ra95CaR2KdyZQCHjO6ng==
X-IronPort-AV: E=Sophos;i="6.15,302,1739862000"; 
   d="scan'208";a="41853373"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 08:22:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 08:21:52 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 20 May 2025 08:21:48 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 20 May 2025 20:51:46 +0530
Subject: [PATCH v3] counter: microchip-tcb-capture: Add watch validation
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250520-counter-tcb-v3-1-4631e2aff7ed@microchip.com>
X-B4-Tracking: v=1; b=H4sIAAmeLGgC/23MQQ6CMBCF4auQrq3pjBTUlfcwLko7yCygpMVGQ
 7i7hZUal+8l3z+LSIEpinMxi0CJI/shj8OuELYzw50ku7wFKtRKg5bWP4aJgpxsI5vKEJxKjaA
 akcUYqOXnVrve8u44Tj68tniC9f3fSSBBki5rVQG5o2ovPdvgbcfj3vperK2EHx7Vt8fsTca1Q
 4eozK9fluUN+ewv8eoAAAA=
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747754508; l=3596;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=TOckte/RXxhhtZxgfzD8giJmyAbKzFbnveOMKN1CJ7E=;
 b=wn+a9fjoolTdBjvBYyQB/3JM0obFki/MI9r7lVs8n3lHFMJpxKAAUmnoQ89tYB26zcm++sFos
 M6I/YoN6YhtA7bxDVWGwabKlXvljmGicckGjlWxC9NJ18nbTWqufY3z
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_082226_978382_1A07D5F9 
X-CRM114-Status: GOOD (  16.21  )
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

The Timer Counter Block (TCB) exposes several kinds of events to the
Counter framework, but not every event is meaningful on every hardware
channel. Add a `watch_validate()` callback so userspace may register only
the combinations actually supported:

* Channel 0 (COUNTER_MCHP_EVCHN_CV, COUNTER_MCHP_EVCHN_RA)
   - COUNTER_EVENT_CAPTURE
   - COUNTER_EVENT_CHANGE_OF_STATE
   - COUNTER_EVENT_OVERFLOW

* Channel 1 (COUNTER_MCHP_EVCHN_RB)
   - COUNTER_EVENT_CAPTURE

* Channel 2 (COUNTER_MCHP_EVCHN_RC)
   - COUNTER_EVENT_THRESHOLD

Any other request is rejected with `-EINVAL`.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Tested the code on target (sam9x60_curiosity) using the following commands

valid ones:
./counter_watch_events -d -wevt_change_of_state,chan=0
./counter_watch_events -d -wevt_ovf,chan=0
./counter_watch_events -d -wevt_capture,chan=0
./counter_watch_events -d -wevt_capture,chan=1
./counter_watch_events -d -wevt_threshold,chan=2

invalid ones:
./counter_watch_events -d -wevt_threshold,chan=0
./counter_watch_events -d -wevt_threshold,chan=1
Error adding watches[0]: Invalid argument
---
Changes in v3:
- Update commit description to not mention undefined behaviour as that is
  not the case.
- Use the early returns to avoid the else statements and code consistent with
  linux style.
- Link to v2: https://lore.kernel.org/r/20250520-counter-tcb-v2-1-a0617d2d220a@microchip.com

Changes in v2:
- Include COUNTER_MCHP_EVCHN_CV as well for the sake of completeness.
- Adjust the code to ensure channel limitations.
- Drop sorting in this patch, will be taken care seperately.
- Link to v1: https://lore.kernel.org/r/20250515-counter-tcb-v1-1-e547061ed80f@microchip.com
---
 drivers/counter/microchip-tcb-capture.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 1de3c50b9804..1a299d1f350b 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -337,6 +337,28 @@ static struct counter_comp mchp_tc_count_ext[] = {
 	COUNTER_COMP_COMPARE(mchp_tc_count_compare_read, mchp_tc_count_compare_write),
 };
 
+static int mchp_tc_watch_validate(struct counter_device *counter,
+				  const struct counter_watch *watch)
+{
+	if (watch->channel == COUNTER_MCHP_EVCHN_CV || watch->channel == COUNTER_MCHP_EVCHN_RA)
+		switch (watch->event) {
+		case COUNTER_EVENT_CHANGE_OF_STATE:
+		case COUNTER_EVENT_OVERFLOW:
+		case COUNTER_EVENT_CAPTURE:
+			return 0;
+		default:
+			return -EINVAL;
+		}
+
+	if (watch->channel == COUNTER_MCHP_EVCHN_RB && watch->event == COUNTER_EVENT_CAPTURE)
+		return 0;
+
+	if (watch->channel == COUNTER_MCHP_EVCHN_RC && watch->event == COUNTER_EVENT_THRESHOLD)
+		return 0;
+
+	return -EINVAL;
+}
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -356,7 +378,8 @@ static const struct counter_ops mchp_tc_ops = {
 	.function_read  = mchp_tc_count_function_read,
 	.function_write = mchp_tc_count_function_write,
 	.action_read    = mchp_tc_count_action_read,
-	.action_write   = mchp_tc_count_action_write
+	.action_write   = mchp_tc_count_action_write,
+	.watch_validate = mchp_tc_watch_validate,
 };
 
 static const struct atmel_tcb_config tcb_rm9200_config = {

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250515-counter-tcb-b6ae1945210b

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


