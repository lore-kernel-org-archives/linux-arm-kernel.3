Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C7CD59F66
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5WVbtlgfd1Y1JsDGCPrgkNb5LWsPfRp9u8sbixllfmM=; b=zV1jRS5W3gw3qspWb5hZO9PHRk
	RfGOrnShEJt8ibmQQtJPQVj4jMKifpnVhH7plZJreHhAiOjmSLV0kp2S3/ekLLAg0HlQPGL7oow/w
	B+0j0zUAUkvNSunqUxO1rutBSMk86c8KtlSoaU/hy3f3q6E/0joq7O2l9HxNNe66yoO1f3QIIUoR3
	7ihbEIFnQ6VjQWrtP3s5o0s+QasfuktALL26IqSWxAvoaucf5WNKB+M0adqPojQ4PhNms2/5oMZha
	JhQVMxymK5N3BFj2FyMvjwquPlinb8vFKAx+qQbHmULY+3fsqeFgsnQkKl28f1b0TW5nz0UxHM4yI
	75suI6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpL-00000001KQm-3m8h;
	Sat, 13 Dec 2025 02:57:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFp8-00000001KFx-3hL9;
	Sat, 13 Dec 2025 02:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5WVbtlgfd1Y1JsDGCPrgkNb5LWsPfRp9u8sbixllfmM=; b=bbK2QPbqcKVL8pBAu1dmDevW0O
	KTvzueU9CXnq3XRpQS4uIjmTIME+aU7bYKSNCGqaFZzXICx65IDKlrWTJf9VJFehyPsSQf1NywL6w
	iS9M7tbsiRuOL6WXxTyN0kQRb967jwVI6J0i2S4vG0a5nac7H3E+SO1+kCfN2NzG6Kb4GG0Ng/G1o
	In9stCwlyWggnRdn8jgjoOS8cO3A03f5nLjCw2BTlscurIo/UKuZoRi7XdxZ7H6pNM8YqPjr5OBIR
	oQWVQ2NW0OdSoZg2f0s84J2VW8UYle3i+/hLO7Jf4LW3M9HiToFbKRjF1crMZmaqz8XpnlJx7j121
	ISfM3MZA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVds-0000000091f-3XcT;
	Thu, 13 Nov 2025 11:37:37 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5ADCU9srC3591308, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763037009; bh=5WVbtlgfd1Y1JsDGCPrgkNb5LWsPfRp9u8sbixllfmM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=sVVkOAWGV/qxKigpmgcTxsQu1OcwzrurKF0UYQ5UTFMv2Wc9c+ZkBtwYpxl5PCy3T
	 kVg/1/8ZbDse984cDdN2awCqlgCRcvc2cuWEZLPemGEqvnTJrRLrLXRilWWIIwYBim
	 EZcnlRMYa+NSYweejY0XanMpEyvVvJh+N+24uBXT0BnlsRjCWC1CbJj5/kNU7ykBri
	 E1uwnEyjLyCQ3ruVrfCFty0eTugC/PMt2oC93nf+71YPlrcXfSWkCh8V8Wn09hvJ4W
	 6YFnHPtxejIUolf7vwrr6h43VdhXWnbpx6NN2cINOctW3oTnW6VCcz9I3AcOzdCorW
	 5I23aIIsTDrPg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5ADCU9srC3591308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Nov 2025 20:30:09 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 13 Nov 2025 20:30:10 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1544.27 via Frontend
 Transport; Thu, 13 Nov 2025 20:30:09 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <afaerber@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <lee@kernel.org>, <james.tai@realtek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>
Subject: [PATCH v2 0/3] arm64: dts: Add support for Kent SoC family
Date: Thu, 13 Nov 2025 20:30:06 +0800
Message-ID: <20251113123009.26568-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113734_072399_02945760 
X-CRM114-Status: GOOD (  10.62  )
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

Hello,

This patch series adds initial Device Tree support for Realtek's Kent SoC
family, including the RTD1501S, RTD1861B, and RTD1920S variants with their
respective evaluation boards.

The series includes:

1. Adds compatible strings for the Kent family.
2. Add new DT bindings for the Realtek ISO system controller.
3. Add Device Tree files for the Kent SoC, TD1501S Phantom EVB (8GB),
RTD1861B Krypton EVB (8GB), and RTD1920S Smallville EVB (4GB).

The patches have been validated with 'make dtbs_check' and
'dt_binding_check' to ensure compliance with DT schema and successful
compilation.

Cheers,
Yu-Chun

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:

[PATCH v2 1/3]
- Fix YAML syntax: remove duplicate blank lines
- Validated with 'make dt_binding_check'

[PATCH v2 2/3]
- Rename: realtek,iso-system.yaml -> realtek,misc.yaml
- Improve description and example: show child node (UART)

[PATCH v2 3/3]
- Reorder Makefile targets to alphabetical order.
- Rename node: use generic names ('arch_timer' -> 'timer', 'reg-bus' -> 'bus')
- Fix node naming and hex format (remove leading zeros)
- Inline overlay nodes directly into .dtsi
- Reorder properties: ranges after reg
- Remove unnecessary status and custom bootargs

V1: https://lore.kernel.org/lkml/20251105104452.6336-1-eleanor.lin@realtek.com/

Yu-Chun Lin (3):
  dt-bindings: arm: realtek: Add Kent Soc family compatibles
  dt-bindings: mfd: Add Realtek MISC system controller
  arm64: dts: realtek: Add Kent SoC and EVB device trees

 .../devicetree/bindings/arm/realtek.yaml      |  42 +++--
 .../devicetree/bindings/mfd/realtek,misc.yaml |  72 ++++++++
 arch/arm64/boot/dts/realtek/Makefile          |   7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi         | 174 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  13 ++
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 119 ++++++++++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  13 ++
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  73 ++++++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  13 ++
 .../dts/realtek/rtd1920s-smallville-4gb.dts   |  23 +++
 .../boot/dts/realtek/rtd1920s-smallville.dtsi | 129 +++++++++++++
 13 files changed, 712 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,misc.yaml
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi

-- 
2.34.1


