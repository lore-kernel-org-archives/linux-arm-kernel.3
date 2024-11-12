Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C552BD597B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 23:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6WWz//nSWu13Rk2hR17kLEi/SWTpz7lU17SkhzgBF0=; b=C6K5VWC0d01PDUctT9YRW4qGTa
	AV10wuw3NyNGobVf/NMlwKYfDaSE0uSgwO6FJLSiyyjuqwjJTXR/tiYZe2IlzvapMUjg25RpEEDlu
	6gs1ilUMQL7sFh1xOCz9zk6rTUvVeQ2LwVcuo5NMtdjjyeewSMd+UspdW9SIf7+6k9yMHjd3jETqT
	1uHLpFrrJfjjsg+x4aVNBKghUDruQFllriYEJjW3gu9Ux5ADZLkENxHcEgydEjUVaahO07g3f1yqs
	ejE/Q27DDk3ID/2kMq0wUj2Wig1LkT6Ak9ptxNKcPfca6xnOyFv6RcamcpZk6l6QrkIVtVkSGeZD4
	lYSEWyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzyF-00000005EGJ-3aLV;
	Tue, 12 Nov 2024 23:06:51 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzss-00000005DGO-1ZNQ;
	Tue, 12 Nov 2024 23:01:21 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 528CC12000F;
	Wed, 13 Nov 2024 02:01:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 528CC12000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731452463;
	bh=R6WWz//nSWu13Rk2hR17kLEi/SWTpz7lU17SkhzgBF0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=tfqIf+D2WV3PG2BjQLgEsODuRAsdpGBhUM4IhaN5AQU3T8LjW83E/gY2p3Psz6HUN
	 fwEmKGhiAxQczKWcPdoOU/ENwfG1Q+ARivrcnz6OqoNjMw0dmUyTQAQauQxNt6oEWp
	 SPiBZn5dH6VzJpkhNrCc6UT7GNsdMkj6ahuKPy8LOGnAxa4vU/jabfY9XBx+nJ9QGg
	 HEuqz/WMQETjC81FAqbYyejehMW3myp7j4uu5cvLlGRsInanmuW7++zhSKjPP0+6hV
	 ajG5O/X3xqPIDvfMoYCwEhXQXYoM96JHaOT1jLkkuqPABw+WNHux9VK7fcqFGAmtND
	 YO9QGg/PR84WA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 13 Nov 2024 02:01:03 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: reset: add bindings for A1 SoC audio reset controller
Date: Wed, 13 Nov 2024 02:00:55 +0300
Message-ID: <20241112230056.1406222-2-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112230056.1406222-1-jan.dakinevich@salutedevices.com>
References: <20241112230056.1406222-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.128.42]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189131 [Nov 12 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/12 21:10:00 #26864167
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_150118_762542_93AC473E 
X-CRM114-Status: GOOD (  13.27  )
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

This reset controller is part of audio clock controller and handled by
auxiliary reset driver. Introduced defines supposed to be used together
with upcoming device tree nodes for audio clock controller fo A1 SoC.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../reset/amlogic,meson-a1-audio-reset.h      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

diff --git a/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
new file mode 100644
index 000000000000..7693552f1507
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
+
+#define AUD_RESET_DDRARB	0
+#define AUD_RESET_TDMIN_A	1
+#define AUD_RESET_TDMIN_B	2
+#define AUD_RESET_TDMIN_LB	3
+#define AUD_RESET_LOOPBACK	4
+#define AUD_RESET_TDMOUT_A	5
+#define AUD_RESET_TDMOUT_B	6
+#define AUD_RESET_FRDDR_A	7
+#define AUD_RESET_FRDDR_B	8
+#define AUD_RESET_TODDR_A	9
+#define AUD_RESET_TODDR_B	10
+#define AUD_RESET_SPDIFIN	11
+#define AUD_RESET_RESAMPLE	12
+#define AUD_RESET_EQDRC		13
+#define AUD_RESET_LOCKER	14
+#define AUD_RESET_TOACODEC	30
+#define AUD_RESET_CLKTREE	31
+
+#define AUD_VAD_RESET_DDRARB	0
+#define AUD_VAD_RESET_PDM	1
+#define AUD_VAD_RESET_TDMIN_VAD	2
+#define AUD_VAD_RESET_TODDR_VAD	3
+#define AUD_VAD_RESET_TOVAD	4
+#define AUD_VAD_RESET_CLKTREE	5
+
+#endif /* _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H */
-- 
2.34.1


