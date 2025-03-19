Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D8FC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zRknf0FjRBxpKbN0jDt6ZYvci9VpLgXRRZUvC1VBu0=; b=o90c0aexcAZX2Pj0IZatQGsfx+
	hm1zxvJ3txsdAYm010PUG2qY06fVXMhEffYs6Tg6D/LiKdOYfns6q3ShCg6/w31HuE3L7mCFnrgMl
	pznpwMJ0WD/EKIZhs3a10/Q9gu7vccwkCdpZFlCBn7PFN5CIoqYI772vyQWPGRjBbVTDgI7pL5DEK
	6KrDAEwpe6DR38RUd1FRXy4f4MhGWO4wtEphGr8zCEN3hVa1V79kk8+phQ/R3D6zDQ4T1z0P3RXXt
	20k4YGiQ/kCV6XnvdQYihwg7VYeSNOtLtN3RWbX3oThmMI0LKtYVZmT8Qpw6FaX8r4zJ2d3v/+nQ9
	A+4D9riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1iw-0000000AGZ1-3Vq5;
	Wed, 19 Mar 2025 22:17:18 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1K5-0000000ACUa-3Pgk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:39 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so22473266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421096; x=1743025896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zRknf0FjRBxpKbN0jDt6ZYvci9VpLgXRRZUvC1VBu0=;
        b=g/tTkhue9ix19PM9f3A9WWG68nGkQWUNU4t7zBLYUYgs3n9J8q1T61AdI5O1fr35z+
         rUzd80HD7MH0QV0rTD1uT8+T31H92MBC5sV6Do0QkeXoqhmwS7r5Q1Xo/+jHYvCCET81
         7F0P5l31vHFvPVeWuCqjyHDWu+plcYd/vyqSkOjfr/V4d/q2TlfwjyqVlpW5YIwCYTu+
         l+qn7M2nC5FEphqhW2H1sE1iiFbd6N0p/I6bevVwD9H5slxd06qLBfdyeGkNoGDUR6sJ
         COpsxSBEw6tigZTO0Ewkz3Rb0dLLl7IGmr6z60ukDusYXXujRIEVV8O/oCLMP8L/OSYM
         wpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421096; x=1743025896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zRknf0FjRBxpKbN0jDt6ZYvci9VpLgXRRZUvC1VBu0=;
        b=Ozs1joE0Cze488Wld80k5sr6Kd9+JHMnCRB8t2ayuZL3q4wn+cNxLN4T7adfcUmVY1
         qbSGBoPAIGuFwWE8txEga7diC9/onAAyo51p8dNHhvdlcKQ3pKGog/MjsxJ6wlFgtbPe
         fGKcJjwxKEu2R3vg0iMNJHHN3MUyUUSGLrnUWIkdgVqRojqpw7AmgnPzQzp7WXKVwzRq
         V8Ro/P0W9Q9BsPrfQ/ruGc/bH7fIxgMghtqIBZiZDSw3cE2IoxhL0J+AFzLhPAc+C992
         S/0lgozHYuT3LOamwTqKfk0JR6nPTd3//NmF0hn03BRdOYsAg0e9rqTnLGrT2yjFEIUr
         uoWA==
X-Forwarded-Encrypted: i=1; AJvYcCXjGCxJA/bCccvk93hA7T+wz1zYFflg7jCht4TYFZjGsBQsUv/AhU8W4qcLajd/4m1L+UytcYv4Vay403zRkY1d@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk3H11pREFdh1i6mPW2SfRXQWWEKgJ5TxWXQmOJ1TimFZLhES7
	VFElTqyUAhNfupSj6Dn26KJYVwX8vh03RPhuniuz9E0nQP5VGOuQUnYS1kX8Zkk=
X-Gm-Gg: ASbGnctbh0QB97iBeVEuGgju/bW0dgBwEIVCX+NU/uzVLGefNUps7gRFkvMmg3MoqHJ
	B4Gg8624UNWgaVKE9GXs2fEZp1tWwURPRVNYbSAtd4KHRBloBkbId2yGx4jO619XMru2y/h7M9j
	wskd/Nr7H/xO/iU5eYIK2MlO57drmP+tlJ9/XFpviWzfgyVxFXICAnEnhyl0Fr93JtUj+jAQEyM
	3OnPmbNoHt8QTPLF/NRWwSmXFh7CIAXsIrgwtcwkYzDCiRmx/ynpNVF56kLKMFb4pdyMqGLCPo1
	gDzwa4Ewy9R6EVIVs4acmrqjAsWCh7gpRU7A+9yvett1y0MhfrErtZsyjp5sSIpleIMLc/Zr/65
	r0Cr0LHfLsQ==
X-Google-Smtp-Source: AGHT+IGw/NXcD0AevUkNs1VSBpy8/11q8cX74Bk4rrh1yk8V0z4OkbmrlYn4A+xrU8r1pLSBvS/MMQ==
X-Received: by 2002:a17:907:ba0c:b0:ac0:b05:f0c0 with SMTP id a640c23a62f3a-ac3b7a9504cmr543431466b.1.1742421096325;
        Wed, 19 Mar 2025 14:51:36 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa5a46sm1057645266b.181.2025.03.19.14.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:35 -0700 (PDT)
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
Subject: [PATCH v8 10/13] arm64: dts: Add overlay for RP1 device
Date: Wed, 19 Mar 2025 22:52:31 +0100
Message-ID: <ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_145137_850163_137BF51E 
X-CRM114-Status: GOOD (  17.14  )
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

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch can be considered optional, since it fills just the second
scenario as detailed in [1], which is the RP1 DT node loaded from a dtb
overlay by the FW at early boot stage.
This may be useful for debug purpose, but as such not strictly necessary.

[1] https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 4836c6da5bee..58293f9c16ab 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3


