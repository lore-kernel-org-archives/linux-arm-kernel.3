Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4BDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bErzQ9zrcCsnZUJxxATZS/jrX6rgAr1cnGOY/r8rnKU=; b=VDU7ngP2vRtUlrnUCjZCdgA/ug
	saeutYpX2Lpb/K8XGN5SONBAZJ2qMAqYcWYZxluJRUG4Ril4/86Zu22c0xvu27oBfxdCTM0aD2W7N
	ldSZ7n4UfU1T3yNNo/BddAjj0/dCdJ+RA0oTyOea1teY7R0f4aNGCw21TIm15MEZY6F+zVtn9Nhth
	4hpfcoEAFO4+zVDuOu6OYerzUqK133xTteqqxaVWuzUU+BkNNULpVVtW+RRvP05x7OfKeOVuZ/vSQ
	Q1B2Fn3yTkw1onlhKVX1DXSFysNzrkg4SsfKi8be1/Rl3C+D5f2FeAHG4MvAjCN/zCA7h1fzZpCHg
	8hTCKQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNY8-0000000AlCw-1D4f;
	Thu, 02 Jan 2025 15:55:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNWs-0000000AkqH-0xY2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 15:54:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E47211FB;
	Thu,  2 Jan 2025 07:54:59 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42BF33F673;
	Thu,  2 Jan 2025 07:54:29 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 0/4] arm64: dts: Add Arm Morello support
Date: Thu,  2 Jan 2025 15:54:12 +0000
Message-ID: <20250102155416.13159-1-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_075434_312499_7CEDFC89 
X-CRM114-Status: GOOD (  12.02  )
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

The Morello architecture is an experimental extension to Armv8.2-A,
which extends the AArch64 state with the principles proposed in
version 7 of the Capability Hardware Enhanced RISC Instructions
(CHERI) ISA [1].

This series adds dts support for the Arm Morello System Development
Platform.

[1] https://www.morello-project.org/

To simplify the testing a linux tree rebased on 6.13-rc5 is accessible
at [2].

[2] https://codeberg.org/vincenzo/linux/src/branch/morello/dts/v3

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org> 
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Changes
=======
v3:
  - Address review comments.
  - Rebase on 6.13-rc5.
v2:
  - Addressed review comments.
  - Rebased on 6.13-rc4.
  - Renamed arm,morello to arm,morello-sdp for clarity.

Vincenzo Frascino (4):
  dt-bindings: arm: Add Morello compatibility
  arm64: dts: morello: Add support for common functionalities
  arm64: dts: morello: Add support for soc dts
  MAINTAINERS: Add Vincenzo Frascino as Arm Morello Maintainer

 .../bindings/arm/arm,vexpress-juno.yaml       |   4 +
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/arm/Makefile              |   1 +
 arch/arm64/boot/dts/arm/morello-sdp.dts       |  55 +++
 arch/arm64/boot/dts/arm/morello.dtsi          | 341 ++++++++++++++++++
 5 files changed, 407 insertions(+)
 create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts
 create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi

-- 
2.43.0


