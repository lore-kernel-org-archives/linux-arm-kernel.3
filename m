Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE87C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LvnTlhZLgvZ9jdZKRD2KGHnNWbB6ALogZvDb15fdpew=; b=AATzjDQrEW1vhP
	8ZlCIe38iaiD+IMFZpS+7c0X/YKk7lbdGUAzgWw6Pg5V8boR4xdxXJyAlnJ7Tamdgrgtly8cTkQqA
	13O2YTtImrZaWaSxrQL9adgmBus88PXqFeAD/cJeNQkj6HWH+CegRdDw5JZGlOi/c+wlMZUUTa8hN
	+ekmsuxildO9sLZBB2LpUvAADxrEGqdP6n9RgnCR+nuWNOEq6i34AQrR7R1IF1nq+ZBaese5fw8RC
	tx1Nq0TLo4CLUnlFpkcAFmeg9xJlWoNFgcWY8P49WK39Nfqx6VoSYSJRy7eHcEu0pGyA4Hn9SfhGT
	TYIBlyX4MMuGOHPgW9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLZU-00000000zMG-2KlC;
	Sun, 09 Mar 2025 18:40:20 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLCX-00000000wn7-3xxy;
	Sun, 09 Mar 2025 18:16:39 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7D410120004;
	Sun,  9 Mar 2025 21:16:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7D410120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544196;
	bh=LvnTlhZLgvZ9jdZKRD2KGHnNWbB6ALogZvDb15fdpew=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=G8MpFoxNn2tu2bF9G5jlfv5/E+qaUFFNGkIOrGbVRo51FWCNLY5hyc6emtYprjkFx
	 1Os7qTurvyvhB7lLm4tjWr+fphIXmDjyGIL6coYY9rKiaeJPWzNPB4zN/3XnXnQK/A
	 OAoWm2Ei11xxlDQ5RqNokmUHNdyo0JCUDeG8KOppj5hkhWmj3azZJu7hhpsSn1ZU6S
	 TOpMsZP/26nJJ+Sw+gNGG1kxDloS2XzcZaNaTSidCSdrdroM0/beozQpFP83OAGeob
	 XRw+OCo1A3QYus768Vum+LPX+pP45/YafDHlX8JEoO8Q3yGdARraD8Igbak6qqlmIe
	 2lmpSb0qR2UKg==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:16:36 +0300 (MSK)
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
Subject: [PATCH v2 0/3] ASoC: meson: t9015: add support for A1 SoC family
Date: Sun, 9 Mar 2025 21:16:27 +0300
Message-ID: <20250309181630.1322745-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
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
X-CRM114-CacheID: sfid-20250309_111638_337922_8BA55F42 
X-CRM114-Status: GOOD (  11.00  )
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

This series adds support for internal audio codec found on A1 SoC family
extending existing t9015 driver.

Changes v1 [1] -> v2
 - detached from v1's series (patches 10, 11, 12)
 - configuration of linein/lineout/micbias is moved to device tree

Links:
 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/

Jan Dakinevich (3):
  ASoC: meson: t9015: prepare to adding new platforms
  ASoC: dt-bindings: meson: t9015: add support for A1 SoC family
  ASoC: meson: t9015: add support for A1 SoC family

 .../bindings/sound/amlogic,t9015.yaml         |  69 +++-
 sound/soc/meson/t9015.c                       | 379 +++++++++++++++++-
 2 files changed, 423 insertions(+), 25 deletions(-)

-- 
2.34.1


