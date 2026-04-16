Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF93F8D778
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfPIq++ZptNB9NoSORTQP1Mg8nMLS6cM+zxyxGdj+8o=; b=MXCMCKQwidpdwcC07xEohZwt1U
	2DmjDDrrQCspWpv3Ybn9bwODuBGSjxoazwM5B0NEa8zcfh2w4c8JWSMncJemWBht/bpxT1c1o6fE3
	5RpaEdRzcVq8p7VVIYEs7q76912SQNe/w5w8N2EUF94YUudm0DbjW4GwSWMsAPDGmwnDwRHSChvpT
	sROFXl0+DEusy8NDWYBon6bOYJo1RE95Li652abk+CWBwI1fkNRvBKk/xZJuo1tCHroETHUdBl52J
	l7Z/2Of6Lpj0lj1xrrg9KoJxiZuAmt4Q1dct9fBfOxahMt7YbHFs3Zk53J2OtPo6ct+zfUu2bpKsd
	F7mBtmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTC7-00000002yKM-0WE6;
	Thu, 16 Apr 2026 20:20:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTC4-00000002yHG-33p8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:20:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d7650202fso3964551f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370807; x=1776975607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfPIq++ZptNB9NoSORTQP1Mg8nMLS6cM+zxyxGdj+8o=;
        b=pPoJ+z2M4xyYGI0eftIVj9t8MTkVnaCPWdwB3I9Dbyw2tTv3JFe6Kjtqpb5Ug5b6sX
         EzDyKrVvobrjk6u7YaIdnJGsd/k23+gZmORfwnw9NvK+dhCnQaNdMM2R293PdROMMiuO
         d39ySbo1LJ7pIcz/X6mjewM+5NTejX3OlQeu4hm4g0LOsX/7eYGsI0lLBhp7DJkULJiE
         o2hDUJhnGR/VsTOBzvD1WI8aqKe/m1751tkE0XD/nliSOK0ymfU2G+KJryfSldyaSO3t
         QzqV7lXqy4ZBj4STPPeLyePuWFFxANF7mboqZb5YFuHFLzCr+n75JuJXk6a3vnvulcoE
         KKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370807; x=1776975607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RfPIq++ZptNB9NoSORTQP1Mg8nMLS6cM+zxyxGdj+8o=;
        b=Jd0mVsHlv55YEgv1QTeOHEZ8onfwB0e8UhYI/m0kFOI9IbJN1EkP7K9OuJ5FsJOlsq
         kkT2i0kctL406ZoYMY2H/1cVCUYmR40SHFug7Jp3AWD+ozU5DGi59esgJe2r6HctW+bA
         LGOAgp66XrgZRZuQQhXj/zU3ow6IAvbKoC0ze9rfAohSehzOYxL/TwRlBBwreYMgsqyf
         +ury57hiZVsJmcq43it25BZy70d84ic5Cxlge+YlszZSMJKbJFxD4kTvH7XOkpAw9Nc9
         ZDlm67r1/DGN8pg0+mZ2qpyv8jHhmMDkVBk+9rRsTgCpkbJmY66v+SGONYacfi2+DsyD
         mvxA==
X-Forwarded-Encrypted: i=1; AFNElJ/yFd/EIo1qxBPu+CvfhbmxkwfjVykRmIIYd50Ft7H0b9Jo7d0gfDnW1IPn5GlAR3V/L/FboOTY66+Jd6u1IExz@lists.infradead.org
X-Gm-Message-State: AOJu0YyZwoqeMmWjUx5XJriPDaJKWS/wUHE9kVyatiaQtYwDCdZPZ+N1
	dp5yylJJwKjmKCeMpRsQzJ3EVSfo5mLjYNNQn58o7uyMXFfkg+hV430t
X-Gm-Gg: AeBDietdhehKFmfnKO3a81oP8LtOgCyA+pSEXLWyYiMzd5dWJnemQaq/suz7+jEkVeR
	fYNiK3F6jdYIF1hRKuxakwHBTZVaKcNAAUXIPI3j0ZdK6m9kMWcZRr8BJ1nYdvl5DwTvGR5Mk2b
	dRCPeK9iZgQSMPRXCpu3or/hi6/x/nhnzHpg3TFpjn7V/cw4xrvyVeLNdS7sed60CvryyRP4dlA
	7uUFhTTctFNNWm4yL2KlH4SkeliYf+zWtuulbqWIUnWgT1TsBhU60+ySxDEDoYlnyrWgirsmT7J
	ruymShOXTI+VrQPFvGwmYP6c5ibGvIOIhenKz6JcOY9R/ZzGr35JebU8j7a++hkmWcRDqSA0l0G
	G21WZiXhZLkywnt8AOUu8ToNmj8ei83oEd2/dpGeGG/JJUjX2uirnOckGpUi4P2/Mxb+JyE4mcJ
	biCGTnfcp0BilslEZ0hNXC+P8LymHIR7ru2ubEpbFgwBj24Q==
X-Received: by 2002:a05:6000:2305:b0:43d:1df7:ed24 with SMTP id ffacd0b85a97d-43fe14920ccmr1106467f8f.21.1776370806537;
        Thu, 16 Apr 2026 13:20:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:20:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:16 +0300
Subject: [PATCH v4 8/8] ARM: defconfig: Add a zx29 defconfig file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-8-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=6ya4n1fkm6PPu+J+UXJaoxYlGEf50l80a0QukNljqH8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLRFT9WUgaNwopIp7Mpr1SgGCmmWEuwj7ar
 WVx31IEDDWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJCTg//bkjPztbQVJQPtpbuLkcvfvMZhtuQRHY
 l33l22HlA6SP/heWkI6T2qAPFy1M0Ure63fHDxMyVsuv3gxrVpiTaucJEgKv0fiPsZwRkQFmyLi
 /yiO1Unj3iYdV/kzF86tniNudGNMW92JEHVa/sM9Px3laSJVV3JBEj90VPdnWccaC55hY0Je/Rx
 XoJrAexRUkpqczSXjWKKkXEN8Ve1EPCbfujoRvtuW6aZ77E0KiLIx3mpXZikz9vfrx5emrUZ5qR
 jU3NsabY/ogXdbZKOwArmyvGNDAXz16CrSDiRdialp6+wzlaFhn5IL2+CiPy+9vK7sz/7z6G1pT
 E8aCYbXMwoWtf1H09lCO8zhcVUNTIlGY6isvToY+WxjRmFIh6yzp65M3tvJqcywcPy3K6pYhsP0
 0lesl6GO2X0AjJ0x/h7OTrK1U30R47h2Tfb+H2zitdYZvUD2/MnR4SRY6LqYqg8Wt1TZ7X4+QmF
 1KHbL2+y95uoO5JBK58zmNi8asUxR/pBWRGguhBEdljObYEralQfrAsp4djUMPWGisNdUSQYrB4
 zj5WgqwMUUVoeX9na9QhiMLZhfpfJn7hjQygPgnQSV/gcij467vFsFilq0DiKH965TjQ1AEygP9
 dWfea67NGOlgz3pscNDsJQ/7GWs5F0DAk65YCoWpG7ZJTw7V0kss=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_132008_800515_0AE76D1E 
X-CRM114-Status: GOOD (  12.76  )
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
 arch/arm/configs/zx29_defconfig | 90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

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


