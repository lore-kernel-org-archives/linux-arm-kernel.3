Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EF1EE644A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6MkfhPAcjdQfhQ1QpiRGhAgCnSB/uKC3la2fXm3kl7A=; b=qHdA3H7XGEAFmSZDEEb58vvXid
	vAlMKG2DU0JDIWgnwuyL4DUHxol7wZimRch0YgpsyFopqMkYqnX2xnYU28ikTyp1gPYZ8puZzRvhc
	9fRe1aS0Du5US5tAyEN3vONni3DKuD/SCrSTUFrA0WGrWpOF141VGrSs8wGi+jU7qZGDfiLoLHmmD
	FiaQmyN0RD2Lc0Qp646tsR78QRujJ9ZlrZA6kw3IIums04H11q6nEtCgTSBdhSIDXDIRvPTQajir/
	MZ9VMsjdAopmVs/+PIaB6J3B1jWAG0EopgIzFLRo/avR4nZOH5rXYu9ccp2n9E6YLAbpmtQjH5Ck+
	ZfXRUt2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4D0-00000006NJI-3JUv;
	Wed, 31 Dec 2025 21:58:22 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4Cx-00000006NHY-1Lcg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218297; bh=2fn1G9/kTdcOLJ2E5DlSdCC8IejFxaTXVYVDAn7wO2M=;
	h=From:To:Cc:Subject:Date:From;
	b=sbcNWmBYxRwB+xVOuxtbktmXTtlSZrM1yhchXq0qbkk1GOqzbV7sRhmFhVkSV0MMF
	 KU3l3O1iRBLAoBQMRHcnTmZmIG/ZlnMR4ollC1HaYphLKt1Znfmrw9Q/h9OCSWBq2F
	 pJ3bHzZinBqXRZxfz2Q2jHT8UJY5Y4z+twZo1u7ov0Ko+WLmPO4M0oWmcoIc126T0a
	 HVLWRpst48OdEI/XHk/eZsgLTyyDt6PIljSRYyJKk1pTIG/zhdZSZKh4b9UxRhwCOx
	 usrSHceX30f2YeJ08CAHdHu8d8yn5hre8dEXHoQH/QqmdBd7bfolOgJ2XQNLRzTtjs
	 UnJUzx6YoHGyw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 533313E98AF;
	Wed, 31 Dec 2025 21:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218297; bh=2fn1G9/kTdcOLJ2E5DlSdCC8IejFxaTXVYVDAn7wO2M=;
	h=From:To:Cc:Subject:Date:From;
	b=sbcNWmBYxRwB+xVOuxtbktmXTtlSZrM1yhchXq0qbkk1GOqzbV7sRhmFhVkSV0MMF
	 KU3l3O1iRBLAoBQMRHcnTmZmIG/ZlnMR4ollC1HaYphLKt1Znfmrw9Q/h9OCSWBq2F
	 pJ3bHzZinBqXRZxfz2Q2jHT8UJY5Y4z+twZo1u7ov0Ko+WLmPO4M0oWmcoIc126T0a
	 HVLWRpst48OdEI/XHk/eZsgLTyyDt6PIljSRYyJKk1pTIG/zhdZSZKh4b9UxRhwCOx
	 usrSHceX30f2YeJ08CAHdHu8d8yn5hre8dEXHoQH/QqmdBd7bfolOgJ2XQNLRzTtjs
	 UnJUzx6YoHGyw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id C275D3E97E3;
	Wed, 31 Dec 2025 21:58:16 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] ARM: dts: lpc32xx: Add DMA support to platform device tree
Date: Wed, 31 Dec 2025 23:57:49 +0200
Message-ID: <20251231215754.2222308-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251231_215817_356454_52732E9C 
X-CRM114-Status: GOOD (  13.43  )
/bin/ln: failed to access 'reaver_cache/texts/20251231_215817_356454_52732E9C': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_215817_356454_52732E9C 
X-CRM114-Status: GOOD (  13.84  )
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

At the moment NXP LPC32xx has basic DMA support in the platform code, it works
well with NAND flash controllers, but it makes sense to extend it to other
controllers.

The SoC specific dts changes were extracted and updated from an old
unapplied series, which added better DMA and I2S support to the platform:
- https://lore.kernel.org/linux-arm-kernel/20240627150046.258795-1-piotr.wojtaszczyk@timesys.com/

DMA support from the original change was dropped for a number of controllers
due to driver related issues, which cause runtime regressions. While the .dtsi
code seems to be correct, it cannot be tested and verified before making driver
changes, this concerns:
* ARM PL180 SDHC driver does not support a single 'rx-tx' type of DMA channel,
* ARM PL022 SSP driver defers its probe instead of bailing out on DMA issues,
* HS UART driver misses a feature to support DMA operations.

This patch series obsoletes another and smipler one:
- https://lore.kernel.org/linux-arm-kernel/379f38ac-ab4a-4615-894b-e404bea4a6a1@mleia.com

Piotr Wojtaszczyk (3):
  ARM: dts: lpc32xx: Use syscon for system control block
  ARM: dts: lpc32xx: Add missing DMA properties
  ARM: dts: lpc32xx: Add missing properties to I2S device tree nodes

Vladimir Zapolskiy (2):
  dt-bindings: mfd: nxp: Add NXP LPC32xx System Control Block
  ARM: dts: lpc32xx: Declare the second AHB master support on PL080 DMA controller

 .../bindings/mfd/nxp,lpc3220-scb.yaml         | 74 +++++++++++++++++++
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        | 41 +++++++++-
 2 files changed, 111 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml

-- 
2.43.0


