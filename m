Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCEAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hi3SZ++kAacHg+EPWvcKqDFoMdY5BW+h9pJVrkd2Sc8=; b=WFPoEVrL7UFuGAx05rQMTDihz9
	EDexy74TgHCLIxvB+1Um6C2aD6ved78RxABom3qVhKO+hPI4gMNpMS7HymUoB1uEyUzPblms6ZApc
	h9KNHXmwGDTf63IfZxsl8Vd3CeWmYx5BtvVYbpTVo0uqfdyrfQLw6rp6ufdGio0yuo0avoB6WFQMq
	8wb73wXVXDCGqLtDyY5RwpDzAtYbzNsoAnT5/2RMe6ojbjWzS9kyNlrEVwJtTueI3v7PJ0KKMzn+y
	pPZIehms/4TziHffKkUKlq24Cnife1NRya+hqP6IcJfMNRCa+GDdUJW2UzcD9EwTh19kyxDw+qZcR
	5gWKT3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj5-0000000C365-2XfG;
	Mon, 06 Jul 2026 09:34:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj3-0000000C33e-0kio
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so20132315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330491; x=1783935291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi3SZ++kAacHg+EPWvcKqDFoMdY5BW+h9pJVrkd2Sc8=;
        b=VjXaF5x5YF5YrpKcxHv2Xjx7qQvv+eMjCeUnOnADzjbfVYNhJticILr6hcE9+cWv5z
         FSB1iI13Yt7FaqX9b03w5XAI51Ywmk9xYkYJy0NrB6hw7AcYwlFPQB6JToheDLhZBXa6
         RpM+iNimKru8y4iqrgDFy6EzoagHgInrjalxYPcfnPGL0WmYwSeCiD9HaGdGd9v3QJ/P
         BgzY5Nwzla6DLm1SnOMpcYdOY3KL2NjTU35escp/9ne3RWY6mJ0bptbNC/lVLgLUSRdv
         /eWYtwiE1ShlFdnrjSSjgWXb+hjBC4LFiaOzvZrBxNngufMTf5RkORjLp3OR4wqugtJD
         kl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330491; x=1783935291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi3SZ++kAacHg+EPWvcKqDFoMdY5BW+h9pJVrkd2Sc8=;
        b=pPkzWXLdUxnx1J0FmtYe0wcDjG5Mse5QKknpyNi9MqCxL85uKHqio+iv8/Rl0SZjQT
         FVDR5L+nEhMdOJHS7RJkAvqaFm4MvAaucwXpcAO3bkzqsToKNWYic3CAttwoeCfWhAzl
         iqIXpQaChpyyOjTNkE0JaTnjZ7+mzbTgumdqlFR/Wm7+n64zWc8KZfq9/lRdxKhjKLPp
         MiXAXiQct3ltUn1Wsh1oMJIGblCqYTcv9Bo9qyxxTZg0uwN8OcCIXRZ1bYx6/bE5nDRW
         FxodvGWEJta0YZ6HIa48Wjc7mWibElvtyAZTd+kywqPUG9blJL9oacNuK7Ugigdy2BYF
         W6gg==
X-Forwarded-Encrypted: i=1; AHgh+RqKdcnS6/hj8u2rFGgrEAskWMCYirbPbEJeCzuHkKGfdUcWxlPFDNym/h5F6uE0QPC7wIloSevDarDx7tkPT0GU@lists.infradead.org
X-Gm-Message-State: AOJu0YybuI6M/WNbR1ViU5iP3WytmgxbcTBS09kZK3PT81GiGxrsMwPz
	ieWa0UCX9AiBHvXn1nwaR+Ngh34fCZJW9KgNt2eUD6PTZASJtE/rdF2h
X-Gm-Gg: AfdE7clGa7lZtLRC5sJTldr7WneYSzB0B6HmIC4W+IqqjaPQbdRRv3l76QJ2UmR5cce
	TsdjYqanUNKtTUgV72SP4K5beiD96plqNNuE+IPeDABxSU0Xl2haDj4f5PwHsWSREDCwCqDnkEG
	4TAmTi6aQe9zguj8JlVLQAZJ+aQLwTvjWBlRHEax60CsMbCLmZxY/5LtZ31bl72wboq4oO8An0p
	rp/9muarFUUHkinmXt79BmxulwNvIcUK8xmRwlSMLwKSWJyjwDLbjIcbNciDZEnN94eLR/sjoIW
	E9IsMPcQbGdWfhZ0SwYwVOO1s/zfmuSXq+GkBwkGBcDfSLoB06bfRMQ+MK150lppQImEpk6rLzT
	JF90OEtVPlzNpgSENieEc07j6eT7gZOsRZYfc/gupBL1n8JeAjBuMdf4MID6loE5QfO29WZhtaR
	ZZF+PUTLnl4wgRuMUYrUvXsyiUVE9kYm1ys7xOXZL55jW4c6776bBobD3iiOHRnQneKl/1J/zf3
	birBUBFWrnAc5MmX5x1kzMbKw==
X-Received: by 2002:a05:600c:820d:b0:493:a573:179b with SMTP id 5b1f17b1804b1-493d11f5b70mr109796225e9.30.1783330490591;
        Mon, 06 Jul 2026 02:34:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 00/15] arm64: dts: freescale: imx8mn-var-som: Align SOM and Symphony DTSs
Date: Mon,  6 Jul 2026 11:34:30 +0200
Message-ID: <cover.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023453_246337_6E0E7965 
X-CRM114-Status: GOOD (  13.54  )
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

This series aligns the i.MX8MN VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

As the i.MX8MN device tree hierarchy closely mirrors the i.MX8MM one,
this series applies the same alignment already accepted for the i.MX8MM
platform, ensuring a consistent hardware description across both
families.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

v1->v2:
 - Update all the carrier boards and not only the symphony
 - Fixed commit message for eth
 - Fixed I3C to I2C3 in codec commit message

Stefano Radaelli (15):
  arm64: dts: freescale: imx8mn-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier
    boards
  arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mn-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy
    dts
  arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
  arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
  arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mn-var-som-symphony: Enable I2C4
  arm64: dts: imx8mn-var-som-symphony: add wakeup sources
  arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mn-var-som-symphony: enable PWM1
  arm64: dts: imx8mn-var-som-symphony: Disable internal RTC

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mn-rve-gateway.dts |  48 ++-
 .../imx8mn-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mn-var-som-symphony.dts | 162 +++++++-
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      |  19 +
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         |  46 +++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 366 ++++++++++--------
 7 files changed, 500 insertions(+), 161 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3


