Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC9AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lr2T/VNgeTFspDjmoHod2aovQh7y4rJk7xKdeAYkRu0=; b=e2k5zyzAdZ4rmA
	eMf/Z71wS/vfwlAB9bflf2I2hCZLgfNSYfSqNDHhUDJiQMqUwy+wf1nCGyhUulE7tjkHC1jHWpxf7
	4DBNtb+4h0yNjO0QqEv0/VbWQ8xbRXHwTWcGGbGEvCakzL1tHdAUeLlikLgICLigobk3F7h4a3T07
	My+igO1O75qsapeVFc/tEWsRjJsA3KrDsnSmsDze9zls0g7DC+2s/TQ8zuDxUGMjV41OTk6bNk6Si
	OfdIyIMSQ9QT6mSnIoRO55jHK2dbGtHz2cWvL7DVl254zhzaH365F/f35LVc+A2Fwd0yjNk2WOj5o
	hC5V/vH6cOD2WEDmuZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfPp-0000000Bydq-06ou;
	Mon, 06 Jul 2026 09:15:01 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfPl-0000000BycD-3UPC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:14:59 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-8478cc93299so3054772b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329296; x=1783934096; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lr2T/VNgeTFspDjmoHod2aovQh7y4rJk7xKdeAYkRu0=;
        b=FgcmWG6XSaAhTOfdZ+NY9tg0E1pTOaYkrtHms40VSDCxUEvMi8lxEnKC6xhb4XX0dJ
         D5t3RL/nFCY+6fZXn6jvzEEU4Xz2Kscx2wAs8/Vh0Vv+LYsZ8f40UbR8IN4JjJqSrMdJ
         QCIqDlZJeJC2QtjvhczImzL2bTFqM6b3I9eoGb6Y4dodYqqzIzwy0N5LoBNsVeJ76V4Q
         0d67xuoTtnhS7fFvrRMF2rL2sDsZOtiiR40886nazrcBHqRY2jnE1SJV88v7M3TqkhYc
         N3nFPrT0yrwGW27RQfM9rze8vSv2ftZnIBjTJUg1YP4XFYum+yog+UCeROUt0drmGjBz
         Bsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329296; x=1783934096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr2T/VNgeTFspDjmoHod2aovQh7y4rJk7xKdeAYkRu0=;
        b=nJEaTacyBFwjNMMQsXLQTId3XOORZGU0w9gT7I3SO/cn53fBJYgTWVcYz5/arCq1IR
         c5/rTRARkVANgNK2xIHPpb7Gx7906UDU56Ap9DkxIPJ334I0V4OXb9yblnlG6ZsuAWs1
         zlzxzud4P8Y8x+Opt4LNW5HisnRUMGFIuVL8zKseR1AcnLtD5NxfHzVsN7t5xxKn71G2
         aRwsXy2j5AwHBUFDWWW+bM5g3t68yr5N6ppk+wlO2/ezll0+hXWGlKAl/Le6R0B35g8N
         avnBAxPx7u6VzhyblMXShiaqUwP0ky5Fx0aQG+fBAhO5L9J7pXixJAX7m08ZveUwVC6T
         C9Eg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6kjDCA7xzbX8hCMag7b/Scls8vuumeKcowFB9TPyA62zwY5+tRG83Zn2gVs0ZlyLaOECrqiTlkHatg5Ugq06R@lists.infradead.org
X-Gm-Message-State: AOJu0YzKXujLwoXVr97+toOLDZK8bKEEik04Zk+kbT3/vDnpOmn4yHNd
	aIUwBN6jD/2lgmNup4+RWLHP0vNDRJHUOaxpyzKuVWI9Ka0uEJ2SJSY683UP6Hv/Id8=
