Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1A0CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJcoOLDf8BTazRGK+87/HJW+Db0TPk2aWIU1Zf6mQlM=; b=3B9i4qdL5sVvNfBrzmGzYN4+HP
	onKM5CaEXNNOJZ2/DYjeZowCmn20KxQ6WiOH6xyxahG2b5nRDy+bknIf4o2sXTAz3v0PMoasurVwF
	f9F/CZ84yiFR6qkouS5gvqNTq66u4rEKoUBzAGtAEX00y2rRANXtzFTbUsQw56wx7xT5UYIlfyd0r
	h5vUdP/s8sKJ5AZVabjCQf2oUDLtJxcdnSKZkD5oKhH2AvNP5yoNoWPTx7bjASqnsLblhnTBWtIhg
	FzmOp1pJs15q+W/luCAXp5RhuQyxqzgNxNjsNxWhzTBzELnaOc2kn8sy6W/mE2G+33oX0WXFrtwnz
	uLf3CsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVlK-00000008TSs-0B47;
	Mon, 11 Aug 2025 16:52:42 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTls-000000084y2-2TRq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:45:10 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-af922ab4849so661134066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754923507; x=1755528307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJcoOLDf8BTazRGK+87/HJW+Db0TPk2aWIU1Zf6mQlM=;
        b=YMQMxndjfrmeMVpgswRcbJWScWRUn3fYOOLWJ2z/PzNcbP6masAlKnSROPExFNHOo6
         WAWTwNZHhPpQQi7qmHUoRxmhEnZtu5zz5CeSf9DLYLSlSt0jih05GhxHBjaV9cFdeC/b
         pCrbuFiM2DDjYblP7xYDPLDHOfPTw1em81Z1xOcbusExek9hfvX7R86PCByVvJX1nfwV
         e7ACPdRCR9pEMeXPt4tOMghdDBTFlrqabYlmtndTq3JBjHVH6qQ9EBimHyQ0Bhr5Bqb9
         FCt1yESNJllDaoVbRe67h4xTtd7dZ1aeikKsQIVlmPXuAggdKg+rfD7K5Ou9Z3xGttVg
         E6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923507; x=1755528307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJcoOLDf8BTazRGK+87/HJW+Db0TPk2aWIU1Zf6mQlM=;
        b=TFQO6RY33eqfvdYfvJT7csYXXcV3yPWj2X8rIMvWKxb94j3nGKhWszBvH1KgIi24q6
         uxH29u9Gco8aQUjKkL0kImEIe0+O99aEESNQHU9Pff+0jQSujDug+4d6c894YTX8n7Ns
         O/hmD4nsF6k2dkTZrCmq0VoOUFtCKkN6JR1u6UEX1F6cAVcHjcu0HXCzM26teXKiC3FK
         qMGKh6ulaEbRTWz0toz4K5nOHdTC8I5k6Hj1oLR2HVOeaZYPQgmnXt7STcq5gz5ZOENH
         wIrL2ugQOW4nwQEaMOBh1y4zWCAqYEJbOv14azuoELIKR6yL3/7lhzKNlJR7jGFtXxKE
         QZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCVPAXfLqack0O8OUteDy85XIvBQkUVan7UIBpQMVN06kPmuyIlzgAIr3nX5HTtResBU5CWNO1x+SXG0Vwqqc7f0@lists.infradead.org
X-Gm-Message-State: AOJu0YyyWs9WqP1mflYB+X2Bf6ip8r46eMQowUudr7t0Mw23MMEXFWfq
	kkLQNsh5dabnEGOm7/aP8ZIThlnBz9mnNG99KyGzJ6MOjWlP72Yw8xOH2YFOR5+oIUY=
X-Gm-Gg: ASbGncunpS091rM3LdhZ/hTf8sXJNmc0cV7795RFmHyk9WwJC/SvR49kFBEzDxA+Fnh
	GBn399manBEZ1l4FITsoNAV0Oi67W4065SDKrWXgmYOc9H30Sro1hBeBMD/PkP/h/LUQV1yd1gl
	8zQtmJTQlAvsbGTPglgSR5Fz5hJCm1qDwenI2fYy0Rx/5q2VsQeBIfmpcgQmxC6CpCFUkLwiQk0
	O1RAT/PE/jh4mW5cD/Eqb32bQb0dPTLb1cKm13Il0kG6E8SN2MNgrCZMOSBidiJOuYMnN0HBAu3
	8XeQLtpu6MAxkd9pGEbt/zCkSdoKeRzbCKGN0/jZaCIZ+Eb3xtfvhki16rZIZrMgWat6kJMP3mo
	aJspAXvG6LRoMwQGbyblmUHjgDFxbWpNwpCY5k1SoA3msB4rWQeyHKsmR35/HGLDESw==
