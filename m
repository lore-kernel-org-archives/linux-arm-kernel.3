Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C759C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tiq/YBOsrEQjXB9nRN6Vscf6QpmL4+oyqteQ+zJdilw=; b=A9PX4D7v4qSK4sDFpAUnaT1Akt
	gRJcqKpRWLq+uN7ANbo9aqhAtYOIehP2CLq1eQxuxQiG5L5wwqsOVpubnUlzsI2AshRprDSLyqajs
	5vQQ0/wJR8u8LHNE3iUGAJJxm1KFxEsj5bbQhbw3erOBKgShxpPBqRtI9rCu3GUtwd/LA9xWbusTs
	uEUqHaBWl39V4pSWvgoQNSoH3OY09sNbkPQll2CQ99hD7nwa/7vWXh4iL2OuRrji/7UgDsYq95KF5
	9+tY1NZtmhHMEaImnrHCqOmHEs7O6zOvqONP2KeWRp4B4NTqjM9iGmIGItjCbKxGA3Hf8luNoGaYP
	GZzYhn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m6e-0000000BZJc-34Yf;
	Thu, 24 Sep 2026 16:15:32 +0000
Received: from out-214.mta1.migadu.com ([95.215.58.214] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m6c-0000000BZHu-0Uku
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:15:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pA+73TkIqbFf0NM7bziE93GdtfVOjhH6bzAEwWZEJ74=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266527; v=1; x=1790871327;
 b=K7oADMKF22h2miGvoGf8bfDVsAWuHf4oTPAtWweFkoLEtYR+yxHkFKZBQDn8zugJzNoUVczs
 xZobrr2RIbpa5Qmd9nz6W3HmgZtBTQP4VpfIL3++gdoXr2dIdP1uVewxRP6QbO9zl2cqqRo0Bm1
 GX8aJkLlx2fKhCEQq+l6msvI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cf2236c452ea164d;
	Thu, 24 Sep 2026 16:15:19 +0000
X-Mizu-Trace-ID: cf2236c452ea164d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] irqchip/gic-v3: Memory-safety fixes on the probe paths
Date: Thu, 24 Sep 2026 17:15:11 +0100
Message-Id: <20260924161514.1112730-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_091530_303258_6CEEB135 
X-CRM114-Status: GOOD (  10.16  )
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

Hi folks,

Three probe-time bugs in the GICv3 drivers. The kernel keeps running
after each of them, so the memory involved is live rather than on the
way to a reset.

The first two free memory an enabled ITS still points at. Boot carries
on because its_init() discards a failed probe and gic_init_bases()
discards what its_init() returns. The third is a write past the end of
redist_regs[] for an enabled GICC with a zero GICR base.
fa2dabe57220e's commit message says such tables exist, and I haven't
seen one.

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

Fuad Tabba (3):
  irqchip/gic-v3-its: Don't free a vPE table shared with another ITS
  irqchip/gic-v3-its: Don't free the tables of an enabled ITS
  irqchip/gic-v3: Don't register a redistributor that was never counted

 drivers/irqchip/irq-gic-v3-its.c | 16 +++++++++++-----
 drivers/irqchip/irq-gic-v3.c     |  6 ++++++
 2 files changed, 17 insertions(+), 5 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5


