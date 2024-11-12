Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021A0D597B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXjF/08/uHuNwfsNL3HSBdbEnOMXo3XKzT0FEL1U4H0=; b=eFrrzNQng+QhXcUnHh+HSGpoSn
	5W9U1ZHhD3jiiU3YWwFXhM7bTX1bxq9aCOF28K9wXo/RV1X1nIS/j08297k0u0r6JfIPLkXjUAb4m
	esBoXye3m+TnmwQcGvJogR/S53NB0Sv2Xi7ojLNS98hDYspqF3i7fdy5cpaZTnHpwAlP5a1oSPJwa
	zcbrxAWLVnhzgQGDUl3W9c0ijDLos+ejKRO1fDAYKc+NrqA4C73o2Gfs7b6WFIy3AOWIfZ9qGgcAF
	DtEfTWgdhVRSeeEsRRAczZyIcZ1QSSKlKNe1JHytYJBupGP1YUlQAffRH8b1eN+umh1nq4kN7Pzc2
	bZIH0KsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzug-00000005Ddy-2fhL;
	Tue, 12 Nov 2024 23:03:10 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzsr-00000005DGN-2HrR;
	Tue, 12 Nov 2024 23:01:19 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9C924100005;
	Wed, 13 Nov 2024 02:01:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9C924100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731452463;
	bh=cXjF/08/uHuNwfsNL3HSBdbEnOMXo3XKzT0FEL1U4H0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=HcG30ugSU6t64rj37M6G2AX3xe2/J1fBvwQT5XW2Oyr2gJ6CjWYK0m10IIkNGlTSb
	 oCc9e4Se7xBpdHqsbH+S7v7jORY/Zy+YBR7ILOg114zXhgDX9QAiJDJpL88iHYFzCK
	 1DpHobygxLxhLPDfMKU6CbwQpU0sKXRsGuON7NQMHaylma792OaQMOUVkyVVh91zGO
	 0l2CQw6ZitCSKoPbhMjdiSJZ8vRKrg1GQb/PJm7NEW3vDY6hh/esPPIsaPDiEaKSyf
	 GJlwErA5Eqh/8FCxjvXZP6E5c9TlHpjPw8vpSDIW7TcN8ya3gQtE/Jey153S1Ckx3e
	 94FBbCbVBcMew==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
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
Subject: [PATCH 2/2] reset: amlogic: add support for A1 SoC in auxiliary reset driver
Date: Wed, 13 Nov 2024 02:00:56 +0300
Message-ID: <20241112230056.1406222-3-jan.dakinevich@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/12 21:10:00 #26864167
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_150118_269699_6B033661 
X-CRM114-Status: GOOD (  12.32  )
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

Add support for the reset controller present in the audio clock
controller of A1 SoC families, using the auxiliary bus.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 drivers/reset/amlogic/reset-meson-aux.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
index dd8453001db9..4b422ae5fcd2 100644
--- a/drivers/reset/amlogic/reset-meson-aux.c
+++ b/drivers/reset/amlogic/reset-meson-aux.c
@@ -26,6 +26,18 @@ struct meson_reset_adev {
 #define to_meson_reset_adev(_adev) \
 	container_of((_adev), struct meson_reset_adev, adev)
 
+static const struct meson_reset_param meson_a1_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 32,
+	.level_offset	= 0x28,
+};
+
+static const struct meson_reset_param meson_a1_audio_vad_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 6,
+	.level_offset	= 0x8,
+};
+
 static const struct meson_reset_param meson_g12a_audio_param = {
 	.reset_ops	= &meson_reset_toggle_ops,
 	.reset_num	= 26,
@@ -40,6 +52,12 @@ static const struct meson_reset_param meson_sm1_audio_param = {
 
 static const struct auxiliary_device_id meson_reset_aux_ids[] = {
 	{
+		.name = "a1-audio-clkc.rst-a1",
+		.driver_data = (kernel_ulong_t)&meson_a1_audio_param,
+	}, {
+		.name = "a1-audio-clkc.rst-a1-vad",
+		.driver_data = (kernel_ulong_t)&meson_a1_audio_vad_param,
+	}, {
 		.name = "axg-audio-clkc.rst-g12a",
 		.driver_data = (kernel_ulong_t)&meson_g12a_audio_param,
 	}, {
-- 
2.34.1


