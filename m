Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1418CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/br/vKvGyVXqwDUvWttmVEOrzxp30iHNy//vQIn1IY8=; b=ZXO/bF0qLJTlllVdB+znPNlUAO
	Pe9wUm8cNUUYY29WgvWMxiO4O3hX8jqcRKARvsZxnfJDoWulPCLpD25QnArfqTD91e5FqxbWYd+qV
	NRPkWbDKiMswSEyRSGlf8DRW0P7+FSNxOFyL3nPvcqPhaNYYrXvaH/KWvcPBIr9nQyZHZaZpdTbX2
	ZnrcE0+XeGFI1rZUeqHVVT4EE3Li/O2csGqBukshr9qZTJrpEwBe37oBvfhOESUabPuwA1c8Yqq6H
	cV1RBVPZzIXz4jY1RT5QlTs5vpS6zvpiCBpQNuZJcyV0LqzGN0o9nUg5k4R0ifuvOgYqPBVG7sq5/
	rHgvQ4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0S-00000001szv-2lIA;
	Wed, 06 May 2026 19:34:04 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0R-00000001syw-080u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:34:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so55276f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096041; x=1778700841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/br/vKvGyVXqwDUvWttmVEOrzxp30iHNy//vQIn1IY8=;
        b=mNLZ0kzz6tZbprZ8QiSdjfuveyHv/DzMVJmsPbuXKPIhZGF28MBzN7P90pcYlSjqeE
         M7nUVSN5OZRo7Qy7vpBy0HN4TukMzqTD9YAYU2vyuLlZiL8E2nzQm3Yi68b4q45MjRt/
         BST0r8LoeXBjdWMFmirtstLBDQLqiMm2iG86Zrs8xHkzvwGMqCQmWMO4JjUINHCt5eN3
         bolRioGbOqjaqKnu6PenaRiHiLt7LioUgVJkpqNR90qlXfkX+K4o1F1Lo2282Ef+D3RI
         WUTg7+eOncjWWdN/A45+iTp5tfZ/nPTpUR1kTGwmVMCkeNiRyiWezJwJtQidqHKROVv0
         iFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096041; x=1778700841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/br/vKvGyVXqwDUvWttmVEOrzxp30iHNy//vQIn1IY8=;
        b=Fx5RUuTuQ15EkeUA/uYLRya5cJq7ro2ruJAD9wCA2GW+yl2UsWUOczAH0rX0vaysaM
         vuRxWLEH1K7UYFaPIB3kkGCxfFVNoEcVkUrMiVcWiV+zH9HoSiaWRCkx5zTzjtGIWMPc
         hk02KCCx43IM4Mm1BiyGXwl6Fi9sVIXHTbLOjboo0DYu3Y7L3zJKyyKsCB8epMMQUer0
         MT8Mbvo+ZhD/nuBmGkYabpYi8ZWa+Jg1TBDVtlDkf1VFrwrPyCYrnhHip1sgOeYjuZGL
         DdNqcjBFgD0y28GWbhAsZPFxXKCJ5n7X7JzX3aYqWqu1WZhAHjqsDLEbvrHZQcQCmbfM
         +SGQ==
X-Forwarded-Encrypted: i=1; AFNElJ86HLHqRDRQUeu6YuW/r1zfY3PFLIDFmFWYN2HoMmh7dOvpZRILf+oFm0TTfhF/W3UTVDSlLqHIDmXwgNL9ilHA@lists.infradead.org
X-Gm-Message-State: AOJu0YxKLDm+dBYDrX2AqaUIgHK2c8GmFgYQQ+H926VNxV7fyR9xwEyN
	IZ8lZts5Oi3yk47iiRXMonwYte8LdlzaXcpv3NYNRA5LYLvBF8v3GF8b
