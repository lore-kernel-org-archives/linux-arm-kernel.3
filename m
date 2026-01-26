Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87A8CF65D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aB4VXKeNKbcLHh/83xthm74hAlM9LbeMyITc9rvDEEo=; b=4eItMHSvJECc8Vk0nvINm76XJR
	XZXJgPJA/fwfSenfdc/gDQVss9HLoPy8ac1l6ws8ynpKi6MwBZoUWmpH5QD3XQl4Wguhdh9L+Vyaq
	S1nclFX2kPFG2gPWtWYROjKVkaMCL7TwPf5JqOEQj5kOf57qX30ESUJmSt7GNRBRnDygSnh5vz5BC
	nWwryNWA9sKLZsOW7jKDQN9NhpG5hDspa+Mc8hk/PS8iZIVYBlR1q1T1V4AwBkkYitMQdRGcVe7jo
	blKYqN8pM5Bl4PolLDmj49AqsFjx9RZY/Y4xliBWJGkajAUvVpwa4oKYkNK3/rYWJ42wI5zViHyew
	HbrfLorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJkS-0000000CGyv-3NqS;
	Mon, 26 Jan 2026 10:23:08 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJkP-0000000CGyI-3nxy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:23:06 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c227206e6dcso2993976a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422985; x=1770027785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aB4VXKeNKbcLHh/83xthm74hAlM9LbeMyITc9rvDEEo=;
        b=mDk+V8gktUzz6MqDE7/1Cyb3ToYd1Fi8lEqoJ+3P1/XD4qq45DMC4eqFL7xX1c2wwb
         dICi7NzS6Pu1qk4snuOHI7ofuzbswhjYu1H8F+87U8CqxlPRGf+RxpxNmb16o2BhjEUA
         MPGdfjZrK9iaGbYNXmgIA0JDA5BHGI6Ap9uVWLEIAUspBwzOFXnHXqPa7KR1IsM8GRJJ
         yjAVN8CY5kOTJMkPEHvURZ2+KJksYGstrUxpY2PP6QOyCLevEVVNC2Rw/1WSHhrJf7qA
         hgWdA78eMz9XxdbX0dcx45bgaIp7BFYlqjfTi3BDO4xRUMYUBkVxg5LuCooRMLm6piRC
         O9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422985; x=1770027785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB4VXKeNKbcLHh/83xthm74hAlM9LbeMyITc9rvDEEo=;
        b=XrOOnxQVs7Q7dzd0qKd9MLecdLFrGCcw5W6SQsmTLyg01U79HT/yP9gNSyP4cqypBl
         Bv0lOiNtfyA2kd5WLG5iF3m8fqqIZ5+KjUeFMwDsY/B5xumCfc14anLWz997wtmyK/gZ
         gNLVxRg+nRPaq+S8hGxTXdDVANk33eZ4vtfKZTk9FyFjQFFqt3DqiSJpXQnMxBkyBBYf
         GbuI8GxyCaB0+ZoBrIA80fH0c0d2Y1rDFjLRJNj6ERFcgHYOmRszTBsaHtZzEGrU87w5
         zO+DLpi+SiFZLICPHKqbrz2M3z62VZLb5IQPPXKs8zhbW8qWzK/dSJd4sh5H1TWYPAE3
         5WXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuqEbD6cXK9ZYeZFK4aXIYitpeqL/6LiRfg//eMi0G1R4i/Sid/r+yalezaWRFXqWrFvyjaw3hWwwPCacUYlf9@lists.infradead.org
X-Gm-Message-State: AOJu0YzCCLZxkoad/WUPNldI/r925nIVA9NLi1DvNFPUr6xYtqxwh0Bn
	F44bFYoKKfNfLwEcQSzo2Jm6+vhkH1Ar3PU45ldkW/XL+LLmFGqvDK0y
