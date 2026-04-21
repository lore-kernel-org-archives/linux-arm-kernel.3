Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6789CF94CAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44WhVXZvjCMS4S4DPww0qJ5SDrGxnVaZzuAI8zkpcIo=; b=bSIX5d0lIdKPCLgv2BuuRHEgUY
	DFMqpmubszZygw5I7kC4n9C4rNBFQkmwygp9mbN92qHaANS+hNUXK6Rjw5hdWAKUU0hx7d8iIHXt9
	XfL2Cqdw2N2KN/ln+4akEWtKHghkDaE5gYRKE6jKlogto0jjmR5uLRwcTW+OXdmCnEA6HMVa0arp/
	M0733oDKVNDgyqqJuyhuSkK7enHkAOhSUEIlnlTdI0kU47fNaPVX+B+w91bl/4Zg7eXKkyRd5yrth
	aGe8fSMWXgsKi90LQ3CoyzB4yYp5iWoR67h2FAmpFpMWLZux7KhTmcMwbzpFhQYLK6Ybsn4CAGhvl
	hCAO/e/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHeB-0000000985p-2IUS;
	Tue, 21 Apr 2026 20:24:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHe9-0000000983K-2IRX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso22401935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803076; x=1777407876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44WhVXZvjCMS4S4DPww0qJ5SDrGxnVaZzuAI8zkpcIo=;
        b=ccwgshykksGDeNl1iOzHNm8BA602RYFrhIGbSjp9+U8FXpDfVBtTJZNjTWdn+z2c8K
         cD7ZS8DS2Ji7Ft8yd9K3FQlrm6rgNi+n5s7aPMa1olmkHtDABtbR+Fgk1QpvpDorDAO8
         eM2cd3T36iF22cm/9ABVCHO8q9s9PET2JS8uaTuBpxoGyajKfhyR6HYae/lo8WMfW4YL
         4jkqb+aJ9eEMo/fsJ2xbeTwuhJmVgvpMZOLncoE7unXa+JPT7/m+T7rkxTvdMY1hr6yK
         rdcFW28SgbqvckE1tSwmHqo8r3t7eLqsV7BaRBac+eVq1t6hZj7k3CCMXwbMZCqGIJNM
         yMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803076; x=1777407876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44WhVXZvjCMS4S4DPww0qJ5SDrGxnVaZzuAI8zkpcIo=;
        b=DzGv4hI+0lJV3szCiBm/20eaKxfDepHI7E59JaMfGfz24txo4g4g3X7jj7agO1yEMe
         EBq1LdJzpxgthq2Ju5Bc0Uz8jqFsal3rsYswNwx8gdMBgxMZfTAcJoKOHiv82EqS9W7S
         tgA6vyKLsVnqncIlMFX/DiUcxAFvwekr/ofa420hqEMY53CIjuCkarzq1rewPE73kKa9
         AjEoTk8pBmjooFtfXWdJ3dAlRm3u0vfAs/rAgysF934t01kT001OH6p7tqy6q9unjiB0
         BgRLnAkT+KimJeArW6ZRb5SoTczcKoxrPjMY8/V3Rt4LsNI+VLKuCRBmimzyTeUO04xQ
         6ssQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aajeriM+A9ZdS3KJwHv0dCGlnkfG0IwPLeQ6PsCHS6eKrvrkQefx8Ln31LnGM8FY+u3iNo784qEUv+ErQ0YIf@lists.infradead.org
X-Gm-Message-State: AOJu0YzN+jXsk0JOKw1Lc1kNMe8eBlVzNhnCqdbNzl4nzi73Tg4ei3aB
	pIqgWeW9pqr1lPiJM+adb3Jl/2RyQSSf0X4EtZyiwR4Q1URirzORPeBKdPWhkWHuB9U=
