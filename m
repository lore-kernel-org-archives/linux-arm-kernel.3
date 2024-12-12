Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26CCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EI22DQzZVDVnTxt6RUW2tG/G1/4buJh4utbAY1WkjKk=; b=XgmLh3yZShtMymGI9rYqn+K3Vz
	Rh5utxOXvvYMe0xfGZESxVC/Jcw6aALEvkCZcN/vv4v2hLeEsui0Xf+WFJYMnUIUb6+UUnU2VF5/U
	2qKjkyDPp9SRjsgE4i5gPwDPB9IW/rO8in1uGHOe6pseyd71+EnZxG/1RQXaGkALvKTxTyrvEPl6G
	dLjRPZ9sbVT5uMvq8LcuNZx5HCrZA0kXLKbg5yIqvqjelCFLX6NwTC1dvhkfFVA2c9HKVSWDx8ACn
	dAoUSCvJb0jKNIyEHd59eNWY3lriuw/4p+UwrQdyZNgnpoVzwV+tQBbw9pZ/iRHzalrU+vdLOX3XZ
	BbLqVInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgDc-000000001Oo-2VJc;
	Thu, 12 Dec 2024 10:14:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgCT-000000000z1-2Rgw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:13:43 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3004028c714so3509781fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 02:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald-eu.20230601.gappssmtp.com; s=20230601; t=1733998419; x=1734603219; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EI22DQzZVDVnTxt6RUW2tG/G1/4buJh4utbAY1WkjKk=;
        b=yoNK5w6eoMBz2Enn+5U64wEe1IfOytYIoVTZclw8tRnwMtVbiLhQyWVCJtdWw4uSPi
         VSHDh+CqHWC3+fTZBeT9HZe+FAOMPrYlRs8nMXuJtq4htAYK8xIINV/PxDj0CILgXP1u
         gULd/B0WFGAlMFOqJP5dfO7KPpfKRmXLD/pVx6xQM2UiwvSm8k9zCqsNOtp49Dmu7mlC
         3TogaAnFvSqoYB6r8Bg0vJ2uF1fnejjz+UNsjAhFsTK/oGDX6vbl/tZnobcp2pPfA+mZ
         5a5zObhG9J7kVEGLaVu5ItDxy9ABb4Y/r8zEnc5lsY7jovIJmYNt+IcnGwdT7daMQwkx
         ydvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998419; x=1734603219;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EI22DQzZVDVnTxt6RUW2tG/G1/4buJh4utbAY1WkjKk=;
        b=xLUVnSepGgBrBnMKIOmyqe3PkdexY5k6sZU4+6ALc8Xr6u+KIXnw4oKGstmv76T1NB
         BOIoY2xvHgrTKzQ3RgwXw0FV/03UYhbeAzu3PSiLx6/wFT/c97AY9bMB9qRnFrhw9sgT
         Yv46WgxANJ4L0kEkIIq+tdpxjvmqLLqJGLH5gvZqBU+pGyd129vA2OHcuq85rurdq+fO
         6yhvgoLgn+Tyy0ffwZ4I8j+2E6T1fHzLB2KjbGgBxNICa+of0tjJJbBF3a4o/kpIWG6G
         sUHaVyhEUvUeSBcdTnM9dIJrnGb9PDzIdD90KZ7yZmQL9IIiDF1TLIAGcaLx/z5n+qvD
         gYLg==
X-Forwarded-Encrypted: i=1; AJvYcCVtsLJAbttT8sPULPE7qA0BZZycdR0I52lelC10NtvhzmXsMnZ6PvkFRQgHm4lJyyVqhBE1kW4v8d5czysAayS8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq/xR7s68BapDoNJbOFRYlSR8UjCuam+O4xpMTkEFD+UBIVlAe
	hl8dR3HpA4lqP0Z2E15kxx5bm/5Z3MS1XMUjk+QrUYZOPwO4jsqvK4VH3OxQQU20fvCr4I0FHsa
	Ocpn8rZWJ5UOrXRHuTTLjBQqsQosHm8MsYEmZWA==
X-Gm-Gg: ASbGnctSwkgQW3kbjxafrWoM9PPQlugXCatRMT1XZtnlDca6QXlBNUu6m1EpqQHww5h
	yqD2F5k9BlHEYtevrbfRPCBAJX+Tnqzw4E1YO94H8hJdawDkRlJ8KCjwMe9a6VMRcDePy+w==
