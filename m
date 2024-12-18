Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB36E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=; b=44dXf7jGFnCPe12zOtJ7XJt9EU
	9KkpQfliDwKOWRGOt4zh3m9N3fGO9JAoelC7tsdjAAQH6qoNve3yFmzfzH2V6lXrwMuNyfnkAIynf
	Ti76yOpZmMBrgUC4vHSrrkU1NXakd9FNGZ3oNRei7zgQN0bkKnZQNrf2J1/lfr+W0og1Rg0XrS4Mc
	ZYyMu+KIKw4RZYnoELJG1mK8iWpAIb6znbJMo262VMGynanXjcysYO8jkbes5mPvhSUAc/fHvHOzQ
	E9R4aY0hHqzww7bRisAx84jjG7yk+qEZ2a3oZUqUs3z+1/8lGWTxFwUkHEWW1cgF+CoO1H4OkhMlA
	6UuZjr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsV7-0000000GUhf-2I1v;
	Wed, 18 Dec 2024 11:46:01 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsU1-0000000GUUj-0TtE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:44:54 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7ea8de14848so3497731a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522292; x=1735127092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=;
        b=Pwz5fTSsqpZtWMhaQ7jKYBv73Ug1OpATA9Rsr7QcVkgq9IyMpRRkB0ihJyCNztUMXu
         vz2Rm9c1AoXKoETwpZAFJ6q5reAIeBZm5OVltqDRT2bnDfTFvIHzz/70kzeaqUt3HgQM
         6x4Lp4HedVDmdqbAUQxEtdUeThd4lM8rXBJaIPfbsqcBxltUMbwFE+mHqoYu+ZigGp5G
         2IeHXohjgKLHL1awolV7OkwnWGXqiU2Q0ABEDY08GtNhFBBh6xkSJU5S3iOsraxWOGcE
         p4Lcab5lpowaBYsHf2dlyohMKwbXIcD/Wu9ks+XIC1DPh+vuZl7yu0u/dzRNTuomnIw+
         rngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522292; x=1735127092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=;
        b=BcWe3sNvqTq94EURTIINaDIogSJwlVoxibnLxu65K1yFItwVBA/a+d5W/w8knBU3U2
         lP+2YAXZZ3zYMJqXMgl71bwUWiWmq6s82Pcr3vW7cjBKrO2LXu7TfLiFK3bXMq2jPCJS
         BKe9L/MhO4618lo4RBVbknL2Umucz/SYipRjAnHg3Ea6EBMsUrcQP0oeYzHdtoCQm6oK
         9ZKX5hwDsMhCkI95+pam6vS91dPE1d6Ts5Ovg1cMT88V6Xs5JrYxV3Y2aX2E1eWNioOi
         WizihSXoHVtFscHoW0Z6D53CDer50OcBOTd76y4Rgn/IV8xcRBI2YgiGGG+W6Dp9QQNj
         1FnA==
X-Forwarded-Encrypted: i=1; AJvYcCXlu62PIqytvg5Q3i0KRecP3itAu9ULQ3+PizPLtWednU1bltMfWah55P7OVMOF+E42VCnYEkU25yzJX72O7dGs@lists.infradead.org
X-Gm-Message-State: AOJu0YxuRlit7W+9hS4iJVOD5nJ8t9hYz6hczU+BGyZdHjF4xUa/jcEj
	A8DotTYTUadX+xmX+nYqf6k2nZ4x7DwBp5jllpts7RTtcPwoxXr+
X-Gm-Gg: ASbGncvJMTmCe+UdcDUGn+t3Ip5yiLYUgJuPJ2geXN8qLRC7d+Ye7R0h35bD5o4Tbw6
	88j86XXnLDCcjoSD/XeJSeD3180jJd+dGKtw89f3kZ9JSrjhG6N1DfLY9hbdYTV55jnwzCfDjyF
	KqZ9xbrhiAHHZMGh9M+PHCAK1zKxqXqGxHCKi+bgwMXhT55j6dPQf3nGGbyhsp3dIblA+xMI8VX
	46RO4oCaNdjSm/xeLAWcBjrsAHAOofrh/eUriMVv84ZIQrM6CnQe6KZa/VaRBRtAUB9by6Q+4Ha
	Ei/xxQ3ZRcIgTXjLafXk9g==
X-Google-Smtp-Source: AGHT+IFRyIbN8ECWy6DzsuI2osZG7JECHco2/VwojjYl5BcOV/Bt3FlomuUurW8aE5vh8OivSmLSeA==
X-Received: by 2002:a17:90b:5251:b0:2ee:4b8f:a59c with SMTP id 98e67ed59e1d1-2f2e91fe20bmr3243768a91.22.1734522291709;
        Wed, 18 Dec 2024 03:44:51 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:44:51 -0800 (PST)
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
Subject: [PATCH v5 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Wed, 18 Dec 2024 19:44:39 +0800
Message-Id: <20241218114442.137884-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_034453_156272_C37C95DB 
X-CRM114-Status: GOOD (  14.84  )
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

v5:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Remove the properties already defined in snps,dwmac.yaml.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

v4:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use .remove instead of .remove_new.
    - Use dev_err_probe instead.

v3:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Fix for dt_binding_check warnings/errors.
    - Add compatible in snps,dwmac.yaml.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update nuvoton,ma35d1-dwmac.yaml
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 8 files changed, 397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1


