Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6BFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGtZBGKyhIZ2qBmToRF5pPNhe8YR+CyLhhQQdpkOTOg=; b=Xm3yGyy/C510TNvGGK4wi0bDXS
	hgSrC5Dp/VqUAOIeFRPabzArTDvcoxjHtS1PSmAGcxWNsi3aNjKixRQVxKYV6VBBCmR5A0pvLv9M/
	mwAXftfGWbWrLR+BxFFcx8KTudPcvM843Uj5qefqYPpmMkAt8pmEDpnnr8ZqdkCRnVZw2ZKhWQZrQ
	bhPyPDOtypdRalPXgsIT19U136Gb2MLNYvr97uxqFvBvOS3dp8YWq1WCbuF6vdbqwP3s48hOT8b3A
	AEMYqmyRNLapBfJw5InQqT+05s17k1wGQT5i81jUog4jrWV2vuO/Edd7Iu9VYZno3F6DsPy+WTzEx
	BDvj1vAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9wD-000000027Mr-47Oj;
	Tue, 22 Jul 2025 10:09:33 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9nH-0000000256s-2aJv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:00:21 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so9341342a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753178417; x=1753783217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGtZBGKyhIZ2qBmToRF5pPNhe8YR+CyLhhQQdpkOTOg=;
        b=Gc9wYMFqI60frPnQV2WYJ7eNoEqnqq/IJXxv9oEYheCZ2Vba+odlvP5slsRkH54JEL
         3eBJ/mO0pdseENth5l+g1zxr7wwRn234KmmiW7f83KU14B3W8DOeAkf3E+49oaKa4bmr
         uqpq+ZHppTtZ60IgQc77RSdmhY4N4q1w+4dleWTSsfsHA75OX4K5XVaFmRvIyJ+pwNq6
         lNLC0ru/I23Nn39iTu0Hh6RuU/ITIX87vdoGht5hEvTYwGdsSLasO4jGo/E4AWIMu/dR
         7XTFKGe82VojGL8N9uCyOwqUpdP/94MLiZ5XxQjtWx9o33VaVYcaphQaQ4x7eJUcLD/1
         Bm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178417; x=1753783217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGtZBGKyhIZ2qBmToRF5pPNhe8YR+CyLhhQQdpkOTOg=;
        b=ufqWaKR64gUNu4leDw0GkixcZS7mImbR6s1KpHVz9C7vRhATshpCT4YyUiFEkoamex
         5q4GStGG+l/Yf7ywR59X/7zmYN2OpftseBakKNuKm2b1Yu2m/1WtWM6/PRW+kjHKBTZb
         XBNrPa+yM9JXdgkO3OchR0I/RNnGDPvFr+nivkiwnbmjRg/YrD46SpQKB7vH08jvz0Z+
         LR4O0Sz4K++RzbPa2bpg37r3pf/FbfbPIlFzFEDGK3/gZdEw8H+iOXeKjZEtvxo0Q44B
         euhVtVsOyA79CeZV7+JnbEvI504UqlM9tQMERK7Om3jq17OL63Rnv9WTkVdMqZ68+czb
         7V6A==
X-Forwarded-Encrypted: i=1; AJvYcCVzhkSDuBCxt47Rwfcs9BBBVq4fIrin0OJGcKgAlcFW89D6YYp4m4LTUV/l0dmg4KAIpy3vl+AICV8aLfCK8Bee@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5CtzA9QVhSgMSWpEO34uqcjbbBlojfja+fZAw79Fo4NCS9qZx
	GcDwpwFRfzSEGxDBDuNoPML12eAGEMxNT+15oQD8ipZMVqxuX4B4G5ip6AOE7zVI34I=
X-Gm-Gg: ASbGncvx0sgmpDKoNDCh98mqkXa6LFASkB+xjwVIcj/HCCMESlxTqc/LIUUUdW2KoDJ
	ddpu9ec/gboQRselgG2DKnuJ1WNAB6jBjzcTkj2mN16yZiXE2/d+phfIydr/4oOuT07IJc5w4i8
	RZ3JHCUZwrgaWskuMLFykoVJ52HfrW8ZkWnAQZMRJxgYusqbZjnD/bydHjYD6k0CHiZpsvFVPsq
	Qw4oR0drCIxP7V1irL81pogncrhfboRNznrqKF6RROBIMFzC7WYVm8r8k0mxX47WKesRbxbJgKB
	EVF7C76DI0aQvkHdikCqXhlMdWS/oGOECJCgY3CRcw1bLHDJ9itvLMcR4T205EPFIzmeqiN9AFl
	HkXCp47b7tHgsp4ANQxzHdBUXHmMrc3TSuEdo0taX7bV6sNenNo2vLi5YVXtO2DElRToT5HYlpw
	5mXgQ=
X-Google-Smtp-Source: AGHT+IEYByDblsbsdG7luqkRNEVSZPdXvQIlF7+Af1ARSZWqI4XkQYoHGoB5zzWSTWUWze1gc9PnFA==
X-Received: by 2002:a05:6402:520c:b0:608:a7a0:48 with SMTP id 4fb4d7f45d1cf-6128262b18dmr22272866a12.28.1753178417281;
        Tue, 22 Jul 2025 03:00:17 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c90a8937sm6723101a12.64.2025.07.22.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:00:16 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 22 Jul 2025 12:02:01 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	wahrenst@gmx.net, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com
Subject: Re: [PATCH 0/7] Add pin control driver for BCM2712 SoC
Message-ID: <aH9hmVA2cEJipYiU@apocalypse>
References: <cover.1752584387.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030019_661557_D6494B3F 
X-CRM114-Status: GOOD (  35.13  )
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

