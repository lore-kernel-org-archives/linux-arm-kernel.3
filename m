Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71313FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=; b=mW1cyDn039novv+RFh51dptBxZ
	uWOlNl8YC/hKUjlgegXpj3SWrq7EnypxdKA1I6gHnYp1wjHbI9tWr+sqGbXTVXH94xlYCKENJyUXt
	6d0B70FCy2F3pF7/E4wOOW+9xue3fQAs/0mC/TbCqpNJVUjfKBhliZfnyZCyIYk2aK0IkP4k/Z6I9
	hx35WHDBLbFdn17+Fuy6sUiJinbzHuRpqV5xrwbNdLlLvAd41TmolNXs945NVWOM1/LYB7SQtRwrm
	rWXOKtsla27kKMm7l8F9SJFfCMaHzn2pqfE4bjlhF/MiNfSl8ffeCjh0eCMP+DvsRn2FO6mR5AGEF
	GwYTmCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMr-000000048Ce-3h3W;
	Wed, 29 Apr 2026 19:14:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMp-000000048A5-1Ju1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:14:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so896985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490077; x=1778094877; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=;
        b=RYmjNWnNJd3rQWYaHV4Uu6RVvdcnO+7rn4az/Z4dqSmPtrsbWtEywbO1rhYQncoPUp
         OfzySLtzqvzLN7kBq6ri4aJCh7xoTmakdy+9Jtzgjx2x0WisWMQI6ZOwpJGN5oWlH3lM
         Pd9XVvRJGbVrz2IkSkgw7tLuwml0otREJvt4PBxkll+/A3YvLXf/0YcgPw2boEaxsFrg
         0bJ23AnyjPlYH6VbPsaKYjCPFR+uL4AaBB2oX+LcUjq2YQWTshJzxtcM4iszXQcxVqZV
         UeWipPBNOskh/A7GpFqvh5rB8HOtr9Eeye113O2DsP44OzX7J3tZx0530UQYRSo0lpeB
         ba+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490077; x=1778094877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=;
        b=p7gFlEeANf2iy8YbZhuN5tMpXiNcXPsSh7aB5/izrd0fuTZuoNT+5I7TYf9w8qmhUs
         ecGAd1bgU41cxzRbBE9DJSM6GhZ/EgEKHX1TXmm5yny1Voz21nfD9neD48c8anQNOg6j
         tbO/cZq0YEHgRMUURHoj8wC4L32nXisN8Ux22JSWDCLBF7EC5Cmylz8+uxMV64qi+y4b
         l2c8U2Jqg5kaUhjSMPkibDMDvRRHq6h3rMiAdeNkSJ53fiQwkDHV59ibHqH/FEL2nWi2
         S+DxGuPaV9xT3DRsR2MgY3qQTPyCO6Fr4IPL0XUubxzi5ZJ38hrIwyQUZjlqIcpzZ6dD
         z37g==
X-Forwarded-Encrypted: i=1; AFNElJ/ZufmKftdyHI7gjolJzHEFqKrJ4awClEoZVIR/nKu8OJROf7GyUC61ZF0IO37JiG2Qzh9JrC2pfLoTth3vb7ku@lists.infradead.org
X-Gm-Message-State: AOJu0YwZMxHJzWGAJeWDL+P7iKSDWqSc86kiTHvjO3rWlY/2xjuxiHC0
	GlRaORR/K0M9WCp2VNmGQ0nRVLNLZwlAOD8/6SNitIf+BEkshvgEfydk
X-Gm-Gg: AeBDieuBnAt+tNGOOfOv15UAwAJJs71pZz6g8/AlmYzqdTWBJB10mxS0phdHH3rhG9N
	ieyZndO5Qzlk7w1ulanUM6+5+x1esLXPxajVSfm8k2fZEEBGVT129IKnYCz5NTBKPrv+u5/KbzV
	/rKzHhKTIoMs9gQ3jEGL2wArd1VOAjMAgNpzLFTGBgjR5wUbQK+zuIv2il9wYosAS9+HBSgMxuK
	O5znfo1ioyAEYj84n/ufn12l/2EN89cBz5CjOY4qo5INPqETQAdBDJx5iG6HSRdye/aA/m9m3FJ
	QvwK4coE6htYTiXavB1y8GH44q3SxE04wS7xQ1fF3gevt4VQvVJBnL8H3mqxGgzWYNx5YWjQ4pk
	BmVzmuSN/amHN/ufzFDi8VmOOXzb4GUrh/oU6wa7evWh19nfM7ONnYLzCMUXAuozqlHO0GvvsWk
	5+2bykYK5Z+dtPeIevYgy8dtPx/vTwpiDqxog4/5mBRlA=
