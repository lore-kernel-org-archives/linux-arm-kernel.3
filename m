Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9285BD1266A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVir3aaEvQ5ZfVRybbexJTZ/9EY3vCUB2U7RE43OOPE=; b=TUeoZyxDv/S2XP
	O9NSChb/NsdgDv3pUM+ht+avpH+zUIWllDS74iTi8FFs1gEch8mUR/kEfAqZbyxAZDlZfZNgUBV4Y
	eH8cBnlm0/XrkxmnM14xqvOTja6N1mXJlq78D938cA0wBGXPNmB1rlJRa1M0EnLomaXD+txXG0jDB
	1EzQ9B3NTaBQwoyoeYyxV3qak+0ToGtCVOOYNuatlkmCpInQdZoqstMDLCjjVTGNecT5giKpRm1Cy
	H3lUv3at/4p8h+2r4ryE1xn0oNact5On4K5dAlyU/eWscfPXZkssjZArTk46vSAxH25FysAzpigYg
	5lfdnrNDbyDpXbIY38Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8F19-0000000GLtb-1rPW;
	Tue, 05 Nov 2024 08:34:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EjN-0000000GItu-3bIB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 08:16:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so44179195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 00:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730794564; x=1731399364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVir3aaEvQ5ZfVRybbexJTZ/9EY3vCUB2U7RE43OOPE=;
        b=e1B24bqSTfrHPfX9zEc9dx3i9F0KL0h9fPoxhEkJeGK59EDH5TxOAH5cUVd4gKFRtG
         +LLZCgg5ZYgeNWcTwF8G3VtR75fxeoPzUrwJKHYaOvrfmRewmg4j8TiOl9lEAk7dmCU/
         iHd/ehDtzpDkBYXuwHZhFpzytdi4kLIV133eDiA0WLvld0mCGbWme+EAC2xzjW4ulx1+
         NrYjAu1+y288y2STlUNzAUYxCK2Yc6FVYMLE2R+Y8zTEGNe5x/tQWfBeiVrheEotP/jW
         2dYzlM4sTpe6ckNg3QDFXyLmKRGjFsYFvCV9W/jI3LnenawLPbgN/rqIH8z3C4Zhphrf
         5+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794564; x=1731399364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVir3aaEvQ5ZfVRybbexJTZ/9EY3vCUB2U7RE43OOPE=;
        b=kIPjaGnibfPOerMjYZBrYuKIy7ftyk52gROcLvpkhNUh6IpgkeMD7BSaJpCT5q/LO1
         tLRR1mEoPfdRSBBwSvEFNS19KMiYiDIHRMYkdWAfFzCtZeoYOvvX9KQzp7RpRrM3212V
         9WP2uFks5mjGPwfwXTuoAZ2Zxd325yLun63UDhiLA4+jvy0IRO19Z33dYOuD2cPRbwd0
         0ej9es5HMwsBFdwTb0IKb3/GNKT9LQP7jSslDTMGaE90Tr9DUbFWohA8yGgd/Y5H9dmd
         Us1LDIP7ZAg0PWbAEEZzLljXt3hSnhMTkhNIVGTVheeTAVJTRv+mCD7GYPqi4UmEKZ9Z
         ADkw==
X-Forwarded-Encrypted: i=1; AJvYcCWBgToMOz2Qdj4VqpgIZwz+kZI3/F7s1Di2GMzRJXdxw4ONTVNSl0LTZU0nkCStoolUP6Ro7GJW5PNh/wT5qyiM@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ7W0eerpyTApwb6jorD6LqYKTY2rHAXvk6LwJ6H6/ne8Xkf+B
	flxOrXBNh8lP13XvrObKODENpiOrZWiLqirI7Z1zQfoka/aU0E4Kj0aLEFXKn/Q=
X-Google-Smtp-Source: AGHT+IGZSzbOpvi2yCB1Frv/kF+9xIWAujcsdB9wLzuym7MnF60se5RTfFEikpDxPpdDPK7J73ngrw==
X-Received: by 2002:a05:600c:350b:b0:42c:e0da:f15c with SMTP id 5b1f17b1804b1-4319acbb947mr274605165e9.20.1730794563965;
        Tue, 05 Nov 2024 00:16:03 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917f0bsm203801475e9.17.2024.11.05.00.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:16:03 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org
Subject: [GIT PULL] Microchip AT91 DT updates for v6.13
Date: Tue,  5 Nov 2024 10:15:58 +0200
Message-Id: <20241105081558.3980044-3-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241105081558.3980044-1-claudiu.beznea@tuxon.dev>
References: <20241105081558.3980044-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_001606_026135_A69A0268 
X-CRM114-Status: GOOD (  10.13  )
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

for you to fetch changes up to 2bd3059f1ac59618eb4ed10b9fe4ca70a27947fb:

  ARM: dts: microchip: Rename LED sub nodes name (2024-10-13 18:56:19 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.13

It contains:
- enable power monitor support for SAM9X60-EK, SAMA5D2-ICP,
  SAMA7G45 Curiosity, SAMA7G5-EK boards
- updates the uart nodes with missing properties
- device tree cleanups

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

 arch/arm/boot/dts/microchip/aks-cdu.dts            | 12 ++++---
 arch/arm/boot/dts/microchip/animeo_ip.dts          |  8 ++---
 .../boot/dts/microchip/at91-kizbox2-common.dtsi    |  2 +-
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts     | 37 ++++++++++++++++++++--
 .../arm/boot/dts/microchip/at91-sama5d27_som1.dtsi |  2 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |  2 +-
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |  2 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   | 33 ++++++++++++++++++-
 .../arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts |  2 +-
 .../boot/dts/microchip/at91-sama5d2_xplained.dts   |  2 +-
 .../boot/dts/microchip/at91-sama5d3_xplained.dts   |  2 +-
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts | 31 ++++++++++++++++++
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     | 33 ++++++++++++++++++-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |  6 ++--
 arch/arm/boot/dts/microchip/at91sam9260ek.dts      |  6 ++--
 arch/arm/boot/dts/microchip/at91sam9261ek.dts      |  6 ++--
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |  6 ++--
 arch/arm/boot/dts/microchip/at91sam9g20ek.dts      |  4 +--
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi   |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           | 14 +++++++-
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |  2 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |  2 +-
 arch/arm/boot/dts/microchip/sama5d34ek.dts         |  2 +-
 arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi    |  2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |  2 +-
 26 files changed, 182 insertions(+), 42 deletions(-)

