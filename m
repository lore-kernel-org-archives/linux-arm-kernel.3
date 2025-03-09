Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F72C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=38pc2HrGEn22seG8bYETzhJAzcp/r821LyC9GborcOQ=; b=FZjTbSuCiDlmD5
	jQn8IuNAokohR49ZCaqwBuOAEuvmqHfYUpUJJK6zdW4GxZos8qVgYtNXjDkUsbiaINbBomlZwBmT8
	mJA13A3MyZS+Ol3QBH2/cJhveqgl3afQ+fARcPEft1kkDtKUO22dEG/gyq9kD3e6qjKCTS48yAird
	bo4bjxe1Q8UdSeXVAeN8pnyhNNCsEBtGUEAUkM2O8FULEDuWzlm1CPgMrj/FvrQu2lI1X/d+vjHlh
	08NBzR3+OTINEUZsJBKj/yWRM9Z7aU0tvT3saFAiprh638mXtvzba1knJVAgI4mHSWR587WmTq8Ba
	eh37Cbh3adlYlPWn+Gog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLRa-00000000yev-2TmK;
	Sun, 09 Mar 2025 18:32:10 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLC4-00000000wel-0tYI;
	Sun, 09 Mar 2025 18:16:09 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A7A97120004;
	Sun,  9 Mar 2025 21:16:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A7A97120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544166;
	bh=38pc2HrGEn22seG8bYETzhJAzcp/r821LyC9GborcOQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lWf1R2q3Y9vIzUvEUxW8WMbsN4mTWPOfyx3qoa3zSoodKL/iLt6tV5B74MlP8LgOA
	 e8+nSN8SXymf5XUTE81x3TbuBHdPzv2u0SAFMMmZaJ9LDpx2PVG1mTU77L6u+i+jj2
	 BTCelsL6S85r+B7buA69Sazi0BhjVyhT18/5SBzbCGcdW3QBG94gIxTIrDMeKa7DSB
	 vPE0SdKSTBQi/P9IqIj0X77EYGHwc/ZrD3G8keZXOsTFECBC4U/l53E4wrfJecVoII
	 ff0NHdP5BuOVewXCXiI5iFD2hTZulPLD4N0r02vTWSir2dswRdO1kxd7vTmaqCwKUH
	 kB8MPnPaNcXMQ==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:16:06 +0300 (MSK)
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
Subject: [PATCH v2 0/4] ASoC: meson: g12a-toacodec: add support for A1 SoC
Date: Sun, 9 Mar 2025 21:15:56 +0300
Message-ID: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
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
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/03/09 17:18:00
X-KSMG-LinksScanning: Clean, bases: 2025/03/09 17:18:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_111608_606666_839C6848 
X-CRM114-Status: GOOD (  11.42  )
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

This series adds support for A1 SoC family in g12a-toacodec driver. The main
change is that the driver now supports capture streams which are suitable for
ADC found on A1's internal audio codec.

Changes v1 [1] -> v2
 - detached from v1's series (patch 6, 7, 8, 9)
 - reworked the definition of bits

Links:
 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/

Jan Dakinevich (4):
  ASoC: meson: codec-glue: add support for capture stream
  ASoC: meson: g12a-toacodec: drop the definition of bits
  ASoC: dt-bindings: meson: g12a-toacodec: add support for A1 SoC family
  ASoC: meson: g12a-toacodec: add support for A1 SoC family

 .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
 .../dt-bindings/sound/meson-g12a-toacodec.h   |   5 +
 sound/soc/meson/g12a-toacodec.c               | 242 ++++++++++++++----
 sound/soc/meson/meson-codec-glue.c            | 174 ++++++++++---
 sound/soc/meson/meson-codec-glue.h            |  23 ++
 5 files changed, 358 insertions(+), 87 deletions(-)

-- 
2.34.1


