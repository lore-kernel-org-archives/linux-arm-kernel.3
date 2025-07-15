Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B17C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uvjjouxvZp03dNr4GPQAUqRZmBS74KdM8wrzyT4z5C0=; b=rg9JReqeYSRiqFotY4oa3c+xFi
	OYL8iZvhmet2mMlcHBR0tGEY8prC/Brht1jQrbTVqwxcKowEBKBn7JnWoRavoIx5QsrqIBmJvngqo
	d8OuXLBbTfAAeC5m8s2mNyslhvpNiAfeKl/Xvc6mpRbYbwLOnQ7iGrDLzJgEmfNdARHikD345lVoO
	0mwRZCjXGbi8BwErHvsQ0RCGlCh8F8tlhGqI8vO9LoY1Yb04bZJNYU1FO0woLwVOrZBvcdxRnG6TC
	tIrAvre9jfCMJDIoFgcsd5ulgnRCNk79TXbPo/2kKIpS3H2BUFm1qAb2/KvGrMzD1lfTLx3yLNpZl
	F71s3wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublC6-000000062U4-3qcA;
	Tue, 15 Jul 2025 19:20:02 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkPm-00000005u72-0CIM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 18:30:07 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ae0dad3a179so972959566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604204; x=1753209004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvjjouxvZp03dNr4GPQAUqRZmBS74KdM8wrzyT4z5C0=;
        b=fwy3wc8OGeI0G5vw2n3F2UU90ewG0Mq41m30ZuLyV5HcIScxWqf0O/WRMI7PSAptm3
         qEXWBPjge1NE2jbSyETlWaXvDtWJzXG1zuEi7P7DFf+8SouB6jUGFvuoU/kCt3sZctIA
         27KdMkpFo1D2opMnC41DYuVUG0srkyjCEtHVKZirELoCFSlcxfBWqn6qG2VFk8oww2fq
         IwZ8GewbwyhYSTS9LDO8iegqaUv869eFBUQB402uc2s+qbuaEbtcZAwBKTdgEZ/gjnU8
         qyeeuGtSdztwRLWjJMLcnzOJlqCRbSjPWsjyG3CoJUQrKs5bHKllVvnllZ5A0AK1a6RC
         HVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604204; x=1753209004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvjjouxvZp03dNr4GPQAUqRZmBS74KdM8wrzyT4z5C0=;
        b=Ebm7d3aiXobOXmVt67/tS6F8KAFoEd3omDjELkayQsGKP2ZIRaxmUf8HbNC4k+kVyy
         K3C5m1WRj1i0eBCvfjkET/PHsiPvQml+OI5SjLMajcWPFgkVA+QMufAsa4zIdXUH2TOz
         0Wg9zHugoRtUOBhasC1A57SjtToy0M+bYIRIEioU5S+mAqT7YiBPgnHfRUSdi7B2MSJi
         V6Ywgkk/hZzjp2/myyAgLrD3b/QPnpZb3yFdJoHcHqNt+Zkh/WYvlh2xw4SIay9PtWQ9
         QRlUNPuo0Zs+zX9q+BmMDWdiIj8InAFb0KhfuH98DZGII+MnC4f4gDhMTkgyz1p00CIO
         rbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRuSYvx5JGNPd7DR0Ig/DQuC6ghIU73EmL5PE8QX/yO7vJCTpoZ4B7AuFn4O1hDbs3A2xbB5m9Miquz8BKTPb4@lists.infradead.org
X-Gm-Message-State: AOJu0YzTRwn8Tw1BEL8Un4sQ+auY227HZZmLNFfQw8qu1omI6Cl8Ilx4
	gUfHRxxnd0AkNsY4jEUxZVtgszGdtkKsTchzIXvZP5OVoBxzIdgPwnlOeb7d4NDzdGk=
X-Gm-Gg: ASbGncsA4AsYA6PAEBHy0I/WU2UCv+T+rWWeQncdqvmpWuRsSN3IkZisHTR+OxRDhLl
	MOqE7ahB7Prhj8GYt1Zua2dAsGOxUzbmrYbVJ9OmZtVJ5OLSC5pA0Mf3Q57qf35pRsJ75GHexsp
	Z4czEssLBB4u1IiLguhFg6Bd1t7MzRb2vuiyDwdUQlzsLnTOOmrraPQQfznmWCdoDi0feTmqe3F
	RqTTJHv1/XAz0eqYnRMHDcAMa/FPsWNSblCP01Piu9UFYSquCRJzqwKKCnm4X3svPEjltg41xjJ
	LOcc3Svbf0FcITws3QDm8PS4ELxWsSuP6BMlWHyiXhJPgvdHt9c6sl9GiboALvNLSHps5P0OIEq
	oIiwr+l2kuTimIRclzVCX8dvVVmcMYNR2HP8yzFCR9MKQ0dqFKA/fLXxKf+LQJxEp0E/j
