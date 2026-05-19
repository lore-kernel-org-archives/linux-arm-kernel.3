Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B828DCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TVMNjYp755M8+4T9x5MGyoPOGuBXWSBcF3YvbBoDQvc=; b=reFFyoolEpgdtn09EOkKhVyoPe
	Rs6KJ0wocI3Jwnohqe+/em6EKKPUrrOHc9JBrdQfwfl1NCpWJ1Mfki7FA++CA8me/eQ+38J6MbGcm
	ptzPXglTWJkHkYtausUkFytv9FOwp9IXOXY3e98JeFopVzxaU9TG3sBcUke8RhLwJkt56lKuPQBo4
	l6/KrPpkYo+juy2e9cn+8Nu/68ZQQxvkAvdVchyWsm4Ojo5YdjQinFCN69td34qceLpe2fmooqM0S
	Bq7+n7a84c+IY9wOct/n+Cb0D+H8PKndUgfgFjRFIo4UNruJdB80H9TgIwgL0ACEsj4HZCA0mX1/P
	42Fju+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHo4-000000016Xk-24d2;
	Tue, 19 May 2026 10:36:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHo2-000000016XK-3Udh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5B8060126;
	Tue, 19 May 2026 10:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACE4C2BCB3;
	Tue, 19 May 2026 10:36:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.2
Date: Tue, 19 May 2026 12:35:57 +0200
Message-ID: <cover.1779185457.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
for v7.2.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v7.2

    - Add Multifunctional Interface (MFIS) mailbox and product register
      support for R-Car X5H,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/2] Renesas DTS updates for v7.2

    - Add GPU support for R-Car M3-W(+)-based ULCB and Salvator-X(S)
      development boards,
    - Add Ethernet, OPP table, interrupt, pin control, and watchdog
      support for the RZ/G3L SoC and the RZ/G3L SMARC SoM board,
    - Add Coresight support for the R-Mobile A1 and APE6 SoCs, and the
      Armadillo-800 EVA and APE6EVM development boards,
    - Miscellaneous fixes and improvements.

Note that the first PR includes DT binding definitions for R-Car X5H,
which are shared by driver and DT source files.

Note that the second PR (1) is based on v7.1-rc3, as PowerVR GPU
enablement has a dependency on commit 26735dfdd8930d9e ("pmdomain: core:
Fix detach procedure for virtual devices in genpd"), and (2) includes:
  - Renesas SoC fixes for v7.1, which are already present in
    soc/for-next, but not yet in v7.1-rc4,
  - DT binding definition updates for the R-Mobile A1 and APE6 SoCs,
    which are shared by the clock subsystem and DT source files,
  - DT binding definitions for the RZ/G3L SoC, which are shared by the
    pin control subsystem and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

