Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC20C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tAk+oambR4Ey3vEDqamRm++aLb25nBR83gLP67cbm5w=; b=PzUNg5RB4ID0/B5iM321NEvg+e
	qUZfl18eNF3pgkIPM01EsdZXxL7XnKqxdDlwHK3Q7S+LBN9ur82yLNmwM17PZkAYlFPvARPVI62E5
	10kT1l9H+X1NxxeHJ/terhxooxZFlDRFE9942iI/Ds5d76czQbtDHVdy6QqJJ+jI1gDurKsUCTqo8
	376+AkE9JbiTwHEkSOYs06KfZU5jLJH4lIU0GayXp9t1eWwTq/LMeMfhAB3WSY28IiS86JjRCxGBs
	VoBziIRIOkkjpp5+MRdqyKVT1OX9IQ43pm3ZRf2aQW8IQ1oP9PdpV8VkYrIouricaQ+s4InrqfTHH
	YzJR0dSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1dI-0000000CvmR-3BTN;
	Fri, 25 Sep 2026 08:50:16 +0000
Received: from out-193.mta0.migadu.com ([2001:41d0:1004:224b::c1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1dE-0000000Cvko-1B5d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:50:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rRm6aorR1hdkLp99yH/Vma+YSAO+HZz/IxZQot443Oc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790326207; v=1; x=1790931007;
 b=BujQTQm7yap93XmUa72Z6tk+eKnsIEwFTwVcjcxxA7yl10Cxqe5sDitF7qveBI4ehe/MmRPr
 CrAzRWEwIDJpLJhG2lbTvh5/cwvv9L5lFQ09MynpdgRzZ/yf8QC7A+TEmqsi8lIkargCmJveE/G
 Bsjtkh9IMumwfMI2htowMErg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c6a1a2773bd8065e;
	Fri, 25 Sep 2026 08:50:05 +0000
X-Mizu-Trace-ID: c6a1a2773bd8065e
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
Subject: [PATCH v2 0/3] irqchip/gic-v3: Memory-safety fixes on the probe paths
Date: Fri, 25 Sep 2026 09:49:57 +0100
Message-Id: <20260925085000.753400-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015012_607277_AEF4D538 
X-CRM114-Status: GOOD (  10.56  )
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

Changes since v1 [1]:
  - Patch 3 marks the skipped CPU in broken_rdists, so it's kept
    offline. (Marc, sashiko)

Three probe-time bugs in the GICv3 drivers. The kernel keeps running
after each of them, so the memory involved is live rather than on the
way to a reset.

The first two free memory an enabled ITS still points at. Boot carries
on because its_init() discards a failed probe and gic_init_bases()
discards what its_init() returns. The third is a write past the end of
redist_regs[] for an enabled GICC with a zero GICR base, on a MADT with
no GICR entries. fa2dabe57220e's commit message says such tables exist,
and I haven't seen one.

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260924161514.1112730-1-fuad.tabba@linux.dev/

Fuad Tabba (3):
  irqchip/gic-v3-its: Don't free a vPE table shared with another ITS
  irqchip/gic-v3-its: Don't free the tables of an enabled ITS
  irqchip/gic-v3: Don't register a redistributor that was never counted

 drivers/irqchip/irq-gic-v3-its.c | 16 +++++++++++-----
 drivers/irqchip/irq-gic-v3.c     | 11 +++++++++++
 2 files changed, 22 insertions(+), 5 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5