On 20:31 Tue 15 Jul     , Andrea della Porta wrote:
> Hi,
> 
> The following patches add a pin control driver for the BCM2712 SoC and few
> pin/gpio Devicetree nodes for Raspberry Pi 5.
> 
> Device driver is follow up version on what Andrea posted in April [1].
> 
> It is based on sources from here [2]. I just made few cosmetic changes
> and addressed review comments from earlier submission. I don't have
> documentation for this controller.
> 
> Patch 4 wire up power button on RPi5.
> 
> Patch 5 adds WiFi Devicetree node for RPi5.
> 
> Patch 6 adds Bluetooth Devicetree node for RPi5.
> 
> All this have been tested as kernel was directly booted RPi5 via
> kernel= config.txt option and cmdline.txt file with following content
> (Note I am using Tumbleweed RPi raw images)
> 
> # cat /boot/efi/cmdline.txt
> root=/dev/mmcblk0p3 rootwait rw systemd.show_status=1 console=tty ignore_loglevel earlycon console=ttyAMA10,115200
> 
> With all these patches Bluetooth and Wifi are working fine (tm) with
> firmware files provided by openSUSE Tumbleweed.
> 
> All comments and suggestions are welcome!
> 
> Happy hacking!
> Ivan and Andrea
> 
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> [2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/pinctrl/bcm/pinctrl-bcm2712.c
> [3] https://lore.kernel.org/lkml/20240605120712.3523290-1-florian.fainelli@broadcom.com/#t
> [4] https://lore.kernel.org/all/bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net/
> 
> 
> CHANGES in V2: (all patchset is based upon linux-next/master)

Sorry, I've just realized this patchset has been sent with no V2 in the subject.
Anyway, I'm preparing a new revision (which will be V3) after amending it after
Rob's automated script warning.

I'll also split the patchset into two, oen with binding / driver for SoC pin
controller and another with thie remaining DTS related patches.

Many thanks,
Andrea


> 
> --- PINCTRL DRIVER ---
> 
> - dropped bcm2712_c0_aon_sgpio_pin_funcs[] and bcm2712_d0_aon_sgpio_pin_funcs[]
>   struct array definitions since they are not used anywhere.
> 
> - dropped 'arg' variable in brcmstb_pinconf_set() as it's not used.
> 
> - updated copyright info at the top.
> 
> - several changes in the declared macros. Renaming the macro name and the
>   macro parameters to better reflect the semantic.
> 
> - reworked MUX_BIT() macro to be more streamlined and easy to
>   understand.
> 
> - added PAD_BIT() macro to avoid code duplication.
> 
> - renamed 'lock' variable to 'fsel_lock'.
> 
> - added some comments about non-existent pins on D0 silicon revision pin
>   declarations.
> 
> - brcmstb_pinctrl_fsel_set(), brcmstb_pull_config_set()  and
>   brcmstb_pinconf_set() (and functions that call them) can now return -EINVAL
>   as error.
> 
> - added myself as MODULE_AUTHOR.
> 
> - dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
>   compatibles are permitted now.
> 
> 
> --- DTS ---
> 
> - moved 'clock-frequency' property from (uarta) board dts node to SoC dtsi node.
> 
> - added 'brcm,sdhci-brcmstb' compatible and 'clock-names' property to mmc node
>   to avoid dt_binding_check errors.
> 
> - added 'brcm,bcm7445-gpio' compatible to gpio node to avoid dt_binding_check
>   errors.
> 
> - renamed all pinctrl pin nodes as per yaml schema (*-state and *-pins).
> 
> - changed 'brcm,bcm2712-*pinctrl' to 'brcm,bcm2712c0-*pinctrl' since the
>   former was more of a fallback and does not reflect a real silicon revision.
> 
> - moved status="okay" to the last entry in 'uarta' node.
> 
> - removed 'local-*-address' property from everywhere.
> 
> - dropped 'skip-init' property in 'uarta' node since it does not apply to
>   linux kernel.
> 
> - renamed 'pwr-button' node to 'gpio-keys' and 'pwr_key' node to
>   'power_button'.
> 
> - dropped an userspace related 'brcm,gpio-direct' property from gpio node.
> 
> 
> 
> --- DT BINDINGS ---
> 
> - binding schema file renamed to 'brcm,bcm2712c0-pinctrl.yaml' to reflect the
>   compatible name.
> 
> - dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
>   compatibles are permitted now.
> 
> - added example section.
> 
> - moved allOf: block at the beginning of the schema.
> 
> - dropped some unnecessary new lines.
> 
> - replaced current layout to describe the pin subnodes with patternProperties
>   (nodes now end with -state and -pins).
> 
> - expanded the schema description to give some context about STB family of pin
>   controller and added some details about C0 and D0 silicon variants. This is
>   also reflected in the commit message.
> 
> 
> --- MISC ---
> 
> - enabled CONFIG_PINCTRL_BRCMSTB in arm64 defconfig.
> 
> 
> Andrea della Porta (1):
>   arm64: defconfig: Enable BCM2712 on-chip pin controller driver
> 
> Ivan T. Ivanov (6):
>   dt-bindings: pinctrl: Add support for Broadcom STB pin controller
>   pinctrl: bcm: Add STB family pin controller driver
>   arm64: dts: broadcom: bcm2712: Add pin controller nodes
>   arm64: dts: broadcom: bcm2712: Add one more GPIO node
>   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>   arm64: dts: broadcom: bcm2712: Add UARTA controller node
> 
>  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       |  123 ++
>  .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  134 ++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |   48 +
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/pinctrl/bcm/Kconfig                   |   13 +
>  drivers/pinctrl/bcm/Makefile                  |    1 +
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1195 +++++++++++++++++
>  7 files changed, 1515 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
> 
> -- 
> 2.35.3
> 

