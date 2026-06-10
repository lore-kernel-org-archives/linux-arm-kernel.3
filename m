Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580EDCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwi1GK1b6kFMqMMmZP+3rXcQIfq6dBSGPyXYvtvQ7e8=; b=ZSwHKSsQ0QtXCSZCGDzNuup/4g
	dUqcb5q4zuvXMtT45nqaYGlUbKcu+oupFi1vOYowIWyICpj7Gs1bJVZ8KODUOh+Cz+HLe61XkEoKt
	oocctSjiawjHunqO58OkCcIXh4eSa4baLBl/aT4eJDxrPa4Ai0E6/NRvKkYeTB3VQr1g5Ox6q8FGY
	036VSpDfx1WFv1/iaySwsCp10iyZ+f43MRenYSYX/xNrxVemWXk7N/kFceQ5IBcOIvfmXAhoYNp+v
	Gx3XzGbISJL+lkwc4DWNSuDA2CEhwQu0KdTcAmFKlyD7o7vIROla7+4CG/slFfKKbl8T4o5dHkmna
	DfiNfdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH7E-00000007XE8-3IRu;
	Wed, 10 Jun 2026 11:29:00 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH7C-00000007XCi-1u23
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:28:59 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so3988389a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090937; x=1781695737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwi1GK1b6kFMqMMmZP+3rXcQIfq6dBSGPyXYvtvQ7e8=;
        b=EgwWqAGFgSDzTwK+VA44XxHn6WZNzWt64cT7V2H2Ak4h+2x6s4rsYfK7g5c9FMX+yp
         3XH+/dWExBv0rUSQns3aj3aecfrFjWcBTNGOO/g3bY+OOms5V+wfqPDCtp4KcsTbo9Qd
         HcY391d8bFcVOU7jpgeo84t1o7oCQQW8xUw/W96A5cHfepl6HReezLUh7/tyUUvLH9uL
         XwVcfcl7OMVo+9bzYii79X0WeCh3QqECShJj+h5srREOitrfuvKqo5ZoGdJll7TsecVT
         8HxCbY1g4jFRrvv+v+qhPsN807GX7Glj4WHTckFEu69O/X0iCQKktxe4Pg/4aBhykmx9
         tN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090937; x=1781695737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwi1GK1b6kFMqMMmZP+3rXcQIfq6dBSGPyXYvtvQ7e8=;
        b=izrToUiTdPiNDsAQ7pCDTfjPmPT165e3lt+tl0IW9NylyvPVR90HZOHqM10JV8MUXD
         ZibdQcaz9i9RcKQ8w1i4p6BxpNw/5EcrcualGLqaT8CayiWv9ylpAJzRXlLmCQoXxRF2
         SJA1uB5mvNaAoHLruTBiYbR7Nn9AQjn8Hnqh9eu4wqiPbBDG7pdj7xThXGGZvxFmVHBW
         FYuA+4dPs1uhSlVBAQ+9xP2zYVL2SAcPX+diCKVUetlnUPOjmznKGQaYeifLw/34NZmu
         35WURuBPvvN+4bZqteGMXLjk84zztcoE67p8hj3Ly4ZuAXOnWrKyv/On4ZePTFQILkMk
         uTmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8s5BdeP21lGD6G3OPskIzm4ffjoXKD5MxQyazYyBCKpNPqZbUMqJoc2c8eQU547O5BKW9/cOrcKM/Ftlc1eH+f@lists.infradead.org
X-Gm-Message-State: AOJu0YwPPZ031DvXPQduf4wYx9ZaSFATvNX6ZPyPMsHc7iRt+q6QwUjJ
	VA+LzJwJnjE2f+jkIuIPN9Y0ABnydriafj4IYTFSaLPCxd7VgF2QMR/3
