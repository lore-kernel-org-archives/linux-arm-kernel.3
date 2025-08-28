Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D6ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zxMgUQNGs+/LED5NKHdUH6VeR0hnjbGDh/r6ylHR0gU=; b=fXPY4Ifw6qjZFhgGyzMhL4X9Ql
	Tq5YVQDqg0SrjMeGT1xB8gvJHNKuuuJKpb2FB+CsafLghbTEZxmvpgUnN3gZMtfMeOkg/QTxGnyfG
	S+WkNYTg8GuOm2RiRaseUiVYTlTaKw5TRTW7B5iPwyOiFjD+rMtdnZM/PEabND7m6h5J6I8D5EIYH
	lHSxbY6hN+GRgqKm4FXHJtCtUM4USF0783nbHCbvlCKaAVgReJn2tFmloSc9ADue0uZGd4rVqAGfg
	N97FYK5vksPnjx/qoIo+HKUYN9+z6oLFGDXmC7CX4IzCSF2OjceqpDGay1oxfRZK97mgy0ad7BPfE
	Vo4eT7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNb-00000002SJu-1nAD;
	Thu, 28 Aug 2025 17:25:43 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urc0l-00000001bjz-38QZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:45:53 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-afcb7a16441so123421966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756385150; x=1756989950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxMgUQNGs+/LED5NKHdUH6VeR0hnjbGDh/r6ylHR0gU=;
        b=ZWiRMxcGf7umglFsF/7X6nedvKZSCOWFtpfObWKG/QIbZfJ1RkfLvDGyjLK2YRn7Bp
         XOb65dYdgAjV853bBJsklZ7Gh9amxoDAMQdZKj3fxJCtJ2t4m3jJZYV8fij75viBQX/o
         SDpMNjH0arovBFllB0podUvQS8J5dhpew6NTo0IOkFRLcqBZBIxgThlYRVEwMz7p+ek5
         jkgRiiiFZpGSFi3psqVnVoQl9anxgTvdtj8KjdAfzE4vXM1pcspIDQI1KtSA8RMCAixa
         oawGoDx5cRYalzQpJIPeEYQPZmd+rjfBuEpy52nYNO6MF9/QEJZFnwY/mvZbR1eYWCWC
         CZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385150; x=1756989950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxMgUQNGs+/LED5NKHdUH6VeR0hnjbGDh/r6ylHR0gU=;
        b=CsDZ3up18ANzK2M10pWJICna1KngqoR3llpYbeDGyGV0MCRhCye3fAoRICmqgY9+Bu
         UyE76BfyJzzRwcc5ZJ7IeHoPTFI61T2kGVm4BIvb0E5ltFS2xkxontfuhIxBpVPj9/al
         13R1jD5pNo2ewz1ze97ZrTAUNJ5gXJruCtTQiVpNK+3qCGCKLGXCkcAppLgKUuPPUvfq
         p1JqqolIhT3q2932ubDDY8NzZ7hrnPUzO/FzQvkrSTMu3wvJ1Sj6yz4mBJYhSNhaQ7H2
         wVGv3e9EbLOjLFB0lu9+5gNda1SwUYtuA8a1/ZnKO/xlDcA9dD3E3obOtFihCdo8pIkZ
         Z2ow==
X-Forwarded-Encrypted: i=1; AJvYcCWRVqo9GIUpaEog0QgUSpIdugPO96jAmRKnU0HbRW67VnIh7DvNJs+lHb+Sbki8J0vxthU7bC1LFvta+FVrXMv6@lists.infradead.org
X-Gm-Message-State: AOJu0YzcQBDqECEPqeYU9zLAU2HnnsBQzuOsE3zv9P/XM7bP0vQkanpZ
	FAam1GOxkvfxRaTp94SNsMMsbF3LIvjohbmlLVWaJz2Ao4ROklLYYwzlOjfn71M4Bac=
X-Gm-Gg: ASbGnctivdXjoksLgiz8860tNY+U+iWW1Wn2yMkeaA8vBxgK91h4CUtujQ6hqUbd1of
	cLTfeIcoq3Xbk6RS2aGs1/6O/uyx2Vy/JkqKElAXjxBp6aYvMeA5IrvzDSUx2xVjUkcwIwya7Nl
	sD9Szqis7QVKBdJbEB6e0f6/nwMKgiwhyic582kmO0Jb00CZ/TosMfT17eUlmdzQkdueZojYFou
	eIyquET24m3NYMzr7dT3KdZXCQPgGeCM8dE+/snsmO6b7QHeFfm1qQeMOmYCLfNfP5uzWkY7T3M
	1Mo/pJ6TSBDXnk76rq9+akbXIhvujZ/892Dmp+80AGR4Gch0qtmZPvxLIW+doDDAmzxhOy9KwcK
	KsUTDFl438MUEw25NIJfkSWNXFgSzxnLyYN4VOjzUTotuokPhqMHCkb54cwpOpi7dC9wy9Pf/sZ
	Aa6FuyIND8+/kh4/bsIW7rWAcoE00=
