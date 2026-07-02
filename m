Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HkRnIfEsm7IYSwoxJF19HITLD0IHtrEiTPGLRE2a3tU=; b=dhjRUq0EzT/VRYRGnJbcXycd/t
	gOqrcvRfNHRG9JOTC2HVlvi3ArsfUzVTwqrBc7IxrtfZAFH6A/TCkK+gQusMu2DHVFRCHkhtiGB1w
	e6IzvTH3/pFD1JcYtTuVi3goOHmpL2G/eVq4hYfTaQuAU/O++1v6/xBv/pV7hxOkYvOKQ5zuGdBdl
	bXYnqK1/z0OQAVvTgw+2EroiwqdMWJkJfk9CxGN/RfmgTHrZa+uXYOnISC2QcE6gAGQ3KOwi8aJG9
	Z2hsRRAMZj3e6knIDsyhL51nbUIoq8PMaNxWDX4RyrS9HEIBU+WaBHFROyXrb36tI3fGh7W8snowG
	8Ue0PR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDsI-000000043wf-3zF7;
	Thu, 02 Jul 2026 09:38:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDsG-000000043vV-2E4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:38:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b27c7451so3577815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985102; x=1783589902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkRnIfEsm7IYSwoxJF19HITLD0IHtrEiTPGLRE2a3tU=;
        b=OVEsLIPJHPNg5hHTKtOhVyy6g7yP34V6+X7u3gHhyiLh2ZLYHnPgN8G6V4leNFv2Av
         fof1nw/sZdwfr28JskVYT14M2JC2v7ImKB9MgTceUGyzmnYDKpS6ZC1vAg+icA18jtdt
         2kbV/yFGvVJOArZ+dAr9TfDIRra17+5aN19pKQsF87fJRl6oli5UngzT3uxEjxwKbDOb
         awoIAQbm1of1R4g62H4Jz3/9hn637gvPu5DGRCkuz4t9uUqYHEJiK/CZJt0YKmlhMRuM
         pqfYbLKZtqZfO8xWrcS9jRRdwUAIf89eQQwfE2ydvj3QUTNTEe+oZIVLT1RKX+VxWfny
         Gfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985102; x=1783589902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkRnIfEsm7IYSwoxJF19HITLD0IHtrEiTPGLRE2a3tU=;
        b=hHc11l21un6lbwvKNn9dHFFuc6ef97yAm71HUHfiHMMNrz12WdLnRC1ZYmdGun4+7E
         3iH3pfZCoo9rg33cn3Hl6cxs+L/STgg6nc24AxICMsdJzY94ZO3WzEKxHnN9xr5V94PZ
         Ymd+rp0WwuHdrssF3v3OCNFhTbVyP4dIqWp5DpHB8M5A4l3TGfYalOesND+bYBF3B0vv
         5vKddIVNXwW5rZCMeL5aT4QQ8mj5P5DjLHYsVUNgYlIlQe31Dtj16P3nfM62Zc+Yz7xo
         cpTyhph4EWM3xwSqZnmuwJ7DKbb1htJ1MTozGcHqFcHU2CiSTEXlAmHO2+Asijhn0rtC
         gE0A==
X-Forwarded-Encrypted: i=1; AFNElJ+vH3DW6+Gzy/wAsqWQUGrkiHZN05Vsyec2/uI+F04ck9KiEZQLildlYvT+/CZQlizKRW8a8U+dkj+LM6iFSZBm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7CBTA55shE6BlKWgST7vA8Ns6EQhRlE5GXrpTmYhZVdbq3Jlt
	p4xHsEIrZRbz+muUgiRK8lFY7Xf0ym4EdiOH2fmKaE0nGl5NwEWOs2X/
X-Gm-Gg: AfdE7cmOlur8/FjkUGIXp40uoEx/Btl4hY9zSZL8xcUWlJeMVo2dSBXr/QAR6uzLQV6
	nSLkAoThwy5dvz2Z30+i0Rsf+XOQfDwUuBpcPYlRS4yAtOzFyKQA7QTGKJUYMAUv/oMISWePzFo
	30O55ftabs4mS8HcwEybq3NTZOZJh7QsYK6q+GdPE/LIOAk9gugGux3dPVkEknY178LT0HcJIDj
	5MApXbxpWKsaPHPhFduj2lIBUaB3RaFE3HhHz7P8EEdM8aEAHNI9tpGTlzplQLuyMOSnygNpfW5
	0PQcCIpiQ44BAkE1bLykFp6xl4ZnC8gHEbV/mQWsvJ3LTuu/8N6cw/KxfW3QBQLRBJtn8y0XJTY
	6XCf5PE+kns/i2MZQmf5VQ8lafWn2T+VU0VM1AHpcWOmlQSTtXK0If7XJUBeYPEMSNOf+RLMdDx
	oBpEX9QFq+wiQ5z8TmO47+WlGaDERjbV7BPL4eu/LXpkNcmqUA2GLACePre5qshEJnqdaqYNNaK
	uMTGA==
X-Received: by 2002:a05:600c:1d1a:b0:490:5000:917 with SMTP id 5b1f17b1804b1-493c230bc20mr74096045e9.1.1782985102259;
        Thu, 02 Jul 2026 02:38:22 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm35502285e9.10.2026.07.02.02.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:38:21 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 0/5] airoha: an7581: USB support
Date: Thu,  2 Jul 2026 11:38:05 +0200
Message-ID: <20260702093812.15918-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_023824_598466_937B04D9 
X-CRM114-Status: GOOD (  20.49  )
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

Changes v10:
- Rebase on top of linux-next
- Add review tag for DT patch

Changes v9:
- Add spinlock init
- Add ack tag
- Add review tag
- Add additional comments for phys on USB 3.0
- Add extra logic to make phys optional for USB 3.0

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot
  Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

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

Christian Marangi (5):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  clk: en7523: Add support for selecting the Serdes port in SCU
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/clock/airoha,en7523-scu.yaml     |   9 +
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 218 ++++++-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 13 files changed, 901 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0