X-Google-Smtp-Source: AGHT+IGxUCzXjFil7BaQruhMsAvs3m/J8Chpjk13kDIOzDYu/beUtkNUJBMy4y0EFRLuwUY2CuxLOw==
X-Received: by 2002:a17:907:7fa4:b0:ae3:c767:da11 with SMTP id a640c23a62f3a-af9c65de7eemr1074989066b.50.1754923506918;
        Mon, 11 Aug 2025 07:45:06 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af937c86989sm1814983866b.74.2025.08.11.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:45:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 0/3] Add pin control driver for BCM2712 SoC
Date: Mon, 11 Aug 2025 16:46:50 +0200
Message-ID: <cover.1754922935.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_074508_628326_071D52BE 
X-CRM114-Status: GOOD (  17.49  )
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

*important note* - For clarity's sake, here's the revision list from which
this patchset derives:

V3 (this patchset, split-up to deal exclusively with pin controller stuff)
V2 (missing v2 in the mail subject): https://lore.kernel.org/all/cover.1752584387.git.andrea.porta@suse.com/
V1 (original by Ivan): https://lore.kernel.org/all/20240731062814.215833-1-iivanov@suse.de/

Also, in V3 the patchset has been split into two:

- patches 1, 2 and 7 from V2 form the new revision V3 to deal with
  core pinctrl stuff only.

- all remaining patches will respawn as a new patchset that adds new DT
  nodes for the peripherals that use the pinctrl. As a consequence, it
  will require the above mentioned V3 patchset as a prerequisite.

--- 

Hi,

The following patches add a pin control driver for the BCM2712 SoC.

Device driver is follow up version on what Andrea posted in April [1].

It is based on sources from here [2]. I just made few cosmetic changes
and addressed review comments from earlier submission. I don't have
documentation for this controller.

A separate patchset will add peripheral nodes that rely on the SoC pin
controller to setup and config the pins.

All this have been tested as kernel was directly booted RPi5 via
kernel= config.txt option and cmdline.txt file with following content
(Note I am using Tumbleweed RPi raw images)

# cat /boot/efi/cmdline.txt
root=/dev/mmcblk0p3 rootwait rw systemd.show_status=1 console=tty ignore_loglevel earlycon console=ttyAMA10,115200

With all these patches Bluetooth and Wifi are working fine (tm) with
firmware files provided by openSUSE Tumbleweed.

All comments and suggestions are welcome!

Happy hacking!
Ivan and Andrea

[1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
[2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/pinctrl/bcm/pinctrl-bcm2712.c
[3] https://lore.kernel.org/lkml/20240605120712.3523290-1-florian.fainelli@broadcom.com/#t
[4] https://lore.kernel.org/all/bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net/


CHANGES in V3:

--- PATCHES ---

- The V2 patchset has been split into two. This patchset (V3) contains reworked
  patches 1,2,7 from V2 while the remaining (again, reworked) patches will
  respawn as an entirely new patchset.


--- DT BINDINGS ---

- brcm,bcm2712c0-pinctrl.yaml: emmc_* pins are specific and do not provide
  other alternate function, so the function property can be dropped for those
  pins.

- brcm,bcm2712c0-pinctrl.yaml: fixed the schema ID reflecting the current
  filename.


--- DRIVER ---

- pinctrl-brcmstb.c: wrapped a couple of lines exceeding 100 columns.


Andrea della Porta (1):
  arm64: defconfig: Enable BCM2712 on-chip pin controller driver

Ivan T. Ivanov (2):
  dt-bindings: pinctrl: Add support for Broadcom STB pin controller
  pinctrl: bcm: Add STB family pin controller driver

 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       |  135 ++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/pinctrl/bcm/Kconfig                   |   13 +
 drivers/pinctrl/bcm/Makefile                  |    1 +
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1197 +++++++++++++++++
 5 files changed, 1347 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c

-- 
2.35.3


