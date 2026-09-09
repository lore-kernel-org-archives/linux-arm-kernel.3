Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418BBC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hx6CJv34VPpHOsWGs8nGvEjuuxvYGp2ezi0uE9qZA9A=; b=b5qL7NCMJiGTa5coityWCQqYGG
	764o4HFc0UgQoB9yTZ4ZpooUBO9FuFWW17EVaV72pk5f44thdczeNI+2ozkOuR79e1qgAXLBUN5sb
	6PqCo/PlkuRuTFvKMUjf50XvF3EuRRblTsbtKNyTdXvIb9y6yWsZHyOT9DJmA30dWE2F7h54fufgZ
	sAra7f0ci57WztV2tBbnB9JgQ6+QZ/uO68uiGsUmIhcSfRk/5orHf7KMpoF8YJOioPg8JeJw6NTd8
	D78LcTfaaJdafO4FytePGizCYiiHTOquRih6FLUmCMfn9fzYkRQ4QxZjOSM1Ru/J55dn4oFNUOy8D
	FS+5QUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PkN-0000000CsNw-10Wl;
	Wed, 09 Sep 2026 21:22:23 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PkL-0000000CsN5-15Ku;
	Wed, 09 Sep 2026 21:22:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF102408FC6;
	Wed,  9 Sep 2026 23:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1788988936; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hx6CJv34VPpHOsWGs8nGvEjuuxvYGp2ezi0uE9qZA9A=;
	b=Bt+7iyb+00Vu8uQDiQEQXmXDPDgH65AIR7cxu4TOr1zcf9DpkPdJiLvU/cbr8utfnwR9XI
	ZfeMzzSLH3syNNnyyvr89mY/qQjb/tPDWQ8FQLcv1Rbt0krD7miBvr2moG0A2jEhEKd1xz
	VmcXegxxXviNfQpj/pjcPRRNlBCjp0lU+V/acLFueVOgQ3p5KIUOsjAh2pv0X7NXkNQoru
	WYh498/Pj6bt9HCN+9XfQvs8hz78qHnskQStuLBOTgPDaIOA68mJUDUPTv6HlALkIbEgyE
	DpjtO5ncA8AQkmLo9cLQQIGc8GdMtJXWUgU3w6nggaTMFW9hwvFdIOy66KwFWg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	vadim.fedorenko@linux.dev,
	maxime.chevallier@bootlin.com,
	dong100@mucse.com,
	wangruikang@iscas.ac.cn,
	25181214217@stu.xidian.edu.cn,
	hkallweit1@gmail.com,
	han.junyang@zte.com.cn,
	xuanzhuo@linux.alibaba.com,
	enelsonmoore@gmail.com,
	jes@trained-monkey.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH net-next 0/2] net: econet: add EcoNet EN751221 ethernet driver
Date: Wed,  9 Sep 2026 21:21:44 +0000
Message-Id: <20260909212146.3184077-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_142221_500759_B5FFD861 
X-CRM114-Status: GOOD (  10.11  )
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

The EcoNet EN751221 SoC has an Ethernet device with two ports and two
DMA engines (internally called "QDMA" because they handle both QoS and
DMA). It is fairly similar to the MediaTek and Airoha drivers, but
distinct enough that attempts to attach to those did not prove
fruitful. This ethernet device shows up in the chips based on the
EN751221 die, and also in the EN7528 chip with minor differences.

This ethernet device also has a "packet processing engine" similar to
that of the MediaTek eth driver, but that is not supported in this
driver.

This driver has been used as an OpenWrt package for about 6 months but
was not contributed until now because there was no DSA switch support
for these devices.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Caleb James DeLisle (2):
  dt-bindings: net: econet: add EN751221 ethernet
  net: econet: add EcoNet EN751221 ethernet driver

 .../bindings/net/econet,en751221-eth.yaml     |  127 ++
 MAINTAINERS                                   |    7 +
 drivers/net/ethernet/Kconfig                  |    1 +
 drivers/net/ethernet/Makefile                 |    1 +
 drivers/net/ethernet/econet/Kconfig           |   20 +
 drivers/net/ethernet/econet/Makefile          |    7 +
 drivers/net/ethernet/econet/econet_eth.c      |  334 ++++
 drivers/net/ethernet/econet/econet_eth.h      |  231 +++
 .../net/ethernet/econet/econet_eth_debug.c    |  617 +++++++
 drivers/net/ethernet/econet/econet_port.c     |  473 +++++
 drivers/net/ethernet/econet/econet_qdma.c     | 1209 +++++++++++++
 drivers/net/ethernet/econet/gdm_regs.h        | 1514 +++++++++++++++++
 drivers/net/ethernet/econet/qdma_desc.h       |  677 ++++++++
 drivers/net/ethernet/econet/qdma_regs.h       | 1243 ++++++++++++++
 14 files changed, 6461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/econet,en751221-eth.yaml
 create mode 100644 drivers/net/ethernet/econet/Kconfig
 create mode 100644 drivers/net/ethernet/econet/Makefile
 create mode 100644 drivers/net/ethernet/econet/econet_eth.c
 create mode 100644 drivers/net/ethernet/econet/econet_eth.h
 create mode 100644 drivers/net/ethernet/econet/econet_eth_debug.c
 create mode 100644 drivers/net/ethernet/econet/econet_port.c
 create mode 100644 drivers/net/ethernet/econet/econet_qdma.c
 create mode 100644 drivers/net/ethernet/econet/gdm_regs.h
 create mode 100644 drivers/net/ethernet/econet/qdma_desc.h
 create mode 100644 drivers/net/ethernet/econet/qdma_regs.h

-- 
2.39.5


