Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BACEA7950
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 01:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1OiYqbF7y0kWC3l5ZGq7AIg+QHWt4yVe6CopFDBbu9A=; b=HXaxAFxkfvjwthR4MQg0XXrgZL
	Bhs6a94cn5VeQtRAkB8P4vdqI0rqJqpRb4BmrAdbil4MNrJFh/fVgvY1S/+/Ns01H/A7q0Gv+cMgP
	hmhfTN7lV3zv61SyXCVHsTZueMH9LUGJLmCgYW+6Z8WwFTTEsaTwpJFYHpTAR9XAWqCZBmVaR0njw
	VDZC6b+zLI1ZOB31WYFR7YnO3jOOolpO6Gx+iQS/akv1YL1puOO7IWAzWYiSP2Q2dGx3y3WnvwUk7
	wWJdUalmQ6VkRePIiDlHpMsObTIOoVOr98XfRhZ1iofAqp3ykzWVrWR9R1dcTMHyNNXjuG+3QlaBb
	7q5jAzxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoLw-00000009Gyb-2NK1;
	Thu, 05 Feb 2026 01:40:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoLu-00000009GyE-0Pdb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 01:40:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-352e2156450so134754a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 17:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255613; x=1770860413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OiYqbF7y0kWC3l5ZGq7AIg+QHWt4yVe6CopFDBbu9A=;
        b=garv/03w0f9KWfLCk5V6TceJttg1cSEyRs2H0Vf1qIViSw4eYBwhv1sbddlfzyia89
         ixhuB+oO6sYxANDnJgFEm2O2YvoKGdZ7zQCdlTHtFp0Lf4XOcfygkkXOvXt+GORyg6i3
         PewnCm6xQn8Dvi2zsA5j2XUA6cetJ9uyhE1Rylsi/QNoS9GtKIpqE2ZM7sPycGLdt9wK
         OtKegfkmzPB4zq+BX/vlf3LJDT2uk22yBSXm9dJkAcPPkR6gABQiQJP6GkU/a9roYVGX
         F3YhJ0rkcJoc8Rs4rJAP1XLwMX/Voo2toAuM6DwtaWgOx86Bi5Qgk3K1JqLUX7qxx1jI
         L12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255613; x=1770860413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OiYqbF7y0kWC3l5ZGq7AIg+QHWt4yVe6CopFDBbu9A=;
        b=piVIyPJB39ozMlDb9fZE7DbYb5QTsoxPAAEgtmpL2tfQ4VVwqL4rpxRD4yQiI43C7q
         I2DkBldgys4Z32B1WUgAWP98vbHRNw5iYPDvDWKMkcSRD2wvjsWO3XkTMYtD58CAaesK
         BXh6cwP6bPHP6Na7HaYoI1lGz2Yy67Lznz6PKN2B1FDJ/XWLzFGpus4K1CitrIO0PhWZ
         JBdxAKamdOhar4DW3EpfZVJZ/slm+i/4REyemEPbRU26exgUo6yEiGenS25BSvOmOBiz
         O2fgMGweVDs0eWh4sbCkSMjOwEZx4Tv19iGRc+Pc4We/I9eWKyC6SyXOeWqEJis0ih4y
         hVhw==
X-Forwarded-Encrypted: i=1; AJvYcCVMxbxe1gmDgGNzUglU93EVv/4VN+aHlGWvxtVkaRpWSHYRxjznlQUmzcSl/aO0wh1q4kWykhC2xRv2Y11By6ga@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Et18ZkPJ0F7ATWIQGD5TLd7br6yCooPe2Ev4vR9JhYFybDKA
	1TmUovTjykGBji+ccdOtEA5dJCv+ebRSGP0qu0zO4da5xT29zXIon7Oy
X-Gm-Gg: AZuq6aIKM7PPSoGw7f06IN0GUpGt2hwYyKYVykFJze5mDH3C/aWrtPFTT7xnOW0maiC
	eI53QktQ5s6S8fOW9bUV3gxz/7+/yfbqdspeeJWsV6KmP7Nj2eUGGgWaxLCzNotNPlTL3LQci4n
	2J8IPgfO1xhWyI4cHqTyUr/hlc2NOloNNvy3WHuIHWm0mI6EIctuVpyzP8184rvNGFWeNzk1KxK
	VwbMouTM3cTrz+N+sGDSiLlSZe81Je0xVmI37pW3pAAc0lOqZpsF8gcpRujRybDquDuwYIyLNtX
	o6Cccwen99cBAM57tkBXo06+KFE6K0ALJ0rNgpOQlUmaBzry1nVPqo0/vQUpWv0xrP7iC7VZzZF
	IDssZBHP7bIe1t7MTrD548/2Lqp93yksKUdtLSyu2PQvAIlpPibSjdIeHc3Ig+UbN450/nj9YqX
	HdICg+rzFO//F+MKK1L/tFr2kWXxda0+HG5IeNtp6hlsJbZi5M5tMXtFUMVMQgVDqqKINjxiTB
X-Received: by 2002:a17:90b:3e48:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-3548712209fmr4771036a91.15.1770255612635;
        Wed, 04 Feb 2026 17:40:12 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c487a7bsm673571a91.16.2026.02.04.17.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 17:40:12 -0800 (PST)
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
Subject: [PATCH net-next v11 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Thu,  5 Feb 2026 09:40:02 +0800
Message-ID: <20260205014006.735408-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_174014_168452_4034C8EC 
X-CRM114-Status: GOOD (  17.12  )
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  44 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 173 ++++++++++++++++++
 8 files changed, 406 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0


