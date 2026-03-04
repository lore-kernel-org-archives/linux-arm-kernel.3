Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A1AEDEBFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ogMkUraTjety9MOgCpxzZj4mdAQTkI2/0DG477NiJI=; b=kQrgRWXnLdH7f6mdxujfew1VAD
	xrWyaaeU6/nQPdxU8aktJHeOKdhoVu+uMA/MZfRKw1VDlW0e2VY0UNWPhfPRH5dBQTnfRo6VVFcWG
	gEUCbMtzEKDMKrJKfQq2OfcbeKqQ13jp4ipcBxNqqvW2A/woMK3xuPa2QHhj/TvGWQbAk9mZ/g32e
	H7ZK/1V/ne3j2BNeBkMLa16A7kqfrigc4+jReEUg3Z+hQWo2J3A4lnMYRYTmZwL7+SzU5n+H6GGxa
	LkVWFLFVoiPxI+6BZ7lNjS2/HOn4iR/1v+PD3bVSP9HQn0zU8G5ULbqtcMu+AT3Qe7GZVK8v1Hyl4
	p8anqWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaZw-0000000GCQ1-3vG7;
	Wed, 04 Mar 2026 00:59:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaZv-0000000GCOm-13V3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 00:59:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48372efa020so55076275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 16:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772585945; x=1773190745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ogMkUraTjety9MOgCpxzZj4mdAQTkI2/0DG477NiJI=;
        b=KBYnauqn6wWpe4MEkRSA03rVcgnEltQGZUjWirDejV+I5kH7Ebl7zRHMQEW+q7N321
         LjqkGBPNviiMpaq16kMOMrtAX20Ncj2CXxjkq+e3CZJ65Mw0ZwW26ZACAb+++N4IsHR9
         aKPa4hSl/HD3RERoZbJs+6cS9yOnCzgCA2G3eteU70jR1D0V+iEIGiT8QSgQm3UOQJpx
         ag6aArx7Sqsaip21wZjBjLIZfXLhPu4O3VTY93qUpdxTEPQQiS1AIDVJRIZU7253IbQJ
         dWv3NAIzZx9cj+uv/vJmAMbXDolza+/QEuXoQMw6YpcLoCvdcHt4neiScfS4OED/kMfx
         Y28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772585945; x=1773190745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ogMkUraTjety9MOgCpxzZj4mdAQTkI2/0DG477NiJI=;
        b=HNi38gU/3YcNg755/2ThdbV4KMChbKl8hrPhZpnCoQbDJSMfeEhd57RhyVhdFIfFr/
         UOYO3jwBQsSi7JcH7o9dam5+ApuIb02r0BQTncXXMJ5EeKUFiK4IHmQOhECUzmIQ+3Od
         wfjMcGdPNlSq/R9sVSJGs0R5sBIpGJwkpOA+ipUBDr8fpWxhkcbQ9DwaxO4R9T3DXuv7
         EjF1t1ND0+EkwKI6V79xM3l9c9MZsOTMxBs7ue6R157ozhu+VpyQCvw0Mkd7KsdLFtt+
         kqFX5FdGPQJ5tspxOCqNt3gtyhoZjRWGuib4ufqG2gmJRkfTqi/v1lRGvNyqp4ccv8om
         qcLw==
X-Forwarded-Encrypted: i=1; AJvYcCUNB9u7F8RkYdyDc6m36AhsRJWJe+ERk2yTFfyHMUxylx93bVJGMoyaC9x3I45m/atCx9zvzLDhiHU2B35IVBGC@lists.infradead.org
X-Gm-Message-State: AOJu0YykGox+k84tnxtLVb2htu3kK7eM82+khHmmphspjclqXOz4Z03F
	T3vV++6oM2b1U/kLRsDJYKq6R3QOwR/r00nYJQ0MFWs44As3RURsUGDv
X-Gm-Gg: ATEYQzyBzmg6pWj+OXO8sGfWRwRjqV+4LlcT4Ga7xOOl4tyTPIgziC9bs8+22FoqFuI
	XFTLDUw2inB2+DngV4r9oH+53wdx+j0TT+DQprQhHaI6wNEb1EAzGYDI8UBiLmwBdtXkW4OlXIk
	qbZu6Hki5er1SoGckFtQMWGR4pk4jiwfJSNKkfzmfw7tM5D0AeYLtzLdEAfNEw7dFOCbu63w8qN
	PI6xC7Cr7xMyFIZLuo5CEzAHLu5VlRy+MNHe8edMG63SmS8+VlMQ3hUxidmo5ZPysOj4fXigu7w
	tIsFVqjE5DPBggj9tEo0QupR0XGJ7m51DumqQUKTtV4D0Qq0YTc7H9Fm9B8LTjJC+QIaC6jaSTj
	QWb//tlbh6ILRoZ5Hsc4MtXQYlLfSVWXLDbId+w9KKReuJEiTlCH/BG3kCLOTTOG7Y+QKqkO7xR
	pLqwpOnSkVlX1kzFdwei8ko6wNLup8lZvYSvUWPBTMylaBk3YspH5hp30=
X-Received: by 2002:a05:600c:a08c:b0:483:885:f0b0 with SMTP id 5b1f17b1804b1-485198bac26mr3235315e9.35.1772585945092;
        Tue, 03 Mar 2026 16:59:05 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851880724esm26927575e9.9.2026.03.03.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 16:59:03 -0800 (PST)
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
Subject: [PATCH v5 0/4] airoha: an7581: USB support
Date: Wed,  4 Mar 2026 01:58:32 +0100
Message-ID: <20260304005843.2680-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_165907_329668_EEED9A60 
X-CRM114-Status: GOOD (  16.99  )
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

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver

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

Christian Marangi (4):
  dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |   71 +
 MAINTAINERS                                   |   11 +-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    4 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    4 +
 drivers/phy/airoha/phy-an7581-pcie-regs.h     |  494 +++++++
 drivers/phy/airoha/phy-an7581-pcie.c          | 1290 +++++++++++++++++
 drivers/phy/airoha/phy-an7581-usb.c           |  640 ++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |   11 +
 10 files changed, 2545 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie.c
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.51.0


