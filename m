Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E777EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F5fU/ZAp4kwouvmwyCB6tqSL8X1EC9No9N/HhFa/rVs=; b=LgZPVngttm/MdKx+OOH1t+GwwN
	NIA8n5dp4eHTITb85Pq2bNmG422imVmnMpGKucBCz9W7tVbpaFCtQ8KorP5uRf2XZbyBJNMRZ8EPm
	yazUsQgc5Dlxjnh8+tMKTp2Bw18K3PQxRP5kI6zWsD5BhJCM+z46kE5s2Ki9/Lqcpb2W3tSlUhnMY
	Iq9jBW/FP091/dkYm+V93zJXCDQ8COY80mPinH8IJ6v4V5UUbYGfQgz7WQDUlF5wVGeArfxOnXDQP
	eCB0PJJ0LkBZIZd6H8nfFXS77yNmFLVvwvcbZHVFz389h+6HqeUGaFMKJQyo8VMZsBYFjav4vwY8j
	1N4CLmKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8El-0000000EnUr-0v1W;
	Fri, 14 Mar 2025 16:50:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt88i-0000000EmTO-17gU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:44:05 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt88g-0001Jn-SR; Fri, 14 Mar 2025 17:44:02 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.14
Date: Fri, 14 Mar 2025 17:44:01 +0100
Message-Id: <20250314164401.743984-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_094404_305133_0255F624 
X-CRM114-Status: UNSURE (   6.00  )
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

Dear arm-soc maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.14

for you to fetch changes up to 0e2268f88bb27ef14ac3de1bc4df29ff12bb28cb:

  reset: mchp: sparx5: Fix for lan966x (2025-03-13 09:40:26 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.14

* Fix lan966x boot with internal CPU by stopping reset-microchip-sparx5
  from indirectly calling devm_request_mem_region() on a memory region
  shared with other devices.

----------------------------------------------------------------
Horatiu Vultur (1):
      reset: mchp: sparx5: Fix for lan966x

 drivers/reset/reset-microchip-sparx5.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

