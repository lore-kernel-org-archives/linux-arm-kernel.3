Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE74DD68B2C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9QgoMz2gXE6CCus76Pqiv4l7faAk9fgsWt0YKAGIKck=; b=MdE8SisxbJ2LshxqlcLCznli3E
	Xw6CbhZ9tfDGv3Pz1EJTPJOiGG8fhl+mI3cKEIuCxK8mTV5TfWfNs0w30ERYQsYhCbn+Q1PkUkRn/
	zRbhi9fOGmhc1yUxGlL/1Hm7GaigV5droMqJC7CY4QzQCyAMvcgg8QiL7RB098XPU3SM0e3PB/LYt
	YImzgxBqgug2WuOONLSi0YlNLS2Chej4IVZtJiP48Q941mIoXD+os/tagilZX8LI6iTYRgq8Oh2OF
	R0EnjCNk+Ycb0Pd+hXC7Ul94v2y09aJ8Wwo9jodv8ssbHwZBtcSusL4Rva8p5BXafayW5/2Q1je/3
	u9+3GtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBb18-0000000AEYm-47l8;
	Thu, 14 Nov 2024 14:40:18 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaxv-0000000AE32-46He
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 14:37:01 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-290c69be014so331933fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731595018; x=1732199818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QgoMz2gXE6CCus76Pqiv4l7faAk9fgsWt0YKAGIKck=;
        b=X/hDPSuyFhPb1DO7VT7eASb/pgnSlq0Mi0SyWg8GBUOxYLgwZXwvEktxwG4tNY3Pii
         w04Mte/j8KpioX7EARyI4vg/s4UIwwEs/7q092V1JefW2+ZJRDeZXifQQ7Xq03Wc4n76
         2CXCYnV1sjHoJqnBMLb8Pjbqzwdow8q76M3v1XregFZcZFdvfHhZc58Z10duaz2dCNBS
         zNbBLTE6Q70/Oe6pvMc+EnKBKpNJaxqsEOkHHgF8fUf41O7spGnYBBXjVUdZIIzTTE89
         5iSiN+LQqWlWkOSbBiMUuuSvY2yEsxTSWPGYWypjzVFnAzfnDHW7xuQ6+lx9/onbSmiz
         JyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595018; x=1732199818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QgoMz2gXE6CCus76Pqiv4l7faAk9fgsWt0YKAGIKck=;
        b=AmXusynggO2BOvaF2Aug0Otg9LLhd+TvWOXSNwV11ugbpku2mmfEWkObDbjiOZEY5a
         WqjAogbOJDggDBCEpGuUovyub/veG5WK5EUoVwAoiGMzrRZ7fxoU9z1aSIMfoOp2luxr
         kcHAyf3NQsz82t0OaKWaEImOwJKiwIncot3BKgWmblKB/LzoBLzI7+JMGTYfict4PenF
         Bx7yGebdQCOGFuax9NFHD9rgw3gI4SwG+2RF/JmYRsAB/wDIg66UXSHSQ6TcmoV5/h92
         kOsQieA64z1ej9bdEEmCO/x/qRaL6SX7CBndzAHlJxY4MGQIuRx3Cm6rvWfdLAJJ03wO
         Nghg==
X-Gm-Message-State: AOJu0YzEzD3qiXxVPyqjIw6SzXBNrRJrXcASLTrBlTXuiXJVn6wtkKRg
	duE4k0d6PH494P9H27vHL/Mtr+TzdJ0L3DfzZsQWQdcHgBuWkUA9
X-Google-Smtp-Source: AGHT+IFI3nlf8wAL4X0Sj5OS273H3/gWwdE9mh3koUy2pzCJuGW4ZTDW4qZM59jCbcJpseZpxiyxmg==
X-Received: by 2002:a05:6870:1b05:b0:259:88b4:976 with SMTP id 586e51a60fabf-296106d1d16mr2508059fac.43.1731595017861;
        Thu, 14 Nov 2024 06:36:57 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a6eaeea60sm393294a34.43.2024.11.14.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:36:57 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for Samsung Galaxy S20 FE (SM-G780F/r8s) [SoC Exynos990]
Date: Thu, 14 Nov 2024 14:36:34 +0000
Message-Id: <20241114143636.374-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_063700_041919_69CA85FC 
X-CRM114-Status: GOOD (  13.78  )
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

From: Denzeel Oliva <wachiturroxd150@gmail.com>

Hello :),

I'm a newbie and I started getting interested 1 year ago.
Well, that's the beginning,
until I learn more about kernels and the C language,
which is important in that.

Well, bluntly, here it is:

That Samsung Galaxy S20 FE device is part of the Exynos990 SoC family,
I saw that Igor supported that processor,
I took advantage of it.

It has the same functions of:

* CPU
* pintrl
* gpio-keys
* simple-framebuffer

Just enough to reach a shell in an initramfs.

The preferred way to boot the upstream kernel is by using a
shim bootloader, called uniLoader.
Changes: - Simply add dts from S20 FE device

Special thanks to Igor for helping me with that :)

Changes in v2:
- Change author name

Changes in v3:
- Adjusted value <0x08 0x80000000 0x0 0x0c000000> to
 <0x8 0x80000000 0x0 0xc0000000>
Honestly I was wrong in the parameter and the other one is
not necessary to put another "0"

Denzeel Oliva (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE
    (SM-G780F)
  arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts  | 115 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts

-- 
2.34.1


