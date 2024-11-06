Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B63D59F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=; b=Jq7TJ/ZEvqndgE
	/udiUPXdogB5RRdxuQrCnB+Pp3NnKeageQzjqmK+eDkXnfhLgr4upZ83mJjMxzHdNLtDBxVlxMuO3
	I+FkeRJQW5WLXLiHG0KuNY8tnZGBZcv8HN+iKRI//9BoQwXhiYwtldyXgMUcfTvAeydPeZJHw4MIK
	fgePAdhRTpUKlhtAbHobciMVNkj16tIZ4jg2NsCDFAY/k2UDHVQ+ZlHJkG0R3x12X/iWibubyr94v
	7Bo/PVIUMPz3H8mLDyaZdYXM5xFmlgc0WS4Rfcc4g526L2vIvWBs45TxRZoryJn2kL4JbfrRJLgcQ
	8nJ5TG5ZhNpYCjIOMHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kUy-00000004IJv-1f3M;
	Wed, 06 Nov 2024 18:11:20 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kPw-00000004HTr-1Mdo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:06:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a9e71401844so2334066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730916366; x=1731521166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=;
        b=JwAkBqat3gTa+BlTtLx0/QhHExTHzmy5kAizyNMdKYxwOMY7Gg79P6uQnTROrM1WUU
         G0W8MtUHA+ibUPgqy/+WmDL8ROqsNlBUA/7XRsNA+mlu4XoSaZ/S7s6B9aL7M1E0RWRo
         3Eo4esFYa5ihIPs6+85b1UURGjgwJEQ8a8ds51AEavz7jdcpBqqIGfu+cXZI4tH/0THQ
         9BT626D89jb45uQsceB7xmboH7ww+AVEfjx+wkx22D0OjOwq7I+X2ANyFZovFD1Ixom5
         6szTI2gbGS93vcvgqmm40qlWyBEPXj+BVGYRLFDmfm7KEFq9jyspH/EvYeAHnWxKPp/g
         fatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730916366; x=1731521166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=;
        b=eR9szBQBI0W0MAAklUlhSQdC/x/Kw1luNItoS4yldqfbZuOzQiSUzUkhlWTDplimHu
         QAFWspk2b91ptSvKEToL6YNtZkKnpGKK2klvnXLlBPGzu4x/guKMk0j+wwZWo92q5m0K
         NGiWmVBJuQfZOlsUn9Sitv2Z2EzjicVPZXsYn492Eb2TTp3o4SNLif1hjvB5L6Qyk0iW
         c+pHGsxt/yDgaxj4QbAAcXHIyiCvmfUi2GqijMl8phLs4LdOZoSbT3Cfp+/6g0be3vq8
         rWOQ29cZOEc8XY0PFqZyqkFXvJG36DuYF0RpD45Kd22LnPuh6Ovpi6VY4otMIPp3t6UU
         ifVA==
X-Forwarded-Encrypted: i=1; AJvYcCVv/ahXDgSw6zS69OWvjZ2ddECjf9Bkt1MPd8MqrXj/y4lBX42TmLh4F3f9jMB+qVMSZGOCA+3y0N6J1FHyVees@lists.infradead.org
X-Gm-Message-State: AOJu0YzsivX1InQQ34WUzmE60z1p38IKXDi6H6xy+aDBz/CaZ7YV4IYm
	sV2JjkXfp+0y15NHSb2jfsa2CScd6j2PjyWcCOKJ3xb+V6oUDFo/Gsx96mldA7g=
X-Google-Smtp-Source: AGHT+IHSTvqqc44VrM9D0pIpR669rTeD6/mmLgxp6ucDNdgmi7649kxaMqaCnS5NfCNA2SBiF1q7Tw==
X-Received: by 2002:a17:907:6d12:b0:a99:d782:2e2b with SMTP id a640c23a62f3a-a9e50938952mr2214538666b.30.1730916364262;
        Wed, 06 Nov 2024 10:06:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17cf805sm315855466b.120.2024.11.06.10.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:06:03 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org
Subject: [GIT PULL v2] Microchip AT91 DT updates for v6.13
Date: Wed,  6 Nov 2024 20:06:00 +0200
Message-Id: <20241106180600.2114683-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_100608_616556_EF5545A1 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.13

for you to fetch changes up to 371a47c9a58a13e339fce2a3118c9ee6a8422258:

  ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board (2024-11-05 13:51:12 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.13

It contains:
- device tree support for the Microchip SAM9X7 SoC and the Microchip
  SAM9X75 Curiosity board
- enable power monitor support for SAM9X60-EK, SAMA5D2-ICP,
  SAMA7G45 Curiosity, SAMA7G5-EK boards
- updates the uart nodes with missing properties
- device tree cleanups

Changes in v2:
- added SAM9X7 support

----------------------------------------------------------------
Alexander Dahl (2):
      ARM: dts: microchip: Add trng labels for all at91 SoCs
      ARM: dts: microchip: Unify rng node names

Andrei Simion (4):
      ARM: dts: microchip: sam9x60: Add missing property atmel,usart-mode
      ARM: dts: microchip: Rename the eeprom nodename
      ARM: dts: microchip: Rename the pmic node
      ARM: dts: microchip: Rename LED sub nodes name

Mihai Sain (4):
      ARM: dts: microchip: sam9x60ek: Add power monitor support
      ARM: dts: microchip: sama5d2_icp: Add power monitor support
      ARM: dts: microchip: sama7g54_curiosity: Add power monitor support
      ARM: dts: microchip: sama7g5ek: Add power monitor support

Varshini Rajendran (3):
      ARM: dts: at91: sam9x7: add device tree for SoC
      dt-bindings: arm: add sam9x75 curiosity board
      ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board

 .../devicetree/bindings/arm/atmel-at91.yaml        |    6 +
 arch/arm/boot/dts/microchip/Makefile               |    3 +
 arch/arm/boot/dts/microchip/aks-cdu.dts            |   12 +-
 arch/arm/boot/dts/microchip/animeo_ip.dts          |    8 +-
 .../boot/dts/microchip/at91-kizbox2-common.dtsi    |    2 +-
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts     |   37 +-
 .../boot/dts/microchip/at91-sam9x75_curiosity.dts  |  324 ++++++
 .../arm/boot/dts/microchip/at91-sama5d27_som1.dtsi |    2 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |    2 +-
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |    2 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |   33 +-
 .../arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts |    2 +-
 .../boot/dts/microchip/at91-sama5d2_xplained.dts   |    2 +-
 .../boot/dts/microchip/at91-sama5d3_xplained.dts   |    2 +-
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts |   31 +
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |   33 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |    6 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9261ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9g20ek.dts      |    4 +-
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi   |    2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |    2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   14 +-
 arch/arm/boot/dts/microchip/sam9x7.dtsi            | 1220 ++++++++++++++++++++
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |    2 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |    2 +-
 arch/arm/boot/dts/microchip/sama5d34ek.dts         |    2 +-
 arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi    |    2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |    2 +-
 30 files changed, 1735 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sam9x7.dtsi

