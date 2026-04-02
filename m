Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5791ECC6B1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klZQfB1DTM8kc6bDQRQMuxrdgTXFAHcqYpTG+swy6ZY=; b=EftFSy3lOP39Be
	QtbcEyPz7sayY5sezKuKc/5kCQqeBs8IuJyRmYbFHqNc35L2lZG97ZqxADkZqNzjUUSQqOBDvn28X
	zUt5LGMZm77PY024T7RnZIq2X0E299a7wBOOtBEsK90UjhjViyRgk676frKtc3Ai8MA48iXktN3pk
	jp479QqPhpWccYM0Ei6P5UUXiBQD1Z72CCwj6OzIoFlhZmmFNsX4YrqApK3OjSggUMYy0CKZvAMWR
	YJkwqilRphwu3Qg6jMPyG+I1lXWHfQG4YkA85Sj/dAQvnUCAIfUPi48NO9OQ3rR90Y7NxqxhKrO7x
	k0uspykpSJkaVZPopp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Clm-0000000H74e-03fP;
	Thu, 02 Apr 2026 07:47:14 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Cli-0000000H73F-1JDZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775116025; bh=kKR2O7P62uxmTg8li99pkBO69vG62/hHAn5Al/w8yRc=;
	h=From:Subject:Date:To:Cc:From;
	b=wKf4lofwVj/5LiOvxW8MOO3Sj+08MFUReRQRj/JgoZ4/kR/JQ6Reft5WgXQAVenWO
	 oCks7Nb0Bwb+D/EiusGMcH2N5Rz7X++a6cT/0p2riRCjlBcuzrwWpHMjxa8MFlwyHy
	 GMPw2QVJZXp0BYYoBvnhTJjm1vxov3DPLJbgOQoVpNu004/iDRUqq4nnEk9mGZNxYq
	 UGrIuMgmaSQAPEsMprngTh6+Fc0A4d+rgxbZJDvU9cWhgl9nrAg4ggDftZlG+KZW3s
	 Lmhi4x2tClDShMmHV9jvNfDkVCpa24bQg4oVMorJW+MYVhTj6FGEJJ4V0rwkDJ108e
	 g4X0xp6z70nGg==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 8AFC360258;
	Thu,  2 Apr 2026 09:47:05 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Subject: [PATCH v4 0/2] Fix CPU stall in xilinx_dma_poll_timeout caused by
 passing delay_us=0
Date: Thu, 02 Apr 2026 09:46:21 +0200
Message-Id: <20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTU4DMQwF4KtUWWPkSeYPVtwDsXAmTms001RJO
 gKquTtJEUJCLMrySc/f80UljsJJPe4uKvIqScKxhPZup6YDHfcM4kpWGnWPxiB4eQPKYZEJTmG
 eIcvC4Zwh8j5yqufQ+paNJW+8G1SBTpHL1XXk+eUrp7N95SlXuTYOknKI79cv1qb2vgebWwbXB
 hro7GDdQ880ET5ZjvxB97yQzKpurvpHbfE2VQNCP5LuOzbDgP4P1fxfNUUduw5Hj8TO8S9127Z
 PzyXjHZUBAAA=
X-Change-ID: 20260330-fix-atomic-poll-timeout-regression-4f4e3baf3fd7
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>, 
 Suraj Gupta <suraj.gupta2@amd.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_004710_535112_24CD89BE 
X-CRM114-Status: UNSURE (   7.07  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Alex Bereza <alex@bereza.email>
---
Changes in v4:
- patch 1/2: nothing
- patch 2/2:
  - Fix commit message: reword as suggested by Frank Li
    <Frank.Li@nxp.com> - thanks!
- Link to v3: https://patch.msgid.link/20260401-fix-atomic-poll-timeout-regression-v3-0-85508f0aedde@bereza.email

Changes in v3:
- patch 1/2:
  - Fix commit message: remove blank line between tags
- patch 2/2: nothing
- Link to v2: https://patch.msgid.link/20260401-fix-atomic-poll-timeout-regression-v2-0-68a265e3770f@bereza.email

Changes in v2:
- Fixed the Fixes: tags as suggested by Geert Uytterhoeven
  <geert+renesas@glider.be> - thanks!
- Split the renaming of XILINX_DMA_LOOP_COUNT into separate commit
- Link to v1: https://patch.msgid.link/20260331-fix-atomic-poll-timeout-regression-v1-1-5b7bd96eaca0@bereza.email

---
Alex Bereza (2):
      dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
      dmaengine: xilinx_dma: Rename XILINX_DMA_LOOP_COUNT

 drivers/dma/xilinx/xilinx_dma.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)
---
base-commit: b7560798466a07d9c3fb011698e92c335ab28baf
change-id: 20260330-fix-atomic-poll-timeout-regression-4f4e3baf3fd7

Best regards,
--  
Alex Bereza <alex@bereza.email>


