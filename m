Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EADC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ETlp9qz3bJhFa4EIWRrMESKcgInIfcI4yRF4EIaahA=; b=D0+XMDnkM9h6c4qThBHlBPQ1ps
	IU2BwOd4G1sU04N4++CLS4pYioxHLMKmfE/rUPJF0bKqpP/RcZfX8s+Beu/b1dRHgoRWeUQRY7Uay
	tP/5Rj0qJ+h9Rkc6PuANEQx/l0M3BPmSAcP2xVxw78AuI7O7v7HxC7V3PfA7q5LMF1G1dksus7Whn
	/Ru+iPBSNYzbrB2ueT54sV6B6toNEmqw2KlGmLyvhlf+0faLipmg3Ws88Iejwh8kSQR4FRz77B4/Z
	DSLoFpucG8Qx2weoUPe62lUUZ1kRj0yPCgL/XjfaTGch1MT43Eenn9Ss+pbelpzIolqsqWo0XqESI
	Z4Fb56XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEJi-0000000BTiv-3c9v;
	Tue, 20 May 2025 04:11:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEFx-0000000BTNM-3zDR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 04:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747714030; x=1779250030;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=nJ6KedU+uwmf+BdiivShjd5wAvlcvkmQJNTkCjp/w7U=;
  b=VTPm+l1ZsG+sk4dGamLMuJxNECouVEcbQN/nwUrWPFqtHmNhepSi6YSE
   j95viCGkttu/N2cIrJQArhz84gMwyt5QPu5uj79LDIipYWw4uzzNL9JaD
   82c/OX3Kqa9cWlA+dNva4T4CI879LOaHvy8Zg1iHOE8EzWULBKOoQXpV9
   WuAK1vrm2PeYzgXg/+GYmNI8Tpq9YHwKZoUyChCEPT9PNhx1OrludgoXT
   YOHYYTLMW6dI88bYx72qdy3fHBDGbghNNPa9caTkfv4kXHtuH8aVi0HEu
   wEQ0UilVRnHPtUQYourv1YemBzxKTTypXcNosTfayFPXUjUzyubBWDBd3
   g==;
X-CSE-ConnectionGUID: htdO05ITRmGW9JMUEmdDwA==
X-CSE-MsgGUID: SA2rPMYOTAikDw/z7EgqDw==
X-IronPort-AV: E=Sophos;i="6.15,302,1739862000"; 
   d="scan'208";a="42370416"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2025 21:07:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 19 May 2025 21:06:51 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 19 May 2025 21:06:49 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 20 May 2025 09:36:42 +0530
Subject: [PATCH v2] counter: microchip-tcb-capture: Add watch validation
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250520-counter-tcb-v2-1-a0617d2d220a@microchip.com>
X-B4-Tracking: v=1; b=H4sIANH/K2gC/23Myw6DIBCF4Vcxsy4NQ8ReVr5H40JwLLNQDFDSx
 vDupa67/E9yvh0iBaYI92aHQJkj+7WGOjVg3bg+SfBUG5RUWmrUwvrXmiiIZI0w3Uh4a7VCaaA
 +tkAzvw/tMdR2HJMPnwPP+Fv/OxkFCtLtRXZI01XO/cI2eOt4O1u/wFBK+QJc/o4mqgAAAA==
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747714007; l=3393;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=nJ6KedU+uwmf+BdiivShjd5wAvlcvkmQJNTkCjp/w7U=;
 b=sdEXf/+Re7V9JjOqNQgcwsFvPcFR9hosuiKoqjZJkUxIZEMam5GP0cCbMCYEFUnZvzeNfuyuL
 uAG79cGYJKwB1dQyP7faOWZroB84akV8zRoJBlN+Ivlnny6sLWwiltU
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_210710_285425_506CEB5E 
X-CRM114-Status: GOOD (  15.70  )
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

Any other request is rejected with `-EINVAL`, preventing undefined
behaviour in userspace.

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
Changes in v2:
- Include COUNTER_MCHP_EVCHN_CV as well for the sake of completeness.
- Adjust the code to ensure channel limitations.
- Drop sorting in this patch, will be taken care seperately.
- Link to v1: https://lore.kernel.org/r/20250515-counter-tcb-v1-1-e547061ed80f@microchip.com
---
 drivers/counter/microchip-tcb-capture.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 1de3c50b9804..fe817f4f1edc 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -337,6 +337,27 @@ static struct counter_comp mchp_tc_count_ext[] = {
 	COUNTER_COMP_COMPARE(mchp_tc_count_compare_read, mchp_tc_count_compare_write),
 };
 
+static int mchp_tc_watch_validate(struct counter_device *counter,
+				  const struct counter_watch *watch)
+{
+	if (watch->channel == COUNTER_MCHP_EVCHN_CV || watch->channel == COUNTER_MCHP_EVCHN_RA) {
+		switch (watch->event) {
+		case COUNTER_EVENT_CHANGE_OF_STATE:
+		case COUNTER_EVENT_OVERFLOW:
+		case COUNTER_EVENT_CAPTURE:
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	} else if (watch->channel == COUNTER_MCHP_EVCHN_RB) {
+		return (watch->event == COUNTER_EVENT_CAPTURE) ? 0 : -EINVAL;
+	} else if (watch->channel == COUNTER_MCHP_EVCHN_RC) {
+		return (watch->event == COUNTER_EVENT_THRESHOLD) ? 0 : -EINVAL;
+	} else {
+		return -EINVAL;
+	}
+}
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -356,7 +377,8 @@ static const struct counter_ops mchp_tc_ops = {
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


