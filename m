Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9632AEA3F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=slGvVNRI6DMwxYRFHCioIZD1AV/VPFPU5qKmLSzslyY=; b=L3K0sLP1JBhH1qAWOKviIJi2xH
	HMgGHrW2QUHp9e4pFKZJn34eRYru6MU5OZixJhhmYNKg8zJyaH9OhHJGFwBrKWkASW76pOwgQkY38
	oht8OK/+GFlXgabtXw/uGgU8KOn1wfSq+CPy7XgapTk7X5kXCVl4aXokhbAUbT0JGozSWWiAe+9/h
	TqL3HyU+K1QsAYTNSXARbKPpiAH9DeZ5NLjrjXEJou8hSTKr82nMuL7xvSVirVuD2kHQ3rpMdN2jb
	MrscwLpbOt5cJ14nqpibpK9P06TLIVmFgWAkClwdgy4gnwo7fC4O8K3kTNwJDZ7b2aCYlNEEmkW/9
	uBSXeqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgCv-0000000GSqZ-1s3j;
	Tue, 10 Feb 2026 05:22:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgCt-0000000GSq8-1MSA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:22:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a9057b2ec3so1902495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770700958; x=1771305758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slGvVNRI6DMwxYRFHCioIZD1AV/VPFPU5qKmLSzslyY=;
        b=ED7eZD9fVQgOmQWAeZ7xJOMvuUACU+t0PqG11vCCEtqPA3r8kEHYT7+T4bGTyf0FwG
         ArmHDK+ISusYRqOJSr2kO1nW4g8SfKGLy8NSQsk5FKiQFRQNdGZDNgfqRNVwC1v6OptK
         hb9/12WdyEuH5ywwiAHjliyMmq0HS3toR6klDWRq+kSegmLQv8EbYDRiJAs29usnlUch
         HymtNo8HEae8gfeVv4oUS4XW6ZqkJSWBY9ZekkKXXaydcy6gwO8j8AKBqR35DsG92uKP
         VQYu4ELZb7zl+1SBB4l2akcwALYm1B8FK7L00+20QIJZt3wOcBE9kmRTWl+Ugb7qL8JL
         OAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770700958; x=1771305758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slGvVNRI6DMwxYRFHCioIZD1AV/VPFPU5qKmLSzslyY=;
        b=C3xOqUWuUVCc2NnMxKmChMXbP0Yl75sctmBclYxJ64oe8RgzhvOycJr/ZNM4/ZOKBS
         HZMxvmGGb2T9Wot46MbOPEWH/1kcoVpPQLD0UJXVp8CWhpaPQ1IJIUKZBH1+8GRoskrZ
         qL2bxpHUz3c4TUyQgI4W8liJKzGG9fBd8+q8Grz0OheVM8Za/3BtjWUlTDFoH9CkBXa0
         2CT6YOhF0HbpYNWDqBCjxIH/C+fCeBjQ2SQ0aLFU0HxHJRPX/rjsHZv2+vVrkYnNDPq/
         x64hHDAXawhvprP2fyslpkI0Qo9jxAYSKxnNu5VH1IscTXRptRJmgfoG0W2/RUtze3ZW
         RyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfksivbnsqkTEQDA5DDaKgB6SnqLudX4CFU77eKAEJr4Dow+0kLo/2TH8sV9UkNHL6NrlciYEKGFJhc+gbpS/o@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6SfaURQcFrv53VYb3g0lUFcdHCjLdjbynRusq19JXbXt8dAyY
	Fj7GZQ5rfW+kJ2LPJC8+HPAUTgFm2LLvX+Qpwc7KPNSSjDss+31cDJrB
X-Gm-Gg: AZuq6aJDYeM46HqW5Z53pMOVwJP5bR+etVHSsEChSkIreAZD+OjNGjdra8qqqhj/2Ru
	tMnfTsdz+iFL//vbosa5te7H7tVU9UmwsWJR0qD5bfbxv4S3rdXxboVkK+mlcPC1dhJPdE1BUE0
	9mlSDYjO+f6UGZ2RHaJQe0SFFhZTSkbAjVu6/LQX34m8jdET6vt/yoM67678T2aE0lTK8/LALi3
	LDNISvUly71/ptccUmJOgH7Ydf659niCmJd0/90RI2CnKRYYvxyC53TcU/Z1g8fHlCzv9o1BUFy
	W4FuuDNxciWX9wNEziYTjRHMmbBJXmH5C6y3IUIcxzkIOkWZ2s9blk3zi0EcO1CPQAkYxpLMSn6
	qdto7/lFBEFuAZJudelEsCTQtijrgnT8UnJFNDresqd2Bi+L03zERzrjrXENdWeXSminZnFWa32
	zhLSThkOoBQHNAMYwkhcrkWWEpWYyGTU/ejW1N1nFXq2+8HBjdEq7yQ6YXZ0EP0RyWKwEpBqCEw
	VeEapiQWFG4
X-Received: by 2002:a17:903:1a0e:b0:2a9:4450:abb7 with SMTP id d9443c01a7336-2a9516fcf6amr158575295ad.39.1770700958109;
        Mon, 09 Feb 2026 21:22:38 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951ca59f4sm122114275ad.43.2026.02.09.21.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:22:37 -0800 (PST)
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
Subject: [PATCH net-next v12 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Tue, 10 Feb 2026 13:22:23 +0800
Message-ID: <20260210052226.3005666-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_212239_367204_FA828A44 
X-CRM114-Status: GOOD (  17.67  )
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 133 +++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 139 ++++++++++++++++++
 8 files changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


