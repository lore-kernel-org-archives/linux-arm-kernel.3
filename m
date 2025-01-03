Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5A3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SKStBhy7Zt9DTjfA2C/kM/g4unFS+Gw+TyNECzuXPSQ=; b=otgTNS2CXMBJdSD3rbsq4/9Hux
	Z+W0dDB0De5LEimb+EfSS8flko7NWXwnIyRepcsK06eIv99iMi/FHhLL50sKPBtAkdqvb3lfQDYky
	sgJlsse+9zdL2g6nm3pKL3Z//ZCABSz+DGCVMtXldlVLUpESBwi3flJgmmSe4+qPkrtZKoh/FSaIj
	bT379JVisRDsRsOAljHIF0GQI/fgKKkLf05IJUFgnUBPeMhuIkQgTaGGLZ7b7R2NzN+kWlddkS7Cj
	bjnzfsb2PaxHSlW+S6wFps/j3xmb5gXKSNC+4LTxyVzxYLxWHxjx26wUGLczVLJ2a1ONd6c2ACuJV
	gAQaURGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmFG-0000000DgRV-0K77;
	Fri, 03 Jan 2025 18:18:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmE3-0000000Dg6w-08AS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 18:16:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBC971480;
	Fri,  3 Jan 2025 10:17:10 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EEEF3F673;
	Fri,  3 Jan 2025 10:16:40 -0800 (PST)
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
Subject: [PATCH v4 0/4] arm64: dts: Add Arm Morello support
Date: Fri,  3 Jan 2025 18:16:19 +0000
Message-ID: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_101647_111369_845A97F4 
X-CRM114-Status: GOOD (  11.28  )
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

[2] https://codeberg.org/vincenzo/linux/src/branch/morello/dts/v4

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
v4:
  - Add cache information.
  - Address review comments.
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
 arch/arm64/boot/dts/arm/morello-sdp.dts       |  30 ++
 arch/arm64/boot/dts/arm/morello.dtsi          | 467 ++++++++++++++++++
 5 files changed, 508 insertions(+)
 create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts
 create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi

-- 
2.43.0


