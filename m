Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140C5CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n9SmKxDkFJP0+we87jbRanJrpKrMwE9QMl+XapPOXtc=; b=n7Ulr6ErYiHPG2mOPWWmYndmPP
	1/H3F/2jjwDsCljxLgOQaRX/uPnv1DTgGApxCeSwKwmNuMSF1hLdp/GAGbllA01HXiPJxl2Q6ua69
	J4rNaqEntRPyo2EY4fHbMg1om9YkslkgA9h2cjYpUko/B0+Xnucl8lLm2Izw+hRXY02gj0xVzv1qE
	gnyvOF8/hiy2Z+5h1a2MaiGDd6OgmWI3K7HWXxTYujvanLeUkY8W7aeEDR7SlBbdt62EngAZhjir+
	K5lP3OMeRe4S6oM6T96liEv9CEej6GBjr7RC7olSm40PFrko1b0iJe/pdlScZD/UFVYGElOy1Yayb
	YM2LjrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSc1-00000002uBm-3CPP;
	Tue, 19 May 2026 22:08:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSby-00000002uA1-2XGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:08:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48896199cbaso33334485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228504; x=1779833304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9SmKxDkFJP0+we87jbRanJrpKrMwE9QMl+XapPOXtc=;
        b=f1acHtlaOeFdjPMDk16x9Dw/FEW2WR9d6bzuJ1cCHz6dU0P4X/lU8HwpqSBfVrfA34
         rdhfj07Tlo7m2aUKIouFfnbArj0eMfwieb9UoufzRTJKM42HietwturrCdDMed7qt/S/
         ratB08dtqFbXpnWGPnW77PIb6/yUK0sqKG0xnl9XZRyRlnwsppYmUmipHS/KXs8Th6e9
         RN21VFBm5jqiLsZLvUbPRPSHYPUs5eeQH3up0540o0IAw6bRx+R7g1IKlrwipghGXOrC
         O1DEoLq72IjNthKINa+Z7affidWB0QN2rzeL/7em/GsZZWUbXUd/izIGQ07s9OtureZG
         3jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228504; x=1779833304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9SmKxDkFJP0+we87jbRanJrpKrMwE9QMl+XapPOXtc=;
        b=HHSZuqfsiffibBjW3sf/5cXHauHcjnz4gr0UNLVw9OwspSP/gxo0Vxdy7oXu+XY9gz
         WbYL/6FISqNpbAK/i61q/lj6wtjhsMRY3eJc4tYjN8HEsyLpWGS0cesVQVXOwpfZIZUE
         ZR06ffx7zN8RKuibUN//EkZv6cXQSGfGRY26YSuL/fVCthZVKH4dCVS3GBcgxgudoKpw
         Xd+w2kV0PmZSSTWGK++zte2zRqgrvx1Tx6ly+Sgdq3sX91vt6vgwDle9G3Nw2J7t8WiH
         90KECwowB3d1vs+FogGpGq+fWA5yplJO5dODq9Z/+DiYUSjSNmoWadGyTZALExxymSwr
         qLGg==
X-Forwarded-Encrypted: i=1; AFNElJ+22d0QzdlG6b2pj9wIplUvQ/PojPKZN/IY6BMzD4J57OdDeBtkLHYdVhmrhZc0gcJBZQcsGg4lR0ZYUsb2Nll7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg8f6TAG1g+WXpGO8EIXudcRCZdbnffqoAsG7jGSSlEtZykf0y
	aUu6T082ZaIRHxkVVURK3v/BJVH4VZPs9BGQYPkckNJD4OyhnyT2NcBy
X-Gm-Gg: Acq92OGgWUfaqYNrnEqylujhHFZztayN/zRnY0QzfhQ3SlgVCUsuGz6w/aeqaYhOfq5
	h8HaZqFlZKnCSehLqiF2R4SsteMGqlwIOb9CQHBkpFFbdXBR5aUN5a93q3TLuRiTDK2AVzn8hPX
	McyFAbI0GJ0kx9rjt44iKZRGmqlGVMcztYFvZLoJtaBkoano3xu2JmYD/P/kp9bgi+fbt12eNBs
	cwpy4nnA+5yMWcfvf+qX6/HjHUDszqkApsqr+0fI78M6XsuSrB9ykKsD8d66juDuwmzP8iOzc1w
	8XAZc+yl9AIOxfSfNOLzL6on0z0mfUHqyTqnzaRjycn+SE8nmpc6ty8KW1TcMX/4otN2Lc0SQ6b
	qsFcX1v1b7gDkoDsSjJkaQHN9uNOGa8qT65Apj4UrU5dcdpubX/7QqZ2ZFJ5+sSv4SUq/z+Zotq
	IQGD66z1RPioAZKpZNfgPMC+Q2FZ+0WstRn97oPFZYygvRvGZqB0u7KNru3CYbxzTiy1cg+Z+Zo
	sAKE/ppBQ==
X-Received: by 2002:a05:600c:3493:b0:48f:d2fc:d042 with SMTP id 5b1f17b1804b1-48fe61f1a27mr348852915e9.13.1779228504201;
        Tue, 19 May 2026 15:08:24 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:23 -0700 (PDT)
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
Subject: [PATCH v7 0/6] airoha: an7581: USB support
Date: Wed, 20 May 2026 00:08:05 +0200
Message-ID: <20260519220813.28468-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_150826_662721_209D611B 
X-CRM114-Status: GOOD (  19.28  )
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

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next

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

Christian Marangi (6):
  dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  clk: en7523: Add support for selecting the Serdes port in SCU
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/clock/airoha,en7523-scu.yaml     |    9 +
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |   62 +
 MAINTAINERS                                   |   11 +-
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/clk-en7523.c                      |  207 ++-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    4 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    4 +
 drivers/phy/airoha/phy-an7581-pcie-regs.h     |  494 +++++++
 drivers/phy/airoha/phy-an7581-pcie.c          | 1290 +++++++++++++++++
 drivers/phy/airoha/phy-an7581-usb.c           |  562 +++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |   11 +
 13 files changed, 2672 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie.c
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0


