Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2CFF9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sqQq5HGX+Ci1/1k/Numf15XVR5WRhqIHMn+i1ToKbQ=; b=aBaPC1KujWBSFVxRamA/6Laxam
	fyCLirIGTHtWm6sQfMYdQ/2IfOxRlxc/abRi756F9VXPRkyO8E0ST0gBdNUnry7wpwnU1Z/48w+wk
	Baockphmmk7yyV8oVXVPa1qeU1KGjrYo5VU+87ILfCqfpbFbsc05qiutPGR1Z+02h2l9KGu+tv1xd
	TudyutsLR1Yh3g2IkGQ+/s/eICL4Tmi7PTAI1ZfN6M5IHnXQWpKDsmnvrKPmFODkuprr/U27BJT3w
	P+ECtIzsx3PchdE4dBB0BvLoWtbtjM7pa2v4DBYvHJYZbNVfkKt0t5+lmcFVjS4gtXV2Hc9L/dxsZ
	DQsAbrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3s-00000000E1S-0PLh;
	Tue, 14 Apr 2026 21:12:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3n-00000000DxO-05f0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d43e09de5so3610480f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201157; x=1776805957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sqQq5HGX+Ci1/1k/Numf15XVR5WRhqIHMn+i1ToKbQ=;
        b=PCZhA/X9TcTJgM+ytKla53qHXSFO1vRVGaE3qaZXEAT4uh4YCwoqID7HGZV2/+LWoR
         TfWyuYB3Itfdj9l6mlqxExSuQEEty0sPMKFjUP0ZTYBMUjmSzjPa9MLA9e8KeDyk7IIN
         nTDw8X/tRSTAFpgxZdrjxDIVvrZK18DwOHfTb8A6YVV6OCX4GSrwS2p8Kk2OPx+Y+63z
         5028U6+UGoOJZMxOXaVGMkKIU9u7dl1oQZzsGoDV9EsKfKF6f2cTMnthM+3t91SFdVqF
         jEsieZgUDnuJhL5LnmjbqtSPu8W7zYYC8FRdI/hNvyuUPiiaUyefDDJwaAkNC114fhiZ
         iFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201157; x=1776805957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+sqQq5HGX+Ci1/1k/Numf15XVR5WRhqIHMn+i1ToKbQ=;
        b=oR/5hFc4Gs6FYWE0vq5kePlC+icmtyh0eFAH02Z9C3H3mrA8IkAYYo3cIRc0BgsUTx
         HXX3kP3TyySPy7UPzqfBs02CSYMnTLOEIHRViz4HCGX+EvDAZi/pM0/FYVUTAv3l9zuW
         ktc6UQGpAGuQPGsn++4hDvn43LIAsNYN5xV7/EsppZVzf2W97Qo4PAI9pDQ8cdRiBHVw
         kDAp2IoHWwrLtnxqVnDH2msvxr73YZi+EB8ITX8Z5RTuBc0QOhcVhUFaiBrkSF5xeOHE
         6fqtzeyMRwgwIvggXFiCpXDcWLEzZv3zCpESBl/xAiXm4MqW2kZRYc6h2VOBJn6p5PaF
         zxmA==
X-Gm-Message-State: AOJu0YxnaUW5HgSwPjflkGpqgBIBUpnFbazeYd7wITwxNPc+brIGXwjz
	dYwNBDrhZRv4qG4Z/q8u7ARVUO5vehE1qsjpxD8/7C3xbbnEX+z9XAuH+M7EkKAx
