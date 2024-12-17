Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684D5E77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0sb28KyKs/AAkr7+Dy8naiBwhvL+mndE8e4f/itmW+w=; b=pUCZBIkUp533/PeCCOPb6Kvzo8
	8WSOyMrK1/7zX/SiDnj6qXesibbTExlCLHn0Kyvpn5vpPBA+BkXYlTU3iNd++nqp5rnj9rpSCFNbF
	az2dh1MeFcw1hAOJXHwgtaRQJ0G0gdWh6Y/jy0RWIOkeDz7vGMu3hAocCcODYplvlH/jh07L4vT/5
	SA6oDdWWqspBmh3CoxChq3nEnLVHt8dxztDMicO2voxQNyRyZiDTGnGzfsSrlPJ8wJSDMGl2tgNn0
	URQlRBcLRjGB7R9uaekUK6FZS1N+368SoWfbySAZOrXAkj60qc3+NPnTS34frf5/tb2CIEF/A8YKH
	rlkS5Yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdX5-0000000Efen-1Rtc;
	Tue, 17 Dec 2024 19:47:03 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdUv-0000000EfL8-2n6Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:44:51 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 853B7C003AA6;
	Tue, 17 Dec 2024 11:44:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 853B7C003AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734464688;
	bh=PGKhh1jB7fq6v57AxgFxk9LUexegKCttSolkeo1YU0U=;
	h=From:To:Cc:Subject:Date:From;
	b=O/6wdDHLTKiiWim0FUGD/LM2ZihkoKaIOdKYJuM8w9Zl4q1/1wOAN4U5LwArnsFBl
	 GSK6x0muViTi6C0vDsGoZ8ZbUbGKEijGGVC1chW/RuKnSpWUt0il+z+kmvtSesjyi4
	 1uAf/uPSDAA6UTxH/lhfxRkHjrvLcl5KXikqcWJI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 2928E18041CAC6;
	Tue, 17 Dec 2024 11:44:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 0/2] memory: brcmstb_memc: Support for BCM74165
Date: Tue, 17 Dec 2024 11:44:37 -0800
Message-ID: <20241217194439.929040-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114449_788199_23242D40 
X-CRM114-Status: UNSURE (   8.21  )
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

This patch series documents and matches the compatible string used on
BCM74165, thanks!

Florian Fainelli (2):
  dt-bindings: memory-controller: Document rev c.1.5 compatible
  memory: brcmstb_memc: Match rev c.1.5 compatible string

 .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml    | 1 +
 drivers/memory/brcmstb_memc.c                                 | 4 ++++
 2 files changed, 5 insertions(+)

-- 
2.43.0


