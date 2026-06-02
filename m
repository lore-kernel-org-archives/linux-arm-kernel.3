Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E4DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxxG3sxLN/Uuk+t7td4zwCVsz76654fGw3zkw6fR8J4=; b=uGKOhwKHb5G2XSey6fY00uVCXG
	LQIC+KR/XMT870prSRPjLbYXUiK3Xoa3nN7qX5fivEh0UZE4odBQur/CfEqgr54VV4rAmZcP8+oaw
	NxlrikuJYedVRlDXwe73b8nAF00l8AI5barIJq/V3bjQMvIkxZKg8ZsRH3yL+2tsba7GYECeLy1Zt
	ErgUxAocM6/kCHX0TAr/aHjlhHHxZkr/+iUlz0uvchAGV6m+aZhHocmAxujQNQnOz7US4Sz8pvbN4
	h/v9Ca1u+y0Y0Ho/iacAAYYAmT70O/8GN53O1hslLIeqN/M3SgOnH6lmdOOtq6Gk43C8aWDeLJJ4O
	NTIIZ0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs4-0000000D9tE-2CJS;
	Tue, 02 Jun 2026 14:13:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs0-0000000D9s2-3ROS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:13:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so87080805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409607; x=1781014407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxxG3sxLN/Uuk+t7td4zwCVsz76654fGw3zkw6fR8J4=;
        b=RhnD/R032iX0i04N3WizkK7U08AWH8ESGEYIHAOd7fK9DTYRA14cXiTV9IMd8Z2zNy
         yg4ubIgprZY2P9w6mfwYK5TzXdYmgQItSntjfHLNboa/vQkuXx+gjIkxxb8zISH3uFxR
         +NqRCcHgw+EPHX4jr2ObphYji1rXxBbcJXZI51vCJOYxJtuNa1uBZZofnfpYhBwLnJ4e
         UAqROb0MP3K4b99QLAFihoMGGhM/Sv7+JfL/GmxxoDqMeMjJ9IWL2nmtGqI0vszYtqh5
         cM3Ks9/9pF8NlosGqRkiCxsRY9Hsc/sr7BJnILl1t/YGat/xfBNOYvK+L9zOHXK/0LRD
         XNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409607; x=1781014407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxxG3sxLN/Uuk+t7td4zwCVsz76654fGw3zkw6fR8J4=;
        b=W1UJJ3/tgw2zWhHggeECU3VtFarQ5JuerGyJu2UR60sP3/YjTa5t4tsJwPclPjPRh7
         H0OZJdtWWAAfLkRAngahbpDjGgVlxaDNo43i4nsQlwddbr7SuYxup+t7nulvHup43ROU
         WVzWdxbdnSePzLhH82FuDvZvGGKWxuoCBYNw3Meoodw6yrVsfP0w9rUGWOdOYVKJhGzJ
         vtBhrIijPcJnAY3HyzVTp60VuaNh67WtJwe0c7rk6YoZildxzm8M6e/3Z7nRiD42lBrU
         nwqbeQiZC4tUVjzbdHyqCSaFwW7XT1UJhhx38CkaM9JqL+Bee6qoKfhrzFAEUdRzxP4I
         iBUw==
X-Forwarded-Encrypted: i=1; AFNElJ/AlJD2B3+qlBQiOG96ps0bY4iFExVxje2ybKY4QQdqLb+0ELksJmytWy1ArJ7dHrVkEes8j1C2dVP+3jd4A8Kn@lists.infradead.org
X-Gm-Message-State: AOJu0YwexDEn90mg2EWncWfnhJx3WuphURql8FmiaoMKyO0mwKgAdp5U
	vU2B5SK+11SsSv8dohPKMobWF7gPClnG1iPfB9CIUskM5MZ8e0UInXoA
X-Gm-Gg: Acq92OHGry/Fqjs9TP04VX2yYA+j8XpzpdhTQ5/ICVkwT6dByyJKlqo2u8XLvjJs+GJ
	Xf9/ckq1cSIH0iXKSZectJNeYIdo+jJdc/vSQUZ2UrQVPH0sqd53mBR6JmZmzYeFVlXhOLKncPl
	p++qEWzrPKNcsn/XoFXGk9qMTYIlY0qkM0eV57bbTbjQgqC+NTWxsDk6SEWb4N7q58+Pm0bIUxJ
	rgqDMdpF1x0je28OkBdx7jzVoyA++ven1+LSSE16wEkbctbecdRUjrvakDHlKlwPvd5mj6sGUw8
	86jS3FPZnJWtOp7LXXGhJjS0Fp6XBetsoTLLIaygemTkR45RnejLHXKzkSOvBMdQ41Eb0lTKncF
	RVeKnS0ibqLThkZe6J91Y5RFSgkkotnXDW1cyHT9Vb+/4vkQaPaXyXf9qgCpbcIetQhBDeKwTHf
	ogu6qNcyXDgpO7anyEScxmIgCq5AMX78ifXezF
X-Received: by 2002:a05:600c:8582:b0:48f:d1c0:721e with SMTP id 5b1f17b1804b1-490a2921e1fmr225702915e9.12.1780409606574;
        Tue, 02 Jun 2026 07:13:26 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:25 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: ti: k3-am62p-verdin: Add device tree overlays
Date: Tue,  2 Jun 2026 15:13:10 +0100
Message-ID: <20260602141311.1366818-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_071328_884219_520662C5 
X-CRM114-Status: GOOD (  11.85  )
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

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays for the Toradex Verdin AM62P,
bringing it in line with the overlay support already present for the
Verdin AM62.

The first patch enables Bridge Tied Load (BTL) mode on the Nuvoton
NAU8822 audio codec present on the Verdin Development Board, combining
the two loudspeaker outputs for higher output power.

The second patch reserves the AM62P MCU_UART0 (Verdin UART_4) for use
by the Cortex-R5F co-processor as its debug UART.

The third patch adds OV5640 CSI camera support on Verdin CSI_1 in two
variants: the current CSI Camera Set 5MP OV5640 with a 27 MHz oscillator
and the legacy CSI Camera Module 5MP OV5640 with a 24 MHz oscillator.

Vitor Soares (3):
  arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
  arm64: dts: ti: k3-am62p-verdin: Reserve UART_4 for Cortex-R5F
  arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras

 arch/arm64/boot/dts/ti/Makefile               | 16 +++++
 .../ti/k3-am62p5-verdin-dev-nau8822-btl.dtso  | 14 ++++
 .../dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso | 17 +++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi  | 72 +++++++++++++++++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtso  | 18 +++++
 .../dts/ti/k3-am62p5-verdin-uart4-mcu.dtso    | 13 ++++
 6 files changed, 150 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso

-- 
2.54.0


