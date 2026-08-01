Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B5C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YItn9UN/FPZMLv/eaPs9b++UQIA6LNhw5J6n7UpAldo=; b=w6ojTWMZNa1XKWipKDDWuA0abM
	OuNLqYbgBbgrQ7LhqycnfFp9sNbLS4lZWyi6aHQXsF1JTb9QbGvn8bjmrWSd6PyepkUW6OTLCr0Fs
	8uh7byTPXPNiF2tfomQaC2d6aquO9Wk9EENkMo7arZSJFfO8KxX3TUbsWUoYDOD66uX7g810RcAX7
	eMMXjUypdfPpcEUTy6r3UtUhODWdoGi17I/mr2kKQU4A8Kh0EGSjPqG49iBJ3mrYNMAU7qIXD7pZs
	27Q9rufmN9OMzYb7O6qdnFfuog4a02I0qS8Tjp2WJPC3lVMQLD5ZccDtpuClq6cyvsgnc7jUrwuOg
	78ydNj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHAK-0000000F6p0-2mX8;
	Sat, 01 Aug 2026 21:22:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHAH-0000000F6oS-34O3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:22:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f84023916so2210468f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785619359; x=1786224159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YItn9UN/FPZMLv/eaPs9b++UQIA6LNhw5J6n7UpAldo=;
        b=B/9rjO4FtHyjLzFN2QkHQ3cbFhSHNI/8c4SBjMjBa6JySKG8fP0Nt8weXyeBoegNK3
         VWR8LSIyMwT3mXhYcArRVLc+QBO4it5jByRo/RkLMWxR1rxublt8GeRC198lIAdpZ6Oq
         C9GGH321keoFwMUps9tlOF0tCUmAYeDsf1cjQOhvTeprMOLt76tuOcLklAd6wx8Ty4HR
         696VZYBbiLabrRTn5nZ9Etb6KPWxLOdsoNPFG+sUJKwrwegF2gUhc/rbXp4q7o9pC0dX
         N4IVSyOY1E4ZV3zKl42ViBgWsYEhtxHuC2KyKhzZgRskvY5uddtc6j+MKSRSg6nQ0gBp
         U5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785619359; x=1786224159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YItn9UN/FPZMLv/eaPs9b++UQIA6LNhw5J6n7UpAldo=;
        b=gg9iLmuqcuN4A8EuV2P6T1JLYHu2HBV/eZa4X8btXGcJcC/D6po52T+lEhHHvWWB3h
         j2ls5yohZgIQpRc57ONRCk0Dl0c0NSrz+npZuwAs+lgvnwqfZDt0Yr4aH8LryAq1FXv5
         lmiKe669B4WxDlkxlIROHXQDUoFYcLf3MWpHR1u3xCMLUmW1MJWpB3LRb9xg6BiNbOPi
         wiij6JGpwFbDHsCVu8IPPvOJTYP0ROa86MINyfyx+Axtzgz02YrkNBGNAEbb25J9/Nrs
         l8ZWSQl2ZNz4giXrn8v/qXAfJePgBvlLJ23I52KP0WcqtpnTAiQtI/ANCUQoe/nsirsq
         nmrA==
X-Forwarded-Encrypted: i=1; AHgh+Roc5Mwhf31yb3boCs50hPxt0svPKNHu5FoaABxQQm3y82Vef9RvKDs/AdWCbhydP8WpvHPuMpPDn7CyaCuM5fv1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsl/QiAW3yk4p2AhIhlQzRRIHnJdyotvYMbH6USBu1R5QjbWxA
	Rn61CzubKBgiOfesdzeGhM7Nl9EYPaK/bL+1wS1tUPoZMIZc+ywv54sp
X-Gm-Gg: AR+sD10LYgaMG3aI+ljQAY45He5BocdMbQ3KABjmYxSXLH1W/8QwJQIWnttkXjnhI7V
	Ewuo40dLAGgDoy0GOhgYOH73szL6PzwH+yV/dN1AyQbRQzjQ66sVuiiQm2YbiDlJg9cYpqUnrYr
	JViDMS3//dWNn0BTZESqCWjAgrebWLsu34fklJagMwPVC5V+VivnTxxq9JI6q9BJQ0BglQn3VEX
	Q2MQKRg9ptamJZrZ3IIdFC45e5SyaQ9xQJgioNChIhqnMwEYt0E5WOSavAk8HKsLiK+YwtvGJMA
	xztCKCbBoYjxL/BDeydbSiPv7D5JRsqh50HvWum/fwOVKVsUkZI5EJknKf+8hclMl0pLn/HtNas
	hS9HWahaRFZXBJc5mBHmfyMj/LXYMYZ1pklaopSduZpTiFBjtieje0pCN/7MyUi8F+v8uwfxqc/
	inaxK0SnZUE3jgiWGFPxxHMVdsnv25YrZk8/MdV8lM+EYe3lLbZBK1lu9gr/JbuR41knrrr5j57
	141zsinShYPV9QgQPo43FG/mnjcY85o8UQFIbWLWo9Kr/4T9jbF
X-Received: by 2002:a05:6000:1cc4:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-47fd72bbc55mr9339524f8f.3.1785619359188;
        Sat, 01 Aug 2026 14:22:39 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm18102766f8f.37.2026.08.01.14.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:22:38 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux@armlinux.org.uk,
	tglx@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: bcm-kernel-feedback-list@broadcom.com,
	radu@rendec.net,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	arnd@arndb.de,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Sat,  1 Aug 2026 22:22:35 +0100
Message-ID: <20260801212235.2692694-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_142241_790680_4EC5B512 
X-CRM114-Status: GOOD (  11.00  )
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

ARM_GIC_V3 selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW is met. However, ARM_PSCI_FW should be
selected by the system type, so ARM_GIC_V3 should depend on ARM_PSCI_FW.

Additionally, the systems that select ARM_GIC_V3 (ARCH_BRCMSTB and
SOC_IMX8M) need to select its dependency, ARM_PSCI_FW, too.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/arm/mach-bcm/Kconfig | 1 +
 drivers/irqchip/Kconfig   | 1 +
 drivers/soc/imx/Kconfig   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 24bc6e18d806..ff7c161df1f1 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -184,6 +184,7 @@ config ARCH_BRCMSTB
 	depends on ARCH_MULTI_V7
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_AMBA
+	select ARM_PSCI_FW
 	select ARM_GIC
 	select ARM_GIC_V3
 	select ARM_ERRATA_798181 if SMP
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..726804295545 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -35,6 +35,7 @@ config GIC_NON_BANKED
 
 config ARM_GIC_V3
 	bool
+	depends on ARM_PSCI_FW
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	select HAVE_ARM_SMCCC_DISCOVERY
diff --git a/drivers/soc/imx/Kconfig b/drivers/soc/imx/Kconfig
index 2a90ddd20104..9f0be8b66c4f 100644
--- a/drivers/soc/imx/Kconfig
+++ b/drivers/soc/imx/Kconfig
@@ -6,6 +6,7 @@ config SOC_IMX8M
 	depends on ARCH_MXC || COMPILE_TEST
 	default ARCH_MXC && ARM64
 	select SOC_BUS
+	select ARM_PSCI_FW if ARCH_MXC && ARCH_MULTI_V7
 	select ARM_GIC_V3 if ARCH_MXC && ARCH_MULTI_V7
 	help
 	  If you say yes here you get support for the NXP i.MX8M family
-- 
2.55.0


