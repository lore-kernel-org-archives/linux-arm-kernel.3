Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA87F483CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OAOYw+2PZDy1rmeIxFT2+QebchHq9zng3f7O10ROQ5k=; b=afI6S5oRkhmkHCRWVBf7PaTI8z
	5J/8XMoZJIYVvcYnmnja/JHpmfoSh+A3TdcAJHB37+XHkXhdLzrNLchAVvUSvKK6wf4Y5rNH3HoQH
	GaqzJLlTzJ7CjcFmv9uVycCeAeVmkYcF3iayF7EN2zEEr1xvkF9TLm9t23gpK7L1n+OzJ7DM3r3d5
	xRlojrkGn7w9GDqyT/mrnoqWkXvx+5TFsG8ZZNi1TE0HzBBVlVrMegckzHMV4T7TBn7AFuAuQhasi
	C8hC0EbiXgwfZMeCMaOSzPWHuGVdydLG1oyU0rOABUR0smZnHMojRdhU7qpGuMADqBSvPP/rEGg7z
	zN+iNadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZg-0000000HB9I-09VY;
	Mon, 23 Mar 2026 16:56:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZe-0000000HB96-45e9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBE08600C4;
	Mon, 23 Mar 2026 16:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01279C4CEF7;
	Mon, 23 Mar 2026 16:56:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] firmware: arm_scmi: Lazy clock rates and bound iterator fixes
Date: Mon, 23 Mar 2026 17:56:09 +0100
Message-ID: <cover.1774283748.git.geert+renesas@glider.be>
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

	Hi all,

This patch series:
  - Fixes an out-of-bound access in lazy clock rate handling,
  - Synchronizes bound-iterator cleanup naming between documentation and
    code.

Note that the first two patches fix the same symptom; either or both can
be applied.

Thanks for your comments!

Geert Uytterhoeven (3):
  firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
  firmware: arm_scmi: Fix bound iterators returning too many items
  firmware: arm_scmi: Use proper iter_response_bound_cleanup() name

 drivers/firmware/arm_scmi/clock.c     |  9 ++++++---
 drivers/firmware/arm_scmi/driver.c    | 15 ++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |  2 +-
 3 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

