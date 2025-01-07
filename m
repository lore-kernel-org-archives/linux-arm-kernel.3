Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0AEE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+eEl3nkq/agt0SmzNMgL2PSlQlRVr5odYS+3eeCDxs=; b=gBNuFEC7W35Z5b
	uO9We5heOjkDLefbz+fb5ceuLBaU+0bx8bn1cSqLk6yGpy64qRMfL3HFm7xXHbgEKgse92fNyGzZr
	s0KnreAi5AROBYnJ/YBLaF8jhF1BhohO9lLxTQoRUjXGOauD3iHxOJcFMoQrj+RO/BkR1zH7ae1FK
	vrqdFvgr/7fNitduREAasPkFPq0JEsqcJ1JRVsGFiN+iSa/49RhpJd2oxqsZDHZgM2VnLA779kpXg
	vfiIJnq8HQ+VZ7JMr4ThKbFpnjGIP5QYz42v70nbMMcFlRiLyk5AjtJS8D5oaRqrMG0NiskOj0lgq
	jhxNvs8mkjPhbJrkpQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4lq-00000003tao-2fCL;
	Tue, 07 Jan 2025 08:17:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4jO-00000003tCc-3ZF5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 08:14:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385e0e224cbso7561122f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 00:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736237669; x=1736842469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+eEl3nkq/agt0SmzNMgL2PSlQlRVr5odYS+3eeCDxs=;
        b=avTKX0xmGLgP9aaQI0gK+L+1CEOKAq1Tf/t7YNTIy7VRTXFvAsV2pw5kE3JY6iDuE4
         yjd/hwcHtmvUxY3YAbiem5G2YmYzmojz2K2MyqIjYNeDxRQky0lEC0FXlnuQHIRvEcVH
         OzEWlv5JtMre3exM7n3j3CTF3BNzp0uYPGdtoGhyqSWEE7YXajoT4IpRlCvb8E+gmKvt
         WnQgDLCuiqjEAhrjwIFgaa55EdBobujx8T4GDPfqcwCZtIyxs6GIkpesnkH3o9jhq9cy
         5GWFLmiRNlPL4XWXW+SHQ3kqU/O1K5SzU83n2O2/QDZG4bYwfDJllIO8iptvAAgMtVnX
         RPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237669; x=1736842469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+eEl3nkq/agt0SmzNMgL2PSlQlRVr5odYS+3eeCDxs=;
        b=hiL0V2TKCtqnDVYwT3H04Hg6oPARFZBPGq5y8GC4yJJiII7PuitG0HhH3W/Md89VOh
         GSNkqXV8hCnLb+jRWgHcMS9YfREG2acK0sJ8RWaqEShv64mElwTD/fUsX77qnFYl6S41
         Q8vt0b3Yr8naU/XOuznKyQOAxnxUcwxZP57u1CZ2ZWgivBwDzw4hIg4DdI+c4XpS5SwK
         L5A6UR7kbzcZCnY8iuvMsQ+dyJVFvQ3ZY7H/BvNev0d4112bApoma3Z4cnpAOtk/qNMa
         LUc0hP8Vl1fNG/s2eUnOVC1KcZzH2LP0DXRQU2rZNKw5NzYx7YVWDpcMfLB0lVdzF2/c
         GFkA==
X-Gm-Message-State: AOJu0Yzf30Dbu9z5eQebKwQTeIm5rAc8LkiqKT96Sk4Mnp5Gii1oMmxj
	xSG0P5ezNCpwiLSIPdAB0vN+NSuG1CRfz2496gAqNl8yEQE4CDBiYaeBcivJhv4=
X-Gm-Gg: ASbGnct5XfRlw8dU42d8WCsBNKBoCEGfUoQNs45BhkpVJWhrSdT8xpLbh+HRyT6fdqj
	2sFF0BJFqKiWWCyroCKrtV2nDizy8uqaMuVsj3CrDRlMPeVeefwGFpxxPtLlkMDkUd4J9uZSciQ
	LdUfZ1GLOtBMTb4gb70nNYgDfv83pkOGM9amevACuP53HavEfLd+e+KOLPy2WXRnPzvtW8AEZst
	Axh9vnzw8m8gdQhPmAx7Glq5Q/1wINPh/cQkTZv+xs+3zWl3AxYjx9wvbE8pyNIX4u3btFg1/zg
X-Google-Smtp-Source: AGHT+IEoRaWgSkB/1em1s2I2OX80coPWVVkfFGHT1Swcy1r3bQ/xULPY3bTt9+lWQF5mNDPUaUH3bw==
X-Received: by 2002:a5d:6da1:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-38a2220039fmr49983719f8f.27.1736237669030;
        Tue, 07 Jan 2025 00:14:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a75a47943sm3541314f8f.87.2025.01.07.00.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:14:28 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Microchip AT91 DT updates for v6.14
Date: Tue,  7 Jan 2025 10:14:23 +0200
Message-ID: <20250107081424.758980-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
References: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_001430_888717_97B2FAD1 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.14

for you to fetch changes up to f72aada7bee42c4b43a272ef58bc4c9e1caa53d4:

  ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes (2025-01-02 12:33:57 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.14

This update includes:
- power monitor support for the SAM9X75 Curiosity board (using the PAC1934
  device)
- fix the VDDSDMMC rail to 3.3V to avoid breaking USB (for SAMA5D27 WLSOM1
  EK and SAMA5D29 Curiosity boards)
- partial support for the SAMA7D65 SoC
- cleanups

----------------------------------------------------------------
Cristian Birsan (2):
      ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to sdmmc0 node
      ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node

Dharma Balasubiramani (1):
      dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT

Mihai Sain (4):
      ARM: dts: microchip: sam9x7: Move i2c address/size to dtsi
      ARM: dts: microchip: sam9x75_curiosity: Add power monitor support
      ARM: dts: microchip: sam9x60: Add address/size to spi-controller nodes
      ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes

Romain Sioen (1):
      dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity

Ryan Wanner (1):
      ARM: dts: at91: Add sama7d65 pinmux

 .../devicetree/bindings/arm/atmel-at91.yaml        |   7 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  14 +-
 .../boot/dts/microchip/at91-sam9x75_curiosity.dts  |  54 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts |   1 +
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |   1 +
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |  12 +
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |  38 +
 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h     | 947 +++++++++++++++++++++
 8 files changed, 1066 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h

