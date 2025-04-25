Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33DFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0SStF/iIQOEBMJ3ljSWgGAAe2LTJuGj4nBnmKJGMNM0=; b=owyxyO5jF2a9scUyf/Df1i85//
	dhl1IGFGA+URXj9yMaZBO4nHoSmrcU6XEU9crqb712/enitUa81MIyuMtn7gQCuOdas0sHSCIkEaf
	YSGGXhDhufR25oliF4Mw8Qb8kNIbwMR8h46KD8xyD4H0GVKcMKeRon2sBfb6MXX6q0XLD6+kqH0uf
	y98sKBYnXgxvSAkJ1AuMxPNZOn8tIkdMSPIqHF2aoZ72Kqi2H64MYdytdRhEUY1pcz6ylocgpwSvU
	8KVN567ud5hp06uT9iZ8nhhAxGcnt5Ien+TWEzJebfpdQv+7tTCaFsq68twotrgETmiFsgqKeLc78
	p9M3oLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J3o-0000000HGny-3IeS;
	Fri, 25 Apr 2025 13:25:44 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IGr-0000000H8ec-06PI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:35:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by baptiste.telenet-ops.be with cmsmtp
	id hQb22E00l16PE0201Qb2k0; Fri, 25 Apr 2025 14:35:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGb-00000001gJW-1em3;
	Fri, 25 Apr 2025 14:35:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGk-0000000CKiv-2agP;
	Fri, 25 Apr 2025 14:35:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.16
Date: Fri, 25 Apr 2025 14:34:55 +0200
Message-ID: <cover.1745582587.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053509_195648_1576CB15 
X-CRM114-Status: GOOD (  17.10  )
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
for v6.16.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.16

    - Enable all Renesas SoCs by default when ARCH_RENESAS is set, and
      remove individual SoC entries from the various defconfigs.

  [GIT PULL 2/4] Renesas driver updates for v6.16

    - Enable all Renesas SoCs by default when ARCH_RENESAS is set, which
      will allow up to remove all individual Renesas SoC entries from the
      various defconfigs,
    - Initial support for the Renesas RZ/V2N (R9A09G056) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v6.16

    - Document support for the Renesas RZ/T2H (R9A09G077) SoC and the
      RZT2H-EVK evaluation board,
    - Document support for the Retronix Sparrow Hawk board, which is based
      on R-Car V4H ES3.0.

  [GIT PULL 4/4] Renesas DTS updates for v6.16

    - Add SDHI, ICU, I2C, PMIC, and GPU support on the RZ/G3E SoC and the
      RZ/G3E SoM and SMARC Carrier-II EVK development board,
    - Add internal SDHI regulator support on the RZ/V2H(P) SoC,
    - Add UFS tuning parameters in E-FUSE on the R-Car S4-8 ES1.2 SoC,
    - Add support for Ethernet ports C and D, I2C, keys, and SDHI on the
      RZ/N1D SoC and the RZN1D-DB and RZN1D-EB development and expansion
      boards,
    - Add initial support for the RZ/V2N (R9A09G056) and the RZ/V2N EVK
      board,
    - Add support for the Retronix Sparrow Hawk board, which is based on
      R-Car V4H ES3.0,
    - Add ISP core support on R-Car V3U, V4H, and V4M,
    - Miscellaneous fixes and improvements.

Notes:
  - The commit "soc: renesas: Kconfig: Enable SoCs by default when
    ARCH_RENESAS is set" is shared by PRs 1/4 and 2/4, as the defconfig
    updates depend on it,
  - PR 4/4 includes DT bindings and bindings definitions for the RZ/V2N
    SoC, which are shared by DT source files and device drivers.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

