Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238EFCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVZ1aHDip8CwzjzzjcHFHeqEyzf02kvl0N1Yqf9H390=; b=EBbYEAvtCQ8f2Q5yYvaUsglwbw
	87YoRWvOVrG0WTbVt9QpPJaMkomMcXTP24FtefbQcJCVZuOBqLQ/VW9kZoCyeGMWFJrWDZzPn6X9P
	0RU7qTtMn/0Yskw3oKXq2+LEfKvmdLL5tu3swiNM6WfHjTWeA7zJGaDf0Zk3CxkOCO0AhxVdFPJlp
	K455urYSsuo7MmjuXOonQgnHdfFrOxFaQBBl2DtGNucYab1XjGXNJQeILjXLdJpLWgcBtK9cj/lwD
	Mxms93qgHlpx2536jZu8RrALM9iO9Nkhn2slh1hwrzmf8f0igQ6YN0HoSfHxPj1BnwMWjcyzoiFkz
	JEx9HBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiYA-00000004vPP-0UCJ;
	Wed, 20 May 2026 15:09:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiY7-00000004vNT-1MSx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:09:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so1751916f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289769; x=1779894569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVZ1aHDip8CwzjzzjcHFHeqEyzf02kvl0N1Yqf9H390=;
        b=IqLpKklcRhQnX5jlL1qbRnfLLr6r19F8gLJ1twThiwv6Wt+j+ayaA9onaRWMnkAHXY
         fTvgjo6zSxYvlGfxKsLabu+9ZFPd0FS17YeK0WvffsFxhOipSz2elX1plMj2WE5t7eDO
         09ZHvSx6XCPBdCZ2gGYIad2gla8fjo3FrTEXFLIleDQj4VcfnkRrHOc/8p5ssNcO7m75
         v7FUQKdCOkvDYuQ9B1tlLp85DEV56MKdlGFn2aB5cj0nUbtBfTprXzYZ26wUVRchavDO
         MGJRaPqh5Cg7Uij23DzvjwgqzfVntwX9Qwayo9fdwy6biKn5qFECN9O432iFuT6mT7xz
         S/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289769; x=1779894569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVZ1aHDip8CwzjzzjcHFHeqEyzf02kvl0N1Yqf9H390=;
        b=JCt/+kL7Mp/KEpDaQ6hsblsnZud3r20kGJF1ER23NF1IJmnGxXDQ+xyLiAO/AU3Ppc
         7631pryB9eQi82VpTIERusM7qzNzjVHEo0Cr0z0D4e27h7vIkelO2rhLjCyxvLqa4SbX
         yP41GwjiCzL/duW3qG4SpEGZEWzoaahK38vv3GsnrT2L0TdwnhfoYhYUl+5x1/R/lzor
         8HO1H65lOEIKLv61+TsGAEU/+D5I9081w31XY6u56RDt9BG8BFN2SY/QK3joA0P7K2R+
         aN54u2EMwCLDGI9sxXPHGFFLXNbnv/u2FPVYcy8X10PbFwVOaFrJRcEThSCZ4WO6zmfB
         2zBg==
X-Forwarded-Encrypted: i=1; AFNElJ+Heq/SAISu/Yl9Ff+58GNG8ZJDLkQqoIzzc8tUvort4hD6yQ6unLqPkMFmgCh7HRq3FRKEWIV4/84W/9ELqXhP@lists.infradead.org
X-Gm-Message-State: AOJu0YxkLimkRD/8DwRQtiMZyLdLrcqcEwGmbpNyygPqhNEMvyoBKRw4
	6/ZL/WBdwBzMTB0YReKNTNMj7tWYJUtYP/5PBWU5pTKbwjaqKroi84l7
X-Gm-Gg: Acq92OEjrariAgaMux0ic0WRsmd6xaw9cT8Bm5JEt+IaAKMyhwijCWDau962qD7x+6v
	aEvDH2PuPzoRB5dZxs3X7miiVJktlCQjPYNPCavsNAInFV7kly4swKml7NJ9iWNF/MykLzC4ZAP
	Lyv92ZW8nwI79EZncwgAB0XvRLvQoBxf5Z3prbDAvQXUgPcRGe7d7DF5yMp/boT6zjksV1+Uw9f
	SxJyFYJt2R+ky5VoO3BRzzbzM8KBteeYCIirQJ06yZgXaCae7HBwHA6PTplb1YdrOY6qXRIQtwk
	hv+xOtUsYfs0pw0zl+pHrBaeUYyMY+dNYFczGTJRLLo3BbXYh81GUCT/9Hvy/7i50lYVKHoGeVN
	wl99Xnta+5D1oM4xQBA6cmmolwThGPRc12n0KEjMN6aUZVPBsBEWPhDqd1djmU0v0ursf3h7tkW
	p3f9M40Zbdxk3ioXoIqe0oUhqNfmdUpFiIoqtuala2TzdzK0lT0v1Sl/QkUulK1OYcT39y2Evvk
	A==
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr359822535e9.7.1779289768965;
        Wed, 20 May 2026 08:09:28 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 0/5] airoha: an7581: USB support
Date: Wed, 20 May 2026 17:09:05 +0200
Message-ID: <20260520150912.11614-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_080931_395096_236BCEE0 
X-CRM114-Status: GOOD (  19.87  )
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

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (5):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  clk: en7523: Add support for selecting the Serdes port in SCU
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/clock/airoha,en7523-scu.yaml     |   9 +
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 216 ++++++-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 554 ++++++++++++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 13 files changed, 894 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0


