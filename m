Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3FDC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 02:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+1ymEvJrHT6jMKxrOcndPKlvHyWzoiSIEsONq571lkk=; b=jZYpJtaaPe8YbS
	dTW7KNwV4pHSyYG9KO1JMLFvDYiEtddGon7sN7zco2ZPQOrGoM23WpA1tcptQ7xwEEO0AIAo0enJg
	0BuMMQROI1zTiCHi7+NIXpbfdMjkWCCsi9/IMYGEvrdBQ9W2BN5MP1bGHkaaj8Y9Yk0UiOhFPjI+x
	hM0WThggcKgAl4/EBTr+uCg0RRrPjRvcVodRQYpu3DQSgG5+8/FLNK1+kVaBF1+chaizK1n5egNEy
	3prt3Q4sZe18XKQY5X/VVyFJqYIGJ36jMXrs75mZCwlmpNOrKRKVJMNoWzeD//XHrrqqx7tL9l7Py
	6MFFCej68Jci/Q+3KN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMu-000000037Kb-0diS;
	Wed, 05 Aug 2026 02:28:32 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMr-000000037Im-2LMy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 02:28:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7ebd88be784so359844a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896908; x=1786501708; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+1ymEvJrHT6jMKxrOcndPKlvHyWzoiSIEsONq571lkk=;
        b=KnRxfNbjcDJ3ob2N6GoV54vWZ0g/1BhxSe/Y3pcUztIgNSn/dIeuv+qaKqjQGK3gME
         Vv+IFymB++3Ia9ZwCrVTIc4EWefWUo5Lu2qJXr9B0S2Q5xdZfXaN+yDzdipW6NmBL9f8
         KjeWhaPShu/NRuv6hNtsYClFqM3FrbFZfPyKKShCINWRwV9GDmQDo3cO2VZijxuvB1kb
         5pyCqxUKTLLp/7zF/cL9NSYpDyclR7X0Ktj6eedK7lVhVoDRX34HU9SNb9Ju96QwD3Ts
         V5LhHwX0spXiN4iXhSzqKw8kKo468/RMD7S/imeEEGKnY3nnkMTaBgWKxZ67mkq5cGC0
         Ospg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896908; x=1786501708;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+1ymEvJrHT6jMKxrOcndPKlvHyWzoiSIEsONq571lkk=;
        b=OWmuHqXgFWd+u3v1zOGwO3bnUypHv+vuCGvsGO0+KlVXwiM1cuLtGG7VUZA32I6Lgd
         hxXfBfx11GiiK8oiX2AbRweQvC2YGpBPPS2YiaiwW4zZL3O9tam/OBwRRLCbnn5mwZrW
         RM9KUbLyCBQ1/JXIelf3gPT0KPpbOHf2RQ7wqDsbzhWlMh74vkWt9gOTDMcPK2guPwpA
         W5Dwm73MSHPICMoaeG7mNKKeiZKZPi8LiFWZumhWkPMxDLZCmWL7lNeoZuwUwdFOYmyS
         jLcrI9DzNUvqWh3N6f3gACuj2NVgdazKvZNlq4fs8ml7epjN+UQ1OgikRZcXq5Z7ih6T
         4mzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7iXEJoHrw+UU7+SOLTlbZ6AcWy88kHzJJggfuVDEnGc66URNRqjJHvtzcUq3FYE8Gf24X8gF2eXcfyoEe7SOX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4rtj0w4LupfrE/kg0U5vh6UsqtbPwJj1ZyNI+jP1ZAJOQ4gP0
	TZOIOYXFT+BLfGtW3Cp1RUz9Pz1nkQaKZprDAMyVHLvYlqXIV2oOO9KD
X-Gm-Gg: AR+sD13d0g5bo72SAi11Q+y2BpIFDCKf4j85xE6zinTj4lRL+Kid5cfeLWDLjh93d2Z
	swq5byTSvLZpDzdtA2+MIL6B1vNEFlqellaqMnViEkBcN9X7NzfJcVU1vof4CK0RXAJ9NhXIesA
	o8LqlAp6TByyaZxLePXrurXh30pqSs89xUESSA1TIp5g00Zjyz1nbNU9jXibpSfRyP6gvliXCmT
	ZB/YgSazE7wh3CQZPihd4CEgVBxK9EzjaZ2MXlPdz/xmz2vIKaqm30MJfn/78m7IWOGL197wGd4
	LaGNYQpV7ahvH11eq9J3rSUHY24/sKud4XgB6Afp33Zvv+qf8/ddyAoDXsCi5pOZfu7oqw8lUOj
	mmBaEnOe9eCUGDbQxFY+aFgCTgSIFTkNIshUEvy4UWKR/KDLwib5fhUCHQwa0OSvQOSKowfFZt2
	iMRKDPoDmBXlUoSCg1wUxrzJIyRu0Aer4O+deAvsbeRfrdTQ8/OH6sSQquzGNQym+i6Ss9+rjh5
	JDAsZr2NUkV3ze0HSVvIIn3YaOtMhToqk7wAXSHizxOS6j/5FEb9R/4dFaBO/h/wHI/j/F9RrvK
	N5JmaHM4iM2OOcJowYNJ4G0LpHJKvyJ4FJog1Nvt7UyY1MPlCqxEHTr3XZf+JaJxtPQYGGfNp6s
	0+Kg1xVWSChkDbt7M
