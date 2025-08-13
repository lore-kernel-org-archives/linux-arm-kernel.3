Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A48C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SBsfJFWg1o3SQZ+JkXCo0QRsi2YIFRfM5g31219RL4A=; b=KUNG8YcqOjZ+Bm6K9NjjgNge63
	UdQDYyoo8M4edCPgFH8I7JsV2iWrECkMnl+g4R5MbXuNySCdYWbKwBP39VsUA5JvlpSY67covYxKO
	LthJqf2YM9Lv8LJGxpWGJt7ZOvQF5FMYaqc+RoHjUnL9w3hEocSUvTlDAnbHkonrQ5Iul1s1qMa+W
	7d48SF38kcVrnJI0heX5b+PiLHXHOjRkDHJVvJoDe/R6S2y24GT7a7F8PDtaWip94tzLSeqT5OVqb
	zOksU4Hgg9sl5e057Kd7FA2lvRg5Tn7SPYugxwMHxYDKxs+N+SD6vssZGlAFQMVR5DL1o+fyvpmhi
	wRjFE9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPG-0000000EqMQ-05Uo;
	Wed, 13 Aug 2025 19:45:06 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZW-0000000Ebzd-0lK8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:47:35 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7e870608598so6374785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107251; x=1755712051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBsfJFWg1o3SQZ+JkXCo0QRsi2YIFRfM5g31219RL4A=;
        b=GhPRscYs5kfoBJbi9fRNIbl/WPV3c2Awpr1cZseA5yzKka5Qe4D//LggTpSPLF5Tpp
         SPVOme7zDkAT9aH8I37yc6zF6UI7I6F1DAGny1bR26Avkzu4/G1xTzaaSVB5IvCoyRS4
         hEsYoqmdkcy6UINWuWGnUij3aB28q/APtZaekVnFs5s5KJEz/oAPOD3uv90oPVKrs8sr
         0Yuqu+fFOZmKQjLynpGbJw4km9Z7pxYNC1pC91SkNfFjFbq2EDC60ijOeugw1vMp69a5
         Gal3xbr/wiRm9qV8a1Ji1vXX/kWeW7spBIFeDBgUfFSZdo3vFluegFlKEAXw6n9aG7PK
         AnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107251; x=1755712051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBsfJFWg1o3SQZ+JkXCo0QRsi2YIFRfM5g31219RL4A=;
        b=e1tYimb6XWxjZ6ZTQ8Z40iizBV4/2FloPI3gX8C146K4KbycndQkvT+4/exdf1bOCw
         +UDiXt8Cc6YkY3n2guoKfD7Ieif5ZePkHPGG8FIKMKa3tYv5YgtHHREtv3zSNz4qlyBs
         GA78Sa8be87Ni4yyCYFd9mrRPYnVOfU3M5pU4CrtjOgyOwg9w7azj7F+aQgkhKV00hdp
         usjDt9HIXLYQn97vMFIpK3KlYP0diJwsEVkRvfKhYNYqe80Y0oBGSsJUBHDc2p5XpECc
         rgTBoIPi5f7qE6yQN3IkqUR3nIJSxJ+ozk6LQej+QhkVeomPrDrOLxwK6rR6/9FnWh9B
         tfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXsT15AV9h9r6In5AGzYOMpP1hRC3f1j+g8qMrxmrb1JS/3EFBTjYwy2PLzhrnXca554UwWa8DwXGrsKF071Qb@lists.infradead.org
X-Gm-Message-State: AOJu0YxL2LLgEmvJw04NOhjQH0cgFGpqgKSuZgK42r6N/PQs8kBRZeB4
	Ugp8o8Vvw/PLAiTg5Dy8BctpHs3/LjfTdbatp3LvRNCX6egrVLHqrhL6TpORPIxww1k=
X-Gm-Gg: ASbGncvzxPWGDcELj/17ay/RJy3SAOGhBda+wr2Jp8Mp9OHxJmzFt33mZfOi1hPnvV8
	0QG1sK9L3/wZi1r+FFkP68PEfcwixLRhWlAuPNoyrFnjB5CjcmbqeekPe43d0xQa+zOkFngwdB0
	x1vz/9XfGpQFjPWXVyKght+kAZrSRSEJIldOaNDBxL/YaPgLgZDoCAnxDUp9JYMefYWNGj6ypco
	9Tu0ErCAD7EeHEpppMAFhWaptuD4Aenvp76q8VTVnb/cBdw76gt6b3Yu7E35fta5uJ3vGSPgrYM
	FLw+z7A7+sK5KvHRvzUSOxanhZ6g9sgMtoRyfmDeWfMuxhcVuQwViuZNABKV0IWB6WRqmz5GcJT
	zOli2+uRJzeQrdMO4KVz4+7uZjnPrQgDGtCBv0SdxjA==
X-Google-Smtp-Source: AGHT+IEB/95DXkKwomIf9ip6/yfm146L3qIifjKU7bl9DaOBgZQZz5rMpVm/bhHv87pLjMhka3uuqw==
X-Received: by 2002:a05:620a:a102:b0:7e8:434f:ffa7 with SMTP id af79cd13be357-7e8704761a0mr24882585a.52.1755107251577;
        Wed, 13 Aug 2025 10:47:31 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:31 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 0/9] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed, 13 Aug 2025 19:44:36 +0200
Message-ID: <20250813174720.540015-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104734_231159_96D9D2A7 
X-CRM114-Status: GOOD (  10.80  )
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

This patch series adds basic support for Microchip LAN969x SoC.

It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
which allows to avoid the need to change dependencies of the drivers that
are shared for Microchip SoC-s in the future.

DTS and further driver will be added in follow-up series.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v9:
* Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 and LAN969x
directly, this avoids breaking existing configs with ARCH_SPARX5

Changes in v8:
* Move to using ARCH_MICROCHIP as suggested by Arnd
* Dropped any review tags due to changes

Robert Marko (9):
  arm64: Add config for Microchip SoC platforms
  ARM: at91: select ARCH_MICROCHIP
  arm64: lan969x: Add support for Microchip LAN969x SoC
  mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
  tty: serial: atmel: make it selectable for ARCH_MICROCHIP
  spi: atmel: make it selectable for ARCH_MICROCHIP
  i2c: at91: make it selectable for ARCH_MICROCHIP
  char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
  crypto: atmel-aes: make it selectable for ARCH_MICROCHIP

 arch/arm/mach-at91/Kconfig     |  4 +++
 arch/arm64/Kconfig.platforms   | 51 ++++++++++++++++++++++++----------
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/mfd/Kconfig            |  2 +-
 drivers/spi/Kconfig            |  2 +-
 drivers/tty/serial/Kconfig     |  2 +-
 8 files changed, 47 insertions(+), 20 deletions(-)

-- 
2.50.1


