Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27765C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oSJCoY6FjmJJjlUf6QZ/7RHreKY48dRarT/BjAI0j2Y=; b=aKilSvhoHgCoIP
	pKq3zcb1X6RAvTynfeipKXCgik+BoWXzGiVsasDe9ewQB+r8QP970rTddQ5+jE+ub83J8KKR2jsi4
	jPM3BL98atdvoe6WFWvPxadfLWzwOOJ0epwNrM6pTJdDqWMk98CZR4MVIhPorbhnxUmjw+JdBK6lv
	q4F8qAuRCQItE7IBf1cfUfHF9+HOnb4eQYKNrXUM+qYf10DAgNmhcDjcrdz4NOzfeGRdbtNDZxyJ4
	46uxvzn5+p/14EETMhAE1t7iVB3toWhkcnIAjQgHXfeSjWx1o7bXmCo/81pcnaWbrC5aAhzS9y/+F
	q/BhmBfPGODyAI0+zFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuf3-0000000CWZv-2xqQ;
	Thu, 10 Jul 2025 17:02:17 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsQW-0000000C8v9-2MEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:39:11 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56AEd5ce1532758;
	Thu, 10 Jul 2025 09:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752158345;
	bh=oSJCoY6FjmJJjlUf6QZ/7RHreKY48dRarT/BjAI0j2Y=;
	h=From:Subject:Date:To:CC;
	b=xgVLx7/E7IiqH4siAjyn8GUnxr7yeKI/AAWY/voph7hzmFaFCD2fy6VUlZ8vSSmPF
	 Y1AI3Sbxc/o+K971vTFTURSeo0jEl58UCvhbcSmGZUupQKJW2GmeWI8TbWI28jtvwZ
	 ddgBMsIgZXFpj0QnmeKpv3E8nOF2Aed1LGcIiyVI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56AEd5sS256406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 09:39:05 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 09:39:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 09:39:04 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56AEd4Ij1518683;
	Thu, 10 Jul 2025 09:39:04 -0500
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v2 0/2] arm64: dts: ti: k3-am65: add boot phases to
 critical nodes
Date: Thu, 10 Jul 2025 09:38:58 -0500
Message-ID: <20250710-65-boot-phases-v2-0-d431deb88783@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILQb2gC/3XMyw6CMBCF4Vchs3ZMW8KlrnwPw2KgU5mFlLSk0
 RDe3cre5X+S8+2QOAonuFU7RM6SJCwlzKWCaablySiuNBhlGtUpi22DYwgbrjMlTkjka6LWjV1
 voJzWyF7eJ/gYSs+SthA/p5/1b/1LZY0KWfveOtuRrfV9k+sUXjAcx/EFOaUt1akAAAA=
X-Change-ID: 20250709-65-boot-phases-aaf3aa6db782
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=bb@ti.com;
 h=from:subject:message-id; bh=UCUKULXFCqD7Htou+pcidQL298jdGLI2+TJQvNLKUXk=;
 b=owNCWmg5MUFZJlNZbp/wCAAAZH///vfr6vP/63z1V/5/U/mbSh/mVX73/n/75Q7bj/re5l6wA
 RmxoxRpo00PUAAHqaAAAAAA0A9IAG1AGI0AD1AAAyDIaB6jMoek9Rmp6mh6aiANNGgZNMjTQZNA
 MhowIDRpkNBk0DQNBkGmENBkyNGhowjEBkYmmCaaNDJkDFD0npDIaA9QyGj1AANB6mEA0DRoANB
 ppoNBoyNPUGgANAAAaND1NAaPTUYagQV++6acSNM4ScM4UxgYTQnBQyawUQ1vCHAErQDreN9f3M
 lfTg5KqS++Nn7gnYDXTJokptaqIXSQqwzztsK1GUd9K9/mWQQ0oxb2Wr2ZK3OLVWYWq3AGkxz2L
 TAlIzGFenDVr0wcmy46jaOsP3urdHH59/TGO9yXjQvO/E6tVvc05X+6fLRQupcKp+iR85vLziBJ
 J8Y7MNfyrwEYYViOpYGjw6uJQJbxcIsFAG9xQiilpPDoPrZddEoSBt7fO58xjbmpv5eQiYGd6FU
 WR8q0Sq4GT7u5fNwfG16lHc8nG/CNOVklnrNRnN6zgWkEjkqRsSGI19sd09BDC2pgV205gGKj7B
 sjrYO9w+QGFy6tqEU+ObQqpjsX9dAjXZc3n/A5mfzHFgTcOHVtQcz0i6CIudP2RuocjmHYPgWet
 ZHpmmEy/f8XckU4UJBun/AI
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_073908_687933_C90EBC40 
X-CRM114-Status: UNSURE (   9.83  )
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

Hello everyone!

To save precious on chip RAM space during bootup 'bootph-*' flags was 
added to the dt-schema to describe which nodes need to be present during 
each phase of the bootup process and which can be pruned to recover RAM 
space that would otherwise be wasted.

This small series adds the bootph-all flags to all the boot critical 
nodes for all boards that utilize the AM65x as well as to the AM65's 
reference board.

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v2:
- removed tag from &mcu_udmap{} node
- Link to v1: https://lore.kernel.org/r/20250709-65-boot-phases-v1-0-e1f89d97a931@ti.com

---
Bryan Brattlof (2):
      arm64: dts: ti: k3-am65: add boot phase tags
      arm64: dts: ti: k3-am654-base-board: add boot phase tags

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi       |  1 +
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi        |  1 +
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi     |  5 +++++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am654-pcie-usb2.dtso |  1 +
 arch/arm64/boot/dts/ti/k3-am654-pcie-usb3.dtso |  1 +
 6 files changed, 26 insertions(+)
---
base-commit: 3b08f8a34a2061d89a2411d04a675b3860d4f9cc
change-id: 20250709-65-boot-phases-aaf3aa6db782

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


