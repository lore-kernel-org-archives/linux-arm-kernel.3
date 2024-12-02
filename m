Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F3D49795
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=; b=4stEVZ8AvPhBWUe+l1x+u9XHhO
	8R/3X5LicYq1S4NQ8SFQ0yrB2h9m5gGgfxs39q3hj2k2RPw81hBm7oFWuS9nvModyI3Gyp/45nII/
	XEpoqiqh0ouXK724JLhQZjy0nGZXCE1q+NXJD2EzVsercfOi/HfW36l9baGZfs/6Yq9ucT59PeoVd
	qVRCxQgrLB1CEyH513i02jVT44M0jfkmj7RvHz1u2cMfEwZgkejVs1/Bi+Tc0Cx0ydNYT7tRaVDyu
	i+itZdaQHu2PeTX8YOr2zEeQUpnAmH8UG/9ViA4MxO6X8C9gaPAQc7TsOy2PIb4QT6KhvMASQCTjt
	XerU4V4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxLZ-00000004yvB-3nIY;
	Mon, 02 Dec 2024 03:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwJ9-00000004p0J-3irv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 02:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=; b=ih3llW1gkpYTgXNxBZGlT38q/i
	BHUhbc7iU7PbCR0JyOpnc8B1QbQJA96AXakVRi1Qu8N+SXWEA7cKdRTyDXHRLjotVi6lO14SCH7OF
	Lt0krplhVV7cVq+d6YWcpiDVEuJkmsKDtLTgWIjEAhSTCrEeuN3gy0vORZHDiJ4T3df8M5BL0+cca
	M7ypDr3QJl9+GHSpjJAwDy7bTmqWfxXjG++w1IjBEoV59y/4QWGoGzaRfdQN9Gbr4JQMzqI4+wOMB
	RvRq6jPxu6vS5GMrcDqVMd54Go2uDi5/ys5aQPBWsgsgno4zCSMHrdcvJNLrxF5ngbZ4zCDMzZ9PN
	YqC3Ya0w==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwJ6-0000000263o-2YTU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 02:37:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21572ca3cccso8815055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 18:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733107021; x=1733711821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=;
        b=Tckp6K84FWFWtD4+nb4FJ8zD7OXFm57ooxsEZzfMPYBqceiUyRYC0jcISypepEnO0G
         ISEBVkLP93BpeOKfigRnG5iefJNs2omZ1FQksvywtVgvnpkeplF6LUS//eN1AY/iSGFs
         5hfFro64NdzZYr00xaLdzb/pS0zf02PRGbI8bShaRSZhhc2cIqLzPjsPHJ4/cbPzFbeY
         drhPipGm0RLOTUpudEmwwXBXJfOcWvnRk7/yRoy2BOKra5ofyuvZrnjgOrT5F/V/j5Xc
         pjw08ETZY0M8Gk6yCpmk6ZbyBCNAscT1tgIM7PASCfQV3tXtBBQrwhAdEPI1t1Dy6HVd
         pTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733107021; x=1733711821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=;
        b=HDACvA7FcOd66gG70nqcTnmGDorqCbu3sKN9Z0dOMwrMqo5LWas3KSGA7hN/Fm04q8
         Te9zgysfUIDalhRuS6aMe5NvLMajIoTiEU4/ruw9RDUHXEFxwjXkw60K23BvtlN8g8Ex
         rWQevOwVPtoEgiZ/kZAwGtFwi9BiG0Rxn5qogyL8ViOvMCWHiAvUMQZCWRFcYZMetdlk
         zQnjj9k//ZrXxRFyX3UgoEaH0QVEhF+69QQ8I1YeJ3bgY7nDMkQ+gY19C0eu7SfVnykK
         P32uCgn9nO9A6G/kpefNTufcPNT67zmlaGbOxeXhh9epnN2xq6AxATj887+pk9AA2aUU
         SqKw==
X-Forwarded-Encrypted: i=1; AJvYcCUVgPubTd+Sa/mZbtGjmesTPNGyy+Fc9dj1MmAxuW6wP1awB0ZNWlE77N2MgMG90dR0+tl8RO8dSLgKi2pkuRZo@lists.infradead.org
X-Gm-Message-State: AOJu0Yymaz6zZqu/+xVDHZRcp+MqIZVZHkZXmwliTLxT/UiolOz1aQLk
	IXNCW08QvN/nCmTyNPwVI/JeZWvV7st3nH2TgJZCdrCvX3cP0RzIs50gmncX
X-Gm-Gg: ASbGnct9BkkM7q+cm/t6aiv+kj+ZLciQHpe7ovASqTG9zreI7cXAaXk7pZXn7uVETNF
	O6k1FDLPjhxbpYyKjUzzf4UR/muOXukcRzFphUo9n8vghvpXEVk8rzK0gpBvbNsK/gz0EpME6YE
	Ru8+VaaA7GjPeRCs9Tni3I/+axXUIXubus6Y0cJhTlLJ4yla4fRb/zUO5fPQPfFHpl6IwMBpGp4
	YEDk/rwnLP/UELENiicinRAX6tf9JE2uvu50A/QVu7gT9YHXCU7oEyUCh3YesHblIq2I2wRKTw/
	HWgxFS5gYRyOGac=
X-Google-Smtp-Source: AGHT+IGLWJOBt6A4ZzleNpaTexfFquv9ndvXCA2owoRgs9f4h1shTttjNxjyQrv9s0g8p/Xs1tMZ1A==
X-Received: by 2002:a17:902:d491:b0:215:4e40:e4b0 with SMTP id d9443c01a7336-2154e40e808mr142897375ad.9.1733107021039;
        Sun, 01 Dec 2024 18:37:01 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 18:37:00 -0800 (PST)
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
Subject: [PATCH v4 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon,  2 Dec 2024 10:36:40 +0800
Message-Id: <20241202023643.75010-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_023704_878710_1A340801 
X-CRM114-Status: GOOD (  14.35  )
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

v4:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use .remove instead of .remove_new.
    - Use dev_err_probe instead.

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1