X-Google-Smtp-Source: AGHT+IE3hiuuk4G/KOtpfY7TlYPOOY0d5gVRWjcYEGOWpovgfyQ6kA/hV98D39NWqWy30GJxW18y+khOQn1iZgitaHc=
X-Received: by 2002:a05:6512:1089:b0:540:2160:1f80 with SMTP id
 2adb3069b0e04-54032d49048mr218103e87.40.1733998418616; Thu, 12 Dec 2024
 02:13:38 -0800 (PST)
MIME-Version: 1.0
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Thu, 12 Dec 2024 11:13:27 +0100
Message-ID: <CAFERDQ2hLHek+0ViVqbqgOD+4xwC2ZwK1KhgGdLP_zGnonEs4w@mail.gmail.com>
Subject: Raspberry Pi 3B: Failed to create device link with soc:firmware:gpio
To: f.fainelli@gmail.com, saravanak@google.com, stefan.wahren@i2se.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_021341_886217_5D05FC40 
X-CRM114-Status: GOOD (  13.66  )
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

Hello Saravana and Florian,

Back in 2023, you discussed about an issue concerning the Raspberry Pi 4, that
you fixed in commit 1a5ecc73b2bfeffe036212d4a6bfacee053ab0a1:
https://lore.kernel.org/lkml/03b70a8a-0591-f28b-a567-9d2f736f17e5@gmail.com/
https://lore.kernel.org/all/20230302023509.319903-1-saravanak@google.com/

Today, I notice I see the same issue, but it's with the Raspberry Pi 3B (V1.2).
I'm using the upstream kernel 6.12.3, with the upstream DTB.

You can find my kernel miniconfig (basis being allnoconfig) here:
https://gist.github.com/mwetterw/299bb1317fccf9e68125cb0f5da7384c

During boot, I see following messages:
> Bluetooth: HCI UART driver ver 2.3
> Bluetooth: HCI UART protocol H4 registered
> Bluetooth: HCI UART protocol Broadcom registered
> bcm2835-mbox 3f00b880.mailbox: mailbox enabled
> 3f201000.serial: ttyAMA0 at MMIO 0x3f201000 (irq = 99, base_baud = 0) is a PL011 rev2
> raspberrypi-firmware soc:firmware: Attached to firmware from 2024-09-13T16:00:14
> uart-pl011 3f201000.serial: Failed to create device link (0x180) with soc:firmware:gpio

Here is an extract of the relevant FDT nodes.
Because my setup involves first the proprietary GPU firmware, then the U-Boot
bootloader before finally launching the kernel, I used following command in
order to make sure I see the same FDT as Linux:

> ssh rpi 'cat /sys/firmware/fdt' | fdtdump -

> firmware {
>     compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
>     mboxes = <0x0000001b>;
>     phandle = <0x0000001c>;
>     clocks {
>         compatible = "raspberrypi,firmware-clocks";
>         #clock-cells = <0x00000001>;
>         phandle = <0x00000015>;
>     };
>     gpio {
>         compatible = "raspberrypi,firmware-gpio";
>         gpio-controller;
>         #gpio-cells = <0x00000002>;
>         gpio-line-names = "BT_ON", "WL_ON", "STATUS_LED", "LAN_RUN", "HDMI_HPD_N", "CAM_GPIO0", "CAM_GPIO1", "PWR_LOW_N";
>         status = "okay";
>         phandle = <0x0000000a>;
>     };
> };

> serial@7e201000 {
>     compatible = "arm,pl011", "arm,primecell";
>     reg = <0x7e201000 0x00000200>;
>     interrupts = <0x00000002 0x00000019>;
>     clocks = <0x00000007 0x00000013 0x00000007 0x00000014>;
>     clock-names = "uartclk", "apb_pclk";
>     arm,primecell-periphid = <0x00241011>;
>     status = "okay";
>     pinctrl-names = "default";
>     pinctrl-0 = <0x00000008 0x00000009>;
>     phandle = <0x00000048>;
>     bluetooth {
>         compatible = "brcm,bcm43438-bt";
>         max-speed = <0x001e8480>;
>         shutdown-gpios = <0x0000000a 0x00000000 0x00000000>;
>         phandle = <0x00000049>;
>     };
> };

If I understand correctly, the serial dev bus, together with
CONFIG_BT_HCI_UART, CONFIG_BT_HCI_UART_BCM, and if associated to the correct
DTB nodes describing the bluetooth chip, should allow the kernel to handle the
serial Bluetooth HCI himself, without the userspace needing to launch user
space tools like hciattach or btattach?

Is the log

> uart-pl011 3f201000.serial: Failed to create device link (0x180) with soc:firmware:gpio

a hint to the reason why the kernel doesn't automatically handle my Bluetooth
HCI over serial?

How to solve this log error, and how to let the kernel handle the HCI himself?
Am I missing kernel configuration flags?

Thanks!
Martin

