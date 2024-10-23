Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5C3CFA450
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=al+2wR40GSQZ0z2UvHLWXNJ+e2sWW9EXks4CEP4E8l4=; b=rFvYx1goPmhheps/xONalht1tF
	GYT6+ibEP0/cM7v3kcbLvtzKuN5kXzm3n8Z3JFgI41pJoA/rSVSnDs+x4DjN3rUp7qet1KjisjuoK
	sahIKLWqUltRMyEy9AYyjQ9Oc1pu0oTEgo9kDxRWZ/6pzKClKmELCI2+KcokDXWwWBsCve2dOmSEi
	PH4fBl6vsitWW6Gvmas6K/75KqBlPLNPDhHKaoloo1KUt7NgRf48/n2biM4ddkYjqtNc2iMziEU6q
	q9TqgBCrbJ1uxvsEEI7sx8AFZ8B3+9Wi77YdAJtdg2Gb8/UNa2OVuzb3qoF7e2d9nfrovs1Lt9H6F
	YdBJHVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ego-0000000FFfQ-21hi;
	Wed, 23 Oct 2024 16:58:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e6B-0000000F75a-3wJh;
	Wed, 23 Oct 2024 16:20:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d3ecad390so803851f8f.1;
        Wed, 23 Oct 2024 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700438; x=1730305238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=al+2wR40GSQZ0z2UvHLWXNJ+e2sWW9EXks4CEP4E8l4=;
        b=dgqKu8oMk3sSHiEYR2ZROhyQNjaXh287iIrIS5tfJRbpnTt4plP8GqlISNVeCvshrV
         YDbFnFCzGyY7+wVa+fXioUYC9qH9epbf09a7WiTGFw5IuK6jd02a7U1/XhP/boYw6GJZ
         /7I1z35W/mWqw7nnasmT8m2qo78Aga8IMtv+6rNqqD0uVWT1l/38cM93OdOF5dxcdjpR
         NgeejYyaGeYNrdN7A9duim342fOB3QQ/OPSBU6/3baO00JxhADiI3k3n/efG11NoQF0T
         mOTemoosvEy2tzgceRKC3zHzm6oOaFGxezWZUsxQHDkIXIpCOHFL0Wn3LzPHzI/inc8k
         5smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700438; x=1730305238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=al+2wR40GSQZ0z2UvHLWXNJ+e2sWW9EXks4CEP4E8l4=;
        b=EIRczdF1DMXauLV7Ro4SnMdHk/ohRX/Z0IQleXN2pq2rO22YgnMlCA0aUjOrht3A7G
         DAoVcV7cPejfSHBi7Ng5Mp1+fy4Tyg+ruYuEO2h+hN9ON6HF4f+/tLSQ8cwpqNRIKpTa
         qvngUpVCES3UII8EOWzatHU8/zx9ijnFyc+loBVQhiUpR5Xg43SRZB3WHucvdqW2Gmar
         L7uoS9OzGI1M38W8l4YHeSPEdkXz9nKOekAZM6rcAF3+asjb6IaO9NVJ5NIcCtZH05Tw
         Vwew82P1R24gyfMFUhGhrzW3LhSyDXkLO6zYFs0c6VZoup9V8DUosh8SSUjWCgH+lrim
         N/ow==
X-Forwarded-Encrypted: i=1; AJvYcCUEGIweWpL2P/ZKae8s+5HGFt5o3bNSgbFcAy2zZfKY5e553UGNzKaAQTawgpDUjeT/yO7o1JPD0CeARGfXHbw=@lists.infradead.org, AJvYcCVqVrBbv7GDpBjAzQWAcFww2g2KrrqdrvJzwzVZQ3yWiKxeWSGTAtOSeki9OrqnCaEa4Yq0tpo9Tv2aCzKGhFk6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1jZIfqDJGynk82g7XIikjQR0ldwGMt5ttZtAvALQy4YEzXuMe
	iTQXOhs3NApwQVOIIXKw9wlMZu/sjDLvuR9/gqSe/OqTsPNZ2rkN
X-Google-Smtp-Source: AGHT+IG1nMIvDQljj4Ctf6uXPxTVi3CrEWeOFLdBbIt5ACR/HyKAd4kiAjrt/Xyf+AiGFHmrzTEYew==
X-Received: by 2002:a05:6000:c84:b0:37c:fdc8:77ab with SMTP id ffacd0b85a97d-37ef1271e7emr5019941f8f.7.1729700437396;
        Wed, 23 Oct 2024 09:20:37 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0ba7dffsm9249993f8f.116.2024.10.23.09.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:20:37 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [net-next RFC PATCH v2 0/3] net: dsa: Add Airoha AN8855 support
Date: Wed, 23 Oct 2024 18:19:49 +0200
Message-ID: <20241023161958.12056-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_092040_003612_726A88F2 
X-CRM114-Status: GOOD (  15.94  )
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

 .../bindings/net/dsa/airoha,an8855.yaml       |  253 +++
 MAINTAINERS                                   |   11 +
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/an8855.c                      | 2012 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  498 ++++
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  265 +++
 9 files changed, 3055 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/phy/air_an8855.c

-- 
2.45.2


