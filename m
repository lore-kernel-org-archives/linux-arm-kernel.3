Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24ABD132C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QQMElMUyksExLJvRkX9ZlmRfsJiWvCdULg8GwEfhm/w=; b=nB71QCn3HuNJ6l9VkxY4PdfC02
	YL+YTY63nIhgsAO0wQoPco73G0dzbVMHZ810UuRJaBmBK8Zx0ojm41g08yMD/vCEnLtScxQbCRtoK
	mF6qdXMbP9PGMSU5KsPuGJHFeHS09T0EZ9dAE08RZaZfpi1J2Gg85JCyl2aUMNvagz1yu+AUeqMZU
	mdkQo2nxPbFYHN9big+X6MLRLX2no1nRrjI3XN+6LGImaIeiB/ryCn+ZgnC29IMvaHZQPyPg/SLlk
	vdJsDGnu90AuSfkxJVpzNRIsJ+EiQEuIsqdAAVysPtB9vXtapsgGXq/d62wyxcLc86VVQwn7GtsJI
	4LEm3gEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xEe-0000000Dt7q-1ZhS;
	Mon, 04 Nov 2024 13:35:12 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x6W-0000000Dr0n-28hQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:26:50 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by baptiste.telenet-ops.be with cmsmtp
	id YdSh2D00Z31l0Qj01dShxP; Mon, 04 Nov 2024 14:26:42 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x65-006FvL-Se;
	Mon, 04 Nov 2024 14:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6P-000BJw-Gs;
	Mon, 04 Nov 2024 14:26:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.13 (take two)
Date: Mon,  4 Nov 2024 14:26:38 +0100
Message-Id: <cover.1730726152.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052648_717326_E2C3F1F3 
X-CRM114-Status: GOOD (  16.64  )
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
for v6.13.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v6.13

    - Enable Battery Backup Function (VBATTB) and RTC support for the
      RZ/G3S SoC and the RZ/G3S SMARC SoM.

  [GIT PULL 2/2] Renesas DTS updates for v6.13 (take two)

    - Add a CPU Operating Performance Points table for the RZ/V2H SoC,
    - Add Battery Backup Function (VBATTB) and RTC support for the RZ/G3S
      SoC and the RZ/G3S SMARC SoM,
    - Add DMAC support for MMC on the RZ/A1H SoC and the Genmai
      development board,
    - Miscellaneous fixes and improvements.

Note that this includes DT binding updates for the RZ/G3S SoC, which are
shared by DT source files and the clock driver.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

