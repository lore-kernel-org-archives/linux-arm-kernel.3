Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F62D68BDC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tzKsLoqS+f2oaO0q+njlCY4YyzBcsusLXBar5P2xdBk=; b=Fc3ifHz7VymiF1gnp/g+gNYEh4
	LtOrNlBvw/1wQ7fjN4B05W6iFegFdavVg5p+3N7oHV3PoQCweTVOroHx+VA9tsZV2EAWoMpcOGQeA
	fo+45fps/Aig6mAEwszUXAwh6zakURiwzdMNANXklxQPErAMJxe9V322wq95zszh82CSUjj2GsDmY
	68pSEVSvs8LAnxWh/H5vYVaQWCnf7lwm3/2QOFXztOP4DPmTvgqKQTQfjLAcM7VDutuT6z/fQr5Qx
	WoowE6o3IMMxvepxvktkMm2JfbGLSWjbCy0A8/fULoWd9/X8wQcsPHGrJaLGMH6jHWU8f28TsDZQi
	brn+jgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCIdC-00000005d3o-2uTK;
	Sat, 16 Nov 2024 13:14:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCIcG-00000005cpg-2Wwk;
	Sat, 16 Nov 2024 13:13:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so13548555e9.2;
        Sat, 16 Nov 2024 05:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731762811; x=1732367611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzKsLoqS+f2oaO0q+njlCY4YyzBcsusLXBar5P2xdBk=;
        b=EWBSK5mgaykQr+Tgf1pX7d1Md4kqB4q6lPFUVAKxB+Uea00yPBg/T7bvulippEcPx0
         WUFn3VcZVVt3tttXoGB1Zdo7HvCnjv2jAsFtUD4Bsvnx8aMCKhh8YP1E7mfyUZ6OMfmI
         ozeYc4bQfV+u9NtNQI7jAMEP5zunsaRj6Lo7cTJceHCFtuE6Rw43+WrSfd3+Ch/+tRph
         MACTPJdNN9PLGN8rtY6AY+wHomXiAhIUFM0sGVEe9BbLJL5EmOmydjjuprYm5xW9w/xx
         BuC+xZRbJRf0jG4bGxCy9DUXyuHRpVJT3VWn5uCgCNZJvkMEOkiU5LSKCkJ7bluTofFc
         IOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731762811; x=1732367611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzKsLoqS+f2oaO0q+njlCY4YyzBcsusLXBar5P2xdBk=;
        b=vXOmyAWnSYNlbo2asbPLGJ4rM+IgR4RWEYpmS4QM4PukME3NFOnWZOInLfiKl/77nU
         vqy7tfhp6fsaew/bVsrvnfRwd5br84mY/NMtG3COa/5Bf5tQOVB3xh/uVfiaier1Mtm0
         nYmbjcWaA+AzhhXgA2ZisseJkZa9sOlWG5GVemC4glWwFdfbfWFT93skwEJi8wdsh6AS
         DkeMAi75MMpcI4SH2iNDnJPL+n0t9D7dZBn/VPJr1YWTlL2hmE7oBPgRkWw0R+zvOwQX
         dSCaBuw+zldmjLlZ5S5YYki6WDq/DhAisD4tlwQFEuVZ0igj23hXFjERIrYnGQhjkaum
         ua9g==
X-Forwarded-Encrypted: i=1; AJvYcCUHeMxkbXgCbX5spTnDm9duzf0E+akWz+gqahS6KVFljh9dFo9KLZQicLD0rczxI0fKvuDgue2YpIdZrm+pv7o=@lists.infradead.org, AJvYcCWgxVi//oeh8WOBb8ZfMso29XwisuTcjKtPZHLCEQpSw7pXjsLkGkPG2yKs7o4c3khdfZtuEWrnUkZ14lbEd9gI@lists.infradead.org
X-Gm-Message-State: AOJu0YwFEAoGq+pP0K1lNwZRraATb1F8r1b2+IHLbLu/b6f80yQrWk4a
	QIs6pNkaBrLhPth5Ih0pPHFXP2V2Bm9FMlwHQBBS8RKrKmaw7Q25
X-Google-Smtp-Source: AGHT+IHKgxdnXc6kEl2B/inj2A/5CrmhjcYAgt6JHY3c9dX4n4YbiGY6Z4z8dNL6tW3Mt9/w9f8u3Q==
X-Received: by 2002:a05:600c:4452:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-432df7178e0mr56576705e9.2.1731762810605;
        Sat, 16 Nov 2024 05:13:30 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432dab7206csm87459595e9.7.2024.11.16.05.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 05:13:30 -0800 (PST)
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
Subject: [net-next PATCH v6 0/4] net: dsa: Add Airoha AN8855 support
Date: Sat, 16 Nov 2024 14:12:45 +0100
Message-ID: <20241116131257.51249-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_051332_640937_CECE561F 
X-CRM114-Status: GOOD (  16.78  )
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

Changes v6:
- Drop standard MIB and handle with ethtool OPs (as requested by Jakub)
- Cosmetic: use bool instead of 0 or 1
Changes v5:
- Add devm_dsa_register_switch() patch
- Add Reviewed-by tag for DT patch
Changes v4:
- Set regmap readable_table static (mute compilation warning)
- Add support for port_bridge flags (LEARNING, FLOOD)
- Reset fdb struct in fdb_dump
- Drop support_asym_pause in port_enable
- Add define for get_phy_flags
- Fix bug for port not inititially part of a bridge
  (in an8855_setup the port matrix was always cleared but
   the CPU port was never initially added)
- Disable learning and flood for user port by default
- Set CPU port to flood and learning by default
- Correctly AND force duplex and flow control in an8855_phylink_mac_link_up
- Drop RGMII from pcs_config
- Check ret in "Disable AN if not in autoneg"
- Use devm_mutex_init
- Fix typo for AN8855_PORT_CHECK_MODE
- Better define AN8855_STP_LISTENING = AN8855_STP_BLOCKING
- Fix typo in AN8855_PHY_EN_DOWN_SHIFT
- Use paged helper for PHY
- Skip calibration in config_init if priv not defined
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

Christian Marangi (4):
  net: dsa: add devm_dsa_register_switch()
  dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
  net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
  net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

 .../bindings/net/dsa/airoha,an8855.yaml       |  242 ++
 MAINTAINERS                                   |   11 +
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/an8855.c                      | 2233 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  694 +++++
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  268 ++
 include/net/dsa.h                             |    1 +
 net/dsa/dsa.c                                 |   19 +
 11 files changed, 3484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/phy/air_an8855.c

-- 
2.45.2