X-Gm-Gg: AZuq6aINhoRHBVPyFud1dalGpPpY/TxHb5df17wGU+BbIM6I1PMc4siSFzt5jQaxO+z
	/5mZSKGuWE2KollQH6+wMCBtkNinwlbyEk7IoKPgtWuJNfDTikcIdZ9JhPJvrSiWR2/eufi9XHO
	Z77/xKTR+F+RCweBv4XC92rSpfxRtCsIaw5CkcEZ6dgSG+ohnv7Ae5ybg0OOiWwp1CBaz7pgo2P
	fe8AOhBQiyhciWhItNhcVPhlU9q9z4OcaSh1sqDybTRS+FraEYZw3W2r9eC2pTNxgLPpmo3MdxM
	5+RacCN5uKnttipl9uWqE05ouGTe0CM5ll6l9zBBMqfNMfByIYmkJ613YlardWm48b4WpRSQUnc
	+wKN+5+pmZme48TCNnIpls0EZ671TPZu5e8fYUPOl9Evnrkb4yyLS5AjsiS55X+OL1esqFGJarQ
	8b/LiOsPrrolhTLlcOhlRI7X0lZ8ISq0FCE5Q1lFdOAlrgDwocaITtBOBBGaaB5yk9lwDkYYYn
X-Received: by 2002:a05:6a21:3988:b0:38d:657f:7d87 with SMTP id adf61e73a8af0-38e9f0f4a4bmr3644339637.13.1769422984868;
        Mon, 26 Jan 2026 02:23:04 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm84958275ad.26.2026.01.26.02.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:23:04 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v9 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 26 Jan 2026 18:22:54 +0800
Message-ID: <20260126102257.2619862-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_022305_952653_7CCB6E5D 
X-CRM114-Status: GOOD (  16.20  )
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

This patch series is submitted to add GMAC support for Nuvoton MA35D1
SoC platform. This work involves implementing a GMAC driver glue layer
based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
interface capabilities.

Overview:
  1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
  the platform's two GMAC interfaces.
  2. Added device tree settings, with specific configurations for our
  development boards:
    a. SOM board: Configured for two RGMII interfaces.
    b. IoT board: Configured with one RGMII and one RMII interface.
  3. Added dt-bindings for the GMAC interfaces.

v9:
  - Fixed file permissions. (YAML, driver, DTS)
  - Moved phy-handle and PHY-related properties from SoC dtsi to board dts.

v8:
  Changes since v7:
  - Rebased onto the latest net-next.
  - Removed unused symbol.
  - stmmac parent driver now reads hardware features directly to support
    Wake-on-LAN via magic packet, so PMT-related overrides in this driver
    have been removed.
  - Update dwmac-nuvoton driver:
      - Update the license to GPL.
      - Improve the description in Kconfig.

v7:
  - Update dwmac-nuvoton driver
    - Update probe function to use stmmac_pltfr_probe instead.

v6:
  - Update dwmac-nuvoton driver
    - Use NVT as the previx for all functions, structs, and defines.
    - Remove unnecessary comments.

v5:
  - Update yaml
    - Remove the properties already defined in snps dwmac.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

v4:
  - Update yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use remove instead of remove_new.
    - Use dev_err_probe instead.

v3:
  - Update yaml
    - Fix for dt_binding_check warnings & errors.
    - Add compatible in snps dwmac.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update yaml
    - Rename file to align with the compatible property.
    - Add an argument to syscon to replace mac-id,
      with corresponding descriptions.
    - Use tx-internal-delay-ps and rx-internal-delay-ps properties for
      configurable path delay with corresponding descriptions,
      allowing selection between GMAC internal and PHY.
    - Add all supported phy-mode options.
    - Remove unused properties.
  - Update dtsi
    - Modify syscon configuration to include an argument for
      GMAC interface selection.
  - Update dwmac-nuvoton driver
    - Remove redundant device information print statements.
    - Remove non-global parameters.
    - Retrieve GMAC interface selection from the syscon argument.
    - Parse Tx and Rx path delays by correct properties.
    - Update configurations to support Wake-on-LAN.

Joey Lu (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  33 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  32 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  32 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


