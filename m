Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF34CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C9UuggtjA5BUR3FlYtPx3V69I5O1p0ZlO3eT1rAZTu8=; b=DEHIR63RQFvfx7EJJvGbNzOgqA
	4T5ZQIt3yQ+duXofY6hYNg5twEaW77tco5UE+pES302bZDR4FbRWACpYezJqiJPMruoSUxPI1G+Ca
	JvZpwYSq/okZpfgQ7oKX85Z0SD24+EQ42PDfXzpWvcqyCzzfENvSaztKsZ+inybXlWEu4yWLL7dDz
	TAiEPGSXji2g/A9wkpctWMMG1jLubc77f/93NFi3YIu4rvUptxCJ73jRAxJDmlGItHGVXJVsMWlTj
	jR1WagwVD6N40Uye5D6czs6QYg5dY2NmynLmSUkOgi032sUnJk82QdSMPNzu0VK0P/guk1GUs9Li2
	hSHSA20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQf-000000061Vy-0CRF;
	Sun, 18 Oct 2026 16:08:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQX-000000061Td-2wwB;
	Sun, 18 Oct 2026 16:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=C9UuggtjA5BUR3FlYtPx3V69I5O1p0ZlO3eT1rAZTu8=; b=S0E+Bp9lO/7IP8U21TmQnVvraa
	1A1lAYBzJG8q2MjjZLXJfY35vkQRktvplEukYIc9aiBBPfYt4PvXcBI/sU3i91tbfHyQqUUWI4EJk
	wZ9mojA7rBltIiJG2Iz29Xe2SPzfRmQuUit4AS7mt/jwBc300ppbmtaMWm5cwn/vxMtLG1ack+84X
	yMuMh3xvr/INzWSMirNXmJTwwuTzjugLXWJ3sr1892Yu/Sf1kK8r4SRxLBj6UOhuoLCFlQgSnUl57
	ISYXKV4CdBXtbfyDiv7QIywH7zFf2ILht5N7gLsCpPU/UipGUha/ojLTkRPaGOoilmy8qDZAQ8PdF
	7Tp9BPig==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xITQS-000000031BY-1qGa;
	Sun, 18 Oct 2026 16:08:00 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rQsA1115117, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339613; bh=C9UuggtjA5BUR3FlYtPx3V69I5O1p0ZlO3eT1rAZTu8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=rHDQEZHIYjlpEKDlEp+ZJeKcpmLp1PL1GoynW20BmaH17MsEmlMurpXb3YhdqLqtA
	 Jcr7Im0EmjyTfDdod9OBEUtHBZ/KzNUvMKO2yqvOnMw3QQ0IlYyphCzRP0FYCjBLKe
	 AjdBWIyvjye7Kxw4dAHyW5XdZCbOKSylquCDrExRNNhxMLKmVM85PlQc0S9x6FsU3/
	 04QLk2k38gwCwd/YPErZHpZ1oOYXZgeOT02L78t92bgL6AoeUNgCr2TjZqaBuX9L82
	 G7QLEzd0t/O4k9bO1I2EkNinFPp7Gkr1eVw6DeSYuQHIbnmyLNuytgP9LesgeX+SPs
	 9BCrMKawcSybA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rQsA1115117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:53 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:53 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 0/8] Initial support for the Realtek interrupt controller
Date: Mon, 19 Oct 2026 00:06:45 +0800
Message-ID: <20261018160653.3940371-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_170757_156887_5969AB4F 
X-CRM114-Status: GOOD (  10.50  )
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

I am taking over this patch series from James Tai, who originally
submitted v4 in 2023.

This patch series introduces the initial driver support for the interrupt
controller found on Realtek DHC (Digital Home Center) SoCs.

---
The major updates in this v5 series are:
1. Add support for RTD1625 SoCs.
2. Drop the RTD1325 interrupt controller driver, as the hardware is identical
to RTD1319D.
3. Refactored register access to use the regmap API. Since the interrupt
registers are scattered, the interrupt controller is now modeled as a
child of a "syscon", "simple-mfd" node. The driver retrieves the regmap
from its parent for register operations.
4. Reworked the intc-common architecture to properly accommodate the
specific hardware design and routing of the RTD1625 SoC.

v4: https://lore.kernel.org/lkml/20231228060825.1380439-1-james.tai@realtek.com/
v3: https://lore.kernel.org/lkml/20231129054339.3054202-1-james.tai@realtek.com/
v2: https://lore.kernel.org/lkml/20231117162709.1096585-1-james.tai@realtek.com/
v1: https://lore.kernel.org/lkml/20231102142731.2087245-1-james.tai@realtek.com/

James Tai (6):
  dt-bindings: interrupt-controller: Add support for Realtek DHC SoCs
  irqchip/realtek-intc-common: Add basic support for Realtek DHC SoCs
  irqchip/realtek-rtd1319: Add driver for Realtek DHC RTD1319 SoC
  irqchip/realtek-rtd1319d: Add driver for Realtek RTD1319D and RTD1325
    SoCs
  irqchip/realtek-rtd1619b: Add driver for Realtek DHC RTD1619B SoC
  irqchip/realtek-rtd1625: Add driver for Realtek DHC rtd1625 SoC

Yu-Chun Lin (2):
  dt-bindings: mfd: realtek,rtd1xxx: Add new SoCs
  dt-bindings: mfd: realtek,rtd1xxx: Add interrupt controller child node

 .../realtek,rtd1319-intc-iso.yaml             | 170 +++++++++
 .../bindings/mfd/realtek,rtd1xxx.yaml         |  37 ++
 MAINTAINERS                                   |   2 +
 drivers/irqchip/Kconfig                       |  50 +++
 drivers/irqchip/Makefile                      |   5 +
 drivers/irqchip/irq-realtek-intc-common.c     | 353 ++++++++++++++++++
 drivers/irqchip/irq-realtek-intc-common.h     |  93 +++++
 drivers/irqchip/irq-realtek-rtd1319.c         | 188 ++++++++++
 drivers/irqchip/irq-realtek-rtd1319d.c        | 197 ++++++++++
 drivers/irqchip/irq-realtek-rtd1619b.c        | 187 ++++++++++
 drivers/irqchip/irq-realtek-rtd1625.c         | 261 +++++++++++++
 11 files changed, 1543 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319-intc-iso.yaml
 create mode 100644 drivers/irqchip/irq-realtek-intc-common.c
 create mode 100644 drivers/irqchip/irq-realtek-intc-common.h
 create mode 100644 drivers/irqchip/irq-realtek-rtd1319.c
 create mode 100644 drivers/irqchip/irq-realtek-rtd1319d.c
 create mode 100644 drivers/irqchip/irq-realtek-rtd1619b.c
 create mode 100644 drivers/irqchip/irq-realtek-rtd1625.c

-- 
2.43.0


