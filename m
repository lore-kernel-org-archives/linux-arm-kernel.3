Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD88CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G0mDULtyLau81Hx7l19RN5NkHyi5+qJVHhgWHezFVzM=; b=lHiPOPSHu1QAuaLSYftYLqw9pX
	JWcrxNzeYcFSuUoXkAQxbwCZz+azT7v6SbgLLC9E1UhihwW7aiKu5xFmxcjETqRIKCEWHIryxEQm9
	c59MXUIpYedbRm0qBwTgh+gWu9XGtd/C/pJWbsmXo+mnk32df/zSKjz/kvvJeNLVPw4MOTYRWSFsY
	EsiAIRhLDuvJHkd2fPPqaiKueSctOxIS5xBW3ao3Q5D1ot+scI10a0BthSpKGs6Kj0peA/9gCyAbj
	Rdrqm130AOCPZcuJl/EWQ/DOP+nkSBOViJLuhor3RC7HYaI4HBDJTpr8L+ZNbb8krI8+SfYzSc/Kg
	uuEwRl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvp-0000000035P-2Uyt;
	Fri, 07 Nov 2025 16:03:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvm-0000000032a-08Km
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:03:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso869993f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762531396; x=1763136196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G0mDULtyLau81Hx7l19RN5NkHyi5+qJVHhgWHezFVzM=;
        b=Qhb4F365K9hBpwD0zXe0b4SChyvmaou4BUsq61SopETfOqLJhNNm7uNTa4RuHrDTQm
         z9BUgiB3vVlS/ID0hh86WY064BwwWqTYNT83N4it+r12HzMzvZZy7gznHPBLV+9Hsvpn
         T9gjeA9Tp1bAmiBse2Zo+hFT1LkVeyT9r7s/PkgvkDMSJ5Xami7c/4E1NfVR410og5T4
         WPlHkFTEvL/JmnDYj3t9uIGQcdnej8Qng2Sq78oNkw4/VZ/Hk0gjiGlBOQuTdiOjXH3Z
         pS8NAjoR3ZMvH6SNh+levdTik/peoul0z1/g1mOmuaYybWyhm2WkrT+6pWrVWucUBcbF
         ieVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531396; x=1763136196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0mDULtyLau81Hx7l19RN5NkHyi5+qJVHhgWHezFVzM=;
        b=cROa4x3sAOJyBUZxBRfc43l60dv5xkKreFooR4W/h79p9zX1qbuD9fZolM3ScGeGE2
         7/hAlgZDJc3FNsQlxBJcKpWTPVNbM5up9lzcyiGx5efe/Iw/a/YbsQnnMUk4mN3Aupt1
         /LECIoWL1828827+euhqR+LZvrDDzR5veDrumtelfqBdovArIdy+fCaiCDyo6Rj+I9AN
         JptzeoG9W3tHvNre6CV0TZ8OMxf2P7s5Z0Jp6A4B+G1rsPgpJaOm9K2m/Ab2cWkf+15O
         /UiGI1EC2Ni0/XFAT+KlA3CRBc0lVYrjqmMcw5jk4LU/5DAGPb4DEu+x0sXjihKOe5UB
         jevg==
X-Forwarded-Encrypted: i=1; AJvYcCXZY5fj1ri7XJMlQFJfY2IeNZu+gRXw9E5IiLejLD5HFUzv9URNVre7/CaD690iiqKJxrXYm3nOB0aPECtpsbhs@lists.infradead.org
X-Gm-Message-State: AOJu0YwUF/vjsDSCzC2a23S/UEdfLHv+rcK+5Iyl4ECdqn/i/IluWJBl
	f9MMWp8LJ/7Dx9s7IhAAnZvAwoSBx/5t6XbAoQ/dPRtTArAPGmYfz1mf
X-Gm-Gg: ASbGnctD3Llo+PwuCUcY3l8akvL8J+zQBdIk2xqd7M3hovk4owz3+9PSRRPvHCgYHB5
	HMYTxB0NDTQKr6is8DEsfVIzP/lXEYPppVqdTXCsko26DgJgatU/IKq0vFqYCCZ+5AvP2Agz+bS
	iUFGZu7i07lJOVv9DU+TsIT9fpB0cXeHJuozuJl187adKcuCEZFIwUv6FDImqIR9DChYTgIYUSv
	x7DrU1aXOjCtht9jo8NDhIaRnQuCIhJ9FH91DXdXdLTvzqysO4HwK1C+xnjGI3ftW/iTsZscms9
	opfFiU0Jae2LklpeDK7nzeKtFZqVt05mJWJ75ehMqR6w5cnaXHYjojLTyNAqWA7w2QRMUVvKrOL
	E9SHm9NdFgKwyxPiM81nSP4VpGlbNdqNE/ZwQ6h4uVY4WyXEZ/Lf9zxjwmCLSzbeNGRjM/0bV98
	j7oKHTUmFbXBuzrd6xvStJhks7OKQfFQ==
X-Google-Smtp-Source: AGHT+IGWPgmkF6Tn4YlpwmubMBI4eBl1r/OcD+5NjkjCWh9jwtlH3q0sR0Qg5xX/PiNPpj2joJCdKw==
X-Received: by 2002:a05:6000:4409:b0:42b:2ac7:7939 with SMTP id ffacd0b85a97d-42b2ac787fcmr514536f8f.3.1762531395848;
        Fri, 07 Nov 2025 08:03:15 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm6058016f8f.19.2025.11.07.08.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:03:15 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] airoha: an7581: USB support
Date: Fri,  7 Nov 2025 17:02:42 +0100
Message-ID: <20251107160251.2307088-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080318_081535_804FF9A3 
X-CRM114-Status: GOOD (  15.11  )
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

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (4):
  dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |   71 +
 MAINTAINERS                                   |   11 +-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    5 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    4 +
 drivers/phy/airoha/phy-an7581-pcie-regs.h     |  494 +++++++
 drivers/phy/airoha/phy-an7581-pcie.c          | 1290 +++++++++++++++++
 drivers/phy/airoha/phy-an7581-usb.c           |  614 ++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |   11 +
 10 files changed, 2520 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie.c
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.51.0


