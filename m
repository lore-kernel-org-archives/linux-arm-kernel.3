Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6294CCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXugwLdUOyNBCr4mpnAsSBw9bY2S7YZs8qkchEaRL6o=; b=RT3PYkOSk0jojb23pKTyRu5S+p
	ykgK3QIa1M+DmZQ/lfeonGhmWffvbfw4b+8MxsPasd1ej396oRGPzA7L5JFn2ef47HR+NH/VoIvxq
	maQpcqr1GPt1BCWoKgPSzoDypU8ye6sIRgbVAOw999fLSnv0C1zkNh12+l91m1uZb6gh2ehVXDi+v
	BDw9UXe4dEiwKZ3Wz6Oqp/lLS+Aj6GbynYqWkc6j9K3RdUnXERHPXFwVKfQjikVhgNWaVHpeH13tB
	H+Uw72rTK67oLXETOAUpPbOgSy/XSVY0VtbQvfMyi3US0k1ST3ie/rtd/WjmSXryT++D3qc1P20aw
	Px6AFFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIDH-00000005VS0-23Wh;
	Sun, 18 Oct 2026 04:09:35 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIDE-00000005VRG-0cAd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=SX
	ugwLdUOyNBCr4mpnAsSBw9bY2S7YZs8qkchEaRL6o=; b=j5t9eGMWH1jEU6vcmH
	hJ0BG0o+xoJB80HfRxMDs2+x4Qq9zVweFxIEgWil8IrJNRupqs3935+LnJB+aLuc
	Xd8IZhB7TkDjCWThydVOXpzkuavJEx90aPyVEfIgRN9Rf7ENzqe0lho3P07kCGFw
	DipcWlKdUtE8p7PuR61jOIX+Y=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S2;
	Sun, 18 Oct 2026 12:07:27 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Mika Westerberg <mika.westerberg@iki.fi>,
	Ebony Zhu <ebony.zhu@freescale.com>,
	Kumar Gala <galak@gate.crashing.org>,
	Dan Williams <djbw@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zhangfei Gao <zhangfei.gao@marvell.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qiao Zhou <zhouqiao@marvell.com>,
	Leo Yan <leoy@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Nicolas Pitre <nico@marvell.com>,
	Saeed Bishara <saeed@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/7] dmaengine: drain completion tasklets during teardown
Date: Sun, 18 Oct 2026 12:07:16 +0800
Message-Id: <20261018040724.534641-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n6n9RdRqdUaGAw--.28247S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWDJF18Xw4rGry3XF4kXrb_yoW8GFykpF
	WfG3yY9rW8tF4Yk3WkJa12vFyrX393J3yYkwsxtw15ua15ZF9Yqr1rK3WYgF4jyr4xZF4j
	qa1DtF1rur1kAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_l1vfUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR9gmmrURf+2FwAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_210932_567366_8269C4CF 
X-CRM114-Status: UNSURE (   8.66  )
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

Several DMAengine drivers defer interrupt completion processing to
tasklets, but release channel resources without draining tasklets that
were already queued. Stopping or releasing an IRQ prevents new hard IRQ
handlers, but does not synchronize the deferred tasklet.

Depending on the driver, a late tasklet can access freed descriptor
storage or invoke a completion callback after its client data has been
released. Ensure each producer is stopped before killing the tasklet and
freeing the resources it can access.

Each patch is independent and keeps the synchronization local to one
driver's channel or device teardown path.

Jiale Yao (7):
  dmaengine: ep93xx: drain tasklet before freeing channel resources
  dmaengine: fsldma: drain channel tasklet during removal
  dmaengine: mmp_pdma: drain channel tasklets during removal
  dmaengine: mmp_tdma: synchronize tasklet when freeing a channel
  dmaengine: mv_xor: drain IRQ tasklet before freeing channel memory
  dmaengine: mxs-dma: synchronize tasklet when freeing a channel
  dmaengine: ste_dma40: synchronize tasklet when releasing a channel

 drivers/dma/ep93xx_dma.c | 4 +++-
 drivers/dma/fsldma.c     | 1 +
 drivers/dma/mmp_pdma.c   | 4 ++++
 drivers/dma/mmp_tdma.c   | 2 ++
 drivers/dma/mv_xor.c     | 6 ++++--
 drivers/dma/mxs-dma.c    | 1 +
 drivers/dma/ste_dma40.c  | 2 ++
 7 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.34.1


