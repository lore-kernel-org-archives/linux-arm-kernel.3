Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E910ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+atj6tbSZnyOAHx8S1EZI9l0Ax2tLtMtSASHL+aezJg=; b=2iAvGaomv6ILUrd5NmydZt7Wdh
	1JG8QF1kdu2pQrbLKPx5dlsDUC3jy4nlBiteZFe4q/Zbga0k2OAxsGJtb324DlGgVQOK6RTDHWvsX
	bsKzlDeeN1KMtfwc+0YVzsShQe/DAgrqFu9fj8nj9++efomjpTqDTOWgQ+nO++Z2OrEO2QiZp6Esw
	2seySDIxkt7aCZo/TM6hpc0EXZwc8w6jvcSjaVGYZ5JzbyUqM8MDc4M2b26KW7geETanLdI7WMIQ+
	zMMEiMDHqX/QFQLo1+V4JRW34QMHcQYrYOq9lyX2wF9dCikxa2u3eWYVKxLhuFB0/JLGN6Oz7Bqzi
	NNYRuh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65OO-00000007Dlh-3oqh;
	Fri, 27 Mar 2026 11:30:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65OM-00000007Dkr-3zAs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:30:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9F0F359D;
	Fri, 27 Mar 2026 04:30:08 -0700 (PDT)
Received: from e142021.cambridge.arm.com (e142021.arm.com [10.1.36.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F5693F915;
	Fri, 27 Mar 2026 04:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611014; bh=MMb9BnVpjNbWZz9tCergxLjjgMHGFtK7m0OvUVEMGrM=;
	h=From:To:Cc:Subject:Date:From;
	b=BnWLeM3Nh8OnJQBZPCMX27PzeF5hJTWwdA863sFdQWdr/tEn+99Sk8wMGNJAuiFtv
	 mjEVIexjfBXmPQvRjQd8PMofU96qQmTL+06Hs85K0o9UaCnA5IrJ+sVZB82EbJnCGA
	 MP+GN0HXZ7iz7MBqQ6s6pB3Syf6rnojVvJcqp1P4=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pinctrl: sunxi: a523: fix GPIO IRQ operation
Date: Fri, 27 Mar 2026 11:30:03 +0000
Message-ID: <20260327113006.3135663-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043019_109649_98446F84 
X-CRM114-Status: GOOD (  13.39  )
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

Hi,

this is the minimal fix version for the GPIO IRQ operation on the
Allwinner A523/A527/T527 SoCs. SD card detection is broken as a result,
which is a major annoyance. Those patches here fix that problem, and
should go into v7.0 still, if possible.
I dropped the more involved fixes from v1, the risk for regressions is
now very low:
- The quirk flag is just dropped from the A523, not the other SoCs. I
  confirmed this again with an experiment, for both the primary and
  secondary pincontroller. This avoids fixing the workaround code for
  now, which is more involved, but for now unneeded.
- The DT patch just adds the missing interrupt. The IRQ association was
  always wrong and never worked, so this can't make it possibly worse.
Together those two patches (plus the required binding change) fix the
problem, I would appreciate if this could be taken ASAP, into v7.0 still.
The generic pinctrl code is now untouched, which makes this also much
easier to backport, and drops the dependencies on other v7.0-rc fixes.

Bases on v7.0-rc1, but applies on later revisions as well.

Please have a look and test, especially on A523/A527/T527 boards!

Changelog v1 .. v2:
- drop generic pinctrl fixes (for now)
- drop quirk removal from other SoCs (for now)
- add Chen-Yu's tag

Cheers,
Andre

Andre Przywara (3):
  pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
  dt-bindings: pinctrl: sun55i-a523: increase IRQ banks number
  arm64: dts: allwinner: a523: Add missing GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 ++-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c             | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 1 -
 4 files changed, 6 insertions(+), 7 deletions(-)

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


