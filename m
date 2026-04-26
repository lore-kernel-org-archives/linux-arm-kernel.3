Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B05FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=; b=JkYHuY4GIgfG+abZHId7VoANQH
	iqDDs/8aEv15HJe+LwAfaUQi/BFzgNE7JAKtLuIQz0+LzXKI7Q0Ext7UdwfmcC6Q72Tcz8nS5QI5M
	NBQROpFwlO365Ed6GBMrzXnegYLsnZw9jb+Wd7yRBSMot/YCKTEH5eRxnIAlMkg2A+MoXBY7bmZhJ
	T/cRfitH/NIPg/+HDjJAjErxmTMAZaRbD3Jq/q4FTfWHLpP7LBHWlaujoPYlEv51NUPP1YKWhMUda
	e5dmU5lqQAJj1raHmeJGrnEAnpe4w8w0OuKjLXYC5lCoZCalrXFMDJDV4yXGhFbKu2Gt+Npf93N2f
	CbHWBlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy52-0000000FW94-183z;
	Sun, 26 Apr 2026 11:55:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4z-0000000FW5F-00fu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 11:55:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4891f625344so80980165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204515; x=1777809315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=;
        b=Pb8NKLJPNSYr5azHIzieXgb1bHV0Eu9atqGDaO/bQ9JBZyUoCYWGh3ypiFvM+J0HU6
         ZEpdiBN7UbQaGCIfTIc3lYmCKM8jRZQyYthrQII2/7+Symv4A5a59P/CfVAJ4QtTgO2G
         eFKt7rImT6W8TEtKCEWA4UcN3S0fbiyyQygSl9OwXVEaFqX41bR4YBefePSwC3MCSVbK
         n1q+cgcee7Y7ZMvPDj1NkbUI2dz2zoni7l1wtfUt4Xa0KSyN8PR5E9eSx5rxXF5l6Tvy
         uNAO6dBY4GvYhToiHYwFriyCePkxyySntKiEa8y/XWbbWhjnu48NTxrKMrJ+5KoNolqO
         eMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204515; x=1777809315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=;
        b=ZLw3GUJn1kGAxR9ydelKI1JlHzWJEmUhKF6k/DVGn0/x1zEO92uPF+q5jF2bWZvEiK
         lkm2JJAlKNmTQG+/n661ScPzhYqlTfASkr8Vx1cMi6qB2nV+Cv0IW0iRacznb0q+OHPX
         bZoYGyCz+LJfXWhT8dfI3Q3BzJEdPlf+jAFK63waHxt/Msj5QXm7LXmA1DiVW0iZ6yNZ
         QgH29LIswubHMxT6fD5AXp6enFNVatwEELoeA31gn4wUkEYmALYri3i1kC0dvQevV60K
         qrSdF5CQ/FJmny3KMzxtKesSGUaa2VjiN9/mLXyS03N90xSJjgPFpqo7X05BP2vzn+MT
         k2ww==
X-Forwarded-Encrypted: i=1; AFNElJ8d/UhUuNr7kt/JOO504ZbnA7YAca6yLUgOFk68h1ZRgKdBWMTk5N/AJJCO0dtaQXxgaBc8A3VoENo/lQ361vmt@lists.infradead.org
X-Gm-Message-State: AOJu0YwmiKT51qTH+VubnUuP/6j8hBDDNQaWwWDjbVaIk4LTpR1rFq3U
	5oAQ9tpxAYbr+7MzsgM/b4qDKpXONAlyfLm75Uy2nRb43xD2zLsTdMNK
X-Gm-Gg: AeBDieu4+l0VtP4omNd3zr72efMZNSbxHZa7M4zAGEoiMG2hFeIlY6CZJ2xbZRH7VHb
	F8ZiHLdLqsEMA7pazjyh/nz1989fCIm53PFd7ZGCmbvRgHgXfv619fYQKy8Srz8Q9NZFxoJ/LUR
	3eOsv2RdV+KG791A+I2nysXceesS9iByYbMDGfQk/gRlSgJyi/ODZxPd5PfjLfTU9Tnpxi7sxpZ
	eFGhknRV4ewRHfz4DYW6wmeiDl6+wvpDbOXkhJel7v4M1ozoV4mVOY7uVy4uJmW5EUyN5IQRlQ+
	VTWas+JH9eep1SH6mLdzlT2NVlgnLDiBlTmo2jw0dyQrgH6ta7pjbIGdkbqZ4CDNvgCWOYjG8N+
	AbrlEjtp6Nf7ftv92WQld4KNW/0laubz2YrJto4/4iqLGYVkO0JLsPhaenWmu972Cj8prdSENl0
	S/r/p4La+ngA2pO6Q/FA2S8aRZ/FA8SYeldjQvC7c5
X-Received: by 2002:a05:600c:4e0c:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-4891d7a463emr404448875e9.3.1777204515083;
        Sun, 26 Apr 2026 04:55:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:55:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:19 +0300
Subject: [PATCH v6 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-6-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+M0hRXrrwNqabGR+NCrUNYSmRCVX6ergHK
 bOFKsauVLmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLHPRAAi3pLix3iMnS3uZh2OrPDjkqvSa7mpTD
 d0PlJS2eCaRq9cokUGhS6Ct/U+NxZNcLbWVfp9VhwWMG0L4fc1xHeMqN28GxYygjPnhPQorJtWH
 QYhzxkSK2E74XF9olD/dZmF59i6peH3tgPqOmaI5DAKE6UmaEHvEcCjC5ewGEhd9Fm1Ow8keCnA
 sUvYYa1mYYqn/NP9a62cXctazUXReIWpOeN00iYLSs8fPjT1AggopF09nG/5IsbHAFtCl8NLxNz
 Ukel+ORqYPSl+09l/e9cHgJ9lRA5RN4yHfBIMdjmDrJfqZClc7LiV/V4mNAb56ababFgYVzEgGN
 mSmWhRmdk8Buw2ekEJV0uGMnT4keHgkC30GB5Wsk9F9C2WYmPO21swBsdv+c8NDJ0q1to1NxaEM
 FBkyiMIwd688VTYeJ+QIxwdx/BWiabY15haY3eRiLbGDXfOU8zqdX5JV5peoOzrpuV8xrPa/Fz7
 LOsTe+shwhxDYPvILQS42pdSGBYYq2Sr3oE0GOCqdv4Ow7XwTTtoTIqsq6rrLg3X0STvE218nM1
 L9HIbyzoTcbXU9GkTe0j1pt8BNQrNMpNJ54eGBs5d0UFaM0ky6rlly3OwRJroyXBZaEKshyZfeS
 Q7kuOKJAY2Ro9vDrKc3r12tUQ2Az33/A+D4SmPrEdQbUiPev+77s=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_045517_120414_7761645B 
X-CRM114-Status: GOOD (  14.81  )
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