X-Gm-Gg: AeBDieuIDZwdabKPpTvNSHa/B4rC+uj3tjqKg+GxU74Qk40wlLBuPf3kFrdaeYtHbIf
	yctQHVeMsGjwGTnRbLEd82P+r55E5OVQvFMo8wrRGCRx+LZuQOFoXSoZW7zXCWdNffJLP4Zxc7F
	8nOJgvwrBRkmOJVCQWN4RfNa3nxWjIxoVk06ilIW10yqn+iTYxIrHFhBdZgafWm77ZH/eHYB9T8
	Ulz9yzLBxzAaXEP+ZcCTI4AQjxSrHpKa9Ey9I6gw4Z7lgf7g6mDfdw9YWo2tNV6pC2T+LyEwEAt
	9McccHJhNbM88ycVZmx1cNsKp4xcge4cungRSMxZEC1+xlyugI1PIoohWCFdHsmYXUdb/HkDwFd
	lS16Sc/z60IcGvlgVRnMAecAbsc0rSWTrjYgZwCglPvtsAQOadFws44bUvaM4DNUEwFwz2Rjj8F
	aFRr0dQ3oHau3Z2iTJR6LhFGqhY/fkANTYwrR8dWMI4Ek=
X-Received: by 2002:a05:6000:438a:b0:450:e33b:23de with SMTP id ffacd0b85a97d-4515a6c330fmr7873901f8f.2.1778096040928;
        Wed, 06 May 2026 12:34:00 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:19 +0300
Subject: [PATCH v8 2/6] ARM: zte: Add zx297520v3 platform support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-2-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12748;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=9GMIltrkFv9LbzP0a0EmZHtEnrGsE4vJUoojl8qWcfg=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWxIhSx9pjrTUSx1NzLy4sB9B98CEeD/9rh
 Qo3zVaiizCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIDqg//Tqelp1Z08Fxnc6IqksqC+SGN57QJY+A
 ldu9Y2pbWH0xMvhSe7hciO9jv0qIbPPpK7WEJuerVeCY1rJEY18lPXUjWqLd45sviXxNKDuZr7x
 bZVojDvfdNXj9Uok8B+J1z7dcr7tgwuCYwl++qFYD2vhWK7LlPce7mBwbyt+B7UfRSdiBcz1/rr
 EGILK89KemdeGJYTTgSm6YkdgFDJPNgjp5XuSfFv+s5Kj9AyflM5TgE5nT3vI6uQzhdD/FbwFXu
 rXjqxaTySLPdUBAhMexPCr9Ju559D6dMm9aThTv8bHS04cw/t7D0rYEH1lacWNxRlC5sKDzkn1M
 QHIgNDRwbcLNN348pZ4GpJoVUqLnsdh2fpaa421KIw0YYdcYdYFrgC6hLGxD6xz2LWdM8l6SZ9p
 wULFxm3PeCLh2rdIHdo2MTD6zE4dg8difNstNy9cJB5nTOy+9YeDjugZrqilGeD/Qr7whwaZjFa
 yyJRmhZ+dCYEb742A+14QNtmZitfNnMVbnPvCucmeNzWmEkSXNVqswXSnkRW/WFGK0eKeV/tlBV
 UWhpXsCIINV+I/FrATttN68N2btwGiffkajx85UiqJ5JlUE/+1GLfzUT4tVoi5LlO6hzYT/AFqc
 G14yPBZnF2JTHg0BVYfp3WkEqfPDXKtUZk5yuantHvK6KrSmpcHI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_123403_215153_60C24066 
X-CRM114-Status: GOOD (  37.28  )
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

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform"). My eventual goal is to enable OpenWRT to run on these
devices.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:
v8:
* Select ARM_PSCI_FW (Sashiko). This is an issue make defconfig pointed
out in the last patch in this series. The board does not have PSCI
firmware as far as I can tell, but the ARM_GIC_V3 option indirectly
assumes ARM_PSCI_FW is enabled.
* Include <linux/init.h> in the board file for __initdata (Sashiko),
removed other includes copypasted from another platform that aren't
needed. Let's see if Sashiko agrees.
* Add the SoC documentation to the documentation index (Sashiko)
* Add the SoC documentation to MAINTAINERS (Sashiko)
* Removed redundant if ARCH_ZTE (Sashiko)
* Point towards a sane (USB-Only) U-Boot and modify the example code for
booting from NAND to detect already fixed GIC setups.
---
 Documentation/arch/arm/index.rst          |   2 +
 Documentation/arch/arm/zte/index.rst      |  10 ++
 Documentation/arch/arm/zte/zx297520v3.rst | 167 ++++++++++++++++++++++++++++++
 MAINTAINERS                               |   2 +
 arch/arm/Kconfig                          |   2 +
 arch/arm/Makefile                         |   1 +
 arch/arm/mach-zte/Kconfig                 |  29 ++++++
 arch/arm/mach-zte/Makefile                |   2 +
 arch/arm/mach-zte/zx297520v3.c            |  16 +++
 9 files changed, 231 insertions(+)

