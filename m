Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A134C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujU17mPoSs0aAk2xXVdhVwgYD+BgoPNEw5fp/qvvTY0=; b=NiK5xHtYdy7lzdBWxQ/Y/D29YW
	kKIsDY4fkF8XolK1Juis/tR1Dzm1494CnpOGSBdHRkhhqsQho8XncgLtOYHo/eU1B59beGPQ0R8Yq
	1PLrxg5piYXz8CnAQ/1DzNShZeSKSc3ocFUCC1oiPnfvcO6z5Pkj6xuG3RZQhjosLc7RbE86H7EFx
	4V93xq/F6DRGSpiNwQJPsZelGHLnyjunPQR+8s6aXHmb30WDgQJ0umtSBf1W2/So+DaLzRgkpcbh4
	iA0xhH+hAsPcpeb35cKDsnIlNhrQi9Fv8R4TkweXAIwQ3IFWnBr6AkNOw+O4Y7XhhKdoN0KnMPF6w
	4YwuvnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8to-0000000EkAw-0EHR;
	Fri, 27 Jun 2025 13:13:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8NU-0000000EfJu-3zvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A4BB45527;
	Fri, 27 Jun 2025 12:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE71C4CEED;
	Fri, 27 Jun 2025 12:40:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.17
Date: Fri, 27 Jun 2025 14:40:15 +0200
Message-ID: <cover.1751026657.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_054025_014411_D5B6750A 
X-CRM114-Status: GOOD (  16.70  )
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

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.17.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.17

    - Enable modular support for Renesas RZ/V2H USB2PHY Port Reset Control
      in the ARM64 defconfig,
    - Refresh shmobile_defconfig for v6.16-rc2.

  [GIT PULL 2/4] Renesas driver updates for v6.17

    - Initial support for the Renesas RZ/T2H (R9A09G077) and RZ/N2H
      (R9A09G087) SoCs,
    - Convert the RZ/V2M External Power Sequence Controller (PWC) driver
      to the new GPIO line value setter callbacks.

  [GIT PULL 3/4] Renesas DT binding updates for v6.17

    - Document more board part numbers.

  [GIT PULL 4/4] Renesas DTS updates for v6.17

    - Add SPI FLASH, camera, and Ethernet support on the RZ/G3E SoC and/or
      the RZ/G3E SoM and SMARC Carrier-II EVK development board,
    - Add Ethernet, USB2, and PMIC support on the RZ/V2H and RZ/V2N SoCs
      and EVK boards,
    - Add timer, I2C, watchdog, and GPU support on the RZ/V2N SoC and the
      RZ/V2N EVK board,
    - Add debug LED support for the RZN1D-DB development board,
    - Improve PCIe clock description on the Retronix Sparrow Hawk board,
    - Miscellaneous fixes and improvements.

Notes:
  - PR 4/4 includes an immutable branch in the PCI subsystem, as a
    dependency for reworking the PCIe clock topology on the Retronix
    Sparrow Hawk board.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

