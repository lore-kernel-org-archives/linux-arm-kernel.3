Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD50D44D58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H1F91WGa9+I9fHpXcJYoUWlRD8y/v/h1KCQbgaxUpGM=; b=TjU+pkPbhYUWfe22+kOfVZsOcT
	KPEqgFRSf9kJ7+ZVLTUs5gzWPbhiquSKwQTa8lhNTdw1abEGYJEWdYa2Z3bgJiLyGvcDSLXg4fehD
	GZ4M0PwuuU9a63NylNoMjD7nGLxZ3LKeZINl0u+/pBvO7BBsTARz9aw1dcivbjwppbjYCMx/U2EqE
	xzXayZeYAdcJIDU0t2ZIUAIQU8HvGlRujhIeNCXj/RJUL/xSk2huWFNvAOt5AGjpEevrAmFWLeT6i
	6pmFPU9D5JBUgSbaDqYzb5vu6hufkYPmli2HOgNLBg66CCtq6JidhWqN7vbu35jcEy6gGJ1WD3klB
	tszpRj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fuA-00000003NPZ-32HD;
	Wed, 06 Nov 2024 13:17:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f4E-00000003Aaw-1kNe;
	Wed, 06 Nov 2024 12:23:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-431695fa98bso51948385e9.3;
        Wed, 06 Nov 2024 04:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730895800; x=1731500600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H1F91WGa9+I9fHpXcJYoUWlRD8y/v/h1KCQbgaxUpGM=;
        b=hxNnSXkpZgL8PyK0ELnSK01JUdyDElY/Pw+OyDoD/1MpQvRamjOl+X0psB7dQCi2ml
         9lRmt/G2IKizg/heuO0ga21ocXPDHEtN7KmwdFWZM43pAfq52FsKNr/oew8OAAzB+IWH
         /31HRScp2pTYdpqoJrJAlsfA1+56kLm6tdcquiPV7EaDylFxjxQZjvEWrFruN95bjJRW
         H0yhUgeERcQLeRnOvvXTmOzdxT0ifrZ+EmqaUTF0Z9Q5oNLvdKFb8uL4r9J0ezGLNydk
         ifef8GXw0KmaFbWE8zo8ir5t9HawrMkPnFhG9c0qLuWWdSJILbvPaqYOC3mBx0E2IXB3
         zcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730895800; x=1731500600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1F91WGa9+I9fHpXcJYoUWlRD8y/v/h1KCQbgaxUpGM=;
        b=NP6iWCv39bO9OWUdUZdT8pPZje3DF8w2FqKydxidbGVRSIBkt1ISja1+/6IODkXUUX
         xSJINC2Cr3J7B5bEYY98VMpA8Lq1dfnrEryjY9kxkOFntBmAT9U/F46elSX1iv54h2vH
         kjqAxV7sbUmmCNWXbql6WxkO086/lWI/JU/LK8aMRjNRzovuAcuf2GeR4wuHF3iRgdN8
         cPYICI8dZR4Dqg5qdfM4f1lROoX0YOruFV6YgLDXIFzQbiur7CPIaACBbusyXc68UpvJ
         Mye/nINR6goODGOQpTzCW9yD5AjTp9EMVe/ZZw+09jT3jiQQ5vj36tOIPH98j9MGhWXU
         e6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUI4GEBosNLkLh2hStHBOiG4rsh0F1wufuCQqtgKBisa9LJfRHEQwb/Eo1vG4OHX6ItbTykb28B0UFP2/D/NDM=@lists.infradead.org, AJvYcCWOUFIz75knLF8JiX4/DMU7n6q96fMVadhXdQRFmhdDPVIl+LCwPOgeDt4c8XjslILbLYJeiOqB3n8X94IXZyR0@lists.infradead.org
X-Gm-Message-State: AOJu0YzExI0MXU/UEpWpIHtVztBGJPSUEsijfmyEBZRNbDyW7+HgHY4Q
	c1ejRrswcm5fZwdXB5v6WTDBbW2eBXZzAyEpk3MgHMyRmlS6/nEX
X-Google-Smtp-Source: AGHT+IEQCzJ5QE8i1Xfs6SZTe0txHNN+sh4GUYLcK4uaLpJ8ryEtLEeBD0TltM8MTz5+8QJpHbWqBQ==
X-Received: by 2002:a05:600c:4f4a:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-4319ac6fb17mr375692945e9.3.1730895799843;
        Wed, 06 Nov 2024 04:23:19 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432aa6b60e9sm20444155e9.14.2024.11.06.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:23:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v3 0/3] net: dsa: Add Airoha AN8855 support
Date: Wed,  6 Nov 2024 13:22:35 +0100
Message-ID: <20241106122254.13228-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_042322_479365_73B2B354 
X-CRM114-Status: GOOD (  17.78  )
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

This small series add the initial support for the Airoha AN8855 Switch.

It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.

This is starting to get in the wild and there are already some router
having this switch chip.

It's conceptually similar to mediatek switch but register and bits
are different. And there is that massive Hell that is the PCS
configuration.
Saddly for that part we have absolutely NO documentation currently.

There is this special thing where PHY needs to be calibrated with values
from the switch efuse. (the thing have a whole cpu timer and MCU)

Some cleanup API are used and one extra patch for mdio_mutex_nested is
introduced. As suggested some time ago, the use of such API is limited
to scoped variants and not the guard ones.

Posting as RFC as I expect in later version to add additional feature
but this is already working and upstream-ready. So this is really to
have a review of the very basic features and if I missed anything in
recent implementation of DSA.

Changes v3:
- Out of RFC
- Switch PHY code to select_page API
- Better describe masks and bits in PHY driver for ADC register
- Drop raw values and use define for mii read/write
- Switch to absolute PHY address
- Replace raw values with mask and bits for pcs_config
- Fix typo for ext-surge property name
- Drop support for relocating Switch base PHY address on the bus
Changes v2:
- Drop mutex guard patch
- Drop guard usage in DSA driver
- Use __mdiobus_write/read
- Check return condition and return errors for mii read/write
- Fix wrong logic for EEE
- Fix link_down (don't force link down with autoneg)
- Fix forcing speed on sgmii autoneg
- Better document link speed for sgmii reg
- Use standard define for sgmii reg
- Imlement nvmem support to expose switch EFUSE
- Rework PHY calibration with the use of NVMEM producer/consumer
- Update DT with new NVMEM property
- Move aneg validation for 2500-basex in pcs_config
- Move r50Ohm table and function to PHY driver

Christian Marangi (3):
  dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
  net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
  net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

 .../bindings/net/dsa/airoha,an8855.yaml       |  242 ++
 MAINTAINERS                                   |   11 +
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/an8855.c                      | 2054 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  628 +++++
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  278 +++
 9 files changed, 3229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/phy/air_an8855.c

-- 
2.45.2


