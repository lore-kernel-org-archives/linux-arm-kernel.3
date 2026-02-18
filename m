Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B848E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kurWLclCU1p6CObL3Fr6bH3QHzP1TichbnZiIf7g35w=; b=L30Lv3oU1HDW6+uf0cOXqeK3O2
	6rA6wWUBCgDqWynwwZdZiOC3jb2+fRfAoWUcaJ1oX7uHvh9YkdC1L9FxtYc78ok7q7ydCS2d3kzWH
	ezAL3J4Lxz0w8UEXQvPAEZruiPuQtCPhMDbUXzEzqN4etVXjDqyCHn/4rqHoeh4mWwo6MHpePZ6I3
	K0pD8IhNMiNAqroa/OGqE5fPkJJTiBJjYmN4nKZ8jUmcsNxeAHtacC3XiC7lYeXMsfh0PRDbc+pvO
	KGdtyVphf0oEVBuTrVnxi9lCX16Kl2ePCBHeiBSMBkvzVR/Nr1LjYkZJz9cpEgGSIvxsUp7+kM+63
	zK1FLDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyO-00000009uA9-28UI;
	Wed, 18 Feb 2026 13:52:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyM-00000009u9F-0kN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23F76600AE;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7141C116D0;
	Wed, 18 Feb 2026 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422728;
	bh=w4EKK/R480qSeLevM8joRM/MvxRl22C1On+/P+fDFn0=;
	h=From:To:Cc:Subject:Date:From;
	b=JEI/nWjoAYErKmbf5xhGmzXnRXgp/Y5A5qRkYOJ91Z8T03wm+J4uX4Eqz1Pv3qGhE
	 lTak/thcVjyvClUlD4q46Z9JrlyR3wTbRlNA1+lpgIJIr+EDoM0zBPINYpJaO/2hM2
	 Sr6u5DqTmi3EUL3gGS5K92iNgjM/A/BWuRqBhVTpv3/Z5iCRT6FkPiO0rSaJR/AgBy
	 7TO9wwB0DginuYOJvJVJHbUN8zm0rp2eJdgEkk50UENjYvVQAN/cP6RR9wy1Aj0Akb
	 dNsuQNn3k8wEOWTah9dSwLH3FK33bTDiJF6NLsYJe46JDKxGft3FJlRoabJE3GitUI
	 0jKmoiZlsCNNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyI-0000000Bu02-33K3;
	Wed, 18 Feb 2026 13:52:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
Date: Wed, 18 Feb 2026 13:51:57 +0000
Message-ID: <20260218135203.2267907-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Over the past few years, I have become increasingly annoyed by this
sort of messages in my boot log:

[    0.067861] fsl-mc MSI: ITS@0x100100040000 domain created
[    0.073352] fsl-mc MSI: ITS@0x100100060000 domain created
[    0.078841] fsl-mc MSI: ITS@0x100100080000 domain created
[    0.084328] fsl-mc MSI: ITS@0x1001000a0000 domain created
[    0.089815] fsl-mc MSI: ITS@0x1001000c0000 domain created
[    0.095303] fsl-mc MSI: ITS@0x1001000e0000 domain created
[    0.100792] fsl-mc MSI: ITS@0x100100100000 domain created
[    0.106281] fsl-mc MSI: ITS@0x100100120000 domain created

While this is useful on fsl-mc systems, this is completely irrelevant
on 99.99999% of the arm64 machines, which know nothing about the
Freescale stuff. Including all of my machine -- bar *one*.

Global MSI domains such as the above have been obsoleted for the past
two years, but nobody at NXP seems to have got the message.

The obvious solution is to delete some code! While my first port of
call would be to just 'git rm -r drivers/bus/fsl-mc' (only kidding!),
a less invasive solution is to drag that code into the present times.
Which is what this series is doing by converting the whole thing to
device MSI, reusing the platform MSI infrastructure instead of
duplicating it.

This results in the expected cleanup, and kills the last user of the
non-device-MSI stuff on arm64. You're welcome.

Marc Zyngier (6):
  fsl-mc: Remove MSI domain propagation to sub-devices
  fsl_mc: Add minimal infrastructure to use platform MSI
  irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent
    handling
  fsl_mc: Switch over to per-device platform MSI
  fsl_mc: Remove legacy MSI implementation
  platform-msi: Remove stale comment

 drivers/base/platform-msi.c                 |   4 -
 drivers/bus/fsl-mc/dprc-driver.c            |  14 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c             |   4 +-
 drivers/bus/fsl-mc/fsl-mc-msi.c             | 142 +++--------------
 drivers/bus/fsl-mc/fsl-mc-private.h         |   2 +-
 drivers/irqchip/Kconfig                     |   6 -
 drivers/irqchip/Makefile                    |   1 -
 drivers/irqchip/irq-gic-its-msi-parent.c    |   7 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 168 --------------------
 include/linux/fsl/mc.h                      |   6 +-
 10 files changed, 33 insertions(+), 321 deletions(-)
 delete mode 100644 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c

-- 
2.47.3


