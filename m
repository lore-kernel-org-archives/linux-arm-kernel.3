Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E7BD68B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lsFacXP5o2cIfFFjFmHt4+id49zlrLdO2XORIjPTsvI=; b=L49cItyzTmVY6G
	XbuncTxgnqM0pNVnDUMF9trTurU9mqLgas2+eEJn4M7x+aLXkzDxUNPXZh3WMVzNRNRhQKB+UCrfS
	3f+pQJs5c6A+c5L/9G1ICXbGEvL86SxV/yyUo5hs22ePT74CZsw7MnXiEJghPdXX3FRxgDGZQia15
	gvsVA76wAHfuESYBym/FZT0oJbA+178eswF3L67dF5xSaO5zmor9T1mKuKnltpSe/AhR0UX3uOW16
	LNt0jrdPo9BDCweGHz0rYGlyYQN5M+vo3bPI4u0AE8YQ0vbUTIeKJ7tTCy2h1iEwAgkDQAWtj2dPQ
	PsbeSXm6ToYjLV3qK/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc8g-00000000GrA-1Dly;
	Thu, 14 Nov 2024 15:52:10 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc5o-00000000FqO-1RiM;
	Thu, 14 Nov 2024 15:49:17 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6D8A2100002;
	Thu, 14 Nov 2024 18:49:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6D8A2100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731599342;
	bh=lsFacXP5o2cIfFFjFmHt4+id49zlrLdO2XORIjPTsvI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=kXloHT1HT2fl4vo9D14HHJ+tfNVXTgcdzLcP7cbMJG3e92pVtpaBJNgrmE4AD37FE
	 ut1E2T75pKRjrkFOryV7fs50WYGEYW5k2KGjlUVOyxvy1IScoUMBKBmWT6L/mC7KE+
	 kow794vbbvBhnDoY7vZdfhmUgMMrUy835N6q6M5bOJTZbhImM7s3cgFZMPBHWw1xdR
	 D3fmk1zKhinG6TtnD/7FvpmpmlKazqjiBEl7gV53dVmNlC8KUU0K+6E9YI/47keO5x
	 psEmFY1VBjuZR9rpS9TCWZ0bFhcuIw7v9ZDJWzLqJoSUq/HY9Dg3hmtvUK/han9zmf
	 FUFlHsAjasUJw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Nov 2024 18:49:02 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Christian Hewitt
	<christianshewitt@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>
Subject: [PATCH v2 0/2] Introduce initial support of Amlogic AC200 board
Date: Thu, 14 Nov 2024 18:48:54 +0300
Message-ID: <20241114154856.3353691-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.45]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189183 [Nov 14 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/14 12:25:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/14 12:25:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/14 14:31:00 #26861614
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_074914_515457_A52861AB 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

Changes v1 [1] -> v2:
 - added "Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>" to
   dt-bindings
 - don't share the definition of sound card between ac2xx boards

Links:
 [1] https://lore.kernel.org/all/20240521222155.28094-1-jan.dakinevich@salutedevices.com/

Jan Dakinevich (2):
  dt-bindings: arm: amlogic: document AC200 support
  arch/arm64: dts: ac200: introduce initial support of the board

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-sm1-ac200.dts      | 109 ++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts

-- 
2.34.1


