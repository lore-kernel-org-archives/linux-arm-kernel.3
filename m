Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320A2D43FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=; b=ez2ufgIr8MUX5tqJJWxdqqjxVn
	s0XbaRcyKa2nEofOM6syCWyqI8a1aB66cID9wmY1pXcs34nup6vnKlStEoZnCsy1u6i303zcq9bkQ
	nXRR+x/v741T8GJcOPrYwWrBF+S4rgjy6ej5rawcT/pXvtAmMtecgSWeupNMx5AybFoIOUgmPGxtU
	JMJyIPM3QCN+CJrMAG+/AVTYsWbV47r7LjKIQyp8hVuuJYpSsXdkNPtCQCEB7oyTCQVfvtzbccr06
	raF80gyvoljIy1+Fr8RdN0Ku2We6WXYlvTchRiqhbSrAwOo0Wn5GAiqSTHF1q+9X5Y/HHKJC2A34R
	Q2132IMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCx8m-00000008mQV-3uC0;
	Mon, 18 Nov 2024 08:29:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCx6a-00000008lpv-33JV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 08:27:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21207f0d949so11210005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 00:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731918451; x=1732523251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=;
        b=IliWWhH/1als4FgYolwIED3fMmbZef12/vcL29H4N3cbz8gmJx7eo08cyj/SsveWvu
         BO52KHhduHtgItXMHxbzunsX2eX/QYKbR3FwD90CSkhLwHzFOwJhd++edjqXdN0IQDUg
         ma4gSidTMJ+ARFF7Ic2mxOAPx7qtZVPkdYM9auhwDz2GSoTokUyMFc6iR+4JAbc0vehs
         kfgS7ljKrDN5MKyFyH538n0dGqqFZpa/prQUCBHHTd8Y6x2m5S90gjNtOTpWWjtdHRsz
         S99QyUh6HBdAQgKXjmv48Wsz8eQX8Q46V1FEcVD1GJzRqPVf9Wqqcu2iLaBa5HFWXg39
         KXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731918451; x=1732523251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=;
        b=YZs5j1K4Up7z3hJuLaQfhcwCS21iTiX4cR9QXSdY5cCTGpDPbzXb73QNP6iE8RmhrC
         D9PHJkysDzcGqoKykrPcAiHCWcyCEG5d5ztlk8vvW0lG7ixbUmni0WAEpgQ2jv2qSxVy
         AjZNgRu9qV+jp8u7cuJezPmEVJXKZCKJtuPnLRmoA6zoClqc1nUFSTMpRmzrtm7NUQjn
         O4a2IzVSMgreW2gzL5GGzis9Qll0ZsIOTeK53SFChR/oTCNZcOMuANnbk0DZLUkNRXY3
         ntcNE0L+AfUk+AFM/soeuf0pgf+fuZtm8iJQRNmHs2RlWL16fZoiJtEFfpR9CxYINpOH
         Dipg==
X-Forwarded-Encrypted: i=1; AJvYcCXlThLMiZrNUhbR7E3hhUPI3bRCWzvapxxcp8HuWRpVii4b8jtml4moT4iTLSo5uJhZ7y8SctbSAgsBErxO0EAU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ShlinElwLOIhSRAqmefJSYBdFZUnWVVUH2UpYt6HNLg/PqN6
	bW//GJRVSf5sgFpuuSgwSJ42fT52a98n0jhryCHtnvcaEK4AL5Zq
X-Google-Smtp-Source: AGHT+IEvoyj4wxb7J7Wh84n7jGX2+vtLnvotel8z2KtjVjP3hhCMcqWSJASSXlB0gPXXOqon5nxuTg==
X-Received: by 2002:a17:902:ec8f:b0:20c:a692:cf1e with SMTP id d9443c01a7336-211d0ed9a12mr171662035ad.43.1731918451221;
        Mon, 18 Nov 2024 00:27:31 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ebbf9esm51883815ad.45.2024.11.18.00.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:27:30 -0800 (PST)
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
Subject: [PATCH v3 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 18 Nov 2024 16:27:04 +0800
Message-Id: <20241118082707.8504-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_002732_763173_484E72F6 
X-CRM114-Status: GOOD (  13.79  )
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 +++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 180 ++++++++++++++++++
 8 files changed, 440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1


