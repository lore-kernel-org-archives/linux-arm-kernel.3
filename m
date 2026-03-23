Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F73EC01C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=; b=IH7xaX/78JTLVbBobvhwnsvURA
	2GYJ74lyMTJfBROMdLow6qxX0W4JIQRPodqEpuHyI1okdlepkytbqo2ISl0ScmXlzC40Bx5EImb6Y
	dsZey0ixdudibWgaq9z0UNZj9K6bEyYeJN4XozXeMFX6gkRpZNzupm0g77CIu+hL97TeJ5ICXr0bm
	UpIEgIwd6TleirnUQTBRZSvk5YABcmZuIGVdqwuVpGUuOYtfSio6LtvRn2mkG2iq3CGxA48exHW2w
	/VuJ+cm3iTe7qQ5cyByl0qvhfo1mkF0lQrcbyLuFRY98SjTBxHJoWm17h9KX+2m17CAC89qzJQMGH
	oKc61hQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cMK-0000000GTZW-0R42;
	Mon, 23 Mar 2026 10:18:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cMH-0000000GTZ8-1NEy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:18:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-823c56765fdso5476b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261084; x=1774865884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=;
        b=LzWqWYfa0oEbh8z/P+vSzgvQ2mAKxmeK0zroJNBiXiEREj3tXoTSxLCkISet1me9W5
         BWmSs7+QBon8gtq2j1v6GX71K74xNsrWTbkMNB32HLNBoLqQGF2ISgkcoCulLzkzs00s
         t2NguSdOz8hAVJE6PzWb0rwi4GqWdZB49iOUeMYQq1p9SLeWB2l6QtzR7aePwuBgnp7W
         9+p8g3IVSvbRelM2tNfDLZsVdJiXV8bu2+1OAV31vbKbXtBIpQkJq/uljRm/qe4eWxAb
         rBxwRdv1xTqDwbidYMS3EhF0ZT3x6+fqGdRgjqUeT1qAk16aM8/RkakdtfpTXW44EZmD
         v6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261084; x=1774865884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=;
        b=k+g65SS8V9mG0yIerPJHb2Vq+JcFI8e28q+AVRJvkFAL0Cf8ruYQdy3qO12Ky/60A9
         0jahqoXjeWeRYVOYDXAqB9GCPQgew2I9kAcQA1qZb7WKCMdyYqPMTDYj6PTruoQb54fO
         iFAGjalXll61R7U5SbaXgvrUpqVMbPKpR55UWpKaL2uB2ZcKP02NVyDmqQbkRbBiSQAI
         o7WH6Gw7wWNcIoPEQqqL7q00SCSPNProLGLqWf/kRWVDp+N7KV47xL+29ZY8M9+BKIey
         uqW0WbfepLtQm8/oZMOryBsLJi3s/YY+3hgBiIkKFXRb/HCuOPGaEWE1XlTq68p0g1vO
         4hOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqqo6DV1SMDSR6qgD8FlFxDHh/ZwtMZIoLOZoWyGy8hf6O1CZ5GwJcQ63F0tks3YOQiofdStpVZYkeuCLlVoP0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxll60bpDaMbFBJYGfoM7tsNl3OBCd2tRDr11uOpVVSfwwuBqmL
	ckhnW91Avqlo1dZnUwBS83TMiZ+e8slcbAcS5BTbzxiQ12cBg8oN6lKX
X-Gm-Gg: ATEYQzyDWSqxOMlGckP7DXnJE7S4vk3R2gmjjYCJQcM9HFc61kHyygogc3RgauEkDJC
	WHMjZYtEW12AgG/w5yQHdlwzy5JV9P5zNgL/w6H6Jm4oDRfGBFldKuuCSG6PmhXSYveVredMYNv
	5FNipOCmpwyk8KnUFS7kmwKMLZ2HO90lpMv3kU2xgyesJq4FktLda9jrofAYIts+QiJExR+t8t8
	KRxVWaA/yL+IS4pnNa9WEwNG8wKAhbPWsZZikvuwSSKVqUjzog6SPF2MKy6N8kqDzLWUmSusEBE
	JZwVpSGwNQL9IjrwS6OrAl7cjRREc+IkbcVbgRMphWBsoExcLnHtoDX8HRjT7jNmKVrwp1uvdIU
	4LGaZ9mCJ8drFZlz0ueeEjnzhguJyCd6uUZuUAdfw5CO909ZQmxpSDXahVXVvYY7QohGAoBVTfe
	arFghfAuHKwLfgw7N2cWf5LPjkodx4ZUGsrTX8tNN3eiBjTE6ZiuZDnkf7/qUUg5KTSYw+a4p6Y
	5+j8tsNF9NG
X-Received: by 2002:a05:6a00:2195:b0:823:3078:f684 with SMTP id d2e1a72fcca58-82a8c35d2bfmr9312586b3a.32.1774261084178;
        Mon, 23 Mar 2026 03:18:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:03 -0700 (PDT)
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
Subject: [PATCH net-next v15 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 23 Mar 2026 18:17:53 +0800
Message-ID: <20260323101756.81849-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031805_421771_C706232B 
X-CRM114-Status: GOOD (  18.40  )
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

v15:
  - Return error correctly in probe function.

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