X-Gm-Gg: AeBDiesMXvauBG9F7vCWY9jr1PAN3O5as5DmDflOOQsn7XtLq4JX7XL3BfxjQlL7jma
	beE9QO33rSbXiYOnOJUO67iRt0uWnmfgokcJzG/+IUzlv0XZqesBncNWtFLjZidNc3ELvFKMpWV
	ZwRYv0tfSqTzPue//78EXrQ7hrqern/6F+nRfCTpJcrMwe+EZlJNyn1eDt+d8NFShEXeDC7uvtl
	pvV3Ac16i/mjmqXR/YkM4JPTDmbketget4XWWIw5o7m7x6V8aSuGqkRdOWJJHa4yFuRX03PzALt
	d90RbutKl9hXmiBzZlC8TaSHcrLuQLJiU7pIXdpmlDYyYJTuC5x+19Oo2w7V+OLZELUsr//rGI/
	iC/0rJNvP+IkGQxtUeKFngPDzrAgSGu3DhUX9RtzjBCEWJ0B9rJr4eu7qT8xWqdoiPINrlZNCiB
	CF69JWH5KOiPiDQMi4ey64iD5bzKrolxT6lZsLw/JRyW4=
X-Received: by 2002:a05:6000:2305:b0:43d:30d1:857c with SMTP id ffacd0b85a97d-43d64259dc9mr28734211f8f.7.1776201157295;
        Tue, 14 Apr 2026 14:12:37 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:36 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 8/8] ARM: defconfig: Add a zx29 defconfig file
Date: Wed, 15 Apr 2026 00:12:15 +0300
Message-ID: <20260414211215.152850-9-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141239_077032_35250B86 
X-CRM114-Status: GOOD (  13.60  )
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

This enables existing drivers that already are (UART) or will be (USB,
GPIO) necessary to operate this board even if they aren't declared in
the DTS yet.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/configs/zx29_defconfig | 90 +++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 arch/arm/configs/zx29_defconfig

diff --git a/arch/arm/configs/zx29_defconfig b/arch/arm/configs/zx29_defconfig
new file mode 100644
index 000000000000..dae2d86c7583
--- /dev/null
+++ b/arch/arm/configs/zx29_defconfig
@@ -0,0 +1,90 @@
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_MMU=y
+CONFIG_ARCH_MULTI_V7=y
+CONFIG_ARCH_ZTE=y
+CONFIG_SOC_ZX297520V3=y
+# FIXME: There is no PSCI on this board, but ARM_GIC_V3 depends on it
+CONFIG_ARM_PSCI=y
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_CMDLINE="console=ttyAMA1 earlyprintk root=/dev/ram rw"
+# CONFIG_SUSPEND is not set
+CONFIG_BINFMT_FLAT=y
+# CONFIG_UEVENT_HELPER is not set
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_CPU_FREQ=y
+CONFIG_CPUFREQ_DT_PLATDEV=y
+CONFIG_PM=y
+CONFIG_PM_CLK=y
+CONFIG_PM_GENERIC_DOMAINS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y       # FIXME: This is specific to my initrd. Remove before upstream
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_KEYBOARD_GPIO_POLLED=y
+CONFIG_GPIOLIB=y
+CONFIG_OF_GPIO=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_MFD_SYSCON=y
+# CONFIG_HID is not set
+CONFIG_PINCTRL=y
+CONFIG_GENERIC_PINCTRL_GROUPS=y
+CONFIG_PINMUX=y
+CONFIG_GENERIC_PINMUX_FUNCTIONS=y
+CONFIG_PINCONF=y
+CONFIG_GENERIC_PINCONF=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_POWER_RESET=y
+CONFIG_RESET_SIMPLE=y
+CONFIG_LEDS_GPIO=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_GADGET=y
+CONFIG_MTD=y
+CONFIG_MTD_OF_PARTS=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_SPI_MASTER=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_PLTFM=y
+CONFIG_STMMAC_ETH=y
+CONFIG_STMMAC_PLATFORM=y
+CONFIG_MDIO_BUS=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_SRAM=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_JFFS2_FS=y
+CONFIG_CONFIG_TMPFS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_PRINTK_TIME=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_ZTE_ZX=y
+CONFIG_DEBUG_LL_INCLUDE="debug/pl01x.S"
+CONFIG_DEBUG_UART_PL01X=y
+CONFIG_DEBUG_UART_PHYS=0x01408000
+CONFIG_DEBUG_UART_VIRT=0xf4708000
-- 
2.52.0