X-Received: by 2002:a05:6830:258c:b0:7e9:e288:2b60 with SMTP id 46e09a7af769-7f1e5c13d31mr2587945a34.1.1785896908242;
        Tue, 04 Aug 2026 19:28:28 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/8] net: phy: add X-Powers AC200/AC300 EPHY
 support
Date: Tue, 04 Aug 2026 20:26:58 -0600
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw7CMAxEr4K8xigNHwEr7oG6CI4LRiSBJK1aV
 b07oXAApNmMZvw8IySOwgmOixEid5Ik+GL0cgF0M/7KKLZ40Erv1F5pTO3FSUZDvVIYGrSDN04
 IuwoPG6MsVdtG7zUUwDNyI/0MP4PnjJ77DPU3KZw7U/6wf93Ir7b8z9+DT+0mKYc4zOO6asb8s
 6NIoTLbNdkD64rodHVGHisKDuppmt5lRCtG9QAAAA==
X-Change-ID: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_192829_662533_A7BDEEE8 
X-CRM114-Status: GOOD (  20.53  )
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

This revision deliberately limits the series to the common PHY and the
two package-specific control paths. It does not contain runtime Device
Tree selection, generic MDIO reconfiguration, LEDs, interrupts,
Wake-on-LAN, statistics, EDPD or PHY-autonomous EEE.

The AC200 and AC300 MDIO link endpoints report the same Clause 22 PHY
identifier and use a compatible link-side paged register layout. Neither
endpoint is accessible until its package-specific control path has
initialized it. AC200 uses registers in its I2C MFD regmap, while AC300
exposes a separate non-PHY Clause 22 control device.

Keep those transport-specific resources in separate control drivers and
share only a small private operations interface with the common PHY
driver. A board described by this series references exactly one enabled
control device. The PHY driver creates a managed device link to that
provider, powers the link block before accessing it, and passes the PHY
address and MAC-selected interface mode to the provider.

This split is independent of CONFIG_OF_DYNAMIC. The initial series uses
only fixed descriptions and has no Dynamic MDIO dependency. A separate
development branch can later use bit 0 of the same configuration field
for runtime selection without changing the binding or provider interface
or duplicating the common PHY code.

The series adds:

  - a minimal AC200 MFD core and AC200 EPHY control child;
  - the AC300 non-PHY MDIO control driver; and
  - the shared AC200/AC300 PHY driver with basic link operation, package
    calibration, power sequencing and vendor analog initialization.

The reduced v2 series was built and boot-tested on an H616 system with
an AC300 package. The raw SID bytes at offset 0x2c were 0x06 0x05, making
the packed two-bit configuration field 0b01: AC300 with normal calibration
tuning. The driver validated that value against the fixed AC300 provider,
bound at MDIO address 0, negotiated a 100 Mbps full-duplex link and passed
network traffic.

The H616 EMAC1 support has been split into an independent series. Board
Device Trees and defconfig updates will follow after the driver and
binding interfaces settle. That later H616 integration will use the
Allwinner H616 PWM controller as the companion input clock; this code
series neither applies on nor builds against the PWM series.

The AC200 portions build on earlier work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 and AC300 documentation is linked from:

  https://linux-sunxi.org/AC200

The AC200 parent schema references the EPHY-control schema in patch 1.
The AC200 control driver needs the MFD core, so those patches need to be
kept together or placed on an immutable branch. The AC300 control driver
and common PHY driver have no link-time dependency on the AC200 backend.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - split H616 EMAC1, board Device Trees and defconfig into independent
    series
  - remove Dynamic MDIO changes and runtime Device Tree provider
    selection; require exactly one enabled provider
  - remove the PHY-autonomous EEE dependency and keep Intelligent EEE
    disabled
  - defer LEDs, interrupts, Wake-on-LAN, statistics and EDPD to separate
    feature patches
  - make the MAC-provided phydev->interface the sole interface-mode
    source
  - retain separate AC200 and AC300 control drivers behind a minimal
    private operations structure
  - retain the two-bit package-configuration cell, validate its
    variant bit against the fixed provider and use its AC300 tuning bit
  - reduce the initial AC200 MFD core to the common regmap, supplies,
    clock, reset and EPHY child
  - leave package LED pads disabled in the basic control drivers
  - Link to v1:
    https://patch.msgid.link/20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
To: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: mfd@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org

---
James Hilliard (8):
      dt-bindings: net: x-powers: add AC200 EPHY control
      dt-bindings: mfd: x-powers: add AC200
      mfd: add X-Powers AC200 support
      net: phy: add X-Powers AC200 EPHY control driver
      dt-bindings: net: x-powers: add AC300 EPHY control
      net: phy: add X-Powers AC300 EPHY control driver
      dt-bindings: net: x-powers: add AC200/AC300 EPHY
      net: phy: add X-Powers AC200/AC300 EPHY driver

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  77 +++
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      |  39 ++
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      |  70 +++
 .../bindings/net/x-powers,acx00-ephy.yaml          | 117 +++++
 drivers/mfd/Kconfig                                |  12 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 207 ++++++++
 drivers/net/phy/Kconfig                            |  27 +
 drivers/net/phy/Makefile                           |   3 +
 drivers/net/phy/xpowers-ac200-ctl.c                | 294 +++++++++++
 drivers/net/phy/xpowers-ac300-ctl.c                | 423 ++++++++++++++++
 drivers/net/phy/xpowers-acx00.c                    | 544 +++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h                    |  17 +
 13 files changed, 1831 insertions(+)
---
base-commit: b16bab325801c7be004222cad0ae296aa5982e79
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