X-Gm-Gg: Acq92OEIdhlh63sQlBZ/2AQPNVwm17/e0HDngJYYc7OJLOAUbgrhoBYdrUEWp4m+Y6w
	UzsFl5GFTqn/RC2utbDJfAt1QNARPvQ4p/k3GFwW1eCOd9l5jeSkR5KHrQmvb/tsiNQ86ZEvx6c
	gILPlhsmK6UdWFdMicyhYvjdVPd3TtvsKwLaGT92mlTHEFvab16dE2ctFTH3/wbk6QXTMhIq+Fr
	IiVCbVHWw7k4ddRSz67czr1VnRUvKuUhD/tfe8/f7fUtPB1LABiKHzGpEunzaSMsg6pHax3E15K
	17Xz7JrVPdaagxLUzf0Icqu10PAIi76IGIdc2MMgm6kiYRtfSDRQL7OrB3oRdx6hdf/3eLU/WMY
	sGA2uGhY1e9vYqjZr4jvxq7LZY090lCZV/fsSm6FkBdn8LdPeP2QODhg7Zr1okZGjynCF9AVrsJ
	Mo6lLqvEhszdLWMGD2EXP/VhbhO4LcT2bIA6vQsjgtCZoQwWDJpHuV6w==
X-Received: by 2002:a17:90b:580e:b0:36c:e254:4db with SMTP id 98e67ed59e1d1-370ee544633mr25082162a91.6.1781090937473;
        Wed, 10 Jun 2026 04:28:57 -0700 (PDT)
Received: from hc-pb-01.realtek.com ([123.51.179.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376460ee14fsm2027651a91.1.2026.06.10.04.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:28:57 -0700 (PDT)
From: Jason Li <jason.lee651024@gmail.com>
X-Google-Original-From: Jason Li <jason.li@cortina-access.com>
To: jason.li@cortina-access.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] tty: serial: Add Cortina-Access UART driver and platform support
Date: Wed, 10 Jun 2026 19:28:18 +0800
Message-Id: <20260610112821.3030099-2-jason.li@cortina-access.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610112821.3030099-1-jason.li@cortina-access.com>
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_042858_517359_8B07EF1F 
X-CRM114-Status: GOOD (  15.12  )
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

This series adds Linux kernel support for the UART controller integrated
in Cortina-Access SoCs, with CA8289 (Venus) as the first supported device.

Patch 1 adds the DT binding schema for the UART controller and the
top-level ARM board binding document for the Cortina-Access SoC family,
along with the vendor prefix.

Patch 2 introduces the serial driver (serial_cortina-access.c).  The
UART IP has a simple FIFO-based design with a single interrupt line.
The driver uses uart_port_tx() for TX, handles earlycon initialisation
when the bootloader leaves the UART disabled, and provides a TX FIFO
kick-start in start_tx() to work around edge-triggered interrupt
behaviour.  Clock frequency is obtained exclusively via the clk
framework.

Patch 3 adds the device tree sources for the CA8289 SoC and its
engineering board, covering the minimal hardware description needed to
boot a kernel with an INITRD rootfs.

Tested on CA8289 engineering board; console and earlycon both verified
at 115200 baud.

Jason Li (3):
  dt-bindings: serial: Add binding for Cortina-Access UART
  tty: serial: Add UART driver for Cortina-Access platform
  arm64: dts: cortina-access: Add DTS for CA8289 SoC and Venus board

 .../bindings/arm/cortina-access.yaml          |  29 +
 .../serial/cortina-access,serial.yaml         |  46 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  14 +
 arch/arm64/Kconfig.platforms                  |  10 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cortina-access/Makefile   |   2 +
 .../dts/cortina-access/ca8289-engboard.dts    |  31 +
 .../boot/dts/cortina-access/ca8289-soc.dtsi   | 118 +++
 drivers/tty/serial/Kconfig                    |  21 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/serial_cortina-access.c    | 755 ++++++++++++++++++
 12 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cortina-access.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
 create mode 100644 arch/arm64/boot/dts/cortina-access/Makefile
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
 create mode 100644 drivers/tty/serial/serial_cortina-access.c

-- 
2.39.5