X-Google-Smtp-Source: AGHT+IGFJbWKXB+kQL0O549amLz17SFCU/R3WUlLT6+iJaf7qSYAHhdJnbOpegB9FUbKE3rnsTsc4w==
X-Received: by 2002:a17:907:7f86:b0:ae6:f163:5d75 with SMTP id a640c23a62f3a-ae9c995443fmr57569466b.11.1752604203618;
        Tue, 15 Jul 2025 11:30:03 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df56esm1041676366b.156.2025.07.15.11.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 0/7] Add pin control driver for BCM2712 SoC
Date: Tue, 15 Jul 2025 20:31:37 +0200
Message-ID: <cover.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_113006_094498_5E0D44F5 
X-CRM114-Status: GOOD (  22.51  )
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

Hi,

The following patches add a pin control driver for the BCM2712 SoC and few
pin/gpio Devicetree nodes for Raspberry Pi 5.

Device driver is follow up version on what Andrea posted in April [1].

It is based on sources from here [2]. I just made few cosmetic changes
and addressed review comments from earlier submission. I don't have
documentation for this controller.

Patch 4 wire up power button on RPi5.

Patch 5 adds WiFi Devicetree node for RPi5.

Patch 6 adds Bluetooth Devicetree node for RPi5.

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


CHANGES in V2: (all patchset is based upon linux-next/master)

--- PINCTRL DRIVER ---

- dropped bcm2712_c0_aon_sgpio_pin_funcs[] and bcm2712_d0_aon_sgpio_pin_funcs[]
  struct array definitions since they are not used anywhere.

- dropped 'arg' variable in brcmstb_pinconf_set() as it's not used.

- updated copyright info at the top.

- several changes in the declared macros. Renaming the macro name and the
  macro parameters to better reflect the semantic.

- reworked MUX_BIT() macro to be more streamlined and easy to
  understand.

- added PAD_BIT() macro to avoid code duplication.

- renamed 'lock' variable to 'fsel_lock'.

- added some comments about non-existent pins on D0 silicon revision pin
  declarations.

- brcmstb_pinctrl_fsel_set(), brcmstb_pull_config_set()  and
  brcmstb_pinconf_set() (and functions that call them) can now return -EINVAL
  as error.

- added myself as MODULE_AUTHOR.

- dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
  compatibles are permitted now.


--- DTS ---

- moved 'clock-frequency' property from (uarta) board dts node to SoC dtsi node.

- added 'brcm,sdhci-brcmstb' compatible and 'clock-names' property to mmc node
  to avoid dt_binding_check errors.

- added 'brcm,bcm7445-gpio' compatible to gpio node to avoid dt_binding_check
  errors.

- renamed all pinctrl pin nodes as per yaml schema (*-state and *-pins).

- changed 'brcm,bcm2712-*pinctrl' to 'brcm,bcm2712c0-*pinctrl' since the
  former was more of a fallback and does not reflect a real silicon revision.

- moved status="okay" to the last entry in 'uarta' node.

- removed 'local-*-address' property from everywhere.

- dropped 'skip-init' property in 'uarta' node since it does not apply to
  linux kernel.

- renamed 'pwr-button' node to 'gpio-keys' and 'pwr_key' node to
  'power_button'.

- dropped an userspace related 'brcm,gpio-direct' property from gpio node.



--- DT BINDINGS ---

- binding schema file renamed to 'brcm,bcm2712c0-pinctrl.yaml' to reflect the
  compatible name.

- dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
  compatibles are permitted now.

- added example section.

- moved allOf: block at the beginning of the schema.

- dropped some unnecessary new lines.

- replaced current layout to describe the pin subnodes with patternProperties
  (nodes now end with -state and -pins).

- expanded the schema description to give some context about STB family of pin
  controller and added some details about C0 and D0 silicon variants. This is
  also reflected in the commit message.


--- MISC ---

- enabled CONFIG_PINCTRL_BRCMSTB in arm64 defconfig.


Andrea della Porta (1):
  arm64: defconfig: Enable BCM2712 on-chip pin controller driver

Ivan T. Ivanov (6):
  dt-bindings: pinctrl: Add support for Broadcom STB pin controller
  pinctrl: bcm: Add STB family pin controller driver
  arm64: dts: broadcom: bcm2712: Add pin controller nodes
  arm64: dts: broadcom: bcm2712: Add one more GPIO node
  arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
  arm64: dts: broadcom: bcm2712: Add UARTA controller node

 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       |  123 ++
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  134 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |   48 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/pinctrl/bcm/Kconfig                   |   13 +
 drivers/pinctrl/bcm/Makefile                  |    1 +
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1195 +++++++++++++++++
 7 files changed, 1515 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c

-- 
2.35.3


