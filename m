Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C0BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ex+/eq6P0tsHxmQs55rDVY0U38GysoW0XZFxCa75Flw=; b=ZpTAd9ehwb43HFxSbzNT92WWv/
	B7mOpfQkp64aKqZO1UkzM4tgNyx79TFr1HhnEX9qOfQSpdrbfugcwmpucz+vAelwKsjb8U2ES4+ut
	WxLdxMODSBdIqXOqAP/b7Tml8QH1Bz9LNBeh3xopPkTv6LNMCh4Jdqvn/WPUqD5fWaf2i0lWPJHr6
	h3MA0vXwems8gGVzEQbCj3piRQjHA3sje1LVAxptosZWZlnwUwCPsFnetDm9tbXqXhM9mlyUfLIEy
	bIEVw7yvkqTV+9BJMV05+NJNgsGXA29eQO5JeWd957uDhxnysWhHEshkkIbcCCsKWS6jPfj7qv0eo
	0ngpd5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA5-00000006Meh-41bg;
	Tue, 08 Jul 2025 19:39:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCx-000000067rE-10mQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ex+/eq6P0tsHxmQs55rDVY0U38GysoW0XZFxCa75Flw=; b=BnA/7Swdt51NFc91mHbG4SFBkz
	DkQoHprtif7p0Cday8ujAbQCIJer1XKCOq0yQLIIgpMfRaGs8wvsy0B1JuG4rL7HTlD8ZbT1bFBeV
	0A7iOHp/zyxdMZVkpMZfXeMeOjNCsTCayBH84uAPAuxSJQnfydleBXeOc68ZjTxJQ7/Cfkjn7w6pP
	AD0VR4FDXLeAnaOC9coZAfVGauNNj/+onzulxOMOhlwlOI/NZ/SkyO7INChJmlPgbOfqfcyR8FbJZ
	Vg9MVlsit5DAWXTF5+/pv40CP2R4sum5sUy0qJS6PUjwptYX3vEm9/IzmBXu1hF8EwJGd+XmA7NXm
	tkI25KJw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCt-00000008lV7-3vUV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34C395C054B;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0444C4CEF8;
	Tue,  8 Jul 2025 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996050;
	bh=m7DhdVicmrqrIoSMYirW5qjPjKd3MmBXE15EmI0rxmU=;
	h=From:To:Cc:Subject:Date:From;
	b=pjvNesQFtUHsoqucRDlqkQJRe9QTRvdPe/0GzwFpDrHWUeeAJldyp7guUKnYbBv4j
	 YbdSNrmLEyn+lqDYGiqkV1b5yIt5QO0mvNhdTTYW5lor/4CGhuaAyXrqZ4/74tNZei
	 K+yLy1O4jYCoQoSGKSgVZYLf3ribvJei7Nyh93OjdonsDlIKSWiefv8VR5Wxv5m6Xc
	 uehp3ZdrsA66pa7OYqBM3vaasBApR2Bp8jk6jjNton4+Tsk9bIuk4DAG4PIeztUu/y
	 br1KRAJ4y5KtVO7EdCTcCt249R2QyRBPgyRsXhhz48NRdRchAfwQEM/e95ViOcprg2
	 SzZbM+eCdxgaA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCm-00Dqhw-Id;
	Tue, 08 Jul 2025 18:34:08 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 00/13] PCI: xgene: Fix and simplify the MSI driver
Date: Tue,  8 Jul 2025 18:33:51 +0100
Message-Id: <20250708173404.1278635-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_183416_343163_40356CEE 
X-CRM114-Status: GOOD (  17.20  )
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

Having recently dipped into the xgene-msi driver to bring it to use
the MSI-parent concept, I have realised that some of it was slightly
sub-par (read: downright broken).

The driver is playing horrible tricks behind the core code, missing
proper affinity management, is terribly over-designed for no good
reason, and despite what MAINTAINERS says, completely unmaintained.

This series is an attempt to fix most of the issues, and effectively
results more or less in a full rewrite of the driver, removing a lot
of cruft and fixing the interactions with the PCI host driver in the
process (there really isn't any reason to rely on initcall ordering
anymore).

I've stopped short of repainting the MAINTAINERS file, but given how
reactive Toan Le has been, maybe that's on the cards. Patches on top
of -rc3, tested on a Mustang board. I'd really like this to hit 6.17!

* From v1:

  - Killed CPUHP_PCI_XGENE_DEAD altogether

  - Added a couple of definitions and helpers to make the hwirq/frame/group
    mapping a bit less awkward

  - More comments about the weird and wonderful behaviour of MSInIRx
    registerse

  - Collected RB from tglx, with thanks

Marc Zyngier (13):
  genirq: Teach handle_simple_irq() to resend an in-progress interrupt
  PCI: xgene: Defer probing if the MSI widget driver hasn't probed yet
  PCI: xgene: Drop useless conditional compilation
  PCI: xgene: Drop XGENE_PCIE_IP_VER_UNKN
  PCI: xgene-msi: Make per-CPU interrupt setup robust
  PCI: xgene-msi: Drop superfluous fields from xgene_msi structure
  PCI: xgene-msi: Use device-managed memory allocations
  PCI: xgene-msi: Get rid of intermediate tracking structure
  PCI: xgene-msi: Sanitise MSI allocation and affinity setting
  PCI: xgene-msi: Resend an MSI racing with itself on a different CPU
  PCI: xgene-msi: Probe as a standard platform driver
  PCI: xgene-msi: Restructure handler setup/teardown
  cpu/hotplug: Remove unused cpuhp_state CPUHP_PCI_XGENE_DEAD

 drivers/pci/controller/pci-xgene-msi.c | 428 +++++++++----------------
 drivers/pci/controller/pci-xgene.c     |  33 +-
 include/linux/cpuhotplug.h             |   1 -
 kernel/irq/chip.c                      |   8 +-
 4 files changed, 187 insertions(+), 283 deletions(-)

-- 
2.39.2


