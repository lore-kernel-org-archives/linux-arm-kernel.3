Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B81C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rym+87Q6pp8Q6AfXc414r5kgP+DO4WPCOFxK7p7VbcA=; b=G/Uj7I75kgOHr2QySqb/gX46fC
	2cc9F2SyjNU5zXLwcNrcX1zPDUhyyGYKZtHyCKZ6ybdH//SqE/M1Uh8wx3x0d84b/8JjsWnKVkZk+
	W9SlFw0jR2QA1BsZsOiI11m5L8LOkWwHfSjpb8mBPYlv4elwQiMEw8edMSQ1QbVi7lwalwf0t446x
	bf345IZDYm9t9gXbUUr1YrHmzHZ6pLRueLbWLCoVwq9uJ5D8BBmpEFBN7lDOwtvp4WtQDBnyI1Ro6
	mt2P1KfAyrHoVxeGIj5QQNLHLqbhr7hMP7glzAMDKoU2JCA/F35sH1Ryp4IR4kzHZhMK6f22feryH
	EJZtRP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXK-00000006O6s-0Mdr;
	Fri, 03 Jul 2026 08:46:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXG-00000006O4F-3qsL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so2099315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068367; x=1783673167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rym+87Q6pp8Q6AfXc414r5kgP+DO4WPCOFxK7p7VbcA=;
        b=N92cw1pyyoHMXeww8cIqMnDTM5pOrKiQCzcG6sQeXJHuFiAh/i79a95KA0Hd3l/4N9
         UI42XDQFkW61EESzSM0397PzIzwqJyJRlwEKCh6VJn440utGoZYQxzRcXBqKKadnnBoB
         Igrp55t/eYiGP0x8EfQwDXipUG3x9AiiprEXyRLhUwjxW2z8t3uNcRhVJwc1nTY+wD29
         /Ai7iEJ5/8zn5aH5woTt1R2uT77qKTJRAmY2bRCLqeNCGs0rKB0RuQMu4yCOElSJ1VHA
         c7cK4iqT+J/nzk9BxbMtT4+XeTOkq1dfAFeSolVoK5/y+YghWBvXNmW/AsLlhW4Ufl0d
         Ad9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068367; x=1783673167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rym+87Q6pp8Q6AfXc414r5kgP+DO4WPCOFxK7p7VbcA=;
        b=UJ9JJOiYVbOBIcpfVdhTPNzpd5USKnW6aD2dXD/wOfxCloimQD+kf+7xn6Mv1dsP4H
         s99TDLGTp2m2bn5WKp6ZxPDLGWofPFrtRwOFWisj5bmzyXRMvzBnmDyw462UHq/Fb+0M
         wCMdsKXFo/cgBoSa4mRAHjMjEblUv0+fFabbwrTk4gN+Zb00o6gWL9b1aEovjk+8kXTq
         ur3/cdnaNpqAwEyqW0sbX3ODfYGSja4XDNpCyiB1wH/QepEyI+yqlUeN+iajTggO2pr/
         zis7Bcnrxk3DYmm5p87GUL8Npa+SErMf4s2zbFGrGiMd3OepwuNwA65FG/teaGYSJavW
         lScA==
X-Forwarded-Encrypted: i=1; AFNElJ8fJMy0EsB764X2ZAFG0zC7vs4ihAsa7/OlaNRqkPknrg9sJa4e9A/jcPRuTKVYFmG3roH+91QHgE41yoHyfmrF@lists.infradead.org
X-Gm-Message-State: AOJu0YytgNdbkEeyOJsobWBxO/J+60QDB42fbCdJl0zXasMwBzjTv+MK
	t8dhcIAVA5GhAxsgTTLUWJZcBx586eBlY9Qzm+Mh1gntsWE14OKJoKG4
X-Gm-Gg: AfdE7cnwfCTe0elZ8GPC7Pvz7w/TrR4hnrDEzfcIavnbDJvIa2tCSmLMuOieWK5AyLp
	DvKnSjc90AySx7d1HxueV3BCAm/v0sYqoxFtMjx3XYT1IXKKvVnH4GBdCK99zSPIeK04LibvCas
	+r3uIlL1QIttX8PHEO6oNiMoOfkjRGLnsUcZhMZWIvcXg0Ugr3RgMdrjnVNKWhwXzUTcG0ZisAJ
	wi+4v0MN6I8nNVq45ieLn0j4L8xtt7PQJ6ya3lWKV6osyErUKfWQE0uB8Ny6a3zPZLF4C8ifKhs
	qFQry1prTn/wVGo1B8KJedSP1BPQTHPLLXQ+4+k1Sn5eTjTFlVF015mP6evA8UWqUDX61nLhSE7
	IgeZquLDSAmZbJ8u0bvWMtEP9rPUFLiXTDyGKlC2cpsSxuvtSEy/wOU55pCyWgFpVw0GDOGKPB3
	O+3hGkMnYfxfk1wsDByCmO8HxJ+GqmYcn6/g9rU5Mf4se8Y9lxeHUzjmghW1Hy0ainZC47UmZwY
	dROMIMOJLyv3iZL8Uw818Dovg==
X-Received: by 2002:a05:600c:34d6:b0:493:c6ed:a044 with SMTP id 5b1f17b1804b1-493c6eda218mr71854355e9.34.1783068366968;
        Fri, 03 Jul 2026 01:46:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:06 -0700 (PDT)
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
Subject: [PATCH v1 00/15] arm64: dts: freescale: imx8mn-var-som: Align SOM and Symphony DTSs
Date: Fri,  3 Jul 2026 10:45:47 +0200
Message-ID: <cover.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014610_997819_138E1911 
X-CRM114-Status: GOOD (  12.03  )
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

Stefano Radaelli (15):
  arm64: dts: freescale: imx8mn-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: move SD card support to
    Symphony
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
 .../imx8mn-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mn-var-som-symphony.dts | 162 +++++++-
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 364 ++++++++++--------
 6 files changed, 446 insertions(+), 157 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3


