Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97489C36001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2XvbyDVSJskBo7PBHWzTkL+z4Zi7bc7qcFOJ/Riokw=; b=yfbzePfy6vQhUeV+2j5FSqFO4k
	AhKiveL2Nfnh/cm/bWFCObbctHfnIrCu98d3hSt5LoNI4DF90/F3pxYNR4hRlTj9L8zqHkmLLsQa9
	wee2zbC1I3irFAmVGlhlGvpTew93UIjuajEDs1aZagUY9QBHRCqEuhi0TiM6Uz6SQM6mlhPqMkV4B
	PmhwM2xDre0ULBY+T5H+teEORsg9mRtkNL4by5hDCgi/ttq4dDTlSrT6jCTQCgpjMpCUwSjf6UBuV
	ZXE9gYF51q639FrEbkloWItDe1UUYUi+jvrFxNqsPpokJFt4KWo+V5go1aLh678aViljPSSOZF+EN
	DaaOnNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1hI-0000000AGNx-0hzj;
	Wed, 19 Mar 2025 22:15:36 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1K4-0000000ACTz-40Gb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abbb12bea54so36454766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421095; x=1743025895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2XvbyDVSJskBo7PBHWzTkL+z4Zi7bc7qcFOJ/Riokw=;
        b=affLNZjOcd6NDbrpdVHhLMze67QB7Al+rj2xVCEkdQyPUQmu2M4VvexF/tue3qQDxI
         S/c1U9IcZDo3h2QHUD0WPTN3C61H2uN39re2Iav57FNpPRY2FmhVfAuM8fyYitYUq84+
         NFuhyIEEB3b4rP3Rq+bFqznFhHi3AQ4PE3/xRAz74jjX7/hfrc6agALDrcIMikHkQIuF
         zwcT+2nWiqDdshJ6bazlYzYo3Y9w20pnQihJG+q1QyHPX34yjlRCHkCPtCzxMyDauejv
         NVpAR5clLswzCgojZFxVp8ZVf5sv/2zKkeZnC675c5xYobM999idldHjMEy/x5GTVOZe
         u0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421095; x=1743025895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2XvbyDVSJskBo7PBHWzTkL+z4Zi7bc7qcFOJ/Riokw=;
        b=g+XnaK75IM+LX3dDVLCqmQXgygkLSIvg/YLXU412EO7bosP2ljDZGj6M47i+LlNuj4
         s2KrGAxAnlLgfMfuvqMu5w2RUufcczuc+Z95RWqWOxKmekhC/Y1Pikh+SIoD6j9kdWnQ
         8rvtEwmbgvll0QDs4GOeNp4LDzJKYbytL2uVw+jrI/X4p35AABZfpWunDFXUaurtN0/T
         Q4+07ZsRnTa5Y7Qzqx9ult6SyNNiV15EYCAdFHTZs65a8rN0B564Z5M3lsPTMLi7Zqkb
         T78hezJhwtO2H4yTsMuf+ATF80OjBZ48HbhEnBsBSZJB5rA12zElAJ+ztinLhYfAYDZv
         Jlfw==
X-Forwarded-Encrypted: i=1; AJvYcCUvWbLYRCpTBP837emUrEM1nWcDLZolLh3TkbEmaTpR43lcWiTju2kh+RprNDW7s/w+RL8QMOKGPM3wSDd5Mhv5@lists.infradead.org
X-Gm-Message-State: AOJu0YzrmlY9J0yPPKXRA4caQyiKX6KYjzlz0mrW1xVo5zlZTdAng2Kd
	WXy20yoqpsO+TyHewBHCr6RQFvkMuUm084EdGqTE3p/Uh9H5jHaYfhCW/gBXnDw=
X-Gm-Gg: ASbGnctx25y1wSbe3UFIFvl8/l5v8SkPfHz/GgIlO1Gp/oQYRkEVKjvDdIGg4XHfNVt
	jmiunZgSNjxkKnxkWWB3O/DPcStugA4kry9LvggEgSquom+/ug7IBHpCu5UywHsrC02g/h4cEA0
	Pd4myldC9d8Q4dBrA2ZxSkjQjtoe0Ixzfqt6hc/5VzJT2g47portWJi8FvAZdqVs9vpV3MIbOS+
	xv+MtWHkm1MYw1LIw5ADHFiXkAKyj5YgwXnnHmX1Mz9T/abKACTXdC2IhLtnXP0GaoQE8bs1uw8
	8aERCyX1ZZQiXsx+xoEWSnTsYDkosljEUx8HgkX1pIS0/NvMRPuw6XyN1h4grjpudLbvQP+BNCH
	aEzh0IryoyA==
X-Google-Smtp-Source: AGHT+IHX36RbKmsmvvJwxpoypeNS8StLR82JyhZ5gIlVadrutECZV5YTLilKd9dggP+2xMa9LYkB2A==
X-Received: by 2002:a17:907:a58b:b0:abf:641a:5727 with SMTP id a640c23a62f3a-ac3b7c49f8bmr574608766b.7.1742421095156;
        Wed, 19 Mar 2025 14:51:35 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0f5dsm1084175966b.63.2025.03.19.14.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:34 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: [PATCH v8 09/13] arm64: dts: Add board DTS for Rpi5 which includes RP1 node
Date: Wed, 19 Mar 2025 22:52:30 +0100
Message-ID: <c6498d8cf8dfade1980b566e99a9a91551fd8b53.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_145136_990279_C91B5524 
X-CRM114-Status: GOOD (  17.75  )
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

Add the board 'monolithic' DTS for RaspberryPi 5 which includes
the RP1 node definition.  The inclusion treeis as follow (the
arrow points to the includer):

rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b-monolithic.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b.dts

This is designed to maximize the compatibility with downstream DT
while ensuring that a fully defined DT (one which includes the RP1
node as opposed to load it from overlay at runtime) is present
since early boot stage.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
Right now bcm2712-rpi-5-b.dts is the overlay-ready DT which will make
the RP1 driver to load the RP1 dtb overlay at runtime, while
bcm2712-rpi-5-b-monolithic.dts is the fully defined one (i.e. it
already contains RP1 node, so no overlay is loaded nor needed). 
Depending on which one we want to be considered the default, we can
swap the file names to align with downstream naming convention that
has only the fully defined DT called bcm2712-rpi-5-b.dts.
---
 arch/arm64/boot/dts/broadcom/Makefile                     | 1 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts      | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 3d0efb93b06d..4836c6da5bee 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b-monolithic.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
new file mode 100644
index 000000000000..3aeee678b0bc
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "bcm2712-rpi-5-b.dts"
+
+&pcie2 {
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3