X-Gm-Gg: AeBDiess8ishfOU26VFMYgpSdvV0WbGQVaVPYu+fyAZ4UqwhghCYTpsZQ4QQlG/k5P6
	Ggvixf1zobtH0FoDaERTMz3LkETtsi8HJOyKj09Pe7z3u25TDwHgU6VG5yLmnFSkDZkQ/L9srIr
	hHsOSGoYzDKXdokZ1h46uEd0P/mTWAjz4Jlwp8a2CU+VvYVNgwSCPEL3DzImzYpATv2/SENNX8u
	w7D2Sp2D1JlQtgQCYTLqHRFPlUDTK0wwDGwLKPVQD5+X/XVALknIg7lqTDb/na5zlZLnGqnlWAf
	pphzjxTLm0RIAYVGM/ocseBzR2Yfu91gAn4HGbuhOyndRbVI8FdEruZALcgyaXcGMukm4gVb0JQ
	Mn9KCR0QeDcwhPMXoyyRyiGpDRD8zbATVXBqkvFJT1PAgyEAW+7ZOQFBw+zI9Z/1HMasThhrSBx
	L0P9xg+k0AbB8Ex3SensNoS4sQn9pVVWz9k+z0TURoxkxL
X-Received: by 2002:a05:600c:3150:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488fb7930famr289331985e9.24.1776803075829;
        Tue, 21 Apr 2026 13:24:35 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:35 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:16 +0300
Subject: [PATCH v5 8/8] ARM: defconfig: Add a zx29 defconfig file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-8-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2988;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=JKyBYy0ZVb6KOG4qaXsDDYoua79I9QXXZhqASx+hdt4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXRxxeM3L6LvFEMDOBnIMJkPxSOas2y9Hdv
 YIpcJkPyi2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLiQBAAiaNU2eJnnUvEamsnIJPjVgniN25uL7S
 Yz5non9ycX+C5T/F5q/bvsnDlJnrp67/GJdSQV/6xw51Wbf76xQKhVCWDajplvbXeoRwEVAXm/z
 bNEXRIrKGFwCpfzOWEeeV5YKbTOvanUR8ihbUD/yyC5v0o8FjKPE1dlQLjKXXpFxe87lGLqMIQv
 8b5qZZQ7TkXTXRUJF+ewbW0+R+a2DngtivcmR/gyiYp72726qmz8vPgc3FJCRAfikX8CqFDV4BW
 QRGrbyhs1vGvmK1K0dIlozq300idh70L2qHfXaIcJyIsAUYVoEmgX3FEoo93hjLzYDt1+/lVM6o
 jhv0NYcLZY7IlgEqXcwVt5/3qI0CanPXu+Gpt0TeadNgb6bqLFqqHZ0F5OiOI3AbksJtM6SvTR3
 ikgM2RCl+rRsSFm4wj/FrVWP1UUikjbhsZVOdQvG31kpNXH+8ZNikjOjbDHzqhpg9e3IyQ58Zc0
 NMO2ZT0kLeKpRgZLm0f6SHN+1iQeONIkpMVicPQ6lDnmG0B6/F2IhtMQezweQeNFBZPpdsuCuO1
 tydkNzBBPsH/0bd3Ln/4D1lWz5tCnU4UBHva87yQuhrCkbdthOv7M9YjQpj94glLXh5ODR4iLFl
 CZ4xgNN2zsYRGwj6oc8p7fs45yQLWU/ebZ3Fggnl2Wztnt11p1v4=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132437_617363_D90655C0 
X-CRM114-Status: GOOD (  13.28  )
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
 arch/arm/configs/zx29_defconfig | 89 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm/configs/zx29_defconfig b/arch/arm/configs/zx29_defconfig
new file mode 100644
index 000000000000..a78decd1d525
--- /dev/null
+++ b/arch/arm/configs/zx29_defconfig
@@ -0,0 +1,89 @@
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
+CONFIG_CMDLINE="console=ttyAMA0 earlyprintk root=/dev/ram rw"
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
+CONFIG_PRINTK_TIME=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_ZTE_ZX=y
+CONFIG_DEBUG_LL_INCLUDE="debug/pl01x.S"
+CONFIG_DEBUG_UART_PL01X=y
+CONFIG_DEBUG_UART_PHYS=0x01408000
+CONFIG_DEBUG_UART_VIRT=0xf4708000

-- 
2.53.0


