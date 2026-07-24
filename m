Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF38C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=txtxniZ+9ec8EBGpFntrCaDEilaRw0NUEsRkxlT+KQE=; b=WNzdFHRHr/M4g/pnR/hDXf2S9W
	2bZpphEmYqZSBzV6kHixQHzF8y7SX0jvIRDU7cZeZxZ0MTtknDnqiFDjIKBffBxHwZO+kDVITIB20
	0IaW7L8bjeK0m1G7eFg2DX+dgNFWiM17L9+lD8qCJWd5PPjQyuC/UEPd6OtOErLNqiplgzhjAtNQJ
	ZN51vimIJhBS8ZDzLnLWPBb3A6F/5/XaNMXlAhCUEfTVyxJa10Np9LMRxvhA3tBk0oP7QhbkX1rqX
	i8rKk39f2fh+xQRxt5laOrAJsoRi/iKl6YqD9xwkstIVeWLzsNlIHtwH5QOoJafygpBc5EIC1bmTe
	uIjSz6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKtu-0000000H5OA-3B6J;
	Fri, 24 Jul 2026 18:45:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKts-0000000H5M8-1IXx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:45:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49571fea44eso4697885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 11:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918734; x=1785523534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=txtxniZ+9ec8EBGpFntrCaDEilaRw0NUEsRkxlT+KQE=;
        b=FipDjnn33qD/qtRQ3Z6L6MlmzeOy4GTg6+HJ5HTdt1EjkFjSnUSlm/Sc5QVSsGHFiK
         xcq/dSEGlwOcsJgypS9E2W5Ym+4LobD4OFZkqTYpJfkEVY8O9+tN9UYT0E9ikjM40rJi
         1R+TsiIIeMhwtDkxSAwzRl0bJ8AgE64HjlBrAUHWqXUtGNaV/bixHqvqZp95RYXITlbu
         MQoDeAtUv+dIBUYrc9xhShsYNAH2ujIO+VZPuQD0y/vppxZ/MlZBsHt6J4qI/1EU1UGG
         cZ7uwPWHqtC+juKUBW10YlDB+VJpF2GRRp1oLAbUCezKUA5fIJi0C0gLblEhVNXE8tfY
         xm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918734; x=1785523534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=txtxniZ+9ec8EBGpFntrCaDEilaRw0NUEsRkxlT+KQE=;
        b=KbTJDMG/KMhzGUtDHj0dGtLX2DRzo2shr+YWt6o0vU/16cZfhOxxMkK6bVEhN6xSnS
         MGQ7VbJXKhCM6BaV7Eqw2rIu/wes/C7cZUM30mXYHDBMkB0vo8i/PTgNpjaQPxqm0scp
         f7Wdf6C/nDXTvahWHcvh/4ZtwAiIoS2HQ4vOMnYE0L9aV77H2r9zkWb27zzRK+JBtee6
         RUzpfBVHIKrUNfShgBiTEqyIvOIXXRdqCtDcIZCPIJdVJBV3xUxfzp5H1K5bhym7uFJK
         FjbZ2ewNWrCHP4aEXkg2BrMj/O53mBmtQTg8B6ZdvPJQfl6MV2ht/FcraQ/z+yswobV0
         ICFA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx4iB0HWNWDXPea2twf5JOfu/gpZlNYSShMddkGGSuyDeTJ8Bv9eBNrFE0znJyP/If/SioJZcTUSUVdUWsFRzN@lists.infradead.org
X-Gm-Message-State: AOJu0YyG++81BGnHXS1S0hfu3IDXS5e7cTE5KTsIkOXAwzUXH8JixaRY
	AxtL69XkDcLSgcg+aYUEHTRuj/nIKYAHIjb9W0bMjnrogQqfPJ6BU+hm
X-Gm-Gg: AR+sD10bWX85BNDTB+FQr5KUrKYlpRDFfm78BT1LXUDWbSVgW5h+616jBV6WfPfnj+Q
	fSM2GgqhzzwxmMhXHj8CNlN2bHS1lFq+CXZJjNPoDr2wv8CS0FS+Vzxl46+Lou3j5SbePxQIp66
	GJxAuJtOncn7kDu9zM7lw0PbjZcgMapynjfup8GVhKrzg5CWyhfpz1/ADm3tTd/oMgsEwr7tp34
	vMXS43t5fGq7fdCfKxghvhP8ZZ8+4CAH3kGr77PTU5Ml/9Qr52IfqurzawlCHXwFKlEOilMwywM
	8UQ9X2cQPeWwwzdywEmkqedF2948MFIsuv1I2gMDd9p93p7412HN/Yk4NWkVqT3kZhLsnawIcf+
	K6blY0AftMSjsKvqFEN8xXQV+xYTF7y68iKug9pqdMACIJZQxQse7FlRW+7LHmoz3/I0yDtc1O1
	AKQhoouCynbXqVvXjOwKJufv0/SSpBbmK4QnAtMwC8NdrZf6z5SvOhyV6uw2fJ0S3v
X-Received: by 2002:a05:600c:1d10:b0:495:5e3d:15e1 with SMTP id 5b1f17b1804b1-49573cd4133mr98180085e9.16.1784918733697;
        Fri, 24 Jul 2026 11:45:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4858e85sm11278335e9.1.2026.07.24.11.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:45:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/3] airoha: an7581: USB support
Date: Fri, 24 Jul 2026 20:45:19 +0200
Message-ID: <20260724184523.193661-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_114536_366760_F5778F91 
X-CRM114-Status: GOOD (  19.07  )
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

Changes v11:
- Remove clk patch and move to dedicated series

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

Christian Marangi (3):
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 665 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.53.0


