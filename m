Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264B3E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 05:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=; b=TBkn0cNu26T8I/3KJ/+77nBQ2A
	9recbeU8YCLvCoKEoDYK1pEh9cDZ2n3FH3iRCNyVBD9omHRs35gzZYFovSh5uafZHWuirsLH1p1eY
	SkkVgHuQpd8FPX1BlVj4LL0z8BHBbwPz6vbkiiWOm456PkPCGX+Sfn3NyY3XYqqd5oZ16Q0C8yRi6
	7gKqBRWyGxL2o0mHjCDjT6LbjqXrnWl/52IFBAnw0fka67s5tn/T4BonKgj+EZHsY+lTqnlIidGlb
	GaAGrzwyjuTbUTK8XLNAa8N/HRiJSRELPEVPFxGKCMo4WdfET2dvZLyGGbiSjRDfnMZdKHnl0htWA
	1UdUkbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDSC-000000045kM-2cuo;
	Mon, 13 Jan 2025 05:57:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDQt-000000045TF-15J5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 05:56:16 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee74291415so5159787a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 21:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747774; x=1737352574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=;
        b=I0j0dPgQgAjPIRFcaO1v+7ZbZ11cBZfJnfbNCOKcj0VnuCJvapezQ455ykWajHv5EQ
         iI6y7iHmtFVWyfJIQaz2x3cncdXoERybmXi7PSFTeQxmQJUq2qjkuoZB91LX7kvlG+Ss
         8vXhNjBEMKvNnAGzV534vq+grZOXiSTRktMJ9HudMYxiUmiUl97BCSI2yjheooa86431
         OLEizwSfst4wfUKBcdh9ThfSswbaNGJ0PDWN8OyYxT+5RNBd8SeASp8CrhTS7HQfhFD0
         NcU5WqkESAGAfy8GqeUB2KwUxvOpxT20WxxdRlwjRG4kPmYraTkBm7B2aT/j6wiTeQks
         /SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747774; x=1737352574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=;
        b=ca+a6iU1FltbgvYd1axOGRtdHbWKNdCdNZiRAs3l/Vyr/8OowWpKcwIdxNmLbT/3W8
         TW0sd5UxUTMUivQPn177nRQ5AP99EQOvkDe083rd5n6zGp9eqN4AnHJucOiDANfROgiF
         pz/LyZAGxEz0fd9onvgiRCOBQa+kFwKHJFFI1TjsIv/ku/oIfjV/O1p8tgxh8G3J35dj
         wO3AlAPhuGFgOX11nH2SwUQgscitZPAT2UQKgCcVZDy8CwmVmsW2RSiX2o9R3wb8yJU6
         CR7wJTBKm8YkCz0kHC8k+rAIZxPs6/opRTlhSiT/IUN+uSSBm14W+lxLHD+vf2/+gL6h
         9GGg==
X-Forwarded-Encrypted: i=1; AJvYcCV+MgcdtkTBcWvaQ6hiPfiICRtWYHe+mMCa9tgzfSS6AQAzqLUbB8kD41uOk8BPyEmOqIXxmndVOFJpWFtTkX46@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf6OgkK64v4b4cJm3G2Hbq3nY3pQURep6tRg6k5uZtfuve2a5G
	BjFvgtjMX6Z0WCvF9Bp+nXkC5BmMT0U2Yu1lOdKXgtXENe4hm5q3
X-Gm-Gg: ASbGncuqwceJe3w97MdiMnokElbUq7gqvss2evBLFEHoLuO6/t8DbxGRzgy1OsI3+wU
	S3TlaaLWxZ983+5tuxzdb7mGhKaBOVl8/mIehdwTLE/brBv+wzPTc0w496KYssIZNKZVVBc61cy
	tSOu6kymjRcA6oH/rgPHha9wtXqHlYfCSPsiYcT8iYoCAQcM7abrwyZevPh7dyh06LtC0/I/RPf
	MGIfN95aKkC6dE6wlgjj0QUWZ1XxVFBK8bFTYDy0Y2HfjDiy7AMPLa2GvOY5DZvJctf1BenzXQN
	u7VBYGYq9SC6zNma+G2q9A==
X-Google-Smtp-Source: AGHT+IFmIR9Ae+L9E2pmOyCcc+X8PWxnJne3SU6MtRQ2xXHY6ezLUBmNIufZB6pkQGPkrrzXMSDgtQ==
X-Received: by 2002:a17:90b:51d1:b0:2ea:7fd8:9dc1 with SMTP id 98e67ed59e1d1-2f548edf181mr30621775a91.18.1736747773860;
        Sun, 12 Jan 2025 21:56:13 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:56:13 -0800 (PST)
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
Subject: [PATCH net-next v7 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon, 13 Jan 2025 13:54:31 +0800
Message-Id: <20250113055434.3377508-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_215615_310710_59D9BC6E 
X-CRM114-Status: GOOD (  14.88  )
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