X-Received: by 2002:a05:600c:630a:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48a77b0ee3emr168084865e9.22.1777490077103;
        Wed, 29 Apr 2026 12:14:37 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:36 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:17 +0300
Subject: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-6-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Raw3nnG6txGxRT2tuucK4Vyk8RJ3aJNJodqKknAtnWs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1EhYS/FI32IlxLUBQvJ1l9b49Dbf2N5b5b
 0+0yQRveI2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLTUQ/9H4sDaDcI8rzJTKhDFNRttj29vxe6POt
 eevQdOL+WQaWNV5Iq+5n/XsbP0bp2cuqUwCUbr8sRr+s1kFz2TB0YjWQCjT3eLTpU5F5xZ32V0n
 LM2hx7oOK5tvlCn8EScXp2v/0t3G+WwS+PJT5JkKKJj670Z+5PbBWmdkRRqR3eCZ8LkVWsJAO3y
 T6ya+d2yGv+jVfZmp6Cm7nsdVINKlFQ9bKmBEqOHwXwpNK35xPEsHUqYselJ7Y6ijIHTAQWSPSs
 m3HtYNJPJcw2how9p084rusWqFS6qVPgWGEBCEZ1+5Y2FdKepgvjuVRUqAOUxU6EOBIVKYz+Zup
 ksAoJGRzMC/o2/w4J7l9+9Eyqv6UdS3yu3HgiBloNGM8fiQDDFDkI9tdLK/sn5YjiIaSs96IY3H
 MrPisngXDE6JCyVlGzNlHzB1PZZXYm3TiGr8Lw04HhyawjbA8bad7k+IpOJmFlGULDQ4ais+Tkx
 4ByKHcTaCM9V7eUzaK2vsVsDGstcn8lKV26t78yeQ5Szmy8+uZJEUhVdjd5ue6j2JYuiG4EeOjq
 Tieiv8xSuv6EmymMgSguk0s87VQE1xZ01bcYbN84JI/M4Snh3oh9SBKL2PESxrMa0NIfilYH5Vk
 VQ6/qQIFKNYuUoKSGqwlOh9qd8IC9QthvqlEMv8q/soMTaUMkvFE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_121439_381234_3504C7EB 
X-CRM114-Status: GOOD (  14.99  )
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

This enables existing drivers for hardware that is present on this board
even if it is not present in the DT yet.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes: v5 to v6: Regenerate the file with make savedefconfig.

An open question: What's the appropriate name? zx29_defconfig?
zte_defconfig? zte_zx29_defconfig? There's e.g. stm32_defconfig without
an extra mention of STMicro in the name.
---
 MAINTAINERS                     |  1 +
 arch/arm/configs/zx29_defconfig | 54 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f51ba1c5ada..5dc52b84cc09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3776,6 +3776,7 @@ ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	arch/arm/boot/dts/zte/
+F:	arch/arm/configs/zx29_defconfig
 F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/arch/arm/configs/zx29_defconfig b/arch/arm/configs/zx29_defconfig
new file mode 100644
index 000000000000..54fa62ed56e7
--- /dev/null
+++ b/arch/arm/configs/zx29_defconfig
@@ -0,0 +1,54 @@
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_ARCH_ZTE=y
+CONFIG_ARM_PSCI=y
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_CMDLINE="console=ttyAMA0 earlyprintk root=/dev/ram rw"
+CONFIG_CPU_FREQ=y
+CONFIG_CPUFREQ_DT_PLATDEV=y
+# CONFIG_SUSPEND is not set
+CONFIG_PM=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_SRAM=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_PINCTRL=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_POWER_RESET=y
+CONFIG_MFD_SYSCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+# CONFIG_HID is not set
+CONFIG_USB_DWC2=y
+CONFIG_USB_GADGET=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_RESET_SIMPLE=y
+CONFIG_JFFS2_FS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_LL=y
+CONFIG_EARLY_PRINTK=y

-- 
2.53.0