diff --git a/Documentation/arch/arm/index.rst b/Documentation/arch/arm/index.rst
index afe17db294c4..b15621093f7a 100644
--- a/Documentation/arch/arm/index.rst
+++ b/Documentation/arch/arm/index.rst
@@ -75,3 +75,5 @@ SoC-specific documents
    sti/overview
 
    vfp/release-notes
+
+   zte/index
diff --git a/Documentation/arch/arm/zte/index.rst b/Documentation/arch/arm/zte/index.rst
new file mode 100644
index 000000000000..0ed80b60b746
--- /dev/null
+++ b/Documentation/arch/arm/zte/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=======
+ZTE SoC
+=======
+
+.. toctree::
+   :maxdepth: 1
+
+   zx297520v3
diff --git a/Documentation/arch/arm/zte/zx297520v3.rst b/Documentation/arch/arm/zte/zx297520v3.rst
new file mode 100644
index 000000000000..2122887e391a
--- /dev/null
+++ b/Documentation/arch/arm/zte/zx297520v3.rst
@@ -0,0 +1,167 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================================
+Booting Linux on ZTE zx297520v3 SoCs
+====================================
+
+...............................................................................
+
+Author:	Stefan Dösinger
+
+Date  : 27 Jan 2026
+
+1. Hardware description
+---------------------------
+Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, although they
+run in arm32 mode only. The CPU has support EL3, but no hypervisor (EL2) and
+it seems to lack VFP and NEON.
+
+The SoC is used in a number of cheap LTE to WiFi routers, both battery powered
+MiFis and stationary CPEs. In addition to the CPU these devices usually have
+64 MB Ram (although some is shared with the LTE chip), 128 MB NAND flash, an
+SDIO connected RTL8192-type Wifi chip limited to 2.4 ghz operation, USB 2,
+and buttons. Devices with as low as 32 MB or as high as 128 MB ram exist, as
+do devices with 8 or 16 MB of NOR flash.
+
+Some devices, especially the stationary ones, have 100 mbit Ethernet and an
+Ethernet switch.
+
+Usually the devices have LEDs for status indication, although some have SPI or
+I2C connected displays
+
+Some have an SD card slot. If it exists, it is a better choice for the root
+file system because it easily outperforms the built-in NAND.
+
+The LTE interface runs on a separate DSP called ZSP880. It is probably derived
+from LSI ZSPs and has an undocumented instruction set. The ZSP communicates
+with the main CPU via SRAM and DRAM and a mailbox hardware that can generate
+IRQs on either ends.
+
+There is also a Cortex M0 CPU, which is responsible for early HW initialization
+and starting the Cortex A53 CPU. It does not have any essential purpose once
+U-Boot is started. A SRAM-Based handover protocol exists to run custom code on
+this CPU.
+
+2. Booting via USB
+---------------------------
+
+The Boot ROM has support for booting custom code via USB. This mode can be
+entered by connecting a Boot PIN to GND or by modifying the third byte on NAND
+(set it to anything other than 0x5A aka 'Z'). A free software tool to start
+custom U-Boot and kernels can be found here:
+
+https://github.com/zx297520v3-mainline/zx297520v3-loader
+
+If USB download mode is entered but no boot commands are sent through USB, the
+device will proceed to boot normally after a few seconds. It is therefore
+possible to enable USB boot permanently and still leave the default boot files
+in place.
+
+https://github.com/zx297520v3-mainline/u-boot-mainline
+
+Contains an U-Boot version that can be used with the USB loader and sets up the
+CPU and interrupt controller to comply with Linux's booting requirements.
+
+3. Building for built-in U-Boot
+---------------------------
+The devices come with an ancient U-Boot that loads legacy uImages from NAND and
+boots them without a chance for the user to interrupt. The images are stored in
+files ap_cpuap.bin and ap_recovery.bin on a jffs2 partition named imagefs,
+usually mtd4. A file named "fotaflag" switches between the two modes.
+
+In addition to the uImage header, those files have a 384 byte signature header,
+which is used for authenticating the images on some devices. Most devices have
+this authentication disabled and it is enough to pad the uImage files with 384
+zero bytes.
+
+Builtin U-Boot also poorly sets up the CPU. Read the next section for details
+on this. It has no support for loading DTBs, so CONFIG_ARM_APPENDED_DTB is
+needed.
+
+So to build an image that boots from NAND the following steps are necessary:
+
+1) Patch the assembly code from section 3 into arch/arm/kernel/head.S.
+2) make zx29_defconfig
+3) make [-j x]
+4) cat arch/arm/boot/zImage arch/arm/boot/dts/zte/[device].dtb > kernel+dtb
+5) mkimage -A arm -O linux -T kernel -C none -a 0x20008000 -d kernel+dtb uimg
+6) dd if=/dev/zero bs=1 count=384 of=ap_recovery.bin
+7) cat uimg >> ap_recovery.bin
+8) Place this file onto imagefs on the device. Delete ap_cpuap.bin if the
+free space is not enough.
+9) Create the file fotaflag: echo -n FOTA-RECOVERY > fotaflag
+
+For development, booting ap_recovery.bin is recommended because the normal boot
+mode arms the watchdog before starting the kernel.
+
+4. CPU and GIC Setup
+---------------------------
+
+Generally CPU and GICv3 need to be set up according to the requirements spelled
+out in Documentation/arch/arm64/booting.rst. For zx297520v3 this means:
+
+1. GICD_CTLR.DS=1 to disable GIC security
+2. Enable access to ICC_SRE
+3. Disable trapping IRQs into monitor mode
+4. Configure EL2 and below to run in insecure mode.
+5. Configure timer PPIs to active-low.
+
+The kernel sources provided by ZTE do not boot either (interrupts do not work
+at all). They are incomplete in other aspects too, so it is assumed that there
+is some workaround similar to the one described in this document somewhere in
+the binary blobs.
+
+The assembly code below is given as an example of how to achieve this:
+
+```
+#include <linux/irqchip/arm-gic-v3.h>
+#include <asm/assembler.h>
+#include <asm/cp15.h>
+
+@ Detect sane bootloaders and skip the hack
+ldr	r3, =0xf2000000
+ldr	r3, [r3]
+ldr	r4, =(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
+cmp	r3, r4
+beq	skip_zx_hack
+@ This allows EL1 to handle ints hat are normally handled by EL2/3.
+ldr	r3, =0xf2000000
+str     r4, [r3]
+
+cps     #MON_MODE
+
+@ Work in non-secure physical address space: SCR_EL3.NS = 1. At least the UART
+@ seems to respond only to non-secure addresses. I have taken insipiration from
+@ Raspberry pi's armstub7.S here.
+mov	r3, #0x131			@ non-secure, Make F, A bits in CPSR writeable
+					@ Allow hypervisor call.
+mcr     p15, 0, r3, c1, c1, 0
+
+@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
+ldr	r3, =0xF22020a8
+ldr	r4, =0x50
+str	r4, [r3]
+ldr	r3, =0xF22020ac
+ldr	r4, =0x14
+str	r4, [r3]
+
+@ Enable EL2 access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg
+@ access to GICv3 registers (bit 0, ICC_SRE_EL3.SRE) for EL1 and EL3.
+mrc	p15, 6, r3, c12, c12, 5         @ ICC_SRE_EL3
+orr	r3, #0x9                        @ FIXME: No defines for SRE_EL3 values?
+mcr	p15, 6, r3, c12, c12, 5
+mrc	p15, 0, r3, c12, c12, 5         @ ICC_SRE_EL1
+orr	r3, #(ICC_SRE_EL1_SRE)
+mcr	p15, 0, r3, c12, c12, 5
+
+@ Like ICC_SRE_EL3, enable EL1 access to ICC_SRE and system register access
+@ for EL2.
+mrc	p15, 4, r3, c12, c9, 5          @ ICC_SRE_EL2 aka ICC_HSRE
+orr	r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
+mcr	p15, 4, r3, c12, c9, 5
+isb
+
+@ Back to SVC mode
+cps	#SVC_MODE
+skip_zx_hack:
+```
diff --git a/MAINTAINERS b/MAINTAINERS
index b768b9da37a4..697287d1b372 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3774,7 +3774,9 @@ F:	drivers/video/fbdev/wmt_ge_rops.*
 
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ec33376f8e2b..4217ed704e48 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -464,6 +464,8 @@ source "arch/arm/mach-versatile/Kconfig"
 
 source "arch/arm/mach-vt8500/Kconfig"
 
