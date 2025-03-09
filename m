Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B7C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NK0/S9lD6J4LrJ0za2Y5lt/Fq95o4i6toJkcTTbksdo=; b=BP79kAuNbVPx9rE1NpGB5irNQp
	7Ix75d9VCvwzhfs4bxQLbzEt8i2oFg/NVd/pWZSuqxSs3eLfMN4I/wtH5b6VWNikQ4nGBnJx8QoM4
	N14h2fbpqsNErIuQJ0aAAtiVZk+A5kpHGX0e/uYDimL0+g5SGcTPIlGl5M4tqCOVagJnNTzfq374z
	DoRKleabyYRsH1QVgwCVvwZaB8a8Pqo7RLykFUznIDWiUX/57M+JQTv85ApWbFvvm3Bo1pYnTSoW5
	350tCPsIMqioNX5H7DDv8KcVLWxgiq9jy3R6L5OzEEWxUoFeyA5xq0rl4a/dlwg7wlZnDhXHR2bip
	pC2t8jew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLUl-00000000ywf-2Kox;
	Sun, 09 Mar 2025 18:35:27 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLC5-00000000wex-1KWY;
	Sun, 09 Mar 2025 18:16:11 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E0F0C100006;
	Sun,  9 Mar 2025 21:16:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E0F0C100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544167;
	bh=NK0/S9lD6J4LrJ0za2Y5lt/Fq95o4i6toJkcTTbksdo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=a9kYQhLSEKIt9eH6h05y5xl2QBhpA6VlsTPW615kc77SZZOXCMnmdOuzKpgIOpobO
	 QvQdxHs4WPutsKwdFD/Xs0Dq/IvMdzi9RQC7IXwET26Vo1cGWFFhlqVe4QlcvKHSVO
	 fbAZKDdnmcR+b058Ct7VP3b8Z21oY3rW9JOlFcoRaYy6UUpcaVWkTHPWQR5B8HF/pN
	 kGWZDtWVN2ArLvfMTuQ31p6vk+F3K7Guq22gLh0AeWLkI7vdysd1C8nXsCBvVyDmKZ
	 p30kGxlC3p5vEB1S5JlzgcG/UV/iWf2STa1CU5f2V0mU/qAoRObNOBuiX0bb99jTM2
	 qrcA71gAq0NBQ==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:16:07 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Takashi Iwai
	<tiwai@suse.com>
Subject: [PATCH v2 3/4] ASoC: dt-bindings: meson: g12a-toacodec: add support for A1 SoC family
Date: Sun, 9 Mar 2025 21:15:59 +0300
Message-ID: <20250309181600.1322701-4-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
References: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 191599 [Mar 09 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, 127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_111609_692059_4D21B64A 
X-CRM114-Status: GOOD (  12.16  )
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

Add support for "toacodec" audio component found A1 SoC family. On this
SoC the component supports capture streams, additional DAI ids are added
to configure this feature.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 1 +
 include/dt-bindings/sound/meson-g12a-toacodec.h              | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750..c47604aa590f 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - amlogic,sm1-toacodec
+              - amlogic,a1-toacodec
           - const: amlogic,g12a-toacodec
 
   reg:
diff --git a/include/dt-bindings/sound/meson-g12a-toacodec.h b/include/dt-bindings/sound/meson-g12a-toacodec.h
index 69d7a75592a2..f726e2c6064d 100644
--- a/include/dt-bindings/sound/meson-g12a-toacodec.h
+++ b/include/dt-bindings/sound/meson-g12a-toacodec.h
@@ -7,4 +7,9 @@
 #define TOACODEC_IN_C	2
 #define TOACODEC_OUT	3
 
+#define TOACODEC_CAPTURE_OUT_A	4
+#define TOACODEC_CAPTURE_OUT_B	5
+#define TOACODEC_CAPTURE_OUT_C	6
+#define TOACODEC_CAPTURE_IN	7
+
 #endif /* __DT_MESON_G12A_TOACODEC_H */
-- 
2.34.1


