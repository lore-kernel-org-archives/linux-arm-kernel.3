Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D6CCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=; b=tZjfKspGesh003CdMnw64SfvFT
	VNwxZLQNb218JRRb6kuW24J8BRTqimItBknMCJf0w/SKc3WO4/lNVVFTK096miXqULdl6qf+USxAP
	OEXRT7AUNM1fuAT8SGdnwX+gbxU6q1S6Tc2fUuJhkh/XwOHygj7UYIDyVgxsG22o8iCY8suDOdmBn
	zNrMrUqpXUZSGdqWDPlJcTT+kOmaZ0VS3aM/31/duZrh8EyodC4/OvYjpNNQ8B5wiNIsWB5vSb8of
	I1lgKTsRXOWI++38eN6RsaYIAQhzoKiKDka26UiBGhyaUhEiW/pkcTc/HxIMHmnPzUwoWuKPpquBv
	p1YXH57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL313-0000000GXIP-2H4Z;
	Mon, 17 Nov 2025 17:27:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL311-0000000GXHd-16wA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:27:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-29812589890so59075645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400466; x=1764005266; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=yH3bGgjEKQMmtfcbcNvo3ypnEBQyy7rSseYyJOduykECHqEoWLCdrH4OuOE3UzS0J5
         Ph+SWMvLcF9XsbhVKHxy0whgC4FDAVXUm9+5cq6xFnTRfXU3dshnzzOF4La7lPmSd9xd
         kVx1KTvxUlRgXW0zrpnKao5y9+o2MPJRNOe7XJ62dw6VT4XmNvcDz8QqyoZp/rnrxQR0
         +DUD4BDkM91bmjBDRGxmapkdSz3ArSz4mVJEwywq2JCETq1Z8IZvtLGrF+4KiyI5zUQN
         9DSLQgZkNugirEknzueLL2tLnQZ7IMP56tu9yaVo4GVSwBy3hzOPVM8cDbiuVh+zTsWd
         Z30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400466; x=1764005266;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=YFX9cv4jgXKtMK1s+BxYhZIEuh7mcCayOG0TorPBSHh5fM/RYqksWUTGJ7G4zIDroz
         MD4z1TQ+S4RUiUe7euKjV0Hi2jNg3IsnKPcLgXX5CpfrnUhOUgxxIcmy+/g3R9JkIw+S
         nQORmTqT3SSCWgkZwea2ZZEvL9aJ1WaPy74fB6bffRY1mrJQ8LU5YUcdWB6kn196q5qT
         eVRLOxRPNn+mEjlJx6J6LAlvl+prpjQneh+U9Uje2RGn+U2TO0lNPB1rJfpMT/UHdXk0
         8KWMzVuK72jwOuwnbAy0cAHSK6v99BMm8WokNjxCnvqLJDZVYeXwMxNeTe1M7uB9LjOw
         qR1g==
X-Forwarded-Encrypted: i=1; AJvYcCWx4OyaqlYC4jJafUHaLO3Rcvz5zBadPc4hQot4rpDzpmj93qgoDSwJj5EDvr7IV/6BRXtZoFyQJEpPbI6YPgNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNJxNKzLwmW7+GMC+qwI2Vd/2T+oAarNnpV5nRqAdrcDwkXats
	7eMlr6mUeRphjaN5X46pG2TcccDyXoyEdn2hCKcudz8VR+dwv2o0RzzK6M/oLi/FAiE=
X-Gm-Gg: ASbGncvOGQtReJMWkyavpsy+pXoNrvHAEmP41nON2PLY7pywbUsm6pJ9X3CsHQ6Jlnr
	VGhzzO9MuqTnOC75RdD6qp4HFAy3sVxgzgDKXDV9kGPJkKbWJ0l6/Nvy1byZzS4gsbkXVpqPwiy
	nq4VdWP8IisXsZRIjrlh0Vkj34oJvlgdYuT/XchFmjNMNin8VXkZCKsTyE/isOVDiWou7gOEZYe
	le52r4q797KC7mDmAZKeOuWLlAT3EZQB8vmUfwTg1J0BhwiSc1SSRipapd3wuCV+8u4zD8Fv18Y
	5UFMqbfljj45cv8Mq5760hBjTIuTRXeK3jdChgOAV8Gw2Gqm9LYtMXxHf9baI6Lf48/lWf6PzRI
	U0+P7XTFZokaVUgNm1r/nv6W4BNpsJjZTGrmaX4hBl3+xEYLUrkUKH7ox5uVXYQyVzYY3TTqxb9
	fr9rZyrZfl
X-Google-Smtp-Source: AGHT+IElSDqKmysdPsypqiwQmrd7nhXoTOdlBkkWGvewmZSLP/XTtjfZ8ALU9FqHgq3YZZs3dsHUKw==
X-Received: by 2002:a17:902:e5c3:b0:295:596f:84ef with SMTP id d9443c01a7336-2986a72e380mr141061385ad.31.1763400466406;
        Mon, 17 Nov 2025 09:27:46 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-299daf12fe9sm53218385ad.74.2025.11.17.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:27:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: omap updates for v6.19
Date: Mon, 17 Nov 2025 09:27:45 -0800
Message-ID: <7h4iqslgby.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_092747_311406_B6C57E1F 
X-CRM114-Status: GOOD (  11.89  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/dt-signed

for you to fetch changes up to 73f0769ebfc6473be084f0c52db25d2973097dd4:

  ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node (2025-11-11 12:18:23 -0800)

----------------------------------------------------------------
Misc. DT updates, mostly for AM3 platforms.

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: omap: am335x-tqma335x/mba335x: Fix MicIn routing

Charan Pedumuru (3):
      arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply property typo
      arm: dts: ti: omap: Drop unnecessary properties for SDHCI node
      dt-bindings: mmc: ti,omap2430-sdhci: convert to DT schema

Geert Uytterhoeven (1):
      ARM: dts: am33xx: Add missing serial console speed

George Kelly (1):
      ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node

Jihed Chaibi (2):
      ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
      ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible

Matthias Schiffer (3):
      dt-bindings: omap: add AM335x-based TQMa335x SOM and MBa335x board
      ARM: dts: omap: AM33xx: add cpu label
      ARM: dts: omap: Add support for TQMa335x/MBa335x

Nathan Chancellor (1):
      ARM: dts: omap: am335x-mba335x: Fix stray '/*' in comment

Yegor Yefremov (3):
      ARM: dts: omap: rework Baltos LED nodes
      ARM: dts: ti: omap: am335x-baltos: add a regulator for the mPCIe slot
      ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels

 Documentation/devicetree/bindings/arm/ti/omap.yaml              |   7 ++
 Documentation/devicetree/bindings/mmc/sdhci-omap.txt            |  43 ---------
 Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml    | 169 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/Makefile                              |   1 +
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi               |   6 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi                    |  17 ++++
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi               |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-evm.dts                        |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts                      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts                      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts                    | 633 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts            |   8 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts                     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts                     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts |   1 -
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                       |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi                  | 270 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                        |   2 -
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                           |   3 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi                           |   1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                        |   2 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts               |   2 -
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts               |   1 -
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts                        |   2 +-
 31 files changed, 1121 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci-omap.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi

