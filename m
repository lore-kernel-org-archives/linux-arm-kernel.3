Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC46D3F09E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=; b=rD5TT+23u5uhVkyaDDsU+q0wsA
	02X7WLBp1KxJda+1ONtFUYEbe3rS6pJvfigBa8yVLEa1xCjejrPK/YnxnjBPl96UL/C5pFmtTyK5+
	RyEKbNMkKhrDAzHadripzchuazqgQc4OkCourlRCKl4rczvMRv2vembJp46C9vWf+EcY9kSpnGcuL
	ae2Ro/ggqxj7p8nJsC8Zle5Uam/RjdEKb9fJkgomqfbfJ/bDTn+2SXomzEYc7fjnPdDEKyf+VmucA
	P0tRKsTCJNtIWZcoU0YxXfCVKsmcRJDsbrsH7KDPkY7810q6MJqVIIfEnZf3BWw5SB8iI81aMFv53
	Y1HkG0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKps-0000000HI3Q-3xq4;
	Thu, 29 Jan 2026 05:44:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKpq-0000000HI2e-23VN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:44:55 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8230c839409so528825b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769665493; x=1770270293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=;
        b=Kw8NUo32DD1VIZht7wyefyI/3YUsFy27QUag5ZcrPYRUDcJDnaUQN+0AeZIyEesXSe
         f8q+83cCRutqRcrmOJqmM343UQuBO+AkztT0PIvwq9kV4bpqM17j4nzcBgt5+XRw2UP2
         wIgH4PjDqcc9sKNXVn7pwrfuaAB5xwJItnz9nmdfcceL9PlJQtRrsEM8TVaqA8imSmwa
         PMOR+koc7Sf5159amm33+9yPuUEeiYAxaWwqvhk8Oxn9lNXZnvjlbAUDD+wCiossppkS
         mLH0bTx406nSYjnp5rb7HUiDf/vCOJK/mVmegqZAEhtlJD9y9Da8oAWFOK9ZHc01Jz/H
         C0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665493; x=1770270293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=;
        b=TpuY4Zbcva8TkbOe1IfAUtXpM5/aY0qsO37r0oBJg5S100xMG19XdTwz+ojnX9z/0u
         KefAIxpGa3HJXdA5M4r4JrCQN5qsox3s9oTvmcaJK/FqGlcIjdh7hAG4mnemM7AmoC/M
         BgrDKpmrKYEVz8SyGi+Z6OAz25LeeKiq757521m0qJTdy8QqKlfk47tInSWOTI2Bimw5
         Df+5hqx+sYBCfbQjDkNi7SIiReBbZusLWYMEufz/FCeGs6PTGcxymRn66A2hpqkyX1xD
         JsK3DucD5JMiSsQ7XEf9c3qpfcxg648QH6nESAeEyEhPctROVIMZ1/w4D3j+MkUujdOc
         GlQA==
X-Forwarded-Encrypted: i=1; AJvYcCVusyuRhiLW8LlZVBxQMjctbC/JcwbyJtm9LElqiiHVE6ZqjxC5/c9V2Id4NXrJfXMLLHnSlUx2DWwcUTpdZ2dK@lists.infradead.org
X-Gm-Message-State: AOJu0YzhmFQLkDPmNwb4H2b9EkRtDrlARcyC/NtyU889H9Btf5gfX6be
	FpTdy6RMWmGtSR5dobxubvKTs6aPpGtZz+xVdaLNwQqMG/SvCw1ADQur
X-Gm-Gg: AZuq6aK+OwH064Y0aku8HBHVxj4TxVL4IIvuAKo0OE4lxEmPgtQTmG4HAbzwC3Ho8ZQ
	FthX19gDre1djE2BFY3S6/KC0djrYN2DcDznwBno9bt1L55wmM69rPKMcvmud0Yfh0C97+y8MzJ
	5Ysdw7QqO+s/OZG2Fmr3A8oZQuK3rNgQ8IuNb1ogqGkrUJek5GQyWWfhmRkEoeNLa1lcKRXaBKx
	6AzVAxcKNbRNRAxqTgWPF6TdjMHIRKgNFBTHqwX6OEa5Yf2sAn474f1YL5XRrVqQ7ShPJxhyhVl
	JmUefKkPlq4LLrB0afcdCxt6EAxCs7xxtJk7rH2s/EfZL9Fv3MUzLhmHAzeDtoYkCMFZhzql7Wc
	eRJg626Pz4lDaT3ViYdoQdnX8OEUgxt8pdA5t/k0nASZhuvE7qIyamUKm91balIQgcRbe348FEu
	/Fd/pLPesymeHwQWhiGFqxHQLd6z4SseUn15G/xKkEAY8wYuwDSHmC+oSpJMuNUNQG9npXq5aJ
X-Received: by 2002:a05:6a00:1ca9:b0:81f:3f88:89ee with SMTP id d2e1a72fcca58-82369173829mr7391460b3a.12.1769665492885;
        Wed, 28 Jan 2026 21:44:52 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c227c2sm4108364b3a.53.2026.01.28.21.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 21:44:52 -0800 (PST)
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
Subject: [PATCH net-next v10 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Thu, 29 Jan 2026 13:44:42 +0800
Message-ID: <20260129054445.416242-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_214454_559914_05C3F83B 
X-CRM114-Status: GOOD (  16.69  )
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

v10:
  - Update DTS/DTSI files to follow proper hierarchy and port modeling

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
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  44 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


