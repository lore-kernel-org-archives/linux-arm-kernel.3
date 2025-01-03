Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6897E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=; b=HQdxWzu9tMyd4xwL1bDhJgCnnN
	EbCEgbbUjWraC6kXPpx8Yn/sXfetTWdViSJ5h28RPfOpIrV8OgVoICypGV3j+TeEUey+VMZPxMRxe
	jn59gh7IbsJpW+8Gvg5+nzlmqNAa6pyEYfClkeRcBJKfuZUcMGd+WNMzWTaJTX5gHhCucn+Yhgts3
	Jd2xw0jcLmc7bNWIT1ubnVhc9PFB4PUxbQCA2F5qxVxcg6R2ssL/lZhEFzxv1M90YCD6dX6NEIuSs
	BHEfOUMz/wSI/CJUdJ5BFL4n+N8DAdgTAjkEeVxua1twOVH98pu/yeduRWsGvZLhlMLf/ELt4j7bZ
	WZEiF5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbNO-0000000CF8a-2lst;
	Fri, 03 Jan 2025 06:41:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbF7-0000000CE5A-0M3P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 06:33:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so12361024a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 22:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735885988; x=1736490788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=;
        b=hBPVrpAbtX1ZegohHLdR1Gm5JFFMqx/vjEnEZR5W3U6B9Ue6IOIDlt+QPVaId/Bwux
         w2/VWfVfwMwzGFcisbAb8Zlnevx6L7TOomM2EIkj8lC74hCmqu0kdCxkomjLrNFkg4+0
         VWGxLmACsFu7arcM7rIwRA4g3kQqRgEU9H4+sg+yMl7YpaqCnzSaiAZa+LeGbqSPNcAp
         +YLhUHtJ6xyMhSQZlClEH4k14JTO634Okokg9Gsa4FEZiX/nmXMhdxUR0UDfN5rCxM6i
         89Aeyn9LB8XJVktPVnxCxwqBw0y1gPWWRRE/XmOl80vP/2o1VfPeFgU9mWLta55XGT3C
         FNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735885988; x=1736490788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=;
        b=f0PS/sbjM85EYrOXWPACNSTXWhHgCAHRtBAP/jITf6wCyaC0f2YseDrSvT16WjAi2k
         d+zihKmq1hhcrwedCmDTNY71F2sIkLziF9k2uK1zROCtJWE7lF+Gl1lcYFq4sbDFwK9h
         dfbYCqUEVHcfNqMvZZiOFN2vNLahrZ93X36xtv8MKd3t/rF9NyzzIvaN0v8IpospQZOJ
         vF2zLHckjfF0Wdl1UdnLxPaAzumJ0i+BSyLSgjdd3uIxgPmfF8uLbb/eDbtPFIZV0Gjc
         49eGnguVKU5h4DqTUIXuHbvmb2cIdZbB3f5W5MnIVC7RwDiZVfzIQDM0JsTPC5twKS4Q
         jK8g==
X-Forwarded-Encrypted: i=1; AJvYcCXIhzHROshvWPaBJ0o3vnb302JWHYHuE38hj0t7mG8IKq47CixspNNwdkJ8gLWjV7CpdDKW246np2A11PmNC1gz@lists.infradead.org
X-Gm-Message-State: AOJu0YzElElL25W5oz6WuqjiR2j/PdxlBcLmRzWbDtsXoQ5zZUpbg9QO
	XdLf39EfyfDk/N2c58Hsbe4xXa4k3+fYJBbsXS6vlpDdG3CNw2lR
X-Gm-Gg: ASbGnctrBB0fofKx7ukdozUOiYHX0+eH5d7FJcwTUHj7mF0xI2Xfq3qtZ2ui2kaQTqC
	UMplaGzpp1+OLNdmgZPmP3FHecmGC4boKOQYynSaRb8QLytlyQranXu3zR4iicUmOzWE5+z9Xim
	Uodyijlc4Yua3Zb1vXf/21Qkech+Mut9c2GZlP8Jjvu/wWLTxCXjRjtIaUyyYr2w1aFivgj/1z8
	5+BuqoGAArBZrAylX6VvO2W7t12zNqMenbJtrlOa5MLQtxG9Y6kb0oRSiOUgI1iI3oSbM3hJ+nn
	dXZeiuZRqt+Ib7E6ub99LQ==
X-Google-Smtp-Source: AGHT+IEg9FrZ5YUufYh0MJJtCtJUyPbNJMmGsbwn8DtZhoDwMHr36/JHl3HeB9+5mO4uV2/PACAAPA==
X-Received: by 2002:a17:90b:2e10:b0:2ea:8fee:508d with SMTP id 98e67ed59e1d1-2f452ec2e82mr73280088a91.30.1735885987768;
        Thu, 02 Jan 2025 22:33:07 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:33:07 -0800 (PST)
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
Subject: [PATCH net-next v6 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Fri,  3 Jan 2025 14:32:38 +0800
Message-Id: <20250103063241.2306312-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_223309_131046_B4E2A394 
X-CRM114-Status: GOOD (  14.53  )
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1


