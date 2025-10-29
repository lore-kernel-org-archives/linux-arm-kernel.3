Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE566CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UG6tFvFgO0KjwvNvWtuBqBJX6bB6g7mbwTb4gfTyHGc=; b=gx1fRJ85HmMpjMveSKpXGbVRw9
	CIWM7JgQTyIoNJhPJBlGeJ68HJpgRB0pKQVKjtnSaNhzTKtV2P7eOd4CGR/pjNNyztmT5+l6AHyJ1
	sUxJvf5hv1JgEDOJTGgUsS6nXv/Idu2IirP7clsWGRRZ2/VZdIu42J9DcLWIfrK6/Njo3AH8II4u4
	XJ0eZfFYEGz7yFeoX1izOxJN2iZSnbrK6yZs6xUEQ7iY3yZLtA1uiQOHLaRO2EVeim4b1BZdE/OXj
	xlN8B6PGGZtHSRauKIN9JJcWFTDt1HVFSCW/X+kf0jpeMZumOyutsrNYiH8dTumR9rDun17Tgsdam
	cKpgNtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA6z-00000002E37-31Uo;
	Wed, 29 Oct 2025 17:37:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA6w-00000002E2A-1XjY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 17:37:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42701b29a7eso121605f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761759444; x=1762364244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UG6tFvFgO0KjwvNvWtuBqBJX6bB6g7mbwTb4gfTyHGc=;
        b=icBW6cw7qHKJ6sHtIwFmwnKzhbJ5abJPmb4fU7x+wJr07V0QWmy4YZUvd3ucP6bPUt
         6EZfrSvgfg3itfLbDEBDOAz4fThO7+hDqOkesIPt4nFct5gikW4IT3CybANKEG0qtGIi
         33JIRSFA7gn5Y0U+KpVrBTXLUXnYjBL3cRVoUAtviQH9uLNCcK+6l3MIH+umlkEGjizg
         Wvx0dUvgBXc96Ux3bLKgp6EOdJFyzF2HWw3XF8uTyVt0YygTLfc70c82Zr6lWjWOPZy7
         /oeYk+GbplL7L2BvA5A5SgEtGHefGaDQMMXo9igghQ6Z7LQ7Cn+H1oLUWRwXqvICt5TC
         JgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761759444; x=1762364244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UG6tFvFgO0KjwvNvWtuBqBJX6bB6g7mbwTb4gfTyHGc=;
        b=laHe7dVlxQaPhyvTU/sJs5UQiqtHI1t9CDCS+txCQIOjutNImvWL7BVAaOf6OZ+JNl
         sMo7pNPtuHnyeW3AhqCvlETkC3vBRAjNpf0GcfdvsWfBEQpQuSaTQDUhrNBcbvcWJ57i
         eUqqV4On8KpGjJYBTaoZxM2vG4Tuhgj3b6mh4mDCNX+v3YHEmXuwiRFh5Wa2r7tSxKjb
         2HpuqhgDGKJVQpCXD8hyk90OiRsydBLEyARWP/SoEFjBpqOfw5qJr+MYe5Dm3+Cfo6Su
         PUULF7IDOOtCj4x0fItO7tmKcrsiTd2UoR9o3X3U0wYPO6v8jeNHEyYco3rzTsvH62q/
         S1gA==
X-Forwarded-Encrypted: i=1; AJvYcCVSTrjvlrpbPkF2yIwkNzDKvnMC0MCodrn+VbRbDHPNgLVB44q3X00Ap3CZxPO01GAXHfNvrXqJNH3bto+vHlMv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2cN3UzaZ98jd4JZfEMxbylz+O0aWCR4YJAFN8KYk4FhSPqKrw
	aQzTPd1gHZlh6jlYUH3ZXxq+AAzx3JFk47M5n5yhRnENW8NITCvwmCEM
X-Gm-Gg: ASbGnct7yzKGlh/63kuQu8KizTV73mXe6435xs8l18RjnYeD+qRkoKyEqYyVjTES5Xi
	0Rn+4+dbIauTqohvhWkPW2pvli4aA+M8sy7OzLYeDnD/9qWWLJFMbrZHA8CWqT9yYWlKCjkeRDK
	wNDEkOBWsGiI/KogRvpq1dJ0dsgtmLIv1Ub4numsoPj0Iln5QZA0JtwLagFRyZQBBSY0q1jN9F+
	ex1TLYOUvF0WzaZKd5G9qlEfm9zyaIVy8zhV1EVCWpxZ2NAxQlwWdp9ZxS3nhfwqyZD1czNrCU9
	Rs9EGT4z0FlKO52DCOqrFsOtdqN9KUyz/rTjypCVsg9qJttojBubpg+Ak8OygPIJ4WkCQclS7BW
	y+3PZag/q6dimpz0Ty3Bl3Rg4ljELrgceues42uTbeYq39+QiXN8E6E2Gy5ab+ZOlCTenv+7puh
	V5kf+D0+Stsnq0LqEA77o88Sct+C1Z0Q==
X-Google-Smtp-Source: AGHT+IGR0/h7xWw5u+tbePy3AOUxoydllJajHgi8S/oFMc9yrZfdEmTBxQl8jliT/49OYCJAl4LvOg==
X-Received: by 2002:a05:6000:40e0:b0:429:8b4a:c3b4 with SMTP id ffacd0b85a97d-429b4c0f438mr437419f8f.5.1761759444051;
        Wed, 29 Oct 2025 10:37:24 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm27493844f8f.28.2025.10.29.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 10:37:23 -0700 (PDT)
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
Subject: [PATCH v3 0/4] airoha: an7581: USB support
Date: Wed, 29 Oct 2025 18:37:08 +0100
Message-ID: <20251029173713.7670-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_103726_422602_002C2E95 
X-CRM114-Status: GOOD (  16.24  )
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

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (4):
  dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |   76 +
 MAINTAINERS                                   |   12 +-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    5 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    4 +
 drivers/phy/airoha/phy-airoha-pcie-regs.h     |  494 +++++++
 drivers/phy/airoha/phy-airoha-pcie.c          | 1290 +++++++++++++++++
 drivers/phy/airoha/phy-airoha-usb.c           |  615 ++++++++
 .../dt-bindings/phy/airoha,an7581-usb-phy.h   |   11 +
 include/dt-bindings/soc/airoha,scu-ssr.h      |   11 +
 scripts/tracepoint-update                     |  Bin 0 -> 22952 bytes
 12 files changed, 2538 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-airoha-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-airoha-pcie.c
 create mode 100644 drivers/phy/airoha/phy-airoha-usb.c
 create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
 create mode 100755 scripts/tracepoint-update

-- 
2.51.0


