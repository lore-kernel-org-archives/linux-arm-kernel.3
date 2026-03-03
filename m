Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60303EC0469
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hrr8Af/aGKB61i0C6ukavupGQsufCcEMWOAgZ+sFvK0=; b=pjqyHMKh5qfx7/S7x7N+BGp2br
	pRwJO390WjeoIvXr5ZLxVgAtET1t0U5zxR1x1VR8p83yd24xALcMRQxvtsob1fHQvcT3YX1pkLLzL
	B0/twAgO7/0kAKEpdMQx2dPL2mqxtwp7G+2mSiaM2Vym6Z5zX7eluP7hD/869GTXBOt7MSk0Dze8I
	MN6pLhWFvB9HT04VTfTlQ4zDG6pXeqWu2vvcLdOSonGF3ERHwI/8/9s7hNuOQStrkZukdlknSScr9
	yfBHSr/XhbodNeBoX832IQrWPJ8WjW0LO/kcfTM4CbEZ63ZeooNY7cL8A6lH19xHZHa230cfP5FvV
	kiemONFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLvR-0000000Er35-0OUw;
	Tue, 03 Mar 2026 09:20:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLvO-0000000Er2k-3b8X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:20:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ab46931cf1so41838395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 01:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529618; x=1773134418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrr8Af/aGKB61i0C6ukavupGQsufCcEMWOAgZ+sFvK0=;
        b=hpqKLJd0V7smDdJSrRtvypa54LCSVUv9YUef6NOqKsBTpWetoGpB7p1NfVNBu57kII
         NhrkQUi11SRNYy1YoTzbBs8jlwxyIn+KaPbM5zxyh893aeH4oRpSFxBfO3rju2/UVYHT
         XkvpUcsbFY4v3WaWF+ms+fK9Kmriwv0Q3DM1XItopU51SNcJaFd2dLguoHQS1mmO8zE7
         hvRUplKbdJ2ZCPBuEBKxOzVkLaanBsMaOboYqjgX8jzTWW1U9SfHTpVvGHBV+Fr9oniq
         hqRB8MixNV3GYyip6jVZ+qrqdVNelczxpXmcklZyJnXnMgSH0b4tJOhHKPcYSbv5y9sW
         T2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529618; x=1773134418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrr8Af/aGKB61i0C6ukavupGQsufCcEMWOAgZ+sFvK0=;
        b=avTa1gpVmtCzfV9r34+NWqJPrPpHiDDnoDE//lbp4kCORvXjN14otXsGbeCrrVpxdq
         Zc+Amo5dvNXzCDdy9kppbKet8dONE+W3wDYnUwcMgSbscifAzPqlWXs43k/b5Y2A8vIs
         rmpNCElPiGiUrk4XSNRRZSq7fzZ2WRGIixemC2i2OBji81kU6QU5Fmx/fBXvJnezJkSO
         ODPAMZNZu8mV7f8pg8P+dnkfBhT14KiWWsh3dxVvBufWbiVCySKTZmsuYr2VM/PuLBlH
         /rjuVCwvfqebi6f0qL8ZPLG/vw3eoVNN/jQBAriFxX+HnHUKHbQ3Az5n6WENEjOS94ao
         v5hw==
X-Forwarded-Encrypted: i=1; AJvYcCWeHKZFawfRLxtMXdSp2bieIvKQ304pFft1UPKIlpNKPetjEWjPmX1VHjznrVs1mfAEX+Gp17zk5iReaAH2zHUw@lists.infradead.org
X-Gm-Message-State: AOJu0YyT/wdJtCsoewXArxCIJUC0FYZwLL8tBbIquR/2Xz9GRtyTZfGI
	l5RTxusNfm+XkCpweb+DW8o7qlv7GtJbxx+AxfsWjT8Qztm9toClL8hQ
X-Gm-Gg: ATEYQzxVyI4fw37gx8qrslKG1CjbVAi1H/GuC3FlXPrmiNr5L1ts1YDYy7hUe4fAMX6
	U76aEI1hzlw9h2raFRNJr1/TR7Uo1aMXKxdXu889B4hqkgpjCMuKyiQC4Cr9eGL4UiQKH3g67cP
	qyOtk2ElIODT1+zhxvzZHm/rWU3wORH7UkmgLW36jKhzvAHbIf0gtkX5P0/F3E/rHyUqyibKKUf
	iwh3KG8OdcCjVSPp7gf36BjEYWCLfjBy219GBkID0hahSdUXOvqBt8B/g4LzhN0/PJHfOceQFll
	gOeRB6tWVq6+KPcHGr4bN4CiEcVxUs6JjoZd71JsOS1q1B5N75y3kLy4BsnoH/VzrPigrDJN2ui
	IwBcDUIRAKU/UmlUCeMTuqTn75Nv4D6qi6U4ailcmeCaaPhpSNownJNmagARa0hcSwZNen/tbCH
	wCkxI+ZxPW4GwR+/BP8vO2eAnOm7xu8mSyYEh8/Tz/26d9G43FmNuWsceMkInIseEUvrcCzoyFJ
	dMjiSdFSc/o
X-Received: by 2002:a17:903:3bc8:b0:2ae:5a70:477e with SMTP id d9443c01a7336-2ae60cb2da4mr14189425ad.12.1772529617675;
        Tue, 03 Mar 2026 01:20:17 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm158777475ad.50.2026.03.03.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:17 -0800 (PST)
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
Subject: [PATCH net-next v13 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Tue,  3 Mar 2026 17:20:03 +0800
Message-ID: <20260303092006.263715-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_012018_911718_F424AB6C 
X-CRM114-Status: GOOD (  17.76  )
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 131 +++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 ++++++++++++++++++
 8 files changed, 382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


