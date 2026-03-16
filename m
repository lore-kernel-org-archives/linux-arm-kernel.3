Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE78DD58B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdlLnxfYyQ6gERT5vAzpg0NqVjL+fMxqTNrrUUF0iL4=; b=snlDyCs3sdbTqiHmU+zU4hKgIt
	4N30bh35DY04mgDsjOrgV4Io74zE3MSsCEJgneR3HN2M8dqVEH/YOgGZqc9U0Mco/F10YDIElti10
	aLf00OnTSEIIHr6/KuAzzmnBrJQEwOWkkSpTmqlsEuGjhtu0YAKX65Gd8SlI3BBrwjwaZLkuTRDnb
	bTxZHY9YcJUxHZVNlwBmUooMajvw+8vyMH9ssxGccWJoNt2S4CsJCg9YZIaHGcuo1TrBBCIHfo2Gz
	MaiZVcbMNl20VihtrujAGFrSvvZGMB/8zaUx2Rj2JfeOnvQfUTgj8w4yqdEa2YM3CvMUi/oqaKs/B
	NG9Y0iHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20uV-00000003Mwk-2Qx4;
	Mon, 16 Mar 2026 05:54:39 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20uS-00000003MwN-2B3P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 05:54:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so2505254a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 22:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773640475; x=1774245275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdlLnxfYyQ6gERT5vAzpg0NqVjL+fMxqTNrrUUF0iL4=;
        b=faaeRuayssRThyhBmpnwJA/YgPBRlJPpYQKoTKNJj3ul/E8SvSVwv5BwOh9iJBB1xG
         zkp4Tg5sWzOXgEcwbwYBOgFMMIlHWAP2hVNKUKP/ZP1s2UEIzvMV/DcUjMIYHveelFZj
         uhs0omjp8zcXKLMr2KGVJATA85k4Z/vt2s6w6oFaBMa7NFcwMNUfJRSkyrH3P0WDNABi
         uLgAfoCKrou0bDznoI022IA5+P995dsRX9CXkcMW1Wdwo9+XpaJxa0Wvu/jYFqj5GJ9f
         Gd95hk7fOF/rQtP6lSbz7ot2wATLmVYp1JZ2OkweG07FR4J0g4DgpYgRRHsRVSxqLG16
         atKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773640475; x=1774245275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdlLnxfYyQ6gERT5vAzpg0NqVjL+fMxqTNrrUUF0iL4=;
        b=Qh8ih3su2pDFlleqX1NEWdVP87lJyclWRTpSXupa5KTmZpZ+eSqhfXAXypwhxpqhVj
         xgYI/z3+KabxsykhMR5e6ZB5DhA7ESWQQbtlWOdOfSJXTnkylRBvUbtJV6xh16B8vU6c
         5dZeZwEoYKTpf2ttNEuFJ3hP996uS55yexWHWAqp0Dr+Wt5fMMrpelUd8zgycq4dkG1z
         XGJRnzxNGlcySAuCecu4L6j996wp8oaYo/rH9h4jP9jFesbTFqq7VjCsz2Z84fXRYAj7
         ZLl96JVkbE6LVbVtv17QEhuSpHPhV/0d/AhQrAI7ZmeJR7ARlNT6dqmwi33BUApzp5zO
         Zw9w==
X-Forwarded-Encrypted: i=1; AJvYcCXb5+gx8Yw65nACAAh8cDgJVuE2frM2a3MJB9TvmdhtSRxUA0yMchRL67YC8u5JSHHomsBeShwPBbSJ/67rWio/@lists.infradead.org
X-Gm-Message-State: AOJu0YxifSj9NLNNPAaXmF5JFUAAeOPi2aW3uot7mFEZKkU8Nzoesiq7
	SbFDPkcCuy3MGFOqmReG3rOwLiH9R3pd3BOHM02m+0/fJOc10quKIEkmssG7Ag==
X-Gm-Gg: ATEYQzyVXaE3j7VC4c7KHadybrH/43AiBavNb3ZmkrEKDmfaQwv0T3/cARhGpV7VhZN
	mrJTySeKJT0/AN9u6GJXM+6x/U0BiowpM5a+3uZOqX0zb4jjlWuIzuA+xQdqKoTiWCsPMu0avE2
	LMAfaRu5nVm9kaZuhnm4snNMRBPpyi42gtCwTveHOlyUADgnrQCx+XnFVmwDHpfJl+sj2NWuT8Y
	GQms8efkdJH4c6YEn4GYNnwBp59CM4KtAggXLC/vFtn2XHEklVpuSKkgzCN/ykVebSxLdAq30JA
	ED8DM47eh63M6am/ge/x9KyDJ7rkpFC3qYyQYGZ8mVmPbcXLpz1Qx59D6j69n2X6wEXcntOzHeM
	FFEDmcdD0y04QCGVEbGDeeVcKi6ikzxgY7BfkZN/nwnwJcoGpqi1Ltadk+0fKUJO9OVUe4UNQ5K
	p9BdR8eYdvQuNfv2xEb54AaiZi47AH8JDH6tmJv3j7buEf19yjXIYE4eUERBjhNivmuvMzMHblN
	jEGhIomP6Bd
X-Received: by 2002:a17:90a:d88b:b0:359:fd9a:c513 with SMTP id 98e67ed59e1d1-35a220a8903mr10935535a91.24.1773640475194;
        Sun, 15 Mar 2026 22:54:35 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm2166285a91.8.2026.03.15.22.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:54:34 -0700 (PDT)
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
Subject: [PATCH net-next v14 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 16 Mar 2026 13:54:24 +0800
Message-ID: <20260316055427.1310569-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_225437_486517_A6767BFE 
X-CRM114-Status: GOOD (  17.86  )
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

v14:
  - Fixed dt_binding_check compilation errors in the YAML file.

v13:
  - Fixed YAML with dt_binding_check
  - Added callback for plat_dat->phy_interface
  - Updated PHY-related setting helper function
  - Renamed registers and values to avoid misleading names

v12:
  - Drop private structure nvt_priv_data
  - Fix error propagation to preserve probe deferral
  - Refactor internal delay handling into a dedicated helper
  - Move FIFO and filter configuration from driver to Device Tree
  - Update DT binding to include "snps,dwmac-3.70a" compatible

v11:
  - Propagate syscon lookup errors to allow proper probe deferral.

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 140 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 +++++++++++++++++
 8 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


