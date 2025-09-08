Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F07CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YzWt09t66PnxW4ZNO0Sq+mv9KKFp7SaT/uzaJMYLojA=; b=UbQVfAQwXV+3GajusSMV9JndJq
	mQXEOi1uC7iwjgFGI0Cc+R5Uy+cu3H5W+ao1K9KGyfg0JchVSkJwKr3jz+X/Heuh4hgPrG1/IlNHX
	A54di+XbTIzMloT8QIPXkEMTy+jF29YihguD8w7dvb6d9M+c40Zmdv9NaAxEN1IJsW+Ol6F6sbRWX
	LdD3B20NAK5Ss5ooojauN7kZVFWauuhDkqWFy7Ywxl1WFIf+ofhx0WC6r9kUuT9Ck6OOn/ohJo0wQ
	eaBtrcpE7jw99LvGoCDA0I6NnsUABniobD/NNVGfcQDxN19GHG8aHRjm/D7cNr+fer/KWjm/LRzQs
	BoAi6hbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlek-000000033G1-40g8;
	Mon, 08 Sep 2025 23:52:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfpJ-00000001G93-0Nzk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 08 Sep 2025 17:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YzWt09t66PnxW4ZNO0Sq+mv9KKFp7SaT/uzaJMYLojA=; b=k1fgBC3eFF9kUDqoGfdz+neZD4
	2erpGzn7Xb2qg+Egqfuz75MreKzhqXog52hlp2Bv38ETBWsuXuSxzt3n2WjKBNG2Ret7ksUMLLVeG
	/Q15qDZWOQoJIy/H1qK5I/icoI1Hw3c87vY7zIGsH4F9hcz6vRg7LBaRqCteuGVZDGv4BQs5cxPj1
	ano7u3+oLgVcYfRgeaiQMgbkBn+lj8+kan63Q4GnUzVRPZiDjFmsD++H8F6a/Yy1eI23AX8A72QYV
	kpKQ0htTkSgnrj1895QsTngynQ9Ndyy7Y+oosA2A64WB2e0c6QZLfXSaCdtlr6N9BxXxwtIziCasm
	ZIkXjIfQ==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfpF-000000056vK-1cWx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:38:47 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588HcVwi152685;
	Mon, 8 Sep 2025 12:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757353111;
	bh=YzWt09t66PnxW4ZNO0Sq+mv9KKFp7SaT/uzaJMYLojA=;
	h=From:To:CC:Subject:Date;
	b=NR8t3jeGOO+2X+H/OxHY/HSyXb6cZmAjJ1KyZtrMbq1wgqlkTMeHuC8IIkXRPJD/T
	 5GaphZgpqtYDwMXzd/dR2gq5t8AZjHssTFgNe23WrdZIOtEDfIPM6owW0ndb6il4Ne
	 tuGUdqWI/o3xAluTBrE5DYMeVJjR8xJHwXmhw6u4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588HcVOE3169826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 12:38:31 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 12:38:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 12:38:31 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588HcVVn1281123;
	Mon, 8 Sep 2025 12:38:31 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2]  Remove HS400 support from common
Date: Mon, 8 Sep 2025 12:38:29 -0500
Message-ID: <20250908173831.269039-1-jm@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_183845_693907_1559B3B8 
X-CRM114-Status: UNSURE (   9.33  )
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

Since eMMC HS400 has been descoped for j722s due to errata i2478 [0]
and is supported by default for AM62Px device, remove sdhci0 node from
common-main.dtsi and include instead only for AM62Px in am62p-main.dtsi.

Also, update the STRB value for am62p eMMC sdhci0 node.

Tested on am62p SK board.

[0] https://www.ti.com/lit/pdf/sprz575

Link to v1:
https://lore.kernel.org/linux-arm-kernel/20250904004723.2856005-1-jm@ti.com/

Changes from v1:
- Keep the common node and only remove hs400 support from the common
  node. Enable instead HS400 support only for AM62Px in am62p-main.dtsi.
- Fixup commit mesages according to new changes.

Judith Mendez (2):
  arm64: dts: ti: k3-am62p/j722s: Remove HS400 support from common
  arm64: dts: ti: k3-am62p: Update eMMC HS400 STRB value

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 ---
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi              | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.51.0


