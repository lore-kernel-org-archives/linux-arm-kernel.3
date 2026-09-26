Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB6C9833D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A9v+lq5mWAV72Yfuty4BldqMgAV25TnkmTFu7i2y98Q=; b=LAoGYgipZPipax
	GDP+a7gG1AytViizUR60eHQoThDxUX0vaXjKh35hhwI3QAnH58N78QelK/+7cpm4+LPNHuX/iEo47
	YjKzngrjRkS5kgGYIEQAl2RCA6OXSgxXBk5+IcePECR683kCV5/6P07pnli9Eja7xpQ/5Nl+vXzgE
	Rs40r1Jcc4r0s6u+PP+lhDu3Si5/0ohQgitdxbuQrWDYus8QS2gL7KkUDQtyeJF3B04f+XiaNdYID
	TBadFY58dUX8CmBtNVQaLoHMdivVppfvICMl4cDn8Cfakxg8RS7aVxtOYQV53s6qnEbHj8IF2A15b
	2qMRtggwfVGaX00VLkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATlI-0000000FY7h-38Hh;
	Sat, 26 Sep 2026 14:52:24 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATl7-0000000FY3L-2sMA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:52:16 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790434325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A9v+lq5mWAV72Yfuty4BldqMgAV25TnkmTFu7i2y98Q=;
	b=LWxRlisfozjEhIessbuyZAk7IaeAMUg+HKCT5qMWQvG1zpBKMqtED9r5oByf6asRZD8SE+
	gbfL1ThShjc3nKZ9Hax3VbKgf1d0prqblzjcFU6L/zhuC1aKBo0G9TGKavkXh5Y6Ps4FFT
	LSxt4WXpb+plKo2MG/8iz+kitjTUKhU=
Subject: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
Date: Sat, 26 Sep 2026 16:51:44 +0200
Message-Id: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQqDMBBEf0X23JRsULE99T/EQ4ybukU0JGmoi
 P/eaO89Pph5MxsE8kwB7sUGnhIHXuYM6lKAGfX8JMFDZlBS1fKmKqGdm0g4nk30k4gNllJIUkr
 bEmvbGMhN58ny57S23Y/Du3+RiYfqSIwc4uLXczbhkfu/kFBIgVhhP2irrLUPs/bk88UlXAdK0
 O37/gVqM55VzQAAAA==
X-Change-ID: 20260925-apple-pinctrl-t8140-0e22af416f8c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_075213_940170_E7B468E9 
X-CRM114-Status: GOOD (  11.41  )
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

This patch series has fixes for probing the pinctrl_ap GPIO controller
on the MacBook Neo. The previous code would crash in the regmap_init on
this device, since reading the REG_GPIOx for certain pins causes an
SError.
To mitigate this, we adapt the gpio-reserved-ranges property to describe
pins which are unusable and whose REG_GPIOx should not be accessed.

Also add the new t8140 base compatible to the dt-bindings, signifying
the different behavior of the t8140 pinctrl_ap device, and make the
driver accept it since it now respects the gpio-reserved-ranges property.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260925-apple-pinctrl-t8140-v1-0-1151bdaf2fff@cyberchaos.dev

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Yureka Lilian (2):
      dt-bindings: pinctrl: apple,pinctrl: Add t8140 compatible
      pinctrl: apple: Add t8140-pinctrl support

 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml  | 12 ++++++++++++
 drivers/pinctrl/pinctrl-apple-gpio.c                | 21 ++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)
---
base-commit: 63fcbd85bbb795805ce1014637de186c647fa59d
change-id: 20260925-apple-pinctrl-t8140-0e22af416f8c

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


