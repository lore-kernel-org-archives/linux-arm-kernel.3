Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AC410F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=50lIdhKTSjFiXhp7KdhpG4sq5lFzwW3+qhcXGb0/56o=; b=vpcsIBbe4t/fW7NnWTeIaRr+Ul
	7iosogZHMQciPm1TTy7wbXOfpgLZC/IDbXYHn10i1LQXX+eLza4bSqJk7IH4Ec1PinMMDawDlrpWN
	Wzv1W5QqOle6SuNaDm9Aucsenx/wFMP8GDdbekMq4HcGtFxKMkbnHribGUGY0GpuY2teC7HdrFg/l
	9ZGKxYDDrVvfqhFAhfmR88kWfy9w2VqT5jO6938+HRSqtXJorlKtAZKEYho1iPSyItoaFZswkc+Dy
	5BMJSRHY+xNcprhf4cgEXw4e2ivH7BLF5hdeH5T5sdoI9xs1mUNJQC+7r2CYRA8/m/SfMNcedBEa8
	XrqbD9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVX-00000008uZ0-2zuu;
	Sat, 28 Mar 2026 12:11:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVU-00000008uXX-3Z5v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 12:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C86654412D;
	Sat, 28 Mar 2026 12:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF20C4CEF7;
	Sat, 28 Mar 2026 12:11:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:03 +0100
Message-ID: <cover.1774606536.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_051112_905436_7E5628B6 
X-CRM114-Status: GOOD (  16.23  )
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

This is my second pull request for the inclusion of Renesas SoC updates
for v7.1.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM SoC updates for v7.1

    - Use the of_phandle_args_equal() helper.

  [GIT PULL 2/3] Renesas driver updates for v7.1 (take two)

    - Mark remaining rz_sysc_init_data structures __initconst.

  [GIT PULL 3/3] Renesas DTS updates for v7.1 (take two)

    - Add DT overlay support for the MayQueen PixPaper display on the
      Yuridenki-Shokai Kakip board,
    - Add Ethernet PHY interrupt support for the RZ/T2H and RZ/N2H EVK
      boards,
    - Add SPI and PCIe support for the RZ/G3E SoC and the RZ/G3E SMARC EVK
      board,
    - Add DT overlay support for the WaveShare 13.3" 1920x1080 DSI
      Capacitive Touch Display and the Olimex MIPI-HDMI adapter on the
      Retronix Sparrow Hawk board,
    - Drop several superfluous C22 Ethernet PHY compatible strings,
    - Remove WDT nodes meant for other CPU cores on the RZ/V2N SoC,
    - Remove unavailable LVDS panel support for the Beacon ReneSoM base
      board,
    - Add initial support for the RZ/G3L (R9A08G046) SoC, and the RZ/G3L
      SMARC SoM and EVK boards,
    - Add Versa3 clock generator support for the RZ/V2H EVK development
      board,
    - Miscellaneous fixes and improvements.

Note that "[GIT PULL 3/3]" includes DT binding definitions for the
RZ/G3L SoC, which are shared by clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

