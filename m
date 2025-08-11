Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACE2CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlWQwa2PAoVxO2iD+h8/whtAT2rN/XrFrW/caXqog0A=; b=P+JHIpIdFpidu/z1b2qPnTaiS8
	zM18pi3AaoonqoFrnp2bIcyHaw4ID6qxBoJ6J98NJo1/aGJlkHZ0Jk2D9CjIrZ2/GYHvL/pwrqOtm
	EhT2DKOkV/f+Hm94GXBbo2MrmGivMY7XZmfcS3lkFQxVK2LAFCkLLAPc4Oa/ZWiZ4u7Yrd/m8ztv7
	KLNAdR5trWhoAI0uqNEfICSTNBwDftZNE/2qbMkMqGSTTwZZR94+aujcnfbhmZVl+nRqVeLqvWNbH
	/7RtpnUsLeV9lSnhIReaM86F5CvNVOgx52U0zj8kAzUB4yb62OnohEQdqg9adfNEDZUumcoOFvWXo
	s6Oz3glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVDb-00000008MvY-1vWh;
	Mon, 11 Aug 2025 16:17:51 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTEj-00000007y8k-0LjS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:10:54 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-61580eb7995so8929038a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754921451; x=1755526251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlWQwa2PAoVxO2iD+h8/whtAT2rN/XrFrW/caXqog0A=;
        b=WeaytjFy0nh8V6im9gSegr9f51EBi/ulym3+OYa3j7pr/xovXmAnEgG98BPwVm5Vva
         IUSDuxn4zD4LvYc8GqsQmBTA3/AFDu7oPkSngn7vFETHOxdTYdwdlHtfG2CD7xtfvr3a
         0LSL1ZmdvT4Q0tv7VF4+FYPOTWX8F2zhcpCMCHK/dDSjthIc4Q/9tf/kH+urrrOc18DB
         Enu7Rm/BUF+wf1miTJ95RPOiJRUMmyMt+qEOELlam/8ddEwdhVXlwUXw2mQFg1t3STMQ
         OxxpESAUeI5FFiMGrqM7DG1HtSqFNa8Z/tINrfMki0d+kHseTyAsQJnmVup+1amNj7Ee
         KOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921451; x=1755526251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlWQwa2PAoVxO2iD+h8/whtAT2rN/XrFrW/caXqog0A=;
        b=n4iU9RsUn1JC61IEWjhMdeXZzJ3PZbPPrP0lZhi5nJHky5viUV1tOVcjBKaUD9pb7V
         NzqTAHNRYIINk+VaAkWW5avAWMdEVaW12npBodNubzJH5+VoBKT3u9mbYqrQUEnmOlMt
         7vJXymbLQmlwWyZq43tEjzVi6wA4Ty9tdJ3ac9GbNT9OkshxKIWFqT9cgBiWIQDDUDAY
         xAjAfyH4Mnr40VMLIymO71blOPtq15/Kc5UoSpmdfYmBbw90oLjYJQbMZ0HrJqRABi0o
         sJnYblGLAS2EGI50NuCmPXstZ/2ulvq0GleBW6ZoF5cNUYGmTtHyiAYs1wrj08dIw2k7
         XdSA==
X-Forwarded-Encrypted: i=1; AJvYcCVYsfkj2XlEQXoiOakOgkvXkNKinL0KlPecD8NPyqgZ0PWTy6/NtgPHp4rzGUXQlukGWMSw/nH4W8MeBjP6Ih4g@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi+bQYiBlsTu4IsHByFVO1Wea3we4UivgfNxEXDehvuJvzFbA3
	ncU3jjv5RO0w7wAkTige4kGYnTY9lOd00ucjW6qodhqfI2HVg1zVNn5/Po3VxF1SgK4=
X-Gm-Gg: ASbGncsXD43n/vFitzwmupMLXqh/BjlbwNaCUZbZl6cGfd/rIsHCsADxQMInqZ5UA85
	UPqXRXB6TGTw4e4xo2fJGMpGyJAaz5/y7V4JoK6yAWaFnhziwxgSDwGDNDIkrNow18WFxXV8gCY
	0ov+64CygW5gZDlqzZyEu2YPuyCmEMnZ+zAaNHIfy5csjJxBOT/NNs200mwB2b+84uR6bMdX1o0
	xF0K+gBO2ATxkjkVC10QZ/27zyA6oWNU/TfHfd3FB5b9KQld1rXFZaejHju1Z46fvT09SwtZjgi
	UzCwjPqQYzusF/gQ6o1ELIcct69og3vvyeKiEApABjGfudsp4Dx1MfQmCdXSS+US5thNUu4mZc9
	yvHIquvpD0RjZTYZheWlQHDxgD+e7YOebQDLMqGOeRpOi5nLXpZ5xf9HAuA3wL4b54Q==
X-Google-Smtp-Source: AGHT+IGSXO0okwpD5kpNnaGjEGTT73fQPhYl2aV7TxCeznx0RSbicpQ7u0NLlVgRRhjgMGZAIA2ZgA==
X-Received: by 2002:a05:6402:3491:b0:618:4a1b:e311 with SMTP id 4fb4d7f45d1cf-6184a1be33amr433396a12.3.1754921451307;
        Mon, 11 Aug 2025 07:10:51 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2c265sm18398979a12.26.2025.08.11.07.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:10:50 -0700 (PDT)
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
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>,
	iivanov@suse.de,
	svarbanov@suse.de
Subject: [PATCH 2/2] arm64: dts: broadcom: amend the comment about the role of BCM2712 board DTS
Date: Mon, 11 Aug 2025 16:12:35 +0200
Message-ID: <47f6368a77d6bd846c02942d20c07dd48e0ae7df.1754914766.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754914766.git.andrea.porta@suse.com>
References: <cover.1754914766.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_071053_126801_7B0067D4 
X-CRM114-Status: GOOD (  20.39  )
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

Current board DTS for Raspberry Pi5 states that bcm2712-rpi-5-b.dts
should not be modified and all declarations should go in the overlay
board DTS instead (bcm2712-rpi-5-b-ovl-rp1.dts).

There's a caveat though: there's currently no infrastructure to reliably
reference nodes that have not been declared yet, as is the case when
loading those nodes from a runtime overlay. For more details about
these limitations see [1] and follow-ups.

Change the comment to make it clear which DTS file will host specific
nodes, especially the RP1 related nodes which should be customized
outside the overlay DTS.

Link
[1] - https://lore.kernel.org/all/CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com/

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index adad85e68f1b..865f092608a6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -4,8 +4,14 @@
  * the RP1 driver to load the RP1 dtb overlay at runtime, while
  * bcm2712-rpi-5-b.dts (this file) is the fully defined one (i.e. it
  * already contains RP1 node, so no overlay is loaded nor needed).
- * This file is not intended to be modified, nodes should be added
- * to the included bcm2712-rpi-5-b-ovl-rp1.dts.
+ * This file is intended to host the override nodes for the RP1 peripherals,
+ * e.g. to declare the phy of the ethernet interface or the custom pin setup
+ * for several RP1 peripherals.
+ * This in turn is due to the fact that there's no current generic
+ * infrastructure to reference nodes (i.e. the nodes in rp1-common.dtsi) that
+ * are not yet defined in the DT since they are loaded at runtime via overlay.
+ * All other nodes that do not have anything to do with RP1 should be added
+ * to the included bcm2712-rpi-5-b-ovl-rp1.dts instead.
  */
 
 /dts-v1/;
-- 
2.35.3


