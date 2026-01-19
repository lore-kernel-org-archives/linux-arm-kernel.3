Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64806D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=; b=kDvcRHslyJo8qwEdjqHEdu8R9w
	+L4aJIZg5fjAwjn/LjcgNXLbgvy/rn7cshYH+z05jRTkapwg0us8K9CrHNN/gBmiGT/aC/p8yJ2NJ
	BsXf66/eeM4he0Bf0CSEVeaXCpJTYwE8ceN1nRH2TppLnmHKGnMU6WbVfoN5enkkgb/2oM4WONod4
	8kNiBmx16DxNJc/gWBjxRG3q1WixjU2CffYhvQEVx4gbtAugCtwkPINucyWCsaXjwRm/AuYQEs2Dd
	dodUhsWiDMvOvQ0SychWHKKT5k9xvkcIGvzVN/4pLmO8rYbR+Yfqx500d9ibEdmZQHQeM/t+M6qQ0
	tudb5QTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlt-00000001Uuz-2WcR;
	Mon, 19 Jan 2026 07:33:57 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjln-00000001UoX-0ftT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:33:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a110548cdeso26632745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808030; x=1769412830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=;
        b=dS6pbTYLxWmXZXevd2CPmCT19gPdGkPhfter6G0E5T3NBLJ+YNaqr9H4Pq653XKApL
         CfGenGYkcCknvdIcOQJDy4dorzhjngh5yHTXadjHkBMzOSNFr7lpvKPRCRGaJFmB+jXX
         /2WSplvch1P9czcinhlEbZlW2RoTAkApl6gCjWy1Ri2RwX1kacciLd4/g/GhYOPRdxJc
         VTAT7mhTp/41+s1QqyZviXlvGNnLdc/iLLiEYZmJKNb2fw1/XbQgBsDWPv51ePyi9CFs
         E+x1iRXHze00cQkUAD3kVbTQIHMqz/OWXlG7VVopjUQcHDjHnXjeLLyi3Rvt+sTOhjug
         jtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808030; x=1769412830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=;
        b=aOiYKArO5O3wHcEqxcPYdX6Hxdk2S5cg1+FRB4wMbaW2jqHfGjSuODoIUNYrn3llHC
         E/Bms/6lgkScpETSpUdDO8WuoYHV9kWZLSGPLfkt0wFt76L8+IyjMRUzsRmLf/KJr62V
         JuMejNEZwFaJ10tZsh6GM4iAIK17r5vhr2zM9U8G+FoCwEUh0FnBJaGhIdyNN+AksFj1
         D46TmpatgVvcksaX0cAox9iOzZKsw63sRmhlODgusV2/zzat4meYCQ8F4NDk5qRPPHu6
         f/7UDdc8Fl4MyP65jIJuvYmgod1fdcj2Uta1REXhI7YpAe1IVFIZwV/i41df5zHBSZid
         /lFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdX1pawCQzAXQET5swE4422ux/MNxG41sgNMstzzKQTlaoy+rOfehXq+WwDvLWjSJtEUW0kpP7Y13BGnDMkxuq@lists.infradead.org
X-Gm-Message-State: AOJu0YzMc+u5fXQsVOuJ+HO5KOeIdQggdsgfFklNjOMx1cYJNi8GOrd8
	jJ2L6SHU5yIJg0IEPqX5QynuX9Soh3fSTIx3fFxz53+QI+VWq6NyZBkh
X-Gm-Gg: AZuq6aIdXXhnWoZZBO00QP8+EuZqr398c3RzhURNi0uDcCCCJSjGCjyP8wRl2xR8xOe
	rPvy6d8eHMTgCigvhkwjpCopGThz3oBFAMxHP7N+Ne7oBObcMITQEn11ZwFw/mvFhY9lRDSElgq
	RqbHP5p1FB5G/AkRC6peB7xmUsyASwAEThrs5ZbWKQRpc1QFZu8WJxHmYGtG1huDs/mD8DDUC4A
	yGSIeSha7gr5Z2aTdObMggMBKEyaOTE53gX2mT+tPWB6CxUOZWxD4KXJ2hTvBRZM+2g4z/sSMeY
	GszQ/XxflihcBdY+kXl5Hl/ZVkkPfFgbyfT+vsUBiLNzWKDc2PgFjKkRwcoH0fpAb1TlUqhPJT3
	XO7RU1vv01DKmGChBkQdDvUh76LSvxk2llqV58BxhNE+FSDXqDdfaChM27p8MBsL3tvUSANdGyq
	Z+9qbf5KUMTpHt3tiG41JWXYU7AIc42in7X4p0N98ZiZxF7B9yhNPOvdVfvLLeYYf3RSOW+SII
X-Received: by 2002:a17:903:350c:b0:29e:9c82:a918 with SMTP id d9443c01a7336-2a717535134mr90244535ad.22.1768808029614;
        Sun, 18 Jan 2026 23:33:49 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:33:49 -0800 (PST)
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
Subject: [PATCH net-next v8 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 19 Jan 2026 15:33:38 +0800
Message-ID: <20260119073342.3132502-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233351_314404_C160E693 
X-CRM114-Status: GOOD (  15.61  )
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

yclu4 (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton  MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 390 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
 create mode 100755 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


