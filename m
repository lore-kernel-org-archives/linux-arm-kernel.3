Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2775CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 03:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ac2bCkNoG8C1zHidrf71kjJ2gMAt5aTUT2C3bhGfMTI=; b=JcT/HEky+h1rckzrko/JGIyb4J
	O8JOeasob/+nNIibSUkcFoQcT47HocZLvyNFigyuFyqgI1BpyaWSeO8ij4Rvy0PJ+YomBOA2m2eyv
	pt62uxlsJfgP4g/akp4ukhDi3YqZKuABzZBxl753haaAC5zvdYOgQwZnlCv4SRqzho91xJVuoDqFK
	iVQhPenq6YTxUuWOqSbrbZgxlb3HcpMmtRrWz8yaSpGvGrnZCLkR27wUMHRU+yM0rqInmDLghkvO3
	kPk6oazOln7SZBXWuch/jlezLuvwZ/btVjtMD3ZYXh0RUYllTxBZ6z4xHFJCqfQFDPcSDtfeohPyB
	p2vPrFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMYu-00000004Qji-3aUf;
	Thu, 14 May 2026 03:16:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMYt-00000004QjB-0Lqy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 03:16:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-367d88b9940so3811884a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 20:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778728593; x=1779333393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac2bCkNoG8C1zHidrf71kjJ2gMAt5aTUT2C3bhGfMTI=;
        b=ZHCmm6ZyV0nnpeZ3mrcPMHK9ju4vPzBVcWxjljO4qYRF7qRgqpdLojVHwyBDjBnOaI
         oDZl3Lmn8+a4yeqT35s2CFpZhfIO5acgOb0vjjkdbVZBu+aPFa1vDZDuYrVQIwDcK9yB
         vYk1dkpcn0OG6QuJ9jOTCqHWtZAXyHeLgQ9ClrMAToGLmyE4TGeErBdY+ynEEz6O57pw
         5L6jWexTZVoUIkJaQihSHI8ELF0VgA2s+9Yprq0ilpLt6kXRfdb4IlOu9ZcNLfTC/485
         w2FedrZII1CS6uX2G1zNWIGYXgqwrV8PcFk3rCu+O3VWFm4o15LT/AhqW0mYmdgfr4xZ
         SL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728593; x=1779333393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac2bCkNoG8C1zHidrf71kjJ2gMAt5aTUT2C3bhGfMTI=;
        b=dgD1FhfTawhTogjLCqSHpBZSqTyAktKNNU4kVs6QY6U01RkeGqwQ/dRoveLJDmtJPW
         OE2QwD4CCnrKfB1h+DL9qzE3kGYNdi+1xd3mx2th5iuwOzwV/Ys4X37axcgDSRAS6oaG
         HN3+IRvdMUv7M1BPsgLFjTNBFx4cNfylq1nBvvO6LagJ0ikwHgDWPjhGgQ4NOlKtMkBD
         RTQGWiJBWNbMjFAqcAulUQJBdiTYVcr0nQb9AofMezcylo9Sdb8wrC8PbZD6DMwJCRei
         OnZZxW4qfSbME/wYhGvob0vnUL2wzpvqWhtrHR/UcB0aB+apHe5IbzjMMvexOhkiQEMG
         lSRw==
X-Forwarded-Encrypted: i=1; AFNElJ8reb2NkKKcDyLQQMmiqfWlEANvqfC7ka6eZ3nHOiZ8/Xk6u0nAsnDvQYu5S54XxA1gZpi4gQyTKAj0qcjPfrWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzV9ohOqVmohCvAHBtXTCOyEpoFy9ANNvSZ05B8TKrvY6GjhByh
	cMfpwbUHP1hm2cd7ZVTHAspKmonuTXFD6udA2q3L2y9HE1UPm+2NsYii
X-Gm-Gg: Acq92OGGzytWO9iguQKkxEWOBf5qMm/IjT64/Ug7JbALhN+c63+lvbhN1FPSvbBi13f
	V7OZe3VeJ2VN7iUTrsLu3e5BxaJUwrdZinRHcqKwElEN81kAnBDB6r4QMqwEbV7cy+yHPZOm4mM
	AwQdbZpWJi/RxkuOBkQGyhA4NquxWd7/L1Q44OmDpHPQKHmlKAbT+MxjNkVFUPt1QS89KZRmPSo
	I6kF1kyvUHm8zkaQeZxTFcTtvmU7SLFhmA4P6G7AULK1JucM2NL7jpF0Bx4OFzsXwCEgZIWOb3F
	piOHa71of3Ja3GoZyIvYRlxGfXZtvqOvwEgv/UO4wcCldjnG0dNZTVufcLA+zqx5PdYri1jYUun
	LkMdAZqNgF1h5wc7kvRUuS5jANR8b7pk9SpSL3Z1Bqx+AzVcV1DakrXp4yby6OEBhx6/6yt9S8H
	jOegNzq596KRx6TDx9EI1SPwr9gwBpsvPBDv9p826I
X-Received: by 2002:a17:90b:4ecd:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-368f3ad4d10mr7021996a91.2.1778728593250;
        Wed, 13 May 2026 20:16:33 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm320047a91.7.2026.05.13.20.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:16:32 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U support
Date: Thu, 14 May 2026 08:46:20 +0530
Message-ID: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_201635_155664_C2D2DA36 
X-CRM114-Status: GOOD (  10.63  )
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

This series adds initial device tree support for the ASRock Rack
B650D4U BMC, which is based on the ASPEED AST2600 SoC.

The B650D4U is a server motherboard for AMD Ryzen processors. The initial
DTS describes the BMC console, FMC flash, dedicated management Ethernet,
FRU EEPROM, and watchdog.

The dedicated management port is described as MAC0 connected to an external
Clause 22 PHY on MDIO0 at address 0. The MAC uses RGMII with RX internal
delay, matching the vendor DTB description.

Tested:
- Built aspeed-bmc-asrock-b650d4u.dtb
- Ran dtbs_check for the board/aspeed binding
- QEMU boot smoke-tested with ast2600-evb

Changes in v2:
- Added MDIO0 PHY node for the dedicated management port.
- Set mac0 phy-mode to rgmii-rxid and added phy-handle.
- Removed unused GPIO include from the DTS.


Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 71 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