X-Gm-Gg: AfdE7clbOVAkF/IaSSjM34nQ982/DkCB0paDmo+KcoWPC4KWOzzaYlJVrIEwpQdByjI
	uwBoTVjkklUWBzmBKA0wLv3VFOpyNiFqbYjb3RsvzpvNWQJYnqQ3dp06ZUHocKurDKBrIK3PRb5
	jRQpAH5p5P+2eWGkEmUm6pw0vjiI1x+wZrqv87FIvOGyH1RDxHUPmbvN63znZCr2Qjcu8G84AxR
	qvxf5epQLD2ZIQSysrlrDvu7ehM4q0qshK39cV6TJhxH1MdH7HZp/UQlp/n6Wr68CGq25dWWqTN
	ZXIWkWYV5I651f9IfQiA/nBtaXtZFhg/K4+uQ5fFVcErCG6sGc4O2UvivMWxhYxxCJzKlpP17SI
	mKQSBnQwXPbUwPqF0SZ4ccQWZYUrT5eWsVV3W5aWSJgE9dO4ikLe/pDjgHJdPmH0gDwFjwUJtPj
	5cZQ2qiEvtQknmDz9y3eEqPKZS
X-Received: by 2002:a05:6a00:928f:b0:842:80c5:c420 with SMTP id d2e1a72fcca58-847f6ef68camr8193652b3a.40.1783329295132;
        Mon, 06 Jul 2026 02:14:55 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:14:54 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Subject: [PATCH v2 0/5] ARM: rockchip: rv1126: Add support for Alientek
 ATK-DLRV1126
Date: Mon, 06 Jul 2026 17:14:40 +0800
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ML3aIyQ0MjM93EnMzUvJLUbN2UHKhIiqVJYlJKcpqFqYWBElB7QVF
 qWmYF2OjoWAi/uDQpKzW5BGSeUm0tAHxpGmR8AAAA
X-Change-ID: 20260618-rv1126-alientek-dlrv1126-d94abdcf8580
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329286; l=2237;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=cLIYaTp8BMdNpvmeNN9IHEGffrelsNbt22peLlfH/xI=;
 b=n9ZjERAhzjx2V7crs7HJzpo3tqAmQ8t8NqGgffNufU3uJAKs2gRa4YnXgybLrwGB6BscbMpTf
 6R7McTRg+88CmER536i37fi+k30MyFTlhzIpbLcmMPD4KH0VhdznWAN
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021457_869655_E0AC46C5 
X-CRM114-Status: GOOD (  12.93  )
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

The ATK-DLRV1126 board consists of a CLRV1126F core module and a
DLRV1126 carrier board. The core module contains the Rockchip RV1126
SoC, eMMC and RK809 PMIC. The carrier board provides Gigabit Ethernet,
SD card, AP6212 WiFi and Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and
audio connectors.

This series adds the Alientek vendor prefix and board compatible, updates
the Motorcomm PHY driver to consume an optional external PHY reference
clock, adds missing RV1126 SoC description pieces, and finally adds the
CLRV1126F core module and DLRV1126 carrier board device trees.

The board was tested with Ethernet/NFS boot, eMMC, SD card, SDIO WiFi
enumeration, Bluetooth LE scanning, RTC, ADC keys, GPIO LEDs and RK809
audio card registration.

Changes in v2:
- Model CLK_GMAC_ETHERNET_OUT as an external PHY clock consumed by the
  YT8531 PHY instead of keeping it alive from dwmac-rk.
- Add optional clock enable support to the YT8531 path in the Motorcomm
  PHY driver.
- Use phy-mode = "rgmii-id" for the Alientek DLRV1126 GMAC.
- Keep the PHY reference clock in the ethernet-phy node, following the
  rk3588-tiger.dtsi pattern.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
Yanan He (5):
      dt-bindings: vendor-prefixes: add alientek
      dt-bindings: arm: rockchip: Add Alientek DLRV1126
      net: phy: motorcomm: Enable optional clock for YT8531
      ARM: dts: rockchip: Add RV1126 I2C5
      ARM: dts: rockchip: Add Alientek DLRV1126

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 .../dts/rockchip/rv1126-alientek-clrv1126f.dtsi    | 277 +++++++++++++++++++++
 .../boot/dts/rockchip/rv1126-alientek-dlrv1126.dts | 256 +++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     |  10 +
 arch/arm/boot/dts/rockchip/rv1126.dtsi             |  15 ++
 drivers/net/phy/motorcomm.c                        |   7 +
 8 files changed, 575 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260618-rv1126-alientek-dlrv1126-d94abdcf8580

Best regards,
--  
Yanan He <grumpycat921013@gmail.com>