+source "arch/arm/mach-zte/Kconfig"
+
 source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index b7de4b6b284c..573813ef5e77 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -223,6 +223,7 @@ machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
 machine-$(CONFIG_ARCH_TEGRA)		+= tegra
 machine-$(CONFIG_ARCH_U8500)		+= ux500
 machine-$(CONFIG_ARCH_VT8500)		+= vt8500
+machine-$(CONFIG_ARCH_ZTE)		+= zte
 machine-$(CONFIG_ARCH_ZYNQ)		+= zynq
 machine-$(CONFIG_PLAT_VERSATILE)	+= versatile
 machine-$(CONFIG_PLAT_SPEAR)		+= spear
diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
new file mode 100644
index 000000000000..d3b404ca488d
--- /dev/null
+++ b/arch/arm/mach-zte/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menuconfig ARCH_ZTE
+	bool "ZTE zx family"
+	depends on ARCH_MULTI_V7
+	help
+	  Support for ZTE zx-based family of processors.
+
+if ARCH_ZTE
+
+config SOC_ZX297520V3
+	bool "zx297520v3 SoC"
+	default y
+	select ARM_GIC_V3
+	# This board does not have PSCI firmware, but ARM_GIC_V3 depends on
+	# ARM_PSCI_FW being enabled.
+	select ARM_PSCI_FW
+	select ARM_AMBA
+	select HAVE_ARM_ARCH_TIMER
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Support for ZTE zx297520v3 SoC. It is a single core SoC used in cheap
+	  LTE to WiFi routers. These devices can be identified by the occurrence
+	  of the string "zx297520v3" in the boot output and /proc/cpuinfo of
+	  their stock firmware.
+
+	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot
+	  the kernel.
+
+endif
diff --git a/arch/arm/mach-zte/Makefile b/arch/arm/mach-zte/Makefile
new file mode 100644
index 000000000000..1bfe4fddd6af
--- /dev/null
+++ b/arch/arm/mach-zte/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SOC_ZX297520V3) += zx297520v3.o
diff --git a/arch/arm/mach-zte/zx297520v3.c b/arch/arm/mach-zte/zx297520v3.c
new file mode 100644
index 000000000000..06f71348459e
--- /dev/null
+++ b/arch/arm/mach-zte/zx297520v3.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 Stefan Dösinger
+ */
+
+#include <asm/mach/arch.h>
+#include <linux/init.h>
+
+static const char *const zx297520v3_dt_compat[] __initconst = {
+	"zte,zx297520v3",
+	NULL,
+};
+
+DT_MACHINE_START(ZX, "ZTE zx297520v3 (Device Tree)")
+	.dt_compat	= zx297520v3_dt_compat,
+MACHINE_END

-- 
2.53.0