X-Google-Smtp-Source: AGHT+IFNXCBJMNU1/4HwvWWNwfSpQcVmgREcwXGBCSgjS6mOZ411UNk3uqdbyTb5lvmvsiIGiXV3HA==
X-Received: by 2002:a17:907:94c1:b0:af9:38ed:5b49 with SMTP id a640c23a62f3a-afe28f75e24mr2013120566b.5.1756385148815;
        Thu, 28 Aug 2025 05:45:48 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8f8129f0sm731229266b.41.2025.08.28.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:45:48 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add pin control driver for BCM2712 SoC
Date: Thu, 28 Aug 2025 14:47:37 +0200
Message-ID: <cover.1756372805.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_054551_790928_068906B3 
X-CRM114-Status: GOOD (  25.02  )
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

The following patches add a pin control driver for the BCM2712 SoC.

Device driver is follow up version on what Andrea posted in April [1].

It is based on sources from here [2]. Since its first inception, this
patchset has undergone heavy rework in order to split the driver in a
generic core API useful for several STB pin controller and a specific
implementation for BCM2712 SoC found on RaspberryPi 5.

A separate patchset will add peripheral nodes that rely on the SoC pin
controller to setup and config the pins.

All this have been tested as kernel was directly booted RPi5 via
kernel= config.txt option and cmdline.txt file with following content
(Note I am using Tumbleweed RPi raw images)

$ cat /boot/efi/cmdline.txt
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


CHANGES in V4:

--- DT BINDINGS ---

- brcm,bcm2712c0-pinctrl.yaml: added blank lines between paragraphs in
  descriptions.

- brcm,bcm2712c0-pinctrl.yaml: descriptions are now layout in the same
  order everywhere.


--- DRIVER ---

- pinctrl-brcmstb.c: this is now the core driver that will manage the
  generic functions of any STB pin controller. The new pinctrl-brcmstb.h
  header contains the APIs that can be leveraged by specific implementations.
  I've applied quite a conservative approach in determining what is generic
  and what is not. It's easier to specialize some generic code when we
  need it that the other way around.

- pinctrl-brcmstb.h: new file! Header contains the APIs that can be leveraged
  by specific implementations.

- pinctrl-brcmstb-bcm2712.c: new file! The custom implementation for BCM2712
  SoC. It specifies the pinsi/functions for this chipset and calls the probe
  function from the core driver. Some values are now set from this file
  since they are considered chip-specific, e.g. func_mask, func_gpio and
  func_names.

- PIN macro renamed to BRCMSTB_PIN.

- enum brcmstb_funcs renamed to bcm2712_funcs.

- avoid wrapping some lines above 80 char containing GPIO declarations for
  the sake of readability.

- renamed the chipset specific structs from brcmst_* to bcm2712_*.

- AGPIO_* renamed to AON_GPIO_* and SGPIO_* to AON_SGPIO_*.

- FUNC macro renamed to BRCMSTB_FUNC.

- brcmstb_reg_rd() and brcmstb_reg_wr() have been inlined, substituted by
  their inner implementation based on readl/writel.

- spin_lock_* replaced by guards. Asa a result, the flags var definition
  is dropped.

- implemented .function_is_gpio() in pinmux_ops. As a result, this driver
  is marked as strict.

- used of_device_get_match_data() directly in place of retrieving it through
  of_match_node()->data;

- added a comment to better specify the differences between AGPIO and SGPIO.


--- KBUILD ---

- Kconfig.stb: new file! to be included by top level Kconfig to enable
  the Broadcom STB specific drivers (e.g. BCM2712 pin controller). Enabled
  only if PINCTRL_BRCMSTB is enabled from top level.

- Kconfig: amended to enable the generic support for Broadcom STB pin
  controller family. Includes Kconfig.stb.

- Makefile: added pinctrl-brcmstb-bcm2712.o



Andrea della Porta (1):
  arm64: defconfig: Enable BCM2712 on-chip pin controller driver

Ivan T. Ivanov (2):
  dt-bindings: pinctrl: Add support for Broadcom STB pin controller
  pinctrl: bcm: Add STB family pin controller driver

 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 137 ++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/pinctrl/bcm/Kconfig                   |  12 +
 drivers/pinctrl/bcm/Kconfig.stb               |  10 +
 drivers/pinctrl/bcm/Makefile                  |   2 +
 drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c | 747 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 442 +++++++++++
 drivers/pinctrl/bcm/pinctrl-brcmstb.h         |  93 +++
 8 files changed, 1445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/Kconfig.stb
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.h

-- 
2.35.3


