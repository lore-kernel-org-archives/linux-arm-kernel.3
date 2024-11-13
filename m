Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B15D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 05:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=; b=TRBRLh0ds4hg/CeBlP41ngAagq
	PdiuDkGkYcPlxm4EVL7ehH5+Y0l54cKQo852PxY4msoqKZKgPSeNJBcc7eRDvI3CZ6UzQoQ3gkStI
	DDwMdNRYn47GBTs7jYXWCDDvajPIgS08zEMBwIXCUX1jM9wKPfAgoKM0SssQJBt5FUFLFUPmvgLV8
	rKQ4UZNfjUutZy8wW4CPptIfgfEC0qdjtH26Psxh6lFlYBW7dMIDIYdOZnFVxs1+L56IWSX+jo1/6
	JQdeS2HCzlZwb44ZhDyaQCmDWk8CopqyJ7CvLs6DM1kL/oHOsBJViud6S7Ta3UG62tG+VAojbXZ7c
	E1YO5nJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5qe-00000005ntZ-0EZ1;
	Wed, 13 Nov 2024 05:23:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5nM-00000005nQn-0hNn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 05:20:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-72410cc7be9so5650703b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 21:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731475199; x=1732079999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=;
        b=HeA7by7GJKNnNAOH9qY7U38BSQ8F1p3LoK3x4EM4hGgDwsZhEyooMq4FYGSkFY5xq0
         M5Q2f0X5MJ+gh9szLD1trBUVIG2IBrV3lxSzjcGxfDyCjZ08i28GShiYcIg48o+2xm46
         FDn8B6/197mxlLrXSNozBaL9y3Qfm8ImR1SpL6xdFTseIhPO/Ww89CNIchtITdVT5Y+E
         rzSR4t54yLTBwxzZhcsxVxCN5MvLp2uycQ+ZGxVUiDTamdmZEjA2EZPJJvBoq+3T4J0R
         4D7ReNntbj6NLgPV7+OSuIn0apPpf+0L+EJSmDmfcy041R64qJyuHffLiBLkkpX8OnMl
         OMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731475199; x=1732079999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=;
        b=b9FxbIwY8A+sSscJf8DHARNAZZTHYl/d+vRXhkOAzP5JoSfqtWNabM3lahUY+alDSr
         eKgjqPlBS76Fd5+T9LLQ6VlX92iIgpYFjfp/2pIoD5bEQDpg0FyxuA7KIsalxAe7zJLg
         GyvuOy1Eol4CDWqTSSJy3i5zubQEYsOwHtlZ4zpuO5fPqBhLOSE2iXtPzcdJ20B1UyXi
         P3SbM8n3MlaogK7VKw6ZcUqRXKPE6tlOP+QA0JQD+JztCfucEGhRky95e+fEpI+DCf3s
         T8Hcjpm7qOeuduBc5tlTXU8uLPMoOLwrcasnGnWMSp57c0588/5oCvPxDGlKp2W2KIjN
         QK6g==
X-Forwarded-Encrypted: i=1; AJvYcCWbh2CxcnJgyFF4/2Hsd4AIXU5HWPLIumA331+5CwH4/eHoQ3C5DOZBlRk76AH8TU3ZYGxBS9DaqRfniGtMMcdg@lists.infradead.org
X-Gm-Message-State: AOJu0YxUfbt7Lp0Gkx+JQbPg1JUPpFGpCnj/4mGptsjNzEGWVZoiUxUo
	/BP+JsEIjKCf/mYFTgtdjWZXiDmunhngT0zLdhsLqqfTYmfe786N
X-Google-Smtp-Source: AGHT+IHHLuQHdAS2u9WN0pIMIXl2KNf3Ujr3Tnj71CU1NlZaH8WrIseMiurWt5EYjyMM3qTV3eIdXA==
X-Received: by 2002:a05:6a00:2385:b0:71e:7887:81ac with SMTP id d2e1a72fcca58-72413349148mr23941105b3a.16.1731475198540;
        Tue, 12 Nov 2024 21:19:58 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:19:57 -0800 (PST)
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
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Wed, 13 Nov 2024 13:18:54 +0800
Message-Id: <20241113051857.12732-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_212000_230517_D4463CF1 
X-CRM114-Status: GOOD (  13.60  )
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
  dt-bindings: net: nuvoton: Add schema for MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac support for MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 +++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 7 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1


