Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9555D105D9BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n7bosjwbU5FTrYEendiBfTXm4znd5VvXDOpOv0gXMX0=; b=dOkRb3qvtNqa4gl8VhmYjEmjXQ
	obynM/e8zT6yXvrhuayhH2Hu1e5XSCqTB3ed43S3/Q2Mc8O9zU7+DaB00ZiKSUQMpQ5g5Z/o1laQ4
	04xiQH0TEkF/VSU8h0M4e33QsW/QDjNC+uwGkL7MZoMgff1zPwijMC63/mnY2eTwVYqxSsAUVarym
	wrqSHzkL7lKZwDC2vKjEi1FJbdtlJBjsnUqPvHJIYA9p2ncP5TMX3ITR68CV12bATDNlujAZc741+
	Vz3ilbIdP3c7pEHOpxaKMyUeDttkynUk5jbhBYwo+S/XSfdAhg1YYA3C6QCoCW1cKdFLk2mPZDMk8
	r5AiCa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPQ7-00000008d3D-1gsn;
	Wed, 08 Apr 2026 09:41:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPQ4-00000008d23-3ZUU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:41:58 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wAPQ1-0006Ee-CC; Wed, 08 Apr 2026 11:41:53 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.0, part 3
Date: Wed,  8 Apr 2026 11:41:52 +0200
Message-ID: <20260408094152.1698594-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_024156_885371_3D755348 
X-CRM114-Status: UNSURE (   6.83  )
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

The following changes since commit a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:

  reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-3

for you to fetch changes up to 9797524ef2b69c6b187b55bd844eb72a8c1cbd99:

  reset: amlogic: t7: Fix null reset ops (2026-03-31 17:19:18 +0200)

----------------------------------------------------------------
Reset controller fixes for v7.0, part 3

* Add missing reset ops for amlogic,t7-reset to the reset-meson driver.
  The resets are unused as of now, but as soon as they are, the driver
  would otherwise run into a NULL pointer dereference.

----------------------------------------------------------------
Ronald Claveau (1):
      reset: amlogic: t7: Fix null reset ops

 drivers/reset/amlogic/reset-meson.c | 1 +
 1 file changed, 1 insertion(+)

