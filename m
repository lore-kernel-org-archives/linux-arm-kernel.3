Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB9ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 01:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DUXruvI6dh0KtBjZolwndMpL8EUTZ9m+PxxTCcUYIlk=; b=bjKI3i0bLYbKXA/6IXne/doTHi
	e2gNUk+LAlRG1cBNzc2zS6BLODm2VOb6NMNCeSl3CAY9se9DAnwrq1CIYd6MNN4OIHWSrOt13hXwe
	2mJMxsLhfSG5O2ZrxzgQfxe/OW6Age+YiXGNaMAyY3pIDswrDIf8NTYAiOCU/GNNVd8aeF4fmo9ql
	386nl8wky7invTxzacckfRKgckAlXYLKkzF4/eFQO1nkzU/wyOKmCx2oxR9lhLzqeIxB/CZx6FLG9
	MOezd7suMx0rphfRPXyjTrHr4g1QOeVEHZ0KM7MmFIs0r+H1LugVV2bIrIoIDDFxHjpPUN66A4p94
	0cM0V/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uldqm-00000009WE8-3JjH;
	Tue, 12 Aug 2025 01:30:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXOy-00000008oBE-2oxV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Aug 2025 18:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DUXruvI6dh0KtBjZolwndMpL8EUTZ9m+PxxTCcUYIlk=; b=ZG4wmvRmS4h+0UuazLheolq1t1
	M22Yxy3giPYoymg7eF+OMwaIaZ7xj066nkXHRZxn6yY/menixaVO1+efqf92eHawrpmWTHLvb8du8
	9D83Jk3IGwO/5UhcFARI2lZcxmFodaHgTj6MjHV6KQ+k1Ib0Tf4dTCTg9jaMeOq5BOt3V1Ik1rDS2
	AhWl980sj3wI3Bf7XjtPhOZF8tIfz9NULoiNbzbOfFi+9OAEbz3LyyYFS2du0k69zOlMi5fJoznkN
	LS3GBxmzcg1aTnOrdjAWGRlP1evPh2ps3RdZoB5HL2axa3QQrbmirFAipf2N3SBJrhWCFdunHqqEE
	nzkX5HAw==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXOo-0000000FTTR-32Lk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 18:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=DUXruvI6dh0KtB
	jZolwndMpL8EUTZ9m+PxxTCcUYIlk=; b=gameY8rukG96GHwQ2/tKFWfUQjUQhr
	h5uUc/8UyPAEIhW0UEp7OZwdt9xQCHZ0o0eiguJH34dTaq7dYEOhtqHkANmRCRff
	HhwUyMuUJPSKZsuR8TKzyofNOrAxwT7WpMd9dA21+pTAbG8g3RnIJogVeR3zMuww
	LpTOShc2YEr975tazmjBtpNnCkkoS8tA/EeuHKfA5yVrDjr5xBI4Mqu4y2nbuNpe
	yXaVo+aqZnYoTBbF4g518I6XGvyoZE4pxNqoyD4EcE1GfDlMDpS1CK2Wisgh1nUS
	j6y3/Aw9X9A9EESydrp5x6MV0/Gs7aCGgMygP0NesQGexHFQ3BM04bag==
Received: (qmail 2896133 invoked from network); 11 Aug 2025 20:37:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2025 20:37:14 +0200
X-UD-Smtp-Session: l3s3148p1@UqhXNhs8zOptKLEm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND 0/2] ARM: dts: use recent scl/sda gpio bindings
Date: Mon, 11 Aug 2025 20:37:09 +0200
Message-ID: <20250811183711.8980-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_193734_893711_2E93E893 
X-CRM114-Status: UNSURE (   7.81  )
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

Some ARM boards still use the deprecated 'gpios' property to describe a
GPIO based I2C bus. Let them use the proper '{scl|sda}-gpios' property.

Based on 6.17-rc1. No dependencies. These patches are the leftovers from
the series for the 6.16 cycle. Please apply.


Wolfram Sang (2):
  ARM: dts: cirrus: ep7211: use recent scl/sda gpio bindings
  ARM: dts: stm32: use recent scl/sda gpio bindings

 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts | 4 ++--
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.2


